package patches.wuplaymobile

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.*
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import org.w3c.dom.Element
import patches.shared.originalInput
import patches.shared.uniqueMatch

private const val ANDROID_NS = "http://schemas.android.com/apk/res/android"
private val wuplayMobile = Compatibility(
    name = "WuPlay Mobile", packageName = "app.wuplay.android", apkFileType = ApkFileType.APK,
    formFactor = FormFactor.MOBILE,
    signatures = setOf("ae406f7d398ae1ae418238f83d07554e6aa6cf5855b66edb9c4c85995d435e7f"),
    targets = listOf(AppTarget(version = "0.1.9-alpha", versionCode = 9, minSdk = 24)),
)
private val mobileInput = originalInput(wuplayMobile)
private val carInterfaceResources = resourcePatch {
    dependsOn(mobileInput)
    execute {
        document("AndroidManifest.xml").use { xml ->
            val root = xml.documentElement
            val application = xml.getElementsByTagName("application").item(0) as Element
            val component = "nl.johninnl.wuplaycar.WuplayCarService"
            check((0 until xml.getElementsByTagName("service").length).none {
                (xml.getElementsByTagName("service").item(it) as Element).getAttributeNS(ANDROID_NS,"name") == component
            }) { "WuPlay car interface already installed" }
            for (permission in listOf("FOREGROUND_SERVICE", "FOREGROUND_SERVICE_MEDIA_PLAYBACK", "POST_NOTIFICATIONS")) {
                val node = xml.createElement("uses-permission")
                node.setAttributeNS(ANDROID_NS,"android:name","android.permission.$permission")
                root.appendChild(node)
            }
            for (permission in listOf("ACCESS_SURFACE", "NAVIGATION_TEMPLATES")) {
                val node = xml.createElement("uses-permission")
                node.setAttributeNS(ANDROID_NS,"android:name","androidx.car.app.$permission")
                root.appendChild(node)
            }
            val queries = (xml.getElementsByTagName("queries").item(0) as? Element)
                ?: xml.createElement("queries").also { root.appendChild(it) }
            for (host in listOf("app.seb3thehacker.gearslip", "app.seb3thehacker.gearslip.dev", "app.johninnl.drivedeck", "app.johninnl.drivedeck.dev")) {
                val node = xml.createElement("package")
                node.setAttributeNS(ANDROID_NS,"android:name",host); queries.appendChild(node)
            }
            val service = xml.createElement("service")
            service.setAttributeNS(ANDROID_NS,"android:name",component)
            service.setAttributeNS(ANDROID_NS,"android:exported","true")
            service.setAttributeNS(ANDROID_NS,"android:label","WuPlay Car")
            service.setAttributeNS(ANDROID_NS,"android:foregroundServiceType","mediaPlayback")
            val filter = xml.createElement("intent-filter")
            val action = xml.createElement("action"); action.setAttributeNS(ANDROID_NS,"android:name","androidx.car.app.CarAppService")
            val category = xml.createElement("category"); category.setAttributeNS(ANDROID_NS,"android:name","androidx.car.app.category.NAVIGATION")
            filter.appendChild(action); filter.appendChild(category); service.appendChild(filter); application.appendChild(service)
            val artwork = xml.createElement("provider")
            artwork.setAttributeNS(ANDROID_NS,"android:name","nl.johninnl.wuplaycar.ArtworkProvider")
            artwork.setAttributeNS(ANDROID_NS,"android:authorities","app.wuplay.android.morphe.car.art")
            artwork.setAttributeNS(ANDROID_NS,"android:exported","false")
            artwork.setAttributeNS(ANDROID_NS,"android:grantUriPermissions","true")
            application.appendChild(artwork)
            val api = xml.createElement("meta-data")
            api.setAttributeNS(ANDROID_NS,"android:name","androidx.car.app.minCarApiLevel"); api.setAttributeNS(ANDROID_NS,"android:value","5")
            application.appendChild(api)
        }
        for (name in listOf("NOTICE.txt", "Apache-2.0.txt")) {
            val destination = get("assets/morphe-wuplay-car/$name")
            destination.parentFile.mkdirs()
            MobileIdentity::class.java.getResourceAsStream("/licenses/wuplay-car/$name").use { source ->
                checkNotNull(source) { "Car interface license resource missing" }
                destination.outputStream().use { output -> source.copyTo(output) }
            }
        }
    }
}

