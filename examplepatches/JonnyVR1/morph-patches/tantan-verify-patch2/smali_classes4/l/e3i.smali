.class public Ll/e3i;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final c:Ljava/lang/Long;

.field public static d:Ll/byd0;

.field public static volatile e:Ll/e3i;


# instance fields
.field public a:Z

.field public b:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-wide/32 v0, 0x5265c00

    .line 2
    .line 3
    .line 4
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    sput-object v0, Ll/e3i;->c:Ljava/lang/Long;

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/e3i;->a:Z

    .line 6
    .line 7
    iput v0, p0, Ll/e3i;->b:I

    .line 8
    .line 9
    return-void
.end method

.method public static c()Ll/e3i;
    .locals 5

    .line 1
    const-string v0, "last_show_my_tab_state_post_tips_time_"

    .line 2
    .line 3
    sget-object v1, Ll/e3i;->e:Ll/e3i;

    .line 4
    .line 5
    if-nez v1, :cond_1

    .line 6
    .line 7
    const-class v1, Ll/e3i;

    .line 8
    .line 9
    monitor-enter v1

    .line 10
    :try_start_0
    sget-object v2, Ll/e3i;->e:Ll/e3i;

    .line 11
    .line 12
    if-nez v2, :cond_0

    .line 13
    .line 14
    new-instance v2, Ll/e3i;

    .line 15
    .line 16
    invoke-direct {v2}, Ll/e3i;-><init>()V

    .line 17
    .line 18
    .line 19
    sput-object v2, Ll/e3i;->e:Ll/e3i;

    .line 20
    .line 21
    new-instance v2, Ll/byd0;

    .line 22
    .line 23
    new-instance v3, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    const-wide/16 v3, 0x0

    .line 44
    .line 45
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    invoke-direct {v2, v0, v3}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 50
    .line 51
    .line 52
    sput-object v2, Ll/e3i;->d:Ll/byd0;

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :catchall_0
    move-exception v0

    .line 56
    goto :goto_1

    .line 57
    :cond_0
    :goto_0
    monitor-exit v1

    .line 58
    goto :goto_2

    .line 59
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 60
    throw v0

    .line 61
    :cond_1
    :goto_2
    sget-object v0, Ll/e3i;->e:Ll/e3i;

    .line 62
    .line 63
    return-object v0
.end method


# virtual methods
.method public a()Z
    .locals 9

    .line 1
    sget-object v0, Ll/e3i;->d:Ll/byd0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/Long;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 14
    .line 15
    .line 16
    move-result-wide v2

    .line 17
    const-wide/16 v4, 0x0

    .line 18
    .line 19
    cmp-long v0, v2, v4

    .line 20
    .line 21
    const/4 v4, 0x1

    .line 22
    if-gtz v0, :cond_1

    .line 23
    .line 24
    return v4

    .line 25
    :cond_1
    invoke-static {}, Ll/pzi0;->o()J

    .line 26
    .line 27
    .line 28
    move-result-wide v5

    .line 29
    sub-long/2addr v5, v2

    .line 30
    invoke-virtual {p0}, Ll/e3i;->d()I

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    int-to-long v2, p0

    .line 35
    sget-object p0, Ll/e3i;->c:Ljava/lang/Long;

    .line 36
    .line 37
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 38
    .line 39
    .line 40
    move-result-wide v7

    .line 41
    mul-long/2addr v2, v7

    .line 42
    cmp-long p0, v5, v2

    .line 43
    .line 44
    if-lez p0, :cond_2

    .line 45
    .line 46
    return v4

    .line 47
    :cond_2
    return v1
.end method

.method public b()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/e3i;->e()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x3

    .line 6
    if-ge p0, v0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x1

    .line 11
    return p0
.end method

.method public final d()I
    .locals 1

    .line 1
    :try_start_0
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "state_publish_config"

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->F(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    new-instance v0, Lorg/json/JSONObject;

    .line 18
    .line 19
    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    const-string p0, "navigation_view_bubbleshowtimes"

    .line 23
    .line 24
    invoke-virtual {v0, p0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 28
    return p0

    .line 29
    :catch_0
    :cond_0
    const/4 p0, 0x1

    .line 30
    return p0
.end method

.method public e()I
    .locals 0

    .line 1
    iget p0, p0, Ll/e3i;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public f()V
    .locals 2

    .line 1
    iget v0, p0, Ll/e3i;->b:I

    .line 2
    .line 3
    const/16 v1, 0x64

    .line 4
    .line 5
    if-lt v0, v1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    add-int/lit8 v1, v0, 0x1

    .line 9
    .line 10
    :goto_0
    iput v1, p0, Ll/e3i;->b:I

    .line 11
    .line 12
    return-void
.end method

.method public g()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    sput-object v0, Ll/e3i;->e:Ll/e3i;

    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/e3i;->b:I

    .line 6
    .line 7
    return-void
.end method

.method public h()V
    .locals 2

    .line 1
    sget-object p0, Ll/e3i;->d:Ll/byd0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/pzi0;->o()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method
