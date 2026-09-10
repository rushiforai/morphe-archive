package app.template.patches.scannerradio

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_SCANNERRADIO

/**
 * Disables Pairip DRM (Google Play Integrity) that crashes patched APKs.
 *
 * Entry points patched:
 * 1. StartupLauncher.launch() — no-op to prevent VMRunner/native lib loading.
 * 2. com.pairip.application.Application.attachBaseContext() — skip DRM checks.
 * 3. MyApplication.onCreate() — bulk-init R8 dedup fields + call parent for Hilt DI.
 * 4. 12 pairip-injected lifecycle methods (TTvRdCYPAWUKRE + qtcicW) — replace
 *    reflection dispatch with invoke-super to parent class.
 */
@Suppress("unused")
val pairipBypassPatch = bytecodePatch(
    name = "Pairip DRM Bypass",
    description = "Disables Pairip DRM/integrity checks that crash patched APKs on startup.",
    default = true
) {
    compatibleWith(COMPATIBILITY_SCANNERRADIO)

    execute {
        // Entry point 1: prevent CoreComponentFactory → StartupLauncher → VMRunner chain
        StartupLauncherFingerprint.method.addInstructions(0, "return-void")

        // Entry point 2: skip SignatureCheck + LicenseClient + VMRunner.setContext
        PairipApplicationFingerprint.method.addInstructions(
            0,
            "invoke-super {p0, p1}, Lcom/scannerradio/MyApplication;->attachBaseContext(Landroid/content/Context;)V\nreturn-void"
        )

        // Entry point 3: R8 dedup init + Hilt DI setup
        MyApplicationOnCreateFingerprint.method.addInstructions(0, buildR8Init())

        // Entry point 4: patch all 12 pairip-injected lifecycle methods
        // Each was replaced with TTvRdCYPAWUKRE/qtcicW Method.invoke() dispatch.
        // Without VMRunner the Method fields are null → NPE. Replace with invoke-super.
        for ((fp, superCall) in INJECTED_METHODS) {
            fp.method.addInstructions(0, "invoke-super {p0}, $superCall\nreturn-void")
        }
    }
}

private fun buildR8Init(): String {
    val sb = StringBuilder()
    sb.append("const-string v0, \"\"\n")
    for ((cls, fields) in R8_DEDUP_CLASSES) {
        for (field in fields) {
            sb.append("sput-object v0, ").append(cls).append(";->").append(field).append(":Ljava/lang/String;\n")
        }
    }
    sb.append("invoke-super {p0}, Lcom/scannerradio/a;->onCreate()V\n")
    sb.append("return-void")
    return sb.toString()
}

/**
 * All 12 pairip-injected lifecycle methods mapped to their super class invoke-super target.
 * TTvRdCYPAWUKRE (5) + qtcicW (7).
 * Each method's body was replaced with Method.invoke() dispatch; without VMRunner
 * the Method fields are null. We replace with invoke-super to parent class.
 */
@Suppress("unused")
private val INJECTED_METHODS = mapOf(
    // TTvRdCYPAWUKRE injections
    FavoritesPickerOnStartFingerprint to "Lcom/scannerradio/activities/Hilt_FavoritesPickerActivity;->onStart()V",
    LocaleEditOnDestroyFingerprint to "Lcom/twofortyfouram/locale/sdk/client/ui/activity/AbstractPluginActivity;->onDestroy()V",
    LocaleEditOnStartFingerprint to "Lcom/twofortyfouram/locale/sdk/client/ui/activity/AbstractPluginActivity;->onStart()V",
    MyMediaBrowserServiceOnCreateFingerprint to "Lym3;->onCreate()V",
    WidgetConfigure4x1FavoritesOnCreateFingerprint to "Lcom/scannerradio/widgets/WidgetConfigureFavorites;->onCreate(Landroid/os/Bundle;)V",
    // qtcicW injections
    FavoritesPickerOnDestroyFingerprint to "Lcom/scannerradio/activities/Hilt_FavoritesPickerActivity;->onDestroy()V",
    FavoritesPickerOnStopFingerprint to "Lcom/scannerradio/activities/Hilt_FavoritesPickerActivity;->onStop()V",
    MainActivityOnStartFingerprint to "Lcom/scannerradio/ui/main/Hilt_MainActivity;->onStart()V",
    MainActivityOnStopFingerprint to "Lcom/scannerradio/ui/main/Hilt_MainActivity;->onStop()V",
    MyMediaBrowserServiceOnDestroyFingerprint to "Lym3;->onDestroy()V",
    WidgetConfigure4x2FavoritesOnCreateFingerprint to "Lcom/scannerradio/widgets/WidgetConfigureFavorites;->onCreate(Landroid/os/Bundle;)V",
    LinkActivityOnCreateFingerprint to "Lcom/scannerradio/activities/Hilt_LinkActivity;->onCreate(Landroid/os/Bundle;)V"
)

