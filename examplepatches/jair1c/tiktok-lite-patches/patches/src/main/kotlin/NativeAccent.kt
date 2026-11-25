package app.tiktoklitepatches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction

private const val MOD_ACCENT = "Lapp/tiktoklitepatches/extension/ModSettings;"

internal val nativeAccent = bytecodePatch {
    dependsOn(tikTokLiteExtension)

    execute {
        if (packageMetadata.versionName != "47.8.2") return@execute
        val context = "Landroid/content/Context;"
        val boxed = "Ljava/lang/Integer;"
        for ((name, parameters, type) in listOf(
            Triple("LB", listOf(context, "I"), boxed),
            Triple("LC", listOf("I", context, "[I"), boxed),
            Triple("LCC", listOf(context, "I"), boxed),
            Triple("LCCII", listOf(context, "I"), "I"),
        )) {
            val method = Fingerprint(
                definingClass = "LX/PH7;", name = name, parameters = parameters, returnType = type,
            ).method
            val isBoxed = type == boxed
            val returnOpcode = if (isBoxed) Opcode.RETURN_OBJECT else Opcode.RETURN
            val moveResult = if (isBoxed) "move-result-object" else "move-result"
            val returnInstruction = if (isBoxed) "return-object" else "return"
            val returns = method.implementation!!.instructions.withIndex().filter { it.value.opcode == returnOpcode }
            check(returns.isNotEmpty()) { "Missing color return in PH7.$name" }
            for ((index, instruction) in returns.asReversed()) {
                val register = (instruction as OneRegisterInstruction).registerA
                method.replaceInstruction(
                    index,
                    "invoke-static/range {v$register .. v$register}, $MOD_ACCENT->nativeAccent($type)$type",
                )
                method.addInstructions(index + 1, "$moveResult v$register\n$returnInstruction v$register")
            }
            val contextRegister = parameters.indexOf(context)
            method.addInstructions(0,
                "invoke-static/range {p$contextRegister .. p$contextRegister}, $MOD_ACCENT->initializePreferences($context)V",
            )
        }

        val follow = Fingerprint(
            definingClass = "LX/N9x;", name = "L",
            parameters = listOf(context, "Landroid/view/ViewGroup;", "Z"),
            returnType = "Landroid/view/View;",
        ).method
        val followInstructions = follow.implementation!!.instructions.toList()
        val followResource = followInstructions.indices.single {
            (followInstructions[it] as? WideLiteralInstruction)?.wideLiteral == 0x790402c3L
        }
        val followBackground = followInstructions[followResource + 1] as FiveRegisterInstruction
        check((followBackground as ReferenceInstruction).reference.toString() ==
            "Landroid/view/View;->setBackgroundResource(I)V")
        val followRegister = followBackground.registerC
        follow.addInstructions(followResource + 2,
            "invoke-static/range {v$followRegister .. v$followRegister}, $MOD_ACCENT->tintFollowBackground(Landroid/view/View;)V",
        )

        val messagePopup = Fingerprint(
            definingClass = "LX/Eq0;", name = "<init>",
            parameters = listOf("LX/2cN;"), returnType = "V",
        ).method
        val contents = messagePopup.implementation!!.instructions.withIndex().single {
            it.value.opcode == Opcode.INVOKE_VIRTUAL &&
                (it.value as ReferenceInstruction).reference.toString() ==
                "Landroid/widget/PopupWindow;->setContentView(Landroid/view/View;)V"
        }
        val root = (contents.value as FiveRegisterInstruction).registerD
        messagePopup.addInstructions(contents.index + 1,
            "invoke-static/range {v$root .. v$root}, $MOD_ACCENT->tintMessagePopup(Landroid/view/View;)V",
        )

        val badge = Fingerprint(
            definingClass = "LX/Oum;", name = "draw",
            parameters = listOf("Landroid/graphics/Canvas;"), returnType = "V",
        ).method
        val backgrounds = badge.implementation!!.instructions.withIndex().filter {
            it.value.opcode == Opcode.IGET &&
                (it.value as ReferenceInstruction).reference.toString() == "LX/Oum;->LB:I"
        }
        check(backgrounds.size == 4) { "Expected four Tux badge background paths" }
        for ((index, instruction) in backgrounds.asReversed()) {
            val register = (instruction as TwoRegisterInstruction).registerA
            badge.addInstructions(index + 1, """
                invoke-static/range {v$register .. v$register}, $MOD_ACCENT->badgeAccent(I)I
                move-result v$register
            """.trimIndent())
        }

        val unreadCount = Fingerprint(
            definingClass = "LX/GQD;", name = "setUnReadNum",
            parameters = listOf("I"), returnType = "V", strings = listOf("99+"),
        ).method
        val unreadView = unreadCount.implementation!!.instructions.elementAt(1)
        check(unreadView.opcode == Opcode.MOVE_RESULT_OBJECT) { "Missing inbox unread view" }
        val unreadRegister = (unreadView as OneRegisterInstruction).registerA
        unreadCount.addInstructions(2,
            "invoke-static/range {v$unreadRegister .. v$unreadRegister}, $MOD_ACCENT->tintUnreadCount(Landroid/widget/TextView;)V",
        )

        val notificationRow = Fingerprint(
            definingClass = "LX/IWi;", name = "LILLLJL",
            parameters = listOf("LX/IEU;", "I", "Z"), returnType = "V", strings = listOf("99+"),
        ).method
        val notificationText = notificationRow.implementation!!.instructions.withIndex().single {
            it.value.opcode == Opcode.INVOKE_VIRTUAL &&
                (it.value as ReferenceInstruction).reference.toString() ==
                "Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V"
        }
        val notificationRegister = (notificationText.value as FiveRegisterInstruction).registerC
        notificationRow.addInstructions(notificationText.index + 1,
            "invoke-static/range {v$notificationRegister .. v$notificationRegister}, $MOD_ACCENT->tintUnreadCount(Landroid/widget/TextView;)V",
        )

        val paintedCount = Fingerprint(
            definingClass = "LX/Ql9;", name = "onDraw",
            parameters = listOf("Landroid/graphics/Canvas;"), returnType = "V",
        ).method
        val circles = paintedCount.implementation!!.instructions.withIndex().filter {
            it.value.opcode == Opcode.INVOKE_VIRTUAL &&
                (it.value as ReferenceInstruction).reference.toString() ==
                "Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V"
        }
        check(circles.size == 2) { "Expected two painted unread badge paths" }
        for ((index, instruction) in circles) {
            val call = instruction as FiveRegisterInstruction
            paintedCount.replaceInstruction(
                index,
                "invoke-static {v${call.registerC}, v${call.registerD}, v${call.registerE}, v${call.registerF}, v${call.registerG}}, " +
                    "$MOD_ACCENT->drawBadgeCircle(Landroid/graphics/Canvas;FFFLandroid/graphics/Paint;)V",
            )
        }

        Fingerprint(
            definingClass = "Lcom/lynx/tasm/behavior/ui/LynxBaseUI;",
            name = "setBackgroundColor", parameters = listOf("I"), returnType = "V",
            strings = listOf("BackgroundColor"),
        ).method.addInstructions(0, """
            invoke-static/range {p1 .. p1}, $MOD_ACCENT->nativeAccent(I)I
            move-result p1
        """.trimIndent())
    }
}
