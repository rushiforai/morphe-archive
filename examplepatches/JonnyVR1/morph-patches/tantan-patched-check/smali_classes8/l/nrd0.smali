.class public Ll/nrd0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ll/nrd0;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/nrd0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/nrd0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/nrd0;->a:Ll/nrd0;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a()Ll/f2e0;
    .locals 2

    .line 1
    new-instance v0, Lrx/internal/util/RxThreadFactory;

    .line 2
    .line 3
    const-string v1, "RxComputationScheduler-"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lrx/internal/util/RxThreadFactory;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0}, Ll/nrd0;->b(Ljava/util/concurrent/ThreadFactory;)Ll/f2e0;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    return-object v0
.end method

.method public static b(Ljava/util/concurrent/ThreadFactory;)Ll/f2e0;
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    new-instance v0, Ll/z4f;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Ll/z4f;-><init>(Ljava/util/concurrent/ThreadFactory;)V

    .line 6
    .line 7
    .line 8
    return-object v0

    .line 9
    :cond_0
    const-string p0, "threadFactory == null"

    .line 10
    .line 11
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    return-object p0
.end method

.method public static c()Ll/f2e0;
    .locals 2

    .line 1
    new-instance v0, Lrx/internal/util/RxThreadFactory;

    .line 2
    .line 3
    const-string v1, "RxIoScheduler-"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lrx/internal/util/RxThreadFactory;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0}, Ll/nrd0;->d(Ljava/util/concurrent/ThreadFactory;)Ll/f2e0;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    return-object v0
.end method

.method public static d(Ljava/util/concurrent/ThreadFactory;)Ll/f2e0;
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    new-instance v0, Ll/ky3;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Ll/ky3;-><init>(Ljava/util/concurrent/ThreadFactory;)V

    .line 6
    .line 7
    .line 8
    return-object v0

    .line 9
    :cond_0
    const-string p0, "threadFactory == null"

    .line 10
    .line 11
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    return-object p0
.end method

.method public static e()Ll/f2e0;
    .locals 2

    .line 1
    new-instance v0, Lrx/internal/util/RxThreadFactory;

    .line 2
    .line 3
    const-string v1, "RxNewThreadScheduler-"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lrx/internal/util/RxThreadFactory;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0}, Ll/nrd0;->f(Ljava/util/concurrent/ThreadFactory;)Ll/f2e0;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    return-object v0
.end method

.method public static f(Ljava/util/concurrent/ThreadFactory;)Ll/f2e0;
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    new-instance v0, Ll/kj40;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Ll/kj40;-><init>(Ljava/util/concurrent/ThreadFactory;)V

    .line 6
    .line 7
    .line 8
    return-object v0

    .line 9
    :cond_0
    const-string p0, "threadFactory == null"

    .line 10
    .line 11
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    return-object p0
.end method

.method public static h()Ll/nrd0;
    .locals 1

    .line 1
    sget-object v0, Ll/nrd0;->a:Ll/nrd0;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public g()Ll/f2e0;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public i()Ll/f2e0;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public j()Ll/f2e0;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public k(Ll/x20;)Ll/x20;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    return-object p1
.end method
