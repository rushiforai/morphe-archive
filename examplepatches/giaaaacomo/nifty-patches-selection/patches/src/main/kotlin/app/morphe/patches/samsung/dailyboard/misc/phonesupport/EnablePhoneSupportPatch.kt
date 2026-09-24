/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */
package app.morphe.patches.samsung.dailyboard.misc.phonesupport

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.samsung.dailyboard.misc.extension.sharedExtensionPatch
import app.morphe.patches.samsung.dailyboard.shared.Constants.COMPATIBILITY_DAILY_BOARD
import app.morphe.util.getReference
import app.morphe.util.indexOfFirstInstructionOrThrow
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.w3c.dom.Element

private const val TABLET_FEATURE = "com.samsung.feature.device_category_tablet"
private const val MAX_ASPECT_METADATA = "android.max_aspect"
private const val ICON_ACTIVITY =
    "com.samsung.android.homemode.ui.activity.main.HomeModeIconActivity"
private const val MAIN_ACTIVITY =
    "com.samsung.android.homemode.ui.activity.main.HomeModeActivity"
private const val DREAM_SERVICE =
    "com.samsung.android.homemode.ui.dream.HomeModeDreamService"
private const val NOTIFICATION_LISTENER =
    "app.morphe.extension.samsung.dailyboard.DailyBoardNotificationListener"
private const val MEDIA_SESSION_EXTENSION =
    "Lapp/morphe/extension/samsung/dailyboard/MediaSessionPatch;"
private const val WEATHER_EXTENSION =
    "Lapp/morphe/extension/samsung/dailyboard/OpenMeteoWeatherPatch;"

private val TABLET_SCALED_DIMENSION_PREFIXES = arrayOf(
    "action_bar_layout_",
    "bottom_action_bar_layout_",
    "page_indicator_",
    "top_action_bar_",
)

private val enablePhoneComponentsPatch = resourcePatch(
    description = "Enables Daily Board components that Samsung disables on unsupported devices."
) {
    execute {
        document("AndroidManifest.xml").use { document ->
            var tabletFeatureFound = false
            var maxAspectMetadataFound = false
            var mainActivityFound = false
            val features = document.getElementsByTagName("uses-feature")
            for (index in 0 until features.length) {
                val feature = features.item(index) as? Element ?: continue
                if (feature.getAttribute("android:name") == TABLET_FEATURE) {
                    feature.setAttribute("android:required", "false")
                    tabletFeatureFound = true
                }
            }

            val metadata = document.getElementsByTagName("meta-data")
            for (index in 0 until metadata.length) {
                val entry = metadata.item(index) as? Element ?: continue
                if (entry.getAttribute("android:name") == MAX_ASPECT_METADATA) {
                    entry.setAttribute("android:value", "3.0")
                    maxAspectMetadataFound = true
                }
            }

            val componentsToEnable = mutableSetOf(ICON_ACTIVITY, DREAM_SERVICE)
            listOf("activity", "service").forEach { tagName ->
                val components = document.getElementsByTagName(tagName)
                for (index in 0 until components.length) {
                    val component = components.item(index) as? Element ?: continue
                    val name = component.getAttribute("android:name")
                    if (name == MAIN_ACTIVITY) {
                        component.setAttribute("android:resizeableActivity", "true")
                        mainActivityFound = true
                    }
                    if (componentsToEnable.remove(name)) {
                        component.setAttribute("android:enabled", "true")
                    }
                }
            }

            if (!tabletFeatureFound) {
                throw PatchException("Daily Board tablet feature declaration was not found.")
            }
            if (!maxAspectMetadataFound) {
                throw PatchException("Daily Board max aspect metadata was not found.")
            }
            if (!mainActivityFound) {
                throw PatchException("Daily Board main activity was not found.")
            }
            if (componentsToEnable.isNotEmpty()) {
                throw PatchException(
                    "Daily Board components were not found: ${componentsToEnable.joinToString()}"
                )
            }

            val application = document.getElementsByTagName("application").item(0) as Element
            val listenerService = document.createElement("service").apply {
                setAttribute("android:name", NOTIFICATION_LISTENER)
                setAttribute("android:label", "Daily Board media and notifications")
                setAttribute("android:permission", "android.permission.BIND_NOTIFICATION_LISTENER_SERVICE")
                setAttribute("android:exported", "true")
            }
            val intentFilter = document.createElement("intent-filter")
            val listenerAction = document.createElement("action").apply {
                setAttribute(
                    "android:name",
                    "android.service.notification.NotificationListenerService"
                )
            }
            intentFilter.appendChild(listenerAction)
            listenerService.appendChild(intentFilter)
            application.appendChild(listenerService)
        }

        fun applyTabletDimensions(phonePath: String, tabletPath: String) {
            val tabletDimensions = mutableMapOf<String, String>()
            document(tabletPath).use { document ->
                val dimensions = document.getElementsByTagName("dimen")
                for (index in 0 until dimensions.length) {
                    val dimension = dimensions.item(index) as? Element ?: continue
                    tabletDimensions[dimension.getAttribute("name")] = dimension.textContent
                }
            }

            document(phonePath).use { document ->
                val dimensions = document.getElementsByTagName("dimen")
                for (index in 0 until dimensions.length) {
                    val dimension = dimensions.item(index) as? Element ?: continue
                    val name = dimension.getAttribute("name")
                    if (TABLET_SCALED_DIMENSION_PREFIXES.none(name::startsWith)) continue
                    val tabletValue = tabletDimensions[name] ?: continue
                    dimension.textContent = tabletValue
                }
            }
        }

        applyTabletDimensions(
            "res/values-sw400dp/dimens.xml",
            "res/values-sw600dp/dimens.xml",
        )
        applyTabletDimensions(
            "res/values-sw400dp-land/dimens.xml",
            "res/values-sw600dp-land/dimens.xml",
        )
    }
}

