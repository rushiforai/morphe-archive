/*
 * YTAfterglow for Android.
 *
 * Adapted from the Litho filter and conversion context patches of Morphe patches
 * v2.2.0 (https://github.com/MorpheApp/morphe-patches, GPLv3), whose Litho filter
 * was forked from ReVanced patches (https://github.com/ReVanced/revanced-patches,
 * GPLv3). Modified for YTAfterglow: rewritten for patcher 2.1.0 and YouTube
 * 21.43.523, filters registered in the extension and gated by Afterglow
 * preferences, proto bytes encoded only on demand, and only the supporting hooks
 * that filtering needs on 21.43.523. Not an official Morphe or ReVanced file.
 *
 * Portions of this software are provided "AS IS" by the Morphe software project.
 * Any express or implied warranties, including the implied warranties of
 * merchantability and fitness for a particular purpose, are disclaimed.
 */

package app.afterglow.patches.litho

import app.afterglow.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import app.afterglow.patches.shared.Constants.EXTENSION_PACKAGE
import app.afterglow.patches.shared.addFieldGetter
import app.afterglow.patches.shared.addMethod
import app.afterglow.patches.shared.afterglowExtensionPatch
import app.afterglow.patches.shared.findFieldFromToString
import app.afterglow.patches.shared.smali
import app.afterglow.patches.shared.writtenRegisters
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.addInstructionsAtControlFlowLabel
import app.morphe.patcher.util.getFreeRegisterProvider
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val EXTENSION_LITHO = "$EXTENSION_PACKAGE/litho"

/** Injection point class of the extension. */
private const val LITHO_FILTER_CLASS = "$EXTENSION_LITHO/LithoFilterPatch;"

/** Interface the conversion context gets, see `LithoContext.java`. */
private const val LITHO_CONTEXT_INTERFACE = "$EXTENSION_LITHO/LithoContext;"

/** Interface the native proto message class gets, see `ElementProto.java`. */
private const val ELEMENT_PROTO_INTERFACE = "$EXTENSION_LITHO/ElementProto;"

/**
 * Gives the extension the identifier and path of each component.
 *
 * Required: they are what every filter matches. The interface's methods return the context's
 * obfuscated fields, found by the labels the context's `toString()` still prints. The height
 * constraint and swipe protector are exposed too, for feed filters: the reference patches tell
 * the home feed and related videos (no swipe protector) from the Subscriptions and library lists
 * (no height constraint) by them.
 */
internal val lithoConversionContextPatch = bytecodePatch(
    description = "Exposes YouTube's Litho conversion context to the Afterglow extension.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val toString = ConversionContextToStringFingerprint.method
        val identifierField = toString.findFieldFromToString(CONTEXT_IDENTIFIER_LABEL)
        val heightConstraintField = toString.findFieldFromToString(CONTEXT_HEIGHT_CONSTRAINT_LABEL)
        val swipeProtectorField = toString.findFieldFromToString(CONTEXT_SWIPE_PROTECTOR_LABEL)

        ConversionContextToStringFingerprint.classDef.apply {
            val pathField = fields.singleOrNull { field -> field.type == "Ljava/lang/StringBuilder;" }
                ?: throw PatchException("Conversion context $type has no single StringBuilder path field")
            if (identifierField.type != "Ljava/lang/String;" || heightConstraintField.type != "Ljava/lang/Integer;") {
                throw PatchException("Unexpected conversion context fields: $identifierField, $heightConstraintField")
            }

            interfaces.add(LITHO_CONTEXT_INTERFACE)
            addFieldGetter("afterglow_getIdentifier", "Ljava/lang/String;", identifierField)
            addFieldGetter("afterglow_getPathBuilder", "Ljava/lang/StringBuilder;", pathField)
            addFieldGetter("afterglow_getHeightConstraint", "Ljava/lang/Integer;", heightConstraintField)
            addFieldGetter("afterglow_getSwipeProtector", "Ljava/lang/Object;", swipeProtectorField)
        }
    }
}

