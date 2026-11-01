package patches.flitsmeister

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.Opcode
import org.w3c.dom.Element

private const val CUSTOMERS = "Lnl/flitsmeister/parking/domain/repository/customer/DefaultCustomerRepository;"
private const val SETTINGS_ROW = "Lna6;->f(Landroidx/compose/ui/Modifier;Landroidx/compose/ui/Modifier;Ljava/lang/String;JJLp49;Lr49;Lr49;Lr49;Ljava/lang/Integer;ZZZZZZZZJLz39;Landroidx/compose/runtime/Composer;III)V"
private val partnerServiceResources = resourcePatch {
    dependsOn(originalInput)
    execute {
        document("res/layout/activity_main_bottomsheet_footer.xml").use { doc ->
            val namespace = "http://schemas.android.com/apk/res/android"
            val nodes = doc.getElementsByTagName("ImageView")
            val parking = (0 until nodes.length).map { nodes.item(it) as Element }
                .single { it.getAttributeNS(namespace, "id") == "@id/parking" }
            check(parking.getAttributeNS(namespace, "src") == "@drawable/ic_footer_parking")
            parking.setAttributeNS(namespace, "android:visibility", "gone")
            listOf("layout_width", "layout_height").forEach {
                parking.setAttributeNS(namespace, "android:$it", "0.0dip")
            }
            parking.setAttributeNS(namespace, "android:importantForAccessibility", "no")
            parking.setAttributeNS(namespace, "android:clickable", "false")
            parking.setAttributeNS(namespace, "android:focusable", "false")
        }
    }
}
private val unavailableCustomer = """
    new-instance v0, Ljava/lang/UnsupportedOperationException;
    const-string v1, "Parking is disabled by the selected patch"
    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V
    new-instance v1, Lfjf${'$'}a;
    invoke-direct {v1, v0}, Lfjf${'$'}a;-><init>(Ljava/lang/Throwable;)V
    return-object v1
""".trimIndent()

@Suppress("unused")
val disablePartnerServices = bytecodePatch(
    name = "Disable partner services",
    description = "Hides Parking, Toll and Carwash service entries, removes Parking and Carwash from Settings, and disables Parking customer fetches.",
    default = true,
) {
    compatibleWith(flitsmeister)
    dependsOn(originalInput, startupCompatibility, partnerServiceResources)
    execute {
        applyPlans(listOf(
            MethodPlan(
                "Ljxg;->d(Landroidx/compose/ui/Modifier;Lz39;Lz39;Lz39;Lz39;Lz39;Lz39;ZLnl/flitsmeister/fmcore/data/model/vehicle/BaseVehicleProfile;Landroidx/compose/runtime/Composer;I)V",
                51, 477,
                listOf(
                    Guard(331, Opcode.INVOKE_INTERFACE, listOf(11, 12), "Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V"),
                    Guard(332, Opcode.CONST, listOf(12)),
                    Guard(333, Opcode.INVOKE_STATIC, listOf(12, 11, 5), "Lria;->b(ILandroidx/compose/runtime/Composer;I)Ljava/lang/String;"),
                    Guard(342, Opcode.MOVE_OBJECT_FROM16, listOf(33, 41)),
                    Guard(343, Opcode.INVOKE_STATIC_RANGE, (11..37).toList(), SETTINGS_ROW),
                    Guard(345, Opcode.INVOKE_INTERFACE, listOf(11), "Landroidx/compose/runtime/Composer;->endReplaceGroup()V"),
                    Guard(365, Opcode.INVOKE_INTERFACE, listOf(11, 12), "Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V"),
                    Guard(366, Opcode.CONST, listOf(12)),
                    Guard(367, Opcode.INVOKE_STATIC, listOf(12, 11, 5), "Lria;->b(ILandroidx/compose/runtime/Composer;I)Ljava/lang/String;"),
                    Guard(392, Opcode.MOVE_OBJECT_FROM16, listOf(33, 7)),
                    Guard(393, Opcode.INVOKE_STATIC_RANGE, (11..37).toList(), SETTINGS_ROW),
                    Guard(395, Opcode.INVOKE_INTERFACE, listOf(11), "Landroidx/compose/runtime/Composer;->endReplaceGroup()V"),
                ),
                // Keep Composer groups and all neighboring rows. Hide ads
                // independently replaces its own invocation at index 438.
                listOf(Edit(343, "replace", "nop"), Edit(393, "replace", "nop")),
            ),
            MethodPlan(
                "Lnl/flitsmeister/fmx/activities/main/MainActivity;->onCreate(Landroid/os/Bundle;)V",
                22, 757,
                listOf(Guard(83, Opcode.IGET_OBJECT, listOf(4, 1), "Lag;->I:Landroid/widget/ImageView;"),
                    Guard(87, Opcode.INVOKE_VIRTUAL, listOf(4, 2), "Landroid/view/View;->setVisibility(I)V"),
                    Guard(90, Opcode.INVOKE_VIRTUAL, listOf(4, 5), "Landroid/view/View;->setOnClickListener(Landroid/view/View\$OnClickListener;)V")),
                listOf(Edit(87, "replace", "nop"), Edit(90, "replace", "nop")),
            ),
            MethodPlan(
                "Lvwb;->e(Lz39;Landroidx/compose/runtime/Composer;I)V",
                30, 107,
                listOf(Guard(0, Opcode.MOVE_OBJECT_FROM16, listOf(0, 27)),
                    Guard(1, Opcode.INVOKE_VIRTUAL, listOf(0), "Ljava/lang/Object;->getClass()Ljava/lang/Class;")),
                listOf(Edit(0, "body", "return-void")),
            ),
            MethodPlan(
                "Lvwb;->q(ZLjava/lang/Boolean;Lz39;Landroidx/compose/runtime/Composer;I)V",
                34, 121,
                listOf(Guard(0, Opcode.MOVE_FROM16, listOf(0, 29)),
                    Guard(4, Opcode.INVOKE_VIRTUAL, listOf(2), "Ljava/lang/Object;->getClass()Ljava/lang/Class;")),
                listOf(Edit(0, "body", "return-void")),
            ),
            MethodPlan(
                "Lvwb;->k(Lnl/flitsmeister/models/data/account/UserAccountFM;ZLjava/lang/Long;Lz39;Landroidx/compose/runtime/Composer;I)V",
                39, 136,
                listOf(Guard(0, Opcode.MOVE_OBJECT_FROM16, listOf(1, 33)),
                    Guard(4, Opcode.INVOKE_VIRTUAL_RANGE, listOf(36), "Ljava/lang/Object;->getClass()Ljava/lang/Class;")),
                listOf(Edit(0, "body", "return-void")),
            ),
            MethodPlan(
                "$CUSTOMERS->fetchInitialCustomer-IoAF18A(Ltn4;)Ljava/lang/Object;",
                6, 34,
                listOf(Guard(0, Opcode.INSTANCE_OF, listOf(0, 5), "Lnl/flitsmeister/parking/domain/repository/customer/DefaultCustomerRepository\$fetchInitialCustomer\$1;")),
                listOf(Edit(0, "body", unavailableCustomer)),
            ),
            MethodPlan(
                "$CUSTOMERS->fetchCustomer-gIAlu-s(Ljava/lang/String;Ltn4;)Ljava/lang/Object;",
                7, 41,
                listOf(Guard(0, Opcode.INSTANCE_OF, listOf(0, 6), "Lnl/flitsmeister/parking/domain/repository/customer/DefaultCustomerRepository\$fetchCustomer\$1;")),
                listOf(Edit(0, "body", unavailableCustomer)),
            ),
        ))
    }
}
