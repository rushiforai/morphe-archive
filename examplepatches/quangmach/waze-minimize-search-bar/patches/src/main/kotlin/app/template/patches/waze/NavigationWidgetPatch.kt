package app.template.patches.waze

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import org.w3c.dom.Element

private const val NAV_WIDGET = "Lapp/template/extension/extension/NavigationWidget;"
private const val NAV_MANAGER = "Lcom/waze/navigate/NavigationInfoNativeManager;"
private const val ALERTER = "Lcom/waze/alerters/AlerterNativeManager;"
private const val ALERT_UPDATE = "Lcom/waze/jni/protos/alerters/NativeAlertRepositoryUpdate;"
private const val DISTANCE = "Lcom/waze/jni/protos/navigate/DistanceUpdate;"
private const val MANEUVER_STREET = "Lcom/waze/jni/protos/navigate/CurrentStreetNameUpdate;"
private const val ROAD_SIGN = "Lcom/waze/jni/protos/navigate/NavigationRoadSign;"
private const val LOCATION_MANAGER = "Lcom/waze/location/LocationNativeManager;"
private const val PROVIDER_POSITION = "Lcom/waze/jni/protos/location/ProviderPosition;"
private const val MATCHED_POSITION = "Lcom/waze/jni/protos/location/MatchedPositionProto;"

private val navigationWidgetResources = patch {
    execute {
        copyWidgetResource("layout/qm_navigation_widget.xml")
        copyWidgetResource("xml/qm_navigation_widget_info.xml")
        document("AndroidManifest.xml").use {
            (it.getElementsByTagName("application").item(0) as Element)
                .addWidgetProvider("NavigationWidget", "Waze Navigation & Alerts", "qm_navigation_widget_info")
        }
    }
}

@Suppress("unused")
val navigationWidgetPatch = patch(
    name = "Add navigation and alert widget",
    description = "Adds a horizontal widget for the next turn, speed, posted limit and upcoming Waze alerts.",
    default = false,
) {
    compatibleWith(
        Compatibility(name = "Waze", packageName = "com.waze", targets = listOf(AppTarget("5.27.5.0"))),
    )
    dependsOn(widgetSupport, navigationWidgetResources)
    execute {
        val navigation = mutableClassDefBy(NAV_MANAGER)
        navigation.methods.single { it.name == "y" && it.parameterTypes == listOf("Z", "I") }
            .addInstructions(0, "invoke-static {p1}, $NAV_WIDGET->routeState(Z)V")
        navigation.methods.single { it.name == "H" && it.parameterTypes.isEmpty() }
            .addInstructions(0, "invoke-static {}, $NAV_WIDGET->routeCleared()V")
        navigation.methods.single { it.name == "l" && it.parameterTypes == listOf("I") }
            .addInstructions(0, "invoke-static {p1}, $NAV_WIDGET->turn(I)V")
        navigation.methods.single { it.name == "z" && it.parameterTypes == listOf("I") }
            .addInstructions(0, "invoke-static {p1}, $NAV_WIDGET->exit(I)V")
        navigation.methods.single { it.name == "m" && it.parameterTypes == listOf(DISTANCE) }
            .addInstructions(0, """
                invoke-virtual {p1}, $DISTANCE->getValueString()Ljava/lang/String;
                move-result-object v0
                invoke-virtual {p1}, $DISTANCE->getUnitString()Ljava/lang/String;
                move-result-object v1
                invoke-static {v0, v1}, $NAV_WIDGET->distance(Ljava/lang/String;Ljava/lang/String;)V
            """)
        // Waze calls the immediate instruction "current" and the later "then" instruction "next".
        navigation.methods.single { it.name == "L" && it.parameterTypes == listOf(MANEUVER_STREET) }
            .addInstructions(0, """
                invoke-virtual {p1}, $MANEUVER_STREET->getStreetName()Ljava/lang/String;
                move-result-object v0
                invoke-virtual {p1}, $MANEUVER_STREET->getRoadSign()$ROAD_SIGN
                move-result-object v4
                invoke-virtual {v4}, $ROAD_SIGN->getTextRepresentation()Ljava/lang/String;
                move-result-object v1
                invoke-virtual {v4}, $ROAD_SIGN->getSecondaryMarkup()Ljava/lang/String;
                move-result-object v2
                invoke-virtual {v4}, $ROAD_SIGN->getPrimaryMarkup()Ljava/lang/String;
                move-result-object v3
                invoke-static {v0, v1, v2, v3}, $NAV_WIDGET->maneuverStreet(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
            """)
        mutableClassDefBy(LOCATION_MANAGER).methods
            .single { it.name == "d" && it.parameterTypes == listOf(PROVIDER_POSITION) }
            .addInstructions(0, """
                invoke-virtual {p1}, $PROVIDER_POSITION->getMatcherInfo()$MATCHED_POSITION
                move-result-object v0
                invoke-virtual {v0}, $MATCHED_POSITION->getStreetName()Ljava/lang/String;
                move-result-object v0
                invoke-static {v0}, $NAV_WIDGET->currentStreet(Ljava/lang/String;)V
            """)
        mutableClassDefBy(ALERTER).methods.single { it.name == "b" && it.parameterTypes == listOf(ALERT_UPDATE) }
            .addInstructions(0, "invoke-static {p1}, $NAV_WIDGET->onAlerts(Ljava/lang/Object;)V")

        val widget = mutableClassDefBy(NAV_WIDGET)
        widget.bindWidgetMethod("engineRunning", 1, """
            invoke-static {}, Lcom/waze/NativeManager;->isAppStarted()Z
            move-result v0
            return v0
        """)
        widget.bindWidgetMethod("soundMode", 1, """
            sget-object v0, Lcom/waze/config/ConfigValues;->CONFIG_VALUE_NAVIGATION_GUIDANCE_MODE:Lcom/waze/config/d;
            invoke-virtual {v0}, Lcom/waze/config/d;->a()Ljava/lang/String;
            move-result-object v0
            return-object v0
        """)
        widget.bindWidgetMethod("queueSpeech", 1, """
            invoke-static {p0}, Lcom/waze/NativeManager;->runNativeTask(Ljava/lang/Runnable;)V
            return-void
        """)
        widget.bindWidgetMethod("speak", 2, """
            invoke-static {}, Lcom/waze/sound/SoundNativeManager;->a()Lcom/waze/sound/SoundNativeManager;
            move-result-object v0
            invoke-virtual {v0, p0}, Lcom/waze/sound/SoundNativeManager;->playTtsNTV(Ljava/lang/String;)V
            return-void
        """)
    }
}
