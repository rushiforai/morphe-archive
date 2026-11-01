package patches.parool

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/** Optional sinks outside the matched Trouw target list. Keep functional audio
 * queue/heartbeat, actual follow/save requests and privacy/auth acknowledgments. */
context(patchContext: app.morphe.patcher.patch.BytecodePatchContext)
internal fun suppressAdditionalTracking() {
    val audio = "Lnl/dpgmedia/mcdpg/amalia/tracking/internal/AmaliaInternalTracker;"
    change(audio, "track(Lnl/dpgmedia/publishingservices/audiosdk/analytics/AudioUiInteractionGenCodeTrackingEvent;)V", STOP)
    change(audio, "track(Lnl/dpgmedia/mcdpg/amalia/tracking/internal/AmaliaInternalTrackingPayload;)V", STOP)
    for (cls in listOf("${APP}integration/AudioSdkMonitoringImpl;",
        "${APP}integration/VideoSdkMonitoringImpl;",
        "${APP}entertainment/games/GameSdkInterfaceProvider\$createExceptionRecorderInterface\$1;")) {
        change(cls, "recordException(Ljava/lang/Throwable;)V", STOP)
        if (!cls.endsWith("VideoSdkMonitoringImpl;")) {
            change(cls, "setCustomKey(Ljava/lang/String;Ljava/lang/String;)V", STOP)
        }
    }
    change("${APP}util/loggers/TimberCrashlyticsLogger;", "log(ILjava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V", STOP)
    change("Lnl/persgroep/network/AdvertisementIdProvider;", "init()V", STOP)
    change("Lnl/persgroep/network/AdvertisementIdProvider;", "fetchAdvertisementId(Landroid/content/Context;)Ljava/lang/String;", "const-string v0, \"\"\nreturn-object v0")
    // Continue with the actual request, retaining all other interceptors and
    // any functional headers already present on it. Omit only this GAID adder.
    change("Lnl/persgroep/network/retrofit/interceptor/AdvertisementIdAdderInterceptor;", "intercept(Lokhttp3/Interceptor\$Chain;)Lokhttp3/Response;", """
        invoke-interface {p1}, Lokhttp3/Interceptor${'$'}Chain;->request()Lokhttp3/Request;
        move-result-object v0
        invoke-interface {p1, v0}, Lokhttp3/Interceptor${'$'}Chain;->proceed(Lokhttp3/Request;)Lokhttp3/Response;
        move-result-object v0
        return-object v0
    """)
}

/** Game IMA is independent of the publisher video manager. Report the existing
 * Error only after initialization; its rewarded consumer rejects the reward. */
context(patchContext: app.morphe.patcher.patch.BytecodePatchContext)
internal fun suppressGameAdRequest() {
    val player = "Lnl/dpgmedia/puzzels/gg/game/player/gameview/ad/ui/player/GameAdPlayer;"
    val target = exact(player, "<init>", "V",
        "Lcom/google/ads/interactivemedia/v3/api/AdsLoader;",
        "Lcom/google/ads/interactivemedia/v3/api/AdsRequest;",
        "Lcom/google/ads/interactivemedia/v3/api/AdsRenderingSettings;",
        "Lnl/dpgmedia/puzzels/gg/game/player/gameview/ad/ui/player/GameVideoAdPlayerAdapter;").method
    val reportError = exact(player, "reportAdError", "V", "Ljava/lang/String;").method
    check(reportError.accessFlags and AccessFlags.PRIVATE.value != 0 &&
        reportError.accessFlags and AccessFlags.STATIC.value == 0) {
        "Parool game error callback must remain a private instance method"
    }
    val code = target.instructions.toList()
    val calls = code.withIndex().filter { (_, instruction) ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        instruction.opcode == Opcode.INVOKE_INTERFACE && reference?.definingClass == "Lcom/google/ads/interactivemedia/v3/api/AdsLoader;" &&
            reference.name == "requestAds" && reference.parameterTypes == listOf("Lcom/google/ads/interactivemedia/v3/api/AdsRequest;")
    }
    check(calls.size == 1) { "Parool game IMA request boundary changed" }
    val (index, instruction) = calls.single()
    val locals = target.implementation!!.registerCount - 5
    val args = instruction as FiveRegisterInstruction
    check(locals >= 1 && args.registerCount == 2 && args.registerC == locals + 1 && args.registerD == locals + 2 &&
        index == code.size - 2 && code.last().opcode == Opcode.RETURN_VOID) { "Parool game constructor register/tail contract changed" }
    check(code.take(index).any { operation ->
        val field = (operation as? ReferenceInstruction)?.reference as? FieldReference
        operation.opcode == Opcode.IPUT_OBJECT && field?.definingClass == player && field.name == "mutableState"
    }) { "Parool game state must be initialized before its error path" }
    target.replaceInstruction(index, "const-string v0, \"Advertising disabled\"")
    target.addInstruction(index + 1, "invoke-direct {p0, v0}, $player->reportAdError(Ljava/lang/String;)V")
}
