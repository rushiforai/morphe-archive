.class public Ll/ioh0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/ioh0$b;,
        Ll/ioh0$c;
    }
.end annotation


# instance fields
.field private final a:Ljava/lang/Object;

.field private b:Z

.field private c:Z

.field private d:Ll/ioh0$c;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/lang/Object;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/ioh0;->a:Ljava/lang/Object;

    .line 10
    .line 11
    const/4 p1, 0x1

    .line 12
    iput-boolean p1, p0, Ll/ioh0;->b:Z

    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    iput-boolean p1, p0, Ll/ioh0;->c:Z

    .line 16
    .line 17
    return-void
.end method

.method public static synthetic a(Ll/ioh0;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ioh0;->c(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Ll/ioh0;)Ll/ioh0$c;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ioh0;->d:Ll/ioh0$c;

    .line 2
    .line 3
    return-object p0
.end method

.method private c(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ioh0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    const/4 v1, 0x0

    .line 5
    :try_start_0
    iput-boolean v1, p0, Ll/ioh0;->b:Z

    .line 6
    .line 7
    iput-boolean p1, p0, Ll/ioh0;->c:Z

    .line 8
    .line 9
    iget-object p0, p0, Ll/ioh0;->a:Ljava/lang/Object;

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    .line 12
    .line 13
    .line 14
    monitor-exit v0

    .line 15
    return-void

    .line 16
    :catchall_0
    move-exception p0

    .line 17
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18
    throw p0
.end method


# virtual methods
.method public d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ll/ioh0$b;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 1
    const/4 p3, 0x1

    .line 2
    iput-boolean p3, p0, Ll/ioh0;->b:Z

    .line 3
    .line 4
    const/4 p3, 0x0

    .line 5
    iput-boolean p3, p0, Ll/ioh0;->c:Z

    .line 6
    .line 7
    new-instance p3, Ll/ioh0$b;

    .line 8
    .line 9
    invoke-direct {p3}, Ll/ioh0$b;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string v0, "SDKResource"

    .line 13
    .line 14
    const-string v1, "start download %s"

    .line 15
    .line 16
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-static {v0, v1, v2}, Lcom/immomo/resdownloader/log/MLog;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    invoke-static {}, Ll/eae;->d()Ll/eae;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Ll/ioh0$a;

    .line 28
    .line 29
    invoke-direct {v1, p0, p1, p3}, Ll/ioh0$a;-><init>(Ll/ioh0;Ljava/lang/String;Ll/ioh0$b;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, p1, p2, v1}, Ll/eae;->c(Ljava/lang/String;Ljava/lang/String;Ll/eae$b;)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Ll/ioh0;->a:Ljava/lang/Object;

    .line 36
    .line 37
    monitor-enter p1

    .line 38
    :goto_0
    :try_start_0
    iget-boolean p2, p0, Ll/ioh0;->b:Z

    .line 39
    .line 40
    if-eqz p2, :cond_0

    .line 41
    .line 42
    iget-object p2, p0, Ll/ioh0;->a:Ljava/lang/Object;

    .line 43
    .line 44
    invoke-virtual {p2}, Ljava/lang/Object;->wait()V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :catchall_0
    move-exception p0

    .line 49
    goto :goto_1

    .line 50
    :cond_0
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 51
    iget-boolean p0, p0, Ll/ioh0;->c:Z

    .line 52
    .line 53
    iput-boolean p0, p3, Ll/ioh0$b;->a:Z

    .line 54
    .line 55
    const-string p0, "\u4e0b\u8f7d\u5f02\u5e38"

    .line 56
    .line 57
    iput-object p0, p3, Ll/ioh0$b;->c:Ljava/lang/String;

    .line 58
    .line 59
    return-object p3

    .line 60
    :goto_1
    :try_start_1
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 61
    throw p0
.end method

.method public e(Ll/ioh0$c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ioh0;->d:Ll/ioh0$c;

    .line 2
    .line 3
    return-void
.end method
