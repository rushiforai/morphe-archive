package io.github.liongalahad.nuviotv.patches.shared.playback

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import io.github.liongalahad.nuviotv.patches.settings.hub.settingsUiPatch
import io.github.liongalahad.nuviotv.patches.shared.Constants.NUVIO_COMPATIBILITY

private object ProgressiveSourceFingerprint : Fingerprint(
    returnType = "Landroidx/media3/exoplayer/source/MediaSource;",
    strings = listOf("context", "url", "headers", "subtitleConfigurations", "responseHeaders",
        "MP4_SESSION engaged: single-connection chunk session (8 MB chunks) for progressive MP4 with parallel connections off"),
    custom = { method, _ -> method.parameterTypes.map(CharSequence::toString) == listOf(
        "Landroid/content/Context;", "Ljava/lang/String;", "Ljava/util/Map;", "Ljava/util/List;",
        "Ljava/lang/String;", "Ljava/util/Map;", "Ljava/lang/String;",
        "Lkotlin/jvm/functions/Function0;", "Landroidx/media3/common/MediaMetadata;"
    ) }
)

/** Shared transport infrastructure: optional providers may hand the player any supported URI. */
internal val uriDataSourcePatch = bytecodePatch {
    compatibleWith(NUVIO_COMPATIBILITY)
    dependsOn(settingsUiPatch)
    execute {
        ProgressiveSourceFingerprint.matchAll(1..1)
        ProgressiveSourceFingerprint.method.apply {
            val constructor = implementation!!.instructions.withIndex().filter { (_, instruction) ->
                val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                ref?.definingClass == "Landroidx/media3/exoplayer/source/DefaultMediaSourceFactory;" &&
                    ref.name == "<init>" && ref.parameterTypes.map(CharSequence::toString) == listOf(
                        "Landroidx/media3/datasource/DataSource\$Factory;",
                        "Landroidx/media3/extractor/ExtractorsFactory;"
                    )
            }.single()
            val register = when (val call = constructor.value) {
                is FiveRegisterInstruction -> call.registerD
                is RegisterRangeInstruction -> call.startRegister + 1
                else -> error("Unexpected media source constructor instruction")
            }
            val factory = "Landroidx/media3/datasource/DataSource\$Factory;"
            addInstructions(constructor.index, """
                invoke-static/range { v$register .. v$register }, Lio/github/liongalahad/nuviotv/extension/shared/playback/UriDataSourceFactory;->wrap($factory)$factory
                move-result-object v$register
            """)
        }
    }
}
