.class public final Landroidx/emoji2/text/f;
.super LD/g;
.source "SourceFile"


# instance fields
.field public final synthetic o:Landroidx/emoji2/text/g;


# direct methods
.method public constructor <init>(Landroidx/emoji2/text/g;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/emoji2/text/f;->o:Landroidx/emoji2/text/g;

    return-void
.end method


# virtual methods
.method public final E(Ljava/lang/Throwable;)V
    .locals 1

    iget-object v0, p0, Landroidx/emoji2/text/f;->o:Landroidx/emoji2/text/g;

    iget-object v0, v0, Landroidx/emoji2/text/g;->a:Landroidx/emoji2/text/k;

    invoke-virtual {v0, p1}, Landroidx/emoji2/text/k;->d(Ljava/lang/Throwable;)V

    return-void
.end method

.method public final F(LQ/t;)V
    .locals 6

    iget-object v0, p0, Landroidx/emoji2/text/f;->o:Landroidx/emoji2/text/g;

    iput-object p1, v0, Landroidx/emoji2/text/g;->c:LQ/t;

    new-instance p1, LC/h;

    iget-object v1, v0, Landroidx/emoji2/text/g;->c:LQ/t;

    iget-object v2, v0, Landroidx/emoji2/text/g;->a:Landroidx/emoji2/text/k;

    iget-object v3, v2, Landroidx/emoji2/text/k;->g:LF/d;

    iget-object v2, v2, Landroidx/emoji2/text/k;->i:Landroidx/emoji2/text/e;

    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x22

    if-lt v4, v5, :cond_0

    invoke-static {}, Landroidx/emoji2/text/o;->a()Ljava/util/Set;

    move-result-object v4

    goto :goto_0

    :cond_0
    invoke-static {}, LD/g;->t()Ljava/util/Set;

    move-result-object v4

    :goto_0
    invoke-direct {p1, v1, v3, v2, v4}, LC/h;-><init>(LQ/t;LF/d;Landroidx/emoji2/text/e;Ljava/util/Set;)V

    iput-object p1, v0, Landroidx/emoji2/text/g;->b:LC/h;

    iget-object p1, v0, Landroidx/emoji2/text/g;->a:Landroidx/emoji2/text/k;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p1, Landroidx/emoji2/text/k;->a:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V

    const/4 v1, 0x1

    :try_start_0
    iput v1, p1, Landroidx/emoji2/text/k;->c:I

    iget-object v1, p1, Landroidx/emoji2/text/k;->b:Ll/c;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    iget-object v1, p1, Landroidx/emoji2/text/k;->b:Ll/c;

    invoke-virtual {v1}, Ll/c;->clear()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v1, p1, Landroidx/emoji2/text/k;->a:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    iget-object v1, p1, Landroidx/emoji2/text/k;->d:Landroid/os/Handler;

    new-instance v2, Landroidx/emoji2/text/i;

    iget p1, p1, Landroidx/emoji2/text/k;->c:I

    const/4 v3, 0x0

    invoke-direct {v2, v0, p1, v3}, Landroidx/emoji2/text/i;-><init>(Ljava/util/List;ILjava/lang/Throwable;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    :catchall_0
    move-exception v0

    iget-object p1, p1, Landroidx/emoji2/text/k;->a:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {p1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method
