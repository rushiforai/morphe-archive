package patches.flitsmeister

import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode

/** Automatic trajectory and usage uploads, separate from explicit reports. */
internal val firstPartyTelemetry = bytecodePatch {
    dependsOn(originalInput)
    execute {
        applyPlans(listOf(
            MethodPlan(
                "Lnl/flitsmeister/services/base/FlitsmeisterBaseService;->onStartCommand(Landroid/content/Intent;II)I", 41, 794,
                listOf(Guard(627, Opcode.SGET_OBJECT, listOf(0), "Lpsj;->a:Lpsj;"),
                    Guard(633, Opcode.IGET_OBJECT, listOf(3, 3), "Lib;->b:Lnl/flitsmeister/models/data/account/UserAccountFM;"),
                    Guard(634, Opcode.IF_EQZ, listOf(3), target = 688),
                    Guard(688, Opcode.INVOKE_VIRTUAL, listOf(0, 1), "Lpsj;->n(Landroid/content/Context;)V")),
                // Take the existing local statistics-reset continuation; do not
                // orphan the callback that normally follows a remote upload.
                listOf(Edit(634, "goto", target = 688)),
            ),
            MethodPlan(
                "Lp61;->x(Lvn4;)Ljava/lang/Object;", 19, 102,
                listOf(Guard(77, Opcode.INVOKE_STATIC, listOf(4), "Ld7k;->a(Landroid/content/Context;)Ljava/lang/String;"),
                    Guard(78, Opcode.MOVE_RESULT_OBJECT, listOf(11))),
                // DeviceInfo explicitly supports an absent device ID. Do not
                // change the shared identifier used by account/report flows.
                listOf(Edit(77, "replace", "nop"), Edit(78, "replace", "const/4 v11, 0x0")),
                mapOf("Ld7k;->a(Landroid/content/Context;)Ljava/lang/String;" to 1),
            ),
            MethodPlan(
                "Lbemobile/cits/sdk/core/manager/CITSRequestManager;->sendEventMonitoringAndEvaluation(Lbemobile/cits/sdk/core/model/enums/monitoring/UseCase;Lbemobile/cits/sdk/core/model/request/MonitoringEvent;Lbemobile/cits/sdk/core/model/request/MonitoringAlert;Ljava/lang/String;)V", 16, 38,
                listOf(Guard(0, Opcode.INVOKE_VIRTUAL, listOf(12), "Ljava/lang/Object;->getClass()Ljava/lang/Class;"),
                    Guard(3, Opcode.INVOKE_VIRTUAL, listOf(15), "Ljava/lang/Object;->getClass()Ljava/lang/Class;"),
                    Guard(4, Opcode.SGET_OBJECT, listOf(0), "Lbemobile/cits/sdk/core/model/request/MonitoringEvaluationEvent;->Companion:Lbemobile/cits/sdk/core/model/request/MonitoringEvaluationEvent\$Companion;")),
                listOf(Edit(0, "body", "return-void")),
            ),
            MethodPlan(
                "Lbemobile/cits/sdk/core/service/task/CITSSensorSamplingTask;->onStart()V", 10, 18,
                listOf(Guard(0, Opcode.IGET_OBJECT, listOf(0, 9), "Lbemobile/cits/sdk/core/service/task/CITSSensorSamplingTask;->sensorManager:Lbemobile/cits/sdk/core/manager/CITSSensorManager;"),
                    Guard(1, Opcode.INVOKE_VIRTUAL, listOf(0), "Lbemobile/cits/sdk/core/manager/CITSSensorManager;->start()V")),
                listOf(Edit(0, "body", "return-void")),
            ),
            MethodPlan(
                "Lnl/flitsmeister/triphistory/domain/service/TripHistoryService;->onBaseReportEvent(Lnl/flitsmeister/fmcore/data/model/reports/BaseReport;)V", 7, 84,
                listOf(Guard(0, Opcode.INSTANCE_OF, listOf(0, 6), "Lnl/flitsmeister/fmcore/data/model/reports/AvgSpeedCheck;"),
                    Guard(1, Opcode.IF_EQZ, listOf(0), target = 9)),
                listOf(Edit(0, "body", "return-void")),
            ),
            MethodPlan(
                "Lm8k;->onStart()V", 4, 18,
                listOf(Guard(0, Opcode.SGET_OBJECT, listOf(0), "Lnl/flitsmeister/fmcore/models/eventbuses/RoadClosureValidationBus;->INSTANCE:Lnl/flitsmeister/fmcore/models/eventbuses/RoadClosureValidationBus;"),
                    Guard(3, Opcode.NEW_INSTANCE, listOf(1), "Lnlc;")),
                listOf(Edit(0, "body", "return-void")),
            ),
            MethodPlan(
                "Lnl/flitsmeister/fmcore/feature/signalfootprints/SignalFootprintsManager;->onStart()V",
                3, 43,
                listOf(Guard(0, Opcode.IGET_OBJECT, listOf(0, 2), "Lnl/flitsmeister/fmcore/feature/signalfootprints/SignalFootprintsManager;->logTag:Ljava/lang/String;"),
                    Guard(1, Opcode.CONST_STRING, listOf(1)),
                    Guard(2, Opcode.INVOKE_STATIC, listOf(0, 1), "Lsx1;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;")),
                listOf(Edit(0, "body", "return-void")),
            ),
            MethodPlan(
                "Lad9;->onStart()V", 9, 26,
                listOf(Guard(0, Opcode.INVOKE_STATIC, emptyList(), "Lnya;->c()Lfs7;"),
                    Guard(1, Opcode.MOVE_RESULT_OBJECT, listOf(0)),
                    Guard(2, Opcode.NEW_INSTANCE, listOf(1), "Lad9\$c;")),
                listOf(Edit(0, "body", "return-void")),
            ),
            MethodPlan(
                "Lad9\$b;->run()V", 15, 200,
                listOf(Guard(0, Opcode.IGET_OBJECT, listOf(0, 14), "Lad9\$b;->a:Lad9;"),
                    Guard(1, Opcode.IGET_BOOLEAN, listOf(1, 0), "Lad9;->x:Z"),
                    Guard(2, Opcode.IF_EQZ, listOf(1), target = 199)),
                listOf(Edit(0, "body", "return-void")),
            ),
            MethodPlan(
                "Ldd9;->b(Ljava/lang/String;)Ltvj;", 5, 38,
                listOf(Guard(0, Opcode.INVOKE_STATIC, emptyList(), "Lt25;->h()Lqyj;"),
                    Guard(1, Opcode.SGET, listOf(0), "Lr65;->b:I"),
                    Guard(2, Opcode.IGET_OBJECT, listOf(1, 3), "Ldd9;->a:Landroid/content/Context;")),
                listOf(Edit(0, "body", "sget-object v0, Ltvj;->a:Ltvj;\nreturn-object v0")),
            ),
            MethodPlan(
                "Li8c;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;", 13, 118,
                listOf(Guard(0, Opcode.IGET, listOf(0, 11), "Li8c;->b:I"),
                    Guard(1, Opcode.IGET_OBJECT, listOf(3, 11), "Li8c;->q:Ljava/lang/String;"),
                    Guard(2, Opcode.IGET_OBJECT, listOf(8, 11), "Li8c;->d:[Lnl/flitsmeister/metrics/model/MetricOption;")),
                listOf(Edit(0, "body", "invoke-static {p1}, Lijf;->b(Ljava/lang/Object;)V\nsget-object v0, Ltvj;->a:Ltvj;\nreturn-object v0")),
            ),
        ))
    }
}
