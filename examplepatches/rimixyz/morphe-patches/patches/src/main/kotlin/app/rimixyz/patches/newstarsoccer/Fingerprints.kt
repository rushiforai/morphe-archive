package app.rimixyz.patches.newstarsoccer

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.string

/**
 * Fingerprints para New Star Soccer 4.34 / versionCode 142 (com.newstargames.newstarsoccer).
 *
 * Todas as âncoras foram confirmadas nos quatro DEX do base.apk analisado (SHA-256 do bundle
 * bc76b635a3ac82967e6973273485abb27796b67975653ad7827691211bb796c3). Nenhuma fingerprint usa
 * ordinal puro ou offset: todas combinam classe, assinatura e uma String ou chamada de SDK vizinha.
 */

private const val GOOGLE_IAP_COMPONENT =
    "Lcom/newstargames/newstarsoccer/c_GoogleIAPComponent;"
private const val GOOGLE_PLAY_BB = "Lcom/newstargames/newstarsoccer/GooglePlayBB;"
private const val ADMOB = "Lcom/newstargames/newstarsoccer/AdMob;"
private const val FYBER = "Lcom/newstargames/newstarsoccer/Fyber;"
private const val FAKE_INTERSTITIAL = "Lcom/newstargames/newstarsoccer/c_TScreen_FakeInterstitial;"
private const val BB_FLURRY = "Lcom/newstargames/newstarsoccer/BBFlurry;"
private const val FLURRY_PROVIDER = "Lcom/flurry/android/agent/FlurryContentProvider;"

private const val PRODUCT_REGISTRY = "Lcom/newstargames/newstarsoccer/c_ProductRegistry;"

/**
 * Loop de verificação de compras chamado a cada frame por c_GameEngine.p_OnUpdate.
 * É aqui que as flags locais de licença podem ser fixadas sem depender de resposta da Play.
 */
internal object ProductRegistryCheckPurchasesFingerprint : Fingerprint(
    definingClass = PRODUCT_REGISTRY,
    name = "m_CheckForPurchases",
    returnType = "I",
    parameters = emptyList(),
    filters = listOf(
        fieldAccess(definingClass = PRODUCT_REGISTRY, name = "m_dirty", type = "Z"),
        methodCall(definingClass = "Lcom/newstargames/newstarsoccer/c_TPlayer;", name = "m_SaveGlobalData"),
    ),
)

/**
 * Decide entre teclado nativo e teclado interno do jogo para c_TInputBox.
 * Só os idiomas 10/11/12 usam o interno; para português o nativo é escolhido e o Gboard não
 * entrega KEYCODE_DEL ao OnKeyListener do motor, quebrando o backspace em campos de nome.
 */
internal object RequiresMyKeyboardFingerprint : Fingerprint(
    definingClass = "Lcom/newstargames/newstarsoccer/c_TLocale;",
    name = "m_RequiresMyKeyboard",
    returnType = "Z",
    parameters = listOf("I"),
    filters = listOf(literal(10), literal(11), literal(12)),
)

/** Gate local de propriedade: c_GoogleIAPComponent -> GooglePlayBB.HasPurchased. */
internal object GoogleIAPHasPurchasedFingerprint : Fingerprint(
    definingClass = GOOGLE_IAP_COMPONENT,
    name = "p_HasPurchasedProduct",
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;"),
    filters = listOf(
        methodCall(definingClass = GOOGLE_PLAY_BB, name = "HasPurchased"),
    ),
)

/** Carregamento do intersticial do AdMob (AdMob$4.run -> InterstitialAd.load). */
internal object AdMobInterstitialLoadFingerprint : Fingerprint(
    definingClass = "Lcom/newstargames/newstarsoccer/AdMob\$4;",
    name = "run",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/google/android/gms/ads/interstitial/InterstitialAd;",
            name = "load",
        ),
    ),
)

