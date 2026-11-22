package app.saketh.patches.webnovel.search

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.saketh.patches.shared.Constants.COMPATIBILITY_WEBNOVEL
import app.saketh.patches.webnovel.controls.hookAt
import app.saketh.patches.webnovel.controls.patchControlsRuntime
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val BLOCKED_AUTHORS = "Lapp/saketh/extension/search/BlockedAuthors;"
private const val NETWORK_API = "Lcom/qidian/QDReader/networkapi/NetworkApi;"
private const val RESPONSE_BEAN = "Lcom/qidian/reader/Int/retrofit/rthttp/bean/ResponseBean;"
private const val JSON_OBJECT = "Lorg/json/JSONObject;"

/** Requests the user's block list. It starts by getting the API client the extension also uses. */
private object BlockedUsersRequestFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = listOf(),
    filters = listOf(methodCall(definingClass = NETWORK_API, name = "getBlockedUsersApi")),
)

/** Blocks or unblocks a user from the native profile screen. */
private object BlockUserRequestFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = listOf("J", "I"),
    filters = listOf(methodCall(definingClass = NETWORK_API, name = "blockUser")),
)

/** Unwraps each typed API response on the network thread, before native list screens receive it. */
private object TypedResponseFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "L",
    parameters = listOf(RESPONSE_BEAN),
    filters = listOf(methodCall(definingClass = RESPONSE_BEAN, name = "setData")),
)

/** Parses each native-bridge response on the network thread, before Flutter screens receive it. */
private object JsonResponseFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "L",
    parameters = listOf("Ljava/lang/String;"),
    filters = listOf(
        methodCall(definingClass = JSON_OBJECT, name = "<init>", parameters = listOf("Ljava/lang/String;")),
        methodCall(definingClass = JSON_OBJECT, name = "<init>", parameters = listOf()),
    ),
)

@Suppress("unused")
val hideBlockedAuthorsPatch = patch(
    name = "Hide blocked authors' books",
    description = "Removes books by users you blocked from tag and genre results. " +
        "Blocks made on the website can take up to a minute to apply.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_WEBNOVEL)
    dependsOn(patchControlsRuntime)

    execute {
        val apiGetter = BlockedUsersRequestFingerprint.method.implementation!!.instructions
            .mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
            .first { it.returnType == NETWORK_API && it.parameterTypes.isEmpty() }
        mutableClassDefBy(BLOCKED_AUTHORS).methods.single { it.name == "networkApi" }.addInstructions(
            0,
            """
                invoke-static {}, ${apiGetter.definingClass}->${apiGetter.name}()$NETWORK_API
                move-result-object v0
                return-object v0
            """,
        )

        TypedResponseFingerprint.method.addInstructions(
            0,
            "invoke-static { p1 }, $BLOCKED_AUTHORS->filterResponse(Ljava/lang/Object;)V",
        )

        BlockUserRequestFingerprint.method.addInstructions(0, "invoke-static {}, $BLOCKED_AUTHORS->blockChanged()V")

        // Both the parsed object and the empty fallback for unparsable text reach this return.
        JsonResponseFingerprint.method.apply {
            val returned = implementation!!.instructions.indexOfLast { it.opcode == Opcode.INVOKE_STATIC }
            val json = (implementation!!.instructions[returned] as FiveRegisterInstruction).registerC
            hookAt(returned, "invoke-static { v$json }, $BLOCKED_AUTHORS->filterJson($JSON_OBJECT)V")
        }
    }
}
