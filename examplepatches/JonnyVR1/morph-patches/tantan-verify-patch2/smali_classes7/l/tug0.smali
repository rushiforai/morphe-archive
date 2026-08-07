.class public abstract Ll/tug0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ljava/util/concurrent/ExecutorService;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Ll/tug0;->a:Ljava/util/concurrent/ExecutorService;

    .line 6
    .line 7
    return-void
.end method

.method public static a()V
    .locals 4

    .line 1
    const-string v0, "TechSudMGPGlobal.sp"

    .line 2
    .line 3
    invoke-static {v0}, Ll/kjg0;->a(Ljava/lang/String;)Ll/kjg0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v0, v0, Ll/kjg0;->a:Landroid/content/SharedPreferences;

    .line 8
    .line 9
    const-string v1, "key_upload_anr_log_info"

    .line 10
    .line 11
    const-string v2, ""

    .line 12
    .line 13
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    .line 25
    .line 26
    invoke-direct {v1, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    const-string v0, "logId"

    .line 30
    .line 31
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const-string v2, "mgId"

    .line 36
    .line 37
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    .line 38
    .line 39
    .line 40
    move-result-wide v1

    .line 41
    const/4 v3, 0x1

    .line 42
    invoke-static {v1, v2, v3, v0}, Ll/tug0;->b(JILjava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :catch_0
    move-exception v0

    .line 47
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public static b(JILjava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    new-instance v0, Ll/vwg0;

    .line 9
    .line 10
    invoke-direct {v0}, Ll/vwg0;-><init>()V

    .line 11
    .line 12
    .line 13
    sget-object v1, Ll/utg0;->g:Ljava/lang/String;

    .line 14
    .line 15
    iput-object v1, v0, Ll/vwg0;->a:Ljava/lang/String;

    .line 16
    .line 17
    iput-wide p0, v0, Ll/vwg0;->b:J

    .line 18
    .line 19
    iput-object p3, v0, Ll/vwg0;->c:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {}, Ll/utg0;->f()Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    iput-boolean p0, v0, Ll/vwg0;->d:Z

    .line 26
    .line 27
    iput p2, v0, Ll/vwg0;->e:I

    .line 28
    .line 29
    sget-object p0, Ll/tug0;->a:Ljava/util/concurrent/ExecutorService;

    .line 30
    .line 31
    new-instance p1, Ll/pzg0;

    .line 32
    .line 33
    invoke-direct {p1, v0}, Ll/pzg0;-><init>(Ll/vwg0;)V

    .line 34
    .line 35
    .line 36
    invoke-interface {p0, p1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method
