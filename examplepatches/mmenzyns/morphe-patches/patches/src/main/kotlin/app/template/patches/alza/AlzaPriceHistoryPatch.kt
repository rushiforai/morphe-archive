package app.template.patches.alza

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.template.patches.shared.Constants.COMPATIBILITY_ALZA
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val EXTENSION_CLASS = "Lapp/template/extension/alza/AlzaPriceChartInjector;"

private fun isComposerEndGroup(
    instruction: Instruction,
    composerClass: CharSequence? = null
): Boolean {
    val ref = (instruction as? ReferenceInstruction)?.reference?.toString() ?: ""
    if (ref.contains(";->q(Z)V") || ref.contains("endReplaceableGroup") || ref.contains("endNode")) {
        return true
    }
    val methodRef = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: return false
    val opcodeName = instruction.opcode.name
    if (!opcodeName.startsWith("invoke-")) return false
    if (methodRef.parameterTypes.size != 1 || methodRef.parameterTypes[0].toString() != "Z") return false
    if (methodRef.returnType != "V") return false
    val compStr = composerClass?.toString()
    if (compStr != null && compStr != "Ljava/lang/Object;") {
        return methodRef.definingClass == compStr
    }
    return true
}

private fun safeInitComposeBindings(
    method: MutableMethod,
    androidViewClass: String,
    androidViewMethod: String,
    function1Class: String
) {
    val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
    val paramCount = method.parameters.size + (if (isStatic) 0 else 1)
    val locals = (method.implementation?.registerCount ?: 0) - paramCount
    if (locals >= 3) {
        method.addInstructions(
            0,
            """
                const-string v0, "$androidViewClass"
                const-string v1, "$androidViewMethod"
                const-string v2, "$function1Class"
                invoke-static {v0, v1, v2}, $EXTENSION_CLASS->initComposeBindings(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
            """
        )
    } else if (locals >= 1) {
        method.addInstructions(
            0,
            """
                const-string v0, "$androidViewClass"
                invoke-static {v0}, $EXTENSION_CLASS->initComposeClass(Ljava/lang/String;)V
            """
        )
    }
}

