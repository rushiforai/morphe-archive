package patches.wuplay

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.FormFactor
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import org.w3c.dom.Element
import patches.shared.uniqueMatch

private const val APP = "Lapp/wuplay/androidtv/WuPlayApplication;"
private const val CONT = "Lkotlin/coroutines/jvm/internal/ContinuationImpl;"
private const val ANDROID = "http://schemas.android.com/apk/res/android"
private val wuplay = Compatibility(
    name = "Wuplay Android TV", packageName = "app.wuplay.androidtv", apkFileType = ApkFileType.APK,
    formFactor = FormFactor.TV,
    signatures = setOf(WuplaySettingsHooks.ORIGINAL_SIGNER),
    targets = listOf(AppTarget(version = "0.9.4-beta", versionCode = 49, minSdk = 24)),
)
private val originalInput = patches.shared.originalInput(wuplay)

private val catalogResources = resourcePatch {
    dependsOn(originalInput)
    execute {
        document("AndroidManifest.xml").use { xml ->
            val app = xml.getElementsByTagName("application").item(0) as Element
            val name = "nl.johninnl.wuplay.CatalogSettingsActivity"
            val activities = xml.getElementsByTagName("activity")
            check((0 until activities.length).none {
                (activities.item(it) as Element).getAttributeNS(ANDROID, "name") == name
            }) { "Wuplay catalog selector already installed" }
            val activity = xml.createElement("activity")
            activity.setAttributeNS(ANDROID, "android:name", name)
            activity.setAttributeNS(ANDROID, "android:label", "Wuplay TV channels")
            activity.setAttributeNS(ANDROID, "android:exported", "false")
            activity.setAttributeNS(ANDROID, "android:enableOnBackInvokedCallback", "false")
            app.appendChild(activity)
        }
    }
}

