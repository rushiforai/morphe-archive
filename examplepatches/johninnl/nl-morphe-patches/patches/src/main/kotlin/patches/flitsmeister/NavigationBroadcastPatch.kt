package patches.flitsmeister

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

private const val FEED = "Lnl/johninnl/flitsmeister/NavigationBroadcasts;"

@Suppress("unused")
val navigationBroadcastPatch = bytecodePatch(
    name = "Broadcast navigation data",
    description = "Shares current speed, road limits, road alerts and approaching/active average-speed zones with compatible local apps, also in the background without an overlay.",
    default = true,
) {
    compatibleWith(flitsmeister)
    dependsOn(startupCompatibility)
    extendWith("extensions/flitsmeister.mpe")
    val receiverPackage by stringOption(
        key = "receiverPackage", default = "", title = "Receiver package",
        description = "Optional target Android package. Blank sends to running compatible local receivers.",
    )
    execute {
        val target = receiverPackage.orEmpty().trim()
        if (target.isNotEmpty() && !Regex("[A-Za-z][A-Za-z0-9_]*(\\.[A-Za-z][A-Za-z0-9_]*)+").matches(target))
            throw PatchException("Receiver package is not an Android package name")
        patches.waze.returnString(FEED, "receiverPackage", target)

    }
    // Other Flitsmeister controls validate fixed instruction layouts in execute.
    // Add hooks only after those guarded edits have completed.
    finalize {
        // originalInput enforces publisher/version metadata. Resolve every producer
        // before mutating, and guard its semantic reference independently.
        // These exact artifact bindings are used reflectively by the background report subscription.
        exact("Lnl/flitsmeister/fmcore/models/eventbuses/AppNotificationBus;", "getBusAlertedReports", "Lfs7;")
        exact("Lfs7;", "b", "Lis7;", "Lb49;")
        exact("Lb49;", "invoke", "Ljava/lang/Object;", "Ljava/lang/Object;")
        exact("Lnl/flitsmeister/fmcore/models/eventbuses/AlertedReport;", "getReport", "Lnl/flitsmeister/fmcore/data/model/reports/BaseReport;")
        exact("Lnl/flitsmeister/fmcore/models/eventbuses/AlertedReport;", "isActive", "Z")
        val create = exact("Lnl/flitsmeister/services/base/FlitsmeisterBaseService;", "onCreate").method
        val destroy = exact("Lnl/flitsmeister/services/base/FlitsmeisterBaseService;", "onDestroy").method
        val location = exact("Lab0;", "A", "V", "Landroid/location/Location;").method
        val start = exact("Lab0;", "onStart").method
        val stop = exact("Lab0;", "onStop").method
        val zoneStop = exact("Liz0;", "onStop").method
        val road = exact("Lomf;", "z").method
        val zone = exact("Liz0;", "c", "V", "Landroid/location/Location;", "F", "Ljava/lang/String;").method
        check(location.instructions.any { (it as? ReferenceInstruction)?.reference?.toString() == "Lbb0;-><init>(Lab0;Landroid/location/Location;Ltn4;)V" })
        check(road.instructions.any { (it as? ReferenceInstruction)?.reference?.toString() == "Lnl/flitsmeister/fmcore/models/eventbuses/RoadInfoBus;->getBusMaxSpeed()Lfs7;" })
        check(zone.instructions.any { (it as? ReferenceInstruction)?.reference?.toString() == "Liz0;->d:Lnl/flitsmeister/fmcore/data/model/reports/AvgSpeedCheck;" })
        create.addInstruction(0, "invoke-static/range {p0 .. p0}, $FEED->init(Landroid/content/Context;)V")
        destroy.addInstruction(0, "invoke-static {}, $FEED->stopped()V")
        location.addInstruction(0, "invoke-static/range {p1 .. p1}, $FEED->location(Landroid/location/Location;)V")
        start.addInstruction(0, "invoke-static {}, $FEED->started()V")
        zoneStop.addInstruction(0, "invoke-static {}, $FEED->zoneStopped()V")
        stop.addInstruction(0, "invoke-static {}, $FEED->stopped()V")
        // Replace the return itself to retain incoming labels at the hook; simple
        // insertion before a return can be skipped by existing branch targets.
        listOf(road to "invoke-static {}, $FEED->road()V",
            zone to "invoke-static/range {p0 .. p1}, $FEED->zone(Ljava/lang/Object;Landroid/location/Location;)V").forEach { (method, hook) ->
            val returns = method.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }.map { it.index }
            check(returns.isNotEmpty()) { "Missing navigation producer completion" }
            returns.reversed().forEach { at ->
                method.replaceInstruction(at, hook)
                method.addInstruction(at + 1, "return-void")
            }
        }
    }
}
