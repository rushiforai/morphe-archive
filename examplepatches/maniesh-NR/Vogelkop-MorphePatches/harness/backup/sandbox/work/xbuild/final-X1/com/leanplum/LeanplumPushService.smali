.class public Lcom/leanplum/LeanplumPushService;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final LEANPLUM_ACTION_PARAM:Ljava/lang/String; = "lp_action_param"

.field public static final LEANPLUM_MESSAGE_ID:Ljava/lang/String; = "lp_message_id"

.field public static final LEANPLUM_MESSAGE_PARAM:Ljava/lang/String; = "lp_message_param"

.field public static final LEANPLUM_NOTIFICATION:Ljava/lang/String; = "LP_NOTIFICATION"

.field public static final LEANPLUM_SENDER_ID:Ljava/lang/String; = "44059457771"

.field private static final NOTIFICATION_GROUP_ID:I = -0x2723c370

.field private static final NOTIFICATION_GROUP_KEY:Ljava/lang/String; = "leanplum_notification_group"

.field private static final NOTIFICATION_ID:I = 0x1

.field private static final OPEN_ACTION:Ljava/lang/String; = "Open"

.field private static final OPEN_URL:Ljava/lang/String; = "Open URL"

.field private static final URL:Ljava/lang/String; = "URL"

.field private static callbackClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "+",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field private static customizer:Lcom/leanplum/LeanplumPushNotificationCustomizer;

.field private static deeplinkIntentCustomizer:Lcom/leanplum/DeeplinkIntentCustomizer;

.field private static defaultNotificationGroupTag:Ljava/lang/String;

.field private static defaultNotificationTag:Ljava/lang/String;

.field private static minNotificationsToGroup:I

.field private static onPushOpenedCallback:Lcom/leanplum/LeanplumOnPushOpenedCallback;

.field private static overrideDefaultGroupingBehavior:Z

.field private static final pushProviders:Lcom/leanplum/PushProviders;

.field private static useNotificationBuilderCustomizer:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lcom/leanplum/PushProviders;

    invoke-direct {v0}, Lcom/leanplum/PushProviders;-><init>()V

    sput-object v0, Lcom/leanplum/LeanplumPushService;->pushProviders:Lcom/leanplum/PushProviders;

    const/4 v0, 0x0

    sput-boolean v0, Lcom/leanplum/LeanplumPushService;->useNotificationBuilderCustomizer:Z

    sput-boolean v0, Lcom/leanplum/LeanplumPushService;->overrideDefaultGroupingBehavior:Z

    const/4 v0, 0x4

    sput v0, Lcom/leanplum/LeanplumPushService;->minNotificationsToGroup:I

    const/4 v0, 0x0

    sput-object v0, Lcom/leanplum/LeanplumPushService;->defaultNotificationTag:Ljava/lang/String;

    sput-object v0, Lcom/leanplum/LeanplumPushService;->defaultNotificationGroupTag:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static synthetic access$000(Landroid/os/Bundle;)Z
    .registers 1

    invoke-static {p0}, Lcom/leanplum/LeanplumPushService;->areActionsEmbedded(Landroid/os/Bundle;)Z

    move-result p0

    return p0
.end method

.method public static synthetic access$100(Ljava/lang/String;Lcom/leanplum/callbacks/VariablesChangedCallback;)V
    .registers 2

    invoke-static {p0, p1}, Lcom/leanplum/LeanplumPushService;->requireMessageContent(Ljava/lang/String;Lcom/leanplum/callbacks/VariablesChangedCallback;)V

    return-void
.end method

.method public static addExternallyManagedChannel(Ljava/lang/String;)V
    .registers 1

    invoke-static {p0}, Lcom/leanplum/LeanplumNotificationChannel;->addExternallyManagedChannel(Ljava/lang/String;)V

    return-void
.end method

.method private static areActionsEmbedded(Landroid/os/Bundle;)Z
    .registers 2

    const-string v0, "_lpx"

    invoke-virtual {p0, v0}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method private static buildGroupingSummary(Landroid/content/Context;Landroid/os/Bundle;Lcom/leanplum/LeanplumNotificationHelper$NotificationGroupInfo;)Landroid/app/Notification;
    .registers 4

    invoke-static {p0, p1}, Lcom/leanplum/LeanplumNotificationHelper;->getNotificationCompatBuilder(Landroid/content/Context;Landroid/os/Bundle;)Ll1f;

    move-result-object p1

    if-nez p1, :cond_8

    const/4 p0, 0x0

    return-object p0

    :cond_8
    iget-object p2, p2, Lcom/leanplum/LeanplumNotificationHelper$NotificationGroupInfo;->key:Ljava/lang/String;

    iput-object p2, p1, Ll1f;->r:Ljava/lang/String;

    const/4 p2, 0x1

    iput-boolean p2, p1, Ll1f;->s:Z

    const/16 v0, 0x10

    invoke-virtual {p1, v0, p2}, Ll1f;->h(IZ)V

    invoke-static {p0}, Lcom/leanplum/LeanplumNotificationHelper;->getDefaultPushNotificationIconResourceId(Landroid/content/Context;)I

    move-result p0

    iget-object p2, p1, Ll1f;->G:Landroid/app/Notification;

    iput p0, p2, Landroid/app/Notification;->icon:I

    sget-object p0, Lcom/leanplum/LeanplumPushService;->customizer:Lcom/leanplum/LeanplumPushNotificationCustomizer;

    if-eqz p0, :cond_23

    invoke-interface {p0, p1}, Lcom/leanplum/LeanplumPushNotificationCustomizer;->customizeGroupingNotification(Ll1f;)V

    :cond_23
    invoke-virtual {p1}, Ll1f;->b()Landroid/app/Notification;

    move-result-object p0

    return-object p0
