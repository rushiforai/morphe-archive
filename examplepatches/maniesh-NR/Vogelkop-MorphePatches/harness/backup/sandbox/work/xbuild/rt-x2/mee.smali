.class public final Lmee;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final b:Lmee;


# instance fields
.field public final a:Ljava/util/concurrent/atomic/AtomicReference;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lmee;

    invoke-direct {v0}, Lmee;-><init>()V

    sput-object v0, Lmee;->b:Lmee;

    return-void
.end method

.method public constructor <init>()V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    new-instance v1, Lyqa;

    const/16 v2, 0x1b

    invoke-direct {v1, v2}, Lyqa;-><init>(B)V

    new-instance v2, Lbyg;

    invoke-direct {v2, v1}, Lbyg;-><init>(Lyqa;)V

    invoke-direct {v0, v2}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lmee;->a:Ljava/util/concurrent/atomic/AtomicReference;

    return-void
.end method


# virtual methods
.method public final declared-synchronized a(Lvxg;)V
    .registers 4

    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lmee;->a:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lbyg;

    new-instance v1, Lyqa;

    invoke-direct {v1, v0}, Lyqa;-><init>(Lbyg;)V

    invoke-virtual {v1, p1}, Lyqa;->o(Lvxg;)V

    new-instance p1, Lbyg;

    invoke-direct {p1, v1}, Lbyg;-><init>(Lyqa;)V

    iget-object v0, p0, Lmee;->a:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V
    :try_end_1b
    .catchall {:try_start_1 .. :try_end_1b} :catchall_1f

    monitor-exit p0

    return-void

    :goto_1d
    :try_start_1d
    monitor-exit p0
    :try_end_1e
    .catchall {:try_start_1d .. :try_end_1e} :catchall_1f

    throw p1

    :catchall_1f
    move-exception p1

    goto :goto_1d
.end method

.method public final declared-synchronized b(Le20;)V
    .registers 4

    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lmee;->a:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lbyg;

    new-instance v1, Lyqa;

    invoke-direct {v1, v0}, Lyqa;-><init>(Lbyg;)V

    invoke-virtual {v1, p1}, Lyqa;->p(Le20;)V

    new-instance p1, Lbyg;

    invoke-direct {p1, v1}, Lbyg;-><init>(Lyqa;)V

    iget-object v0, p0, Lmee;->a:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V
    :try_end_1b
    .catchall {:try_start_1 .. :try_end_1b} :catchall_1f

    monitor-exit p0

    return-void

    :goto_1d
    :try_start_1d
    monitor-exit p0
    :try_end_1e
    .catchall {:try_start_1d .. :try_end_1e} :catchall_1f

    throw p1

    :catchall_1f
    move-exception p1

    goto :goto_1d
.end method