/** Exibição do intersticial do AdMob (AdMob$6.run -> InterstitialAd.show). */
internal object AdMobInterstitialShowFingerprint : Fingerprint(
    definingClass = "Lcom/newstargames/newstarsoccer/AdMob\$6;",
    name = "run",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/google/android/gms/ads/interstitial/InterstitialAd;",
            name = "show",
        ),
    ),
)

/**
 * Preload do intersticial da Fyber. A assinatura com String é deliberada: o caminho recompensado
 * usa PreLoadRewardedAdInternal(String) e deve continuar intacto.
 */
internal object FyberInterstitialPreloadFingerprint : Fingerprint(
    definingClass = FYBER,
    name = "PreLoadAdInternal",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/fyber/inneractive/sdk/external/InneractiveAdSpot;",
            name = "requestAd",
        ),
    ),
)

/** Exibição do intersticial da Fyber (separado de DisplayRewardedAdInternal). */
internal object FyberInterstitialShowFingerprint : Fingerprint(
    definingClass = FYBER,
    name = "DisplayAdInternal",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/fyber/inneractive/sdk/external/InneractiveFullscreenUnitController;",
            name = "show",
        ),
    ),
)

/** Tela promocional interna. Strings próprias ancoram o método (I)Z. */
internal object FakeInterstitialSetupFingerprint : Fingerprint(
    definingClass = FAKE_INTERSTITIAL,
    name = "m_SetUpScreen",
    returnType = "Z",
    parameters = listOf("I"),
    filters = listOf(
        string("TScreen_FakeInterstitial.SetUpScreen"),
        string("fake-interstitial"),
    ),
)

/** Início da sessão de Analytics do Flurry feito pelo wrapper Monkey. */
internal object FlurrySessionStartFingerprint : Fingerprint(
    definingClass = BB_FLURRY,
    name = "onStartSession",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
    filters = listOf(
        string("Monkey|Flurry"),
        string("Flurry StartSession"),
        methodCall(
            definingClass = "Lcom/flurry/android/FlurryAgent\$Builder;",
            name = "build",
        ),
    ),
)

/** Auto-init do provider do Flurry que mede tempo de startup e memória. */
internal object FlurryProviderOnCreateFingerprint : Fingerprint(
    definingClass = FLURRY_PROVIDER,
    name = "onCreate",
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        string("performance"),
        string("FlurryContentProvider"),
    ),
)

/**
 * query() do provider. Depois de neutralizar onCreate, os campos `a` (UriMatcher) e `c`
 * (MatrixCursor) ficam nulos; devolver null aqui elimina qualquer NPE se um consumidor
 * externo tentar consultar a URI "performance".
 */
internal object FlurryProviderQueryFingerprint : Fingerprint(
    definingClass = FLURRY_PROVIDER,
    name = "query",
    returnType = "Landroid/database/Cursor;",
    parameters = listOf(
        "Landroid/net/Uri;",
        "[Ljava/lang/String;",
        "Ljava/lang/String;",
        "[Ljava/lang/String;",
        "Ljava/lang/String;",
    ),
    filters = listOf(
        fieldAccess(definingClass = FLURRY_PROVIDER, name = "a", type = "Landroid/content/UriMatcher;"),
        methodCall(definingClass = "Landroid/content/UriMatcher;", name = "match"),
    ),
)

/** Retorno de Activities externas (usado para interceptar os seletores SAF de backup/restore). */
internal object AndroidGameOnActivityResultFingerprint : Fingerprint(
    definingClass = "Lcom/newstargames/newstarsoccer/AndroidGame;",
    name = "onActivityResult",
    returnType = "V",
    parameters = listOf("I", "I", "Landroid/content/Intent;"),
    filters = listOf(
        fieldAccess(
            definingClass = "Lcom/newstargames/newstarsoccer/BBAndroidGame;",
            name = "_activityDelegates",
        ),
        methodCall(
            definingClass = "Lcom/newstargames/newstarsoccer/ActivityDelegate;",
            name = "onActivityResult",
        ),
    ),
)

