.class public Ll/dvx;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Handler$Callback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/dvx$a;,
        Ll/dvx$b;
    }
.end annotation


# instance fields
.field private a:Landroid/os/HandlerThread;

.field private b:Landroid/os/Handler;

.field private c:Ll/dvx$b;

.field private volatile d:Ll/vvx;

.field private volatile e:Ll/fpf0;

.field private volatile f:Ll/a320;

.field private g:I

.field private h:I

.field private volatile i:Z

.field private volatile j:Z

.field private final k:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final l:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final m:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private volatile n:Z

.field private o:Ljava/lang/String;

.field private p:Ljava/lang/String;

.field private q:I

.field private r:J

.field private s:J

.field private final t:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private u:I

.field private volatile v:Z


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const v0, 0xea60

    .line 5
    .line 6
    .line 7
    iput v0, p0, Ll/dvx;->g:I

    .line 8
    .line 9
    const/4 v0, 0x6

    .line 10
    iput v0, p0, Ll/dvx;->h:I

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput-boolean v0, p0, Ll/dvx;->i:Z

    .line 14
    .line 15
    iput-boolean v0, p0, Ll/dvx;->j:Z

    .line 16
    .line 17
    new-instance v1, Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object v1, p0, Ll/dvx;->k:Ljava/util/ArrayList;

    .line 23
    .line 24
    new-instance v1, Ljava/util/ArrayList;

    .line 25
    .line 26
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 27
    .line 28
    .line 29
    iput-object v1, p0, Ll/dvx;->l:Ljava/util/ArrayList;

    .line 30
    .line 31
    new-instance v1, Ljava/util/ArrayList;

    .line 32
    .line 33
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 34
    .line 35
    .line 36
    iput-object v1, p0, Ll/dvx;->m:Ljava/util/ArrayList;

    .line 37
    .line 38
    iput-boolean v0, p0, Ll/dvx;->n:Z

    .line 39
    .line 40
    const-string v1, ""

    .line 41
    .line 42
    iput-object v1, p0, Ll/dvx;->o:Ljava/lang/String;

    .line 43
    .line 44
    iput-object v1, p0, Ll/dvx;->p:Ljava/lang/String;

    .line 45
    .line 46
    iput v0, p0, Ll/dvx;->q:I

    .line 47
    .line 48
    const-wide/16 v2, 0x4e20

    .line 49
    .line 50
    iput-wide v2, p0, Ll/dvx;->r:J

    .line 51
    .line 52
    const-wide/16 v2, 0x2710

    .line 53
    .line 54
    iput-wide v2, p0, Ll/dvx;->s:J

    .line 55
    .line 56
    new-instance v2, Ljava/util/ArrayList;

    .line 57
    .line 58
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 59
    .line 60
    .line 61
    iput-object v2, p0, Ll/dvx;->t:Ljava/util/ArrayList;

    .line 62
    .line 63
    const/4 v2, 0x1

    .line 64
    iput v2, p0, Ll/dvx;->u:I

    .line 65
    .line 66
    iput-boolean v0, p0, Ll/dvx;->v:Z

    .line 67
    .line 68
    const-string v0, "MediaLogPullV2"

    .line 69
    .line 70
    invoke-static {v0, v1}, Ll/esx;->d(Ljava/lang/String;Ljava/lang/Object;)I

    .line 71
    .line 72
    .line 73
    iget-object v1, p0, Ll/dvx;->a:Landroid/os/HandlerThread;

    .line 74
    .line 75
    if-nez v1, :cond_0

    .line 76
    .line 77
    new-instance v1, Landroid/os/HandlerThread;

    .line 78
    .line 79
    invoke-direct {v1, v0}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    iput-object v1, p0, Ll/dvx;->a:Landroid/os/HandlerThread;

    .line 83
    .line 84
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 85
    .line 86
    .line 87
    new-instance v0, Landroid/os/Handler;

    .line 88
    .line 89
    iget-object v1, p0, Ll/dvx;->a:Landroid/os/HandlerThread;

    .line 90
    .line 91
    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    invoke-direct {v0, v1, p0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;)V

    .line 96
    .line 97
    .line 98
    iput-object v0, p0, Ll/dvx;->b:Landroid/os/Handler;

    .line 99
    .line 100
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    invoke-virtual {v0}, Ll/csx;->Z()I

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    iput v0, p0, Ll/dvx;->g:I

    .line 109
    .line 110
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    invoke-virtual {v0}, Ll/csx;->a0()I

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    iput v0, p0, Ll/dvx;->h:I

    .line 119
    .line 120
    :cond_0
    return-void
.end method

