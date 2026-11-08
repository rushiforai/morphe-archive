package app.template.patches.carscanner


import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

private const val FAKE_PRO = "Lapp/morphe/extension/carscanner/FakePro;"
private const val LISTENER = "Lcrc64f0146600faa7a777/InternalPurchasesResponseListener;"
private const val BILLING_RESULT = "Lcom/android/billingclient/api/BillingResult;"

@Suppress("unused")
val carScannerUnlockProPatch = bytecodePatch(
    name = "Unlock Pro",
    description = "Unlocks Car Scanner Pro features.",
) {
    compatibleWith(CAR_SCANNER_COMPATIBILITY)
    extendWith("extensions/extension.mpe")

    execute {
        mutableClassDefBy(LISTENER)
            .methods
            .first {
                it.name == "onQueryPurchasesResponse" && it.returnType == "V" &&
                    it.parameterTypes.size == 2 && it.implementation != null
            }
            .addInstructions(
                0,
                """
                    invoke-static {p1}, $FAKE_PRO->result(Ljava/lang/Object;)Ljava/lang/Object;
                    move-result-object p1
                    check-cast p1, $BILLING_RESULT
                    invoke-static {p2}, $FAKE_PRO->purchases(Ljava/util/List;)Ljava/util/List;
                    move-result-object p2
                """,
            )
    }
}