/** Despachante central de cliques da UI do motor Monkey (visual moderno e clássico). */
internal object SiGuiHitGadgetFingerprint : Fingerprint(
    definingClass = "Lcom/newstargames/newstarsoccer/bb_sigui;",
    name = "g_HitGadget",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;"),
    filters = listOf(
        string("HitGadget: "),
        methodCall(
            definingClass = "Lcom/newstargames/newstarsoccer/c_TScreen_SaveSlot;",
            name = "m_ButtonBack",
        ),
    ),
)

/** Montagem programática da tela de slots de carreira (visual clássico). */
internal object SaveSlotCreateScreenFingerprint : Fingerprint(
    definingClass = "Lcom/newstargames/newstarsoccer/c_TScreen_SaveSlot;",
    name = "m_CreateScreen",
    returnType = "I",
    parameters = emptyList(),
    filters = listOf(
        string("saveslot.btn_Tutorial"),
        string("saveslot.btn_Network"),
        string("Slot0Exist"),
    ),
)

/** Entrada de criação de nova carreira ao selecionar um slot vazio. */
internal object PlayerDoNewCareerFingerprint : Fingerprint(
    definingClass = "Lcom/newstargames/newstarsoccer/c_TPlayer;",
    name = "m_DoNewCareer",
    returnType = "I",
    parameters = emptyList(),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/newstargames/newstarsoccer/c_TScreen_ChooseClub;",
            name = "m_SetUpScreen",
        ),
        string("help_newplayer"),
    ),
)

/** Tela de escolha de clube/país na criação de nova carreira (carrega a base MyData/v*). */
internal object ChooseClubSetupScreenFingerprint : Fingerprint(
    definingClass = "Lcom/newstargames/newstarsoccer/c_TScreen_ChooseClub;",
    name = "m_SetUpScreen",
    returnType = "I",
    parameters = emptyList(),
    filters = listOf(
        string("TScreen_ChooseClub.SetUpScreen"),
        fieldAccess(
            definingClass = "Lcom/newstargames/newstarsoccer/bb_;",
            name = "g_gVersion",
            type = "Ljava/lang/String;",
        ),
        methodCall(
            definingClass = "Lcom/newstargames/newstarsoccer/bb_;",
            name = "g_UpdateDatabaseFolder",
        ),
    ),
)

/** Criação efetiva do jogador da nova carreira (grava m_gameversion no slot do save). */
internal object PlayerCreateFingerprint : Fingerprint(
    definingClass = "Lcom/newstargames/newstarsoccer/c_TPlayer;",
    name = "m_Create",
    returnType = "I",
    parameters = listOf("I", "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;", "I", "Z", "Z"),
    filters = listOf(
        fieldAccess(
            definingClass = "Lcom/newstargames/newstarsoccer/bb_;",
            name = "g_gVersion",
            type = "Ljava/lang/String;",
        ),
        fieldAccess(
            definingClass = "Lcom/newstargames/newstarsoccer/c_TPlayer;",
            name = "m_gameversion",
            type = "Ljava/lang/String;",
        ),
    ),
)

private const val BB_GAME_SERVICE = "Lcom/newstargames/newstarsoccer/BBGameService;"
private const val SAVE_SLOT_SCREEN = "Lcom/newstargames/newstarsoccer/c_TScreen_SaveSlot;"

/** Tentativa de login no Google Play Games (auto-login na abertura ou clique manual). */
internal object GameServiceBeginSignInFingerprint : Fingerprint(
    definingClass = BB_GAME_SERVICE,
    name = "beginUserSignIn",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/newstargames/newstarsoccer/GameHelper;",
            name = "beginUserInitiatedSignIn",
        ),
    ),
)

/** Reconexão automática do Google Play Games no onStart da Activity. */
internal object GameServiceOnStartFingerprint : Fingerprint(
    definingClass = BB_GAME_SERVICE,
    name = "onStart",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/newstargames/newstarsoccer/GameHelper;",
            name = "onStart",
        ),
    ),
)

