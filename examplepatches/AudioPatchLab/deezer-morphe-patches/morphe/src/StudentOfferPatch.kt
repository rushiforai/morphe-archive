package deezer.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val WEB_DIALOG = "Lcom/deezer/android/ui/activity/WebViewDialogActivity;"
private const val DISMISS_PLAYBACK_OFFER = "morpheDismissPlaybackOffer"

private fun dismissPlaybackOffer(): MutableMethod {
    val method = MutableMethod(ImmutableMethod(
        WEB_DIALOG, DISMISS_PLAYBACK_OFFER,
        listOf(ImmutableMethodParameter("Ljava/lang/String;", emptySet(), null)),
        "Z", AccessFlags.PRIVATE.value or AccessFlags.STATIC.value, emptySet(), emptySet(),
        ImmutableMethodImplementation(4, emptyList(), emptyList(), emptyList()),
    ))
    method.addInstructionsWithLabels(
        0,
        """
            invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z
            move-result v0
            if-nez v0, :return_result
            const-string v1, "https://www.deezer.com/premiumtab?"
            invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
            move-result v0
            if-eqz v0, :return_result
            invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;
            move-result-object v1
            const-string v2, "origin"
            invoke-virtual {v1, v2}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;
            move-result-object v1
            const-string v2, "try_to_play_mod"
            invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
            move-result v0
            :return_result
            return v0
        """.trimIndent(),
    )
    return method
}

private fun dismissAfterSuperOnCreate(activity: MutableClass) {
    val onCreate = activity.methods.single {
        it.name == "onCreate" && it.parameterTypes == listOf("Landroid/os/Bundle;")
    }
    val superOnCreate = checkNotNull(onCreate.implementation).instructions.withIndex().single {
        it.value.opcode == Opcode.INVOKE_SUPER && (it.value as ReferenceInstruction)
            .reference.toString().endsWith("->onCreate(Landroid/os/Bundle;)V")
    }.index
    onCreate.addInstructions(
        superOnCreate + 1,
        """
            invoke-virtual {p0}, Landroid/app/Activity;->finish()V
            return-void
        """.trimIndent(),
    )
}

internal val studentOfferPatch = patch {
    compatibleWith(deezerCompatibility)

    execute {
        dismissAfterSuperOnCreate(mutableClassDefBy("Lcom/deezer/feature/appcusto/ui/AppCustoActivity;"))
        dismissAfterSuperOnCreate(mutableClassDefBy("Lcom/deezer/android/ui/activity/UserOffersDialogActivity;"))

        val webDialog = mutableClassDefBy(WEB_DIALOG)
        val onCreate = webDialog.methods.single {
            it.name == "onCreate" && it.parameterTypes == listOf("Landroid/os/Bundle;")
        }
        val instructions = checkNotNull(onCreate.implementation).instructions
        val emptyUrl = instructions.indices.single { index ->
            val instruction = instructions[index]
            instruction.opcode == Opcode.INVOKE_STATIC && (instruction as ReferenceInstruction).reference.toString() ==
                "Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z"
        }
        val call = instructions[emptyUrl] as FiveRegisterInstruction
        check(call.registerCount == 1 && instructions[emptyUrl + 1].opcode == Opcode.MOVE_RESULT)
        check(webDialog.methods.add(dismissPlaybackOffer()))
        // Reuse the dialog's exit before it initializes the WebView.
        onCreate.replaceInstruction(
            emptyUrl,
            "invoke-static {v${call.registerC}}, $WEB_DIALOG->$DISMISS_PLAYBACK_OFFER(Ljava/lang/String;)Z",
        )
    }
}
