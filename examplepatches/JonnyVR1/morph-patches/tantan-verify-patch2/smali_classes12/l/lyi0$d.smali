.class final Ll/lyi0$d;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/lyi0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "d"
.end annotation


# instance fields
.field private a:Ll/l510;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private final b:I

.field private final c:I

.field private final d:I

.field private final e:J

.field private final f:Ljava/util/concurrent/TimeUnit;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(IIIJLjava/util/concurrent/TimeUnit;)V
    .locals 1
    .param p6    # Ljava/util/concurrent/TimeUnit;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/lyi0$d;->a:Ll/l510;

    .line 6
    .line 7
    iput p1, p0, Ll/lyi0$d;->b:I

    .line 8
    .line 9
    iput p2, p0, Ll/lyi0$d;->c:I

    .line 10
    .line 11
    iput p3, p0, Ll/lyi0$d;->d:I

    .line 12
    .line 13
    iput-wide p4, p0, Ll/lyi0$d;->e:J

    .line 14
    .line 15
    iput-object p6, p0, Ll/lyi0$d;->f:Ljava/util/concurrent/TimeUnit;

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public declared-synchronized a()Ll/l510;
    .locals 12
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    const-string v0, "MME"

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    iget-object v1, p0, Ll/lyi0$d;->a:Ll/l510;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    new-instance v2, Ll/l510;

    .line 9
    .line 10
    new-instance v1, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iget v0, p0, Ll/lyi0$d;->b:I

    .line 16
    .line 17
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    iget v4, p0, Ll/lyi0$d;->c:I

    .line 25
    .line 26
    iget v5, p0, Ll/lyi0$d;->d:I

    .line 27
    .line 28
    iget-wide v6, p0, Ll/lyi0$d;->e:J

    .line 29
    .line 30
    iget-object v8, p0, Ll/lyi0$d;->f:Ljava/util/concurrent/TimeUnit;

    .line 31
    .line 32
    new-instance v9, Ljava/util/concurrent/LinkedBlockingQueue;

    .line 33
    .line 34
    invoke-direct {v9}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    .line 35
    .line 36
    .line 37
    new-instance v10, Ll/lyi0$c;

    .line 38
    .line 39
    iget v0, p0, Ll/lyi0$d;->b:I

    .line 40
    .line 41
    invoke-direct {v10, v0}, Ll/lyi0$c;-><init>(I)V

    .line 42
    .line 43
    .line 44
    new-instance v11, Ll/lyi0$e;

    .line 45
    .line 46
    const/4 v0, 0x0

    .line 47
    invoke-direct {v11, v0}, Ll/lyi0$e;-><init>(Ll/lyi0$a;)V

    .line 48
    .line 49
    .line 50
    invoke-direct/range {v2 .. v11}, Ll/l510;-><init>(Ljava/lang/String;IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;Ljava/util/concurrent/RejectedExecutionHandler;)V

    .line 51
    .line 52
    .line 53
    iput-object v2, p0, Ll/lyi0$d;->a:Ll/l510;

    .line 54
    .line 55
    const/4 v0, 0x1

    .line 56
    invoke-virtual {v2, v0}, Ljava/util/concurrent/ThreadPoolExecutor;->allowCoreThreadTimeOut(Z)V

    .line 57
    .line 58
    .line 59
    goto :goto_0

    .line 60
    :catchall_0
    move-exception v0

    .line 61
    goto :goto_1

    .line 62
    :cond_0
    :goto_0
    iget-object v0, p0, Ll/lyi0$d;->a:Ll/l510;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 63
    .line 64
    monitor-exit p0

    .line 65
    return-object v0

    .line 66
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 67
    throw v0
.end method
