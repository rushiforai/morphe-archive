.class public final Lk3k;
.super Ldbh;
.source "SourceFile"


# instance fields
.field public final a:Lbqo;


# direct methods
.method public constructor <init>(Lbqo;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lk3k;->a:Lbqo;

    return-void
.end method


# virtual methods
.method public final d()V
    .registers 3

    iget-object p0, p0, Lk3k;->a:Lbqo;

    if-eqz p0, :cond_10

    iget-object v0, p0, Lbqo;->d:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x1

    :try_start_8
    iput-boolean v1, p0, Lbqo;->c:Z

    monitor-exit v0

    return-void

    :goto_c
    monitor-exit v0
    :try_end_d
    .catchall {:try_start_8 .. :try_end_d} :catchall_e

    throw p0

    :catchall_e
    move-exception p0

    goto :goto_c

    :cond_10
    return-void
.end method

.method public final g()Z
    .registers 2

    iget-object p0, p0, Lk3k;->a:Lbqo;

    if-eqz p0, :cond_11

    iget-object v0, p0, Lbqo;->d:Ljava/lang/Object;

    monitor-enter v0

    :try_start_7
    iget-boolean p0, p0, Lbqo;->c:Z

    xor-int/lit8 p0, p0, 0x1

    monitor-exit v0

    return p0

    :goto_d
    monitor-exit v0
    :try_end_e
    .catchall {:try_start_7 .. :try_end_e} :catchall_f

    throw p0

    :catchall_f
    move-exception p0

    goto :goto_d

    :cond_11
    const/4 p0, 0x0

    return p0
.end method
