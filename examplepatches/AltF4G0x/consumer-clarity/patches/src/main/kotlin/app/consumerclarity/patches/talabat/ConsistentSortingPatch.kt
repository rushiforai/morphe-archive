package app.consumerclarity.patches.talabat

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch

private const val NATIVE_LIBRARY = "lib/arm64-v8a/libconsumerclarity.so"
private const val CATALOG_ASSET = "assets/consumerclarity/settings.tsv"

private object NativeLibrary

private object FlutterLandingScreenConstructor : Fingerprint(
    definingClass = "Lcom/talabat/FlutterLandingScreen;",
    name = "<init>",
    returnType = "V",
    parameters = emptyList(),
)

private val sortingNativeLoaderPatch = bytecodePatch {
    compatibleWith(TALABAT_COMPATIBILITY)
    extendWith("extensions/extension.mpe")

    execute {
        FlutterLandingScreenConstructor.method.addInstructions(
            1,
            """
                const-string v0, "consumerclarity"
                invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
            """,
        )
    }
}

@Suppress("unused")
val consistentSortingPatch = resourcePatch(
    name = "Consistent restaurant and review sorting",
    description = "Sorts restaurants by organic placement, rating and ID, and reviews by date and ID. " +
        "Requires Talabat 14.4.0 (2368) on ARM64.",
    default = true,
) {
    compatibleWith(TALABAT_COMPATIBILITY)
    dependsOn(settingsIntegrationPatch, sortingNativeLoaderPatch)

    execute {
        get(CATALOG_ASSET).registerSetting(
            "sorting_controls",
            "Restaurant and review ordering",
            "Choose sponsored placement and deterministic review ordering.",
            "Discovery",
            kind = "sorting",
        )
        decode("AndroidManifest.xml")
        document("AndroidManifest.xml").use { manifest ->
            val application = manifest.getElementsByTagName("application").item(0) as org.w3c.dom.Element
            application.setAttributeNS("http://schemas.android.com/apk/res/android", "android:extractNativeLibs", "true")
        }
        NativeLibrary::class.java.getResourceAsStream("/$NATIVE_LIBRARY")!!.use { library ->
            get(NATIVE_LIBRARY, false).writeBytes(library.readBytes())
        }
    }
}
