package lab.yahoofinance.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Yahoo Finance 26.21.2, versionCode 1360038759 (base.apk/classes.dex).
 *
 * Test A2: the existing SubscriptionManagerHilt.p(SubscriptionFeature):boolean
 * returns true only for SubscriptionFeature.AdsFree. For all other features,
 * the original bytecode executes unchanged. No billing, purchase, tier or
 * persistent entitlement state is modified.
 *
 * The original method has exactly TWO registers, both used for parameters:
 * v0 = p0 (this), v1 = p1 (feature). The insertion occurs after the original
 * j(feature) call and move-result-object: v0 then holds FeatureAccessibility,
 * and v1 is about to be overwritten by sget-object HAS_ACCESS. This allows
 * checking AdsFree in v1 without breaking the non-AdsFree fallthrough.
 *
 * Logcat: YF-RemoveAds / YF-20261031-A2.
 */
@Suppress("unused")
val yahooFinanceRemoveAdsPatch = bytecodePatch(
    name = "Yahoo Finance - Remove ads A2",
    description = "Test: enables only the AdsFree UI check; leaves other subscription features and purchases unchanged. Logs YF-RemoveAds.",
    default = false
) {
    compatibleWith(
        Compatibility(
            name = "Yahoo Finance",
            packageName = "com.yahoo.mobile.client.android.finance",
            targets = listOf(AppTarget(version = "26.21.2"))
        )
    )

    execute {
        val owner = "Lcom/yahoo/mobile/client/android/finance/subscription/a0;"
        val feature = "Lcom/yahoo/mobile/client/android/finance/subscription/v2/model/SubscriptionFeature;"
        val accessibility = "Lcom/yahoo/mobile/client/android/finance/subscription/SubscriptionManager\$FeatureAccessibility;"
        val method = Fingerprint(
            definingClass = owner,
            name = "p",
            returnType = "Z",
            parameters = listOf(feature)
        ).method

        val body = method.implementation
            ?: error("Yahoo Finance: feature-access check has no bytecode")
        val original = body.instructions.toList()
        val originalOpcodes = listOf(
            Opcode.INVOKE_VIRTUAL,
            Opcode.INVOKE_VIRTUAL,
            Opcode.MOVE_RESULT_OBJECT,
            Opcode.SGET_OBJECT,
            Opcode.IF_NE,
            Opcode.CONST_4,
            Opcode.RETURN,
            Opcode.CONST_4,
            Opcode.RETURN
        )
        val getClass = (original.getOrNull(0) as? ReferenceInstruction)?.reference as? MethodReference
        val lookup = (original.getOrNull(1) as? ReferenceInstruction)?.reference as? MethodReference
        val hasAccess = (original.getOrNull(3) as? ReferenceInstruction)?.reference as? FieldReference
        require(
            body.registerCount == 2 &&
                original.map { it.opcode } == originalOpcodes &&
                getClass?.definingClass == "Ljava/lang/Object;" &&
                getClass?.name == "getClass" &&
                lookup?.definingClass == owner &&
                lookup?.name == "j" &&
                lookup?.returnType == accessibility &&
                lookup?.parameterTypes?.toList() == listOf(feature) &&
                (original[2] as? OneRegisterInstruction)?.registerA == 0 &&
                (original[3] as? OneRegisterInstruction)?.registerA == 1 &&
                hasAccess?.definingClass == accessibility &&
                hasAccess?.name == "HAS_ACCESS" &&
                hasAccess?.type == accessibility
        ) {
            "Yahoo Finance: p() differs from the verified original DEX (26.21.2)"
        }

        // At index 3, p0 is the already-computed access state, and p1 is no
        // longer needed: the next original instruction overwrites p1 with the
        // HAS_ACCESS enum. The non-AdsFree branch therefore remains intact.
        method.addInstructionsWithLabels(
            3,
            """
                instance-of p1, p1, Lcom/yahoo/mobile/client/android/finance/subscription/v2/model/SubscriptionFeature${'$'}AdsFree;
                if-eqz p1, :morphe_original
                const-string p0, "YF-RemoveAds"
                const-string p1, "YF-20261031-A2 AdsFree forced true"
                invoke-static {p0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
                const/4 p0, 0x1
                return p0
                :morphe_original
                nop
            """.trimIndent()
        )
    }
}
