package app.fluffydiscord.patches.screenrecorder

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resource.resourceId
import app.morphe.patcher.util.addFreeRegisters
import org.w3c.dom.Element

private const val SETTINGS_ACTIVITY_NAME = "com.miui.screenrecorder.activity.ScreenRecorderSettingActivity2"
private const val TILE_SERVICE_CLASS = "Lcom/miui/screenrecorder/service/QuickService;"
private const val CONSUMER_INTERFACE = "Ljava/util/function/Consumer;"
private const val TILE_REQUEST_MINIMUM_SDK = 33
private const val ON_CREATE_PARAMETER_REGISTERS = 2
private const val TILE_REQUEST_REGISTERS = 6

private val launcherEntryPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val activities = document.getElementsByTagName("activity")
            val settingsActivity = (0 until activities.length)
                .map { activities.item(it) as Element }
                .first { it.getAttribute("android:name") == SETTINGS_ACTIVITY_NAME }

            settingsActivity.removeAttribute("android:permission")
            settingsActivity.removeAttribute("android:excludeFromRecents")

            val launcherFilter = document.createElement("intent-filter")
            val mainAction = document.createElement("action")
            mainAction.setAttribute("android:name", "android.intent.action.MAIN")
            val launcherCategory = document.createElement("category")
            launcherCategory.setAttribute("android:name", "android.intent.category.LAUNCHER")
            launcherFilter.appendChild(mainAction)
            launcherFilter.appendChild(launcherCategory)
            settingsActivity.appendChild(launcherFilter)
        }
    }
}

internal val addTilePatch = bytecodePatch {
    dependsOn(launcherEntryPatch)

    execute {
        implementEmptyTileRequestCallback()
        requestTileWhenSettingsOpen()
    }
}

context(patchContext: BytecodePatchContext)
private fun implementEmptyTileRequestCallback() {
    val settingsClass = SettingsScreenFingerprint.classDef
    settingsClass.interfaces.add(CONSUMER_INTERFACE)
    settingsClass.addVoidMethod("accept", listOf("Ljava/lang/Object;"), 2, "return-void")
}

context(patchContext: BytecodePatchContext)
private fun requestTileWhenSettingsOpen() {
    val labelId = resourceId(ResourceType.STRING, "app_name")
    val iconId = resourceId(ResourceType.DRAWABLE, "ic_title")

    val originalRegisterCount = SettingsScreenFingerprint.method.implementation!!.registerCount
    val thisRegister = originalRegisterCount - ON_CREATE_PARAMETER_REGISTERS
    val (method, addedInstructions) = SettingsScreenFingerprint.method.addFreeRegisters(TILE_REQUEST_REGISTERS)

    val statusBar = originalRegisterCount
    val component = statusBar + 1
    val label = statusBar + 2
    val icon = statusBar + 3
    val executor = statusBar + 4
    val callback = statusBar + 5

    method.addInstructionsWithLabels(
        addedInstructions,
        """
            sget v$statusBar, Landroid/os/Build${'$'}VERSION;->SDK_INT:I
            const/16 v$component, $TILE_REQUEST_MINIMUM_SDK
            if-lt v$statusBar, v$component, :skip_tile_request
            const-class v$statusBar, Landroid/app/StatusBarManager;
            invoke-virtual {v$thisRegister, v$statusBar}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;
            move-result-object v$statusBar
            check-cast v$statusBar, Landroid/app/StatusBarManager;
            new-instance v$component, Landroid/content/ComponentName;
            const-class v$label, $TILE_SERVICE_CLASS
            invoke-direct {v$component, v$thisRegister, v$label}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
            const v$label, $labelId
            invoke-virtual {v$thisRegister, v$label}, Landroid/content/Context;->getString(I)Ljava/lang/String;
            move-result-object v$label
            const v$icon, $iconId
            invoke-static {v$thisRegister, v$icon}, Landroid/graphics/drawable/Icon;->createWithResource(Landroid/content/Context;I)Landroid/graphics/drawable/Icon;
            move-result-object v$icon
            invoke-virtual {v$thisRegister}, Landroid/content/Context;->getMainExecutor()Ljava/util/concurrent/Executor;
            move-result-object v$executor
            move-object v$callback, v$thisRegister
            invoke-virtual/range {v$statusBar .. v$callback}, Landroid/app/StatusBarManager;->requestAddTileService(Landroid/content/ComponentName;Ljava/lang/CharSequence;Landroid/graphics/drawable/Icon;Ljava/util/concurrent/Executor;$CONSUMER_INTERFACE)V
            :skip_tile_request
            nop
        """,
    )
}
