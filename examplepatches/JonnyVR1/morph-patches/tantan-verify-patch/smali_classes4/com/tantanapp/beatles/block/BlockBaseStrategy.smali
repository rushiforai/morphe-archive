.class public abstract Lcom/tantanapp/beatles/block/BlockBaseStrategy;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/zy0$a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tantanapp/beatles/block/BlockBaseStrategy$BlockLevel;,
        Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;,
        Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;
    }
.end annotation


# static fields
.field public static v:I = 0x12c

.field public static w:I = 0x3e8


# instance fields
.field public a:Landroid/os/HandlerThread;

.field public b:Landroid/os/Handler;

.field public c:Lcom/tantanapp/beatles/block/c;

.field public d:Ll/e43;

.field public volatile e:Z

.field public f:Ll/yni0;

.field public g:Z

.field public h:J

.field public i:J

.field public j:J

.field public k:J

.field public l:J

.field public m:Z

.field public n:Z

.field public o:Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;

.field public p:Lcom/tantanapp/beatles/block/MessageHelper;

.field public q:Lcom/tantanapp/beatles/block/LimitedQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/beatles/block/LimitedQueue<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public r:Lcom/tantanapp/beatles/block/LimitedQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/beatles/block/LimitedQueue<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public s:I

.field public t:I

