package slick.android

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import com.android.tools.smali.dexlib2.iface.reference.StringReference

// Adapted from HagiaHaya/morphe-patches' Slack Block telemetry patch (GPLv3).
val blockTelemetry =
    slackPatch("Block telemetry", "Block Slack usage events, performance traces and Sentry reports.", "block_telemetry") {
        execute {
            method("Lslack/telemetry/internal/EventSyncManagerImpl;", "track") {
                it.parameterTypes == listOf("Lslack/telemetry/internal/TelemetryEvent;") && it.returnType == "V"
            }.run {
                check(registers == 4)
                intercept("invoke-static {}, Lslick/android/Telemetry;->blocked()Z\nmove-result v0", "return-void")
            }
            findMethod("conditionallyInitializeSentry") { m ->
                m.returnType == "V" && m.implementation?.instructions?.any {
                    (it.ref as? StringReference)?.string == "Feature flag enabled -- initializing Sentry"
                } == true
            }.run {
                check(registers > parameterTypes.size + 1)
                intercept("invoke-static {}, Lslick/android/Telemetry;->blocked()Z\nmove-result v0", "return-void")
            }
            method("Lokhttp3/internal/http/RealInterceptorChain;", "proceed") {
                it.parameterTypes == listOf("Lokhttp3/Request;") && it.returnType == "Lokhttp3/Response;"
            }.run {
                check(registers == 13)
                check(classDefBy("Lokhttp3/Request;").fields.any { it.name == "url" && it.type == "Lokhttp3/HttpUrl;" })
                check(classDefBy("Lokhttp3/HttpUrl;").fields.any { it.name == "host" && it.type == "Ljava/lang/String;" })
                addInstructions(
                    0,
                    """
                    iget-object v0, p1, Lokhttp3/Request;->url:Lokhttp3/HttpUrl;
                    iget-object v1, v0, Lokhttp3/HttpUrl;->host:Ljava/lang/String;
                    invoke-virtual {v0}, Lokhttp3/HttpUrl;->encodedPath()Ljava/lang/String;
                    move-result-object v0
                    invoke-static {v1, v0}, Lslick/android/Telemetry;->checkRequest(Ljava/lang/String;Ljava/lang/String;)V
                    """,
                )
            }
        }
    }
