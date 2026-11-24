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
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val BLOCKED_AUTHORS = "Lapp/saketh/extension/search/BlockedAuthors;"
private const val NETWORK_API = "Lcom/qidian/QDReader/networkapi/NetworkApi;"
private const val RESPONSE_BEAN = "Lcom/qidian/reader/Int/retrofit/rthttp/bean/ResponseBean;"
private const val JSON_OBJECT = "Lorg/json/JSONObject;"
private const val SEARCH_RESULTS = "Lcom/qidian/QDReader/components/entity/SearchBookListModel;"

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

/** Shows one page of the native tag, genre and search result list. */
private object BookListPageFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf(SEARCH_RESULTS),
    filters = listOf(
        methodCall(definingClass = SEARCH_RESULTS, name = "getBookInfos"),
        methodCall(definingClass = SEARCH_RESULTS, name = "getLast"),
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

        // A page whose books were all removed reaches the screen's "No results" branch, which hides
        // the list and never asks for the next page. Show it as an ordinary page instead, then load
        // the next one. With books already on screen, the list's load-more footer does that itself.
        BookListPageFingerprint.method.apply {
            val instructions = implementation!!.instructions
            fun Int.method() = (instructions[this] as ReferenceInstruction).reference as MethodReference
            fun Int.field() = (instructions[this] as ReferenceInstruction).reference as FieldReference
            val fragment = instructions.indexOfFirst { it.opcode == Opcode.IGET_OBJECT }.field()
            // The page shows with showContent(isPullToRefresh), then addPage(isRefresh, books, last).
            val pullFlag = instructions.indexOfFirst { it.opcode == Opcode.IGET_BOOLEAN }
            val refreshFlag = instructions.indexOfLast { it.opcode == Opcode.IGET_BOOLEAN }
            val showContent = (pullFlag + 1).method()
            val addPage = instructions.indices.filter { instructions[it].opcode == Opcode.INVOKE_STATIC }
                .map { it.method() }.single { it.parameterTypes.size == 4 && it.parameterTypes[0].toString() == fragment.type }
            val adapter = mutableClassDefBy(definingClass).methods.single { it.name == "onError" }
                .implementation!!.instructions
                .mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
                .single { it.parameterTypes.map(CharSequence::toString) == listOf(fragment.type) && it.returnType != "V" }
            val loadMore = mutableClassDefBy(fragment.type).methods.single { method ->
                AccessFlags.STATIC.isSet(method.accessFlags) && method.parameterTypes.size == 5 &&
                    method.implementation?.instructions?.any {
                        ((it as? ReferenceInstruction)?.reference as? MethodReference)?.name == "fetchData"
                    } == true
            }
            // The last block shows "No results": load the fragment, pass false, return.
            val noResults = instructions.indexOfLast { it.opcode == Opcode.INVOKE_STATIC } - 1
            check(instructions[noResults].opcode == Opcode.IGET_OBJECT) { "No-results branch moved" }
            hookAt(
                noResults,
                """
                    invoke-static { p1 }, $BLOCKED_AUTHORS->skipsEmptiedPage(Ljava/lang/Object;)Z
                    move-result v0
                    if-eqz v0, :native
                    iget-object v0, p0, ${(noResults).field()}
                    iget-boolean v1, p0, ${pullFlag.field()}
                    invoke-static { v0, v1 }, $showContent
                    iget-boolean v1, p0, ${refreshFlag.field()}
                    invoke-virtual { p1 }, $SEARCH_RESULTS->getBookInfos()Ljava/util/ArrayList;
                    move-result-object v2
                    invoke-virtual { p1 }, $SEARCH_RESULTS->getLast()Ljava/lang/Boolean;
                    move-result-object p1
                    invoke-static { v0, v1, v2, p1 }, $addPage
                    invoke-static { v0 }, $adapter
                    move-result-object v1
                    invoke-virtual { v1 }, Lcom/chad/library/adapter/base/BaseQuickAdapter;->getData()Ljava/util/List;
                    move-result-object v1
                    invoke-interface { v1 }, Ljava/util/List;->isEmpty()Z
                    move-result v1
                    if-eqz v1, :done
                    const/4 v1, 0x0
                    const/4 v2, 0x2
                    const/4 p1, 0x0
                    invoke-static { v0, v1, v1, v2, p1 }, ${loadMore.definingClass}->${loadMore.name}(${loadMore.parameterTypes.joinToString("")})V
                    :done
                    return-void
                    :native
                    const/4 v1, 0x0
                """,
            )
        }
    }
}
