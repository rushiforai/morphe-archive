package patches.flitsmeister

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

private const val FEED15 = "Lnl/johninnl/flitsmeister/NavigationBroadcasts;"
private const val REPORT15 = "Lnl/flitsmeister/fmcore/data/model/reports/AvgSpeedCheck;"

/** Exact15 producer and reflection profile. The old names often still exist
 * as unrelated classes, so presence alone is not a compatibility check. */
context(context: BytecodePatchContext)
internal fun installNavigation15() {
    fun field(type: String, name: String, value: String, static: Boolean) {
        val field = context.classDefBy(type).fields.single { it.name == name && it.type == value }
        check(AccessFlags.PUBLIC.isSet(field.accessFlags) && AccessFlags.STATIC.isSet(field.accessFlags) == static) {
            "Changed15 navigation reflection field: $type->$name:$value"
        }
    }
    field("Lbrf;", "f", "I", true)
    field("Lm65;", "b", "I", true)
    field("Ll1k;", "a", "Ll1k;", true)
    field("Lhff;", "b", REPORT15, true)
    field("Lwd6;", "v1", "Landroid/location/Location;", false)
    field("Lvia;", "a", "D", false)
    field("Lvia;", "b", "D", false)
    exact("Lnl/flitsmeister/fmcore/models/eventbuses/AppNotificationBus;", "getBusAlertedReports", "Las7;")
    exact("Las7;", "b", "Lds7;", "Lu39;")
    exact("Lu39;", "invoke", "Ljava/lang/Object;", "Ljava/lang/Object;")
    exact("Lnl/flitsmeister/fmcore/models/eventbuses/AlertedReport;", "getReport", "Lnl/flitsmeister/fmcore/data/model/reports/BaseReport;")
    exact("Lnl/flitsmeister/fmcore/models/eventbuses/AlertedReport;", "isActive", "Z")
    exact("Lnl/flitsmeister/fmcore/data/model/reports/BaseReport;", "getId", "Ljava/lang/String;")
    exact("Lnl/flitsmeister/fmcore/data/model/reports/BaseReport;", "getReportType", "Lnl/flitsmeister/fmcore/data/model/reports/BaseReportType;")
    exact("Lnl/flitsmeister/fmcore/data/model/reports/BaseReport;", "getLocation", "Landroid/location/Location;")
    exact("Lnl/flitsmeister/fmcore/data/model/reports/BaseReport;", "reportTitleText", "Ljava/lang/String;", "Landroid/content/Context;")
    exact("Lnl/flitsmeister/fmcore/data/model/reports/Incident;", "getIncidentType", "Lnl/flitsmeister/fmcore/data/model/reports/IncidentType;")
    exact(REPORT15, "getSegments", "Ljava/util/List;")
    exact("Lnl/flitsmeister/fmcore/data/model/reports/BaseTrajectReport;", "getGpsPath", "Ljava/util/List;")
    exact("Lnl/flitsmeister/fmcore/data/model/reports/AvgSpeedCheck\$AvgSpeedCheckSegment;", "getGpsPath", "Ljava/util/List;")
    exact("Lnl/flitsmeister/fmcore/data/model/reports/AvgSpeedCheck\$AvgSpeedCheckSegment;", "getIndex", "I")

    // Check all unaffected producer layouts before inserting any hook. No
    // fixed-position mutations run after this finalize cohort.
    applyPlans(listOf(
        MethodPlan("Lbb0;->A(Landroid/location/Location;)V", 5, 19, listOf(
            Guard(15, Opcode.INVOKE_DIRECT, listOf(1, 3, 4, 2), "Lcb0;-><init>(Lbb0;Landroid/location/Location;Lsn4;)V"),
        ), emptyList()),
        MethodPlan("Lbb0;->onStart()V", 3, 14, listOf(
            Guard(1, Opcode.SPUT_OBJECT, listOf(0), "Lnza;->e:Landroid/location/Location;"),
            Guard(2, Opcode.INVOKE_VIRTUAL, listOf(2), "Lbb0;->C()V"),
        ), emptyList()),
        MethodPlan("Lbb0;->onStop()V", 7, 45, listOf(
            Guard(0, Opcode.IGET_OBJECT, listOf(0, 6), "Lbb0;->x1:Ll9a;"),
            Guard(40, Opcode.INVOKE_INTERFACE, listOf(0, 6), "Landroid/content/SharedPreferences;->unregisterOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences\$OnSharedPreferenceChangeListener;)V"),
        ), emptyList()),
        MethodPlan("Lirf;->z()V", 16, 216, listOf(
            Guard(195, Opcode.SPUT, listOf(0), "Lbrf;->f:I"),
            Guard(196, Opcode.INVOKE_STATIC, emptyList(), "Lnl/flitsmeister/fmcore/models/eventbuses/RoadInfoBus;->getBusMaxSpeed()Las7;"),
            Guard(215, Opcode.RETURN_VOID),
        ), emptyList()),
        MethodPlan("Lwd6;->B()V", 7, 129, listOf(
            Guard(0, Opcode.IGET_OBJECT, listOf(0, 6), "Lwd6;->p1:Ljava/util/Set;"),
            Guard(1, Opcode.IGET_OBJECT, listOf(1, 6), "Lwd6;->q1:Ljava/util/Set;"),
            Guard(37, Opcode.SPUT_OBJECT, listOf(1), "Lhff;->b:$REPORT15"),
        ), emptyList(), mapOf("Lhff;->b:$REPORT15" to 1)),
        MethodPlan("Lwd6;->onStop()V", 6, 69, listOf(
            Guard(56, Opcode.SPUT_OBJECT, listOf(1), "Lhff;->b:$REPORT15"),
        ), emptyList()),
        MethodPlan("Lm65;-><clinit>()V", 1, 14, listOf(
            Guard(3, Opcode.INVOKE_STATIC, emptyList(), "Lnl/flitsmeister/fmcore/data/enums/UserCountries;->defaultCountry()I"),
            Guard(5, Opcode.SPUT, listOf(0), "Lm65;->b:I"),
        ), emptyList()),
        MethodPlan("Ll1k;->toString()Ljava/lang/String;", 1, 2, listOf(
            Guard(0, Opcode.CONST_STRING, listOf(0), "kotlin.Unit"),
        ), emptyList()),
    ))

    // Root's version15 startup restoration has already restored onDestroy's
    // functional body; these lifecycle hooks never replace the body.
    exact("Lnl/flitsmeister/services/base/FlitsmeisterBaseService;", "onCreate").method.addInstruction(
        0, "invoke-static/range {p0 .. p0}, $FEED15->init15(Landroid/content/Context;)V")
    exact("Lnl/flitsmeister/services/base/FlitsmeisterBaseService;", "onDestroy").method.addInstruction(
        0, "invoke-static {}, $FEED15->stopped()V")
    exact("Lbb0;", "A", "V", "Landroid/location/Location;").method.addInstruction(
        0, "invoke-static/range {p1 .. p1}, $FEED15->location(Landroid/location/Location;)V")
    exact("Lbb0;", "onStart").method.addInstruction(0, "invoke-static {}, $FEED15->started()V")
    exact("Lbb0;", "onStop").method.addInstruction(0, "invoke-static {}, $FEED15->stopped()V")
    exact("Lwd6;", "onStop").method.addInstruction(0, "invoke-static {}, $FEED15->zoneStopped()V")
    // B later overwrites parameter register p0 with q1. Capture immediately
    // after its single native candidate write, while p0 still names the task.
    exact("Lwd6;", "B").method.addInstruction(38, "invoke-static/range {p0 .. p0}, $FEED15->zone15(Ljava/lang/Object;)V")
    val road = exact("Lirf;", "z").method
    road.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }.map { it.index }.reversed().forEach { at ->
        road.replaceInstruction(at, "invoke-static {}, $FEED15->road()V")
        road.addInstruction(at + 1, "return-void")
    }
}
