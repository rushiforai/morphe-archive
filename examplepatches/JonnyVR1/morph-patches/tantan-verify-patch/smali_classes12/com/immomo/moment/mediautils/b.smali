.class public abstract Lcom/immomo/moment/mediautils/b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/immomo/moment/mediautils/b$a;,
        Lcom/immomo/moment/mediautils/b$b;
    }
.end annotation


# instance fields
.field protected a:Lcom/immomo/moment/mediautils/b$b;

.field protected b:Lcom/immomo/moment/mediautils/b$a;

.field protected c:Ll/jpw;

.field protected d:I

.field protected e:I

.field protected f:I

.field protected g:I

.field protected h:I

.field protected i:I

.field protected j:J

.field protected k:Z

.field protected l:Ljava/lang/Object;

.field protected m:Ljava/nio/ByteBuffer;

.field protected n:J

.field protected o:J

.field protected p:Z

.field protected q:Z

.field protected r:Z

.field protected s:Z

.field protected t:Ljava/util/concurrent/LinkedBlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/LinkedBlockingQueue<",
            "Ljava/nio/ByteBuffer;",
            ">;"
        }
    .end annotation
.end field

.field protected u:Ljava/util/concurrent/LinkedBlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/LinkedBlockingQueue<",
            "Ljava/nio/ByteBuffer;",
            ">;"
        }
    .end annotation
.end field

.field protected final v:I

.field protected final w:I

.field protected final x:I

.field protected final y:I

.field protected final z:I


# direct methods
.method public constructor <init>()V
    .locals 6

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/immomo/moment/mediautils/b;->a:Lcom/immomo/moment/mediautils/b$b;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/immomo/moment/mediautils/b;->b:Lcom/immomo/moment/mediautils/b$a;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/immomo/moment/mediautils/b;->c:Ll/jpw;

    .line 10
    .line 11
    const v1, 0xac44

    .line 12
    .line 13
    .line 14
    iput v1, p0, Lcom/immomo/moment/mediautils/b;->d:I

    .line 15
    .line 16
    const/16 v1, 0x10

    .line 17
    .line 18
    iput v1, p0, Lcom/immomo/moment/mediautils/b;->e:I

    .line 19
    .line 20
    const/4 v2, 0x1

    .line 21
    iput v2, p0, Lcom/immomo/moment/mediautils/b;->f:I

    .line 22
    .line 23
    const/4 v3, 0x0

    .line 24
    iput v3, p0, Lcom/immomo/moment/mediautils/b;->g:I

    .line 25
    .line 26
    iput v1, p0, Lcom/immomo/moment/mediautils/b;->h:I

    .line 27
    .line 28
    iput v3, p0, Lcom/immomo/moment/mediautils/b;->i:I

    .line 29
    .line 30
    const-wide/16 v4, 0x0

    .line 31
    .line 32
    iput-wide v4, p0, Lcom/immomo/moment/mediautils/b;->j:J

    .line 33
    .line 34
    iput-boolean v2, p0, Lcom/immomo/moment/mediautils/b;->k:Z

    .line 35
    .line 36
    new-instance v1, Ljava/lang/Object;

    .line 37
    .line 38
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 39
    .line 40
    .line 41
    iput-object v1, p0, Lcom/immomo/moment/mediautils/b;->l:Ljava/lang/Object;

    .line 42
    .line 43
    iput-object v0, p0, Lcom/immomo/moment/mediautils/b;->m:Ljava/nio/ByteBuffer;

    .line 44
    .line 45
    iput-wide v4, p0, Lcom/immomo/moment/mediautils/b;->n:J

    .line 46
    .line 47
    iput-wide v4, p0, Lcom/immomo/moment/mediautils/b;->o:J

    .line 48
    .line 49
    iput-boolean v3, p0, Lcom/immomo/moment/mediautils/b;->p:Z

    .line 50
    .line 51
    iput-boolean v3, p0, Lcom/immomo/moment/mediautils/b;->q:Z

    .line 52
    .line 53
    iput-boolean v3, p0, Lcom/immomo/moment/mediautils/b;->r:Z

    .line 54
    .line 55
    iput-boolean v3, p0, Lcom/immomo/moment/mediautils/b;->s:Z

    .line 56
    .line 57
    new-instance v0, Ljava/util/concurrent/LinkedBlockingQueue;

    .line 58
    .line 59
    invoke-direct {v0}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    .line 60
    .line 61
    .line 62
    iput-object v0, p0, Lcom/immomo/moment/mediautils/b;->t:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 63
    .line 64
    new-instance v0, Ljava/util/concurrent/LinkedBlockingQueue;

    .line 65
    .line 66
    invoke-direct {v0}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    .line 67
    .line 68
    .line 69
    iput-object v0, p0, Lcom/immomo/moment/mediautils/b;->u:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 70
    .line 71
    const/16 v0, -0x64

    .line 72
    .line 73
    iput v0, p0, Lcom/immomo/moment/mediautils/b;->v:I

    .line 74
    .line 75
    const/16 v0, -0x65

    .line 76
    .line 77
    iput v0, p0, Lcom/immomo/moment/mediautils/b;->w:I

    .line 78
    .line 79
    const/16 v0, -0x66

    .line 80
    .line 81
    iput v0, p0, Lcom/immomo/moment/mediautils/b;->x:I

    .line 82
    .line 83
    const/16 v0, -0x67

    .line 84
    .line 85
    iput v0, p0, Lcom/immomo/moment/mediautils/b;->y:I

    .line 86
    .line 87
    const/16 v0, -0x68

    .line 88
    .line 89
    iput v0, p0, Lcom/immomo/moment/mediautils/b;->z:I

    .line 90
    .line 91
    return-void