/**
 * Hides the Litho components that the extension's filters match (`LithoFilters.java`), the
 * Android counterpart of the iOS tweak hiding feed, Shorts and player components.
 *
 * At the end of YouTube's element conversion, the extension gets the conversion context, the
 * element, and the accessibility id and text of the element's button (or ""). If it answers true,
 * the converted component is replaced by an EmptyComponent. YouTube's own conversion always runs
 * in full first, so filtering never skips work YouTube expects to happen.
 *
 * Dependencies, and why each is needed on 21.43.523:
 * - [lithoConversionContextPatch]: the identifier and path the filters match.
 * - [disableRenderNextPatch]: elements that RenderNext renders never go through the hooked
 *   conversion, so the filters could not see them. 21.35+ can render all of Home that way.
 * - [pullToRefreshFixPatch]: an EmptyComponent as the first list item makes YouTube's
 *   SwipeRefreshLayout think the list is scrolled down, which stops pull to refresh.
 *
 * Supporting hooks of the reference patches left out, because filtering works without them:
 * - Removing the list item of a hidden element (with its sticky header fixes and the conversion
 *   context's decorator getter): phone lists give each element its own row, and an EmptyComponent
 *   row has no height. Only grid layouts, such as tablets, keep an empty cell.
 * - The back-to-exit fix: when the hidden element is the first item of Home, YouTube's "scrolled
 *   down?" check (`RecyclerView.computeVerticalScrollOffset() > 0` in `Lavfs;->w()Z` and
 *   `Lavfn;->w()Z`, used by the pane's `Lmvm;->bI()Z` from `Lkoj;->ad()Z` under flag 45359221)
 *   is true even at the top, so back scrolls to the top instead of leaving. The reference re-does
 *   double back to exit, which needs the activity back press and predictive back hooks, player
 *   type tracking and its own setting, which has no iOS key. It belongs with the feature patch
 *   that first hides the top item of a feed.
 * - Flag 45782902 (`Lawax;-><init>`), which the reference turns off with its scroll fix: on
 *   21.43.523 it makes the Choreographer callback `Ljyl;->doFrame` re-post itself every frame and
 *   randomly sleep the main thread, a jank experiment unrelated to EmptyComponent.
 * - The single Litho layout thread override (works around a YouTube layout race), the native
 *   proto parsing flag 45419603 (gone in 21.43.523), the tree node hooks and the `toString()`
 *   rewrite (not used by filtering).
 */
