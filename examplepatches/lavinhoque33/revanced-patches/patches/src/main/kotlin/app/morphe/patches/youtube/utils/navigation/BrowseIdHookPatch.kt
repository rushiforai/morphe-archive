/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * Original hard forked code:
 * https://github.com/ReVanced/revanced-patches/commit/724e6d61b2ecd868c1a9a37d465a688e83a74799
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to Morphe contributions.
 * Modified by lavinhoque33, 2026-11-14, 2026-11-24.
 */

package app.morphe.patches.youtube.utils.navigation

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.findFreeRegister
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.shared.mapping.ResourceType
import app.morphe.patches.shared.mapping.getResourceId
import app.morphe.patches.youtube.utils.extension.sharedExtensionPatch
import app.morphe.util.indexOfFirstInstructionOrThrow
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import java.lang.ref.WeakReference

private lateinit var browseIdMethodRef: WeakReference<MutableMethod>
private var browseIdInsertIndex = -1
private var browseIdRegister = -1
private lateinit var browseEndpointField: FieldReference
private lateinit var browseIdExtractor: MethodReference

private lateinit var searchResultsMethodRef: WeakReference<MutableMethod>

/**
 * Calls the extension method with the browse id of every browse page that is shown, including
 * a page that is returned to and served from cache. Channel pages use the channel id as browse id.
 *
 * @param descriptor Static extension method with a single String parameter, which can be null.
 */
fun addBrowseIdHook(descriptor: String) {
    browseIdMethodRef.get()!!.addInstruction(
        browseIdInsertIndex,
        "invoke-static { v$browseIdRegister }, $descriptor"
    )
}

/**
 * Calls the extension method when the search feed is shown. It is not a browse page,
 * so returning to it from a browse page does not call the hooks of [addBrowseIdHook].
 *
 * @param descriptor Static extension method with no parameters.
 */
fun addSearchResultsHook(descriptor: String) {
    searchResultsMethodRef.get()!!.addInstruction(
        0,
        "invoke-static { }, $descriptor"
    )
}

/**
 * Publishes the main pane before its view can parse cards, and follows updates only on that fragment.
 * An endpoint write alone is not navigation: a fragment can write it while stopping.
 */
context(context: BytecodePatchContext)
internal fun addBrowsePaneHooks(activePaneCallback: String, endpointCallback: String): Boolean {
    val replace = PaneFragmentReplaceFingerprint.matchAllOrNull()?.singleOrNull()?.method ?: return false
    val fragmentType = replace.parameterTypes[1].toString()
    val createView = FragmentPerformCreateViewFingerprint.matchAllOrNull()
        ?.singleOrNull { it.originalMethod.definingClass == fragmentType }?.method ?: return false
    val containerId = getResourceId(ResourceType.ID, "pane_fragment_container")
    if (containerId < 0L || replace.implementation!!.registerCount > 16 ||
        createView.implementation!!.registerCount > 16
    ) {
        return false
    }

    val arguments = Fingerprint(
        definingClass = fragmentType,
        returnType = "V",
        parameters = listOf("Landroid/os/Bundle;"),
        filters = listOf(
            string("Fragment already added and state has been saved"),
            fieldAccess(opcode = Opcode.IPUT_OBJECT, definingClass = "this", type = "Landroid/os/Bundle;"),
        ),
    ).matchAllOrNull()?.singleOrNull()?.let { match ->
        match.method.getInstruction<ReferenceInstruction>(match.instructionMatches.last().index)
            .getReference<FieldReference>()
    } ?: return false

    val readLaunchEndpoint = Fingerprint(
        accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
        returnType = browseEndpointField.type,
        parameters = listOf("Landroid/os/Bundle;"),
        filters = listOf(string("navigation_endpoint")),
    ).matchAllOrNull()?.singleOrNull()?.originalMethod ?: return false

    val browseClass = BrowseFragmentOnCreateViewFingerprint.classDef
    val browseType = browseClass.type
    val readId = browseClass.addPaneCallback(
        "patch_readChannelNamesBrowseId",
        listOf(browseType),
        "Ljava/lang/String;",
        3,
        """
            iget-object v0, p0, $browseEndpointField
            invoke-static { v0 }, $browseIdExtractor
            move-result-object v0
            if-eqz v0, :read_launch
            invoke-virtual { v0 }, Ljava/lang/String;->isEmpty()Z
            move-result v1
            if-eqz v1, :return_id
            :read_launch
            iget-object v0, p0, $arguments
            if-eqz v0, :no_id
            invoke-static { v0 }, $readLaunchEndpoint
            move-result-object v0
            invoke-static { v0 }, $browseIdExtractor
            move-result-object v0
            :return_id
            return-object v0
            :no_id
            const/4 v0, 0x0
            return-object v0
        """,
    )
    val activate = browseClass.addPaneCallback(
        "patch_activateChannelNamesPane",
        listOf("I", fragmentType, "Z"),
        "V",
        4,
        """
            const v0, $containerId
            if-ne p0, v0, :return
            instance-of v0, p1, $browseType
            if-eqz v0, :not_browse
            check-cast p1, $browseType
            invoke-static { p1 }, $readId
            move-result-object v0
            invoke-static { p1, v0, p2 }, $activePaneCallback
            return-void
            :not_browse
            const/4 p1, 0x0
            const/4 v0, 0x0
            invoke-static { p1, v0, p2 }, $activePaneCallback
            :return
            return-void
        """,
    )
    val update = browseClass.addPaneCallback(
        "patch_updateChannelNamesPane",
        listOf(browseType),
        "V",
        2,
        """
            invoke-static { p0 }, $readId
            move-result-object v0
            invoke-static { p0, v0 }, $endpointCallback
            return-void
        """,
    )
    replace.addInstructions(
        0,
        """
            const/4 v0, 0x0
            invoke-static { p1, p2, v0 }, $activate
        """,
    )
    createView.addInstructionsWithLabels(
        0,
        """
            if-eqz p2, :native_create_view
            invoke-virtual { p2 }, Landroid/view/View;->getId()I
            move-result v0
            const/4 v1, 0x1
            invoke-static { v0, p0, v1 }, $activate
        """,
        ExternalLabel("native_create_view", createView.getInstruction(0)),
    )
    browseIdMethodRef.get()!!.apply {
        // The shared ID hook may reuse p0, so pass the receiver before that hook.
        val endpointWrite = indexOfFirstInstructionOrThrow {
            opcode == Opcode.IPUT_OBJECT && getReference<FieldReference>() == browseEndpointField
        }
        addInstruction(endpointWrite + 1, "invoke-static/range { p0 .. p0 }, $update")
        browseIdInsertIndex++
    }
    return true
}

