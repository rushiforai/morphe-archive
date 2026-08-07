.class public Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a$b;
.super Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler$c;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->l(Lcom/momo/xeengine/IXEngine;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a$b;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler$c;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a$b;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a$b;->f()V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a$b;Ljava/lang/String;Lcom/momo/xeengine/script/ScriptBridge$Callback;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a$b;->h(Ljava/lang/String;Lcom/momo/xeengine/script/ScriptBridge$Callback;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a$b;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a$b;->g()V

    return-void
.end method


# virtual methods
.method public b(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a$b;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->c(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;)Landroid/os/Handler;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    new-instance v0, Ll/alj;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/alj;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a$b;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic f()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a$b;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->b(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a$c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a$b;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->b(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a$c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a$c;->e()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public final synthetic g()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a$b;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->f(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public getUserInfo()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a$b;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->d(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic h(Ljava/lang/String;Lcom/momo/xeengine/script/ScriptBridge$Callback;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a$b;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->b(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a$c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a$b;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->b(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a$c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a$c;->a(Ljava/lang/String;Lcom/momo/xeengine/script/ScriptBridge$Callback;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public removeGame(Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "removeGame gameId = "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-static {p1}, Ll/clj;->c(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a$b;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;

    .line 19
    .line 20
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->c(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;)Landroid/os/Handler;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    const/4 v0, 0x0

    .line 25
    invoke-virtual {p1, v0}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a$b;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;

    .line 29
    .line 30
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->c(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;)Landroid/os/Handler;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    new-instance v0, Ll/blj;

    .line 35
    .line 36
    invoke-direct {v0, p0}, Ll/blj;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a$b;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public uploadScore(Ljava/lang/String;Lcom/momo/xeengine/script/ScriptBridge$Callback;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a$b;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;->c(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a;)Landroid/os/Handler;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/zkj;

    .line 8
    .line 9
    invoke-direct {v1, p0, p1, p2}, Ll/zkj;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a$b;Ljava/lang/String;Lcom/momo/xeengine/script/ScriptBridge$Callback;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method
