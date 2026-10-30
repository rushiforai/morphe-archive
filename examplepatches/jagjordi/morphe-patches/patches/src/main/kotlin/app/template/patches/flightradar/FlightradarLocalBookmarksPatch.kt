package app.template.patches.flightradar

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.template.patches.shared.Constants.FLIGHTRADAR_COMPATIBILITY
import app.template.patches.shared.clearBody
import app.template.patches.shared.ensureRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

// Flightradar24 keeps bookmarks on its server and signs every bookmark request with the
// account's login token. The provider and the bulk method throw "Token login or url is
// empty" before any request goes out when no account is signed in, and the bookmarks
// tab resolves to an "account needed" state. This patch routes those three throw sites
// to a local store kept by the extension and lets the tab treat a missing account like
// a signed in one. The other client gates (flight panel star, airport panel star) only
// depend on the bookmark limit, which the Unlock Business Premium patch already raises.

private const val BOOKMARKS = "Lapp/template/extension/extension/Fr24Bookmarks;"
private const val GSON = "Lcom/google/gson/Gson;"
private const val BOOKMARKS_RESPONSE = "Lcom/flightradar24free/entity/BookmarksResponse;"
private const val FEATURE_DATA = "Lcom/flightradar24free/entity/FeatureData;"
private const val TOKEN_MESSAGE = "Token login or url is empty"

// BookmarksProvider.getBookmarks(): GET /bookmarks?tokenLogin=...
val BookmarksProviderListFingerprint = fingerprint {
    returns(BOOKMARKS_RESPONSE)
    parameters()
    strings("/bookmarks", TOKEN_MESSAGE)
}

// BookmarksProvider.sort(type, sortType): POST /bookmarks/sort
val BookmarksProviderSortFingerprint = fingerprint {
    returns("V")
    parameters("Lcom/flightradar24free/entity/BookmarkType;", "L")
    strings("/bookmarks/sort", TOKEN_MESSAGE)
}

// BookmarksUseCase.bulkAction(list, continuation): POST /bookmarks/bulk, inlined by R8.
val BookmarksUseCaseBulkFingerprint = fingerprint {
    returns("Ljava/lang/Object;")
    parameters("Ljava/util/List;", "L")
    strings("/bookmarks/bulk", TOKEN_MESSAGE)
}

// BookmarksTabViewModel.resolveState(): the only method reading all three limits of the
// bookmarks FeatureData, right after the login and anonymous account checks.
val BookmarksTabStateFingerprint = Fingerprint(
    parameters = emptyList(),
    filters = listOf(
        methodCall(definingClass = FEATURE_DATA, name = "getLimitSilver"),
        methodCall(definingClass = FEATURE_DATA, name = "getLimitGold"),
        methodCall(definingClass = FEATURE_DATA, name = "getLimitBusiness"),
    ),
)

val GsonToJsonFingerprint = Fingerprint(
    definingClass = GSON,
    returnType = "Ljava/lang/String;",
    parameters = listOf("Ljava/lang/Object;"),
)

val GsonFromJsonFingerprint = Fingerprint(
    definingClass = GSON,
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Class;", "Ljava/lang/String;"),
)

val BookmarksToJsonStubFingerprint = Fingerprint(
    definingClass = BOOKMARKS,
    name = "toJson",
)

val BookmarksFromJsonStubFingerprint = Fingerprint(
    definingClass = BOOKMARKS,
    name = "fromJson",
)

