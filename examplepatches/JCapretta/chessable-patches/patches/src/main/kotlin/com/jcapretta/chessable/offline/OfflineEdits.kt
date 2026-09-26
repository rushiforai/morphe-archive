package com.jcapretta.chessable.offline

import com.jcapretta.chessable.hermes.ChessableEdits
import com.jcapretta.chessable.hermes.HermesEdit
import com.jcapretta.chessable.hermes.hexBytes

internal object OfflineEdits {
    val edits = listOf(
        // Offline authorization: r7 is false here after the network-state guard.
        // Continue normal cached-JWT authorization, retaining sign-out checks.
        edit("Offline startup", 0x6c3712, "903006", "923007"),
        // The bypassed PRO error block becomes a storage-decoding trampoline.
        // Call the existing JSON.parse callback (#10177), copy r6 to r3, then
        // rejoin setJwt at function +0xde. Trailing Mov r9,r9 pads dead space.
        edit("Decode stored session", 0x6c3715, "2e0604039229062e0705002e0805016e060d49060806530607010637070605c3eb730663125306070106", "640804c12753060801060803068e6c080909080909080909080909080909080909080909080909080909"),
        // AsyncStorage's successful ResumeGenerator leaves r8 false. Decode only
        // that persisted value, never an already active token or a rejected read.
        edit("Restore decoded session", 0x6c378b, "080306", "928a08"),
        // Network errors: retain the native offline-capable route allowlist for all users.
        edit("Offline route recovery", 0x5fe554, "922702", "080202"),
        // Page effects must permit local course data while disconnected.
        edit("Offline dashboard", 0x7c4db1, "2e010012", "78017801"),
        edit("Offline dashboard refresh", 0x7c49a4, "2e000112", "78007800"),
        edit("Offline course page", 0x73b75a, "2e010018", "78017801"),
        // Show the existing network transition banner for every account tier.
        edit("Offline status banner", 0x752ae4, "37000009b5c5", "780078007800"),
        // DownloadCourseItem callback: select native download instead of PRO navigation.
        // Two LoadConstTrue r1 instructions preserve the four-byte environment read.
        edit("Offline course download", 0x7ca86a, "2e010004", "78017801"),
        // DownloadCourseItem: r12 is true immediately before this Not instruction.
        edit("Offline download badge", 0x7ca5af, "0b0808", "0b080c"),
        // Video DownloadControls: retain disabled/network/download-state checks,
        // while using the native full-width button without the PRO badge.
        edit("Offline video controls", 0x74c461, "3708000b08eb", "780878087808"),
        // startDownload: enter the existing quality selection and Wi-Fi checks.
        // Video URLs still come from the account's authorized course response.
        edit("Offline video download", 0x7505e1, "2e03040a", "78037803"),
        // OfflinePlaceholder: show the existing download-while-online guidance.
        edit("Offline video placeholder", 0x74c08d, "370c0002b5c5", "780c780c780c"),
    )

    fun apply(bundle: ByteArray): ByteArray = ChessableEdits.apply(bundle, edits)

    private fun edit(name: String, offset: Int, before: String, after: String) =
        HermesEdit(name, offset, before.hexBytes(), after.hexBytes())
}