internal val afterglowLithoFilterPatch = bytecodePatch(
    description = "Hides the Litho components that Afterglow's filters match.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    dependsOn(
        afterglowExtensionPatch,
        lithoConversionContextPatch,
        disableRenderNextPatch,
        pullToRefreshFixPatch,
    )

    execute {
        // Resolve everything before changing any method, so no match sees patched code.
        val conversionContextType = ConversionContextToStringFingerprint.classDef.type
        val encodeProto = ElementProtoEncodeFingerprint.method
        val emptyComponentBuilder = EmptyComponentBuilderFingerprint.method
        val emptyComponentField = classDefBy(emptyComponentBuilder.returnType).fields.singleOrNull()
            ?: throw PatchException("EmptyComponent builder ${emptyComponentBuilder.returnType} does not have exactly one field")
        val accessibilityId = AccessibilityIdFingerprint.instructionMatches.first().methodReference
        val accessibilityText = accessibilityTextFingerprint(accessibilityId).instructionMatches.first().methodReference
        val conversion = elementConversionFingerprint(accessibilityId.definingClass)
        val conversionMethod = conversion.method
        val nullCheckIndex = conversion.instructionMatches[0].index
        val viewModelIndex = conversion.instructionMatches[1].index
        val errorIndex = conversion.instructionMatches[3].index

        // The injected code reads p1 (component context), p2 (conversion context) and p3 (element),
        // and returns the EmptyComponent from a method declared to return a component.
        val parameters = conversionMethod.parameterTypes.map { it.toString() }
        if (parameters.size < 3 ||
            parameters[0] != emptyComponentBuilder.parameterTypes.single().toString() ||
            parameters[1] != conversionContextType
        ) {
            throw PatchException("Unexpected element conversion method: $conversionMethod")
        }
        // Upstream filters can already have inserted an EmptyComponent return before the
        // original return. The native builder's result identifies the common unfiltered path.
        val returnIndex = elementComponentReturnIndex(conversionMethod, viewModelIndex, errorIndex)
        fun extendsClass(type: String, superType: String): Boolean {
            var current: String? = type
            repeat(8) {
                if (current == superType) return true
                current = classDefByOrNull(current ?: return false)?.superclass
            }
            return false
        }
        if (!extendsClass(emptyComponentField.type, conversionMethod.returnType)) {
            throw PatchException("${emptyComponentField.type} is not a ${conversionMethod.returnType}")
        }

        // The element's proto bytes, encoded by YouTube only when a filter asks for them,
        // instead of for every component.
        ElementProtoEncodeFingerprint.classDef.apply {
            interfaces.add(ELEMENT_PROTO_INTERFACE)
            addMethod(
                "afterglow_encodeProto",
                "[B",
                2,
                """
                    invoke-virtual { p0 }, ${encodeProto.smali}
                    move-result-object v0
                    return-object v0
                """,
            )
        }

        conversionMethod.apply {
            val instructions = implementation!!.instructions
            val viewModelRegister = getInstruction<OneRegisterInstruction>(viewModelIndex).registerA
            val returnRegister = getInstruction<OneRegisterInstruction>(returnIndex).registerA

            // The accessibility strings are set before the null check and read by the hook at the
            // return, so their registers must be free at the null check and untouched until then.
            val writtenUntilReturn = (nullCheckIndex until returnIndex).flatMap { instructions[it].writtenRegisters }
            val accessibilityRegisters = getFreeRegisterProvider(
                nullCheckIndex,
                2,
                (writtenUntilReturn + viewModelRegister + returnRegister).distinct(),
            )
            val accessibilityIdRegister = accessibilityRegisters.getFreeRegister4Bit()
            val accessibilityTextRegister = accessibilityRegisters.getFreeRegister4Bit()

            val hookRegisters = getFreeRegisterProvider(
                returnIndex,
                3,
                listOf(returnRegister, accessibilityIdRegister, accessibilityTextRegister),
            )
            val contextRegister = hookRegisters.getFreeRegister4Bit()
            val elementRegister = hookRegisters.getFreeRegister4Bit()
            val resultRegister = hookRegisters.getFreeRegister4Bit()

            // Highest index first, so the lower indexes stay valid.

            // Replace the result when filtered, then use the original return. Keeping one
            // common return also lets a later upstream filter resolve and run on both paths.
            // Branches to the return now run this first.
            addInstructionsAtControlFlowLabel(
                returnIndex,
                """
                    move-object/from16 v$contextRegister, p2
                    move-object/from16 v$elementRegister, p3
                    invoke-static { v$contextRegister, v$elementRegister, v$accessibilityIdRegister, v$accessibilityTextRegister }, $LITHO_FILTER_CLASS->isFiltered(${LITHO_CONTEXT_INTERFACE}Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)Z
                    move-result v$resultRegister
                    if-eqz v$resultRegister, :afterglow_litho_keep
                    move-object/from16 v$resultRegister, p1
                    invoke-static { v$resultRegister }, ${emptyComponentBuilder.smali}
                    move-result-object v$resultRegister
                    iget-object v$resultRegister, v$resultRegister, ${emptyComponentField.smali}
                    move-object/from16 v$returnRegister, v$resultRegister
                    :afterglow_litho_keep
                    nop
                """,
            )

            // Share the native binding boundary with upstream so neither insertion can split
            // the other's getter/result pairs. Only the path through the cast runs these calls.
            addElementAccessibilityHook(
                viewModelIndex,
                accessibilityIdRegister,
                accessibilityTextRegister,
                accessibilityId,
                accessibilityText,
            )

            // Elements without a button view model pass empty strings.
            addInstructions(
                nullCheckIndex,
                """
                    const-string v$accessibilityIdRegister, ""
                    const-string v$accessibilityTextRegister, ""
                """,
            )
        }
    }
}
