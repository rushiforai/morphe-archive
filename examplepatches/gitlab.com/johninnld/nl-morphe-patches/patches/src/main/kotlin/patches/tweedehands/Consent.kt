package patches.tweedehands

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.util.proxy.mutableTypes.MutableField
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import patches.marktplaats.exact
import patches.marktplaats.target

context(context: app.morphe.patcher.patch.BytecodePatchContext)
internal fun suppressConsentForms() {
    val ready = "onUIReady(Landroid/view/View;)V"
    val method = exact("Lcg3;", ready, 0, 0, 0)
    val owner = target("Lcg3;", ready).classDef
    val client = "Lhl3;"
    val controller = "Lil3;"
    val library = "Lcom/sourcepoint/cmplibrary/SpConsentLib;"
    val campaign = "Lcom/sourcepoint/cmplibrary/data/network/util/CampaignType;"
    val field = "morpheRejectedConsent"
    check(owner.fields.none { it.name == field }) { "2dehands consent guard already exists" }
    owner.fields.add(MutableField(ImmutableField(client, field, "Z", AccessFlags.PRIVATE.value,
        null, emptySet(), emptySet())))
    // Keep native non-null validation. Closing a hidden UI only signals UI
    // completion; native consent-ready/error callbacks retain their meaning.
    method.addInstructionsWithLabels(1, """
        iget-object v1, p0, $client->d:$controller
        iget-object v2, v1, $controller->h:$library
        if-eqz v2, :missing
        iget-boolean v0, p0, $client->$field:Z
        if-nez v0, :close
        const/4 v0, 0x1
        iput-boolean v0, p0, $client->$field:Z
        sget-object v3, $campaign->GDPR:$campaign
        invoke-interface {v2, v3}, $library->rejectAll($campaign)V
        :close
        invoke-virtual {p0, p1}, $client->onUIFinished(Landroid/view/View;)V
        return-void
        :missing
        const/4 v0, 0x0
        iput-boolean v0, p0, $client->a:Z
        iget-object v1, v1, $controller->i:Loff;
        sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
        invoke-virtual {v1, v0}, Loff;->k(Ljava/lang/Object;)V
        return-void
    """.trimIndent())
    exact(client, "onError(Ljava/lang/Throwable;)V", 0, 0, 0)
        .addInstructions(1, "const/4 v0, 0x0\niput-boolean v0, p0, $client->$field:Z")
    val editor = exact("Lcom/horizon/android/feature/consent/ui/ConsentEditorActivity;",
        "onCreate(Landroid/os/Bundle;)V", 0, 0, 0)
    check(editor.getInstruction(0).opcode == Opcode.INVOKE_SUPER)
    editor.addInstructions(1, """
        invoke-virtual {p0}, Landroid/app/Activity;->finish()V
        return-void
    """.trimIndent())
}
