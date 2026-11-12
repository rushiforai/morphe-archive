.class public final Ls2i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lr82;


# instance fields
.field public final a:Ly3i;

.field public final b:Lddc;

.field public c:Ld3k;

.field public final d:J


# direct methods
.method public constructor <init>(Ly3i;Lddc;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ls2i;->a:Ly3i;

    iput-object p2, p0, Ls2i;->b:Lddc;

    sget-object p1, Lpn7;->b:Lon7;

    const/16 p1, 0xa

    sget-object p2, Lun7;->e:Lun7;

    invoke-static {p1, p2}, Lcs5;->x0(ILun7;)J

    move-result-wide p1

    iput-wide p1, p0, Ls2i;->d:J

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 5

    new-instance v0, Lagb;

    const/16 v1, 0x13

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, p0}, Lagb;-><init>(BLmt5;Ljava/lang/Object;)V

    const/4 v1, 0x3

    iget-object v3, p0, Ls2i;->b:Lddc;

    invoke-static {v3, v2, v2, v0, v1}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    move-result-object v0

    iput-object v0, p0, Ls2i;->c:Ld3k;

    return-void
.end method

.method public final b(ZZ)V
    .registers 3

    return-void
.end method

.method public final c(I)V
    .registers 2

    return-void
.end method

.method public final d(Lg82;Llqm;Z)V
    .registers 4

    iget-object p0, p0, Ls2i;->a:Ly3i;

    sget-object p1, Lzff;->a:Lzff;

    invoke-interface {p0, p1}, Ly3i;->n(Lz1e;)V

    return-void
.end method

.method public final e()V
    .registers 3

    iget-object v0, p0, Ls2i;->c:Ld3k;

    const/4 v1, 0x0

    if-eqz v0, :cond_8

    invoke-virtual {v0, v1}, Lxob;->k(Ljava/util/concurrent/CancellationException;)V

    :cond_8
    iput-object v1, p0, Ls2i;->c:Ld3k;

    return-void
.end method
