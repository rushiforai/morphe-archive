package app.rimixyz.patches.mytherapy

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.rimixyz.patches.shared.Constants.COMPATIBILITY_MYTHERAPY

private const val ADS_FREE_STATUS =
    "Leu/smartpatient/mytherapy/multiplatform/feature/appmonetization/api/model/AdsFreeProductPurchaseStatus"
private const val FLOW_KT = "Lkotlinx/coroutines/flow/FlowKt;"
private const val BOXING = "Lkotlin/coroutines/jvm/internal/Boxing;"

/**
 * Concede os benefícios do MyTherapy Plus alterando o estado local que o próprio app consulta.
 *
 * Não há fabricação de compra, token, recibo ou assinatura: o app modela o benefício como um enum
 * `AdsFreeProductPurchaseStatus` e como dois fluxes booleanos no `PaymentRepository`. O patch
 * substitui os leitores desses estados:
 *
 * - `GetAdsFreeProductPurchaseStatusUseCaseImpl.invoke` passa a emitir `PURCHASED_LIFETIME`;
 * - `PaymentRepositoryImpl.getHasActiveSubscription` e `getHasLifetimeAccess` emitem `true`;
 * - `HasUserMadeOneTimePaymentUseCaseImpl.invoke` devolve `true`.
 *
 * Isso percorre exatamente a cadeia que o relatório identificou: `ShouldShowAdsUseCaseImpl` usa
 * `isPurchased(status)` para decidir "mostrar anúncios"; `IsRemoveAdsVisibleUseCase`,
 * `SettingsManageSubscriptionItemProviderImpl` e os providers de propriedades de analytics
 * consomem os mesmos sinais. O cálculo de calendário/tarefas permanece local e agora encontra o
 * estado de assinatura ativa esperado pela UI.
 *
 * Limite documentado: a solicitação de PDF é uma operação HTTP remota e a autorização final do
 * serviço da publicadora continua fora do APK. O patch habilita a interface e o estado local;
 * não pode obrigar o backend a gerar/entregar o relatório.
 */
@Suppress("unused")
val unlockPlusBenefitsInMyTherapyPatch = patch(
    name = "Unlock Plus benefits",
    description = "Grants the local Plus state the app reads for ad-free access, extra calendar days and the PDF entry point.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MYTHERAPY)

    execute {
        verifyMyTherapyTarget()

        // Status ad-free comprado (vitalício) -> o árbitro de anúncios passa a devolver false.
        GetAdsFreeStatusFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, $ADS_FREE_STATUS;->PURCHASED_LIFETIME:$ADS_FREE_STATUS;
                invoke-static {v0}, $FLOW_KT->flowOf(Ljava/lang/Object;)Lkotlinx/coroutines/flow/Flow;
                move-result-object v0
                return-object v0
            """.trimIndent(),
        )

        val trueFlow = """
            const/4 v0, 0x1
            invoke-static {v0}, $BOXING->boxBoolean(Z)Ljava/lang/Boolean;
            move-result-object v0
            invoke-static {v0}, $FLOW_KT->flowOf(Ljava/lang/Object;)Lkotlinx/coroutines/flow/Flow;
            move-result-object v0
            return-object v0
        """.trimIndent()
        HasActiveSubscriptionFlowFingerprint.method.addInstructions(0, trueFlow)
        HasLifetimeAccessFlowFingerprint.method.addInstructions(0, trueFlow)

        HasOneTimePaymentFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                invoke-static {v0}, $BOXING->boxBoolean(Z)Ljava/lang/Boolean;
                move-result-object v0
                return-object v0
            """.trimIndent(),
        )
    }
}
