.class public Ll/a53;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/a53$a;,
        Ll/a53$b;
    }
.end annotation


# instance fields
.field private a:Ljava/lang/String;

.field private b:Ljava/nio/ByteBuffer;

.field private c:Ljava/lang/Object;

.field private d:Ljava/lang/Object;

.field private e:Z

.field private f:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private g:Ll/a53$a;

.field private h:Ll/a53$b;

.field private i:Ll/umw;

.field private j:Ll/lnw;

.field private k:Lcom/momocv/bodylandmark/BodyLandmarkPostInfo;

.field private l:Lcom/momocv/bodylandmark/BodyLandmark;

.field private m:Ll/ppl;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/umw;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/umw;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/a53;->i:Ll/umw;

    .line 10
    .line 11
    new-instance v0, Ll/lnw;

    .line 12
    .line 13
    const/4 v1, 0x5

    .line 14
    invoke-direct {v0, v1}, Ll/lnw;-><init>(I)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ll/a53;->j:Ll/lnw;

    .line 18
    .line 19
    new-instance v0, Lcom/momocv/bodylandmark/BodyLandmarkPostInfo;

    .line 20
    .line 21
    invoke-direct {v0}, Lcom/momocv/bodylandmark/BodyLandmarkPostInfo;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Ll/a53;->k:Lcom/momocv/bodylandmark/BodyLandmarkPostInfo;

    .line 25
    .line 26
    new-instance v0, Ljava/lang/Object;

    .line 27
    .line 28
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Ll/a53;->c:Ljava/lang/Object;

    .line 32
    .line 33
    new-instance v0, Ljava/lang/Object;

    .line 34
    .line 35
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 36
    .line 37
    .line 38
    iput-object v0, p0, Ll/a53;->d:Ljava/lang/Object;

    .line 39
    .line 40
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 41
    .line 42
    const/4 v1, 0x0

    .line 43
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 44
    .line 45
    .line 46
    iput-object v0, p0, Ll/a53;->f:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 47
    .line 48
    return-void
.end method

