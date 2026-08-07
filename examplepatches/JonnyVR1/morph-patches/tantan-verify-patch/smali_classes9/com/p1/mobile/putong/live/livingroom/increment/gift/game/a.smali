.class public Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a$c;
    }
.end annotation


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public d:Ljava/lang/String;

.field public final e:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a$c;

.field public f:Z

.field public g:Z

.field public h:Z

.field public i:Lcom/momo/xeengine/game/XEGameView;

.field public j:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler;

.field public final k:Landroid/os/Handler;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a$c;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)V
    .locals 2
    .param p1    # Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a$c;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p4    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p5    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->f:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->g:Z

    .line 8
    .line 9
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->h:Z

    .line 10
    .line 11
    new-instance v0, Landroid/os/Handler;

    .line 12
    .line 13
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->k:Landroid/os/Handler;

    .line 21
    .line 22
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->a:Ljava/lang/String;

    .line 23
    .line 24
    iput-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->b:Ljava/lang/String;

    .line 25
    .line 26
    iput-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->c:Ljava/lang/String;

    .line 27
    .line 28
    iput-object p5, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->d:Ljava/lang/String;

    .line 29
    .line 30
    iput-boolean p6, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->f:Z

    .line 31
    .line 32
    iput-boolean p7, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->g:Z

    .line 33
    .line 34
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->e:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a$c;

    .line 35
    .line 36
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->j()V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a$c;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->e:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a$c;

    return-object p0
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;)Landroid/os/Handler;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->k:Landroid/os/Handler;

    return-object p0
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->a:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;Lcom/momo/xeengine/IXEngine;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->l(Lcom/momo/xeengine/IXEngine;)V

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->m()V

    return-void
.end method


