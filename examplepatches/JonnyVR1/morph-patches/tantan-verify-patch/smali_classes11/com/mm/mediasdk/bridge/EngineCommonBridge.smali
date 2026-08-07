.class public Lcom/mm/mediasdk/bridge/EngineCommonBridge;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private final a:Ljava/lang/String;

.field private final b:Ljava/lang/String;

.field private final c:Ljava/lang/String;

.field private final d:Ljava/lang/String;

.field private final e:Ljava/lang/String;

.field private f:Ll/rer;


# direct methods
.method public constructor <init>(Ll/rer;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "FileUri"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/mm/mediasdk/bridge/EngineCommonBridge;->a:Ljava/lang/String;

    .line 7
    .line 8
    const-string v0, "ImageSize"

    .line 9
    .line 10
    iput-object v0, p0, Lcom/mm/mediasdk/bridge/EngineCommonBridge;->b:Ljava/lang/String;

    .line 11
    .line 12
    const-string v0, "Landmarks104"

    .line 13
    .line 14
    iput-object v0, p0, Lcom/mm/mediasdk/bridge/EngineCommonBridge;->c:Ljava/lang/String;

    .line 15
    .line 16
    const-string v0, "FaceRect"

    .line 17
    .line 18
    iput-object v0, p0, Lcom/mm/mediasdk/bridge/EngineCommonBridge;->d:Ljava/lang/String;

    .line 19
    .line 20
    const-string v0, "CVSingleFrameProcessBridge"

    .line 21
    .line 22
    iput-object v0, p0, Lcom/mm/mediasdk/bridge/EngineCommonBridge;->e:Ljava/lang/String;

    .line 23
    .line 24
    iput-object p1, p0, Lcom/mm/mediasdk/bridge/EngineCommonBridge;->f:Ll/rer;

    .line 25
    .line 26
    if-eqz p1, :cond_0

    .line 27
    .line 28
    invoke-virtual {p1, p0, v0}, Ll/rer;->b0(Ljava/lang/Object;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method private a(Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "EngineCommonBridge"

    .line 6
    .line 7
    if-nez v0, :cond_3

    .line 8
    .line 9
    new-instance v0, Ljava/io/File;

    .line 10
    .line 11
    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    sget-object v0, Ljava/io/File;->separator:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    array-length v2, v0

    .line 28
    const/4 v3, 0x1

    .line 29
    if-gt v2, v3, :cond_1

    .line 30
    .line 31
    const-string p0, "image path is illegal:"

    .line 32
    .line 33
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-static {p0, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-static {v1, p0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    return-object p1

    .line 45
    :cond_1
    array-length v1, v0

    .line 46
    sub-int/2addr v1, v3

    .line 47
    aget-object v0, v0, v1

    .line 48
    .line 49
    iget-object p0, p0, Lcom/mm/mediasdk/bridge/EngineCommonBridge;->f:Ll/rer;

    .line 50
    .line 51
    if-eqz p0, :cond_2

    .line 52
    .line 53
    const-string v1, ""

    .line 54
    .line 55
    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-virtual {p0, p1}, Ll/rer;->Z(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    :cond_2
    return-object v0

    .line 63
    :cond_3
    :goto_0
    const-string p0, "image path is empty or not exist!!"

    .line 64
    .line 65
    invoke-static {v1, p0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    return-object p1
.end method


# virtual methods
.method public ProcessFaceEntity(Ljava/lang/String;Lcom/momo/xeengine/script/ScriptBridge$Callback;)Ljava/lang/String;
    .locals 1
    .annotation build Landroidx/annotation/Keep;
    .end annotation

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    :try_start_0
    new-instance p2, Lorg/json/JSONObject;

    .line 10
    .line 11
    invoke-direct {p2, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const-string v0, "FileUri"

    .line 15
    .line 16
    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    check-cast p2, Ljava/lang/String;

    .line 21
    .line 22
    invoke-direct {p0, p2}, Lcom/mm/mediasdk/bridge/EngineCommonBridge;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    invoke-static {}, Ll/lrw;->j()Ll/lrw;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0}, Ll/lrw;->b()Ll/opl;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 30
    .line 31
    .line 32
    return-object p1

    .line 33
    :catch_0
    move-exception p0

    .line 34
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 35
    .line 36
    .line 37
    return-object p1
.end method

.method public b()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/mm/mediasdk/bridge/EngineCommonBridge;->f:Ll/rer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/rer;->f()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/mm/mediasdk/bridge/EngineCommonBridge;->f:Ll/rer;

    .line 10
    .line 11
    :cond_0
    return-void
.end method