.field public u:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Lcom/tantanapp/beatles/block/c;Ll/e43;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->m:Z

    .line 6
    .line 7
    new-instance v0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;-><init>(Lcom/tantanapp/beatles/block/BlockBaseStrategy;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->o:Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;

    .line 13
    .line 14
    new-instance v0, Lcom/tantanapp/beatles/block/LimitedQueue;

    .line 15
    .line 16
    const/16 v1, 0xa

    .line 17
    .line 18
    invoke-direct {v0, v1}, Lcom/tantanapp/beatles/block/LimitedQueue;-><init>(I)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->q:Lcom/tantanapp/beatles/block/LimitedQueue;

    .line 22
    .line 23
    new-instance v0, Lcom/tantanapp/beatles/block/LimitedQueue;

    .line 24
    .line 25
    invoke-direct {v0, v1}, Lcom/tantanapp/beatles/block/LimitedQueue;-><init>(I)V

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->r:Lcom/tantanapp/beatles/block/LimitedQueue;

    .line 29
    .line 30
    sget v0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->v:I

    .line 31
    .line 32
    iput v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->s:I

    .line 33
    .line 34
    sget v0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->w:I

    .line 35
    .line 36
    iput v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->t:I

    .line 37
    .line 38
    iput-object p1, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->c:Lcom/tantanapp/beatles/block/c;

    .line 39
    .line 40
    iput-object p2, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->d:Ll/e43;

    .line 41
    .line 42
    new-instance p1, Lcom/tantanapp/beatles/block/MessageHelper;

    .line 43
    .line 44
    invoke-virtual {p2}, Ll/e43;->m()I

    .line 45
    .line 46
    .line 47
    move-result p2

    .line 48
    invoke-direct {p1, p2}, Lcom/tantanapp/beatles/block/MessageHelper;-><init>(I)V

    .line 49
    .line 50
    .line 51
    iput-object p1, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->p:Lcom/tantanapp/beatles/block/MessageHelper;

    .line 52
    .line 53
    invoke-static {}, Ll/xni0;->a()Ll/yni0;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    iput-object p1, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->f:Ll/yni0;

    .line 58
    .line 59
    return-void
.end method


# virtual methods
.method public a(Landroid/app/Activity;)V
    .locals 0

    .line 1
    return-void
.end method

.method public b(Z)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    iput-boolean p1, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->g:Z

    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    iput-wide v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->h:J

    .line 12
    .line 13
    return-void
.end method

.method public c(Landroid/app/Activity;)V
    .locals 0

    .line 1
    return-void
.end method

.method public d(Landroid/app/Activity;)V
    .locals 0

    .line 1
    return-void
.end method

.method public e()Z
    .locals 6

    .line 1
    invoke-static {}, Ll/zy0;->c()Ll/zy0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/zy0;->e()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "default"

    .line 10
    .line 11
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v1, 0x0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    return v1

    .line 19
    :cond_0
    invoke-static {}, Ll/zy0;->c()Ll/zy0;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Ll/zy0;->g()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_2

    .line 28
    .line 29
    iget-boolean v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->g:Z

    .line 30
    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 34
    .line 35
    .line 36
    move-result-wide v2

    .line 37
    iget-wide v4, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->h:J

    .line 38
    .line 39
    sub-long/2addr v2, v4

    .line 40
    iget-object v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->d:Ll/e43;

    .line 41
    .line 42
    invoke-virtual {v0}, Ll/e43;->k()J

    .line 43
    .line 44
    .line 45
    move-result-wide v4

    .line 46
    cmp-long v0, v2, v4

    .line 47
    .line 48
    if-ltz v0, :cond_3

    .line 49
    .line 50
    :cond_1
    iput-boolean v1, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->g:Z

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_2
    const/4 v0, 0x1

    .line 54
    iput-boolean v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->g:Z

    .line 55
    .line 56
    :cond_3
    :goto_0
    iget-boolean p0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->g:Z

    .line 57
    .line 58
    return p0
.end method

.method public f(J)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->b:Landroid/os/Handler;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, v0, p1, p2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public g(J)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->b:Landroid/os/Handler;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0, p1, p2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final h()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->n:Z

    .line 3
    .line 4
    iput-boolean v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->m:Z

    .line 5
    .line 6
    return-void
.end method

.method public final i()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->n:Z

    .line 3
    .line 4
    iput-boolean v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->m:Z

    .line 5
    .line 6
    return-void
.end method

.method public j()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->e:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-wide/16 v0, 0x0

    .line 6
    .line 7
    iput-wide v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->k:J

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-virtual {p0}, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->k()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public k()V
    .locals 10

    .line 1
    iget-boolean v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->n:Z

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    iget-object v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->o:Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->f()V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 11
    .line 12
    .line 13
    move-result-wide v0

    .line 14
    iput-wide v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->k:J

    .line 15
    .line 16
    iget-wide v2, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->i:J

    .line 17
    .line 18
    sub-long/2addr v0, v2

    .line 19
    iput-wide v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->l:J

    .line 20
    .line 21
    iget v2, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->s:I

    .line 22
    .line 23
    sget v3, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->v:I

    .line 24
    .line 25
    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    int-to-long v2, v2

    .line 30
    cmp-long v0, v0, v2

    .line 31
    .line 32
    const-string v1, ""

    .line 33
    .line 34
    if-lez v0, :cond_0

    .line 35
    .line 36
    iget-wide v2, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->l:J

    .line 37
    .line 38
    iget v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->t:I

    .line 39
    .line 40
    sget v4, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->w:I

    .line 41
    .line 42
    invoke-static {v0, v4}, Ljava/lang/Math;->max(II)I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    int-to-long v4, v0

    .line 47
    cmp-long v0, v2, v4

    .line 48
    .line 49
    if-gez v0, :cond_0

    .line 50
    .line 51
    iget-object v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->q:Lcom/tantanapp/beatles/block/LimitedQueue;

    .line 52
    .line 53
    new-instance v2, Ljava/lang/StringBuilder;

    .line 54
    .line 55
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 56
    .line 57
    .line 58
    iget-wide v3, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->i:J

    .line 59
    .line 60
    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    invoke-virtual {v0, v1}, Lcom/tantanapp/beatles/block/LimitedQueue;->add(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_0
    iget-wide v2, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->l:J

    .line 75
    .line 76
    iget v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->t:I

    .line 77
    .line 78
    int-to-long v4, v0

    .line 79
    cmp-long v0, v2, v4

    .line 80
    .line 81
    if-ltz v0, :cond_1

    .line 82
    .line 83
    iget-object v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->r:Lcom/tantanapp/beatles/block/LimitedQueue;

    .line 84
    .line 85
    new-instance v2, Ljava/lang/StringBuilder;

    .line 86
    .line 87
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 88
    .line 89
    .line 90
    iget-wide v3, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->i:J

    .line 91
    .line 92
    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    invoke-virtual {v0, v1}, Lcom/tantanapp/beatles/block/LimitedQueue;->add(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    :cond_1
    :goto_0
    iget-boolean v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->m:Z

    .line 106
    .line 107
    if-eqz v0, :cond_3

    .line 108
    .line 109
    iget-wide v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->l:J

    .line 110
    .line 111
    iget-object v2, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->p:Lcom/tantanapp/beatles/block/MessageHelper;

    .line 112
    .line 113
    invoke-virtual {v2}, Lcom/tantanapp/beatles/block/MessageHelper;->h()I

    .line 114
    .line 115
    .line 116
    move-result v2

    .line 117
    int-to-long v2, v2

    .line 118
    cmp-long v0, v0, v2

    .line 119
    .line 120
    iget-object v1, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->p:Lcom/tantanapp/beatles/block/MessageHelper;

    .line 121
    .line 122
    if-ltz v0, :cond_2

    .line 123
    .line 124
    iget-wide v2, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->i:J

    .line 125
    .line 126
    iget-wide v4, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->l:J

    .line 127
    .line 128
    invoke-static {}, Landroid/os/SystemClock;->currentThreadTimeMillis()J

    .line 129
    .line 130
    .line 131
    move-result-wide v6

    .line 132
    iget-wide v8, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->j:J

    .line 133
    .line 134
    sub-long/2addr v6, v8

    .line 135
    invoke-static {}, Ll/wgl;->e()Landroid/os/Message;

    .line 136
    .line 137
    .line 138
    move-result-object v8

    .line 139
    invoke-virtual/range {v1 .. v8}, Lcom/tantanapp/beatles/block/MessageHelper;->b(JJJLandroid/os/Message;)V

    .line 140
    .line 141
    .line 142
    return-void

    .line 143
    :cond_2
    iget-wide v2, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->i:J

    .line 144
    .line 145
    iget-wide v4, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->l:J

    .line 146
    .line 147
    const-wide/16 v6, -0x1

    .line 148
    .line 149
    const/4 v8, 0x0

    .line 150
    invoke-virtual/range {v1 .. v8}, Lcom/tantanapp/beatles/block/MessageHelper;->b(JJJLandroid/os/Message;)V

    .line 151
    .line 152
    .line 153
    :cond_3
    return-void
.end method

.method public abstract l()Lcom/tantanapp/beatles/block/BlockBaseStrategy$b;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end method

.method public m(Landroid/os/Looper;)Landroid/os/Handler;
    .locals 1

    .line 1
    new-instance v0, Lcom/tantanapp/beatles/block/BlockBaseStrategy$a;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tantanapp/beatles/block/BlockBaseStrategy$a;-><init>(Lcom/tantanapp/beatles/block/BlockBaseStrategy;Landroid/os/Looper;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public n()Lcom/tantanapp/beatles/block/MessageHelper$MessageUnit;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->c:Lcom/tantanapp/beatles/block/c;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/tantanapp/beatles/block/c;->m()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->p:Lcom/tantanapp/beatles/block/MessageHelper;

    .line 10
    .line 11
    iget-wide v1, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->i:J

    .line 12
    .line 13
    invoke-virtual {v0, v1, v2}, Lcom/tantanapp/beatles/block/MessageHelper;->g(J)Lcom/tantanapp/beatles/block/MessageHelper$MessageUnit;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return-object p0
.end method

.method public abstract o(Landroid/os/Message;)V
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

.method public p(Lcom/tantanapp/beatles/v2/data/MonitorEvent;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->c:Lcom/tantanapp/beatles/block/c;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/c610;->j(Lcom/tantanapp/beatles/v2/data/MonitorEvent;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public q()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->a:Landroid/os/HandlerThread;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroid/os/HandlerThread;

    .line 6
    .line 7
    const-string v1, "block-check-thread"

    .line 8
    .line 9
    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->a:Landroid/os/HandlerThread;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->a:Landroid/os/HandlerThread;

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {p0, v0}, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->m(Landroid/os/Looper;)Landroid/os/Handler;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iput-object v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->b:Landroid/os/Handler;

    .line 28
    .line 29
    :cond_0
    invoke-static {}, Ll/zy0;->c()Ll/zy0;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0, p0}, Ll/zy0;->h(Ll/zy0$a;)V

    .line 34
    .line 35
    .line 36
    const/4 v0, 0x1

    .line 37
    iput-boolean v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->e:Z

    .line 38
    .line 39
    return-void
.end method

.method public r(IJ)V
    .locals 1

    .line 1
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput p1, v0, Landroid/os/Message;->what:I

    .line 6
    .line 7
    iget-object p0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->b:Landroid/os/Handler;

    .line 8
    .line 9
    invoke-virtual {p0, v0, p2, p3}, Landroid/os/Handler;->sendMessageAtTime(Landroid/os/Message;J)Z

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public s()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->u:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->i()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->k()V

    .line 10
    .line 11
    .line 12
    iput-boolean v1, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->u:Z

    .line 13
    .line 14
    :cond_0
    iget-boolean v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->e:Z

    .line 15
    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->h()V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_1
    invoke-virtual {p0}, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->e()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_2

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->h()V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_2
    iget-object v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->c:Lcom/tantanapp/beatles/block/c;

    .line 33
    .line 34
    invoke-virtual {v0}, Lcom/tantanapp/beatles/block/c;->m()Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_3

    .line 39
    .line 40
    const/4 v0, 0x1

    .line 41
    iput-boolean v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->m:Z

    .line 42
    .line 43
    :cond_3
    invoke-virtual {p0, v1}, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->u(Z)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->e:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->h()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->c:Lcom/tantanapp/beatles/block/c;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/tantanapp/beatles/block/c;->m()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v1, 0x1

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    iput-boolean v1, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->m:Z

    .line 19
    .line 20
    :cond_1
    iput-boolean v1, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->u:Z

    .line 21
    .line 22
    invoke-virtual {p0, v1}, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->u(Z)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public u(Z)V
    .locals 12

    .line 1
    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->n:Z

    .line 3
    .line 4
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 5
    .line 6
    .line 7
    move-result-wide v0

    .line 8
    iput-wide v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->i:J

    .line 9
    .line 10
    iget-object p1, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->o:Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;

    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/tantanapp/beatles/block/BlockBaseStrategy$c;->e()V

    .line 13
    .line 14
    .line 15
    iget-boolean p1, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->m:Z

    .line 16
    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    invoke-static {}, Landroid/os/SystemClock;->currentThreadTimeMillis()J

    .line 20
    .line 21
    .line 22
    move-result-wide v0

    .line 23
    iput-wide v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->j:J

    .line 24
    .line 25
    iget-wide v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->k:J

    .line 26
    .line 27
    const-wide/16 v2, 0x0

    .line 28
    .line 29
    cmp-long p1, v0, v2

    .line 30
    .line 31
    if-eqz p1, :cond_0

    .line 32
    .line 33
    iget-wide v2, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->i:J

    .line 34
    .line 35
    sub-long v7, v2, v0

    .line 36
    .line 37
    iget-object p1, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->p:Lcom/tantanapp/beatles/block/MessageHelper;

    .line 38
    .line 39
    invoke-virtual {p1}, Lcom/tantanapp/beatles/block/MessageHelper;->h()I

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    int-to-long v0, p1

    .line 44
    cmp-long p1, v7, v0

    .line 45
    .line 46
    if-ltz p1, :cond_0

    .line 47
    .line 48
    iget-object v4, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->p:Lcom/tantanapp/beatles/block/MessageHelper;

    .line 49
    .line 50
    iget-wide v5, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->i:J

    .line 51
    .line 52
    const-wide/16 v9, -0x1

    .line 53
    .line 54
    const/4 v11, 0x0

    .line 55
    invoke-virtual/range {v4 .. v11}, Lcom/tantanapp/beatles/block/MessageHelper;->b(JJJLandroid/os/Message;)V

    .line 56
    .line 57
    .line 58
    :cond_0
    return-void
.end method

.method public v()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->b:Landroid/os/Handler;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->a:Landroid/os/HandlerThread;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Landroid/os/Looper;->quit()V

    .line 14
    .line 15
    .line 16
    iput-object v1, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->a:Landroid/os/HandlerThread;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput-boolean v0, p0, Lcom/tantanapp/beatles/block/BlockBaseStrategy;->e:Z

    .line 20
    .line 21
    invoke-static {}, Ll/zy0;->c()Ll/zy0;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0, p0}, Ll/zy0;->i(Ll/zy0$a;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method