private fun MutableClass.addPaneCallback(
    name: String,
    parameters: List<String>,
    returnType: String,
    registers: Int,
    instructions: String,
): MutableMethod =
    ImmutableMethod(
        type,
        name,
        parameters.map { ImmutableMethodParameter(it, null, null) },
        returnType,
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
        null,
        null,
        MutableMethodImplementation(registers),
    ).toMutable().also {
        it.addInstructions(0, instructions)
        methods.add(it)
    }

internal val browseIdHookPatch = bytecodePatch(description = "Hooks the browse id of the page that is shown.") {
    dependsOn(sharedExtensionPatch)

    execute {
        BrowseFragmentOnCreateViewFingerprint.let {
            it.method.apply {
                // The endpoint of the page is read just before it is checked for browse data.
                val endpointIndex = it.instructionMatches[1].index
                val endpointField = getInstruction<ReferenceInstruction>(endpointIndex)
                    .getReference<FieldReference>()!!
                browseEndpointField = endpointField

                // Browse data is an extension of the endpoint, and reading it starts with that field.
                val browseDataExtensionIndex = indexOfFirstInstructionOrThrow(
                    endpointIndex, Opcode.SGET_OBJECT
                )
                val browseDataExtensionField = getInstruction<ReferenceInstruction>(browseDataExtensionIndex)
                    .getReference<FieldReference>()!!

                // Browse id is returned unchanged, or null when the endpoint has no browse data.
                // Other string extractors use the same extension, but normalize empty strings to null.
                val browseIdMethod = Fingerprint(
                    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
                    returnType = "Ljava/lang/String;",
                    parameters = listOf(endpointField.type),
                    filters = listOf(
                        fieldAccess(opcode = Opcode.SGET_OBJECT, reference = browseDataExtensionField),
                        fieldAccess(opcode = Opcode.IGET_OBJECT, type = "Ljava/lang/String;"),
                        literal(0L, location = MatchAfterWithin(2)),
                        opcode(Opcode.RETURN_OBJECT, location = MatchAfterImmediately())
                    )
                ).matchAll(1..2).first().method
                browseIdExtractor = browseIdMethod

                // The fragment is handed the endpoint of every page it shows, including a page that
                // is returned to and served from cache, which makes no browse request to read.
                Fingerprint(
                    definingClass = definingClass,
                    returnType = "V",
                    parameters = listOf(endpointField.type),
                    filters = listOf(
                        fieldAccess(opcode = Opcode.IPUT_OBJECT, reference = endpointField)
                    )
                ).method.apply {
                    val insertIndex = indexOfFirstInstructionOrThrow {
                        opcode == Opcode.IPUT_OBJECT && getReference<FieldReference>() == endpointField
                    } + 1
                    val freeRegister = findFreeRegister(insertIndex)

                    addInstructions(
                        insertIndex,
                        """
                            invoke-static { p1 }, $browseIdMethod
                            move-result-object v$freeRegister
                        """
                    )

                    browseIdMethodRef = WeakReference(this)
                    browseIdInsertIndex = insertIndex + 2
                    browseIdRegister = freeRegister
                }
            }
        }

        searchResultsMethodRef = WeakReference(SearchResultsFragmentOnCreateViewFingerprint.method)
    }
}

