package app.morphe.patches.chmate

import app.morphe.patcher.patch.filePathOption
import app.morphe.patcher.patch.resourcePatch
import java.security.MessageDigest
import org.w3c.dom.Element

private const val modelPath = "assets/haiagaru/image-moderation/model.onnx"
private val moderationHashes = mapOf(
        modelPath to "8c28c49d9075f3ad15ebdc2961f02d5b3f99be944815b848b49c9f0e6f3fb689",
        "lib/arm64-v8a/libonnxruntime.so" to "e40f09d07dc53726b8bfbf48a7907673b8f86718a057655a62790a39874a7302",
        "lib/arm64-v8a/libonnxruntime4j_jni.so" to "2cc3f16ab527959a81b572adebcfb71a25ea4b8547c9b92d705b423e9c822d39",
        "lib/armeabi-v7a/libonnxruntime.so" to "57048b8d54896d16355ee367bfc129c5925468ae503b681b8d0cd49ceefa468e",
        "lib/armeabi-v7a/libonnxruntime4j_jni.so" to "d977cebd40e780d1ece419c182e27610e74e04ad3f0244e9acef887f0ffb0247",
        "lib/x86/libonnxruntime.so" to "213d91ebb0cfd511c18c0057c69145de0abc6bdc9c63429bf04dcdeaf3fd861a",
        "lib/x86/libonnxruntime4j_jni.so" to "375c7e60e5f11ac35f38b24682baa8e82d63d104c9bb3868db388118901dc45f",
        "lib/x86_64/libonnxruntime.so" to "972c17c056eaae946a415d9efdd8018b729639974df075e495f0092441478fb7",
        "lib/x86_64/libonnxruntime4j_jni.so" to "b8d1b251b7d5606cf5caa7db9738353c08efc4090ac90ca2aaab449bc263a10b",
        "chmate191/arm64-v8a/libtensorflowlite_jni.so" to "430a5cc57c285e9f7a8dede904eb998ad50c634e592baf7f06f8a896b2dea557",
        "chmate191/armeabi-v7a/libtensorflowlite_jni.so" to "ba8c1f290d797820695231f86a8de16c74d1fa10595ea33d9397791f0f93d52b",
        "chmate191/x86/libtensorflowlite_jni.so" to "1a8bad7f404050f259b9224e572106beb1326bc1c66c9856b4ecc58f5358df74",
        "chmate191/x86_64/libtensorflowlite_jni.so" to "a7597671e6685259cd27959040959786c2c5e8f5dfd8303746554b3644315f5b",
)

@Suppress("unused")
val imageModerationPatch = resourcePatch(
    name = "成人向け・グロ画像の自動検出",
    description = "専用ZIPを展開せず選択します。導入手順: $OPTIONAL_ASSET_GUIDE",
    default = false,
) {
    compatibleWith(chMateCompatibility)
    dependsOn(haiagaruPatch)
    val bundle = filePathOption(
        key = "imageModerationFile", default = "", title = "haiagaru-image-moderation.zip",
        description = "haiagaru-image-moderation.zip、またはVPNも収録したhaiagaru-image-moderation-vpn.zipを選択してください。",
        allowedExtensions = listOf("zip"),
    )
    val modelFile = filePathOption(
        key = "imageModerationModelFile", default = "", title = "個別指定: 画像検出モデルZIP",
        description = "一括ZIPを使わない場合に、haiagaru-image-moderation-model.zipを選択します。",
        allowedExtensions = listOf("zip"),
    )
    val runtimeFile = filePathOption(
        key = "imageModerationRuntimeFile", default = "", title = "個別指定: ONNX Runtime ZIP",
        description = "個別指定ではモデルZIPとhaiagaru-image-moderation-runtime.zipの両方が必要です。191の標準Image NG修正ZIPはHaiagaru側で指定できます。",
        allowedExtensions = listOf("zip"),
    )
    execute {
        val combined=bundle.value.orEmpty()
        val model=modelFile.value.orEmpty()
        val runtime=runtimeFile.value.orEmpty()
        check(combined.isBlank() || model.isBlank()&&runtime.isBlank()) { "一括ZIPと個別ZIPはどちらか一方を指定してください。" }
        check(combined.isNotBlank() || model.isNotBlank()&&runtime.isNotBlank()) { "一括ZIP、またはモデルZIPとONNX Runtime ZIPを両方選んでください。" }
        val archives=if(combined.isNotBlank())listOf(combined) else listOf(model,runtime)
        val seen=mutableSetOf<String>()
        for(archive in archives)withImageModerationArchive(archive) { zip ->
            val items = zip.entries().asSequence().filterNot { it.isDirectory }.groupBy { it.name }
            val notices = setOf("assets/haiagaru/image-moderation/ONNX-LICENSE.txt",
                "assets/haiagaru/image-moderation/ONNX-ThirdPartyNotices.txt",
                "assets/haiagaru/image-moderation/MODEL-NOTICE.txt",
                "assets/haiagaru/image-moderation/SWIFTFORMER-LICENSE.txt")
            val files = moderationHashes.keys + notices
            val required=if(combined.isNotBlank())files else if(archive==model)
                setOf(modelPath,"assets/haiagaru/image-moderation/MODEL-NOTICE.txt","assets/haiagaru/image-moderation/SWIFTFORMER-LICENSE.txt")
                else files.filterNot { it.startsWith("chmate191/") || it == modelPath || it.endsWith("/MODEL-NOTICE.txt") || it.endsWith("/SWIFTFORMER-LICENSE.txt") }.toSet()
            val includesVpn = combined.isNotBlank() && items.keys.any { it.startsWith("vpn/") }
            val expectedEntries = if (includesVpn) required + IMAGE_VPN_BUNDLE_ENTRIES else required
            check(items.keys == expectedEntries && items.values.all { it.size == 1 } && required.all(seen::add)) {
                "画像検出用ZIPの内容が一致しません。"
            }
            for (name in required) {
                val entry = items.getValue(name).single()
                check(entry.size in 1..(32L * 1024 * 1024)) { "画像検出用ZIPのサイズが不正です: $name" }
                val bytes = zip.getInputStream(entry).use { it.readLimitedBytes(entry.size.toInt() + 1) }
                check(bytes.size.toLong() == entry.size) { "画像検出用ZIPのサイズが不正です: $name" }
                moderationHashes[name]?.let { expected ->
                    val hash = MessageDigest.getInstance("SHA-256").digest(bytes).joinToString("") { "%02x".format(it) }
                    check(hash == expected) { "画像検出用ZIPのファイルが一致しません: $name" }
                }
                val legacy = name.startsWith("chmate191/")
                if (legacy && packageMetadata.versionName != "0.8.10.191 dev") continue
                val target = if (legacy) "lib/" + name.removePrefix("chmate191/") else name
                get(target).apply {
                    check(legacy || !exists()) { "画像検出用ファイルが元APKに存在します: $target" }
                    parentFile.mkdirs()
                    writeBytes(bytes)
                }
            }
            if (combined.isNotBlank() && packageMetadata.versionName == "0.8.10.191 dev")
                get("assets/haiagaru/image-ng-runtime-fixed").apply { parentFile.mkdirs(); writeText("1") }
        }
        document("AndroidManifest.xml").use { manifest ->
            (manifest.getElementsByTagName("application").item(0) as Element).setAttribute("android:extractNativeLibs", "true")
        }
    }
}