# virtual methods
.method public g()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->h:Z

    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->k:Landroid/os/Handler;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->j:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler;->removeLuaGame()V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->j:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler;->unRegister()V

    .line 22
    .line 23
    .line 24
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->j:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler;

    .line 25
    .line 26
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->n()V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final h()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->d:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v2, "/params.txt"

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_0

    .line 30
    .line 31
    :try_start_0
    invoke-static {v0}, Ll/oki;->A(Ljava/io/File;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-nez v1, :cond_0

    .line 40
    .line 41
    new-instance v1, Lorg/json/JSONObject;

    .line 42
    .line 43
    invoke-direct {v1, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    const-string v0, "itemList"

    .line 47
    .line 48
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    const/4 v1, 0x0

    .line 53
    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    check-cast v0, Lorg/json/JSONObject;

    .line 58
    .line 59
    const-string v1, "folder"

    .line 60
    .line 61
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 65
    return-object p0

    .line 66
    :catch_0
    move-exception v0

    .line 67
    goto :goto_0

    .line 68
    :catch_1
    move-exception v0

    .line 69
    :goto_0
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 70
    .line 71
    .line 72
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 73
    .line 74
    const-string v1, "can not get game fold name, use default. gameRootPath is "

    .line 75
    .line 76
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->d:Ljava/lang/String;

    .line 80
    .line 81
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-static {p0}, Ll/clj;->o(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    const-string p0, "game"

    .line 92
    .line 93
    return-object p0
.end method

.method public i()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->h:Z

    .line 2
    .line 3
    return p0
.end method

.method public final synthetic j()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->h:Z

    .line 3
    .line 4
    return-void
.end method

.method public k(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->e:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a$c;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string p0, "gameEffectListener should not be null"

    .line 6
    .line 7
    invoke-static {p0}, Ll/clj;->o(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    new-instance v0, Lcom/momo/xeengine/game/XEGameView;

    .line 12
    .line 13
    invoke-direct {v0, p1}, Lcom/momo/xeengine/game/XEGameView;-><init>(Landroid/content/Context;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->i:Lcom/momo/xeengine/game/XEGameView;

    .line 17
    .line 18
    iget-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->f:Z

    .line 19
    .line 20
    if-eqz p1, :cond_1

    .line 21
    .line 22
    const/4 p1, 0x1

    .line 23
    invoke-virtual {v0, p1}, Lcom/momo/xeengine/game/XEGameView;->setTouchEnable(Z)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    const/4 p1, 0x0

    .line 28
    invoke-virtual {v0, p1}, Lcom/momo/xeengine/game/XEGameView;->setTouchEnable(Z)V

    .line 29
    .line 30
    .line 31
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->e:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a$c;

    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->i:Lcom/momo/xeengine/game/XEGameView;

    .line 34
    .line 35
    invoke-interface {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a$c;->d(Landroid/view/View;)V

    .line 36
    .line 37
    .line 38
    iget-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->g:Z

    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->i:Lcom/momo/xeengine/game/XEGameView;

    .line 41
    .line 42
    if-eqz p1, :cond_2

    .line 43
    .line 44
    const/16 p1, 0xf

    .line 45
    .line 46
    invoke-virtual {v0, p1}, Lcom/momo/xeengine/game/XEGameView;->setPreferredFramesPerSecond(I)V

    .line 47
    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_2
    const/16 p1, 0x1e

    .line 51
    .line 52
    invoke-virtual {v0, p1}, Lcom/momo/xeengine/game/XEGameView;->setPreferredFramesPerSecond(I)V

    .line 53
    .line 54
    .line 55
    :goto_1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->i:Lcom/momo/xeengine/game/XEGameView;

    .line 56
    .line 57
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a$a;

    .line 58
    .line 59
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p1, v0}, Lcom/momo/xeengine/game/XEGameView;->setCallback(Lcom/momo/xeengine/game/IXGameView$Callback;)V

    .line 63
    .line 64
    .line 65
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->i:Lcom/momo/xeengine/game/XEGameView;

    .line 66
    .line 67
    invoke-virtual {p0}, Lcom/momo/xeengine/game/XEGameView;->start()V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public final l(Lcom/momo/xeengine/IXEngine;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->h()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->d:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v2, "/"

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->d:Ljava/lang/String;

    .line 28
    .line 29
    invoke-interface {p1, v0}, Lcom/momo/xeengine/IXEngine;->addLibraryPath(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-interface {p1}, Lcom/momo/xeengine/IXEngine;->getLogger()Lcom/momo/xeengine/XELogger;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    const/4 v1, 0x1

    .line 37
    invoke-virtual {v0, v1}, Lcom/momo/xeengine/XELogger;->setLogEnable(Z)V

    .line 38
    .line 39
    .line 40
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler;->getInstance(Lcom/momo/xeengine/IXEngine;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->j:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler;

    .line 45
    .line 46
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler;->register()V

    .line 47
    .line 48
    .line 49
    invoke-interface {p1}, Lcom/momo/xeengine/IXEngine;->getScriptEngine()Lcom/momo/xeengine/script/XEScriptEngine;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    const-string v0, "app"

    .line 54
    .line 55
    invoke-interface {p1, v0}, Lcom/momo/xeengine/script/XEScriptEngine;->startGameScriptFile(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->j:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler;

    .line 59
    .line 60
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->b:Ljava/lang/String;

    .line 61
    .line 62
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler;->pushRoomInfo(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->j:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler;

    .line 66
    .line 67
    if-nez p1, :cond_0

    .line 68
    .line 69
    return-void

    .line 70
    :cond_0
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a$b;

    .line 71
    .line 72
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a$b;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler;->setLuaCallback(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler$b;)V

    .line 76
    .line 77
    .line 78
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->k:Landroid/os/Handler;

    .line 79
    .line 80
    new-instance v0, Ll/xkj;

    .line 81
    .line 82
    invoke-direct {v0, p0}, Ll/xkj;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 86
    .line 87
    .line 88
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->j:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler;

    .line 89
    .line 90
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->c:Ljava/lang/String;

    .line 91
    .line 92
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler;->pushGameInfo(Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method public final m()V
    .locals 1
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->e:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a$c;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a$c;->c()V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->o()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final n()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->i:Lcom/momo/xeengine/game/XEGameView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->i:Lcom/momo/xeengine/game/XEGameView;

    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public o()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->j:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler;->removeLuaGame()V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->n()V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->h:Z

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->k:Landroid/os/Handler;

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->j:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler;

    .line 23
    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler;->unRegister()V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->j:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler;

    .line 30
    .line 31
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler;->setLuaCallback(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler$b;)V

    .line 32
    .line 33
    .line 34
    :cond_2
    return-void
.end method
