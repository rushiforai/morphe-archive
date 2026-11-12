.class public final Lmxk;
.super Llim;
.source "SourceFile"

# interfaces
.implements Lywk;


# instance fields
.field public final a:Ldxk;

.field public final b:Lzwk;

.field public final c:Landroid/os/Handler;

.field public final d:Lqlk;


# direct methods
.method public constructor <init>(Ldxk;Lzwk;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lmxk;->c:Landroid/os/Handler;

    iput-object p1, p0, Lmxk;->a:Ldxk;

    iput-object p2, p0, Lmxk;->b:Lzwk;

    new-instance p1, Lqlk;

    const/16 p2, 0xe

    invoke-direct {p1, p0, p2}, Lqlk;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lmxk;->d:Lqlk;

    return-void
.end method


# virtual methods
.method public final G(I)V
    .registers 3

    const/4 v0, 0x2

    if-eq p1, v0, :cond_4

    return-void

    :cond_4
    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lmxk;->R(Z)V

    return-void
.end method

.method public final R(Z)V
    .registers 5

    iget-object v0, p0, Lmxk;->b:Lzwk;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lzwk;->f()Z

    move-result v0

    if-eqz v0, :cond_2f

    sget-object v0, Lcak;->d:Lavj;

    const/4 v0, 0x1

    invoke-static {v0}, Lavj;->b(I)Z

    move-result v0

    if-eqz v0, :cond_1e

    invoke-static {}, LJ/N;->MhJnoDjg()I

    move-result v0

    const/4 v1, 0x3

    if-eq v0, v1, :cond_2f

    const/4 v1, 0x5

    if-eq v0, v1, :cond_2f

    :cond_1e
    iget-object v0, p0, Lmxk;->c:Landroid/os/Handler;

    iget-object p0, p0, Lmxk;->d:Lqlk;

    invoke-virtual {v0, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    if-eqz p1, :cond_2a

    const-wide/16 v1, 0x1388

    goto :goto_2c

    :cond_2a
    const-wide/16 v1, 0x3a98

    :goto_2c
    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_2f
    return-void
.end method

.method public final onPause(Lndc;)V
    .registers 3

    iget-object p1, p0, Lmxk;->c:Landroid/os/Handler;

    iget-object v0, p0, Lmxk;->d:Lqlk;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-object p1, p0, Lmxk;->b:Lzwk;

    invoke-virtual {p1, p0}, Lzwk;->j(Lywk;)V

    return-void
.end method

.method public final onResume(Lndc;)V
    .registers 2

    iget-object p1, p0, Lmxk;->b:Lzwk;

    invoke-virtual {p1, p0}, Lzwk;->a(Lywk;)V

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lmxk;->R(Z)V

    return-void
.end method