@Suppress("unused")
private val R8_DEDUP_CLASSES = arrayOf(
    "Landroidx/media3/common/util/yx/sjJeZY;" to arrayOf(
        "AKHhGmPEdtQeTh","AlwMp","CPgBRDrXIqAdZa","FNwZMZLO","FjrMQcZ",
        "HKrJGMIUEGLGf","IYNdR","IrWH","JDoVaE","KEqWVsjtb",
        "KsPpkWTv","LTIYyhOrnsQ","LojOdhQ","NHKlIHfaSdylhA","NLKMLP",
        "PTrTnrxnsS","RXoFSgjdW","RfjxMKY","WsOHIUBQZ","ZARsTCUslH",
        "dWxRQoreV","eOVC","fItAOysWM","iElRfEOJYu","iQIhnhPBYvUJvP",
        "jnEmkCGKrq","kPYXOUchOjWsALL","kkkqjnLTmssnr","mqXbvqRXUx","olrmYCpjEh",
        "otQnrjj","sfbnGQrbFMbR","tWYrrCprWpZN","tvtZTSCaOcbigE","uBi",
        "wZuvGwePN","wjxgBh","xcKUSBkAGf","yIVln","ylxvNVigUXZjc"
    ),
    "Lcom/applovin/creative/YMvL/wAwfOa;" to arrayOf(
        "CGgcPFvt","CSQ","EddBxmVHj","FblmzBui","HAl","HbNgtTvTBRlfy",
        "JrnUtGF","KVZ","Khjtyce","OnMOWtVvXC","PgxkBIpbdWVK","QDD",
        "RMMjjOtB","RjpSymt","RlvdgQXBLBQcoDH","UStyTbJAb","UrbssIlzj",
        "VTRlufztytwAG","WbKcUS","XQrjbbKVrtIldY","XhDKEU","Yfk",
        "YpcZKKEODcMU","ZHLCDbuNInJrd","ZgmWr","bAnzioFMcNGyRN","bLpypQ",
        "czII","deZPQWUF","dfUccaDbKcGX","dxx","eHPxnml",
        "evERVQEtSxUknG","gkyYSNQDz","hmFtkvMyr","kTTupYIWm","lpTU",
        "mSAVsjY","oOcTY","oxCezEghhwv","pXtK","qRrrbZUY",
        "rfRKzBe","rfhdhVGcBhC","tHpyzCY","tJCJ","tKSJtHQDqjzPRX",
        "yTgW","zfvKlCJbpC"
    ),
    "Lcom/applovin/mediation/adapter/listeners/Rdm/kODEQvEPdJS;" to arrayOf(
        "AyWfVGeK","CuCGxWQW","DUZoL","EtsrCsD","FfWx","GZkRDadppk",
        "HpsCaCGGwSsPyza","HuWTwDMWwecb","IIrOIc","LBhmgZ","OFRUkxujdfQ",
        "PKUKbIZAYAl","Qmal","QxLllhnZQRYGAlr","RWjPj","RpNXijWzENycQyv",
        "SJqkXX","XXPP","XZJ","YcqyDIhiCxlGjm","YepsEv","YpJLPpwoYhbyE",
        "aKcZXiNMJM","bNor","btfWsDoFVDfQ","cUwtMKOygStmH","dWnvNfaVqzjSxG",
        "dfPYDsLFTNKrJ","eJcA","fcbh","fjxBom","gGA","gHywEzlbahKJA",
        "hPnfRasF","jVTmR","nSns","oFEhS","ohE","qoEzycNNitSVQ",
        "siJDAGb","swbB","vfCKyuVFahptEa","vsRWkPsiYcmvEM","wybmBOHaeScmRXS",
        "zVXDsxK"
    ),
    "Lcom/applovin/shadow/okhttp3/internal/authenticator/WVBh/UjAZKBtrGkwWp;" to arrayOf(
        "DdYDz","ExA","FbNpnsiKivWCYi","GNndGiUFajsDi","IOaHLzD","JMmTaKbo",
        "JrMEiaS","KEIZllkxh","LvoRHv","NMjIlacJ","OjsKz","QNeiM",
        "QpUJ","QunIDL","ROBYWximr","SVHGcsCdaKmuAM","UEPYrgmcxoobsOn",
        "VrvgKjdzOkDyZ","bdyuV","bkHjGRsXL","dhoxarllaCRau","egXknNsR",
        "fMO","giQjfkMuhiua","gnWPA","hEqmYzQl","iORs","jtUfjZxEFwdPf",
        "kcwToTuIv","kxORxTcdG","leDqvazSG","lobKfnt","nJUgAtJKf",
        "nNhivfVfDhTffL","oBowvyMZEx","oSEbMVjQM","oZyhmBha","puFcRCJxIKFqzuR",
        "qNjGpklw","qyyu","ststaFPlkRkwYi","vyIqJQbzBoYQFH","wEGxhPqgpKbIO",
        "wLX","wbIBYpnJUFwyacu","wtcYtT","yKlyuy","zUnRBlu"
    ),
    "Lcom/facebook/common/Yws/AjUqBsqUll;" to arrayOf(
        "AkxAiG","Bsa","CZe","EYJHvEZPxMDUjHa","FzdOtbzykNXjj","GYQD",
        "HBzDrWp","IhpiZlhcdADuO","IyVuXqUHCK","JIbnIbVtl","JuvgJ",
        "LAehpyrz","LMQUin","LcQ","MAlRPrBrsDKT","NML","OMObgsc",
        "OSS","QhxX","QxZBDLMxYBI","RSjHPmYvZLpwF","RSwgsJoH","RsIyE",
        "VKZfvM","WCpAUKbKXJ","XPjaXxnlsuZ","XaXR","YIKvVBrVC",
        "aXNYMM","dLKGTPnfJW","dVAReEjNBlMZ","eJSjkVvJoNm","etrt",
        "fTgPcTuGmIwu","fnjqSe","fqB","gfoWqSUpKC","ktWKtMf",
        "lZGYBqwHDc","nAf","nsXZCtZ","oPyLGJ","pSVjlJPSMbtS",
        "qagr","qhQXutjeGMzXG","qnwJd","qpDEwxkFEvbd","rDq",
        "rjQdUKArAoSAEa","uFKgJKkSHbpnYJi","vJFvMGHWP","xTqbelwbc",
        "ymsfvJrcz","ysIHtgzYVPp"
    ),
    "Lcom/fyber/fairbid/mediation/adapter/HAYI/LFPouIMuoijQQL;" to arrayOf(
        "Aqlz","BEoagLgaOVDo","BNJKiWlNs","CDG","DrVFKD","FjuFBfu",
        "GlvcR","HSszoaunqw","IHpirWffIWO","InBfFwrFz","KWqKshy",
        "MHsaeZBYEZThKs","NmYGdAk","SWmJrX","SorVtCxYj","SsKvZaTxuAIeddI",
        "UEWeVLeurWLHL","VnjC","XtaI","YIFYSknjmsnrI","YjWMSQ","ZEv",
        "cFtMURx","cHsYvpjxOyR","dRy","dlwFMupJp","dmBOV","egUxrd",
        "frDrMxw","frJSpiTrUiuS","jTYvtLV","mHAeC","oLQfTdC",
        "oXLeqyCMoR","qNywPirImX","qxqsWqlRsu","sPcIcsUqUAy","tLQKsOEIHIayI",
        "uXaAnBHOPqHRh","wNQiCjmZr","xeJTcGT","ySnRQQRkAv","ziL"
    ),
    "Lcom/fyber/inneractive/sdk/config/global/features/dgKT/yrqICfVVwWBNgb;" to arrayOf(
        "AwNKDtPb","BXcEHEfdvPjd","ChPKad","EHGkte","GeDjzbcmnzZD","HYuqlLSE",
        "IofhnpNCek","KJDIQTVEgXNw","LZPQTlIgoaKRBc","LqLHV","LzhLFYHvULhi",
        "MWL","Nwur","OBrmwWqpfUmnQ","PzXQEloOpdGNkv","RAeHBnugVFxT",
        "RoCwtHTAwzxQ","RvATKvvLaA","TCOibyzLOJuWKk","VRYfUuSVYjMKc","WoaIUHT",
        "XEpB","XFWxRLoIojpyya","XaiKtqnEtNsnOA","XlJPRrlgppbu","YTXTPaQeGmJf",
        "ZJLLjcOoQr","ZQOSoxS","ZUZEoBWpOPWVz","ZZxoerTpH","ZavCtmaF",
        "aNWxDcu","beBGMkb","dZoQSfOuIXKrGzq","dmKhvZVZNJqdJd","dnXxmbhGgg",
        "eboyFmuDD","ekJnYRoDvLlMo","fFwlp","hCqyFuVnrc","iamEBmA",
        "ikfOwvqNwGU","ktJVPtywP","lMjWnfLom","lZxvB","lznM","mCpE",
        "mQZXEQbDlPKHVm","nCWRmmAqf","nWtQvNWM","npCLBZVura","oKopjpgdHy",
        "pIGywGlnVVuX","pvwNz","qlGpQNsrQd","rgdqlFvyqcpmbRy","rxmKZUi",
        "sUFSPOcT","skcJYLtRzZNpyTq","vQGxdpVz","wLdGHgOp","xmaBno"
    ),
    "Lcom/fyber/inneractive/sdk/gpp/OTVA/OXOK;" to arrayOf(
        "AUVpkhC","AWtpWiumZVBx","AzQjaweWrU","BAWSptixJ","CBSIF","EfbXG",
        "GxUjEtIKpb","HRKHsgSkwsAefd","IWHg","JCiH","LPnSXsZBtBd",
        "LTsMbVKFccmuDg","MtdWkYsxD","OIOS","OPq","PPDlnpxk",
        "PWvMMmKrdqrzrS","SirSRSHand","StxnQBQ","TpCyelkdn","WaQqAzQT",
        "XNpHij","XXkvza","XmauwKgvaBUaEh","YNJlkyWmsmsZPw","bBvRDTCqRlI",
        "bgorMmbuYcJm","exiWoXgaqVgQ","ezsW","fXikVazRMNo","gQUGlXzJpiTagAu",
        "gwRNPgUDfkeQdo","ipvxwyyDxtbVoGz","jNJRYzybtThm","kKyiB","nJsFSWBoBHehsR",
        "nNQy","ndNCnlWHkfllMM","oPJEhysXOl","qdaO","rcenz","rkJ",
        "rmJucpG","rmnGvzT","sdozToMqDCBcHhR","uBFy","uNAVyRsENr",
        "vihdLZLVrhpssjO","wVZPufzINJJLb"
    ),
    "Lcom/fyber/inneractive/sdk/ignite/events/wrappers/oLU/alMC;" to arrayOf(
        "ArIozAPxor","CXDOqjx","GTtvzRlOHT","KSuIsFqeSzKan","LzlACfA","MmFTM",
        "MzdPbX","QHVfDEroZixTz","QoAEZH","QyFZFsp","RMflUdii","RUjA",
        "SnmpqwGveRPew","TdARh","TfB","UMjrby","UUNnNSxuFrvFCa","VEuupo",
        "VaaV","XffFFugqE","YCRgfvApKPuXKr","aeERFXTuDj","bkWcNCSCfzthDj",
        "cgNYIHtg","ckEF","dYcSHe","eCVKsx","eZpa","ezJiMIuOTEJ",
        "iAiJfyzqzagOe","iVHElRfjBiQUB","jgSCI","kljU","lGKnEPOvYWzkIU",
        "mAQSQ","mpEthvXm","nuDBbaKWojdIaoE","rIEWmf","ryiKjvfZoAUecjc",
        "tIutRHc","tauEZif","thTQxNPvm","vFR","wPwajldugnekPGC",
        "xnbYqIzwKpF","zEKTSPmwexCY","zYLnBldmicWXGNs"
    ),
    "Lcom/fyber/inneractive/sdk/network/timeouts/content/GV/TVYNyhByIpvY;" to arrayOf(
        "AqW","AsNHqVZBqlYQyL","BPhvcfXrLzP","BYgKiZ","DXwAPZybzb","DofhvVtR",
        "EqPD","FIZELwJFeH","IGZiqitzjGeH","IllBTq","MGefOJJVu",
        "MPFjLVdzYQib","OusmfEsn","PpLJ","RlEmHaL","SpOgGrABU",
        "TiPixNZePNorO","URONVugWXu","VDIaz","VGHAaGaYJUbWN","WSoutRINYRfUfk",
        "Wvxb","XAADK","XyRrlFAe","YTWuNne","ZWvQGoDHlWXsy",
        "ZpnZHSHTISnCPf","aAo","bjAxPmLuZApPnI","blUGFcMXpJneuiI","btlDgNp",
        "cYSIQHikwvg","fDNCXT","hmyOZ","iTDkCisIsOOSMm","jNpwquh",
        "kHSGaKIebMW","kPhFQmGAalcS","kiZnuaSz","koNZcCEu","ktMmKEb",
        "lHzrCizQ","oEHlNDMmMzYamvu","oPIKkvp","pMF","pOMYWbb",
        "pOQFNreE","qgwBODVNWquTT","upuAwrQgKwTwcwI","uvK","vsvUUu",
        "wSbiHh","ygyfzeVKdmpIk","yynpXXK"
    ),
    "Lcom/fyber/inneractive/sdk/player/exoplayer2/metadata/id3/rIOZ/uCpEc;" to arrayOf(
        "DTTojwM","FArtAzB","GcCw","IMcs","KYPYBwU","KhxYhHv",
        "KybEtcvpjeJRAe","LDwWwBjzkdeMo","MKAhM","MiGFcGB","UQzeVkl",
        "VclrkpnYIrG","XofKiJjIahJ","XuW","YGQiUekM","apTOoEehsV",
        "bEHo","bLGNgIwzF","doa","dotwvJ","eeVxmnxw","fkSkDQKgBhmDCx",
        "iUnyZr","ixdWix","jBnaoAClJxjSvk","jMrc","jZFBmSLGVpPAXVh",
        "jrGvgNhugS","kKr","kMvRqAAjfUlAdJd","kZzUxmVhS","nOrrJOqJKOXLu",
        "njsCsJsODE","pAjAKZ","pFKxYiXDGXUSxa","pnAOE","qObnGZAxImH",
        "qzYSwtGvuiE","rMSeW","sGKFYjyN","sahVu","savGGKqpeMtIZ",
        "scyxzzmR","tIrLaL","uFqkczikT","udXpMCG","vvjLvmyvAKbGgQS",
        "yCJdtTF","yPagpaoIiOWdT","zuQLWaye","zyQKtGDyXarVg"
    ),
    "Lcom/fyber/inneractive/sdk/player/exoplayer2/metadata/RqdZ/lHJE;" to arrayOf(
        "BIqMfbB","CnbqhGphLGWf","DwSZUIOP","EHSMLLNYoHaw","Ejdgyd","EjjaGGjLye",
        "EvlIyOZBZWlMvC","GQQkDFBUvZpEHfq","GYoapvaUgDFgfd","HNDYLPRFay",
        "IvDqczxTzSopjgF","KuvoISeub","LhBTDlpODMghpmy","MUzorOFVVNTNGr",
        "NClJBKumRcLkVw","NjWnexGgmYcloaB","OqTYHpF","PEEWvj","QLr",
        "QOiVdZLlx","RciKCpHJarYBjn","SWY","UwIdzIr","VQFOaivMUyon",
        "WESqbZUqiPki","WfieBz","XkAbtafKIwM","aIgKd","dTcDYFkbI",
        "delmIxrhuabI","fQtyQriqcT","fesUZgYc","gqM","jBt","lzUDwiL",
        "mcJCjNHLBHK","nmxtxLlV","ntNOAvRjffoCaMW","pYz","pbw","sWpH",
        "uRhKORNuFcOJL","xmcNwaDAFhSJWD","zMqoC","zRncvjMQhLsA"
    ),
    "Lcom/google/android/gms/ads/rewarded/tOSD/isragnhfT;" to arrayOf(
        "AbieRD","ArKREIjg","BJRQJMG","DBQuTt","FJq","GLJIINOr","GwJ",
        "JaEH","KJSLEcI","Kyggmobz","LJA","LQc","LQgviolm","NBnSOCvk",
        "NRBpVJRtn","POIlfNT","RUKIqZFjbM","RxZehxGXEcK","SAzpYg",
        "TCvyKN","UbqkLVVtrJzhyq","UwKBmZBpv","WhEKkrFmwUpwJoF","XdNLq",
        "ZsmXNLvBA","bTCpMZFGv","cSvB","cXxUXXGhnGfSuhJ","cpWHLXCgTzgP",
        "dxDO","ernOuP","fyUoAtAqtcz","gIjvew","gKZwBTkxKEUIV",
        "glDVgEMhFgxHNKe","hnyDgDqpLOLzkgV","jVbsuDbrgiVlpE","kLsqPtxxjpkRDfi",
        "khXyaMBfPZBvAL","neWaPiU","ntmrGSdAYf","pGUIlXWmcXQju","qIxRmv",
        "rCEfacH","uSfaLoDdfZLeGH","vDQpiVmTua","xTPOoji","zrD"
    ),
    "Lcom/google/android/gms/common/config/secD/oxbhEIRRJ;" to arrayOf(
        "Crx","CwCvKCUtTXyyFiR","DNmcr","EJPvFPlrQIdEC","FNvPeka",
        "GcIoycpYODoR","HLgnQf","HPqMaefHh","IWiZAZxANjDP","IokFSZFR",
        "MHjJioLUgwl","MQdkhjGIjOQk","PkVqIEGMywByYy","QGewpmbDPc",
        "QiWQaXmckzb","REWSuVI","SovDbZk","TQdvnZWMBGJQyD","UzCAUqQofs",
        "VJqtkgpJU","XFbcsVsr","ZDpZAz","cfQgJgjXKvdUt","eeZtiqCgir",
        "fJZgQjTuIKXmpkC","fLXMfvjvBPUYODB","fUTTD","gWIiKqyMeEmd","hRAP",
        "hiisXAnfH","hmsIotGRzEWXpc","jVnKIRpnt","kLchIZIOCeMg",
        "kbjEDASOmqeH","ljpadlvhpguxPeH","pYvSMbLxUbDj","qOkvXARGHe",
        "sDoKGQIaHkm","sexwVwerfmrZwEu","skKxJXug","vWllgzTCd","xcc","ymuzV"
    ),
    "Lcom/google/android/gms/common/server/converter/CHsu/kzmuYpdNJes;" to arrayOf(
        "AslcvvNyd","Cioav","DTQuoJ","EPLhupLWwn","HOgYUBWYakqShyA",
        "HUqgXUMjoWRckv","HWOxE","HlROCqRdMZ","ICcOlST","IpfOkxjxlEExJly",
        "LXJt","MSmfLaKh","MlcfFFRGtJlKdp","OKZc","OeFAbAIhuXSU","OldXh",
        "PkCHqvqSWuw","SHqoBPS","SvXbfmolqzkYMHz","Vhb","XosP",
        "bFsbBgYbegBQhmB","bmSwuANfmeuL","cAZN","dDOmJpYYhXWK","eNpKaSFgwAWu",
        "gxwK","hmQJNiqgNKgVfY","jJmvBMVAaE","jYmAFzhzWsMGWkn","llmeCTWB",
        "mTUEPPSjBKcaYQs","pAwF","ruAi","sSsoeRPxGLyBo","sieRfzvI",
        "vPHSfJSaCf","vcmDvJRTkeUJb","wWvrlbmCKpG","welmF","xjWmnQJ",
        "xmYYYA","yCAQkIrAnNPVK","yUkmdgwvbsYc"
    ),
    "Lcom/google/android/gms/dynamite/descriptors/com/google/android/gms/ads/dynamite/txzX/ePoEdxiSzS;" to arrayOf(
        "AjLddlBzOQsM","AleFrWc","BieZHKRRJ","BxoY","CXTyhOSeP",
        "DHnDOnGagQY","GHCBqXzFKPdoet","RVeiunHfvytqKAk","SAp","SHSRWfUln",
        "UCrW","UVfbt","WCM","WNsUlTWTMah","XFnwXQsoDERu","XpsEAZ",
        "aTN","bKuEcxizf","bStSzhWmeKew","bxYRDiVDCoByqm","giNocJhCzlKQDG",
        "grHzLHNXKvM","iFtxUeRTxwcqWu","iHOuk","iNFB","jqkAJubUCANPOM",
        "jxaYiF","kjP","lfouVd","neuIGoHCWMNrAY","obDhDGyktMaA",
        "pRisCbYNT","qDBlMVUuvmEVsts","qRtHiqs","rflmLy","srs",
        "tMyjslbsEilD","umUGVUtpFt","vygHL","wSBH","xKSTQqypbJHoH",
        "xQqG","yAwGtkbT","ytfrIPSlPPO"
    ),
    "Lcom/google/android/gms/fido/pxFY/HvWdWuDsP;" to arrayOf(
        "CVAGplKqiqztSg","EKcMHgldfbhm","EWNj","FGlSsCTTNyZV","FmvDFk",
        "GAuexISqx","GLiMCHEXB","GgKlQqrtfIvND","GtOOhgKImCKbk","GuMJfZFo",
        "HERMkw","JFPtkmBKoU","JHj","JIlTDxI","JWErrZbzq","JrWRpHkLrZN",
        "NHVfKY","NLUuZpWd","NMSbRGKVrHDsIv","NQMggLeSrjGNkbx",
        "NzBZdAgsFdIUQN","PFenc","REP","TjJ","TkPAdRU","USYQHqiSLKVk",
        "UzMEmk","VZhsMNJNCP","WObCxDpPsVKQ","XFgQjo","XwpDuswdEMGeY",
        "ZdYJrlGSdJ","aComMRBAsbw","bAdnsydTuRnjt","bhorpzDonV","bqLz",
        "cvfF","cxVUOkLtSJVe","exZUvt","fkOezQrIzbEb","gYqJUcDokjeVa",
        "ixDBprgdRnwCgP","jbUuyQnFJuxMBNX","jmiBKsEDd","kJkS","kXaqQ",
        "lUP","nboINIXW","nnaoORT","oYTlyDuYnUAnk","qarzuzVNbsf",
        "qooonNrIUHAue","reXtsL","shpx","thGPiOryk","vygIjLOgbSTk",
        "wMhrFSLvzLbi","xiRLe","yNSq"
    ),
    "Lcom/google/android/gms/fido/u2f/hmsP/ejcWfmPCyF;" to arrayOf(
        "BdVAghp","DGyvMDxFYSdo","EGT","EWRyUPsBuXR","ElrgkQn","FbsJxuWZOExVe",
        "HrOwZk","IhdOulyDOlcDqE","JlAZziypjDpC","KHRrUS","MREKYNcriXblqw",
        "MfNxUoBdrDg","OTVzirR","OWvvQvdFNAXq","PTnZeUSvKVm","QjtOwo",
        "RhJzK","SsNeQDjFbTgovd","SxLSfI","TxNe","UPPktY","Unu","WDQSh",
        "XFzuWWa","XIVTzNqIUPPIT","ZrNjJesJTwT","ZumuiRyMUFR","azJcg",
        "cQwNuETbfyrez","fwi","gHyXUEMQwFlL","gWMPGgFFjWDeyjK","gzF",
        "hNoKuaDy","inINDNX","inZYgE","iwRaK","jvlR","jwiQgMSRI","kIPMs",
        "kRVXUmOKJrFt","kgEVEUM","lKOMvm","lmYqUvrHlbW","niKWoxHyPXrt",
        "pMtjiGl","qJiISJnhi","rNWxWhyxANZRYk","sBdIHDZFnouh","sVjOcEK",
        "tRFXkBaxhEvvPZ","uMasDlYhaFP","vTXaOdcwVpgHFtM","vsERkI",
        "vuRDaCtXsFp","waQBYGNWwDbWT"
    ),
    "Lcom/google/android/gms/internal/maps/HrQW/omEJk;" to arrayOf(
        "AeskZcskCotDf","CKguAVfMEXq","CPRPDAkgXD","CmcxnLgcf","CvyWdQ",
        "CxNiSGsUbmmOY","DaWgDqR","HYSCyA","KGspMjXraX","KWRbdzPde",
        "LglaqjLGWk","OmxD","PCI","PPmjOCKWqQgBfQW","PfkIYrJRJSZTd",
        "RxraM","TEvpnWYpmiqgCM","WjOBye","YlyUxz","cMZmrJgKOC",
        "dHAfZbNUVXVb","ehR","esFKeOBmlV","euKPM","fBRRWcRhj",
        "fHIZOIwQOnvLb","gtGG","hVypaXZDM","ljbgSWkcijGhMe","nUynmi",
        "nfkZIfDDtKO","nkbNDmpPNTzoX","oWYLKyfAvOMmEco","pkvycTjxPy",
        "pvywkzrYVOdyc","qPevXXmdwHX","qTslCbqPBdp","sDF","sIflowhQGfTS",
        "sJGTMomoiEWTVbP","tKReAELyKoGLi","uJxcfYBOYnJa","uMaGPaEHQcs",
        "utx","vrtQVGqXDogWyK","wSKvNHxWesJmYU","yALPMhEpIoorF",
        "yKmAzmZSGZ","yWUdFUzJqtjKq","yiTGKCoR","zHVdxWx","zzPGk"
    ),
    "Lcom/google/firebase/components/Ud/KeMcTRxTQj;" to arrayOf(
        "AaoNHxvUA","BipEP","BksOhv","CQOocLdkfhr","CWeEjQCNrv",
        "ChnUFfNmfDUgv","ESasEiLO","FbJClxXiXDKV","FuKftFmLWuC","FySvpTLxjv",
        "GMoSYcTBS","IyZRqhrrP","JjuVMvAIN","JmGTs","KDydmfrzxbZPP",
        "KHypkfYGVS","KdAeaLVPcY","NomPTdO","NrviXg","SFAmcTnbDTBjRv",
        "TFAlrLYEKD","WCCAmjg","ZMuLHA","bvmJYeYCNmUB","cXYWyln","cffw",
        "eWXuHcoXjjxaUbw","eiGnBIr","gUqttPFTPpC","gchzbYFzjAgXoe","grZjZ",
        "jqCTyPubboOarFD","kZI","oXFzWpA","okCMLpwb","ufDrfPErvcWBfu",
        "vThaNPMG","vaxbqbncPuFePRk","vefbUZZuPYkVwk","wYjWXYXGzCCLb",
        "xatNroGTPXt","yEqh","yhrqhzJYwyGJ","yqrMWqEc","yyWJKjRhLVSzeol",
        "yzVuqixeXjOmBm","zOdEj"
    ),
    "Lcom/iab/omid/library/inmobi/adsession/media/tJ/DShBb;" to arrayOf(
        "CdJazqWaNGLgvkQ","DlG","EIfMoqanokaYM","EmdrBa","Euuc",
        "FUFuZerhOWTMM","GdtqCCZeU","GtMIYZBlF","HkdXW","JryxmSgOrJeEQxi",
        "KnlRzivZ","KybmdpWOkkSlXKt","MFOiskCxZmh","NwoSZUqttpuUXd",
        "QSBiujDNRmClgfa","QowxfJ","RNXymrTTTaWMxR","RkEBrkDtZCUf","TWyXa",
        "TZtDVcE","TjIWa","TuxVtYIkMwZJT","UMntaSDkAg","XSzkAjfUtxDfHsf",
        "aAKINkDZslS","aJVbEn","aWoqjHApReQSVeB","bfVUvijVdpbDPi","bpwk",
        "dNgHTafYRimIQiM","deKPKPMrwMYT","fqLHdZmvVztRI","hUeGiu","jEI",
        "jgDOqXKQ","msnxXhW","nPvQbFONfkJYvqD","pui","qEcJNklnaVbA",
        "qFQPQavD","soSmgLDt","sqLmPhlxCM","tGaNSwVT","tPAr",
        "wJtnLbmRwIVtGYg","wYiI","xVetVaKWvDPo","yRaE","zNQXz"
    ),
    "Lcom/inmobi/ads/listeners/omG/AwGvKWMAqyNeR;" to arrayOf(
        "AZtRnSrMnPubpG","Amyg","BHgQEyllA","BVAwipbrswocwhi","Bpuh",
        "BsOtdUhBoLlNpPt","CGtJfAlfMdyemaw","CdkLmCVD","CnCyhfVnqrk",
        "DxtPdkTYVIS","FLXlupXv","GtVJCJrAo","IOtj","ITG","JTSxC",
        "KCEaFfjkZuJs","KLnru","KRvvapUZoy","MfCZoXAR","NAHIrGbVbibamDv",
        "NwbzfDAHkQSrB","OXPMaAMBtxkIXyi","PwMe","QmY","RJTXMURkiAkZySJ",
        "Tbh","UcR","UuR","WXcWUy","XRaIdX","YjaDUwvtE","dmCj",
        "eBwxeSQaGDwNoJj","eTLJ","ekDTbYV","fKfmohLgftPxFB","haGefKqRARaq",
        "iaHX","kILzlUkgo","kauSsWf","lHuGvKw","mXvzEUIaHOi","oYSTNSay",
        "oxNuRwlvyRuZ","qKlBUJi","sSqPb","tayKMzkoKg","trawTid","vdWtG",
        "vwARvKKEr","wgFslmCkAC","xbNhSCOxKp","yKLQrBfmcS"
    ),
    "Lcom/ironsource/adqualitysdk/sdk/i/tjJ/HVjpNUDPBfio;" to arrayOf(
        "ANJSjYdlNpPQSK","Akcaasr","BWKpqSxM","FBrh","GQwBhjQ","GTQdoLRdJWv",
        "GgbIibVYxDE","GrBCf","IbVEPYLyjUU","IlPhDZQh","JGhxJTXFoSZWjI",
        "JJWhj","JPLhq","JYrAxmMHMnSYLH","NNSV","NUxDOhIpmxiGqz",
        "OXKhxwvCFJfxJ","OZXk","ObBAobL","OfwUc","PTFfSzLXRp","RosQijaD",
        "TdHcrqCNG","TkkgDU","TvokYMA","UFW","WhERzKREXyvi","YsPDwlTpAsp",
        "ZYRsiLYd","Zfmp","cFXYnLXXHDhel","dYByE","eDBLEYFkf","faYcWMcZ",
        "hhMkPQwl","iFbria","kBPWjJNAzaHwg","kKVDy","lMYgzUmjCfBg",
        "lanmiy","mILwWPIZZ","oTlGKt","oqlbJFWGmhz","pPkmUJytVnzfm",
        "samTs","tavmRWth","uhjedr","xNfaMauSur","xxm","yZopHLDLVthauBy"
    ),
    "Lcom/ironsource/mediationsdk/ads/nativead/internal/CP/hwSJRyaVpJij;" to arrayOf(
        "BEQz","BlsyDsWdcmT","CMkvD","CQoEONQifWSOgZA","CzbijdRg","DWJDiKUi",
        "ETq","GNBfylzznGqy","GmI","IBcNkHqlwjoF","IiPGJH","IkztXoeaP",
        "LRArfOKtYiv","LhuNiJmkVSOFCX","MMtZezcHdsXYbP","NMvrWXEQFkotwAl",
        "ONgpARcRwcXgqLQ","PnyI","RbBgzaNyl","TBHgqmHsj","UcmmYFxzkLsgRA",
        "UjmUDMfltucD","WvbDo","XRWfAFBJ","bbCeTdOQnsmRm","cEjaPGDDi",
        "chuGN","eRELStTHCYiv","fRm","ffrfxY","foRFa","gnhWUjA","igRK",
        "kdQroZNwACOb","lQMOGCvPc","lcSG","nnxWOxPlaexzXUC","opT",
        "pORQJexoIvA","qAGJldX","qpjmmYFvspvYnTr","qpmAzoOXcZ","qrBwnKN",
        "rNqTNtxDMEzaRS","reHffTeudZPDylE","tef","tnBUmxvxWfXzQas",
        "twRjwIaCbl","uGMiiZNZKqMWDfL","vvSzQJEGnUmV","vveSs",
        "xpxKvULEnhLvYV","ylbydpYQrUu","yzCYrd","zsZxiETFzSKxJQ"
    ),
    "Lcom/ironsource/mediationsdk/logger/wM/BNixexu;" to arrayOf(
        "AMAbmMhdduuko","BDK","BayAsIaa","BxDFVDjzh","DIGbXdLzkBPU","Dco",
        "EERg","EFhaRTOoqmQ","FKHRaqAmpsQBI","IRKLEL","JakcvIprrIi","JvY",
        "Libzv","MChiJX","NIJQdauurB","ObNvHbII","QYAIeZptQ",
        "SdfAnhQuflWNDeb","SgkdeZzwHTF","Spgaz","TDyaNLAHG",
        "TFsxaRUPPwiJgp","WBX","WneRiWQTuwqh","XXW","alaVyk",
        "ciYQnpwgDUEGQ","cneFKtPIVtN","eVnIOlteoDg","fEIzosoOIoXYP",
        "flUsEK","fnWe","hSMySJPPqlZjkre","hvcdWQ","idIdqUfFRRFii",
        "izzOXOEzwiZ","mmM","nEABUJVzZkazAT","oEgumQiXGmGx","sEVLpdR",
        "sRHsgRv","uRUhMGp","xHlwUQ","xJokXrmehKALbDK","xRwU"
    ),
    "Lcom/scannerradio/services/CW/RCBjAbY;" to arrayOf(
        "AhUm","BDEfnmzUHI","CLhvjXFsMo","DBDC","DSIj","DfNBG","EbrrIfUN",
        "FUtO","GcFSqb","GyvqFAdMBTDh","HBHxpzu","IQdgblKAlHVJty",
        "IbnzUKusYU","IthAgaM","NJAC","OCHAwdKsSpCl","PlSYauPqYJoa",
        "QQxJvwPfYcVpvx","TRtPOXWSvZlmDoq","TgCsJDrJoqU","UkhWqaLAMymC",
        "VJd","VWMk","VtYGypRCdL","YGsi","aENfum","aMLOOp","aqwY",
        "bYer","cDTzuzYWrJQXDXn","eEWKeQkAJpMwDYA","eOHjwqRy","fGwvlm",
        "fywWoquKq","hfZpbxdBjhbQUX","hmJPUW","kAk","mZoxqsCMUsp",
        "mzpSwJIQzNUMyS","nBBcbGflU","nrhSwXqNUSIV","omVDCZDdsacs",
        "qplXWwzWBr","rCkHZohCy","rqFhUP","sXgiP","smWZfHzkZ",
        "vdxDCbKBRWAKu","xIUaQkttOcaAOd","yKZXWePoe","zOjCEqX"
    ),
    "Lcom/scannerradio/ui/settings/Xet/BbQzi;" to arrayOf(
        "BRPHZBuQxCmfLwt","CaoE","FqUmCMB","GNpnOXhJqEj","HhV","IOW",
        "KaydXV","LDbZDpoXuBef","LijnriHj","LukueVUixHrDOrs","MyWg",
        "NBrkVIXJbNaNQG","NYUBCfSMGHTE","NiYMDrECeieKq","OTT","ObuLndMAHYf",
        "OtvDqrlnFawAj","QaqHrpaxAhV","QbOPVFAVOwB","SAKmlqqAXwW",
        "SXHyJKvni","TpRrfZrlYI","ULpaNsr","UvLMW","VlSPS",
        "YzDiCHBRNuR","ZMlsDOBT","fWdTPuON","ijMuXxJT","knkbzq",
        "mWnMuHUqLq","mZBInYUKBeRdb","maIJ","nSoYVcG","pRxSHXKrCvdHx",
        "pSZnhLY","rYbyGjVNUZ","svFnfSOBVsgMrss","sviGZWnPBlSWuls",
        "tIKFxLvoMm","uMxIQRdl","uwct","vWlhVDSVhY","vtB","wsLLd",
        "xZzj","xgwvLN","yhhVhlZDZMgLwpo","zhSaIuYpSIU"
    ),
    "Lcom/unity3d/ironsourceads/internal/services/NhM/QGIjEsOnR;" to arrayOf(
        "AECq","AbEMaTXXxScgJSv","BcTypIPCTW","BjJ","FeJiy","FrEykH",
        "GLIJ","GXOFMRmO","GplQ","JJgRFOHDH","LkEc","NGdgy","NLmZb",
        "PAeUUYTN","PNfGaGcJIw","PwZQZpGpibvYa","SihzWLQr","TCONTl",
        "YXwjjPs","YlQxfK","ZoQMawOnYe","ZyghZk","ayJUaetY","cCGH",
        "ckstiTGR","iOsGjsN","jUc","jwpZsvXgvPMgE","kVMOcGBmZHxBt",
        "lSaaOtRidEO","lUGsSx","nnsabtADnJ","nwceQm","nyJXbNtwFrq",
        "qzeXW","sCQMfnIAZiRRZrl","srdnoxwtwDXfV","tUfIqhsZ","wJSnjekKb",
        "xWOey","yYH"
    ),
    "Lzendesk/core/BxK/MEjN;" to arrayOf(
        "ABDXtVwLObn","BMpDZbDshpw","BTMUsaNRDY","CvJxzZimD","FHSYhVXQMhiC",
        "GsL","HJWjQTLjHlwzrsv","IrjJi","JFkMDwIfvDRBMNa","JbjRclP",
        "LOfgeLAL","MSQBt","McIcrADucoFW","NarShcAmY","NsNMatzjvOASNM",
        "RKrYDSg","Rydr","SODkEBmHFc","TRMXWGEwkDQf","UrvBGzfwMxxeFP",
        "UsVA","UwvqT","WIt","ZwqafB","ZyPe","dKkTggiKoaZan",
        "eXaahVPFQeSJJpi","edHKAliZmAszKb","elURAECGojxsYT","gehaOizaaLpFuS",
        "hPvUGugYQJo","jdupA","kYMnyEzfFLFFb","lGvtPkJqbWDIp","nXGSQOqseIUV",
        "pCpMXyaLpONEAT","qAZJXiJhCmYD","rNnC","sdwsIhxd","ssWv",
        "tAwfDBLHussTm","vCSUPYIZZrgH","vbohlteGgLJy","xToIkKMetgneLA",
        "yupvlObCR","zISuzrWxG"
    ),
    "Lcom/google/android/material/internal/UqiD/hLBh;" to arrayOf(
        "CBdjbCPLLd","DKuFCmllUgl","DUZ","DyUVIz","ErnANvBLUlYXkJy","IDUGs",
        "INpnBDOfSmFkoSb","JlcHv","MBrYtgsfmwUMp","NQAhNKgcLN","NomAHY",
        "PgqRAXwLu","UNj","USVwKvdkSTm","VhBR","WjcCORyvIuqLnm","XCJUaySUo",
        "aefhXzD","awDmcUPsqPsc","clxbxVlccplTg","dcD","dyoqjjmxlgo",
        "iFrbcDlrV","jILnu","jWLwZO","khrHQjl","mdWAhjCAJXveiH",
        "mljAXRRrRWiWT","netFbtJfBnL","pYotLofITLDs","qBWWo","rFnJc",
        "rhufcGrLf","swBjzfgI","uAcxbyBzeZlf","uCIPZ","uIcjaTwZfufCee",
        "vjgyBX","wYmDndARfSMesLH","wbvadPeXOJ","xIESNU","xKmNR",
        "zxkKRfGpCmejOH"
    ),
    "Lcom/google/android/material/snackbar/CPP/LaPB;" to arrayOf(
        "DQIFwWSxZlio","EVgfz","EnLGQRyIXeutWZQ","GNrhzm","HZWcl","HfzQyoe",
        "MHaiEHpblgk","MPrfUCwUXfaU","NYaGHGXVWPHRK","QRdxPe","RFon",
        "RPmcg","SCGyzbpprtntLXs","TXRFfetoDYTp","UfEUPXeqrI","VPr",
        "VnDBpPuux","WEAj","WMeSkebEpTzXHKt","WotRddIqUKRMddD","XlcCcgQckTc",
        "YOw","ZacP","bNVLIhbk","bOQIAXoYyMSCEQd","clc","eENH","egRwlJF",
        "flt","gMtU","ilhfOmWPj","isbUQlebHfS","jJqPxsX","kZqbuYMKZCv",
        "khZqRtdVRHMuaeD","lWxYUZJRV","mNwh","sNoLbY","sikF",
        "skircpmRpEw","uynqn","xxXMj"
    ),
    "Lcom/google/android/play/core/common/Njrw/dpfMFB;" to arrayOf(
        "BgEtCDeG","Csvq","DuMR","EnBTIndctzorCe","GHNLZAG","HXJcWELzuM",
        "HZYwk","KQzGICTnkdHlS","KlgAMSYKec","Lorp","MJMeJ","MJag",
        "MyQbqOTB","NXDwigwGXUp","OICDNTASMcz","OlXCFmJNF","OsRBUiMYcli",
        "PLLuA","PeSbJxsiRJSG","QKDpyXcKSJAL","QfNoYSabFQPGOfJ",
        "RyXaHqSVbG","WPIuqHvvpilLPg","WXhFgxDTSAIU","XTxCkLBuGOzvD",
        "YErWIKMjMV","ZWzo","ajVM","bNfRZMNtzEHa","bmPrhwRZsSWkcSK",
        "cNnpPth","euJASQluo","ghh","hOINygotBaqBcmC","iQHTSLxLEMx",
        "jpOyMSMWAKb","lbiIXsFbeDcxmfD","neRt","oUNDgnqwFXZ","onlf",
        "pwFZRpmYIKU","qZIfHjWUyy","qiHyDrVliuxfU","qwefn","rYQSSHyw",
        "vRYFrV","xKbgPQZfhJfklaC","zoPeTMQ"
    )
)
