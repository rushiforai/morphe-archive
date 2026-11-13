@file:Suppress("unused")
package app.bugsmith.patches.chessbook

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.rawResourcePatch
import java.security.MessageDigest

/** Version-pinned local presentation/admission decisions; never mutates server identity. */
object ChessbookEdits {
    const val ASSET = "assets/public/assets/app_state-CgX_LbOL.js"
    const val CONFIG = "assets/capacitor.config.json"
    const val ASSET_SHA = "70e8b3c06ee11c2ef602ecbbe7297092b554ceffe72a3c5538634c420af00286"
    const val CONFIG_SHA = "c7011861eab490dfe8f504c6166bc6da33cdf7b41834a6571627b71d8a85a9d9"

    fun transform(asset: ByteArray, config: ByteArray): Pair<ByteArray, ByteArray> {
        require(sha256(asset) == ASSET_SHA) { "Chessbook asset SHA-256 mismatch; expected original 1.3.54 asset (already patched inputs rejected)" }
        require(sha256(config) == CONFIG_SHA) { "Chessbook config SHA-256 mismatch; expected original 1.3.54 config" }
        val source = asset.toString(Charsets.UTF_8)
        // CapacitorUpdater autoUpdate -> false so the server never silently replaces the locally
        // patched JS bundle with an OTA asset (which would reintroduce gates and require network).
        // updateUrl skeleton is left intact; only the auto-download + auto-apply flag flips.
        val configSource = config.toString(Charsets.UTF_8)
        val configEdits = listOf(
            "\"autoUpdate\": true" to "\"autoUpdate\": false",
        )
        configEdits.forEach { (old, _) -> require(configSource.split(old).size == 2) { "Expected exactly one Chessbook config anchor: $old" } }
        var newConfig = configSource
        configEdits.forEach { (old, new) -> newConfig = newConfig.replace(old, new) }
        val skip = "pt?(\$().animateSidebar(`right`),\$().clearViews()):X().askAboutSourceOrEndOnboarding()"
        val edits = listOf(
            "get actions(){return t()?[{style:`primary`,onPress:()=>{Q(e=>{\$().pushView(hj,{props:{authType:`register`}})})},text:`Skip this step for now`}]:[]}" to
                "get actions(){return t()?[{style:`primary`,onPress:()=>{Q(e=>{$skip})},text:`Skip this step for now`}]:[]}",
            "K(`onboarding.practice_complete.continue`),e.repertoireState.updateRepertoireStructures(),e.userState.isConnectedToExternal()?\$().pushView(hj,{props:{authType:`register`}}):\$().pushView(Tj)" to
                "K(`onboarding.practice_complete.continue`),e.repertoireState.updateRepertoireStructures(),$skip",
            "Ay=()=>[100,`my-moves`]" to "Ay=()=>[Number.POSITIVE_INFINITY,`my-moves`]",
            "g=Zn(()=>{let[e]=r(e=>e);return!e.repertoires||Y().isSubscribed()||e.onboarding.isOnboarding?Yb:\$b(tu(e.repertoires),100)})" to "g=Zn(()=>Yb)",
        )
        edits.forEach { (old, _) -> require(source.split(old).size == 2) { "Expected exactly one Chessbook anchor: $old" } }
        var result = source
        edits.forEach { (old, replacement) -> result = result.replace(old, replacement) }
        return result.toByteArray(Charsets.UTF_8) to newConfig.toByteArray(Charsets.UTF_8)
    }
    private fun sha256(bytes: ByteArray) = MessageDigest.getInstance("SHA-256").digest(bytes).joinToString("") { "%02x".format(it.toInt() and 255) }
}

val chessbookLocalGatesPatch = rawResourcePatch(
    name = "Chessbook local gates",
    description = "Remove local move admission/locks, skip optional onboarding account/link prompts and disable automatic OTA. Server auth/billing and explicit login remain unchanged.",
    default = false,
) {
    compatibleWith(Compatibility(
        packageName = "com.chessbook.android",
        name = "Chessbook",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x202425,
        targets = listOf(AppTarget(version = "1.3.54"))
    ))
    execute {
        require(packageMetadata.packageName == "com.chessbook.android" && packageMetadata.versionName == "1.3.54" && packageMetadata.versionCode == "244") { "Requires Chessbook 1.3.54 (244)" }
        val assetFile = get(ChessbookEdits.ASSET)
        val configFile = get(ChessbookEdits.CONFIG)
        // Read and validate BOTH complete inputs and every anchor before the first write.
        val (asset, config) = ChessbookEdits.transform(assetFile.readBytes(), configFile.readBytes())
        assetFile.writeBytes(asset)
        configFile.writeBytes(config)
    }
}
