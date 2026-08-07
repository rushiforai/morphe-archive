.class public Lcom/tantanapp/beatles/fpsmonitor/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/Choreographer$FrameCallback;
.implements Ll/zy0$a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tantanapp/beatles/fpsmonitor/a$a;
    }
.end annotation


# static fields
.field public static g:Lcom/tantanapp/beatles/fpsmonitor/a;


# instance fields
.field public a:Z

.field public b:Landroid/view/Choreographer;

.field public volatile c:Z

.field public d:J

.field public e:Lcom/tantanapp/beatles/fpsmonitor/a$a;

.field public f:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/tantanapp/beatles/fpsmonitor/a;->c:Z

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Lcom/tantanapp/beatles/fpsmonitor/a;->f:Z

    .line 9
    .line 10
    return-void
.end method

.method public static e()Lcom/tantanapp/beatles/fpsmonitor/a;
    .locals 1

    .line 1
    sget-object v0, Lcom/tantanapp/beatles/fpsmonitor/a;->g:Lcom/tantanapp/beatles/fpsmonitor/a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/tantanapp/beatles/fpsmonitor/a;

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/tantanapp/beatles/fpsmonitor/a;-><init>()V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/tantanapp/beatles/fpsmonitor/a;->g:Lcom/tantanapp/beatles/fpsmonitor/a;

    .line 11
    .line 12
    :cond_0
    sget-object v0, Lcom/tantanapp/beatles/fpsmonitor/a;->g:Lcom/tantanapp/beatles/fpsmonitor/a;

    .line 13
    .line 14
    return-object v0
.end method


# virtual methods
.method public a(Landroid/app/Activity;)V
    .locals 2

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-boolean p1, p0, Lcom/tantanapp/beatles/fpsmonitor/a;->f:Z

    .line 3
    .line 4
    iget-object p1, p0, Lcom/tantanapp/beatles/fpsmonitor/a;->e:Lcom/tantanapp/beatles/fpsmonitor/a$a;

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    invoke-interface {p1}, Lcom/tantanapp/beatles/fpsmonitor/a$a;->a()Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    iget-object p1, p0, Lcom/tantanapp/beatles/fpsmonitor/a;->b:Landroid/view/Choreographer;

    .line 15
    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    invoke-virtual {p1, p0}, Landroid/view/Choreographer;->removeFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Lcom/tantanapp/beatles/fpsmonitor/a;->b:Landroid/view/Choreographer;

    .line 22
    .line 23
    invoke-virtual {p1, p0}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 24
    .line 25
    .line 26
    const-wide/16 v0, 0x0

    .line 27
    .line 28
    iput-wide v0, p0, Lcom/tantanapp/beatles/fpsmonitor/a;->d:J

    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public b(Z)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/tantanapp/beatles/fpsmonitor/a;->k()V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public c(Landroid/app/Activity;)V
    .locals 0

    .line 1
    return-void
.end method

.method public d(Landroid/app/Activity;)V
    .locals 2

    .line 1
    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Lcom/tantanapp/beatles/fpsmonitor/a;->f:Z

    .line 3
    .line 4
    iget-object p1, p0, Lcom/tantanapp/beatles/fpsmonitor/a;->e:Lcom/tantanapp/beatles/fpsmonitor/a$a;

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    invoke-interface {p1}, Lcom/tantanapp/beatles/fpsmonitor/a$a;->pause()V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/tantanapp/beatles/fpsmonitor/a;->b:Landroid/view/Choreographer;

    .line 12
    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p1, p0}, Landroid/view/Choreographer;->removeFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 16
    .line 17
    .line 18
    const-wide/16 v0, 0x0

    .line 19
    .line 20
    iput-wide v0, p0, Lcom/tantanapp/beatles/fpsmonitor/a;->d:J

    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public doFrame(J)V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/tantanapp/beatles/fpsmonitor/a;->c:Z

    .line 2
    .line 3
    if-nez v0, :cond_4

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/tantanapp/beatles/fpsmonitor/a;->f:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_1

    .line 10
    :cond_0
    iget-wide v0, p0, Lcom/tantanapp/beatles/fpsmonitor/a;->d:J

    .line 11
    .line 12
    cmp-long v2, p1, v0

    .line 13
    .line 14
    if-ltz v2, :cond_3

    .line 15
    .line 16
    const-wide/16 v2, 0x0

    .line 17
    .line 18
    cmp-long v0, v0, v2

    .line 19
    .line 20
    if-gtz v0, :cond_1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    iget-object v0, p0, Lcom/tantanapp/beatles/fpsmonitor/a;->e:Lcom/tantanapp/beatles/fpsmonitor/a$a;

    .line 24
    .line 25
    if-eqz v0, :cond_4

    .line 26
    .line 27
    invoke-interface {v0, p1, p2}, Lcom/tantanapp/beatles/fpsmonitor/a$a;->doFrame(J)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/tantanapp/beatles/fpsmonitor/a;->b:Landroid/view/Choreographer;

    .line 31
    .line 32
    if-eqz v0, :cond_2

    .line 33
    .line 34
    invoke-virtual {v0, p0}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 35
    .line 36
    .line 37
    :cond_2
    iput-wide p1, p0, Lcom/tantanapp/beatles/fpsmonitor/a;->d:J

    .line 38
    .line 39
    return-void

    .line 40
    :cond_3
    :goto_0
    iput-wide p1, p0, Lcom/tantanapp/beatles/fpsmonitor/a;->d:J

    .line 41
    .line 42
    iget-object p1, p0, Lcom/tantanapp/beatles/fpsmonitor/a;->b:Landroid/view/Choreographer;

    .line 43
    .line 44
    if-eqz p1, :cond_4

    .line 45
    .line 46
    invoke-virtual {p1, p0}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 47
    .line 48
    .line 49
    :cond_4
    :goto_1
    return-void