@Suppress("unused")
val catalogChannels = bytecodePatch(
    name = "Publish selected catalog channels",
    description = "Choose which default-profile Home catalogs to publish in Settings > Catalogs > TV channels. " +
        "Publishes Android TV preview channels with artwork and Wuplay links; requires Android TV 8 or later.",
    default = false,
) {
    compatibleWith(wuplay)
    dependsOn(originalInput, catalogResources)
    extendWith("extensions/wuplay.mpe")
    execute {
        // Check every reflected native field and suspend entry before adding the one lifecycle hook.
        val fields = mapOf(
            "Lapp/wuplay/androidtv/TvAppContainer;" to mapOf(
                "catalogRepository" to "Lapp/wuplay/androidtv/data/CatalogRepositoryImpl;",
                "userSettingsRepository" to "Lapp/wuplay/androidtv/data/UserSettingsRepositoryImpl;"),
            "Lapp/wuplay/androidtv/data/UserSettingsRepositoryImpl;" to mapOf(
                "profiles" to "Lkotlinx/coroutines/flow/Flow;", "activeProfileId" to "Lkotlinx/coroutines/flow/Flow;"),
            "Lapp/wuplay/androidtv/data/CatalogRepositoryImpl;" to mapOf("definitions" to "Lkotlinx/coroutines/flow/Flow;"),
            "Lapp/wuplay/androidtv/domain/model/Profile;" to mapOf("id" to "Ljava/lang/String;", "name" to "Ljava/lang/String;"),
            "Lapp/wuplay/androidtv/domain/model/CatalogDefinition;" to mapOf(
                "id" to "I", "name" to "Ljava/lang/String;", "source" to "Ljava/lang/String;", "homeOrder" to "I", "showHome" to "Z"),
            "Lapp/wuplay/androidtv/domain/repository/CatalogContent;" to mapOf("items" to "Ljava/util/List;", "error" to "Ljava/lang/String;"),
            "Lapp/wuplay/androidtv/domain/stremio/MetaPreview;" to listOf("type", "id", "imdbId", "name", "description", "poster", "background")
                .associateWith { "Ljava/lang/String;" },
        )
        for ((type, expected) in fields) {
            val cls = mutableClassDefBy(type)
            for ((name, fieldType) in expected) check(cls.fields.count {
                it.name == name && it.type == fieldType && AccessFlags.PUBLIC.isSet(it.accessFlags)
            } == 1) { "Wuplay ABI changed: $type->$name:$fieldType" }
        }
        Fingerprint(definingClass = APP, name = "getContainer", parameters = emptyList(),
            returnType = "Lapp/wuplay/androidtv/TvAppContainer;").uniqueMatch()
        Fingerprint(definingClass = "Lapp/wuplay/androidtv/data/CatalogRepositoryImpl;", name = "fetchContent-BWLJW6A",
            parameters = listOf("Lapp/wuplay/androidtv/domain/model/CatalogDefinition;", "Ljava/util/Map;", "Ljava/lang/String;", CONT),
            returnType = "Ljava/lang/Object;").uniqueMatch()
        Fingerprint(definingClass = "Lapp/wuplay/androidtv/data/CatalogRepositoryImpl;", name = "awaitSchemaReady",
            parameters = listOf(CONT), returnType = "Ljava/lang/Object;").uniqueMatch()
        Fingerprint(definingClass = "Lkotlinx/coroutines/flow/FlowKt;", name = "first",
            parameters = listOf("Lkotlinx/coroutines/flow/Flow;", "Lkotlin/coroutines/Continuation;"), returnType = "Ljava/lang/Object;").uniqueMatch()
        Fingerprint(definingClass = "Lkotlinx/coroutines/JobKt;", name = "SupervisorJob\$default",
            parameters = emptyList(), returnType = "Lkotlinx/coroutines/SupervisorJobImpl;").uniqueMatch()
        Fingerprint(definingClass = "Lkotlinx/coroutines/JobSupport;", name = "cancel",
            parameters = listOf("Ljava/util/concurrent/CancellationException;"), returnType = "V").uniqueMatch()
        Fingerprint(definingClass = "Landroidx/compose/foundation/lazy/LazyListIntervalContent;", name = "item",
            parameters = listOf("Ljava/lang/Object;", "Ljava/lang/String;", "Lkotlin/jvm/functions/Function3;"), returnType = "V").uniqueMatch()
        Fingerprint(definingClass = "Landroidx/compose/runtime/GapComposer;", name = "consume",
            parameters = listOf("Landroidx/compose/runtime/ProvidableCompositionLocal;"), returnType = "Ljava/lang/Object;").uniqueMatch()
        Fingerprint(definingClass = "Lapp/wuplay/androidtv/ui/screens/settings/SettingRowKt;", name = "SettingRow",
            parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;", "Lkotlin/jvm/functions/Function0;",
                "Landroidx/compose/ui/Modifier;", "Ljava/lang/String;", "Landroidx/compose/ui/focus/FocusRequester;",
                "Lkotlin/jvm/functions/Function0;", "Lkotlin/jvm/functions/Function0;", "Z", "Z",
                "Landroidx/compose/runtime/GapComposer;", "I", "I"), returnType = "V").uniqueMatch()
        val settings = Fingerprint(definingClass = WuplaySettingsHooks.OWNER, name = "invoke",
            parameters = listOf("Ljava/lang/Object;"), returnType = "Ljava/lang/Object;").uniqueMatch().method
        WuplaySettingsHooks.apply(settings)
        val focus = Fingerprint(definingClass = WuplaySettingsHooks.FOCUS_OWNER, name = "invoke",
            parameters = listOf("Ljava/lang/Object;", "Ljava/lang/Object;", "Ljava/lang/Object;"), returnType = "Ljava/lang/Object;").uniqueMatch().method
        WuplaySettingsHooks.extendCatalogFocus(focus)
        val container = Fingerprint(definingClass = "Lapp/wuplay/androidtv/TvAppContainer;", name = "<init>",
            parameters = listOf(APP), returnType = "V").uniqueMatch().method
        WuplaySettingsHooks.retainBuildIdentity(container)
        val method = Fingerprint(definingClass = APP, name = "onCreate", parameters = emptyList(), returnType = "V").uniqueMatch().method
        val instructions = method.implementation!!.instructions.toList()
        check(method.implementation!!.registerCount == 5 && instructions.size == 28 &&
            instructions.last().opcode == Opcode.RETURN_VOID && instructions.count { it.opcode == Opcode.RETURN_VOID } == 1) {
            "Wuplay application lifecycle contract changed"
        }
        method.addInstruction(instructions.lastIndex,
            "invoke-static/range { p0 .. p0 }, Lnl/johninnl/wuplay/CatalogChannels;->install(Landroid/app/Application;)V")
    }
}
