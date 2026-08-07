.class public final Lcom/sina/weibo/sdk/sso/WeiboSsoManager;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sina/weibo/sdk/sso/WeiboSsoManager$Instance;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "WeiboSsoManager"


# instance fields
.field private aid:Ljava/lang/String;


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lcom/sina/weibo/sdk/sso/WeiboSsoManager$1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/sina/weibo/sdk/sso/WeiboSsoManager;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$202(Lcom/sina/weibo/sdk/sso/WeiboSsoManager;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/sina/weibo/sdk/sso/WeiboSsoManager;->aid:Ljava/lang/String;

    .line 2
    .line 3
    return-object p1
.end method

.method public static declared-synchronized getInstance()Lcom/sina/weibo/sdk/sso/WeiboSsoManager;
    .locals 2

    .line 1
    const-class v0, Lcom/sina/weibo/sdk/sso/WeiboSsoManager;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    invoke-static {}, Lcom/sina/weibo/sdk/sso/WeiboSsoManager$Instance;->access$100()Lcom/sina/weibo/sdk/sso/WeiboSsoManager;

    .line 5
    .line 6
    .line 7
    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    monitor-exit v0

    .line 9
    return-object v1

    .line 10
    :catchall_0
    move-exception v1

    .line 11
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 12
    throw v1
.end method

.method private initAid()V
    .locals 2

    .line 1
    :try_start_0
    invoke-static {}, Lcom/weibo/ssosdk/WeiboSsoSdk;->i()Lcom/weibo/ssosdk/WeiboSsoSdk;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Lcom/sina/weibo/sdk/sso/WeiboSsoManager$1;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Lcom/sina/weibo/sdk/sso/WeiboSsoManager$1;-><init>(Lcom/sina/weibo/sdk/sso/WeiboSsoManager;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lcom/weibo/ssosdk/WeiboSsoSdk;->m(Lcom/weibo/ssosdk/a;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :catch_0
    move-exception p0

    .line 15
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 16
    .line 17
    .line 18
    const-string v0, "WeiboSsoManager"

    .line 19
    .line 20
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-static {v0, p0}, Lcom/sina/weibo/sdk/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method


# virtual methods
.method public getAid(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1
    const-string v0, "WeiboSsoManager"

    .line 2
    .line 3
    const-string v1, "getAid()"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/sina/weibo/sdk/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/sina/weibo/sdk/sso/WeiboSsoManager;->aid:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0, p1, p2}, Lcom/sina/weibo/sdk/sso/WeiboSsoManager;->init(Landroid/content/Context;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object p0, p0, Lcom/sina/weibo/sdk/sso/WeiboSsoManager;->aid:Ljava/lang/String;

    .line 20
    .line 21
    return-object p0
.end method

.method public getMfp(Landroid/content/Context;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p1}, Ll/ra00;->n(Landroid/content/Context;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public init(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string v0, "WeiboSsoManager"

    .line 2
    .line 3
    const-string v1, "init config"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/sina/weibo/sdk/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    new-instance v0, Ll/pwp0;

    .line 9
    .line 10
    invoke-direct {v0}, Ll/pwp0;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, p1}, Ll/pwp0;->m(Landroid/content/Context;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p2}, Ll/pwp0;->l(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    const-string p1, "1478195010"

    .line 20
    .line 21
    invoke-virtual {v0, p1}, Ll/pwp0;->n(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    const-string p1, "1000_0001"

    .line 25
    .line 26
    invoke-virtual {v0, p1}, Ll/pwp0;->o(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v0}, Lcom/weibo/ssosdk/WeiboSsoSdk;->j(Ll/pwp0;)Z

    .line 30
    .line 31
    .line 32
    invoke-direct {p0}, Lcom/sina/weibo/sdk/sso/WeiboSsoManager;->initAid()V

    .line 33
    .line 34
    .line 35
    return-void
.end method
