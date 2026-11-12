.class public final Ldqc;
.super Llim;
.source "SourceFile"


# instance fields
.field public final a:Lfs6;

.field public final b:Lj4c;

.field public final c:Lj4c;

.field public final d:Ljs6;

.field public final e:Ljze;

.field public final f:Lrlh;

.field public final g:Lrlh;

.field public final h:Lcw;

.field public i:Z


# direct methods
.method public constructor <init>(Lfs6;Lj4c;Lj4c;Ljs6;Lndc;Lkze;Lw6o;Lj4c;)V
    .registers 14

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ldqc;->a:Lfs6;

    iput-object p2, p0, Ldqc;->b:Lj4c;

    iput-object p3, p0, Ldqc;->c:Lj4c;

    iput-object p4, p0, Ldqc;->d:Ljs6;

    iget-object p4, p1, Lfs6;->d:Ljze;

    iput-object p4, p0, Ldqc;->e:Ljze;

    invoke-static {p4}, Lxf8;->t(Lekc;)Lf99;

    move-result-object p4

    new-instance v0, Lzp6;

    const/16 v1, 0xa

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, p0}, Lzp6;-><init>(BLmt5;Ljava/lang/Object;)V

    invoke-static {p4, v0}, Lma9;->b(Lf99;Lcr9;)Lbs4;

    move-result-object p4

    invoke-interface {p5}, Lndc;->getLifecycle()Ltcc;

    move-result-object v0

    invoke-static {v0}, Lcqp;->V(Ltcc;)Lddc;

    move-result-object v0

    new-instance v1, Lf9k;

    const-wide/16 v3, 0x1388

    invoke-direct {v1, v3, v4}, Lf9k;-><init>(J)V

    sget-object v3, Leqc;->a:Leqc;

    invoke-static {p4, v0, v1, v3}, La26;->o0(Lf99;Lnx5;Lbej;Ljava/lang/Object;)Lrlh;

    move-result-object p4

    iput-object p4, p0, Ldqc;->f:Lrlh;

    invoke-virtual {p8}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Lcs6;

    iget-object p4, p4, Lcs6;->b:Lrlh;

    iput-object p4, p0, Ldqc;->g:Lrlh;

    new-instance p4, Laqc;

    invoke-virtual {p2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcq6;

    invoke-direct {p4, p2}, Laqc;-><init>(Lcq6;)V

    iget-object p1, p1, Lfs6;->f:Ljze;

    invoke-static {p1}, Lxf8;->t(Lekc;)Lf99;

    move-result-object p1

    invoke-virtual {p3}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lvs6;

    iget-object p2, p2, Lvs6;->e:Lqs6;

    iget-object p2, p2, Lqs6;->d:Ligi;

    iget-object p2, p2, Ligi;->b:Ljava/lang/Object;

    check-cast p2, Lkze;

    invoke-static {p2}, Lxf8;->t(Lekc;)Lf99;

    move-result-object p2

    invoke-static {p6}, Lxf8;->t(Lekc;)Lf99;

    move-result-object p3

    iget-object p4, p4, Laqc;->f:Lzyk;

    invoke-virtual {p4}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Lf99;

    iget-object p6, p7, Lw6o;->k:Lc78;

    new-instance p7, Lbqc;

    invoke-direct {p7, p0, v2}, Lbqc;-><init>(Ldqc;Lmt5;)V

    const/4 p8, 0x5

    new-array p8, p8, [Lf99;

    const/4 v0, 0x0

    aput-object p1, p8, v0

    const/4 p1, 0x1

    aput-object p2, p8, p1

    const/4 p1, 0x2

    aput-object p3, p8, p1

    const/4 p1, 0x3

    aput-object p4, p8, p1

    const/4 p1, 0x4

    aput-object p6, p8, p1

    new-instance p1, Lcw;

    const/16 p2, 0x9

    invoke-direct {p1, p8, p7, p2}, Lcw;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object p1, p0, Ldqc;->h:Lcw;

    invoke-interface {p5}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->a(Lmdc;)V

    return-void
.end method


# virtual methods
.method public final W(Lndc;)V
    .registers 6

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-static {p1}, Lcqp;->V(Ltcc;)Lddc;

    move-result-object p1

    new-instance v0, Lcqc;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {v0, p0, v2, v1}, Lcqc;-><init>(Ldqc;Lmt5;B)V

    const/4 v1, 0x3

    invoke-static {p1, v2, v2, v0, v1}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    new-instance v0, Lcqc;

    const/4 v3, 0x1

    invoke-direct {v0, p0, v2, v3}, Lcqc;-><init>(Ldqc;Lmt5;B)V

    invoke-static {p1, v2, v2, v0, v1}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    return-void
.end method

.method public final onPause(Lndc;)V
    .registers 2

    iget-boolean p1, p0, Ldqc;->i:Z

    if-eqz p1, :cond_a

    iget-object p0, p0, Ldqc;->d:Ljs6;

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Ljs6;->c(I)V

    :cond_a
    return-void
.end method

.method public final onResume(Lndc;)V
    .registers 2

    iget-boolean p1, p0, Ldqc;->i:Z

    if-eqz p1, :cond_a

    iget-object p0, p0, Ldqc;->d:Ljs6;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Ljs6;->c(I)V

    :cond_a
    return-void
.end method