.method public static synthetic a(Ll/a53;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/a53;->e:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic b(Ll/a53;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/a53;->e:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic c(Ll/a53;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a53;->c:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic d(Ll/a53;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/a53;->h()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Ll/a53;)Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a53;->b:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic f(Ll/a53;Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/a53;->b:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic g(Ll/a53;)Ll/ppl;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a53;->m:Ll/ppl;

    .line 2
    .line 3
    return-object p0
.end method

.method private h()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/a53;->f:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    iget-object v2, p0, Ll/a53;->l:Lcom/momocv/bodylandmark/BodyLandmark;

    .line 12
    .line 13
    if-nez v2, :cond_0

    .line 14
    .line 15
    iget-object v2, p0, Ll/a53;->a:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-nez v2, :cond_0

    .line 22
    .line 23
    new-instance v2, Lcom/momocv/bodylandmark/BodyLandmark;

    .line 24
    .line 25
    invoke-direct {v2}, Lcom/momocv/bodylandmark/BodyLandmark;-><init>()V

    .line 26
    .line 27
    .line 28
    iput-object v2, p0, Ll/a53;->l:Lcom/momocv/bodylandmark/BodyLandmark;

    .line 29
    .line 30
    iget-object v3, p0, Ll/a53;->a:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {v2, v3}, Lcom/momocv/bodylandmark/BodyLandmark;->LoadModel(Ljava/lang/String;)Z

    .line 33
    .line 34
    .line 35
    :cond_0
    iget-object v2, p0, Ll/a53;->l:Lcom/momocv/bodylandmark/BodyLandmark;

    .line 36
    .line 37
    if-eqz v2, :cond_1

    .line 38
    .line 39
    iget-object v2, p0, Ll/a53;->b:Ljava/nio/ByteBuffer;

    .line 40
    .line 41
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->array()[B

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    iget-object v3, p0, Ll/a53;->i:Ll/umw;

    .line 46
    .line 47
    invoke-virtual {v3, v2}, Ll/umw;->g([B)V

    .line 48
    .line 49
    .line 50
    iget-object v3, p0, Ll/a53;->i:Ll/umw;

    .line 51
    .line 52
    array-length v2, v2

    .line 53
    invoke-virtual {v3, v2}, Ll/umw;->f(I)V

    .line 54
    .line 55
    .line 56
    iget-object v2, p0, Ll/a53;->l:Lcom/momocv/bodylandmark/BodyLandmark;

    .line 57
    .line 58
    iget-object v3, p0, Ll/a53;->i:Ll/umw;

    .line 59
    .line 60
    invoke-virtual {v3}, Ll/umw;->b()Lcom/momocv/MMFrame;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    iget-object v4, p0, Ll/a53;->j:Ll/lnw;

    .line 65
    .line 66
    invoke-virtual {v4}, Ll/lnw;->a()Lcom/momocv/bodylandmark/BodyLandmarkParams;

    .line 67
    .line 68
    .line 69
    move-result-object v4

    .line 70
    iget-object v5, p0, Ll/a53;->k:Lcom/momocv/bodylandmark/BodyLandmarkPostInfo;

    .line 71
    .line 72
    invoke-virtual {v2, v3, v4, v5}, Lcom/momocv/bodylandmark/BodyLandmark;->ProcessFrame(Lcom/momocv/MMFrame;Lcom/momocv/bodylandmark/BodyLandmarkParams;Lcom/momocv/bodylandmark/BodyLandmarkPostInfo;)Z

    .line 73
    .line 74
    .line 75
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    iget-object v3, p0, Ll/a53;->k:Lcom/momocv/bodylandmark/BodyLandmarkPostInfo;

    .line 80
    .line 81
    iput-object v3, v2, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 82
    .line 83
    iget-object v3, p0, Ll/a53;->h:Ll/a53$b;

    .line 84
    .line 85
    if-eqz v3, :cond_1

    .line 86
    .line 87
    invoke-virtual {v3, v2}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 88
    .line 89
    .line 90
    :cond_1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 91
    .line 92
    .line 93
    move-result-wide v2

    .line 94
    sub-long/2addr v2, v0

    .line 95
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-virtual {v0, v2, v3}, Ll/u6y;->d0(J)V

    .line 100
    .line 101
    .line 102
    iget-object p0, p0, Ll/a53;->f:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 103
    .line 104
    const/4 v0, 0x0

    .line 105
    invoke-virtual {p0, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 106
    .line 107
    .line 108
    return-void
.end method


# virtual methods
.method public i(Ll/ppl;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/a53;->m:Ll/ppl;

    .line 2
    .line 3
    return-void
.end method

.method public j(Ll/omw;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/a53;->f:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Ll/a53;->i:Ll/umw;

    .line 11
    .line 12
    const/16 v1, 0x11

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ll/umw;->h(I)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/a53;->i:Ll/umw;

    .line 18
    .line 19
    iget v1, p1, Ll/omw;->e:I

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ll/umw;->m(I)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/a53;->i:Ll/umw;

    .line 25
    .line 26
    iget v1, p1, Ll/omw;->f:I

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ll/umw;->j(I)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/a53;->i:Ll/umw;

    .line 32
    .line 33
    iget v1, p1, Ll/omw;->e:I

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ll/umw;->l(I)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p1, Ll/omw;->g:[B

    .line 39
    .line 40
    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iput-object v0, p0, Ll/a53;->b:Ljava/nio/ByteBuffer;

    .line 45
    .line 46
    iget-object v0, p0, Ll/a53;->j:Ll/lnw;

    .line 47
    .line 48
    iget-boolean v1, p1, Ll/omw;->a:Z

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ll/lnw;->p(Z)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Ll/a53;->j:Ll/lnw;

    .line 54
    .line 55
    iget v1, p1, Ll/omw;->b:I

    .line 56
    .line 57
    invoke-virtual {v0, v1}, Ll/lnw;->A(I)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Ll/a53;->j:Ll/lnw;

    .line 61
    .line 62
    iget p1, p1, Ll/omw;->c:I

    .line 63
    .line 64
    invoke-virtual {v0, p1}, Ll/lnw;->z(I)V

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Ll/a53;->j:Ll/lnw;

    .line 68
    .line 69
    const/4 v0, 0x1

    .line 70
    invoke-virtual {p1, v0}, Ll/lnw;->H(Z)V

    .line 71
    .line 72
    .line 73
    iget-object p1, p0, Ll/a53;->c:Ljava/lang/Object;

    .line 74
    .line 75
    monitor-enter p1

    .line 76
    :try_start_0
    iget-object p0, p0, Ll/a53;->c:Ljava/lang/Object;

    .line 77
    .line 78
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    .line 79
    .line 80
    .line 81
    monitor-exit p1

    .line 82
    return-void

    .line 83
    :catchall_0
    move-exception p0

    .line 84
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 85
    throw p0
.end method

.method public k(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/a53;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public l()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/a53;->d:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Ll/a53;->g:Ll/a53$a;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    iput-boolean v1, p0, Ll/a53;->e:Z

    .line 10
    .line 11
    new-instance v1, Ll/a53$a;

    .line 12
    .line 13
    const-string v2, "BodyDetect"

    .line 14
    .line 15
    invoke-direct {v1, p0, v2}, Ll/a53$a;-><init>(Ll/a53;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iput-object v1, p0, Ll/a53;->g:Ll/a53$a;

    .line 19
    .line 20
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 21
    .line 22
    .line 23
    iget-object v1, p0, Ll/a53;->h:Ll/a53$b;

    .line 24
    .line 25
    if-nez v1, :cond_0

    .line 26
    .line 27
    new-instance v1, Ll/a53$b;

    .line 28
    .line 29
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-direct {v1, p0, v2}, Ll/a53$b;-><init>(Ll/a53;Landroid/os/Looper;)V

    .line 34
    .line 35
    .line 36
    iput-object v1, p0, Ll/a53;->h:Ll/a53$b;

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :catchall_0
    move-exception p0

    .line 40
    goto :goto_1

    .line 41
    :cond_0
    :goto_0
    monitor-exit v0

    .line 42
    return-void

    .line 43
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 44
    throw p0
.end method
