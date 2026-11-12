.class public final Ljk7;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Z

.field public b:J

.field public c:Ljava/lang/Object;

.field public d:Ljava/lang/Object;

.field public final e:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .registers 3

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    sget-object v0, Ld2c;->a:Ld2c;

    const-wide/16 v0, 0x0

    .line 40
    iput-wide v0, p0, Ljk7;->b:J

    const/4 v0, 0x0

    .line 41
    iput-boolean v0, p0, Ljk7;->a:Z

    .line 42
    new-instance v0, Luh4;

    invoke-direct {v0}, Luh4;-><init>()V

    iput-object v0, p0, Ljk7;->e:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ly8j;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ljk7;->e:Ljava/lang/Object;

    sget-object p1, Ll08;->a:Ll08;

    iput-object p1, p0, Ljk7;->c:Ljava/lang/Object;

    sget-object p1, Lc9j;->x:Lcs;

    sget-object v0, Lx7d;->b:Ljava/lang/Object;

    monitor-enter v0

    :try_start_e
    sget-object v1, Lx7d;->c:Ljava/util/concurrent/ExecutorService;

    if-nez v1, :cond_19

    const/4 v1, 0x2

    invoke-static {v1}, Ljava/util/concurrent/Executors;->newFixedThreadPool(I)Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    sput-object v1, Lx7d;->c:Ljava/util/concurrent/ExecutorService;

    :cond_19
    monitor-exit v0
    :try_end_1a
    .catchall {:try_start_e .. :try_end_1a} :catchall_24

    new-instance v0, Lc37;

    invoke-direct {v0, v1, p1}, Lc37;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    iput-object v0, p0, Ljk7;->d:Ljava/lang/Object;

    return-void

    :goto_22
    :try_start_22
    monitor-exit v0
    :try_end_23
    .catchall {:try_start_22 .. :try_end_23} :catchall_24

    throw p0

    :catchall_24
    move-exception p0

    goto :goto_22
.end method
