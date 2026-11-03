package semicoloncolonel.mobilestream.patches.shared.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

// The two ways a React Native + Expo app's JavaScript sends a request:
// Expo's expo/fetch module and React Native's own NetworkingModule (fetch
// and XMLHttpRequest). filterJsRequests() passes each request URL through
// a filter class, which returns the URL unchanged or a blocked one.

private fun isUrlCast(instruction: Instruction) =
    instruction.opcode == Opcode.CHECK_CAST &&
        ((instruction as ReferenceInstruction).reference as TypeReference).type == "Ljava/net/URL;"

// expo/fetch's start(request, url, init, body) handler. It is the only method
// that maps file URLs to http://filesystem.local and also casts an argument to
// java.net.URL (the module's OkHttp interceptor uses the same string).
internal object ExpoFetchStartFingerprint : Fingerprint(
    strings = listOf("http://filesystem.local"),
    custom = { method, _ ->
        method.implementation?.instructions?.any(::isUrlCast) == true
    },
)

private const val NETWORKING_MODULE = "Lcom/facebook/react/modules/network/NetworkingModule;"

/**
 * [filter] must have static filterJsRequestUrl(String) -> String and
 * filterJsRequestUrl(URL) -> URL methods.
 */
internal fun BytecodePatchContext.filterJsRequests(filter: String) {
    // expo/fetch: filter the URL argument right after its check-cast.
    ExpoFetchStartFingerprint.methodOrNull?.apply {
        val index = implementation!!.instructions.indexOfFirst(::isUrlCast)
        if (index < 0) throw PatchException("No URL cast in the expo/fetch start handler")
        val register = (implementation!!.instructions.toList()[index] as OneRegisterInstruction).registerA
        addInstructions(
            index + 1,
            """
                invoke-static/range { v$register .. v$register }, $filter->filterJsRequestUrl(Ljava/net/URL;)Ljava/net/URL;
                move-result-object v$register
            """.trimIndent(),
        )
    }

    // NetworkingModule.sendRequestInternal(method, url, ...), and
    // sendRequestInternalReal in newer React Native: p2 is the URL. Where
    // both exist, the URL is filtered twice, which changes nothing.
    forEachMatchingMethod(
        { it.type == NETWORKING_MODULE },
        { method ->
            (method.name == "sendRequestInternal" || method.name == "sendRequestInternalReal") &&
                method.returnType == "V" &&
                method.parameterTypes.take(2).map { it.toString() } == listOf("Ljava/lang/String;", "Ljava/lang/String;")
        },
    ) { method ->
        method.addInstructions(
            0,
            """
                invoke-static/range { p2 .. p2 }, $filter->filterJsRequestUrl(Ljava/lang/String;)Ljava/lang/String;
                move-result-object p2
            """.trimIndent(),
        )
    }
}
