package app.template.patches.calendar.widget

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal const val REMOTE_VIEWS = "Landroid/widget/RemoteViews;"
internal const val CONTEXT = "Landroid/content/Context;"
internal const val SERVICE = "Lcom/google/android/calendar/widgetschedule/ScheduleViewWidgetService;"
internal const val HOOK = "Lpl/dudek/extension/calendar/ScheduleWidgetRows;"

internal object ScheduleRowFingerprint : Fingerprint(
    name = "getViewAt",
    parameters = listOf("I"),
    returnType = REMOTE_VIEWS,
    strings = listOf("Timeline Entry", "Loading", "key_timeline_item", "beginTime"),
    custom = { method, classDef ->
        "Landroid/widget/RemoteViewsService\$RemoteViewsFactory;" in classDef.interfaces &&
            method.implementation?.instructions?.any {
                val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
                ref?.definingClass == REMOTE_VIEWS && ref.name == "setOnClickFillInIntent"
            } == true
    },
)