@Suppress("unused")
val enableDailyBoardOnPhonesPatch = bytecodePatch(
    name = "Enable phone support",
    description = "Runs Samsung Daily Board on phones and treats wireless charging, or charging in landscape, as docking.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_DAILY_BOARD)
    dependsOn(enablePhoneComponentsPatch, sharedExtensionPatch)

    execute {
        PogoFeatureFingerprint.method.returnEarly(true)
        TaFeatureFingerprint.method.returnEarly(true)
        SupportedDeviceFingerprint.method.returnEarly(true)
        SecureSettingsWriteFingerprint.method.returnEarly()

        // HolidayProvider is signature-protected; keep the calendar grid and personal events.
        CalendarDayInfoFingerprint.method.apply {
            val holidayQueryIndex = indexOfFirstInstructionOrThrow {
                val reference = getReference<MethodReference>()
                (opcode == Opcode.INVOKE_VIRTUAL || opcode == Opcode.INVOKE_VIRTUAL_RANGE) &&
                    reference?.definingClass == "Landroid/content/ContentResolver;" &&
                    reference.name == "query"
            }
            replaceInstruction(holidayQueryIndex, "const/4 v0, 0x0")
            replaceInstruction(holidayQueryIndex + 1, "nop")
        }

        MusicSessionListenerFingerprint.method.apply {
            val addListenerIndex = indexOfFirstInstructionOrThrow {
                val reference = getReference<MethodReference>()
                reference?.definingClass == "Landroid/media/session/MediaSessionManager;" &&
                    reference.name == "addOnActiveSessionsChangedListener"
            }
            replaceInstruction(
                addListenerIndex,
                "invoke-static { v0, v2, v3 }, $MEDIA_SESSION_EXTENSION->startListening(" +
                    "Ljava/lang/Object;Landroid/media/session/MediaSessionManager;" +
                    "Landroid/media/session/MediaSessionManager\$OnActiveSessionsChangedListener;)" +
                    "Ljava/util/List;"
            )
            replaceInstruction(addListenerIndex + 1, "move-result-object v0")
            replaceInstruction(
                addListenerIndex + 2,
                "invoke-virtual { v3, v0 }, Lx0/a;->onActiveSessionsChanged(Ljava/util/List;)V"
            )
            replaceInstruction(addListenerIndex + 3, "nop")
            replaceInstruction(addListenerIndex + 4, "nop")
        }

        WeatherRepositoryUpdateFingerprint.method.addInstructionsWithLabels(
            0,
            """
                invoke-static/range { p0 .. p0 }, $WEATHER_EXTENSION->updateWeather(Landroid/content/Context;)V
                return-void
            """
        )
        WeatherStateFingerprint.method.returnEarly()
        WeatherSourceFingerprint.method.addInstructionsWithLabels(
            0,
            """
                invoke-static { p1, p2 }, $WEATHER_EXTENSION->bindWeatherSource(Landroid/widget/TextView;Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :original_weather_source
                return-void

                :original_weather_source
                nop
            """
        )
        PhotoDataSourceLookupFingerprint.method.addInstructionsWithLabels(
            0,
            "const/4 p1, 0x0"
        )
        PhotoRepositoryInitFingerprint.method.addInstructionsWithLabels(
            0,
            """
                new-instance v0, La1/b;
                invoke-direct { v0, p1 }, La1/b;-><init>(Landroid/content/Context;)V
                const/4 v1, 0x0
                invoke-static { v1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
                move-result-object v1
                sget-object v2, Lcom/samsung/android/homemode/external/repository/photo/PhotoRepository;->dataSourceMap:Ljava/util/Map;
                invoke-interface { v2, v1, v0 }, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                invoke-interface { v0 }, Lz0/a;->b()V
                sget-object v1, Lcom/samsung/android/homemode/external/repository/photo/PhotoRepository;->photoListener:Lcom/samsung/android/homemode/external/repository/photo/a;
                invoke-interface { v0, v1 }, Lz0/a;->f(Lcom/samsung/android/homemode/external/repository/photo/a;)V
                return-void
            """
        )

        LauncherComponentStateFingerprint.method.addInstructionsWithLabels(
            0,
            "const/4 p1, 0x1"
        )

        HomeModeApplicationOnCreateFingerprint.method.addInstructionsWithLabels(
            7,
            """
                move-object/from16 v15, p0
                const/4 v0, 0x1
                invoke-static { v15, v0 }, Lv1/a;->a(Landroid/content/Context;Z)V
            """
        )

        IconActivityOnCreateFingerprint.method.addInstructionsWithLabels(
            1,
            """
                invoke-static { }, Ls1/b;->G()Z
                move-result v0
                if-eqz v0, :launch_oobe
                const-string v0, "com.samsung.android.homemode.main"
                goto :launch

                :launch_oobe
                const-string v0, "com.samsung.android.homemode.OOBE"

                :launch
                new-instance v1, Landroid/content/Intent;
                invoke-direct { v1, v0 }, Landroid/content/Intent;-><init>(Ljava/lang/String;)V
                const-string v0, "com.samsung.android.homemode"
                invoke-virtual { v1, v0 }, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;
                const v0, 0x10008000
                invoke-virtual { v1, v0 }, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;
                const-string v0, "com.samsung.android.homemode.extra.START_FROM"
                const-string v2, "com.samsung.android.homemode.action.HOMEMODE_START.FROM_APPS_ICON"
                invoke-virtual { v1, v0, v2 }, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
                invoke-virtual { p0, v1 }, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
                invoke-virtual { p0 }, Landroid/app/Activity;->finish()V
                return-void
            """
        )

        DockingFingerprint.method.addInstructionsWithLabels(
            0,
            """
                new-instance v0, Landroid/content/IntentFilter;
                const-string v1, "android.intent.action.BATTERY_CHANGED"
                invoke-direct { v0, v1 }, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V
                const/4 v1, 0x0
                const/4 v2, 0x2
                invoke-virtual { p0, v1, v0, v2 }, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;
                move-result-object v0
                if-eqz v0, :check_landscape
                const-string v1, "plugged"
                const/4 v2, -0x1
                invoke-virtual { v0, v1, v2 }, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I
                move-result v0
                const/4 v1, 0x4
                if-eq v0, v1, :phone_docked

                :check_landscape
                invoke-static { p0 }, Lcom/samsung/android/homemode/infra/utils/e;->a(Landroid/content/Context;)Z
                move-result v0
                if-eqz v0, :original_dock_check
                invoke-virtual { p0 }, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
                move-result-object v0
                invoke-virtual { v0 }, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;
                move-result-object v0
                iget v0, v0, Landroid/content/res/Configuration;->orientation:I
                const/4 v1, 0x2
                if-ne v0, v1, :original_dock_check

                :phone_docked
                const/4 v0, 0x1
                return v0

                :original_dock_check
                nop
            """
        )
    }
}
