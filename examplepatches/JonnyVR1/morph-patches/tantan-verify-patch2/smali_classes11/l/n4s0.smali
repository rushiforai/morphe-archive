.class public final Ll/n4s0;
.super Ll/x5s0;
.source "SourceFile"


# static fields
.field public static final j:Ll/y5s0;


# instance fields
.field public final i:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/y5s0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/y5s0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/n4s0;->j:Ll/y5s0;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Ll/b4s0;Ljava/lang/String;Ljava/lang/String;Ll/fzr0;IILandroid/content/Context;)V
    .locals 0

    .line 1
    const-string p3, "69psxaRqrIVZzPpt4pN0wGmA/kc6O8gjOJlblyEzW1E="

    .line 2
    .line 3
    const/16 p6, 0x1d

    .line 4
    .line 5
    const-string p2, "F0+pSvx9GtXcjR12oFzzp5apK08MRky74IYez805WxvZBZTjFs672zxMax8w5kp9"

    .line 6
    .line 7
    invoke-direct/range {p0 .. p6}, Ll/x5s0;-><init>(Ll/b4s0;Ljava/lang/String;Ljava/lang/String;Ll/fzr0;II)V

    .line 8
    .line 9
    .line 10
    iput-object p7, p0, Ll/n4s0;->i:Landroid/content/Context;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/x5s0;->e:Ll/fzr0;

    .line 2
    .line 3
    const-string v1, "E"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/fzr0;->o0(Ljava/lang/String;)Ll/fzr0;

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/n4s0;->i:Landroid/content/Context;

    .line 9
    .line 10
    sget-object v1, Ll/n4s0;->j:Ll/y5s0;

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v1, v0}, Ll/y5s0;->a(Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicReference;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    if-nez v1, :cond_1

    .line 25
    .line 26
    monitor-enter v0

    .line 27
    :try_start_0
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    if-nez v1, :cond_0

    .line 32
    .line 33
    iget-object v1, p0, Ll/x5s0;->f:Ljava/lang/reflect/Method;

    .line 34
    .line 35
    iget-object v2, p0, Ll/n4s0;->i:Landroid/content/Context;

    .line 36
    .line 37
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    const/4 v3, 0x0

    .line 42
    invoke-virtual {v1, v3, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    check-cast v1, Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :catchall_0
    move-exception p0

    .line 53
    goto :goto_1

    .line 54
    :cond_0
    :goto_0
    monitor-exit v0

    .line 55
    goto :goto_2

    .line 56
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 57
    throw p0

    .line 58
    :cond_1
    :goto_2
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    check-cast v0, Ljava/lang/String;

    .line 63
    .line 64
    iget-object v1, p0, Ll/x5s0;->e:Ll/fzr0;

    .line 65
    .line 66
    monitor-enter v1

    .line 67
    :try_start_1
    iget-object p0, p0, Ll/x5s0;->e:Ll/fzr0;

    .line 68
    .line 69
    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    const/4 v2, 0x1

    .line 74
    invoke-static {v0, v2}, Ll/o0s0;->a([BZ)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-virtual {p0, v0}, Ll/fzr0;->o0(Ljava/lang/String;)Ll/fzr0;

    .line 79
    .line 80
    .line 81
    monitor-exit v1

    .line 82
    return-void

    .line 83
    :catchall_1
    move-exception p0

    .line 84
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 85
    throw p0
.end method
