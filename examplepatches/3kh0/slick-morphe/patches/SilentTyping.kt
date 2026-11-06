package slick.android

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

val silentTyping =
    bytecodePatch(
        name = "Slick Android",
        description = "Slack should not be awful to use on Android. Let's fix that!",
    ) {
        dependsOn(nativeFeatures, cacheCleaner, featureFlags)
        compatibleWith(
            Compatibility(
                name = "Slack",
                packageName = "com.Slack",
                targets = listOf(AppTarget(version = "26.10.20.0")),
            ),
        )

        execute {
            method("Lslack/services/usertyping/UserTypingHandler;", "sendTypingMessage") {
                it.parameterTypes.isEmpty() && it.returnType == "V"
            }.run {
                check(code.first().opcode != Opcode.RETURN_VOID) { "SilentTyping is already applied. Use an unpatched APK." }
                val refs = code.mapNotNull { it.ref }
                val calls = refs.filterIsInstance<MethodReference>()
                check(calls.none { it.definingClass.startsWith("Lslick/android/") }) { "Slick is already applied. Use an unpatched APK." }
                check(
                    refs.filterIsInstance<StringReference>().any { it.string == "pref_key_display_typing_indicators" } &&
                        calls.any {
                            it.definingClass == "Landroid/os/Handler;" && it.name == "sendMessage" &&
                                it.parameterTypes == listOf("Landroid/os/Message;") && it.returnType == "Z"
                        },
                ) { "Outgoing typing handler changed; refusing to patch. Use an unpatched APK." }

                // Off falls through to Slack, including its original display preference.
                check(registers > 1)
                intercept("invoke-static {}, Lslick/android/Settings;->silentTyping()Z\nmove-result v0", "return-void")
            }
        }
    }
