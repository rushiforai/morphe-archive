package patches.flitsmeister

import com.android.tools.smali.dexlib2.Opcode

private const val CUSTOMERS = "Lnl/flitsmeister/parking/domain/repository/customer/DefaultCustomerRepository;"
private const val SETTINGS_ROW = "Lpa6;->f(Landroidx/compose/ui/Modifier;Landroidx/compose/ui/Modifier;Ljava/lang/String;JJLi49;Lk49;Lk49;Lk49;Ljava/lang/Integer;ZZZZZZZZJLs39;Landroidx/compose/runtime/Composer;III)V"
private val unavailableCustomer15 = """
    new-instance v0, Ljava/lang/UnsupportedOperationException;
    const-string v1, "Parking is disabled by the selected patch"
    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V
    new-instance v1, Leof${'$'}a;
    invoke-direct {v1, v0}, Leof${'$'}a;-><init>(Ljava/lang/Throwable;)V
    return-object v1
""".trimIndent()

/** Six direct 15.0 boundaries. The protected MainActivity footer binding is
 * applied separately after its version-specific startup restoration. */
internal fun partnerServiceLeafPlans15() = listOf(
            MethodPlan(
                "Lx1h;->d(Landroidx/compose/ui/Modifier;Ls39;Ls39;Ls39;Ls39;Ls39;Ls39;ZLnl/flitsmeister/fmcore/data/model/vehicle/BaseVehicleProfile;Landroidx/compose/runtime/Composer;I)V",
                51, 476,
                listOf(
                    Guard(330, Opcode.INVOKE_INTERFACE, listOf(11, 12), "Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V"),
                    Guard(331, Opcode.CONST, listOf(12)),
                    Guard(332, Opcode.INVOKE_STATIC, listOf(12, 11, 5), "Lqia;->b(ILandroidx/compose/runtime/Composer;I)Ljava/lang/String;"),
                    Guard(341, Opcode.MOVE_OBJECT_FROM16, listOf(33, 41)),
                    Guard(342, Opcode.INVOKE_STATIC_RANGE, (11..37).toList(), SETTINGS_ROW),
                    Guard(344, Opcode.INVOKE_INTERFACE, listOf(11), "Landroidx/compose/runtime/Composer;->endReplaceGroup()V"),
                    Guard(364, Opcode.INVOKE_INTERFACE, listOf(11, 12), "Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V"),
                    Guard(365, Opcode.CONST, listOf(12)),
                    Guard(366, Opcode.INVOKE_STATIC, listOf(12, 11, 5), "Lqia;->b(ILandroidx/compose/runtime/Composer;I)Ljava/lang/String;"),
                    Guard(391, Opcode.MOVE_OBJECT_FROM16, listOf(33, 7)),
                    Guard(392, Opcode.INVOKE_STATIC_RANGE, (11..37).toList(), SETTINGS_ROW),
                    Guard(394, Opcode.INVOKE_INTERFACE, listOf(11), "Landroidx/compose/runtime/Composer;->endReplaceGroup()V"),
                ),
                // Keep Composer groups and all neighboring rows. Hide ads
                // independently replaces its own invocation at index 438.
                listOf(Edit(342, "replace", "nop"), Edit(392, "replace", "nop")),
            ),
            MethodPlan(
                "Lnyb;->e(Ls39;Landroidx/compose/runtime/Composer;I)V",
                30, 107,
                listOf(Guard(0, Opcode.MOVE_OBJECT_FROM16, listOf(0, 27)),
                    Guard(1, Opcode.INVOKE_VIRTUAL, listOf(0), "Ljava/lang/Object;->getClass()Ljava/lang/Class;")),
                listOf(Edit(0, "body", "return-void")),
            ),
            MethodPlan(
                "Lnyb;->q(ZLjava/lang/Boolean;Ls39;Landroidx/compose/runtime/Composer;I)V",
                34, 121,
                listOf(Guard(0, Opcode.MOVE_FROM16, listOf(0, 29)),
                    Guard(4, Opcode.INVOKE_VIRTUAL, listOf(2), "Ljava/lang/Object;->getClass()Ljava/lang/Class;")),
                listOf(Edit(0, "body", "return-void")),
            ),
            MethodPlan(
                "Lnyb;->k(Lnl/flitsmeister/models/data/account/UserAccountFM;ZLjava/lang/Long;Ls39;Landroidx/compose/runtime/Composer;I)V",
                39, 136,
                listOf(Guard(0, Opcode.MOVE_OBJECT_FROM16, listOf(1, 33)),
                    Guard(4, Opcode.INVOKE_VIRTUAL_RANGE, listOf(36), "Ljava/lang/Object;->getClass()Ljava/lang/Class;")),
                listOf(Edit(0, "body", "return-void")),
            ),
            MethodPlan(
                "$CUSTOMERS->fetchInitialCustomer-IoAF18A(Lsn4;)Ljava/lang/Object;",
                6, 34,
                listOf(Guard(0, Opcode.INSTANCE_OF, listOf(0, 5), "Lnl/flitsmeister/parking/domain/repository/customer/DefaultCustomerRepository\$fetchInitialCustomer\$1;")),
                listOf(Edit(0, "body", unavailableCustomer15)),
            ),
            MethodPlan(
                "$CUSTOMERS->fetchCustomer-gIAlu-s(Ljava/lang/String;Lsn4;)Ljava/lang/Object;",
                7, 41,
                listOf(Guard(0, Opcode.INSTANCE_OF, listOf(0, 6), "Lnl/flitsmeister/parking/domain/repository/customer/DefaultCustomerRepository\$fetchCustomer\$1;")),
                listOf(Edit(0, "body", unavailableCustomer15)),
            ),
        )
