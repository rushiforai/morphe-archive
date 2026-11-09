package app.mrcool.patches.smartlauncher.widgets

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.Opcode

internal object WidgetConfigurationFingerprint : Fingerprint(
    definingClass = "Lginlemon/flower/appWidget/AppWidgetEncapsulationActivity;",
    name = "onCreate",
    parameters = listOf("Landroid/os/Bundle;"),
    returnType = "V",
    filters = listOf(
        methodCall(
            definingClass = "Landroid/appwidget/AppWidgetHost;",
            name = "startAppWidgetConfigureActivityForResult",
            opcode = Opcode.INVOKE_VIRTUAL_RANGE
        )
    )
)

internal object WidgetReconfigurationFingerprint : Fingerprint(
    name = "invoke",
    parameters = listOf(),
    returnType = "Ljava/lang/Object;",
    filters = listOf(
        methodCall(
            definingClass = "Landroid/appwidget/AppWidgetHost;",
            name = "startAppWidgetConfigureActivityForResult",
            opcode = Opcode.INVOKE_VIRTUAL_RANGE
        )
    )
)

internal object WidgetSizeUpdateFingerprint : Fingerprint(
    definingClass = "Lpxb;",
    name = "e",
    parameters = listOf("Landroid/content/Context;", "I", "Leq4;", "F", "F", "Z"),
    returnType = "V",
    strings = listOf("Cannot update widget size"),
    filters = listOf(
        methodCall(
            definingClass = "Landroid/appwidget/AppWidgetManager;",
            name = "getAppWidgetOptions",
            opcode = Opcode.INVOKE_VIRTUAL
        )
    )
)

internal object WidgetSizeInvalidationFingerprint : Fingerprint(
    definingClass = "Lexb;",
    name = "invokeSuspend",
    parameters = listOf("Ljava/lang/Object;"),
    returnType = "Ljava/lang/Object;",
    strings = listOf("appWidgetSizes"),
    filters = listOf(
        methodCall(
            definingClass = "Landroid/appwidget/AppWidgetManager;",
            name = "updateAppWidgetOptions",
            opcode = Opcode.INVOKE_VIRTUAL
        )
    )
)