/** Desconexão do Google Play Games no onStop da Activity. */
internal object GameServiceOnStopFingerprint : Fingerprint(
    definingClass = BB_GAME_SERVICE,
    name = "onStop",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/newstargames/newstarsoccer/GameHelper;",
            name = "onStop",
        ),
    ),
)

/** Abertura da tela de slots de carreira (exibe/oculta botões do Google Play nos 2 visuais). */
internal object SaveSlotSetupScreenFingerprint : Fingerprint(
    definingClass = SAVE_SLOT_SCREEN,
    name = "m_SetUpScreen",
    returnType = "I",
    parameters = emptyList(),
    filters = listOf(
        string("saveslot"),
        fieldAccess(
            definingClass = SAVE_SLOT_SCREEN,
            name = "m_gadgGooglePlayLogin",
        ),
        fieldAccess(
            definingClass = SAVE_SLOT_SCREEN,
            name = "m_btn_Network",
        ),
    ),
)

/** Loop de atualização do estado de login do Google Play na tela de slots. */
internal object SaveSlotUpdateFingerprint : Fingerprint(
    definingClass = SAVE_SLOT_SCREEN,
    name = "m_Update",
    returnType = "I",
    parameters = emptyList(),
    filters = listOf(
        fieldAccess(
            definingClass = SAVE_SLOT_SCREEN,
            name = "m_networkActive",
            type = "Z",
        ),
        methodCall(
            definingClass = "Lcom/newstargames/newstarsoccer/c_TNetwork;",
            name = "p_getLoginState",
        ),
    ),
)

/** Agendamento de notificações locais de retenção quando o app vai para segundo plano. */
internal object LocalNotifyOnPauseFingerprint : Fingerprint(
    definingClass = "Lcom/newstargames/newstarsoccer/c_LocalNotifyComponent;",
    name = "p_OnPause",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/newstargames/newstarsoccer/c_LocalNotification;",
            name = "p_ScheduleAfter",
        ),
    ),
)

/** Ponte que agenda efetivamente uma notificação local nativa após N segundos. */
internal object LocalNotificationScheduleAfterFingerprint : Fingerprint(
    definingClass = "Lcom/newstargames/newstarsoccer/c_LocalNotification;",
    name = "p_ScheduleAfter",
    returnType = "V",
    parameters = listOf("I"),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/newstargames/newstarsoccer/c_LocalNotification;",
            name = "NativeScheduleAfter",
        ),
    ),
)

/** Abertura da tela de Opções (chamada antes de m_CreateScreen e da ativação de options.uis). */
internal object OptionsSetupScreenFingerprint : Fingerprint(
    definingClass = "Lcom/newstargames/newstarsoccer/c_TScreen_Options;",
    name = "m_SetUpScreen",
    returnType = "I",
    parameters = emptyList(),
    filters = listOf(
        string("Options Setup Screen"),
        methodCall(
            definingClass = "Lcom/newstargames/newstarsoccer/c_TScreen_Options;",
            name = "m_CreateScreen",
        ),
        string("options"),
    ),
)

private const val CLOUD_CLASS = "Lcom/newstargames/newstarsoccer/c_Cloud;"

/** Inicialização interna da máquina de estados de Cloud / Cohorts / Remote Config. */
internal object CloudSetupInternalFingerprint : Fingerprint(
    definingClass = CLOUD_CLASS,
    name = "m_Setup_Internal",
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Lcom/newstargames/newstarsoccer/c_CloudCallbacks;",
    ),
    filters = listOf(
        fieldAccess(
            definingClass = CLOUD_CLASS,
            name = "m_localServerPath",
            type = "Ljava/lang/String;",
        ),
        methodCall(
            definingClass = "Lcom/newstargames/newstarsoccer/Skn3CheckOnline;",
            name = "IsOnline",
        ),
        fieldAccess(
            definingClass = CLOUD_CLASS,
            name = "m_CLD_GetRootConfig",
            type = "I",
        ),
    ),
)