@Suppress("unused")
val wuplayGearslip = bytecodePatch(
    name = "Add Gearslip car interface",
    description = "Browse Home poster carousels and season/episode shelves in Gearslip, with automatic direct-source selection within 10 Mbps. Uses your WuPlay profile, add-ons and native playback without root or phone-screen mirroring.",
    default = false,
) {
    compatibleWith(wuplayMobile)
    dependsOn(mobileInput, carInterfaceResources)
    extendWith("extensions/wuplay-gearslip.mpe")
    execute {
        val container = Fingerprint(definingClass = "Lapp/wuplay/androidtv/AppContainer;", name = "<init>",
            parameters = listOf("Lapp/wuplay/android/MobileApplication;", "Ljava/lang/Integer;"), returnType = "V").uniqueMatch().method
        MobileIdentity.retain(container)
        // R8 stripped the unused public IconCompat wire API from this exact input.
        // Add it to the existing class; never replace or duplicate AndroidX Core.
        val iconType = "Landroidx/core/graphics/drawable/IconCompat;"
        val icon = mutableClassDefBy(iconType)
        check(icon.fields.any { it.name == "mType" && it.type == "I" } &&
            icon.fields.any { it.name == "mObj1" && it.type == "Ljava/lang/Object;" }) { "WuPlay artwork icon ABI changed" }
        for ((name, result, helper) in listOf(
            Triple("getType", "I", "type"), Triple("getUri", "Landroid/net/Uri;", "uri"),
            Triple("toBundle", "Landroid/os/Bundle;", "bundle"),
            Triple("createFromBundle", iconType, "fromBundle")
        )) {
            val isStatic = name == "createFromBundle"
            val argument = if (isStatic) "Landroid/os/Bundle;" else iconType
            check(icon.methods.none { it.name == name }) { "WuPlay artwork icon method already present: $name" }
            val method = MutableMethod(ImmutableMethod(iconType, name,
                if (isStatic) listOf(ImmutableMethodParameter(argument, emptySet(), null)) else emptyList(),
                result, if (isStatic) 9 else 1, emptySet(), emptySet(),
                ImmutableMethodImplementation(2, emptyList(), emptyList(), emptyList())))
            val objectResult = result != "I"
            method.addInstructions(0, """
                invoke-static/range { p0 .. p0 }, Lnl/johninnl/wuplaycar/ArtworkIcons;->$helper($argument)$result
                ${if (objectResult) "move-result-object" else "move-result"} v0
                ${if (objectResult) "return-object" else "return"} v0
            """)
            icon.methods.add(method)
        }
        val intrinsicsType = "Lkotlin/jvm/internal/Intrinsics;"
        Fingerprint(definingClass = intrinsicsType, name = "checkNotNullParameter",
            parameters = listOf("Ljava/lang/String;", "Ljava/lang/Object;"), returnType = "V").uniqueMatch()
        val intrinsics = mutableClassDefBy(intrinsicsType)
        check(intrinsics.methods.none { it.name == "checkNotNullParameter" && it.parameterTypes.toList() == listOf("Ljava/lang/Object;", "Ljava/lang/String;") }) { "WuPlay Kotlin ABI already has the car SDK overload" }
        val nullCheck = MutableMethod(ImmutableMethod(intrinsicsType, "checkNotNullParameter",
            listOf(ImmutableMethodParameter("Ljava/lang/Object;", emptySet(), null), ImmutableMethodParameter("Ljava/lang/String;", emptySet(), null)),
            "V", 9, emptySet(), emptySet(), ImmutableMethodImplementation(2, emptyList(), emptyList(), emptyList())))
        nullCheck.addInstructions(0, """
            invoke-static { p1, p0 }, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/String;Ljava/lang/Object;)V
            return-void
        """)
        intrinsics.methods.add(nullCheck)
        val continuation = "Lkotlin/coroutines/jvm/internal/ContinuationImpl;"
        val classes = mapOf(
            "Lapp/wuplay/android/MobileApplication;" to mapOf("container" to "Lapp/wuplay/androidtv/AppContainer;"),
            "Lapp/wuplay/androidtv/AppContainer;" to mapOf("catalogRepository" to "Lapp/wuplay/androidtv/data/CatalogRepositoryImpl;", "addonRepository" to "Lapp/wuplay/androidtv/data/AddonRepository;"),
            "Lapp/wuplay/androidtv/domain/stremio/MetaResponse;" to mapOf("meta" to "Lapp/wuplay/androidtv/domain/stremio/Meta;"),
            "Lapp/wuplay/androidtv/domain/stremio/Meta;" to mapOf("videos" to "Ljava/util/List;", "description" to "Ljava/lang/String;"),
            "Lapp/wuplay/androidtv/domain/stremio/Video;" to mapOf("season" to "Ljava/lang/Integer;", "episode" to "Ljava/lang/Integer;", "runtime" to "Ljava/lang/Integer;", "thumbnail" to "Ljava/lang/String;"),
            "Landroidx/media3/common/TrackSelectionParameters${'$'}Builder;" to mapOf("maxVideoBitrate" to "I", "maxAudioBitrate" to "I"),
            "Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector${'$'}Parameters${'$'}Builder;" to mapOf("exceedVideoConstraintsIfNecessary" to "Z", "exceedAudioConstraintsIfNecessary" to "Z"),
            "Lapp/wuplay/androidtv/domain/model/Profile;" to mapOf("profileKey" to "Ljava/lang/String;", "hasPinSet" to "Z"),
            "Lapp/wuplay/androidtv/data/CatalogRepositoryImpl;" to mapOf("definitions" to "Lkotlinx/coroutines/flow/Flow;", "screens" to "Lkotlinx/coroutines/flow/Flow;"),
            "Lapp/wuplay/androidtv/domain/model/SidebarScreen;" to mapOf("systemKey" to "Ljava/lang/String;", "rowCatalogIds" to "Ljava/util/List;"),
            "Lapp/wuplay/androidtv/domain/model/CatalogDefinition;" to mapOf("id" to "I", "showHome" to "Z", "homeOrder" to "I", "source" to "Ljava/lang/String;"),
            "Lapp/wuplay/androidtv/data/UserSettingsRepositoryImpl;" to mapOf("activeProfileId" to "Lkotlinx/coroutines/flow/Flow;", "activeProfile" to "Lkotlinx/coroutines/flow/Flow;"),
            "Lapp/wuplay/androidtv/data/AddonRepository;" to mapOf("enabledAddons" to "Lkotlinx/coroutines/flow/Flow;"),
        )
        for ((owner, fields) in classes) for ((name,type) in fields) {
            check(mutableClassDefBy(owner).fields.count { it.name == name && it.type == type } == 1) { "WuPlay car ABI changed: $owner->$name" }
        }
        Fingerprint(definingClass = "Lapp/wuplay/androidtv/data/CatalogRepositoryImpl;", name = "fetchContent-BWLJW6A",
            parameters = listOf("Lapp/wuplay/androidtv/domain/model/CatalogDefinition;", "Ljava/util/Map;", "Ljava/lang/String;", continuation), returnType = "Ljava/lang/Object;").uniqueMatch()
        Fingerprint(definingClass = "Lapp/wuplay/androidtv/data/AddonRepository;", name = "fetchStreams-hUnOzRk",
            parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/util/Map;", "Ljava/lang/Integer;", continuation), returnType = "Ljava/lang/Object;").uniqueMatch()
        Fingerprint(definingClass = "Lapp/wuplay/androidtv/playback/PlaybackFacade;", name = "buildPlayer\$default",
            parameters = listOf("Lapp/wuplay/androidtv/playback/PlaybackFacade;", "Lapp/wuplay/androidtv/playback/EngineConfig;"), returnType = "Landroidx/media3/exoplayer/ExoPlayerImpl;").uniqueMatch()
        Fingerprint(definingClass = "Landroidx/compose/runtime/snapshots/SnapshotKt;", name = "access\$advanceGlobalSnapshot",
            parameters = emptyList(), returnType = "V").uniqueMatch()
        Fingerprint(definingClass = "Landroidx/media3/exoplayer/ExoPlayerImpl;", name = "setVideoSurfaceHolder",
            parameters = listOf("Landroid/view/SurfaceHolder;"), returnType = "V").uniqueMatch()
        Fingerprint(definingClass = "Landroidx/compose/runtime/Recomposer\$\$ExternalSyntheticLambda4;", name = "<init>",
            parameters = listOf("Ljava/lang/Object;", "I", "Ljava/lang/Object;"), returnType = "V").uniqueMatch()
        Fingerprint(definingClass = "Landroidx/navigation/compose/NavHostKt\$NavHost\$16\$1\$invoke\$\$inlined\$onDispose\$1;", name = "dispose",
            parameters = emptyList(), returnType = "V").uniqueMatch()
    }
}
