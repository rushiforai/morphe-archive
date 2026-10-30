package patches.marktplaats

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableField
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.immutable.ImmutableField

private const val client = "Lcg3;"
private const val controller = "Ldg3;"
private const val consentLib = "Lcom/sourcepoint/cmplibrary/SpConsentLib;"
private const val campaign = "Lcom/sourcepoint/cmplibrary/data/network/util/CampaignType;"
private const val ready = "onUIReady(Landroid/view/View;)V"

@Suppress("unused")
val skipConsentScreens = bytecodePatch(
    name = "Skip consent screens",
    description = "Prevents the startup cookie popup from being displayed and requests the SDK's reject-all choice. Manual privacy settings remain available.",
) {
    dependsOn(originalInput, disableTracking)
    compatibleWith(marktplaats)
    execute {
        val method = exact(client, ready, 17, 7, 34)
        val owner = target(client, ready).classDef
        val field = "morpheRejectedStartupConsent"
        check(owner.fields.none { it.name == field }) { "Marktplaats consent guard already exists" }
        owner.fields.add(MutableField(ImmutableField(client, field, "Z", AccessFlags.PRIVATE.value,
            null, emptySet(), emptySet())))
        // Keep the original non-null View check. b=true identifies a privacy
        // manager opened manually. Startup never reaches showView/focus/metrics.
        // onUIFinished signals that the hidden UI is gone, not that the asynchronous
        // rejection request succeeded; real consent-ready/error handling remains.
        method.addInstructionsWithLabels(1, """
            iget-boolean v0, p0, $client->b:Z
            if-nez v0, :native
            iget-boolean v0, p0, $client->$field:Z
            if-nez v0, :done
            iget-object v1, p0, $client->d:$controller
            iget-object v2, v1, $controller->h:$consentLib
            if-eqz v2, :native
            const/4 v0, 0x1
            iput-boolean v0, p0, $client->$field:Z
            sget-object v3, $campaign->GDPR:$campaign
            invoke-interface {v2, v3}, $consentLib->rejectAll($campaign)V
            invoke-virtual {p0, p1}, $client->onUIFinished(Landroid/view/View;)V
            :done
            return-void
        """.trimIndent(), ExternalLabel("native", method.getInstruction(1)))
    }
}
