package app.twrailway.patches.promotion

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * `FirebaseRemoteConfigPlugin.parseParameters(Map<String, FirebaseRemoteConfigValue>)` of the
 * firebase_remote_config Flutter plugin. It converts the Remote Config parameters to the map
 * sent to Dart (key to `{"value": byte[], "source": String}`), both for
 * `FirebaseRemoteConfigHostApi.getAll` and for the plugin constants read when Dart starts.
 *
 * The plugin is obfuscated, so it is found as the `Map -> Map` method of the Firebase plugin
 * class that also reports `lastFetchStatus`.
 */
internal object RemoteConfigParseParametersFingerprint : Fingerprint(
    returnType = "Ljava/util/Map;",
    parameters = listOf("Ljava/util/Map;"),
    custom = { _, classDef ->
        FLUTTER_FIREBASE_PLUGIN in classDef.interfaces &&
            classDef.methods.any { method ->
                method.implementation?.instructions?.any { instruction ->
                    val reference = (instruction as? ReferenceInstruction)?.reference as? StringReference
                    reference?.string == "lastFetchStatus"
                } == true
            }
    },
)

private const val FLUTTER_FIREBASE_PLUGIN = "Lio/flutter/plugins/firebase/core/FlutterFirebasePlugin;"

/**
 * The views of the home screen widgets for free users (`f8.g.e(Context, int)` in 5.3.4,
 * in the widget providers' obfuscated base class). Its footer is an "升級即時看板 ›" link
 * to the paywall (`trainschedule://widget/paywall`).
 *
 * The base class has 3 `(Context, int) -> RemoteViews` methods (the data, free and picker
 * views), so the method is found by the paywall link, which only it uses.
 */
internal object FreeWidgetViewsFingerprint : Fingerprint(
    superclass = "Landroid/appwidget/AppWidgetProvider;",
    returnType = "Landroid/widget/RemoteViews;",
    parameters = listOf("Landroid/content/Context;", "I"),
    strings = listOf("trainschedule://widget/paywall?f=android&p=free&homeWidget"),
)