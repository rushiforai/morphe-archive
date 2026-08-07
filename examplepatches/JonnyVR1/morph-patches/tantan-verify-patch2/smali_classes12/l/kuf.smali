.class public Ll/kuf;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x10
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/kuf$c;,
        Ll/kuf$e;,
        Ll/kuf$d;
    }
.end annotation


# static fields
.field private static g:Landroid/os/Handler;


# instance fields
.field private a:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private b:Ll/kuf$c;

.field private c:J

.field private d:I

.field private volatile e:I

.field private volatile f:Ll/kuf$d;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Landroid/os/Handler;

    .line 2
    .line 3
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Ll/kuf;->g:Landroid/os/Handler;

    .line 11
    .line 12
    return-void
.end method

.method private constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/kuf;->a:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 11
    .line 12
    new-instance v0, Ll/kuf$c;

    .line 13
    .line 14
    invoke-direct {v0, p0}, Ll/kuf$c;-><init>(Ll/kuf;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ll/kuf;->b:Ll/kuf$c;

    .line 18
    .line 19
    return-void
.end method

.method public synthetic constructor <init>(Ll/kuf$a;)V
    .locals 0

    .line 20
    invoke-direct {p0}, Ll/kuf;-><init>()V

    return-void
.end method

.method public static synthetic a(Ll/kuf;)Ljava/util/concurrent/atomic/AtomicBoolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kuf;->a:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b(Ll/kuf;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/kuf;->l()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Ll/kuf;)Ll/kuf$c;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kuf;->b:Ll/kuf$c;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic d()Landroid/os/Handler;
    .locals 1

    .line 1
    sget-object v0, Ll/kuf;->g:Landroid/os/Handler;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic e(Ll/kuf;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/kuf;->k()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(Ll/kuf;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/kuf;->j(J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic g(Ll/kuf;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/kuf;->e:I

    .line 2
    .line 3
    return p0
.end method

.method public static h()Ll/kuf;
    .locals 1

    .line 1
    invoke-static {}, Ll/kuf$e;->a()Ll/kuf;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method private j(J)V
    .locals 6

    .line 1
    iget-wide v0, p0, Ll/kuf;->c:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v2, v0, v2

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    if-nez v2, :cond_0

    .line 9
    .line 10
    iput-wide p1, p0, Ll/kuf;->c:J

    .line 11
    .line 12
    iput v3, p0, Ll/kuf;->d:I

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    iget v2, p0, Ll/kuf;->d:I

    .line 16
    .line 17
    add-int/lit8 v2, v2, 0x1

    .line 18
    .line 19
    iput v2, p0, Ll/kuf;->d:I

    .line 20
    .line 21
    sub-long v0, p1, v0

    .line 22
    .line 23
    const-wide/32 v4, 0xf4240

    .line 24
    .line 25
    .line 26
    div-long/2addr v0, v4

    .line 27
    const-wide/16 v4, 0x3e8

    .line 28
    .line 29
    cmp-long v0, v0, v4

    .line 30
    .line 31
    if-ltz v0, :cond_2

    .line 32
    .line 33
    const/16 v0, 0x3c

    .line 34
    .line 35
    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    iput v0, p0, Ll/kuf;->e:I

    .line 40
    .line 41
    iput-wide p1, p0, Ll/kuf;->c:J

    .line 42
    .line 43
    iput v3, p0, Ll/kuf;->d:I

    .line 44
    .line 45
    iget-object p1, p0, Ll/kuf;->f:Ll/kuf$d;

    .line 46
    .line 47
    if-nez p1, :cond_1

    .line 48
    .line 49
    new-instance p1, Ll/kuf$d;

    .line 50
    .line 51
    const/4 p2, 0x0

    .line 52
    invoke-direct {p1, p0, p2}, Ll/kuf$d;-><init>(Ll/kuf;Ll/kuf$a;)V

    .line 53
    .line 54
    .line 55
    iput-object p1, p0, Ll/kuf;->f:Ll/kuf$d;

    .line 56
    .line 57
    :cond_1
    iget-object p1, p0, Ll/kuf;->f:Ll/kuf$d;

    .line 58
    .line 59
    iget p2, p0, Ll/kuf;->e:I

    .line 60
    .line 61
    invoke-virtual {p1, p2}, Ll/kuf$d;->a(I)V

    .line 62
    .line 63
    .line 64
    :cond_2
    :goto_0
    invoke-direct {p0}, Ll/kuf;->l()V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method private k()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Ll/kuf;->c:J

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput v0, p0, Ll/kuf;->d:I

    .line 7
    .line 8
    iput v0, p0, Ll/kuf;->e:I

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput-object v0, p0, Ll/kuf;->f:Ll/kuf$d;

    .line 12
    .line 13
    return-void
.end method

.method private l()V
    .locals 1

    .line 1
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Ll/kuf;->b:Ll/kuf$c;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public i()I
    .locals 3

    .line 1
    iget-object v0, p0, Ll/kuf;->f:Ll/kuf$d;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget p0, p0, Ll/kuf;->e:I

    .line 6
    .line 7
    return p0

    .line 8
    :cond_0
    iget-object p0, p0, Ll/kuf;->f:Ll/kuf$d;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/kuf$d;->b()F

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    new-instance v0, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    const-string v1, "getFPS: "

    .line 17
    .line 18
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const-string v1, ", "

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    if-ne v1, v2, :cond_1

    .line 38
    .line 39
    const/4 v1, 0x1

    .line 40
    goto :goto_0

    .line 41
    :cond_1
    const/4 v1, 0x0

    .line 42
    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    const-string v1, "FPSMonitor"

    .line 50
    .line 51
    invoke-static {v1, v0}, Ll/esx;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 52
    .line 53
    .line 54
    float-to-int p0, p0

    .line 55
    return p0
.end method

.method public m()V
    .locals 3
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "fps start: , "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    if-ne v1, v2, :cond_0

    .line 17
    .line 18
    const/4 v1, 0x1

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 v1, 0x0

    .line 21
    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const-string v1, "FPSMonitor"

    .line 29
    .line 30
    invoke-static {v1, v0}, Ll/esx;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    sget-object v0, Ll/kuf;->g:Landroid/os/Handler;

    .line 34
    .line 35
    new-instance v1, Ll/kuf$a;

    .line 36
    .line 37
    invoke-direct {v1, p0}, Ll/kuf$a;-><init>(Ll/kuf;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public n()V
    .locals 3
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "fps stop: , "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    if-ne v1, v2, :cond_0

    .line 17
    .line 18
    const/4 v1, 0x1

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 v1, 0x0

    .line 21
    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const-string v1, "FPSMonitor"

    .line 29
    .line 30
    invoke-static {v1, v0}, Ll/esx;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    sget-object v0, Ll/kuf;->g:Landroid/os/Handler;

    .line 34
    .line 35
    new-instance v1, Ll/kuf$b;

    .line 36
    .line 37
    invoke-direct {v1, p0}, Ll/kuf$b;-><init>(Ll/kuf;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 41
    .line 42
    .line 43
    return-void
.end method
