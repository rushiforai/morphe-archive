package app.tiktoktv.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.tiktoktv.patches.shared.Constants.COMPATIBILITY_TIKTOK_TV
import com.android.tools.smali.dexlib2.iface.Method

private const val OTHER_PROFILE_OBSERVER = "Lcom/ss/android/ugc/aweme/tv/profilev2/ui/otherprofile/a\$b;"
private const val OTHER_PROFILE_FOLLOW_OBSERVER = "Lcom/ss/android/ugc/aweme/tv/profilev2/ui/otherprofile/a\$c;"
private const val SEARCH_RESULT_REPOSITORY = "Lcom/ss/android/ugc/aweme/tv/search/v2/b/d/d;"
private const val SEARCH_RESPONSE_MODEL = "Lcom/ss/android/ugc/aweme/tv/search/v2/b/c/a/b/f;"
private const val SEARCH_DEBUG = "Lapp/template/extension/extension/SearchDebug;"
private const val CALL_SERVER_INTERCEPTOR = "Lcom/bytedance/retrofit2/CallServerInterceptor;"
private const val CHAIN = "Lcom/bytedance/retrofit2/d/a\$a;"
private const val RESPONSE_BODY = "Lcom/bytedance/retrofit2/b/d;"
private const val RETROFIT_METRICS = "Lcom/bytedance/retrofit2/v;"

private fun Method.parameterRegister(index: Int): Int {
    val registerCount = implementation?.registerCount
        ?: throw IllegalStateException("$name has no implementation")
    var offset = 0
    for (i in 0 until index) {
        offset += if (parameterTypes[i] == "J" || parameterTypes[i] == "D") 2 else 1
    }
    val parameterRegisters = parameterTypes.sumOf {
        if (it == "J" || it == "D") 2 else 1
    }
    return registerCount - parameterRegisters + offset
}

/** Diagnostic patch that logs search requests and responses. */
@Suppress("unused")
val debugSearchLoggingPatch = bytecodePatch(
    name = "Debug search logging",
    description = "Temporary diagnostic patch: logs search responses and failures to logcat.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_TIKTOK_TV)
    extendWith("extensions/extension.mpe")

    execute {
        mutableClassDefBy(SEARCH_RESULT_REPOSITORY).methods.forEach { method ->
            val lastIndex = method.parameterTypes.lastIndex
            if (lastIndex < 0) return@forEach

            when (method.parameterTypes[lastIndex]) {
                SEARCH_RESPONSE_MODEL -> method.addInstruction(
                    0,
                    "invoke-static {v${method.parameterRegister(lastIndex)}}, " +
                        "$SEARCH_DEBUG->logResponse(Ljava/lang/Object;)V",
                )

                "Ljava/lang/Throwable;" -> method.addInstruction(
                    0,
                    "invoke-static {v${method.parameterRegister(lastIndex)}}, " +
                        "$SEARCH_DEBUG->logThrowable(Ljava/lang/Throwable;)V",
                )
            }
        }

        mutableClassDefBy(OTHER_PROFILE_OBSERVER).methods.forEach { method ->
            when {
                method.name == "onError" &&
                    method.parameterTypes == listOf("Ljava/lang/Throwable;") ->
                    method.addInstruction(
                        0,
                        "invoke-static {p1}, " +
                            "$SEARCH_DEBUG->logProfileThrowable(Ljava/lang/Throwable;)V",
                    )

                method.name == "onNext" &&
                    method.parameterTypes == listOf("Ljava/lang/Object;") ->
                    method.addInstruction(
                        0,
                        "invoke-static {p1}, $SEARCH_DEBUG->logProfileResponse(Ljava/lang/Object;)V",
                    )
            }
        }

        mutableClassDefBy(OTHER_PROFILE_FOLLOW_OBSERVER).methods.forEach { method ->
            if (method.name == "onError" && method.parameterTypes == listOf("Ljava/lang/Throwable;")) {
                method.addInstruction(
                    0,
                    "invoke-static {p1}, " +
                        "$SEARCH_DEBUG->logProfileThrowable(Ljava/lang/Throwable;)V",
                )
            }
        }

        mutableClassDefBy(CALL_SERVER_INTERCEPTOR).methods.forEach { method ->
            when {
                method.name == "intercept" && method.parameterTypes == listOf(CHAIN) -> {
                    method.addInstruction(
                        0,
                        "invoke-interface {p1}, Lcom/bytedance/retrofit2/d/a\$a;->a()" +
                            "Lcom/bytedance/retrofit2/b/c;",
                    )
                    method.addInstruction(1, "move-result-object v0")
                    method.addInstruction(
                        2,
                        "invoke-static {v0}, $SEARCH_DEBUG->logRequest(Ljava/lang/Object;)V",
                    )
                }

                method.name == "a" &&
                    method.parameterTypes == listOf(RESPONSE_BODY, RETROFIT_METRICS) ->
                    method.addInstruction(
                        0,
                        "invoke-static {p1}, $SEARCH_DEBUG->logHttpResponse(Ljava/lang/Object;)V",
                    )
            }
        }
    }
}
