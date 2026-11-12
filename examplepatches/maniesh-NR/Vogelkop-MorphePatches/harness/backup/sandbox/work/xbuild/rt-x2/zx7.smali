.class public final Lzx7;
.super Lo0g;
.source "SourceFile"


# instance fields
.field public final synthetic i:Lo0g;

.field public final synthetic j:Ljava/util/concurrent/ThreadPoolExecutor;


# direct methods
.method public constructor <init>(Lo0g;Ljava/util/concurrent/ThreadPoolExecutor;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lzx7;->i:Lo0g;

    iput-object p2, p0, Lzx7;->j:Ljava/util/concurrent/ThreadPoolExecutor;

    return-void
.end method


# virtual methods
.method public final t0(Ljava/lang/Throwable;)V
    .registers 3

    iget-object v0, p0, Lzx7;->j:Ljava/util/concurrent/ThreadPoolExecutor;

    :try_start_2
    iget-object p0, p0, Lzx7;->i:Lo0g;

    invoke-virtual {p0, p1}, Lo0g;->t0(Ljava/lang/Throwable;)V
    :try_end_7
    .catchall {:try_start_2 .. :try_end_7} :catchall_b

    invoke-virtual {v0}, Ljava/util/concurrent/ThreadPoolExecutor;->shutdown()V

    return-void

    :catchall_b
    move-exception p0

    invoke-virtual {v0}, Ljava/util/concurrent/ThreadPoolExecutor;->shutdown()V

    throw p0
.end method

.method public final u0(Lcyd;)V
    .registers 3

    iget-object v0, p0, Lzx7;->j:Ljava/util/concurrent/ThreadPoolExecutor;

    :try_start_2
    iget-object p0, p0, Lzx7;->i:Lo0g;

    invoke-virtual {p0, p1}, Lo0g;->u0(Lcyd;)V
    :try_end_7
    .catchall {:try_start_2 .. :try_end_7} :catchall_b

    invoke-virtual {v0}, Ljava/util/concurrent/ThreadPoolExecutor;->shutdown()V

    return-void

    :catchall_b
    move-exception p0

    invoke-virtual {v0}, Ljava/util/concurrent/ThreadPoolExecutor;->shutdown()V

    throw p0
.end method
