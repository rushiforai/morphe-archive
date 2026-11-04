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
            "arm64-v8a" to "d7c0122ed7deddfa328243adc6593cbf13c39f726cd5cd56741e02a6a6b6b3c6",
            "armeabi-v7a" to "20d8b0e9953956ebdf1032ef59e0762109dd19337a0e5cf47c8caf9c5a4c664a",
            "x86" to "fa8c612eedf3c3cf95b9ccb5eef829270924f935bb78757ee4295a274aab794f",
            "x86_64" to "5e78306d412444fd9dfd023d62e75a62e95ec5d4aa596fe8de7f51a48e87e0bd",
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
