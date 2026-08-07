.class public Lcom/tencent/could/huiyansdk/turing/f;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/could/huiyansdk/turing/f$a;
    }
.end annotation


# instance fields
.field public a:J

.field public volatile b:Z

.field public volatile c:Z

.field public d:Z

.field public e:Z

.field public f:Lcom/tencent/could/huiyansdk/entity/TuringResultCacheEntity;

.field public volatile g:Lcom/tencent/could/huiyansdk/turing/b;

.field public h:Lcom/tencent/could/huiyansdk/manager/f;

.field public i:Lcom/tencent/could/huiyansdk/callback/d;

.field public j:Z

.field public volatile k:Z

.field public l:Landroid/os/HandlerThread;

.field public volatile m:Landroid/os/Handler;

.field public n:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0xbb8

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/tencent/could/huiyansdk/turing/f;->a:J

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Lcom/tencent/could/huiyansdk/turing/f;->b:Z

    .line 10
    .line 11
    iput-boolean v0, p0, Lcom/tencent/could/huiyansdk/turing/f;->c:Z

    .line 12
    .line 13
    iput-boolean v0, p0, Lcom/tencent/could/huiyansdk/turing/f;->d:Z

    .line 14
    .line 15
    iput-boolean v0, p0, Lcom/tencent/could/huiyansdk/turing/f;->e:Z

    .line 16
    .line 17
    iput-boolean v0, p0, Lcom/tencent/could/huiyansdk/turing/f;->j:Z

    .line 18
    .line 19
    iput-boolean v0, p0, Lcom/tencent/could/huiyansdk/turing/f;->k:Z

    .line 20
    .line 21
    return-void
.end method