/** Consulta de overrides de configuração remota (.cnfs) usados por tweaks e localização. */
internal object CloudHasGameConfigValueFingerprint : Fingerprint(
    definingClass = CLOUD_CLASS,
    name = "m_HasGameConfigurationValue",
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;"),
    filters = listOf(
        fieldAccess(
            definingClass = CLOUD_CLASS,
            name = "m_configStrings",
        ),
        methodCall(
            definingClass = "Lcom/newstargames/newstarsoccer/c_StringMap3;",
            name = "p_Contains",
        ),
    ),
)

/** Transição da tela de boot CloudSetup para o menu principal (checa m_mustFinishUpdating). */
internal object CloudSetupMoveOnToGameFingerprint : Fingerprint(
    definingClass = "Lcom/newstargames/newstarsoccer/c_TScreen_CloudSetup;",
    name = "m_MoveOnToGame",
    returnType = "I",
    parameters = emptyList(),
    filters = listOf(
        fieldAccess(
            definingClass = CLOUD_CLASS,
            name = "m_mustFinishUpdating",
            type = "Z",
        ),
        string("MSGINSTANT_SIMONREAD_MUSTFINISHDOWNLOAD"),
        methodCall(
            definingClass = "Lcom/newstargames/newstarsoccer/c_TScreen_MainMenu;",
            name = "m_SetUpScreen",
        ),
    ),
)

/** Carregamento de arquivos remotos pelo serviço de DLC / catálogos. */
internal object DlcServiceAssetsLoadFingerprint : Fingerprint(
    definingClass = "Lcom/newstargames/newstarsoccer/c_DLCService;",
    name = "m_AssetsLoad",
    returnType = "I",
    parameters = listOf("[Ljava/lang/String;", "Z"),
    filters = listOf(
        string("AssetsLoad: Skip of "),
        string("AssetsLoad: StartUpdate of "),
        methodCall(
            definingClass = "Lcom/newstargames/newstarsoccer/c_URLCache;",
            name = "p_StartUpdate",
        ),
    ),
)

/** Disparo de download assíncrono HTTP de um arquivo no cache de URLs do DLC. */
internal object UrlCacheStartUpdateFingerprint : Fingerprint(
    definingClass = "Lcom/newstargames/newstarsoccer/c_URLCache;",
    name = "p_StartUpdate",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;"),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/newstargames/newstarsoccer/c_AsyncDownload;",
            name = "m_AsyncDownload_new",
        ),
        fieldAccess(
            definingClass = "Lcom/newstargames/newstarsoccer/bb_dlcservice;",
            name = "g_DLC_Loading",
            type = "I",
        ),
    ),
)

/** Pilha de diretórios de busca de assets (.uis, tweaks, atlas, sons). */
internal object PathStackAddPathFingerprint : Fingerprint(
    definingClass = "Lcom/newstargames/newstarsoccer/c_PathStack;",
    name = "p_AddPath",
    returnType = "I",
    parameters = listOf("Ljava/lang/String;"),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/newstargames/newstarsoccer/c_DirectoryCache;",
            name = "m_DirectoryCache_new",
        ),
        methodCall(
            definingClass = "Lcom/newstargames/newstarsoccer/bb_data;",
            name = "g_FixDataPath",
        ),
    ),
)

/** Início do modo replay de um lance na partida (inicializa WatchReplay.*). */
internal object MatchStartReplayFingerprint : Fingerprint(
    definingClass = "Lcom/newstargames/newstarsoccer/c_TMatch;",
    name = "m_StartReplay",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        string("WatchReplay"),
        fieldAccess(
            definingClass = "Lcom/newstargames/newstarsoccer/c_TMatch;",
            name = "m_twk_ReplaySpeed",
        ),
        fieldAccess(
            definingClass = "Lcom/newstargames/newstarsoccer/c_TMatch;",
            name = "m_twk_ReplayPaused",
        ),
        string("ReplayActive"),
    ),
)

