package app.morphe.patches.zona

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags

private object ZonaAnalyticsFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    strings = listOf("MOVIE_PLAYER_RESULT_SUCCESS"),
    returnType = "V",
)

private object ClickHouseSenderFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    strings = listOf("Analytics server URL is unavailable; event wait expired"),
    returnType = "Ljava/lang/Object;",
)

private object ClickHouseSenderLegacyFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    strings = listOf("Get url for send event is failed"),
    returnType = "Ljava/lang/Object;",
)

private object AppMetricaFingerprint : Fingerprint(
    definingClass = "Lio/appmetrica/analytics/AppMetrica;",
    name = "reportEvent",
)

private object AppMetricaLibraryAdapterFingerprint : Fingerprint(
    definingClass = "Lio/appmetrica/analytics/AppMetricaLibraryAdapter;",
    name = "reportEvent",
)

@Suppress("unused")
val disableAnalyticsPatch = bytecodePatch(
    name = "Disable analytics",
    description = "Disables internal event tracking, ClickHouse telemetry, crash reporting, and AppMetrica SDK to enhance privacy and battery life.",
    default = true,
) {
    compatibleWith(ZONA_COMPATIBILITY)

    execute {
        // 1. Neutralize Zona's internal analytics dispatcher (Lic/b)
        ZonaAnalyticsFingerprint.classDefOrNull?.methods?.forEach { method ->
            val params = method.parameterTypes.map { it.toString() }
            if (method.returnType == "V" && params.size in 2..3 && params.last() == "Ljava/util/Map;") {
                method.apply {
                    replaceInstruction(0, "return-void")
                }
            }
        }

        // 2. Neutralize ClickHouse HTTP sender (Lec/e in 3.0.77, Ljc/c in 3.0.76)
        val clickHouseClass = ClickHouseSenderFingerprint.classDefOrNull ?: ClickHouseSenderLegacyFingerprint.classDefOrNull
        clickHouseClass?.methods?.forEach { method ->
            if (method.returnType == "Ljava/lang/Object;" && method.parameterTypes.size == 3) {
                method.apply {
                    replaceInstruction(0, "sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;")
                    addInstruction(1, "return-object v0")
                }
            }
        }

        // 3. Neutralize AppMetrica telemetry reporting without breaking SDK initialization
        AppMetricaFingerprint.classDefOrNull?.methods?.forEach { method ->
            val name = method.name
            if (method.returnType == "V" && (
                name.startsWith("report") ||
                name == "sendEventsBuffer" ||
                name == "pauseSession" ||
                name == "resumeSession"
            )) {
                method.apply {
                    replaceInstruction(0, "return-void")
                }
            }
        }

        AppMetricaLibraryAdapterFingerprint.classDefOrNull?.methods?.forEach { method ->
            val name = method.name
            if (method.returnType == "V" && (
                name == "reportEvent" ||
                name == "subscribeForAutoCollectedData"
            )) {
                method.apply {
                    replaceInstruction(0, "return-void")
                }
            }
        }
    }
}
