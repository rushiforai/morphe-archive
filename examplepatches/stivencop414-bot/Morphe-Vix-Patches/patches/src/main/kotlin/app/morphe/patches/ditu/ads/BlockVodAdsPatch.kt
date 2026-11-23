package app.morphe.patches.ditu.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.addInstruction
import com.android.tools.smali.dexlib2.AccessFlags

private object VodItemFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Landroidx/media3/common/MediaItem;",
    parameters = listOf("Landroidx/media3/common/MediaItem;", "Landroidx/media3/common/MediaItem\$a;", "Z", "Z"),
    filters = listOf(
        string("mediaItem"),
        methodCall(definingClass = "Landroidx/media3/common/MediaItem\$b;", name = "setAdsConfiguration"),
        methodCall(definingClass = "Landroidx/media3/common/MediaItem\$b;", name = "setUri"),
    ),
)

@Suppress("unused")
val blockVodClientAdsPatch = patch(
    name = "Block client-side VOD ads",
    description = "Keeps the original VOD media item instead of attaching the client-side ad configuration. Does not remove stitched server-side ads.",
    default = true,
) {
    category("Ads")
    compatibleWith(*AppCompatibilities.ditu())
    execute {
        val matches = VodItemFingerprint.matchAll().toList()
        if (matches.size != 1) throw PatchException("Expected exactly one VOD media-item builder; found ${matches.size}")
        matches.single().method.addInstruction(0, "return-object p1")
    }
}