/** Atualização quadro a quadro do modo replay (m_matchstate == 10). */
internal object MatchUpdateReplayFingerprint : Fingerprint(
    definingClass = "Lcom/newstargames/newstarsoccer/c_TMatch;",
    name = "m_UpdateReplay",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/newstargames/newstarsoccer/c_TBall;",
            name = "m_UpdateReplay",
        ),
        methodCall(
            definingClass = "Lcom/newstargames/newstarsoccer/c_TMatchPlayer;",
            name = "m_UpdateReplayAll",
        ),
        methodCall(
            definingClass = "Lcom/newstargames/newstarsoccer/c_GSMatchChanceAddons;",
            name = "m_UpdateReplay",
        ),
    ),
)

/** Decisão de exibir o botão "Assistir Replay" ao fim de um lance. */
internal object MatchChanceShowWatchReplayFingerprint : Fingerprint(
    definingClass = "Lcom/newstargames/newstarsoccer/c_MatchChance;",
    name = "m_ShowWatchReplay",
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        string("ReplaysEnabled"),
        fieldAccess(
            definingClass = "Lcom/newstargames/newstarsoccer/c_TMatch;",
            name = "m_allowReplay",
            type = "Z",
        ),
        methodCall(
            definingClass = "Lcom/newstargames/newstarsoccer/c_MinigameHud;",
            name = "m_ShowWatchReplay",
        ),
    ),
)

/** Saída do modo replay (botão X ou botão Voltar do Android). */
internal object MatchEndReplayButtonFingerprint : Fingerprint(
    definingClass = "Lcom/newstargames/newstarsoccer/bb_GSMatchUtility;",
    name = "g_GSButtonEndReplay",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        fieldAccess(
            definingClass = "Lcom/newstargames/newstarsoccer/c_TMatch;",
            name = "m_watchReplay",
            type = "Z",
        ),
        fieldAccess(
            definingClass = "Lcom/newstargames/newstarsoccer/c_TMatch;",
            name = "m_twk_ReplayActive",
        ),
        methodCall(
            definingClass = "Lcom/newstargames/newstarsoccer/c_TMatch;",
            name = "m_EndChance",
        ),
    ),
)

/** Callback OpenGL ES de renderização de quadro do GLSurfaceView. */
internal object BBAndroidGameOnDrawFrameFingerprint : Fingerprint(
    definingClass = "Lcom/newstargames/newstarsoccer/BBAndroidGame;",
    name = "onDrawFrame",
    returnType = "V",
    parameters = listOf("Ljavax/microedition/khronos/opengles/GL10;"),
    filters = listOf(
        fieldAccess(
            definingClass = "Lcom/newstargames/newstarsoccer/BBAndroidGame;",
            name = "_canRender",
            type = "Z",
        ),
        methodCall(
            definingClass = "Lcom/newstargames/newstarsoccer/BBAndroidGame;",
            name = "RenderGame",
        ),
    ),
)

private const val SOCCER_PRODUCTS = "Lcom/newstargames/newstarsoccer/c_SoccerProducts;"
private const val PRODUCT_BOOT = "Lcom/newstargames/newstarsoccer/c_Product_Boot;"
private const val PRODUCT_NRG = "Lcom/newstargames/newstarsoccer/c_Product_NRG;"
private const val TPLAYER = "Lcom/newstargames/newstarsoccer/c_TPlayer;"
private const val BOOT_SHOP_SCREEN = "Lcom/newstargames/newstarsoccer/c_TScreen_BootShop;"
private const val GAME_MENU_SCREEN = "Lcom/newstargames/newstarsoccer/c_TScreen_GameMenu;"
private const val AGENT_DETAILS_SCREEN = "Lcom/newstargames/newstarsoccer/c_TScreen_AgentDetails;"

/** Registro inicial de todos os produtos (chuteiras, NRG, agentes, treinadores, bolas). */
internal object SoccerProductsRegisterProductsFingerprint : Fingerprint(
    definingClass = SOCCER_PRODUCTS,
    name = "m_RegisterProducts",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        string("supernrg_1.1"),
        string("NS-CNTRL_Mk1"),
        string("NS-SWRV+CNTRL"),
        methodCall(definingClass = SOCCER_PRODUCTS, name = "m_SetAltPricing"),
    ),
)