@Suppress("unused")
val flightradarLocalBookmarksPatch = bytecodePatch(
    name = "Bookmarks without account",
    description = "Stores bookmarks on the device when no Flightradar24 account is signed in, " +
        "so aircraft, flights, airports and locations can be bookmarked without creating an " +
        "account. Flight details for bookmarked aircraft and flights come from the public " +
        "Flightradar24 search endpoint. With an account signed in the server bookmarks are " +
        "used as before.",
    default = true,
) {
    compatibleWith(FLIGHTRADAR_COMPATIBILITY)

    dependsOn(flightradarUnlockBusinessPatch)

    extendWith("extensions/extension.mpe")

    execute {
        FR24ApplicationOnCreateFingerprint.method.addInstructions(
            0,
            "invoke-static {p0}, $BOOKMARKS->init(Ljava/lang/Object;)V",
        )

        // The app's Gson has minified method names, so the extension's stubs are filled in
        // with the names found in this build.
        BookmarksToJsonStubFingerprint.method.apply {
            ensureRegisters(3)
            clearBody()
            addInstructions(
                0,
                """
                check-cast p0, $GSON
                invoke-virtual {p0, p1}, ${GsonToJsonFingerprint.method.descriptor()}
                move-result-object v0
                return-object v0
                """.trimIndent(),
            )
        }
        BookmarksFromJsonStubFingerprint.method.apply {
            val fromJson = GsonFromJsonFingerprint.method
            val arguments = if (fromJson.parameterTypes.first() == "Ljava/lang/Class;") "p0, p1, p2" else "p0, p2, p1"
            ensureRegisters(4)
            clearBody()
            addInstructions(
                0,
                """
                check-cast p0, $GSON
                invoke-virtual {$arguments}, ${fromJson.descriptor()}
                move-result-object v0
                return-object v0
                """.trimIndent(),
            )
        }

        // GET /bookmarks: the throw site becomes a return of the local list.
        BookmarksProviderListFingerprint.method.replaceTokenThrow(
            """
            invoke-static {p0}, $BOOKMARKS->localList(Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object v0
            check-cast v0, $BOOKMARKS_RESPONSE
            return-object v0
            """.trimIndent(),
        )

        // POST /bookmarks/sort: the throw site stores the sort choice locally.
        BookmarksProviderSortFingerprint.method.replaceTokenThrow(
            """
            invoke-static {p0, p1, p2}, $BOOKMARKS->localSort(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
            return-void
            """.trimIndent(),
        )

        // POST /bookmarks/bulk: the throw site applies the actions locally and continues
        // with the response exactly where the network path would have continued.
        BookmarksUseCaseBulkFingerprint.method.apply {
            val castIndex = instructions.indexOfFirst {
                it.opcode == Opcode.CHECK_CAST &&
                    ((it as ReferenceInstruction).reference as TypeReference).type == BOOKMARKS_RESPONSE
            }
            if (castIndex < 0) throw PatchException("No BookmarksResponse cast in the bulk method")
            val responseRegister = getInstruction<OneRegisterInstruction>(castIndex).registerA
            val resumeInstruction = getInstruction(castIndex + 1)
            val providerClass = BookmarksProviderListFingerprint.method.definingClass
            val providerIndex = instructions.indexOfFirst {
                it.opcode == Opcode.IGET_OBJECT &&
                    ((it as ReferenceInstruction).reference as FieldReference).type == providerClass
            }
            if (providerIndex < 0) throw PatchException("No provider field read in the bulk method")
            val bulkProviderRegister = getInstruction<TwoRegisterInstruction>(providerIndex).registerA
            val listRegister = implementation!!.registerCount - 2
            replaceTokenThrow(
                """
                invoke-static {v$bulkProviderRegister, v$listRegister}, $BOOKMARKS->localBulk(Ljava/lang/Object;Ljava/util/List;)Ljava/lang/Object;
                move-result-object v$responseRegister
                check-cast v$responseRegister, $BOOKMARKS_RESPONSE
                goto :local_bookmarks_resume
                """.trimIndent(),
                ExternalLabel("local_bookmarks_resume", resumeInstruction),
            )
        }

        // Bookmarks tab: the first boolean call on the user object is the login check.
        BookmarksTabStateFingerprint.method.apply {
            val index = instructions.indexOfFirst {
                it.opcode == Opcode.INVOKE_VIRTUAL && (it as ReferenceInstruction).reference.let { reference ->
                    reference is MethodReference && reference.returnType == "Z" && reference.parameterTypes.isEmpty()
                }
            }
            if (index < 0) throw PatchException("No login check in the bookmarks tab state method")
            val register = getInstruction<FiveRegisterInstruction>(index).registerC
            replaceInstruction(index, "invoke-static {v$register}, $BOOKMARKS->bookmarksAvailable(Ljava/lang/Object;)Z")
        }

        // BookmarksUseCase collects the login state and clears the bookmarks when it turns
        // false. Dropping that branch makes a logged out start load the local store like a
        // login would.
        val useCaseClass = BookmarksUseCaseBulkFingerprint.method.definingClass
        val loginCollectorFingerprint = fingerprint {
            returns("Ljava/lang/Object;")
            parameters("Z", "L")
            custom { method: Method, classDef: ClassDef ->
                classDef.fields.any { it.type == useCaseClass } &&
                    method.implementation?.instructions?.any { it.opcode == Opcode.IF_EQZ } == true
            }
        }
        loginCollectorFingerprint.method.apply {
            val loggedInRegister = implementation!!.registerCount - 2
            val index = instructions.indexOfFirst {
                it.opcode == Opcode.IF_EQZ && (it as OneRegisterInstruction).registerA == loggedInRegister
            }
            if (index < 0) throw PatchException("No logged out branch in the login collector")
            replaceInstruction(index, "nop")
        }
    }
}

private fun Method.descriptor(): String =
    "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

/**
 * Replaces the `throw new Exception("Token login or url is empty")` block of a bookmarks
 * network method with [replacement]. The branch that reaches the block is kept by turning
 * its first instruction into a nop, so no label has to move.
 */
private fun MutableMethod.replaceTokenThrow(replacement: String, vararg labels: ExternalLabel) {
    val messageIndex = instructions.indexOfFirst {
        it.opcode == Opcode.CONST_STRING &&
            ((it as ReferenceInstruction).reference as StringReference).string == TOKEN_MESSAGE
    }
    if (messageIndex < 1) throw PatchException("No token message in $name")
    val newInstanceIndex = messageIndex - 1
    if (getInstruction(newInstanceIndex).opcode != Opcode.NEW_INSTANCE ||
        getInstruction(messageIndex + 1).opcode != Opcode.INVOKE_DIRECT ||
        getInstruction(messageIndex + 2).opcode != Opcode.THROW
    ) {
        throw PatchException("Unexpected throw block layout in $name")
    }
    replaceInstruction(newInstanceIndex, "nop")
    val count = replacement.lines().count { it.isNotBlank() }
    if (labels.isEmpty()) {
        addInstructions(newInstanceIndex + 1, replacement)
    } else {
        addInstructionsWithLabels(newInstanceIndex + 1, replacement, *labels)
    }
    removeInstructions(newInstanceIndex + 1 + count, 3)
}