.method private F(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/dvx$a;

    .line 6
    .line 7
    const-string v1, "nonConf"

    .line 8
    .line 9
    invoke-direct {v0, p0, v1, p1, p2}, Ll/dvx$a;-><init>(Ll/dvx;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Ll/dvx;->b:Landroid/os/Handler;

    .line 13
    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Ll/dvx;->a:Landroid/os/HandlerThread;

    .line 17
    .line 18
    if-eqz p0, :cond_0

    .line 19
    .line 20
    const/16 p0, 0xcc

    .line 21
    .line 22
    invoke-virtual {p1, p0, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Landroid/os/Message;->sendToTarget()V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method private d(Z)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/dvx;->k:Ljava/util/ArrayList;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Ll/dvx;->k:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    iget v2, p0, Ll/dvx;->h:I

    .line 11
    .line 12
    if-ge v1, v2, :cond_1

    .line 13
    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 p1, 0x0

    .line 18
    goto :goto_2

    .line 19
    :cond_1
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 22
    .line 23
    .line 24
    const/4 v1, 0x0

    .line 25
    :goto_1
    iget-object v2, p0, Ll/dvx;->k:Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 28
    .line 29
    .line 30
    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    iget-object v3, p0, Ll/dvx;->k:Ljava/util/ArrayList;

    .line 32
    .line 33
    if-ge v1, v2, :cond_2

    .line 34
    .line 35
    :try_start_1
    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    check-cast v2, Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    add-int/lit8 v1, v1, 0x1

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :catchall_0
    move-exception p0

    .line 48
    goto :goto_3

    .line 49
    :cond_2
    invoke-virtual {v3}, Ljava/util/ArrayList;->clear()V

    .line 50
    .line 51
    .line 52
    :goto_2
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 53
    if-eqz p1, :cond_3

    .line 54
    .line 55
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-lez v0, :cond_3

    .line 60
    .line 61
    const-string v0, "v2.pullWatch"

    .line 62
    .line 63
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-direct {p0, v0, p1}, Ll/dvx;->F(Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    :cond_3
    return-void

    .line 71
    :goto_3
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 72
    throw p0
.end method

.method private e(ZLjava/util/ArrayList;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    monitor-enter p2

    .line 2
    :try_start_0
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    iget v1, p0, Ll/dvx;->h:I

    .line 7
    .line 8
    if-ge v0, v1, :cond_1

    .line 9
    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 p1, 0x0

    .line 14
    goto :goto_2

    .line 15
    :cond_1
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 18
    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    :goto_1
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-ge v0, v1, :cond_2

    .line 26
    .line 27
    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    check-cast v1, Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    add-int/lit8 v0, v0, 0x1

    .line 37
    .line 38
    goto :goto_1

    .line 39
    :catchall_0
    move-exception p0

    .line 40
    goto :goto_3

    .line 41
    :cond_2
    invoke-virtual {p2}, Ljava/util/ArrayList;->clear()V

    .line 42
    .line 43
    .line 44
    :goto_2
    monitor-exit p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 45
    if-eqz p1, :cond_3

    .line 46
    .line 47
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    .line 48
    .line 49
    .line 50
    move-result p2

    .line 51
    if-lez p2, :cond_3

    .line 52
    .line 53
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-direct {p0, p3, p1}, Ll/dvx;->F(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    :cond_3
    return-void

    .line 61
    :goto_3
    :try_start_1
    monitor-exit p2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 62
    throw p0
.end method

.method private r()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/dvx;->d:Ll/vvx;

    .line 2
    .line 3
    new-instance v1, Ll/uvx;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/uvx;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/fvx;->f(Ll/vvx;Ll/uvx;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v1, p0, Ll/dvx;->k:Ljava/util/ArrayList;

    .line 13
    .line 14
    monitor-enter v1

    .line 15
    :try_start_0
    iget-object v2, p0, Ll/dvx;->k:Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21
    const/4 v0, 0x0

    .line 22
    invoke-direct {p0, v0}, Ll/dvx;->d(Z)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :catchall_0
    move-exception p0

    .line 27
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 28
    throw p0
.end method

.method private t(IIILjava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dvx;->c:Ll/dvx$b;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2, p3, p4}, Ll/dvx$b;->messageFromMediaLogV2(IIILjava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method


# virtual methods
.method public A(I)V
    .locals 0

    .line 1
    if-lez p1, :cond_0

    .line 2
    .line 3
    iput p1, p0, Ll/dvx;->h:I

    .line 4
    .line 5
    :cond_0
    return-void
.end method

.method public B(Ll/dvx$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/dvx;->c:Ll/dvx$b;

    .line 2
    .line 3
    return-void
.end method

.method public C(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/dvx;->s:J

    .line 2
    .line 3
    return-void
.end method

.method public D(I)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput p1, p0, Ll/dvx;->q:I

    .line 4
    .line 5
    :cond_0
    return-void
.end method

.method public final E(IILl/fpf0;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "Interval "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, " / "

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "MediaLogPullV2"

    .line 24
    .line 25
    invoke-static {v1, v0}, Ll/esx;->d(Ljava/lang/String;Ljava/lang/Object;)I

    .line 26
    .line 27
    .line 28
    const/4 v0, 0x1

    .line 29
    iput-boolean v0, p0, Ll/dvx;->n:Z

    .line 30
    .line 31
    iput p1, p0, Ll/dvx;->g:I

    .line 32
    .line 33
    iput p2, p0, Ll/dvx;->h:I

    .line 34
    .line 35
    iget-object p1, p0, Ll/dvx;->b:Landroid/os/Handler;

    .line 36
    .line 37
    if-eqz p1, :cond_0

    .line 38
    .line 39
    iget-object p0, p0, Ll/dvx;->a:Landroid/os/HandlerThread;

    .line 40
    .line 41
    if-eqz p0, :cond_0

    .line 42
    .line 43
    const/16 p0, 0xcd

    .line 44
    .line 45
    invoke-virtual {p1, p0, p3}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {p0}, Landroid/os/Message;->sendToTarget()V

    .line 50
    .line 51
    .line 52
    :cond_0
    return-void
.end method

.method public G(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/dvx;->F(Ljava/lang/String;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public a()V
    .locals 4

    .line 1
    const-string v0, "MediaLogPullV2"

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/esx;->d(Ljava/lang/String;Ljava/lang/Object;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/dvx;->b:Landroid/os/Handler;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v1, p0, Ll/dvx;->a:Landroid/os/HandlerThread;

    .line 13
    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    const/16 v1, 0x65

    .line 17
    .line 18
    iget-wide v2, p0, Ll/dvx;->r:J

    .line 19
    .line 20
    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 21
    .line 22
    .line 23
    :cond_0
    iget-object v0, p0, Ll/dvx;->d:Ll/vvx;

    .line 24
    .line 25
    new-instance v1, Ll/pvx;

    .line 26
    .line 27
    invoke-direct {v1}, Ll/pvx;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-static {v0, v1}, Ll/fvx;->a(Ll/vvx;Ll/pvx;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const/4 v1, 0x1

    .line 35
    iput-boolean v1, p0, Ll/dvx;->v:Z

    .line 36
    .line 37
    const-string v1, "v2.bufferStart"

    .line 38
    .line 39
    invoke-direct {p0, v1, v0}, Ll/dvx;->F(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public b()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/dvx;->v:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    const-string v0, "MediaLogPullV2"

    .line 6
    .line 7
    const-string v1, ""

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/esx;->d(Ljava/lang/String;Ljava/lang/Object;)I

    .line 10
    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput-boolean v0, p0, Ll/dvx;->v:Z

    .line 14
    .line 15
    iget-object v0, p0, Ll/dvx;->b:Landroid/os/Handler;

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v1, p0, Ll/dvx;->a:Landroid/os/HandlerThread;

    .line 20
    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    const/16 v1, 0x65

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 26
    .line 27
    .line 28
    :cond_0
    iget-object v0, p0, Ll/dvx;->d:Ll/vvx;

    .line 29
    .line 30
    new-instance v1, Ll/qvx;

    .line 31
    .line 32
    invoke-direct {v1}, Ll/qvx;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-static {v0, v1}, Ll/fvx;->b(Ll/vvx;Ll/qvx;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    const-string v1, "v2.bufferStop"

    .line 40
    .line 41
    invoke-direct {p0, v1, v0}, Ll/dvx;->F(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    :cond_1
    return-void
.end method

.method public c()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/dvx;->t:Ljava/util/ArrayList;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Ll/dvx;->t:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-lez v1, :cond_1

    .line 11
    .line 12
    new-instance v1, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 15
    .line 16
    .line 17
    const/4 v2, 0x0

    .line 18
    :goto_0
    iget-object v3, p0, Ll/dvx;->t:Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 21
    .line 22
    .line 23
    move-result v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    iget-object v4, p0, Ll/dvx;->t:Ljava/util/ArrayList;

    .line 25
    .line 26
    if-ge v2, v3, :cond_0

    .line 27
    .line 28
    :try_start_1
    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    check-cast v3, Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    add-int/lit8 v2, v2, 0x1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :catchall_0
    move-exception p0

    .line 41
    goto :goto_2

    .line 42
    :cond_0
    invoke-virtual {v4}, Ljava/util/ArrayList;->clear()V

    .line 43
    .line 44
    .line 45
    goto :goto_1

    .line 46
    :cond_1
    const/4 v1, 0x0

    .line 47
    :goto_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 48
    if-eqz v1, :cond_2

    .line 49
    .line 50
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-lez v0, :cond_2

    .line 55
    .line 56
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 57
    .line 58
    .line 59
    move-result-wide v2

    .line 60
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    const-string v2, "pullMediaLog"

    .line 65
    .line 66
    new-instance v3, Ljava/lang/StringBuilder;

    .line 67
    .line 68
    const-string v4, "["

    .line 69
    .line 70
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    const-string v4, "]"

    .line 78
    .line 79
    const-string v5, ")"

    .line 80
    .line 81
    invoke-virtual {v1, v4, v5}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    const-string v1, "]"

    .line 89
    .line 90
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    filled-new-array {v0, v2, v1}, [Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-static {v0}, Ll/fvx;->w([Ljava/lang/Object;)Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    const-string v1, "v2.mediaLogs"

    .line 106
    .line 107
    invoke-direct {p0, v1, v0}, Ll/dvx;->F(Ljava/lang/String;Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    :cond_2
    return-void

    .line 111
    :goto_2
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 112
    throw p0
.end method

.method public f()I
    .locals 0

    .line 1
    iget p0, p0, Ll/dvx;->u:I

    .line 2
    .line 3
    return p0
.end method

.method public g()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/dvx;->n:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object p0, p0, Ll/dvx;->f:Ll/a320;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0

    .line 12
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 13
    return p0
.end method

.method public h()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/dvx;->j:Z

    .line 2
    .line 3
    return p0
.end method

.method public handleMessage(Landroid/os/Message;)Z
    .locals 12

    .line 1
    iget v0, p1, Landroid/os/Message;->what:I

    .line 2
    .line 3
    const/16 v1, 0xc9

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x0

    .line 7
    if-eq v0, v1, :cond_6

    .line 8
    .line 9
    const/16 v1, 0xca

    .line 10
    .line 11
    if-eq v0, v1, :cond_5

    .line 12
    .line 13
    const/16 v1, 0xcc

    .line 14
    .line 15
    if-eq v0, v1, :cond_1

    .line 16
    .line 17
    const/16 v1, 0xcd

    .line 18
    .line 19
    if-eq v0, v1, :cond_0

    .line 20
    .line 21
    const/16 p1, 0x64

    .line 22
    .line 23
    const/16 v1, 0xc8

    .line 24
    .line 25
    packed-switch v0, :pswitch_data_0

    .line 26
    .line 27
    .line 28
    goto/16 :goto_2

    .line 29
    .line 30
    :pswitch_0
    const-string p1, "buffercheckcount"

    .line 31
    .line 32
    const-string v0, "pullBufferCheck"

    .line 33
    .line 34
    invoke-static {p1, v0}, Ll/esx;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 35
    .line 36
    .line 37
    const/16 p1, 0x3e9

    .line 38
    .line 39
    invoke-direct {p0, v1, p1, v2, v3}, Ll/dvx;->t(IIILjava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Ll/dvx;->b:Landroid/os/Handler;

    .line 43
    .line 44
    if-eqz p1, :cond_7

    .line 45
    .line 46
    iget-object p0, p0, Ll/dvx;->a:Landroid/os/HandlerThread;

    .line 47
    .line 48
    if-eqz p0, :cond_7

    .line 49
    .line 50
    const/16 p0, 0x68

    .line 51
    .line 52
    const-wide/16 v0, 0x1388

    .line 53
    .line 54
    invoke-virtual {p1, p0, v0, v1}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 55
    .line 56
    .line 57
    goto/16 :goto_2

    .line 58
    .line 59
    :pswitch_1
    iget-object p1, p0, Ll/dvx;->d:Ll/vvx;

    .line 60
    .line 61
    if-eqz p1, :cond_7

    .line 62
    .line 63
    iget-object p0, p0, Ll/dvx;->d:Ll/vvx;

    .line 64
    .line 65
    invoke-static {}, Ll/fvx;->p()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    iput-object p1, p0, Ll/vvx;->p:Ljava/lang/String;

    .line 70
    .line 71
    goto/16 :goto_2

    .line 72
    .line 73
    :pswitch_2
    const/16 p1, 0x3e8

    .line 74
    .line 75
    invoke-direct {p0, v1, p1, v2, v3}, Ll/dvx;->t(IIILjava/lang/Object;)V

    .line 76
    .line 77
    .line 78
    iget-object p1, p0, Ll/dvx;->b:Landroid/os/Handler;

    .line 79
    .line 80
    if-eqz p1, :cond_7

    .line 81
    .line 82
    iget-object v0, p0, Ll/dvx;->a:Landroid/os/HandlerThread;

    .line 83
    .line 84
    if-eqz v0, :cond_7

    .line 85
    .line 86
    iget p0, p0, Ll/dvx;->g:I

    .line 87
    .line 88
    int-to-long v0, p0

    .line 89
    const/16 p0, 0x66

    .line 90
    .line 91
    invoke-virtual {p1, p0, v0, v1}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 92
    .line 93
    .line 94
    goto/16 :goto_2

    .line 95
    .line 96
    :pswitch_3
    const/4 v0, 0x6

    .line 97
    invoke-direct {p0, p1, v2, v0, v3}, Ll/dvx;->t(IIILjava/lang/Object;)V

    .line 98
    .line 99
    .line 100
    goto/16 :goto_2

    .line 101
    .line 102
    :pswitch_4
    const/4 v0, 0x1

    .line 103
    invoke-direct {p0, p1, v2, v0, v3}, Ll/dvx;->t(IIILjava/lang/Object;)V

    .line 104
    .line 105
    .line 106
    goto/16 :goto_2

    .line 107
    .line 108
    :cond_0
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 109
    .line 110
    check-cast p1, Ll/fpf0;

    .line 111
    .line 112
    iput-object p1, p0, Ll/dvx;->e:Ll/fpf0;

    .line 113
    .line 114
    goto/16 :goto_2

    .line 115
    .line 116
    :cond_1
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 117
    .line 118
    check-cast p1, Ll/dvx$a;

    .line 119
    .line 120
    if-eqz p1, :cond_7

    .line 121
    .line 122
    iget-object v0, p1, Ll/dvx$a;->c:Ljava/lang/String;

    .line 123
    .line 124
    if-eqz v0, :cond_7

    .line 125
    .line 126
    iget-object v0, p0, Ll/dvx;->e:Ll/fpf0;

    .line 127
    .line 128
    const-wide/16 v3, 0x0

    .line 129
    .line 130
    if-eqz v0, :cond_3

    .line 131
    .line 132
    iget-object v0, p0, Ll/dvx;->d:Ll/vvx;

    .line 133
    .line 134
    if-nez v0, :cond_2

    .line 135
    .line 136
    move-wide v0, v3

    .line 137
    goto :goto_0

    .line 138
    :cond_2
    iget-object v0, p0, Ll/dvx;->d:Ll/vvx;

    .line 139
    .line 140
    iget-wide v0, v0, Ll/vvx;->O:J

    .line 141
    .line 142
    :goto_0
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object v10

    .line 146
    iget-object v5, p0, Ll/dvx;->e:Ll/fpf0;

    .line 147
    .line 148
    iget-object v7, p1, Ll/dvx$a;->b:Ljava/lang/String;

    .line 149
    .line 150
    iget-object v8, p1, Ll/dvx$a;->c:Ljava/lang/String;

    .line 151
    .line 152
    iget-object v9, p0, Ll/dvx;->o:Ljava/lang/String;

    .line 153
    .line 154
    iget v0, p0, Ll/dvx;->q:I

    .line 155
    .line 156
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object v11

    .line 160
    const-string v6, "nonConf"

    .line 161
    .line 162
    invoke-virtual/range {v5 .. v11}, Ll/fpf0;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 163
    .line 164
    .line 165
    :cond_3
    iget-object v0, p0, Ll/dvx;->d:Ll/vvx;

    .line 166
    .line 167
    if-eqz v0, :cond_7

    .line 168
    .line 169
    iget-object v0, p0, Ll/dvx;->d:Ll/vvx;

    .line 170
    .line 171
    iget-boolean v0, v0, Ll/vvx;->X:Z

    .line 172
    .line 173
    if-eqz v0, :cond_7

    .line 174
    .line 175
    iget-object v0, p0, Ll/dvx;->f:Ll/a320;

    .line 176
    .line 177
    if-eqz v0, :cond_7

    .line 178
    .line 179
    iget-object v5, p0, Ll/dvx;->f:Ll/a320;

    .line 180
    .line 181
    iget-object v7, p1, Ll/dvx$a;->b:Ljava/lang/String;

    .line 182
    .line 183
    iget-object v8, p1, Ll/dvx$a;->c:Ljava/lang/String;

    .line 184
    .line 185
    iget-object v9, p0, Ll/dvx;->o:Ljava/lang/String;

    .line 186
    .line 187
    iget-object p1, p0, Ll/dvx;->d:Ll/vvx;

    .line 188
    .line 189
    if-nez p1, :cond_4

    .line 190
    .line 191
    goto :goto_1

    .line 192
    :cond_4
    iget-object p1, p0, Ll/dvx;->d:Ll/vvx;

    .line 193
    .line 194
    iget-wide v3, p1, Ll/vvx;->O:J

    .line 195
    .line 196
    :goto_1
    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 197
    .line 198
    .line 199
    move-result-object v10

    .line 200
    iget p0, p0, Ll/dvx;->q:I

    .line 201
    .line 202
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 203
    .line 204
    .line 205
    move-result-object v11

    .line 206
    const-string v6, "nonConf"

    .line 207
    .line 208
    invoke-virtual/range {v5 .. v11}, Ll/a320;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 209
    .line 210
    .line 211
    goto :goto_2

    .line 212
    :cond_5
    invoke-direct {p0}, Ll/dvx;->r()V

    .line 213
    .line 214
    .line 215
    goto :goto_2

    .line 216
    :cond_6
    iput-object v3, p0, Ll/dvx;->c:Ll/dvx$b;

    .line 217
    .line 218
    iput-object v3, p0, Ll/dvx;->d:Ll/vvx;

    .line 219
    .line 220
    iput-object v3, p0, Ll/dvx;->e:Ll/fpf0;

    .line 221
    .line 222
    iget-object p1, p0, Ll/dvx;->b:Landroid/os/Handler;

    .line 223
    .line 224
    if-eqz p1, :cond_7

    .line 225
    .line 226
    iget-object v0, p0, Ll/dvx;->a:Landroid/os/HandlerThread;

    .line 227
    .line 228
    if-eqz v0, :cond_7

    .line 229
    .line 230
    invoke-virtual {p1, v3}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 231
    .line 232
    .line 233
    iget-object p1, p0, Ll/dvx;->a:Landroid/os/HandlerThread;

    .line 234
    .line 235
    invoke-virtual {p1}, Landroid/os/HandlerThread;->quit()Z

    .line 236
    .line 237
    .line 238
    iput-object v3, p0, Ll/dvx;->b:Landroid/os/Handler;

    .line 239
    .line 240
    iput-object v3, p0, Ll/dvx;->a:Landroid/os/HandlerThread;

    .line 241
    .line 242
    :cond_7
    :goto_2
    return v2

    .line 243
    :pswitch_data_0
    .packed-switch 0x64
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public i(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "v2.livePullStop"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/dvx;->l:Ljava/util/ArrayList;

    .line 10
    .line 11
    monitor-enter v0

    .line 12
    :try_start_0
    iget-object p1, p0, Ll/dvx;->l:Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    monitor-exit v0

    .line 18
    goto :goto_0

    .line 19
    :catchall_0
    move-exception p0

    .line 20
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21
    throw p0

    .line 22
    :cond_0
    const-string v0, "v2.livePullStart"

    .line 23
    .line 24
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-eqz p1, :cond_1

    .line 29
    .line 30
    iget-object p1, p0, Ll/dvx;->m:Ljava/util/ArrayList;

    .line 31
    .line 32
    monitor-enter p1

    .line 33
    :try_start_1
    iget-object v0, p0, Ll/dvx;->m:Ljava/util/ArrayList;

    .line 34
    .line 35
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    monitor-exit p1

    .line 39
    goto :goto_0

    .line 40
    :catchall_1
    move-exception p0

    .line 41
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 42
    throw p0

    .line 43
    :cond_1
    :goto_0
    iget-object p1, p0, Ll/dvx;->m:Ljava/util/ArrayList;

    .line 44
    .line 45
    const-string p2, "v2.livePullStart"

    .line 46
    .line 47
    const/4 v0, 0x0

    .line 48
    invoke-direct {p0, v0, p1, p2}, Ll/dvx;->e(ZLjava/util/ArrayList;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    iget-object p1, p0, Ll/dvx;->l:Ljava/util/ArrayList;

    .line 52
    .line 53
    const-string p2, "v2.livePullStop"

    .line 54
    .line 55
    invoke-direct {p0, v0, p1, p2}, Ll/dvx;->e(ZLjava/util/ArrayList;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public j(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    filled-new-array {v0, p1, p2}, [Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-static {p1}, Ll/fvx;->w([Ljava/lang/Object;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    const-string p2, "]"

    .line 18
    .line 19
    const-string v0, ")"

    .line 20
    .line 21
    invoke-virtual {p1, p2, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    const-string p2, "v2.mediaLogs"

    .line 26
    .line 27
    invoke-direct {p0, p2, p1}, Ll/dvx;->F(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public varargs k([Ljava/lang/Object;)V
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ljava/text/SimpleDateFormat;

    .line 7
    .line 8
    const-string v2, "HH:mm:ss.SSS"

    .line 9
    .line 10
    sget-object v3, Ljava/util/Locale;->CHINA:Ljava/util/Locale;

    .line 11
    .line 12
    invoke-direct {v1, v2, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 13
    .line 14
    .line 15
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 16
    .line 17
    .line 18
    move-result-wide v2

    .line 19
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-virtual {v1, v2}, Ljava/text/Format;->format(Ljava/lang/Object;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    new-instance v2, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    const-string v3, "{"

    .line 30
    .line 31
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    const-string v1, ","

    .line 38
    .line 39
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    if-eqz p1, :cond_1

    .line 50
    .line 51
    const/4 v1, 0x0

    .line 52
    :goto_0
    array-length v2, p1

    .line 53
    if-ge v1, v2, :cond_1

    .line 54
    .line 55
    if-eqz v1, :cond_0

    .line 56
    .line 57
    const-string v2, ","

    .line 58
    .line 59
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    :cond_0
    aget-object v2, p1, v1

    .line 63
    .line 64
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    add-int/lit8 v1, v1, 0x1

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_1
    const-string p1, "}"

    .line 71
    .line 72
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    iget-object p1, p0, Ll/dvx;->t:Ljava/util/ArrayList;

    .line 76
    .line 77
    monitor-enter p1

    .line 78
    :try_start_0
    iget-object p0, p0, Ll/dvx;->t:Ljava/util/ArrayList;

    .line 79
    .line 80
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    monitor-exit p1

    .line 88
    return-void

    .line 89
    :catchall_0
    move-exception p0

    .line 90
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 91
    throw p0
.end method

.method public l()V
    .locals 2

    .line 1
    const-string v0, "MediaLogPullV2"

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/esx;->d(Ljava/lang/String;Ljava/lang/Object;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/dvx;->d:Ll/vvx;

    .line 9
    .line 10
    new-instance v1, Ll/rvx;

    .line 11
    .line 12
    invoke-direct {v1}, Ll/rvx;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-static {v0, v1}, Ll/fvx;->c(Ll/vvx;Ll/rvx;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "v2.pullBufferDrop"

    .line 20
    .line 21
    invoke-direct {p0, v1, v0}, Ll/dvx;->F(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public m()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/dvx;->j:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Ll/dvx;->j:Z

    .line 7
    .line 8
    iget-object v0, p0, Ll/dvx;->d:Ll/vvx;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Ll/dvx;->d:Ll/vvx;

    .line 13
    .line 14
    iget-object v0, v0, Ll/vvx;->b:Ljava/lang/String;

    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Ll/dvx;->d:Ll/vvx;

    .line 19
    .line 20
    iget-object v0, v0, Ll/vvx;->b:Ljava/lang/String;

    .line 21
    .line 22
    const-string v1, "v2.pullDetect"

    .line 23
    .line 24
    invoke-direct {p0, v1, v0}, Ll/dvx;->F(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public n()V
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "Interval "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Ll/dvx;->g:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " / "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget v2, p0, Ll/dvx;->h:I

    .line 19
    .line 20
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v2, "MediaLogPullV2"

    .line 28
    .line 29
    invoke-static {v2, v0}, Ll/esx;->d(Ljava/lang/String;Ljava/lang/Object;)I

    .line 30
    .line 31
    .line 32
    new-instance v0, Ljava/lang/StringBuilder;

    .line 33
    .line 34
    const-string v3, "myHttpMediaLogsUpload "

    .line 35
    .line 36
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    iget-object v3, p0, Ll/dvx;->f:Ll/a320;

    .line 40
    .line 41
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    iget-object v1, p0, Ll/dvx;->e:Ll/fpf0;

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-static {v2, v0}, Ll/esx;->d(Ljava/lang/String;Ljava/lang/Object;)I

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Ll/dvx;->b:Landroid/os/Handler;

    .line 60
    .line 61
    if-eqz v0, :cond_0

    .line 62
    .line 63
    iget-object v1, p0, Ll/dvx;->a:Landroid/os/HandlerThread;

    .line 64
    .line 65
    if-eqz v1, :cond_0

    .line 66
    .line 67
    const/16 v1, 0x67

    .line 68
    .line 69
    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Ll/dvx;->b:Landroid/os/Handler;

    .line 73
    .line 74
    const/16 v1, 0x64

    .line 75
    .line 76
    iget-wide v2, p0, Ll/dvx;->s:J

    .line 77
    .line 78
    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Ll/dvx;->b:Landroid/os/Handler;

    .line 82
    .line 83
    iget v1, p0, Ll/dvx;->g:I

    .line 84
    .line 85
    int-to-long v1, v1

    .line 86
    const/16 v3, 0x66

    .line 87
    .line 88
    invoke-virtual {v0, v3, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 89
    .line 90
    .line 91
    iget-object p0, p0, Ll/dvx;->b:Landroid/os/Handler;

    .line 92
    .line 93
    const/16 v0, 0x68

    .line 94
    .line 95
    const-wide/16 v1, 0x1388

    .line 96
    .line 97
    invoke-virtual {p0, v0, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 98
    .line 99
    .line 100
    :cond_0
    return-void
.end method

.method public o()V
    .locals 2

    .line 1
    const-string v0, "MediaLogPullV2"

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/esx;->d(Ljava/lang/String;Ljava/lang/Object;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/dvx;->b:Landroid/os/Handler;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v1, p0, Ll/dvx;->a:Landroid/os/HandlerThread;

    .line 13
    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    const/16 v1, 0x64

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 19
    .line 20
    .line 21
    :cond_0
    invoke-virtual {p0}, Ll/dvx;->m()V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/dvx;->d:Ll/vvx;

    .line 25
    .line 26
    new-instance v1, Ll/svx;

    .line 27
    .line 28
    invoke-direct {v1}, Ll/svx;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-static {v0, v1}, Ll/fvx;->d(Ll/vvx;Ll/svx;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const-string v1, "v2.pullStart"

    .line 36
    .line 37
    invoke-direct {p0, v1, v0}, Ll/dvx;->F(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public p()V
    .locals 5

    .line 1
    const-string v0, "MediaLogPullV2"

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/esx;->d(Ljava/lang/String;Ljava/lang/Object;)I

    .line 6
    .line 7
    .line 8
    iget-boolean v0, p0, Ll/dvx;->i:Z

    .line 9
    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    iput-boolean v0, p0, Ll/dvx;->i:Z

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/dvx;->m()V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Ll/dvx;->d:Ll/vvx;

    .line 19
    .line 20
    iget-wide v1, v1, Ll/vvx;->W:J

    .line 21
    .line 22
    const-wide/16 v3, 0x0

    .line 23
    .line 24
    cmp-long v1, v1, v3

    .line 25
    .line 26
    if-nez v1, :cond_0

    .line 27
    .line 28
    invoke-direct {p0}, Ll/dvx;->r()V

    .line 29
    .line 30
    .line 31
    :cond_0
    invoke-direct {p0, v0}, Ll/dvx;->d(Z)V

    .line 32
    .line 33
    .line 34
    iget-object v1, p0, Ll/dvx;->l:Ljava/util/ArrayList;

    .line 35
    .line 36
    const-string v2, "v2.livePullStop"

    .line 37
    .line 38
    invoke-direct {p0, v0, v1, v2}, Ll/dvx;->e(ZLjava/util/ArrayList;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    iget-object v1, p0, Ll/dvx;->m:Ljava/util/ArrayList;

    .line 42
    .line 43
    const-string v2, "v2.livePullStart"

    .line 44
    .line 45
    invoke-direct {p0, v0, v1, v2}, Ll/dvx;->e(ZLjava/util/ArrayList;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0}, Ll/dvx;->b()V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Ll/dvx;->d:Ll/vvx;

    .line 52
    .line 53
    new-instance v1, Ll/tvx;

    .line 54
    .line 55
    invoke-direct {v1}, Ll/tvx;-><init>()V

    .line 56
    .line 57
    .line 58
    invoke-static {v0, v1}, Ll/fvx;->e(Ll/vvx;Ll/tvx;)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    const-string v1, "v2.pullStop"

    .line 63
    .line 64
    invoke-direct {p0, v1, v0}, Ll/dvx;->F(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    :cond_1
    return-void
.end method

.method public q()V
    .locals 2

    .line 1
    const-string v0, "MediaLogPullV2"

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/esx;->d(Ljava/lang/String;Ljava/lang/Object;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/dvx;->b:Landroid/os/Handler;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Ll/dvx;->a:Landroid/os/HandlerThread;

    .line 13
    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    const/16 p0, 0xca

    .line 17
    .line 18
    invoke-virtual {v0, p0}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public s()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dvx;->b:Landroid/os/Handler;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/dvx;->a:Landroid/os/HandlerThread;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/16 p0, 0xc9

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public u(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/dvx;->r:J

    .line 2
    .line 3
    return-void
.end method

.method public v(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/dvx;->u:I

    .line 2
    .line 3
    return-void
.end method

.method public final w(Ll/a320;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/dvx;->f:Ll/a320;

    .line 2
    .line 3
    return-void
.end method

.method public x(I)V
    .locals 1

    .line 1
    const/16 v0, 0x3e8

    .line 2
    .line 3
    if-le p1, v0, :cond_0

    .line 4
    .line 5
    iput p1, p0, Ll/dvx;->g:I

    .line 6
    .line 7
    :cond_0
    return-void
.end method

.method public final y(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/dvx;->o:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p2, p0, Ll/dvx;->p:Ljava/lang/String;

    .line 4
    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    iput p3, p0, Ll/dvx;->q:I

    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public z(Ll/vvx;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/dvx;->d:Ll/vvx;

    .line 2
    .line 3
    return-void
.end method