.end method


# virtual methods
.method public declared-synchronized a()J
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/b;->j:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    monitor-exit p0

    .line 5
    return-wide v0

    .line 6
    :catchall_0
    move-exception v0

    .line 7
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 8
    throw v0
.end method

.method public abstract b(Ljava/nio/ByteBuffer;I)Z
.end method

.method public abstract c()V
.end method

.method public abstract d(J)V
.end method

.method public abstract e(Ljava/lang/String;)Z
.end method

.method public abstract f(Z)V
.end method

.method public abstract g(JJ)V
.end method

.method public declared-synchronized h(Z)V
    .locals 0

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iput-boolean p1, p0, Lcom/immomo/moment/mediautils/b;->k:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    monitor-exit p0

    .line 5
    return-void

    .line 6
    :catchall_0
    move-exception p1

    .line 7
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 8
    throw p1
.end method

.method public declared-synchronized i(Lcom/immomo/moment/mediautils/b$a;)V
    .locals 0

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iput-object p1, p0, Lcom/immomo/moment/mediautils/b;->b:Lcom/immomo/moment/mediautils/b$a;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    monitor-exit p0

    .line 5
    return-void

    .line 6
    :catchall_0
    move-exception p1

    .line 7
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 8
    throw p1
.end method

.method public declared-synchronized j(Lcom/immomo/moment/mediautils/b$b;)V
    .locals 0

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iput-object p1, p0, Lcom/immomo/moment/mediautils/b;->a:Lcom/immomo/moment/mediautils/b$b;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    monitor-exit p0

    .line 5
    return-void

    .line 6
    :catchall_0
    move-exception p1

    .line 7
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 8
    throw p1
.end method

.method public abstract k(III)V
.end method

.method public declared-synchronized l(Ll/jpw;)V
    .locals 0

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iput-object p1, p0, Lcom/immomo/moment/mediautils/b;->c:Ll/jpw;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    monitor-exit p0

    .line 5
    return-void

    .line 6
    :catchall_0
    move-exception p1

    .line 7
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 8
    throw p1
.end method

.method public abstract m()V
.end method