.end method

.method public f()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {}, Ll/zy0;->c()Ll/zy0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/zy0;->e()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public g()Z
    .locals 4

    .line 1
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ljava/lang/Thread;->getId()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v2}, Ljava/lang/Thread;->getId()J

    .line 18
    .line 19
    .line 20
    move-result-wide v2

    .line 21
    cmp-long v0, v0, v2

    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    const-string p0, "[FrameBeat][init] FrameBeat must init on main thread"

    .line 27
    .line 28
    new-array v0, v1, [Ljava/lang/Object;

    .line 29
    .line 30
    invoke-static {p0, v0}, Ll/f610;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    return v1

    .line 34
    :cond_0
    iget-boolean v0, p0, Lcom/tantanapp/beatles/fpsmonitor/a;->a:Z

    .line 35
    .line 36
    const/4 v2, 0x1

    .line 37
    if-nez v0, :cond_1

    .line 38
    .line 39
    :try_start_0
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iput-object v0, p0, Lcom/tantanapp/beatles/fpsmonitor/a;->b:Landroid/view/Choreographer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 44
    .line 45
    invoke-static {}, Ll/zy0;->c()Ll/zy0;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {v0, p0}, Ll/zy0;->h(Ll/zy0$a;)V

    .line 50
    .line 51
    .line 52
    iput-boolean v2, p0, Lcom/tantanapp/beatles/fpsmonitor/a;->a:Z

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :catchall_0
    return v1

    .line 56
    :cond_1
    const-string p0, "[FrameBeat][init] FrameBeat is created!"

    .line 57
    .line 58
    new-array v0, v1, [Ljava/lang/Object;

    .line 59
    .line 60
    invoke-static {p0, v0}, Ll/f610;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 61
    .line 62
    .line 63
    :goto_0
    return v2
.end method

.method public h()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tantanapp/beatles/fpsmonitor/a;->c:Z

    .line 2
    .line 3
    return p0
.end method

.method public i(Lcom/tantanapp/beatles/fpsmonitor/a$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/fpsmonitor/a;->e:Lcom/tantanapp/beatles/fpsmonitor/a$a;

    .line 2
    .line 3
    return-void
.end method

.method public j()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/tantanapp/beatles/fpsmonitor/a;->a:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/4 v0, 0x0

    .line 7
    iput-boolean v0, p0, Lcom/tantanapp/beatles/fpsmonitor/a;->c:Z

    .line 8
    .line 9
    iget-object v0, p0, Lcom/tantanapp/beatles/fpsmonitor/a;->b:Landroid/view/Choreographer;

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Landroid/view/Choreographer;->removeFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/tantanapp/beatles/fpsmonitor/a;->b:Landroid/view/Choreographer;

    .line 17
    .line 18
    invoke-virtual {v0, p0}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 19
    .line 20
    .line 21
    const-wide/16 v0, 0x0

    .line 22
    .line 23
    iput-wide v0, p0, Lcom/tantanapp/beatles/fpsmonitor/a;->d:J

    .line 24
    .line 25
    :cond_1
    :goto_0
    return-void
.end method

.method public k()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/tantanapp/beatles/fpsmonitor/a;->a:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Lcom/tantanapp/beatles/fpsmonitor/a;->c:Z

    .line 8
    .line 9
    iget-object v0, p0, Lcom/tantanapp/beatles/fpsmonitor/a;->b:Landroid/view/Choreographer;

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Landroid/view/Choreographer;->removeFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 14
    .line 15
    .line 16
    const-wide/16 v0, 0x0

    .line 17
    .line 18
    iput-wide v0, p0, Lcom/tantanapp/beatles/fpsmonitor/a;->d:J

    .line 19
    .line 20
    :cond_1
    :goto_0
    return-void
.end method

.method public onActivityDestroyed(Landroid/app/Activity;)V
    .locals 0

    return-void
.end method

.method public onActivityStarted(Landroid/app/Activity;)V
    .locals 0

    return-void
.end method

.method public onActivityStopped(Landroid/app/Activity;)V
    .locals 0

    return-void
.end method
