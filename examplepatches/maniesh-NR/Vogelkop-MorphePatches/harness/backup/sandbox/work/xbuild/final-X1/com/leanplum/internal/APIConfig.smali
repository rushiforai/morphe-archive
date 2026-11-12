.class public Lcom/leanplum/internal/APIConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final INSTANCE:Lcom/leanplum/internal/APIConfig;


# instance fields
.field private accessKey:Ljava/lang/String;

.field private appId:Ljava/lang/String;

.field private deviceId:Ljava/lang/String;

.field private token:Ljava/lang/String;

.field private userId:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lcom/leanplum/internal/APIConfig;

    invoke-direct {v0}, Lcom/leanplum/internal/APIConfig;-><init>()V

    sput-object v0, Lcom/leanplum/internal/APIConfig;->INSTANCE:Lcom/leanplum/internal/APIConfig;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getInstance()Lcom/leanplum/internal/APIConfig;
    .registers 1

    sget-object v0, Lcom/leanplum/internal/APIConfig;->INSTANCE:Lcom/leanplum/internal/APIConfig;

    return-object v0
.end method


# virtual methods
.method public accessKey()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lcom/leanplum/internal/APIConfig;->accessKey:Ljava/lang/String;

    return-object p0
.end method

.method public appId()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lcom/leanplum/internal/APIConfig;->appId:Ljava/lang/String;

    return-object p0
.end method

.method public attachApiKeys(Ljava/util/Map;)Z
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)Z"
        }
    .end annotation

    iget-object v0, p0, Lcom/leanplum/internal/APIConfig;->appId:Ljava/lang/String;

    if-eqz v0, :cond_1d

    iget-object v1, p0, Lcom/leanplum/internal/APIConfig;->accessKey:Ljava/lang/String;

    if-eqz v1, :cond_1d

    const-string v1, "appId"

    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "clientKey"

    iget-object p0, p0, Lcom/leanplum/internal/APIConfig;->accessKey:Ljava/lang/String;

    invoke-interface {p1, v0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p0, "client"

    sget-object v0, Lcom/leanplum/internal/Constants;->CLIENT:Ljava/lang/String;

    invoke-interface {p1, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 p0, 0x1

    return p0

    :cond_1d
    const-string p0, "API keys are not set. Please use Leanplum.setAppIdForDevelopmentMode or Leanplum.setAppIdForProductionMode."

    const/4 p1, 0x0

    new-array v0, p1, [Ljava/lang/Object;

    invoke-static {p0, v0}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return p1
.end method

.method public deviceId()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lcom/leanplum/internal/APIConfig;->deviceId:Ljava/lang/String;

    return-object p0
.end method

.method public loadToken()V
    .registers 4

    invoke-static {}, Lcom/leanplum/Leanplum;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "__leanplum__"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "__leanplum_token"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_15

    return-void

    :cond_15
    invoke-virtual {p0, v0}, Lcom/leanplum/internal/APIConfig;->setToken(Ljava/lang/String;)V

    return-void
.end method

.method public loadToken(Ljava/lang/String;)V
    .registers 2

    .line 25
    iput-object p1, p0, Lcom/leanplum/internal/APIConfig;->token:Ljava/lang/String;

    return-void
.end method

.method public saveToken()V
    .registers 3

    invoke-static {}, Lcom/leanplum/Leanplum;->getContext()Landroid/content/Context;

    move-result-object p0

    const-string v0, "__leanplum__"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-static {}, Lcom/leanplum/internal/APIConfig;->getInstance()Lcom/leanplum/internal/APIConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/leanplum/internal/APIConfig;->token()Ljava/lang/String;

    move-result-object v0

    const-string v1, "__leanplum_token"

    invoke-interface {p0, v1, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-static {p0}, Lcom/leanplum/utils/SharedPreferencesUtil;->commitChanges(Landroid/content/SharedPreferences$Editor;)V

    return-void
.end method

.method public setAppId(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_c

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/leanplum/internal/APIConfig;->appId:Ljava/lang/String;

    :cond_c
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_18

    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/leanplum/internal/APIConfig;->accessKey:Ljava/lang/String;

    :cond_18
    return-void
.end method

.method public setDeviceId(Ljava/lang/String;)V
    .registers 2

    iput-object p1, p0, Lcom/leanplum/internal/APIConfig;->deviceId:Ljava/lang/String;

    return-void
.end method

.method public setToken(Ljava/lang/String;)V
    .registers 2

    iput-object p1, p0, Lcom/leanplum/internal/APIConfig;->token:Ljava/lang/String;

    return-void
.end method

.method public setUserId(Ljava/lang/String;)V
    .registers 2

    iput-object p1, p0, Lcom/leanplum/internal/APIConfig;->userId:Ljava/lang/String;

    return-void
.end method

.method public token()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lcom/leanplum/internal/APIConfig;->token:Ljava/lang/String;

    return-object p0
.end method

.method public userId()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lcom/leanplum/internal/APIConfig;->userId:Ljava/lang/String;

    return-object p0
.end method
