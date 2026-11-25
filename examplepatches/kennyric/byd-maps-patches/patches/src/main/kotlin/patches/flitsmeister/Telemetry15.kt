package patches.flitsmeister

import com.android.tools.smali.dexlib2.Opcode

/** Direct 15.0 automatic-upload paths. BaseService's protected upload/reset
 * continuation is ported separately after its functional body is recovered. */
internal fun telemetryLeafPlans15() = listOf(
            MethodPlan(
                "Lu61;->x(Lun4;)Ljava/lang/Object;", 19, 102,
                listOf(Guard(77, Opcode.INVOKE_STATIC, listOf(4), "Lpck;->a(Landroid/content/Context;)Ljava/lang/String;"),
                    Guard(78, Opcode.MOVE_RESULT_OBJECT, listOf(11))),
                // DeviceInfo explicitly supports an absent device ID. Do not
                // change the shared identifier used by account/report flows.
                listOf(Edit(77, "replace", "nop"), Edit(78, "replace", "const/4 v11, 0x0")),
                mapOf("Lpck;->a(Landroid/content/Context;)Ljava/lang/String;" to 1),
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
                "Lnl/flitsmeister/triphistory/domain/service/TripHistoryService;->onBaseReportEvent(Lnl/flitsmeister/fmcore/data/model/reports/BaseReport;)V", 7, 83,
                listOf(Guard(0, Opcode.INSTANCE_OF, listOf(0, 6), "Lnl/flitsmeister/fmcore/data/model/reports/AvgSpeedCheck;"),
                    Guard(1, Opcode.IF_EQZ, listOf(0), target = 9)),
                listOf(Edit(0, "body", "return-void")),
            ),
            MethodPlan(
                "Laek;->onStart()V", 4, 18,
                listOf(Guard(0, Opcode.SGET_OBJECT, listOf(0), "Lnl/flitsmeister/fmcore/models/eventbuses/RoadClosureValidationBus;->INSTANCE:Lnl/flitsmeister/fmcore/models/eventbuses/RoadClosureValidationBus;"),
                    Guard(3, Opcode.NEW_INSTANCE, listOf(1), "Lew4;")),
                listOf(Edit(0, "body", "return-void")),
            ),
            MethodPlan(
                "Lnl/flitsmeister/fmcore/feature/signalfootprints/SignalFootprintsManager;->onStart()V",
                3, 43,
                listOf(Guard(0, Opcode.IGET_OBJECT, listOf(0, 2), "Lnl/flitsmeister/fmcore/feature/signalfootprints/SignalFootprintsManager;->logTag:Ljava/lang/String;"),
                    Guard(1, Opcode.CONST_STRING, listOf(1)),
                    Guard(2, Opcode.INVOKE_STATIC, listOf(0, 1), "Ls11;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;")),
                listOf(Edit(0, "body", "return-void")),
            ),
            MethodPlan(
                "Lmc9;->onStart()V", 9, 27,
                listOf(Guard(0, Opcode.INVOKE_STATIC, emptyList(), "Lwya;->c()Las7;"),
                    Guard(1, Opcode.MOVE_RESULT_OBJECT, listOf(0)),
                    Guard(2, Opcode.NEW_INSTANCE, listOf(1), "Lmc9\$c;")),
                listOf(Edit(0, "body", "return-void")),
            ),
            MethodPlan(
                "Lmc9\$b;->run()V", 15, 201,
                listOf(Guard(0, Opcode.IGET_OBJECT, listOf(0, 14), "Lmc9\$b;->a:Lmc9;"),
                    Guard(1, Opcode.IGET_BOOLEAN, listOf(1, 0), "Lmc9;->x:Z"),
                    Guard(2, Opcode.IF_EQZ, listOf(1), target = 200)),
                listOf(Edit(0, "body", "return-void")),
            ),
            MethodPlan(
                "Lpc9;->b(Ljava/lang/String;)Ll1k;", 5, 38,
                listOf(Guard(0, Opcode.INVOKE_STATIC, emptyList(), "Llp0;->i()Lk4k;"),
                    Guard(1, Opcode.SGET, listOf(0), "Lm65;->b:I"),
                    Guard(2, Opcode.IGET_OBJECT, listOf(1, 3), "Lpc9;->a:Landroid/content/Context;")),
                listOf(Edit(0, "body", "sget-object v0, Ll1k;->a:Ll1k;\nreturn-object v0")),
            ),
            MethodPlan(
                "Lqac\$a;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;", 13, 119,
                listOf(Guard(0, Opcode.IGET, listOf(0, 11), "Lqac\$a;->b:I"),
                    Guard(1, Opcode.IGET_OBJECT, listOf(3, 11), "Lqac\$a;->q:Ljava/lang/String;"),
                    Guard(2, Opcode.IGET_OBJECT, listOf(8, 11), "Lqac\$a;->d:[Lnl/flitsmeister/metrics/model/MetricOption;")),
                listOf(Edit(0, "body", "invoke-static {p1}, Lhof;->b(Ljava/lang/Object;)V\nsget-object v0, Ll1k;->a:Ll1k;\nreturn-object v0")),
            ),
        )
