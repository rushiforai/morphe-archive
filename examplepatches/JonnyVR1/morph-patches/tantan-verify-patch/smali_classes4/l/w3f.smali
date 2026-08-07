.class public Ll/w3f;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final e:Ljava/util/concurrent/ExecutorService;


# instance fields
.field a:Z

.field b:Ljava/util/concurrent/ExecutorService;

.field c:Ll/wzv;

.field d:Ll/qsw;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Ljava/util/concurrent/Executors;->newCachedThreadPool()Ljava/util/concurrent/ExecutorService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Ll/w3f;->e:Ljava/util/concurrent/ExecutorService;

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Ll/w3f;->a:Z

    .line 6
    .line 7
    sget-object v0, Ll/w3f;->e:Ljava/util/concurrent/ExecutorService;

    .line 8
    .line 9
    iput-object v0, p0, Ll/w3f;->b:Ljava/util/concurrent/ExecutorService;

    .line 10
    .line 11
    return-void
.end method

.method public static a()Ljava/lang/Object;
    .locals 1

    .line 1
    :try_start_0
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 2
    .line 3
    .line 4
    move-result-object v0
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    return-object v0

    .line 6
    :catch_0
    const/4 v0, 0x0

    .line 7
    return-object v0
.end method


# virtual methods
.method public b()Ll/wzv;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w3f;->c:Ll/wzv;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    invoke-static {}, Ll/wzv$a;->a()Ll/wzv;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public c()Ll/qsw;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/w3f;->d:Ll/qsw;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    invoke-static {}, Ll/zn0;->c()Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    const/4 v0, 0x0

    .line 11
    if-eqz p0, :cond_2

    .line 12
    .line 13
    invoke-static {}, Ll/w3f;->a()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    if-nez p0, :cond_1

    .line 18
    .line 19
    return-object v0

    .line 20
    :cond_1
    new-instance v0, Ll/qsw$a;

    .line 21
    .line 22
    check-cast p0, Landroid/os/Looper;

    .line 23
    .line 24
    invoke-direct {v0, p0}, Ll/qsw$a;-><init>(Landroid/os/Looper;)V

    .line 25
    .line 26
    .line 27
    :cond_2
    return-object v0
.end method
