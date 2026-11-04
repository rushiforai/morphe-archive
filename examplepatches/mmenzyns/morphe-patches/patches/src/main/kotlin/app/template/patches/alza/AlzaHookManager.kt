package app.template.patches.alza

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

object AlzaHookManager {
    const val EXTENSION_CLASS = "Lapp/template/extension/alza/AlzaPriceChartInjector;"

    private var hasInjectedGodFragment = false
    private var hasInjectedProductParams = false
    private var hasInjectedPriceSection = false
    private var hasInjectedSettings = false

    fun BytecodePatchContext.getAndroidViewClass(): String {
        return AndroidViewFingerprint.method.definingClass.removePrefix("L").removeSuffix(";").replace("/", ".")
    }

    fun BytecodePatchContext.getAndroidViewMethod(): String {
        return AndroidViewFingerprint.method.name
    }

    fun BytecodePatchContext.getFunction1Class(): String {
        return AndroidViewFingerprint.method.parameterTypes[0].toString().removePrefix("L").removeSuffix(";").replace("/", ".")
    }

    fun BytecodePatchContext.getComposerType(): String {
        return AndroidViewFingerprint.method.parameterTypes[3].toString()
    }

    fun isComposerEndGroup(
        instruction: Instruction,
        composerClass: CharSequence? = null
    ): Boolean {
        val ref = (instruction as? ReferenceInstruction)?.reference?.toString() ?: ""
        if (ref.contains(";->q(Z)V") || ref.contains("endReplaceableGroup") || ref.contains("endNode")) {
            return true
        }
        val methodRef = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: return false
        val opcodeName = instruction.opcode.name
        if (!opcodeName.startsWith("invoke-interface")) return false
        if (methodRef.parameterTypes.size != 1 || methodRef.parameterTypes[0].toString() != "Z") return false
        if (methodRef.returnType != "V") return false
        val compStr = composerClass?.toString()
        if (compStr != null && compStr != "Ljava/lang/Object;") {
            return methodRef.definingClass == compStr
        }
        return true
    }

    fun BytecodePatchContext.safeInitComposeBindings(
        method: MutableMethod,
        avClass: String = getAndroidViewClass(),
        avMethod: String = getAndroidViewMethod(),
        fn1Class: String = getFunction1Class()
    ) {
        val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
        val paramCount = method.parameters.size + (if (isStatic) 0 else 1)
        val locals = (method.implementation?.registerCount ?: 0) - paramCount
        if (locals >= 3) {
            method.addInstructions(
                0,
                """
                    const-string v0, "$avClass"
                    const-string v1, "$avMethod"
                    const-string v2, "$fn1Class"
                    invoke-static {v0, v1, v2}, $EXTENSION_CLASS->initComposeBindings(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
                """
            )
        } else if (locals >= 1) {
            method.addInstructions(
                0,
                """
                    const-string v0, "$avClass"
                    invoke-static {v0}, $EXTENSION_CLASS->initComposeClass(Ljava/lang/String;)V
                """
            )
        }
    }

    fun BytecodePatchContext.injectApplicationInit(initSnippet: String) {
        try {
            val appMethod = AlzaApplicationOnCreateFingerprint.method
            appMethod.addInstructions(0, initSnippet)
        } catch (ignored: Throwable) {}
    }

    fun BytecodePatchContext.injectGodFragmentInit(initSnippet: String) {
        val createViewMethod = GodFragmentCreateViewFingerprint.method
        if (!hasInjectedGodFragment) {
            hasInjectedGodFragment = true
            safeInitComposeBindings(createViewMethod)
            createViewMethod.addInstructions(
                0,
                """
                    invoke-static {p0}, $EXTENSION_CLASS->onFragmentCreateViewStart(Ljava/lang/Object;)V
                """
            )
        }
        createViewMethod.addInstructions(0, initSnippet)
    }

    fun BytecodePatchContext.ensureProductParamsHooked() {
        if (hasInjectedProductParams) return
        hasInjectedProductParams = true

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
    }

    fun BytecodePatchContext.ensurePriceSectionHooked() {
        if (hasInjectedPriceSection) return
        hasInjectedPriceSection = true

        val contentMethod = PriceSectionContentFingerprint.method
        safeInitComposeBindings(contentMethod)

        val instructions = contentMethod.implementation!!.instructions
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

        val compType = getComposerType()
        val qIndices = instructions.take(wIndex).mapIndexedNotNull { idx, instruction ->
            if (idx > altIndex && isComposerEndGroup(instruction, compType)) {
                idx
            } else null
        }

        for (qIndex in qIndices.sortedDescending()) {
            contentMethod.addInstructions(
                qIndex + 1,
                """
                    invoke-static/range {p1 .. p2}, $EXTENSION_CLASS->onPriceSectionCompose(Ljava/lang/Object;Ljava/lang/Object;)V
                """
            )
        }
    }

    fun BytecodePatchContext.ensureSettingsHooked() {
        if (hasInjectedSettings) return
        hasInjectedSettings = true

        try {
            val themeMethod = ThemeSettingsContentFingerprint.method
            safeInitComposeBindings(themeMethod)
            val themeComposerClass = themeMethod.parameterTypes.getOrNull(2)
            val themeInstructions = themeMethod.implementation!!.instructions
            val lastQIndex = themeInstructions.indexOfLast { instruction ->
                isComposerEndGroup(instruction, themeComposerClass)
            }
            if (lastQIndex != -1) {
                themeMethod.addInstructions(
                    lastQIndex,
                    """
                        invoke-static/range {p2 .. p2}, $EXTENSION_CLASS->onSettingsCompose(Ljava/lang/Object;)V
                    """
                )
            }
        } catch (ignored: Throwable) {}

        try {
            val secMethod = SettingsAndSecurityContentFingerprint.method
            safeInitComposeBindings(secMethod)
            val secComposerClass = secMethod.parameterTypes.getOrNull(13)
            val secInstructions = secMethod.implementation!!.instructions
            val lastSecQIndex = secInstructions.indexOfLast { instruction ->
                isComposerEndGroup(instruction, secComposerClass)
            }
            if (lastSecQIndex != -1) {
                secMethod.addInstructions(
                    lastSecQIndex,
                    """
                        invoke-static/range {p13 .. p13}, $EXTENSION_CLASS->onSettingsCompose(Ljava/lang/Object;)V
                    """
                )
            }
        } catch (ignored: Throwable) {}

        try {
            val appMenuMethod = AppMenuInfoFingerprint.method
            safeInitComposeBindings(appMenuMethod)
            val menuInstructions = appMenuMethod.implementation!!.instructions
            val appVersionIndex = menuInstructions.indexOfFirst { instruction ->
                (instruction as? ReferenceInstruction)?.reference?.toString()?.contains("getAppVersion") == true
            }
            if (appVersionIndex != -1) {
                appMenuMethod.addInstructions(
                    appVersionIndex,
                    """
                        invoke-static/range {p1 .. p1}, $EXTENSION_CLASS->onSettingsCompose(Ljava/lang/Object;)V
                    """
                )
            }
        } catch (ignored: Throwable) {}
    }
}