/** Atualização da disponibilidade das chuteiras (rotação + especiais Boot_21..26). */
internal object ProductBootUpdateAvailabilityFingerprint : Fingerprint(
    definingClass = PRODUCT_BOOT,
    name = "m_UpdateAvailability",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        string("Boot_Popular"),
        string("Boot_Value"),
        fieldAccess(
            definingClass = "Lcom/newstargames/newstarsoccer/bb_;",
            name = "g_gPaidVersion",
            type = "I",
        ),
        methodCall(definingClass = PRODUCT_BOOT, name = "m_EnsureBootsAvailability"),
    ),
)

/** Leitura da configuração remota de revenda/desconto das chuteiras (Boot_ResellMult_*). */
internal object ProductBootRefreshRemoteConfigFingerprint : Fingerprint(
    definingClass = PRODUCT_BOOT,
    name = "m_RefreshRemoteConfiguration",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        string("Boot_ResellMult_"),
        methodCall(
            definingClass = "Lcom/newstargames/newstarsoccer/c_SocialHub;",
            name = "p_GetGameConfigurationValue",
        ),
        methodCall(
            definingClass = "Ljava/lang/Float;",
            name = "parseFloat",
        ),
    ),
)

/** Atualização da disponibilidade dos energéticos (NRG_5, NRG_6, NRG_7). */
internal object ProductNrgUpdateAvailabilityFingerprint : Fingerprint(
    definingClass = PRODUCT_NRG,
    name = "m_UpdateAvailability",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        fieldAccess(
            definingClass = "Lcom/newstargames/newstarsoccer/bb_;",
            name = "g_gPaidVersion",
            type = "I",
        ),
        string("NRG_5"),
        string("NRG_6"),
        string("NRG_7"),
    ),
)

/** Cálculo do preço em Star Bux para contratação de Agentes por tier. */
internal object PlayerGetPriceAgentFingerprint : Fingerprint(
    definingClass = TPLAYER,
    name = "p_GetPriceAgent",
    returnType = "I",
    parameters = listOf("I"),
    filters = listOf(
        methodCall(definingClass = TPLAYER, name = "p_GetStarLevel"),
        literal(9999999),
    ),
)

/** Cálculo do preço em Star Bux para contratação de Treinadores por tier. */
internal object PlayerGetPriceTrainerFingerprint : Fingerprint(
    definingClass = TPLAYER,
    name = "p_GetPriceTrainer",
    returnType = "I",
    parameters = listOf("I"),
    filters = listOf(
        methodCall(definingClass = TPLAYER, name = "p_GetStarLevel"),
        literal(9999999),
    ),
)

/** Tratamento de saldo insuficiente em Star Bux (visual moderno e clássico). */
internal object PlayerNotEnoughCashFingerprint : Fingerprint(
    definingClass = "Lcom/newstargames/newstarsoccer/bb_GSPlayerUtility;",
    name = "g_GSPlayerNotEnoughCash",
    returnType = "V",
    parameters = listOf("I"),
    filters = listOf(
        string("BuxShort"),
        methodCall(
            definingClass = "Lcom/newstargames/newstarsoccer/c_ShopOverlay;",
            name = "m_NotEnoughCash",
        ),
        string("CMESSAGE_NOTENOUGHCASHSHORT"),
        string("splashmessageBux"),
    ),
)

/** Despachante de compra na loja (visual moderno via ProductRegistry e clássico por aba). */
internal object BootShopBuyFingerprint : Fingerprint(
    definingClass = BOOT_SHOP_SCREEN,
    name = "m_Buy",
    returnType = "I",
    parameters = emptyList(),
    filters = listOf(
        fieldAccess(
            definingClass = "Lcom/newstargames/newstarsoccer/bb_;",
            name = "g_gPaidVersion",
            type = "I",
        ),
        string("supernrg_1.1"),
        string("supernrg_4.1"),
        methodCall(definingClass = BOOT_SHOP_SCREEN, name = "m_BuyNRG"),
    ),
)

