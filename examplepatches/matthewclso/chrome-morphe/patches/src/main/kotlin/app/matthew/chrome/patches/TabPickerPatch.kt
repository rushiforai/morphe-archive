package app.matthew.chrome.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x

private const val PICKER = "Lapp/matthew/chrome/extension/TabPicker;"
private const val MODEL = "Lorg/chromium/chrome/browser/tabmodel/TabModel;"
private const val TAB = "Lorg/chromium/chrome/browser/tab/Tab;"
private const val FAVICON = "Lorg/chromium/chrome/browser/tab/TabFavicon;"
private const val CONTAINER = "Lorg/chromium/chrome/browser/toolbar/top/ToolbarControlContainer;"

val tabPickerPatch = bytecodePatch(
    description = "Adds an optional tab picker above the true bottom address bar.",
    default = false,
) {
    compatibleWith(chromeCompatibility)
    dependsOn(modeTogglePatch, bottomToolbarPatch)
    execute {
        requireTarget(packageMetadata)
        fun method(type: String, name: String, parameters: List<String>, result: String): String =
            classDefBy(type).methods.single {
                it.name == name && it.parameterTypes == parameters && it.returnType == result
            }.toString()
        val current = method("Lce4;", "I2", emptyList(), MODEL)
        val getTab = method("Lsxq;", "getTabAt", listOf("I"), TAB)
        val byId = method(MODEL, "getTabById", listOf("I"), TAB)
        val indexOf = method("Lsxq;", "u0", listOf(TAB), "I")
        val select = method(MODEL, "C1", listOf("I", "I"), "V")
        val remover = method(MODEL, "h2", emptyList(), "Lh9r;")
        val close = method("Lh9r;", "d", listOf("Ljkq;", "Z", "Lv4r;"), "V")
        val closeBuilder = method("Ljkq;", "b", listOf(TAB), "Lhkq;")
        val closeParams = method("Lhkq;", "a", emptyList(), "Ljkq;")
        val icon = method(FAVICON, "getBitmapWithFallback", listOf(TAB, "Z"), "Landroid/graphics/Bitmap;")
        val from = method(FAVICON, "from", listOf(TAB), FAVICON)
        val url = method(TAB, "getUrl", emptyList(), "Lorg/chromium/url/GURL;")
        val bindContents = method("Lmjr;", "u1", listOf(TAB), "V")
        check(classDefBy("Lmjr;").superclass == "Lf49;")
        check(classDefBy("Lmjr;").fields.any { it.name == "S" && it.type == "Lnjr;" })
        // R8 inlined the public Promise-returning getFaviconOrFallback into its JNI
        // wrapper. Expose that exact native prefix, omitting only JNI callback wiring.
        // Its existing URL guard, same-profile DB lookup and destruction stay native.
        val faviconClass = mutableClassDefBy(FAVICON)
        val nativeFallback = faviconClass.methods.single {
            it.name == "getFaviconOrFallback" && it.parameterTypes == listOf("Lorg/chromium/base/JniOnceCallback;")
        }
        val fallbackCode = nativeFallback.implementation!!.instructions.toList()
        val callbackStart = fallbackCode.indexOfFirst {
            it.opcode == Opcode.NEW_INSTANCE && (it as? ReferenceInstruction)?.reference.toString() == "Limq;"
        }
        check(nativeFallback.implementation!!.registerCount == 13 && nativeFallback.implementation!!.tryBlocks.isEmpty())
        check(callbackStart > 0 && fallbackCode.take(callbackStart).sumOf { it.codeUnits } == 0x67)
        check(nativeFallback.hasString("Failed to query DB") && nativeFallback.hasString("Not eligible for favicon"))
        val requestName = "morpheFaviconOrFallback"
        check(faviconClass.methods.none { it.name == requestName })
        faviconClass.methods.add(MutableMethod(ImmutableMethod(FAVICON, requestName, emptyList(),
            "Le8l;", 0x1, emptySet(), emptySet(), ImmutableMethodImplementation(12,
                fallbackCode.take(callbackStart) + ImmutableInstruction11x(Opcode.RETURN_OBJECT, 2),
                emptyList(), emptyList()))))
        check(classDefBy("Lukq;").methods.single { it.name == "I" && it.parameterTypes == listOf("I", "I") }
            .hasString("MobileTabSwitched")) // Native FROM_USER is 3 on this exact target.
        for ((type, name, fieldType) in listOf(
            Triple("Lce4;", "x1", "Lknm;"), Triple("Lknm;", "o0", "Ly5d;"),
            Triple("Ly5d;", "h0", "Lc6d;"), Triple("Ly5d;", "l0", "Z"),
            Triple("Ly5d;", "j0", "Lorg/chromium/chrome/browser/profiles/Profile;"),
            Triple("Lxf6;", "c", "I"),
        )) check(classDefBy(type).fields.any { it.name == name && it.type == fieldType })
        val bridgeClass = mutableClassDefBy(BRIDGE)
        fun bridge(name: String, body: String) {
            val old = bridgeClass.methods.single { it.name == name }
            val replacement = MutableMethod(ImmutableMethod(old.definingClass, old.name, old.parameters,
                old.returnType, old.accessFlags, old.annotations, old.hiddenApiRestrictions,
                ImmutableMethodImplementation(8, emptyList(), emptyList(), emptyList())))
            replacement.addInstructions(0, body.trimIndent())
            bridgeClass.methods.remove(old); bridgeClass.methods.add(replacement)
        }
        bridge("pickerModel", """
            check-cast p0, $ACTIVITY
            invoke-virtual {p0}, $current
            move-result-object v0
            return-object v0
        """)
        for ((name, nativeName) in listOf("pickerCount" to "getCount", "pickerIndex" to "index")) {
            bridge(name, """
                check-cast p0, $MODEL
                invoke-interface {p0}, Lsxq;->$nativeName()I
                move-result v0
                return v0
            """)
        }
        bridge("pickerTab", """
            check-cast p0, $MODEL
            invoke-interface {p0, p1}, $getTab
            move-result-object v0
            return-object v0
        """)
        bridge("pickerId", """
            check-cast p0, $TAB
            invoke-interface {p0}, $TAB->getId()I
            move-result v0
            return v0
        """)
        bridge("pickerTitle", """
            check-cast p0, $TAB
            invoke-interface {p0}, $TAB->getTitle()Ljava/lang/String;
            move-result-object v0
            return-object v0
        """)
        bridge("pickerIcon", """
            check-cast p0, $TAB
            const/4 v0, 0x0
            invoke-static {p0, v0}, $icon
            move-result-object v0
            if-nez v0, :done
            const/4 v0, 0x1
            invoke-static {p0, v0}, $icon
            move-result-object v0
            :done
            return-object v0
        """)
        bridge("pickerUrl", """
            check-cast p0, $TAB
            invoke-interface {p0}, $url
            move-result-object v0
            return-object v0
        """)
        bridge("pickerRequestIcon", """
            check-cast p0, $TAB
            invoke-static {p0}, $from
            move-result-object v0
            if-eqz v0, :done
            # The base constructor observes future contents changes only. Synchronize
            # existing contents through that same native handler, without registering
            # another observer. Its identity guard and native cleanup remain intact.
            new-instance v1, Lmjr;
            invoke-direct {v1}, Ljava/lang/Object;-><init>()V
            iput-object v0, v1, Lmjr;->S:Lnjr;
            invoke-virtual {v1, p0}, $bindContents
            invoke-virtual {v0}, $FAVICON->$requestName()Le8l;
            :done
            return-void
        """)
        val phoneType = "Lorg/chromium/chrome/browser/toolbar/top/ToolbarPhone;"
        check(classDefBy(phoneType).fields.any { it.name == "t1" && it.type == "Lick;" })
        check(classDefBy(phoneType).methods.single { it.name == "C" && it.parameterTypes.isEmpty() }
            .hasString("Android.TopToolbar.CaptureBlocked.StatusIconAnimationDuration"))
        bridge("pickerInvalidateCapture", """
            check-cast p0, $phoneType
            const/4 v0, 0x0
            iput-object v0, p0, $phoneType->t1:Lick;
            invoke-virtual {p0}, Landroid/view/View;->invalidate()V
            return-void
        """)
        bridge("pickerSelect", """
            check-cast p0, $MODEL
            invoke-interface {p0, p1}, $byId
            move-result-object v0
            if-eqz v0, :done
            invoke-interface {p0, v0}, $indexOf
            move-result v0
            if-ltz v0, :done
            const/4 v1, 0x3
            invoke-interface {p0, v0, v1}, $select
            :done
            return-void
        """)
        bridge("pickerClose", """
            check-cast p0, $MODEL
            invoke-interface {p0, p1}, $byId
            move-result-object v0
            if-eqz v0, :done
            invoke-static {v0}, $closeBuilder
            move-result-object v0
            invoke-virtual {v0}, $closeParams
            move-result-object v0
            invoke-interface {p0}, $remover
            move-result-object v1
            const/4 v2, 0x1
            const/4 v3, 0x0
            invoke-interface {v1, v0, v2, v3}, $close
            :done
            return-void
        """)
        bridge("pickerAtBottom", """
            invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup${'$'}LayoutParams;
            move-result-object v0
            instance-of v1, v0, Lxf6;
            if-eqz v1, :no
            check-cast v0, Lxf6;
            iget v0, v0, Lxf6;->c:I
            and-int/lit8 v0, v0, 0x70
            const/16 v1, 0x50
            if-ne v0, v1, :no
            const/4 v0, 0x1
            return v0
            :no
            const/4 v0, 0x0
            return v0
        """)
        bridge("pickerLocked", """
            invoke-static {p0}, $BRIDGE->isIncognito(Landroid/app/Activity;)Z
            move-result v0
            if-eqz v0, :unlocked
            check-cast p0, $ACTIVITY
            iget-object v0, p0, Lce4;->x1:Lknm;
            if-eqz v0, :locked
            iget-object v0, v0, Lknm;->o0:Ly5d;
            if-eqz v0, :locked
            iget-object v1, v0, Ly5d;->h0:Lc6d;
            if-nez v1, :locked
            iget-boolean v1, v0, Ly5d;->l0:Z
            if-eqz v1, :unlocked
            iget-object v0, v0, Ly5d;->j0:Lorg/chromium/chrome/browser/profiles/Profile;
            if-eqz v0, :locked
            invoke-static {v0}, Lk6d;->a(Lorg/chromium/chrome/browser/profiles/Profile;)Z
            move-result v0
            return v0
            :locked
            const/4 v0, 0x1
            return v0
            :unlocked
            const/4 v0, 0x0
            return v0
        """)

        val inflate = mutableClassDefBy("Lorg/chromium/chrome/browser/toolbar/top/ToolbarPhone;")
            .methods.single { it.name == "onFinishInflate" }
        inflate.addInstructions(0, "invoke-static/range {p0 .. p0}, $PICKER->install(Landroid/view/View;)V")
        val measure = mutableClassDefBy(CONTAINER).methods.single { it.name == "onMeasure" }
        val superMeasure = measure.implementation!!.instructions.withIndex().single { (_, ins) ->
            ins.opcode == Opcode.INVOKE_SUPER &&
                ((ins as? ReferenceInstruction)?.reference as? MethodReference)?.name == "onMeasure"
        }
        // Native onSizeChanged publishes the combined measured height to BottomControlsStacker.
        // Replace the call so native branch targets cannot jump past this hook.
        check(measure.implementation!!.registerCount == 8)
        measure.replaceInstruction(superMeasure.index,
            "invoke-static/range {p0 .. p0}, $PICKER->beforeMeasure(Landroid/view/View;)V")
        measure.addInstructions(superMeasure.index + 1,
            "invoke-super {p0, p1, p2}, Lorg/chromium/ui/widget/OptimizedFrameLayout;->onMeasure(II)V")

        // Chrome makes the hairline visible again during compositor captures (including
        // long-press menus). Paint the picker background in its slot without fighting
        // those visibility changes or leaving a transparent gap in the compositor.
        val hairline = mutableClassDefBy("Lorg/chromium/chrome/browser/toolbar/ToolbarHairlineView;")
        check(hairline.superclass == "Landroidx/appcompat/widget/AppCompatImageView;")
        check(hairline.methods.none { it.name == "onDraw" })
        val drawHairline = MutableMethod(ImmutableMethod(hairline.type, "onDraw",
            listOf(ImmutableMethodParameter("Landroid/graphics/Canvas;", emptySet(), null)), "V", 0x4,
            emptySet(), emptySet(), ImmutableMethodImplementation(3, emptyList(), emptyList(), emptyList())))
        drawHairline.addInstructions(0, """
            invoke-static {p0, p1}, $PICKER->drawDividerBackground(Landroid/view/View;Landroid/graphics/Canvas;)Z
            move-result v0
            if-nez v0, :done
            invoke-super {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->onDraw(Landroid/graphics/Canvas;)V
            :done
            return-void
        """.trimIndent())
        hairline.methods.add(drawHairline)

        // Invalidate only when metadata or tab order changes. Count/selection changes are
        // also read before drawing; no background timer, URL persistence or icon network request.
        val tabImpl = mutableClassDefBy("Lorg/chromium/chrome/browser/tab/TabImpl;")
        val title = tabImpl.methods.single { it.name == "N" && it.parameterTypes.isEmpty() }
        val titleWrite = title.implementation!!.instructions.withIndex().single { (_, ins) ->
            ins.opcode == Opcode.IPUT_OBJECT &&
                (ins as ReferenceInstruction).reference.toString() == "${tabImpl.type}->g0:Ljava/lang/String;"
        }
        title.addInstructions(titleWrite.index + 1, "invoke-static {}, $PICKER->changed()V")
        val faviconUpdate = faviconClass.methods.single { it.name == "h" && it.parameterTypes.size == 3 }
        val faviconReturn = faviconUpdate.implementation!!.instructions.withIndex().single { it.value.opcode == Opcode.RETURN_VOID }
        faviconUpdate.replaceInstruction(faviconReturn.index, "invoke-static {}, $PICKER->changed()V")
        faviconUpdate.addInstructions(faviconReturn.index + 1, "return-void")
        // Native pages and frozen-tab navigations also broadcast an empty favicon.
        val emptyIconNotifications = tabImpl.methods.filter { method -> method.implementation?.instructions?.any {
            (it as? ReferenceInstruction)?.reference.toString() == "Lf49;->F1($TAB" + "Landroid/graphics/Bitmap;Lorg/chromium/url/GURL;)V"
        } == true }
        check(emptyIconNotifications.size == 2)
        for (method in emptyIconNotifications) method.addInstructions(0, "invoke-static {}, $PICKER->changed()V")
        for (name in listOf("t0", "c2")) mutableClassDefBy("Lukq;").methods.single {
            it.name == name && it.parameterTypes == listOf("I", "I")
        }.addInstructions(0, "invoke-static {}, $PICKER->changed()V")
        println("Tab picker: native model, favicons, selection, guarded close and measured toolbar space")
    }
}