@Suppress("unused")
val alzaPriceHistoryPatch = bytecodePatch(
    name = "Alza Hlídač shopů Price History (CZ / SK)",
    description = "Displays inline price history chart from Hlídač shopů in product detail screen for Czech Republic and Slovakia (alza.cz / alza.sk). Includes compact mode replacing HomeCredit installments and settings in Menu.",
    default = true
) {
    compatibleWith(COMPATIBILITY_ALZA)

    extendWith("extensions/extension.mpe")

    execute {
        // 1. Hook ProductDetailParams constructors to capture productId and productInfo cleanly
        val withIdConstructor = ProductDetailParamsWithIdFingerprint.method
        withIdConstructor.addInstructions(
            0,
            """
                invoke-static {p1, p4}, $EXTENSION_CLASS->onProductDetailParams(ILjava/lang/Object;)V
            """
        )

        val withMetaConstructor = ProductDetailParamsWithMetaFingerprint.method
        withMetaConstructor.addInstructions(
            0,
            """
                invoke-static {p1, p4}, $EXTENSION_CLASS->onProductDetailParamsWithMeta(Ljava/lang/Object;Ljava/lang/Object;)V
            """
        )

        // 2. Resolve dynamic Compose AndroidView binding via fingerprints (no hardcoded obfuscated names)
        val androidViewClass = AndroidViewFingerprint.method.definingClass.removePrefix("L").removeSuffix(";").replace("/", ".")
        val androidViewMethod = AndroidViewFingerprint.method.name
        val function1Class = AndroidViewFingerprint.method.parameterTypes[0].toString().removePrefix("L").removeSuffix(";").replace("/", ".")

        // 3. Hook GodFragment.onCreateView: track lifecycle and initialize bindings
        val createViewMethod = GodFragmentCreateViewFingerprint.method
        safeInitComposeBindings(createViewMethod, androidViewClass, androidViewMethod, function1Class)
        createViewMethod.addInstructions(
            0,
            """
                invoke-static {p0}, $EXTENSION_CLASS->onFragmentCreateViewStart(Ljava/lang/Object;)V
            """
        )

        // 4. Hook ProductPrices.getAlternativePrice to allow Compact Mode to eliminate HomeCredit / installments cleanly
        val altPriceMethod = ProductPricesGetAlternativePriceFingerprint.method
        val altInstructions = altPriceMethod.implementation!!.instructions
        val returnIdx = altInstructions.indexOfLast { it.opcode == Opcode.RETURN_OBJECT }
        if (returnIdx != -1) {
            val returnInstruction = altInstructions[returnIdx] as OneRegisterInstruction
            val returnReg = returnInstruction.registerA
            altPriceMethod.addInstructions(
                returnIdx,
                """
                    invoke-static {p0, v$returnReg}, $EXTENSION_CLASS->filterAlternativePrice(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                    move-result-object v$returnReg
                    check-cast v$returnReg, ${altPriceMethod.returnType}
                """
            )
        }

        // 5. Hook PriceSectionContentFingerprint (f5m.invoke) - the FlowRow price section composable
        // This injects the chart as the child of FlowRow after both branches of AlternativePrice
        val contentMethod = PriceSectionContentFingerprint.method
        safeInitComposeBindings(contentMethod, androidViewClass, androidViewMethod, function1Class)

        val instructions = contentMethod.implementation!!.instructions
        val composerClass = contentMethod.parameterTypes.getOrNull(1)

        val altIndex = instructions.indexOfFirst { instruction ->
            (instruction as? ReferenceInstruction)?.reference?.toString()?.contains("getAlternativePrice") == true
        }

        val wIndex = if (altIndex != -1) {
            val idx = instructions.drop(altIndex).indexOfFirst { instruction ->
                val ref = (instruction as? ReferenceInstruction)?.reference?.toString() ?: ""
                ref.contains(";->W()V") || ref.contains("endRestartGroup") ||
                    instruction.opcode.name.startsWith("return") ||
                    ref.contains("Lkotlin/Unit;->")
            }
            if (idx != -1) altIndex + idx else instructions.size
        } else {
            instructions.size
        }

        // Find all endReplaceableGroup calls between getAlternativePrice and end of method
        // These correspond to the ends of both the 'with alternative price' and 'without alternative price' branches.
        val qIndices = instructions.take(wIndex).mapIndexedNotNull { idx, instruction ->
            if (idx > altIndex && isComposerEndGroup(instruction, composerClass)) {
                idx
            } else null
        }

        // Inject right after each branch's endReplaceableGroup (before the branch's goto).
        // Sort descending so earlier insertions don't shift later indices.
        // p2 is the Composer parameter in invoke(RowScope, Composer, Integer)
        for (qIndex in qIndices.sortedDescending()) {
            contentMethod.addInstructions(
                qIndex + 1,
                """
                    invoke-static/range {p2 .. p2}, $EXTENSION_CLASS->onPriceSectionCompose(Ljava/lang/Object;)V
                """
            )
        }

        // 6. Hook ThemeSettingsContentFingerprint (jsq.b) - inject MorpheSettingsCardView into Theme Settings screen
        try {
            val themeMethod = ThemeSettingsContentFingerprint.method
            safeInitComposeBindings(themeMethod, androidViewClass, androidViewMethod, function1Class)
            val themeComposerClass = themeMethod.parameterTypes.getOrNull(2)
            val themeInstructions = themeMethod.implementation!!.instructions
            val lastQIndex = themeInstructions.indexOfLast { instruction ->
                isComposerEndGroup(instruction, themeComposerClass)
            }
            if (lastQIndex != -1) {
                // p2 is Composer in jsq.b(ThemeMode, Function1, Composer, Int)
                themeMethod.addInstructions(
                    lastQIndex,
                    """
                        invoke-static/range {p2 .. p2}, $EXTENSION_CLASS->onSettingsCompose(Ljava/lang/Object;)V
                    """
                )
            }
        } catch (ignored: Throwable) {
            // Optional fallback
        }

        // 7. Hook SettingsAndSecurityContentFingerprint (noo.e) - inject MorpheSettingsCardView into Settings & Security screen
        try {
            val secMethod = SettingsAndSecurityContentFingerprint.method
            safeInitComposeBindings(secMethod, androidViewClass, androidViewMethod, function1Class)
            val secComposerClass = secMethod.parameterTypes.getOrNull(13)
            val secInstructions = secMethod.implementation!!.instructions
            val lastSecQIndex = secInstructions.indexOfLast { instruction ->
                isComposerEndGroup(instruction, secComposerClass)
            }
            if (lastSecQIndex != -1) {
                // p13 is Composer in noo.e(..., Composer, Int)
                secMethod.addInstructions(
                    lastSecQIndex,
                    """
                        invoke-static/range {p13 .. p13}, $EXTENSION_CLASS->onSettingsCompose(Ljava/lang/Object;)V
                    """
                )
            }
        } catch (ignored: Throwable) {
            // Optional fallback
        }

        // 8. Hook AppMenuInfoFingerprint (q1v.a) - inject MorpheSettingsCardView into Menu above app version
        try {
            val appMenuMethod = AppMenuInfoFingerprint.method
            safeInitComposeBindings(appMenuMethod, androidViewClass, androidViewMethod, function1Class)
            val menuInstructions = appMenuMethod.implementation!!.instructions
            val appVersionIndex = menuInstructions.indexOfFirst { instruction ->
                (instruction as? ReferenceInstruction)?.reference?.toString()?.contains("getAppVersion") == true
            }
            if (appVersionIndex != -1) {
                // p1 is Composer in q1v.a(sh8, Composer, Int)
                appMenuMethod.addInstructions(
                    appVersionIndex,
                    """
                        invoke-static/range {p1 .. p1}, $EXTENSION_CLASS->onSettingsCompose(Ljava/lang/Object;)V
                    """
                )
            }
        } catch (ignored: Throwable) {
            // Optional fallback
        }
    }
}
