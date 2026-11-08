package app.morphe.patches.icsee

import app.morphe.patcher.Fingerprint

// Os nomes das classes de pacote (com.xworld.dialog.HomePopManager etc.) não são ofuscados,
// mas os nomes dos métodos são (a, b, d, i...). Por isso o encaixe é feito pela classe +
// tipo de retorno + parâmetros, nunca pelo nome do método.
// Sem accessFlags: os métodos são "public final" e o Morphe exige igualdade exata.

private const val HOME_POP_MANAGER = "Lcom/xworld/dialog/HomePopManager;"
private const val BASE_ACTIVITY = "Lcom/mobile/base/BaseActivity;"

// HomePopManager.i(BaseActivity): faz o pedido ao servidor (campaignType=2) da janela
// promocional que abre na tela de dispositivos.
internal object HomePopRequestFingerprint : Fingerprint(
    definingClass = HOME_POP_MANAGER,
    returnType = "V",
    parameters = listOf(BASE_ACTIVITY),
)

// HomePopManager.d(banner, activity, userId, appKey, Boolean): monta e mostra a janela
// promocional. É chamado pela própria classe e pelas telas de monitor (MonitorFragment$15
// e WbsMonitorFragment$14), por isso também precisa ser bloqueado.
internal object HomePopShowFingerprint : Fingerprint(
    definingClass = HOME_POP_MANAGER,
    returnType = "V",
    parameters = listOf(
        "Lcom/xworld/data/XMBannerInfoBean;",
        BASE_ACTIVITY,
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/Boolean;",
    ),
)
