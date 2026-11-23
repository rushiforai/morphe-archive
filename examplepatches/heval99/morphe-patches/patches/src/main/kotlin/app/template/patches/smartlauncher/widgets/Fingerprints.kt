package app.template.patches.smartlauncher.widgets

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.Opcode

// The stock AppWidgetHost config launch, in AppWidgetEncapsulationActivity.onCreate (the path
// used when a widget is dropped on the home screen) and in the reconfiguration lambda.
internal object WidgetConfigurationFingerprint : Fingerprint(
    definingClass = "Lginlemon/flower/appWidget/AppWidgetEncapsulationActivity;",
    name = "onCreate",
    parameters = listOf("Landroid/os/Bundle;"),
    returnType = "V",
    filters = listOf(
        methodCall(
            definingClass = "Landroid/appwidget/AppWidgetHost;",
            name = "startAppWidgetConfigureActivityForResult",
            opcode = Opcode.INVOKE_VIRTUAL_RANGE,
        ),
    ),
)

internal object WidgetReconfigurationFingerprint : Fingerprint(
    name = "invoke",
    parameters = listOf(),
    returnType = "Ljava/lang/Object;",
    filters = listOf(
        methodCall(
            definingClass = "Landroid/appwidget/AppWidgetHost;",
            name = "startAppWidgetConfigureActivityForResult",
            opcode = Opcode.INVOKE_VIRTUAL_RANGE,
        ),
    ),
)

// AppWidgetManagerCompat.updateAppWidgetOptions(Context, id, config, width, height, ...): the
// method that publishes the host measurement to the provider.
internal object WidgetSizeUpdateFingerprint : Fingerprint(
    definingClass = "Lhec;",
    name = "e",
    parameters = listOf("Landroid/content/Context;", "I", "Laz4;", "F", "F", "Z"),
    returnType = "V",
    strings = listOf("Cannot update widget size"),
    filters = listOf(
        methodCall(
            definingClass = "Landroid/appwidget/AppWidgetManager;",
            name = "getAppWidgetOptions",
            opcode = Opcode.INVOKE_VIRTUAL,
        ),
    ),
)

// The coroutine that clears appWidgetSizes while the home screen re-measures its widgets.
internal object WidgetSizeInvalidationFingerprint : Fingerprint(
    definingClass = "Laac;",
    name = "invokeSuspend",
    parameters = listOf("Ljava/lang/Object;"),
    returnType = "Ljava/lang/Object;",
    strings = listOf("appWidgetSizes"),
    filters = listOf(
        methodCall(
            definingClass = "Landroid/appwidget/AppWidgetManager;",
            name = "updateAppWidgetOptions",
            opcode = Opcode.INVOKE_VIRTUAL,
        ),
    ),
)