.end method

.method private static createActivityIntent(Landroid/content/Context;Landroid/os/Bundle;)Landroid/content/Intent;
    .registers 4
    .annotation build Landroid/annotation/TargetApi;
        value = 0x1f
    .end annotation

    const-string v0, "_lpx"

    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_23

    const-string v1, "Open URL"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_23

    invoke-static {p1}, Lcom/leanplum/LeanplumPushService;->getDeepLinkIntent(Landroid/os/Bundle;)Landroid/content/Intent;

    move-result-object v0

    if-eqz v0, :cond_23

    invoke-static {p0, v0}, Lcom/leanplum/LeanplumPushService;->resolveIntentActivity(Landroid/content/Context;Landroid/content/Intent;)V

    invoke-static {p1}, Lcom/leanplum/LeanplumPushService;->getMessageId(Landroid/os/Bundle;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_22

    invoke-virtual {v0, p1}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    :cond_22
    return-object v0

    :cond_23
    invoke-static {p0}, Lcom/leanplum/LeanplumPushService;->getActionIntent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object p0

    if-nez p0, :cond_2b

    const/4 p0, 0x0

    return-object p0

    :cond_2b
    invoke-virtual {p0, p1}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    const/high16 p1, 0x14000000

    invoke-virtual {p0, p1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    return-object p0
.end method

.method private static createBroadcastIntent(Landroid/content/Context;Landroid/os/Bundle;Ljava/lang/Class;)Landroid/content/Intent;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/os/Bundle;",
            "Ljava/lang/Class<",
            "+",
            "Landroid/content/BroadcastReceiver;",
            ">;)",
            "Landroid/content/Intent;"
        }
    .end annotation

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0, p0, p2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string p0, "lpAction"

    invoke-virtual {v0, p0}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {v0, p1}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    return-object v0
.end method

.method private static createContentIntent(Landroid/content/Context;Landroid/os/Bundle;)Landroid/app/PendingIntent;
    .registers 3

    .line 57
    const-class v0, Lcom/leanplum/LeanplumPushReceiver;

    invoke-static {p0, p1, v0}, Lcom/leanplum/LeanplumPushService;->createContentIntent(Landroid/content/Context;Landroid/os/Bundle;Ljava/lang/Class;)Landroid/app/PendingIntent;

    move-result-object p0

    return-object p0
.end method

.method public static createContentIntent(Landroid/content/Context;Landroid/os/Bundle;Ljava/lang/Class;)Landroid/app/PendingIntent;
    .registers 4
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/os/Bundle;",
            "Ljava/lang/Class<",
            "+",
            "Landroid/content/BroadcastReceiver;",
            ">;)",
            "Landroid/app/PendingIntent;"
        }
    .end annotation

    invoke-static {p0}, Lcom/leanplum/utils/BuildUtil;->shouldDisableTrampolines(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_1e

    invoke-static {p0, p1}, Lcom/leanplum/LeanplumPushService;->createActivityIntent(Landroid/content/Context;Landroid/os/Bundle;)Landroid/content/Intent;

    move-result-object p1

    new-instance p2, Ljava/util/Random;

    invoke-direct {p2}, Ljava/util/Random;-><init>()V

    invoke-virtual {p2}, Ljava/util/Random;->nextInt()I

    move-result p2

    const/high16 v0, 0x8000000

    invoke-static {v0}, Lcom/leanplum/utils/BuildUtil;->createIntentFlags(I)I

    move-result v0

    invoke-static {p0, p2, p1, v0}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p0

    return-object p0

    :cond_1e
    invoke-static {p0, p1, p2}, Lcom/leanplum/LeanplumPushService;->createBroadcastIntent(Landroid/content/Context;Landroid/os/Bundle;Ljava/lang/Class;)Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    new-instance p2, Ljava/util/Random;

    invoke-direct {p2}, Ljava/util/Random;-><init>()V

    invoke-virtual {p2}, Ljava/util/Random;->nextInt()I

    move-result p2

    const/4 v0, 0x0

    invoke-static {v0}, Lcom/leanplum/utils/BuildUtil;->createIntentFlags(I)I

    move-result v0

    invoke-static {p0, p2, p1, v0}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p0

    return-object p0
.end method

.method private static getActionIntent(Landroid/content/Context;)Landroid/content/Intent;
    .registers 3

    invoke-static {}, Lcom/leanplum/LeanplumPushService;->getCallbackClass()Ljava/lang/Class;

    move-result-object v0

    if-eqz v0, :cond_c

    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1, p0, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    return-object v1

    :cond_c
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    return-object p0
.end method

.method private static getCallbackClass()Ljava/lang/Class;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "+",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/leanplum/LeanplumPushService;->callbackClass:Ljava/lang/Class;

    return-object v0
.end method

.method private static getDeepLinkIntent(Landroid/os/Bundle;)Landroid/content/Intent;
    .registers 4

    :try_start_0
    const-string v0, "_lpx"

    invoke-virtual {p0, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_30

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    new-instance p0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    const-string v2, "URL"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-direct {p0, v1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const/high16 v0, 0x10000000

    invoke-virtual {p0, v0}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    sget-object v0, Lcom/leanplum/LeanplumPushService;->deeplinkIntentCustomizer:Lcom/leanplum/DeeplinkIntentCustomizer;

    if-eqz v0, :cond_2f

    invoke-static {}, Lcom/leanplum/Leanplum;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-interface {v0, v1, p0}, Lcom/leanplum/DeeplinkIntentCustomizer;->customize(Landroid/content/Context;Landroid/content/Intent;)Landroid/content/Intent;

    move-result-object p0
    :try_end_2f
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_2f} :catch_30

    :cond_2f
    return-object p0

    :catch_30
    :cond_30
    const/4 p0, 0x0

    return-object p0
.end method

.method public static getMessageId(Landroid/os/Bundle;)Ljava/lang/String;
    .registers 3

    const-string v0, "_lpm"

    invoke-virtual {p0, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_1e

    const-string v0, "_lpu"

    invoke-virtual {p0, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_1e

    const-string v0, "_lpn"

    invoke-virtual {p0, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_1e

    const-string v0, "_lpv"

    invoke-virtual {p0, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_1e
    if-eqz v0, :cond_25

    const-string v1, "lp_messageId"

    invoke-virtual {p0, v1, v0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_25
    return-object v0
.end method

.method public static getPushProviders()Lcom/leanplum/PushProviders;
    .registers 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    sget-object v0, Lcom/leanplum/LeanplumPushService;->pushProviders:Lcom/leanplum/PushProviders;

    return-object v0
.end method

.method public static handleNotification(Landroid/content/Context;Landroid/os/Bundle;)V
    .registers 3

    invoke-static {p0, p1}, Lcom/leanplum/PushTracking;->trackDelivery(Landroid/content/Context;Landroid/os/Bundle;)V

    invoke-static {p1}, Lcom/leanplum/PushTracking;->isFcmSilentPush(Landroid/os/Bundle;)Z

    move-result v0

    if-nez v0, :cond_f

    invoke-static {p1}, Lcom/leanplum/LeanplumPushService;->shouldMuteNotification(Landroid/os/Bundle;)Z

    move-result v0

    if-eqz v0, :cond_10

    :cond_f
    return-void

    :cond_10
    invoke-static {p1}, Lcom/leanplum/LeanplumPushService;->getMessageId(Landroid/os/Bundle;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_20

    invoke-static {}, Lcom/leanplum/internal/LeanplumInternal;->hasCalledStart()Z

    move-result v0

    if-eqz v0, :cond_20

    invoke-static {p0, p1}, Lcom/leanplum/LeanplumPushService;->showNotification(Landroid/content/Context;Landroid/os/Bundle;)V

    return-void

    :cond_20
    invoke-static {p0, p1}, Lcom/leanplum/LeanplumPushService;->showNotification(Landroid/content/Context;Landroid/os/Bundle;)V

    return-void
.end method

.method private static isActivityWithIntentStarted(Landroid/content/Context;Landroid/os/Bundle;)Z
    .registers 9

    const-string v0, "_lpx"

    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_34

    const-string v2, "Open URL"

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_34

    invoke-static {p1}, Lcom/leanplum/LeanplumPushService;->getDeepLinkIntent(Landroid/os/Bundle;)Landroid/content/Intent;

    move-result-object v0

    if-eqz v0, :cond_34

    invoke-static {p0, v0}, Lcom/leanplum/LeanplumPushService;->resolveIntentActivity(Landroid/content/Context;Landroid/content/Intent;)V

    invoke-static {p1}, Lcom/leanplum/LeanplumPushService;->getMessageId(Landroid/os/Bundle;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_34

    new-instance v2, Lcom/leanplum/ActionContext;

    const-string v3, "__Push Notification"

    const/4 v4, 0x0

    invoke-direct {v2, v3, v4, p1}, Lcom/leanplum/ActionContext;-><init>(Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;)V

    const-string p1, "Open"

    const-wide/16 v5, 0x0

    invoke-virtual {v2, p1, v5, v6, v4}, Lcom/leanplum/ActionContext;->track(Ljava/lang/String;DLjava/util/Map;)V

    :try_start_2f
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_32
    .catch Landroid/content/ActivityNotFoundException; {:try_start_2f .. :try_end_32} :catch_34

    const/4 p0, 0x1

    return p0

    :catch_34
    :cond_34
    return v1
.end method

.method private static maybePostGroupSummary(Landroid/content/Context;Landroid/app/NotificationManager;Landroid/os/Bundle;Lcom/leanplum/LeanplumNotificationHelper$NotificationGroupInfo;)V
    .registers 6

    invoke-static {}, Lcom/leanplum/LeanplumNotificationHelper;->isGroupingSupported()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_23

    if-eqz p3, :cond_23

    iget-object v0, p3, Lcom/leanplum/LeanplumNotificationHelper$NotificationGroupInfo;->key:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/leanplum/LeanplumNotificationHelper;->getNumberOfActiveNotifications(Landroid/app/NotificationManager;Ljava/lang/String;)I

    move-result v0

    iget v1, p3, Lcom/leanplum/LeanplumNotificationHelper$NotificationGroupInfo;->minNotificationsToGroup:I

    if-lt v0, v1, :cond_23

    invoke-static {p0, p2, p3}, Lcom/leanplum/LeanplumPushService;->buildGroupingSummary(Landroid/content/Context;Landroid/os/Bundle;Lcom/leanplum/LeanplumNotificationHelper$NotificationGroupInfo;)Landroid/app/Notification;

    move-result-object p0

    if-eqz p0, :cond_23

    iget-object p2, p3, Lcom/leanplum/LeanplumNotificationHelper$NotificationGroupInfo;->tag:Ljava/lang/String;

    iget p3, p3, Lcom/leanplum/LeanplumNotificationHelper$NotificationGroupInfo;->id:I

    invoke-virtual {p1, p2, p3, p0}, Landroid/app/NotificationManager;->notify(Ljava/lang/String;ILandroid/app/Notification;)V

    :cond_23
    return-void
.end method

.method public static onActivityNotificationClick(Landroid/os/Bundle;)V
    .registers 6
    .param p0    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    const-string v0, "lp_occurrence_id"

    invoke-virtual {p0, v0}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_10

    invoke-virtual {p0, v0}, Landroid/os/BaseBundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    goto :goto_1e

    :cond_10
    const-string v0, "internal_occurrence_id"

    invoke-virtual {p0, v0}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_59

    invoke-virtual {p0, v0}, Landroid/os/BaseBundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    :goto_1e
    invoke-static {v0}, Lcom/leanplum/internal/PushActionPersistenceKt;->isOpened(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2c

    const-string p0, "Open Action from activity intent is already executed."

    new-array v0, v2, [Ljava/lang/Object;

    invoke-static {p0, v0}, Lcom/leanplum/internal/Log;->i(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    :cond_2c
    const-string v1, "Executing Open Action from push notification."

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v1, v2}, Lcom/leanplum/internal/Log;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-static {v0}, Lcom/leanplum/internal/PushActionPersistenceKt;->recordOpenAction(Ljava/lang/String;)V

    invoke-static {p0}, Lcom/leanplum/PushTracking;->trackOpen(Landroid/os/Bundle;)V

    invoke-static {p0}, Lcom/leanplum/LeanplumPushService;->getDeepLinkIntent(Landroid/os/Bundle;)Landroid/content/Intent;

    move-result-object v0

    if-eqz v0, :cond_55

    invoke-static {p0}, Lcom/leanplum/LeanplumPushService;->getMessageId(Landroid/os/Bundle;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_54

    new-instance v0, Lcom/leanplum/ActionContext;

    const-string v1, "__Push Notification"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, p0}, Lcom/leanplum/ActionContext;-><init>(Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;)V

    const-string p0, "Open"

    const-wide/16 v3, 0x0

    invoke-virtual {v0, p0, v3, v4, v2}, Lcom/leanplum/ActionContext;->track(Ljava/lang/String;DLjava/util/Map;)V

    :cond_54
    return-void

    :cond_55
    invoke-static {p0}, Lcom/leanplum/LeanplumPushService;->performPushNotificationAction(Landroid/os/Bundle;)V

    return-void

    :cond_59
    const-string p0, "Skipping execution of Open Action because occurrenceId is missing."

    new-array v0, v2, [Ljava/lang/Object;

    invoke-static {p0, v0}, Lcom/leanplum/internal/Log;->i(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method public static onPushNotificationOpened(Landroid/os/Bundle;)V
    .registers 2
    .param p0    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    sget-object v0, Lcom/leanplum/LeanplumPushService;->onPushOpenedCallback:Lcom/leanplum/LeanplumOnPushOpenedCallback;

    if-eqz v0, :cond_7

    invoke-interface {v0, p0}, Lcom/leanplum/LeanplumOnPushOpenedCallback;->onLeanplumPushOpened(Landroid/os/Bundle;)V

    :cond_7
    return-void
.end method

.method public static onStart()V
    .registers 1

    sget-object v0, Lcom/leanplum/LeanplumPushService;->pushProviders:Lcom/leanplum/PushProviders;

    invoke-virtual {v0}, Lcom/leanplum/PushProviders;->init()V

    invoke-virtual {v0}, Lcom/leanplum/PushProviders;->updateRegistrationIdsAndBackend()V

    return-void
.end method

.method public static openNotification(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 2

    .line 61
    invoke-static {p0, p1}, Lcom/leanplum/LeanplumPushService;->preHandlePushNotification(Landroid/content/Context;Landroid/content/Intent;)Landroid/os/Bundle;

    move-result-object p1

    if-nez p1, :cond_7

    return-void

    .line 62
    :cond_7
    invoke-static {p0, p1}, Lcom/leanplum/LeanplumPushService;->openNotification(Landroid/content/Context;Landroid/os/Bundle;)V

    return-void
.end method

.method public static openNotification(Landroid/content/Context;Landroid/os/Bundle;)V
    .registers 5
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "Opening push notification action."

    invoke-static {v1, v0}, Lcom/leanplum/internal/Log;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-static {p1}, Lcom/leanplum/PushTracking;->trackOpen(Landroid/os/Bundle;)V

    invoke-static {p0, p1}, Lcom/leanplum/LeanplumPushService;->isActivityWithIntentStarted(Landroid/content/Context;Landroid/os/Bundle;)Z

    move-result v0

    if-nez v0, :cond_2d

    invoke-static {}, Lcom/leanplum/LeanplumPushService;->getCallbackClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {}, Lcom/leanplum/LeanplumActivityHelper;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v1

    if-eqz v1, :cond_27

    sget-boolean v2, Lcom/leanplum/LeanplumActivityHelper;->isActivityPaused:Z

    if-nez v2, :cond_27

    if-eqz v0, :cond_39

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_39

    :cond_27
    invoke-static {p0}, Lcom/leanplum/LeanplumPushService;->getActionIntent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v0

    if-nez v0, :cond_2e

    :cond_2d
    return-void

    :cond_2e
    invoke-virtual {v0, p1}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    const/high16 v1, 0x14000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    :cond_39
    invoke-static {p1}, Lcom/leanplum/LeanplumPushService;->performPushNotificationAction(Landroid/os/Bundle;)V

    return-void
.end method

.method public static overrideDefaultGroupingBehavior(ILjava/lang/String;)V
    .registers 3

    const/4 v0, 0x1

    sput-boolean v0, Lcom/leanplum/LeanplumPushService;->overrideDefaultGroupingBehavior:Z

    sput p0, Lcom/leanplum/LeanplumPushService;->minNotificationsToGroup:I

    sput-object p1, Lcom/leanplum/LeanplumPushService;->defaultNotificationGroupTag:Ljava/lang/String;

    return-void
.end method

.method public static parseNotificationBundle(Landroid/os/Bundle;)Ljava/util/Map;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/os/Bundle;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    :try_start_0
    const-string v0, "_lpx"

    invoke-virtual {p0, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "lp_message"

    invoke-virtual {p0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p0}, Lcom/leanplum/LeanplumPushService;->getMessageId(Landroid/os/Bundle;)Ljava/lang/String;

    move-result-object p0

    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    const-string v3, "lp_action_param"

    invoke-static {v0}, Lcom/leanplum/internal/JsonConverter;->fromJson(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v0

    invoke-virtual {v2, v3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "lp_message_param"

    invoke-virtual {v2, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "lp_message_id"

    invoke-virtual {v2, v0, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_28
    .catchall {:try_start_0 .. :try_end_28} :catchall_29

    return-object v2

    :catchall_29
    const/4 p0, 0x0

    new-array p0, p0, [Ljava/lang/Object;

    const-string v0, "Failed to parse notification bundle."

    invoke-static {v0, p0}, Lcom/leanplum/internal/Log;->i(Ljava/lang/String;[Ljava/lang/Object;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method private static performPushNotificationAction(Landroid/os/Bundle;)V
    .registers 2
    .param p0    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    new-instance v0, Lcom/leanplum/LeanplumPushService$3;

    invoke-direct {v0, p0}, Lcom/leanplum/LeanplumPushService$3;-><init>(Landroid/os/Bundle;)V

    invoke-static {v0}, Lcom/leanplum/LeanplumActivityHelper;->queueActionUponActive(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static postHandlePushNotification(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 2

    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object p0

    if-nez p0, :cond_f

    const/4 p0, 0x0

    new-array p0, p0, [Ljava/lang/Object;

    const-string p1, "Could not post handle push notification, extras are null."

    invoke-static {p1, p0}, Lcom/leanplum/internal/Log;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    :cond_f
    invoke-static {p0}, Lcom/leanplum/LeanplumPushService;->performPushNotificationAction(Landroid/os/Bundle;)V

    return-void
.end method

.method public static preHandlePushNotification(Landroid/content/Context;Landroid/content/Intent;)Landroid/os/Bundle;
    .registers 3

    const/4 p0, 0x0

    const/4 v0, 0x0

    if-nez p1, :cond_c

    const-string p1, "Unable to pre handle push notification, Intent is null."

    new-array v0, v0, [Ljava/lang/Object;

    invoke-static {p1, v0}, Lcom/leanplum/internal/Log;->i(Ljava/lang/String;[Ljava/lang/Object;)V

    return-object p0

    :cond_c
    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object p1

    if-nez p1, :cond_1a

    const-string p1, "Unable to pre handle push notification, extras are null."

    new-array v0, v0, [Ljava/lang/Object;

    invoke-static {p1, v0}, Lcom/leanplum/internal/Log;->i(Ljava/lang/String;[Ljava/lang/Object;)V

    return-object p0

    :cond_1a
    return-object p1
.end method

.method private static requireMessageContent(Ljava/lang/String;Lcom/leanplum/callbacks/VariablesChangedCallback;)V
    .registers 3

    new-instance v0, Lcom/leanplum/LeanplumPushService$1;

    invoke-direct {v0, p0, p1}, Lcom/leanplum/LeanplumPushService$1;-><init>(Ljava/lang/String;Lcom/leanplum/callbacks/VariablesChangedCallback;)V

    invoke-static {v0}, Lcom/leanplum/Leanplum;->addOnceVariablesChangedAndNoDownloadsPendingHandler(Lcom/leanplum/callbacks/VariablesChangedCallback;)V

    return-void
.end method

.method private static resolveIntentActivity(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 6

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    const/high16 v1, 0x20000

    invoke-virtual {v0, p1, v1}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_3d

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_3d

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_16
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3d

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/pm/ResolveInfo;

    if-eqz v1, :cond_16

    iget-object v2, v1, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    if-eqz v2, :cond_16

    iget-object v2, v2, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    if-eqz v2, :cond_16

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_16

    iget-object p0, v1, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object p0, p0, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    invoke-virtual {p1, p0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    :cond_3d
    return-void
.end method

.method public static setCustomizer(Lcom/leanplum/LeanplumPushNotificationCustomizer;)V
    .registers 2

    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/leanplum/LeanplumPushService;->setCustomizer(Lcom/leanplum/LeanplumPushNotificationCustomizer;Z)V

    return-void
.end method

.method public static setCustomizer(Lcom/leanplum/LeanplumPushNotificationCustomizer;Z)V
    .registers 2

    .line 5
    sput-object p0, Lcom/leanplum/LeanplumPushService;->customizer:Lcom/leanplum/LeanplumPushNotificationCustomizer;

    .line 6
    sput-boolean p1, Lcom/leanplum/LeanplumPushService;->useNotificationBuilderCustomizer:Z

    return-void
.end method

.method public static setDeeplinkIntentCustomizer(Lcom/leanplum/DeeplinkIntentCustomizer;)V
    .registers 1

    sput-object p0, Lcom/leanplum/LeanplumPushService;->deeplinkIntentCustomizer:Lcom/leanplum/DeeplinkIntentCustomizer;

    return-void
.end method

.method public static setDefaultCallbackClass(Ljava/lang/Class;)V
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "+",
            "Landroid/app/Activity;",
            ">;)V"
        }
    .end annotation

    sput-object p0, Lcom/leanplum/LeanplumPushService;->callbackClass:Ljava/lang/Class;

    return-void
.end method

.method public static setDefaultNotificationTag(Ljava/lang/String;)V
    .registers 1

    sput-object p0, Lcom/leanplum/LeanplumPushService;->defaultNotificationTag:Ljava/lang/String;

    return-void
.end method

.method public static setOnPushNotificationOpenedCallback(Lcom/leanplum/LeanplumOnPushOpenedCallback;)V
    .registers 1
    .param p0    # Lcom/leanplum/LeanplumOnPushOpenedCallback;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    sput-object p0, Lcom/leanplum/LeanplumPushService;->onPushOpenedCallback:Lcom/leanplum/LeanplumOnPushOpenedCallback;

    return-void
.end method

.method public static shouldMuteNotification(Landroid/os/Bundle;)Z
    .registers 2
    .param p0    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    invoke-static {}, Lcom/leanplum/LeanplumActivityHelper;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_1c

    sget-boolean v0, Lcom/leanplum/LeanplumActivityHelper;->isActivityPaused:Z

    if-nez v0, :cond_1c

    const-string v0, "_lpu"

    invoke-virtual {p0, v0}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1a

    const-string v0, "_lpv"

    invoke-virtual {p0, v0}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_1c

    :cond_1a
    const/4 p0, 0x1

    return p0

    :cond_1c
    const/4 p0, 0x0

    return p0
.end method

.method public static showDeviceRegisteredPush(Landroid/content/Context;Landroid/content/Context;)V
    .registers 6

    :try_start_0
    invoke-static {p0}, Lcom/leanplum/utils/BuildUtil;->isNotificationChannelSupported(Landroid/content/Context;)Z

    move-result v0

    invoke-static {p0, v0}, Lcom/leanplum/LeanplumNotificationHelper;->getDefaultCompatNotificationBuilder(Landroid/content/Context;Z)Ll1f;

    move-result-object p0

    if-eqz p0, :cond_41

    iget-object v0, p0, Ll1f;->G:Landroid/app/Notification;

    const v1, 0x1080074

    iput v1, v0, Landroid/app/Notification;->icon:I

    const-string v0, "Leanplum"

    invoke-static {v0}, Ll1f;->c(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v0

    iput-object v0, p0, Ll1f;->e:Ljava/lang/CharSequence;

    const-string v0, "Your device is registered."

    invoke-virtual {p0, v0}, Ll1f;->e(Ljava/lang/CharSequence;)V

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    const/4 v2, 0x0

    invoke-static {v2}, Lcom/leanplum/utils/BuildUtil;->createIntentFlags(I)I

    move-result v3

    invoke-static {v0, v2, v1, v3}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    iput-object v0, p0, Ll1f;->g:Landroid/app/PendingIntent;

    const-string v0, "notification"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/app/NotificationManager;

    invoke-virtual {p0}, Ll1f;->b()Landroid/app/Notification;

    move-result-object p0

    invoke-virtual {p1, v2, p0}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V
    :try_end_41
    .catchall {:try_start_0 .. :try_end_41} :catchall_41

    :catchall_41
    :cond_41
    return-void
.end method

.method private static showNotification(Landroid/content/Context;Landroid/os/Bundle;)V
    .registers 16
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    const-string v1, "Unable to show push notification."

    if-eqz p0, :cond_16b

    if-eqz p1, :cond_16b

    invoke-static {p0}, Lcom/leanplum/LeanplumNotificationHelper;->isApplicationIconValid(Landroid/content/Context;)Z

    move-result v0

    const/4 v2, 0x0

    if-nez v0, :cond_13

    invoke-static {p0}, Lcom/leanplum/LeanplumNotificationHelper;->getDefaultPushNotificationIconResourceId(Landroid/content/Context;)I

    move-result v0

    move v9, v0

    goto :goto_14

    :cond_13
    move v9, v2

    :goto_14
    const-string v0, "notification"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    if-eqz v0, :cond_16b

    invoke-static {p0, p1}, Lcom/leanplum/LeanplumPushService;->createContentIntent(Landroid/content/Context;Landroid/os/Bundle;)Landroid/app/PendingIntent;

    move-result-object v5

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/leanplum/internal/Util;->getApplicationName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "title"

    invoke-virtual {p1, v4}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_36

    invoke-virtual {p1, v4}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    :cond_36
    move-object v6, v3

    const-string v3, "lp_message"

    invoke-virtual {p1, v3}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v3, "lp_imageUrl"

    invoke-virtual {p1, v3}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {p0, v3}, Lcom/leanplum/LeanplumNotificationHelper;->getBigPictureBitmap(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v3

    const-string v4, "icon_url"

    invoke-virtual {p1, v4}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {p0, v4}, Lcom/leanplum/LeanplumNotificationHelper;->getLargeIconBitmap(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v8

    const-string v4, "lp_group"

    invoke-virtual {p1, v4}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/leanplum/LeanplumNotificationHelper;->getNotificationGroupInfo(Ljava/lang/String;)Lcom/leanplum/LeanplumNotificationHelper$NotificationGroupInfo;

    move-result-object v4

    invoke-static {}, Lcom/leanplum/LeanplumNotificationHelper;->isGroupingSupported()Ljava/lang/Boolean;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v10

    if-eqz v10, :cond_78

    if-nez v4, :cond_78

    sget-boolean v10, Lcom/leanplum/LeanplumPushService;->overrideDefaultGroupingBehavior:Z

    if-eqz v10, :cond_78

    new-instance v4, Lcom/leanplum/LeanplumNotificationHelper$NotificationGroupInfo;

    sget-object v10, Lcom/leanplum/LeanplumPushService;->defaultNotificationGroupTag:Ljava/lang/String;

    sget v11, Lcom/leanplum/LeanplumPushService;->NOTIFICATION_GROUP_ID:I

    const-string v12, "leanplum_notification_group"

    sget v13, Lcom/leanplum/LeanplumPushService;->minNotificationsToGroup:I

    invoke-direct {v4, v10, v11, v12, v13}, Lcom/leanplum/LeanplumNotificationHelper$NotificationGroupInfo;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    :cond_78
    move-object v10, v4

    sget-object v4, Lcom/leanplum/LeanplumPushService;->customizer:Lcom/leanplum/LeanplumPushNotificationCustomizer;

    const/4 v12, 0x0

    if-eqz v4, :cond_8f

    sget-boolean v4, Lcom/leanplum/LeanplumPushService;->useNotificationBuilderCustomizer:Z

    if-nez v4, :cond_8f

    move-object v4, p1

    move-object v11, v10

    move v10, v9

    move-object v9, v3

    move-object v3, p0

    invoke-static/range {v3 .. v11}, Lcom/leanplum/LeanplumNotificationHelper;->getNotificationCompatBuilder(Landroid/content/Context;Landroid/os/Bundle;Landroid/app/PendingIntent;Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;ILcom/leanplum/LeanplumNotificationHelper$NotificationGroupInfo;)Ll1f;

    move-result-object p0

    move-object p1, v9

    move-object v10, v11

    move-object v5, v12

    goto :goto_98

    :cond_8f
    move-object v4, p1

    move-object p1, v3

    move-object v3, p0

    invoke-static/range {v3 .. v10}, Lcom/leanplum/LeanplumNotificationHelper;->getNotificationBuilder(Landroid/content/Context;Landroid/os/Bundle;Landroid/app/PendingIntent;Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;ILcom/leanplum/LeanplumNotificationHelper$NotificationGroupInfo;)Landroid/app/Notification$Builder;

    move-result-object p0

    move-object v5, p0

    move-object p0, v12

    :goto_98
    if-nez p0, :cond_9c

    if-eqz v5, :cond_16b

    :cond_9c
    sget-object v8, Lcom/leanplum/LeanplumPushService;->customizer:Lcom/leanplum/LeanplumPushNotificationCustomizer;

    const/4 v9, 0x1

    if-eqz v8, :cond_a2

    move v2, v9

    :cond_a2
    sget-boolean v11, Lcom/leanplum/LeanplumPushService;->useNotificationBuilderCustomizer:Z

    xor-int/lit8 v13, v11, 0x1

    and-int/2addr v2, v13

    if-eqz v2, :cond_ab

    if-eqz p0, :cond_16b

    :cond_ab
    if-eqz v8, :cond_b1

    if-eqz v11, :cond_b1

    if-eqz v5, :cond_16b

    :cond_b1
    if-nez v8, :cond_b5

    if-eqz v5, :cond_16b

    :cond_b5
    if-eqz v8, :cond_e0

    if-eqz v11, :cond_cc

    if-eqz p1, :cond_c8

    :try_start_bb
    invoke-static {v4, p1, v6, v7}, Lcom/leanplum/LeanplumNotificationHelper;->getBigPictureStyle(Landroid/os/Bundle;Landroid/graphics/Bitmap;Ljava/lang/String;Ljava/lang/String;)Landroid/app/Notification$BigPictureStyle;

    move-result-object p1

    sget-object v2, Lcom/leanplum/LeanplumPushService;->customizer:Lcom/leanplum/LeanplumPushNotificationCustomizer;

    invoke-interface {v2, v5, v4, p1}, Lcom/leanplum/LeanplumPushNotificationCustomizer;->customize(Landroid/app/Notification$Builder;Landroid/os/Bundle;Landroid/app/Notification$Style;)V

    invoke-static {v5, p1}, Lcom/leanplum/LeanplumNotificationHelper;->setModifiedBigPictureStyle(Landroid/app/Notification$Builder;Landroid/app/Notification$Style;)V

    goto :goto_e9

    :cond_c8
    invoke-interface {v8, v5, v4, v12}, Lcom/leanplum/LeanplumPushNotificationCustomizer;->customize(Landroid/app/Notification$Builder;Landroid/os/Bundle;Landroid/app/Notification$Style;)V

    goto :goto_e9

    :cond_cc
    invoke-interface {v8, p0, v4}, Lcom/leanplum/LeanplumPushNotificationCustomizer;->customize(Ll1f;Landroid/os/Bundle;)V
    :try_end_cf
    .catchall {:try_start_bb .. :try_end_cf} :catchall_d0

    goto :goto_e9

    :catchall_d0
    move-exception v0

    move-object p0, v0

    invoke-static {p0}, Lcom/leanplum/internal/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    const-string p1, "Unable to customize push notification: %s"

    invoke-static {p1, p0}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    :cond_e0
    if-eqz p1, :cond_e9

    invoke-static {v4, p1, v6, v7}, Lcom/leanplum/LeanplumNotificationHelper;->getBigPictureStyle(Landroid/os/Bundle;Landroid/graphics/Bitmap;Ljava/lang/String;Ljava/lang/String;)Landroid/app/Notification$BigPictureStyle;

    move-result-object p1

    invoke-static {v5, p1}, Lcom/leanplum/LeanplumNotificationHelper;->setModifiedBigPictureStyle(Landroid/app/Notification$Builder;Landroid/app/Notification$Style;)V

    :cond_e9
    :goto_e9
    const-string p1, "lp_notificationTag"

    sget-object v2, Lcom/leanplum/LeanplumPushService;->defaultNotificationTag:Ljava/lang/String;

    invoke-virtual {v4, p1, v2}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v2, "lp_notificationId"

    invoke-virtual {v4, v2}, Landroid/os/BaseBundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    instance-of v6, v2, Ljava/lang/Number;

    if-eqz v6, :cond_102

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    move-result v2

    goto :goto_121

    :cond_102
    instance-of v6, v2, Ljava/lang/String;

    if-eqz v6, :cond_10d

    :try_start_106
    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2
    :try_end_10c
    .catch Ljava/lang/NumberFormatException; {:try_start_106 .. :try_end_10c} :catch_120

    goto :goto_121

    :cond_10d
    const-string v2, "lp_messageId"

    invoke-virtual {v4, v2}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_120

    invoke-virtual {v4, v2}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_120

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    goto :goto_121

    :catch_120
    :cond_120
    move v2, v9

    :goto_121
    :try_start_121
    const-string v6, "_lpx"

    invoke-virtual {v4, v6}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/leanplum/internal/JsonConverter;->fromJson(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v6

    invoke-static {v6}, Lcom/leanplum/ActionContext;->shouldForceContentUpdateForChainedMessage(Ljava/util/Map;)Z

    move-result v6

    if-eqz v6, :cond_145

    new-instance v6, Ljava/util/concurrent/CountDownLatch;

    invoke-direct {v6, v9}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    new-instance v7, Lcom/leanplum/LeanplumPushService$2;

    invoke-direct {v7, v6}, Lcom/leanplum/LeanplumPushService$2;-><init>(Ljava/util/concurrent/CountDownLatch;)V

    invoke-static {v7}, Lcom/leanplum/Leanplum;->forceContentUpdate(Lcom/leanplum/callbacks/VariablesChangedCallback;)V

    sget-object v7, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v8, 0x3

    invoke-virtual {v6, v8, v9, v7}, Ljava/util/concurrent/CountDownLatch;->await(JLjava/util/concurrent/TimeUnit;)Z

    :cond_145
    if-eqz v5, :cond_152

    invoke-virtual {v5}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object p0

    invoke-virtual {v0, p1, v2, p0}, Landroid/app/NotificationManager;->notify(Ljava/lang/String;ILandroid/app/Notification;)V

    invoke-static {v3, v0, v4, v10}, Lcom/leanplum/LeanplumPushService;->maybePostGroupSummary(Landroid/content/Context;Landroid/app/NotificationManager;Landroid/os/Bundle;Lcom/leanplum/LeanplumNotificationHelper$NotificationGroupInfo;)V

    goto :goto_16b

    :cond_152
    invoke-virtual {p0}, Ll1f;->b()Landroid/app/Notification;

    move-result-object p0

    invoke-virtual {v0, p1, v2, p0}, Landroid/app/NotificationManager;->notify(Ljava/lang/String;ILandroid/app/Notification;)V

    invoke-static {v3, v0, v4, v10}, Lcom/leanplum/LeanplumPushService;->maybePostGroupSummary(Landroid/content/Context;Landroid/app/NotificationManager;Landroid/os/Bundle;Lcom/leanplum/LeanplumNotificationHelper$NotificationGroupInfo;)V
    :try_end_15c
    .catch Ljava/lang/NullPointerException; {:try_start_121 .. :try_end_15c} :catch_166
    .catchall {:try_start_121 .. :try_end_15c} :catchall_15d

    goto :goto_16b

    :catchall_15d
    move-exception v0

    move-object p0, v0

    invoke-static {v1, p0}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    goto :goto_16b

    :catch_166
    move-exception v0

    move-object p0, v0

    invoke-static {v1, p0}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_16b
    :goto_16b
    return-void
.end method

.method public static unregister()V
    .registers 6

    :try_start_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.google.android.c2dm.intent.UNREGISTER"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/leanplum/Leanplum;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "app"

    new-instance v3, Landroid/content/Intent;

    invoke-direct {v3}, Landroid/content/Intent;-><init>()V

    const/4 v4, 0x0

    invoke-static {v4}, Lcom/leanplum/utils/BuildUtil;->createIntentFlags(I)I

    move-result v5

    invoke-static {v1, v4, v3, v5}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    const-string v2, "com.google.android.gms"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {v1, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;
    :try_end_26
    .catchall {:try_start_0 .. :try_end_26} :catchall_27

    return-void

    :catchall_27
    move-exception v0

    invoke-static {v0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    return-void
.end method