/** Botão Agente no menu principal clássico (decide entre tela de 1 agente ou tabela de 3 tiers). */
internal object GameMenuButtonAgentFingerprint : Fingerprint(
    definingClass = GAME_MENU_SCREEN,
    name = "m_ButtonAgent",
    returnType = "I",
    parameters = emptyList(),
    filters = listOf(
        methodCall(definingClass = AGENT_DETAILS_SCREEN, name = "m_SetUpScreen"),
        string("com.newstargames.newstarsoccer.topagent_3.1"),
        string("com.newstargames.newstarsoccer.topagent_1.1"),
    ),
)

/** Botão Treinador no menu principal clássico (decide entre tela de 1 treinador ou tabela de 3 tiers). */
internal object GameMenuButtonTrainerFingerprint : Fingerprint(
    definingClass = GAME_MENU_SCREEN,
    name = "m_ButtonTrainer",
    returnType = "I",
    parameters = emptyList(),
    filters = listOf(
        methodCall(definingClass = AGENT_DETAILS_SCREEN, name = "m_SetUpScreen"),
        string("com.newstargames.newstarsoccer.trainer_3.1"),
        string("com.newstargames.newstarsoccer.trainer_1.1"),
    ),
)

/** Preenchimento da aba Staff/Bux na loja do visual clássico. */
internal object BootShopRefreshTableBuxFingerprint : Fingerprint(
    definingClass = BOOT_SHOP_SCREEN,
    name = "m_RefreshTableBux",
    returnType = "I",
    parameters = emptyList(),
    filters = listOf(
        string("Agent_2"),
        string("Agent_3"),
        string("Trainer_2"),
        string("Trainer_3"),
        string("CMESSAGE_NOSHOPCONNECTION"),
    ),
)

/** Compra de itens na aba Staff/Bux da loja do visual clássico. */
internal object BootShopBuyStarBuxFingerprint : Fingerprint(
    definingClass = BOOT_SHOP_SCREEN,
    name = "m_BuyStarBux",
    returnType = "I",
    parameters = emptyList(),
    filters = listOf(
        methodCall(definingClass = TPLAYER, name = "p_HireAgent1"),
        string("com.newstargames.newstarsoccer.topagent_3.1"),
        string("com.newstargames.newstarsoccer.topagent_5.1"),
        string("com.newstargames.newstarsoccer.trainer_3.1"),
        string("com.newstargames.newstarsoccer.trainer_5.1"),
    ),
)

/** Tela de detalhes de Agente/Treinador no visual clássico (mostra benefícios e preço). */
internal object AgentDetailsSetupScreenFingerprint : Fingerprint(
    definingClass = AGENT_DETAILS_SCREEN,
    name = "m_SetUpScreen",
    returnType = "I",
    parameters = listOf("I", "I"),
    filters = listOf(
        methodCall(definingClass = TPLAYER, name = "p_GetPriceTrainer"),
        methodCall(definingClass = TPLAYER, name = "p_GetPriceAgent"),
        string("CMESSAGE_NOSHOPCONNECTION"),
    ),
)

/** Botão Contratar na tela de detalhes de Agente/Treinador do visual clássico. */
internal object AgentDetailsButtonHireFingerprint : Fingerprint(
    definingClass = AGENT_DETAILS_SCREEN,
    name = "m_ButtonHire",
    returnType = "I",
    parameters = emptyList(),
    filters = listOf(
        string("iap_Agent1"),
        string("iap_Trainer1"),
        fieldAccess(
            definingClass = AGENT_DETAILS_SCREEN,
            name = "m_onlinepurchase",
            type = "Z",
        ),
        methodCall(definingClass = BOOT_SHOP_SCREEN, name = "m_BuyStarBux"),
    ),
)
