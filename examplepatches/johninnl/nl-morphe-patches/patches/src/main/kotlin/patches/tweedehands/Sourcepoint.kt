package patches.tweedehands

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.util.proxy.mutableTypes.MutableField
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import patches.marktplaats.exact

context(context: app.morphe.patcher.patch.BytecodePatchContext)
internal fun suppressConsentMeasurement() {
    // This optional coroutine reports page views; it does not return a consent
    // decision. Retain the separate native choice/reject-all request paths.
    exact("Lcom/sourcepoint/mobile_core/Coordinator;",
        "pvData(Lkotlinx/serialization/json/JsonObject;Ljava/util/List;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;",
        0, 0, 0).addInstructions(0, "sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;\nreturn-object v0")
}

context(context: app.morphe.patcher.patch.BytecodePatchContext)
internal fun suppressConsentRendering() {
    val owner = "Lcom/sourcepoint/cmplibrary/SpConsentLibMobileCore;"
    val campaign = "Lcom/sourcepoint/cmplibrary/data/network/util/CampaignType;"
    val field = "morpheRejectedWithoutUi"
    val cls = context.mutableClassDefBy(owner)
    check(cls.fields.none { it.name == field }) { "2dehands hidden consent guard already exists" }
    cls.fields.add(MutableField(ImmutableField(owner, field, "Z", AccessFlags.PRIVATE.value,
        null, emptySet(), emptySet())))
    // loadMessages has obtained real coordinator state before reaching this
    // boundary. Reject through the original SDK before creating any WebView.
    // Only its genuine reportAction result drives consent-ready/finished/error.
    exact(owner, "renderNextMessageIfAny()V", 0, 0, 0).addInstructionsWithLabels(0, """
        iget-boolean v0, p0, $owner->$field:Z
        if-nez v0, :done
        const/4 v0, 0x1
        iput-boolean v0, p0, $owner->$field:Z
        iget-object v0, p0, $owner->messagesToDisplay:Lkotlin/collections/ArrayDeque;
        invoke-virtual {v0}, Lkotlin/collections/ArrayDeque;->clear()V
        sget-object v0, $campaign->GDPR:$campaign
        invoke-virtual {p0, v0}, $owner->rejectAll($campaign)V
        :done
        return-void
    """.trimIndent())
    // rejectAll reports asynchronous failures through this genuine native
    // callback. Allow a subsequent load to retry while keeping forms hidden.
    exact(owner, "onError(Lcom/sourcepoint/cmplibrary/exception/ConsentLibExceptionK;)V", 0, 0, 0)
        .addInstructions(1, "const/4 v0, 0x0\niput-boolean v0, p0, $owner->$field:Z")
}
