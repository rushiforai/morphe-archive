package app.afterglow.patches.tweaks.navigation

import app.afterglow.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import app.afterglow.patches.shared.Constants.EXTENSION_PACKAGE
import app.afterglow.patches.shared.afterglowExtensionPatch
import app.afterglow.patches.video.addPublicMethod
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.addInstructionsAtControlFlowLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction

private const val FULLSCREEN = "$EXTENSION_PACKAGE/navigation/ShortsFullscreen;"
private const val CLEAR = "$EXTENSION_PACKAGE/navigation/ShortsFullscreen\$ClearController;"
private const val BOTTOM = "$EXTENSION_PACKAGE/navigation/ShortsFullscreen\$BottomController;"
private const val NAVIGATION = "$EXTENSION_PACKAGE/navigation/ShortsFullscreen\$NavigationController;"
private const val GESTURE = "$EXTENSION_PACKAGE/navigation/ShortsFullscreen\$GestureController;"
private const val ONLY = "$EXTENSION_PACKAGE/navigation/ShortsOnlyMode;"

/** Keep native recognition, clear-mode rendering and bottom-height notifications. */
internal val shortsFullscreenHookPatch = bytecodePatch {
    compatibleWith(COMPATIBILITY_YOUTUBE)
    dependsOn(afterglowExtensionPatch)
    execute {
        val capability = Fingerprint(returnType = "Z", parameters = emptyList(),
            filters = listOf(literal(0x02bad1a9L), methodCall(smali = "Laktm;->m(IJZ)Z")),
            custom = { method, cls -> cls.type == "Latot;" && method.name == "w" })
        capability.method.overrideFlagRead(capability.instructionMatches.first().index,
            "$EXTENSION_PACKAGE/navigation/ShortsFullscreenPolicy;->capability(Z)Z")

        val clearState = Fingerprint(returnType = "V", parameters = listOf("Lblfj;"),
            filters = listOf(methodCall(smali = "Lbvvu;->sU(Ljava/lang/Object;)V")),
            custom = { method, cls -> cls.type == "Latnm;" && method.name == "c" })
        val clearHost = clearState.classDef
        clearHost.interfaces.add(CLEAR)
        clearHost.addPublicMethod("afterglow_isClear", emptyList(), "Z", 2, """
            invoke-virtual { p0 }, ${clearHost.type}->f()Z
            move-result v0
            return v0
        """)
        clearHost.addPublicMethod("afterglow_setClear", listOf("Z"), "V", 3, """
            if-eqz p1, :show_overlay
            sget-object v0, Lblfj;->c:Lblfj;
            goto :apply_clear
            :show_overlay
            sget-object v0, Lblfj;->b:Lblfj;
            :apply_clear
            invoke-virtual { p0, v0 }, ${clearHost.type}->c(Lblfj;)V
            return-void
        """)
        for (method in listOf(clearState.method, clearHost.methods.single { it.name == "b" && it.parameterTypes.isEmpty() })) {
            val event = if (method.name == "b") "reset" else "stateChanged"
            method.implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }
                .map { it.index }.asReversed().forEach { index ->
                    method.addInstructionsAtControlFlowLabel(index,
                        "invoke-static/range { p0 .. p0 }, $FULLSCREEN->$event($CLEAR)V")
                }
        }

        val start = Fingerprint(returnType = "Z", parameters = listOf("Landroid/view/ScaleGestureDetector;"),
            custom = { method, cls -> cls.type == "Latnq;" && method.name == "onScaleBegin" })
        val finish = Fingerprint(returnType = "V", parameters = listOf("Landroid/view/ScaleGestureDetector;"),
            filters = listOf(methodCall(smali = "Latnq;->d(Z)V")),
            custom = { method, cls -> cls.type == "Latnq;" && method.name == "onScaleEnd" })
        val pinch = start.classDef
        pinch.addPublicMethod("afterglow_clearController", emptyList(), CLEAR, 2, """
            iget-object v0, p0, ${pinch.type}->e:Latnm;
            return-object v0
        """)
        for (event in listOf("begin", "end")) pinch.addPublicMethod("afterglow_$event", emptyList(), "V", 3, """
            iget-object v0, p0, ${pinch.type}->e:Latnm;
            invoke-virtual { p0 }, ${pinch.type}->a()Landroid/view/View;
            move-result-object v1
            invoke-static { v0, v1 }, $FULLSCREEN->$event(${CLEAR}Landroid/view/View;)V
            return-void
        """)
        start.method.implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN }
            .asReversed().forEach { (index, instruction) ->
                val result = (instruction as OneRegisterInstruction).registerA
                start.method.addInstructionsAtControlFlowLabel(index, """
                    if-eqz v$result, :afterglow_native_pinch_result
                    invoke-virtual/range { p0 .. p0 }, ${pinch.type}->afterglow_begin()V
                    :afterglow_native_pinch_result
                    nop
                """)
            }
        // p0 is reused later by native logging; capture it while still the recognizer.
        finish.method.addInstructions(finish.instructionMatches.single().index + 1,
            "invoke-virtual/range { p0 .. p0 }, ${pinch.type}->afterglow_end()V")

        val touch = Fingerprint(returnType = "Z", parameters = listOf("Landroid/view/MotionEvent;"),
            filters = listOf(methodCall(smali = "Landroid/view/ScaleGestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z")),
            custom = { method, cls -> cls.type == "Lmna;" && method.name == "c" })
        val touchHost = touch.classDef
        touchHost.interfaces.add(GESTURE)
        touchHost.addPublicMethod("afterglow_clearController", emptyList(), CLEAR, 2, """
            iget-object v0, p0, ${touchHost.type}->g:Latnq;
            invoke-virtual { v0 }, ${pinch.type}->afterglow_clearController()$CLEAR
            move-result-object v0
            return-object v0
        """)
        touchHost.addPublicMethod("afterglow_canAutoHide", emptyList(), "Z", 2, """
            iget-object v0, p0, ${touchHost.type}->h:Lmnb;
            invoke-interface { v0 }, Lmnb;->C()Z
            move-result v0
            return v0
        """)
        touchHost.addPublicMethod("afterglow_playerView", emptyList(), "Landroid/view/View;", 2, """
            iget-object v0, p0, ${touchHost.type}->g:Latnq;
            invoke-virtual { v0 }, ${pinch.type}->a()Landroid/view/View;
            move-result-object v0
            return-object v0
        """)
        touch.method.addInstructions(0,
            "invoke-static/range { p0 .. p1 }, $FULLSCREEN->touch(${GESTURE}Landroid/view/MotionEvent;)V")

        val bottomBind = Fingerprint(returnType = "V", parameters = emptyList(),
            filters = listOf(fieldAccess(opcode = Opcode.IPUT_OBJECT, definingClass = "Lkdz;", name = "c", type = "Landroid/view/View;")),
            custom = { method, cls -> cls.type == "Lrqu;" && method.name == "run" })
        val barHost = mutableClassDefBy("Lkdz;")
        barHost.interfaces.add(BOTTOM)
        barHost.addPublicMethod("afterglow_refreshBottomHeight", emptyList(), "V", 3, """
            iget-object v0, p0, ${barHost.type}->c:Landroid/view/View;
            if-eqz v0, :done
            invoke-virtual { v0 }, Landroid/view/View;->getHeight()I
            move-result v0
            invoke-static { v0 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
            move-result-object v0
            sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
            invoke-virtual { p0, v0, v1 }, ${barHost.type}->b(Ljava/lang/Integer;Ljava/lang/Boolean;)V
            :done
            return-void
        """)
        val bind = bottomBind.instructionMatches.single()
        val field = bind.instruction as TwoRegisterInstruction
        bottomBind.method.addInstructions(bind.index + 1,
            invokeStatic(field.registerB, field.registerA, method = "$FULLSCREEN->bindBottom(${BOTTOM}Landroid/view/View;)V"))
        val height = Fingerprint(returnType = "V", parameters = listOf("Ljava/lang/Integer;", "Ljava/lang/Boolean;"),
            filters = listOf(methodCall(smali = "Ljava/lang/Integer;->intValue()I")),
            custom = { method, cls -> cls.type == "Lkdz;" && method.name == "b" })
        val valueIndex = height.instructionMatches.single().index + 1
        val value = (height.method.implementation!!.instructions[valueIndex] as OneRegisterInstruction).registerA
        height.method.addInstructions(valueIndex + 1, """
            ${invokeStatic(value, method = "$FULLSCREEN->bottomHeight(I)I")}
            move-result v$value
        """)
        barHost.methods.single { it.name == "d" && it.parameterTypes == listOf("I") }.addInstructions(0, """
            invoke-static/range { p1 .. p1 }, $FULLSCREEN->bottomHeight(I)I
            move-result p1
        """)
        // Shorts normally compensates for a hidden pivot bar with a fragment
        // margin. Suppress only that final margin while our fullscreen owns it;
        // keep the native cached dimensions and all engagement-panel decisions.
        for ((name, parameters) in listOf("b" to emptyList(), "e" to listOf("I", "Z"))) {
            val margin = Fingerprint(returnType = "V", parameters = parameters,
                filters = listOf(methodCall(smali = "Lafxg;-><init>(II[B)V")),
                custom = { method, cls -> cls.type == "Lmoc;" && method.name == name })
            val call = margin.instructionMatches.single()
            val amount = (call.instruction as FiveRegisterInstruction).registerD
            margin.method.addInstructionsAtControlFlowLabel(call.index, """
                ${invokeStatic(amount, method = "$FULLSCREEN->bottomHeight(I)I")}
                move-result v$amount
            """)
        }
        val navigationShow = Fingerprint(returnType = "V", parameters = listOf("Z"),
            filters = listOf(methodCall(smali = "Lrun;->F(I)V"), methodCall(smali = "Lrun;->I()V")),
            custom = { method, cls -> cls.type == "Lrun;" && method.name == "N" })
        val navigationHost = navigationShow.classDef
        navigationHost.interfaces.add(NAVIGATION)
        require(navigationHost.methods.any { it.name == "z" && it.parameterTypes == listOf("Ljava/lang/String;", "Z") })
        navigationHost.addPublicMethod("afterglow_selectShorts", emptyList(), "Z", 3, """
            const-string v0, "FEshorts"
            invoke-virtual { p0, v0 }, ${navigationHost.type}->u(Ljava/lang/String;)Z
            move-result v1
            if-eqz v1, :missing_shorts_tab
            const/4 v1, 0x1
            invoke-virtual { p0, v0, v1 }, ${navigationHost.type}->z(Ljava/lang/String;Z)V
            return v1
            :missing_shorts_tab
            const/4 v1, 0x0
            return v1
        """)
        navigationHost.addPublicMethod("afterglow_setBottomHidden", listOf("Z"), "V", 3, """
            if-eqz p1, :show_tabs
            invoke-virtual { p0 }, ${navigationHost.type}->I()V
            return-void
            :show_tabs
            const/4 v0, 0x1
            invoke-virtual { p0, v0 }, ${navigationHost.type}->N(Z)V
            return-void
        """)
        navigationShow.method.addInstructions(0,
            "invoke-static/range { p0 .. p0 }, $FULLSCREEN->bindNavigation($NAVIGATION)V")
        val back = Fingerprint(returnType = "Z", parameters = emptyList(), filters = listOf(
            methodCall(smali = "Lkpt;->hG()Z"), methodCall(smali = "Latec;->bd()Z")
        ), custom = { method, cls -> cls.type == "Lmoz;" && method.name == "hG" })
        back.method.implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN }
            .asReversed().forEach { (index, instruction) ->
                val result = (instruction as OneRegisterInstruction).registerA
                back.method.addInstructionsAtControlFlowLabel(index, """
                    ${invokeStatic(result, method = "$ONLY->consumeBack(Z)Z")}
                    move-result v$result
                """)
            }
        println("Afterglow Shorts fullscreen: native ${pinch.type}, ${clearHost.type}, ${barHost.type}")
    }
}
