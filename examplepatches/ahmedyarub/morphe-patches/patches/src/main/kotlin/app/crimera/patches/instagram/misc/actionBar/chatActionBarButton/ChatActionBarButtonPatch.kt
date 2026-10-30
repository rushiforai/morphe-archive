/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.crimera.patches.instagram.misc.actionBar.chatActionBarButton

import app.crimera.patches.instagram.utils.Constants.ACTIONBAR_DESCRIPTOR
import app.ahmedyarub.patches.shared.Constants.COMPATIBILITY_INSTAGRAM
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.all.misc.resources.ResourceType
import app.morphe.patches.all.misc.resources.resourceLiteral
import app.morphe.patches.all.misc.resources.resourceMappingPatch
import app.morphe.util.indexOfFirstInstruction
import app.morphe.util.registersUsed
import com.android.tools.smali.dexlib2.Opcode
import app.morphe.library.instagram.patches.instagramExtensionPatch

object ChatActionBarBuilderFingerprint : Fingerprint(
    returnType = "V",
    filters =
        listOf(
            resourceLiteral(ResourceType.ID, "direct_thread_header"),
            resourceLiteral(ResourceType.LAYOUT, "layout_direct_thread_header"),
        ),
)

val chatActionBarButtonPatch =
    bytecodePatch(
        description = "This patch is adds support for adding buttons inside chat action bar.",
    ) {
        dependsOn(instagramExtensionPatch)
        compatibleWith(COMPATIBILITY_INSTAGRAM)
        dependsOn(resourceMappingPatch)

        execute {

            // The header container is the view the builder looks up and casts first. piko hooked it
            // after the header layout is inflated into it, but from 453 the inflated view is written
            // to the container's register, so the hook received a plain View and the builder failed
            // to verify, crashing DMs. It is hooked right after the cast instead, where the register
            // is the container, and the extension adds the button once the header is in place.
            ChatActionBarBuilderFingerprint.method.apply {
                val viewGroupIndex = indexOfFirstInstruction(Opcode.CHECK_CAST)
                val viewGroupRegister = getInstruction(viewGroupIndex).registersUsed[0]

                addInstruction(
                    viewGroupIndex + 1,
                    """
                    invoke-static {v$viewGroupRegister}, $ACTIONBAR_DESCRIPTOR->chatActionBarButton(Landroid/view/ViewGroup;)V
                    """.trimIndent(),
                )
            }
        }
    }