.method public static a(Lcom/tencent/could/huiyansdk/turing/f;)V
    .locals 2

    .line 70
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 71
    sget-object p0, Lcom/tencent/could/huiyansdk/common/a$a;->a:Lcom/tencent/could/huiyansdk/common/a;

    .line 72
    iget-boolean p0, p0, Lcom/tencent/could/huiyansdk/common/a;->d:Z

    if-nez p0, :cond_0

    .line 73
    sget-object p0, Lcom/tencent/could/huiyansdk/manager/b$b;->a:Lcom/tencent/could/huiyansdk/manager/b;

    .line 74
    sget-object v0, Lcom/tencent/could/huiyansdk/enums/AuthState;->START_GET_LIVE_TYPE:Lcom/tencent/could/huiyansdk/enums/AuthState;

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/tencent/could/huiyansdk/manager/b;->a(Lcom/tencent/could/huiyansdk/enums/AuthState;Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method public static a(Lcom/tencent/could/huiyansdk/turing/f;Z)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/turing/f;->d()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 5
    .line 6
    .line 7
    move-result-wide v0

    .line 8
    iget-wide v2, p0, Lcom/tencent/could/huiyansdk/turing/f;->n:J

    .line 9
    .line 10
    sub-long/2addr v0, v2

    .line 11
    const-string p0, ""

    .line 12
    .line 13
    const-string v2, "AuthCheckStage"

    .line 14
    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    sget-object p1, Lcom/tencent/could/huiyansdk/api/j$a;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 18
    .line 19
    new-instance v3, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    invoke-direct {v3, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    iget-object p1, p1, Lcom/tencent/could/huiyansdk/api/j;->g:Lcom/tencent/could/huiyansdk/api/b;

    .line 32
    .line 33
    if-eqz p1, :cond_1

    .line 34
    .line 35
    const-string v0, "GetTuringTokenTimeOut"

    .line 36
    .line 37
    invoke-interface {p1, v2, v0, p0}, Lcom/tencent/could/huiyansdk/api/b;->onBuriedPointCallBack(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_0
    sget-object p1, Lcom/tencent/could/huiyansdk/api/j$a;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 42
    .line 43
    new-instance v3, Ljava/lang/StringBuilder;

    .line 44
    .line 45
    invoke-direct {v3, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    iget-object p1, p1, Lcom/tencent/could/huiyansdk/api/j;->g:Lcom/tencent/could/huiyansdk/api/b;

    .line 56
    .line 57
    if-eqz p1, :cond_1

    .line 58
    .line 59
    const-string v0, "GetTuringTokenSuccess"

    .line 60
    .line 61
    invoke-interface {p1, v2, v0, p0}, Lcom/tencent/could/huiyansdk/api/b;->onBuriedPointCallBack(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    :cond_1
    return-void
.end method

.method public static synthetic b(Lcom/tencent/could/huiyansdk/turing/f;Z)Z
    .locals 0

    .line 48
    iput-boolean p1, p0, Lcom/tencent/could/huiyansdk/turing/f;->k:Z

    return p1
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 4

    .line 65
    iget-boolean v0, p0, Lcom/tencent/could/huiyansdk/turing/f;->j:Z

    const-string v1, ""

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/tencent/could/huiyansdk/turing/f;->g:Lcom/tencent/could/huiyansdk/turing/b;

    if-nez v0, :cond_0

    goto :goto_0

    .line 66
    :cond_0
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/turing/f;->g:Lcom/tencent/could/huiyansdk/turing/b;

    check-cast p0, Lcom/tencent/could/huiyansdk/turing/EmptyTuringHelper;

    .line 67
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object v1

    .line 68
    :cond_1
    :goto_0
    sget-object p0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    const-string v0, "get version, turing is not create!"

    const/4 v2, 0x2

    .line 69
    const-string v3, "TuringSdkHelper"

    invoke-virtual {p0, v2, v3, v0}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    return-object v1
.end method

.method public b()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/turing/f;->m:Landroid/os/Handler;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/turing/f;->m:Landroid/os/Handler;

    .line 7
    .line 8
    const/4 v1, 0x3

    .line 9
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/turing/f;->m:Landroid/os/Handler;

    .line 13
    .line 14
    const/4 v2, 0x5

    .line 15
    invoke-virtual {v0, v2}, Landroid/os/Handler;->removeMessages(I)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/turing/f;->m:Landroid/os/Handler;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/turing/f;->m:Landroid/os/Handler;

    .line 24
    .line 25
    const/4 v1, 0x4

    .line 26
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 27
    .line 28
    .line 29
    const/4 v0, 0x0

    .line 30
    iput-object v0, p0, Lcom/tencent/could/huiyansdk/turing/f;->m:Landroid/os/Handler;

    .line 31
    .line 32
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/turing/f;->l:Landroid/os/HandlerThread;

    .line 33
    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    invoke-virtual {v0}, Ljava/lang/Thread;->isAlive()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/turing/f;->l:Landroid/os/HandlerThread;

    .line 43
    .line 44
    invoke-virtual {p0}, Landroid/os/HandlerThread;->quitSafely()Z

    .line 45
    .line 46
    .line 47
    :cond_1
    :goto_0
    return-void
.end method

.method public final c()V
    .locals 4

    .line 1
    const-class v0, Lcom/tencent/could/huiyansdk/turing/EmptyTuringHelper;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/tencent/could/huiyansdk/turing/b;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/tencent/could/huiyansdk/turing/f;->g:Lcom/tencent/could/huiyansdk/turing/b;

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    iput-boolean v0, p0, Lcom/tencent/could/huiyansdk/turing/f;->j:Z

    .line 13
    .line 14
    sget-object v1, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 15
    .line 16
    new-instance v2, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    const-string v3, "real init turing: "

    .line 19
    .line 20
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iget-boolean v3, p0, Lcom/tencent/could/huiyansdk/turing/f;->j:Z

    .line 24
    .line 25
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    const-string v3, ", "

    .line 29
    .line 30
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    iget-object v3, p0, Lcom/tencent/could/huiyansdk/turing/f;->g:Lcom/tencent/could/huiyansdk/turing/b;

    .line 34
    .line 35
    if-nez v3, :cond_0

    .line 36
    .line 37
    move v3, v0

    .line 38
    goto :goto_0

    .line 39
    :cond_0
    const/4 v3, 0x0

    .line 40
    :goto_0
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v3, ", [turing version]: "

    .line 44
    .line 45
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/turing/f;->a()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    const-string v2, "TuringSdkHelper"

    .line 60
    .line 61
    invoke-virtual {v1, v0, v2, p0}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public final d()V
    .locals 4

    .line 1
    sget-object v0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 2
    .line 3
    const-string v1, "get turing face result and remove time out event!"

    .line 4
    .line 5
    const/4 v2, 0x2

    .line 6
    const-string v3, "TuringSdkHelper"

    .line 7
    .line 8
    invoke-virtual {v0, v2, v3, v1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/turing/f;->m:Landroid/os/Handler;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/turing/f;->m:Landroid/os/Handler;

    .line 16
    .line 17
    const/4 v0, 0x5

    .line 18
    invoke-virtual {p0, v0}, Landroid/os/Handler;->removeMessages(I)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method
