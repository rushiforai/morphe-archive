package app.morphe.patches.chmate

import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.filePathOption
import org.w3c.dom.Element

private object ImageVpnResources

/** Opt-in image VPN. Actual image-path and complete redirect/leak tests are still pending. */
@Suppress("unused")
val imageVpnResourcesPatch = resourcePatch(
    name = "画像取得専用VPN（実験用・検証中）",
    description = "必要な方だけ選択してください。Releaseのhaiagaru-image-vpn-v2.zipを保存: $OPTIONAL_ASSET_VPN_ZIP_URL → 下のオプションで選択 → パッチ適用後にHaiagaru設定でVPNを有効化。Image NG用ZIPとは別です。展開不要。導入・ソース: $OPTIONAL_ASSET_GUIDE",
    default = false,
) {
    compatibleWith(chMateCompatibility)
    dependsOn(imageVpnTransportPatch)
    val libraryFile = filePathOption(
        key = "imageVpnLibraryFile", default = "", title = "VPN用haiagaru-image-vpn-v2.zip／image-stack.aarを選択",
        description = "VPN専用ファイル: $OPTIONAL_ASSET_VPN_ZIP_URL Image NG用haiagaru-image-ng.zipは選択しないでください。従来AARも利用可能: $OPTIONAL_ASSET_VPN_URL 展開不要。$OPTIONAL_ASSET_GUIDE",
        allowedExtensions = listOf("zip", "aar"),
    )
    execute {
        val hashes = mapOf(
            "arm64-v8a" to "6602ba77268630df803bde296a8aea57cf81e0e31222dd4c08ccebd06729c06d",
            "armeabi-v7a" to "65216b5bd1655ebec5d1b2069a4ce0ed32855f7b554016d8e1f6335072c0bff3",
            "x86" to "f39262e98244c8b69c553fd4c2e184bfd276d2afba6d87740de21772543b0e1a",
            "x86_64" to "bd94516b9791a79154aeedca5b89132dd562c5c509d056f0d9ac0566c9f8910e",
        )
        check(libraryFile.value.orEmpty().isNotBlank()) { "VPNライブラリを選択するか、この任意パッチのチェックを外してください。$OPTIONAL_ASSET_GUIDE" }
        val libraries = optionalLibraries(libraryFile.value.orEmpty(), hashes, "libgojni.so")
        libraries.forEach { (abi, bytes) ->
            get("lib").resolve("$abi/libgojni.so").apply {
                check(!exists()) { "Image VPN JNI library collides with the input APK: $abi" }
                parentFile.mkdirs()
                writeBytes(bytes)
            }
        }
        val notices = listOf("open-sstp/LICENSE", "image-stack/NOTICE.md") +
            listOf("go", "gvisor", "btree", "x-mobile", "x-sys", "x-time").map { "image-stack/$it/LICENSE" }
        notices.forEach { notice ->
            val path = "/chmate/image-vpn/licenses/$notice"
            val bytes = requireNotNull(ImageVpnResources::class.java.getResourceAsStream(path)).use { it.readBytes() }
            get("assets").resolve("haiagaru/image-vpn/licenses/$notice").apply {
                parentFile.mkdirs()
                writeBytes(bytes)
            }
        }
        get("assets").resolve("haiagaru/image-vpn/installed").apply {
            parentFile.mkdirs()
            writeText("1")
        }
        // Native ELF LOAD segments were verified with 16KB alignment. Extraction also avoids
        // relying on a manager's ZIP native-entry alignment for Android 15+ devices.
        document("AndroidManifest.xml").use { manifest ->
            val application = manifest.getElementsByTagName("application").item(0) as Element
            application.setAttribute("android:extractNativeLibs", "true")
        }
    }
}
