package app.morphe.patches.chmate

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import com.android.tools.smali.dexlib2.iface.ClassDef
import org.w3c.dom.Element

private val videoViewerGesturesPatch = bytecodePatch {
    dependsOn(haiagaruPatch)
    execute {
        val layouts = mutableListOf<ClassDef>()
        boundClassForEach("VideoViewerPatch:1") { cls ->
            if (cls.superclass == "Landroid/widget/LinearLayout;" && cls.methods.any {
                it.name == "setOnGestureListener"
            }) layouts.add(cls)
        }
        check(layouts.size == 1) { "Video gesture layout changed (${layouts.size})" }
        val fields = layouts.single().fields.map { it.type }.toSet()
        val recognizers = mutableListOf<ClassDef>()
        boundClassForEach("VideoViewerPatch:2") { cls ->
            if (cls.type in fields && cls.methods.any {
                it.parameterTypes == listOf("Landroid/view/MotionEvent;") && it.returnType == "Z"
            } && cls.methods.any {
                it.name == "<init>" && it.parameterTypes.size == 2
                    && it.parameterTypes[0] == "Landroid/content/Context;"
            }) recognizers.add(cls)
        }
        check(recognizers.size == 1) { "Video gesture recognizer changed (${recognizers.size})" }
        val name = recognizers.single().type.removePrefix("L").removeSuffix(";").replace('/', '.')
        val bridge = mutableClassDefBy("Lapp/morphe/extension/chmate/VideoViewerGestures;")
            .methods.single { it.name == "recognizerClassName" }
        bridge.replaceInstruction(0, "const-string v0, \"$name\"")
    }
}

@Suppress("unused")
val videoViewerPatch = resourcePatch(
    name = "動画専用ビューア",
    description = "対応する動画をChMate内で再生します。初期状態は未選択。導入後もHaiagaru設定でオン／オフできます。未選択の場合は従来の動画表示・外部アプリ起動を維持します。",
    default = false,
) {
    compatibleWith(Compatibility(
        name = "ChMate",
        packageName = "jp.co.airfront.android.a2chMate",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x607D8B,
        signatures = setOf("7dd84d97df4666fbc8188b8d6167ce59314636997f0edae82d685fffda4059d2"),
        targets = listOf(
            AppTarget(version = "0.8.10.191 dev", minSdk = 21),
            AppTarget(version = "0.8.10.226 dev", minSdk = 23),
            AppTarget(version = "0.8.10.242 dev", minSdk = 23),
        ),
    ))
    dependsOn(videoViewerGesturesPatch, gifViewerRoutingPatch)
    execute {
        get("assets").resolve("haiagaru/video-viewer/installed").apply {
            parentFile.mkdirs()
            writeText("1")
        }
        document("AndroidManifest.xml").use { manifest ->
            val application = manifest.getElementsByTagName("application").item(0) as Element
            for (activity in listOf("VideoViewerActivity", "YouTubeViewerActivity", "GifViewerActivity")) application.appendChild(manifest.createElement("activity").apply {
                val ns = "http://schemas.android.com/apk/res/android"
                setAttributeNS(ns, "android:name", "app.morphe.extension.chmate.$activity")
                setAttributeNS(ns, "android:exported", "false")
                setAttributeNS(ns, "android:enableOnBackInvokedCallback", "true")
                setAttributeNS(ns, "android:configChanges", "orientation|screenSize")
                setAttributeNS(ns, "android:theme", "@android:style/Theme.Material.NoActionBar")
            })
        }
    }
}
