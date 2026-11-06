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
