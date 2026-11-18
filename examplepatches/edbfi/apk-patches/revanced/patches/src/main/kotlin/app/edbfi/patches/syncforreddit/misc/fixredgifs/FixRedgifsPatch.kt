// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.syncforreddit.misc.fixredgifs

import app.edbfi.patches.syncforreddit.SYNC_PACKAGE
import app.edbfi.patches.syncforreddit.SYNC_VERSION
import app.edbfi.patches.syncforreddit.misc.extension.EXTENSION
import app.edbfi.patches.syncforreddit.misc.extension.extensionPatch
import app.edbfi.patches.syncforreddit.misc.extension.extensionSwitch
import app.edbfi.patches.syncforreddit.misc.volley.volleyHookPatch
import app.revanced.patcher.extensions.addInstructions
import app.revanced.patcher.extensions.fieldReference
import app.revanced.patcher.extensions.instructions
import app.revanced.patcher.extensions.methodReference
import app.revanced.patcher.patch.PatchException
import app.revanced.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val FACTORY = "Lcom/google/android/exoplayer2/upstream/DataSource\$Factory;"

@Suppress("unused")
val fixRedgifsPatch =
    bytecodePatch(
        name = "Fix Redgifs",
        description = "Fixes Redgifs videos not loading, Enhanced autoplay's included.",
    ) {
        compatibleWith(SYNC_PACKAGE(SYNC_VERSION))
        dependsOn(extensionPatch, volleyHookPatch)

        apply {
            checkRedgifsRequests()
            checkAutoplayUrl()
            val enable = extensionSwitch("Redgifs")
            // Enhanced autoplay sends Redgifs videos to its developer's image server. Both of the app's video sources,
            // the cached one and the plain one, get a resolver in front of their network source: the cached one's
            // upstream, as it is set, and the plain one, as it is stored.
            val method = videoSourcesMethod()
            val code = method.instructions.toList()
            val upstream = code.indices.filter {
                val reference = code[it].methodReference
                code[it].opcode == Opcode.INVOKE_VIRTUAL && reference?.name == "setUpstreamDataSourceFactory" &&
                    reference.parameterTypes == listOf(FACTORY)
            }.singleOrNull() ?: throw PatchException("Expected one setUpstreamDataSourceFactory call in ${method.name}")
            val plain = code.indices.filter {
                code[it].opcode == Opcode.IPUT_OBJECT && code[it].fieldReference?.type == FACTORY
            }.singleOrNull() ?: throw PatchException("Expected one stored DataSource.Factory in ${method.name}")
            if (code[upstream].location.labels.isNotEmpty() || code[plain].location.labels.isNotEmpty()) {
                throw PatchException("A branch lands on a video source in ${method.name}")
            }
            val upstreamFactory = (code[upstream] as FiveRegisterInstruction).registerD
            val plainFactory = (code[plain] as OneRegisterInstruction).registerA
            // Each register then holds a DataSource.Factory, no longer the concrete type: nothing may read it after.
            val nextWrite = code.getOrNull(upstream + 1)
            if (nextWrite?.opcode != Opcode.NEW_INSTANCE || (nextWrite as OneRegisterInstruction).registerA != upstreamFactory) {
                throw PatchException("The cached source's upstream is used again after it is set in ${method.name}")
            }
            if (code.getOrNull(plain + 1)?.opcode != Opcode.RETURN_VOID) {
                throw PatchException("The plain video source is used again after it is stored in ${method.name}")
            }

            // The later index first, so the earlier one stays put.
            for ((index, register) in listOf(plain to plainFactory, upstream to upstreamFactory).sortedByDescending { it.first }) {
                method.addInstructions(
                    index,
                    """
                        invoke-static/range { v$register .. v$register }, $EXTENSION/Redgifs;->autoplay($FACTORY)$FACTORY
                        move-result-object v$register
                    """,
                )
            }
            enable.apply()
        }
    }
