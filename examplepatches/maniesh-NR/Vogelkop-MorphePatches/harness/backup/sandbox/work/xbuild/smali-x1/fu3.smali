.class public final Lfu3;
.super Llim;
.source "SourceFile"

# interfaces
.implements Lkg;


# instance fields
.field public final synthetic a:Lcom/opera/android/BrowserActivity;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfu3;->a:Lcom/opera/android/BrowserActivity;

    return-void
.end method


# virtual methods
.method public final R(Leri;Z)V
    .registers 5

    iget-object p0, p0, Lfu3;->a:Lcom/opera/android/BrowserActivity;

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->M:Lgbf;

    const/4 v0, 0x0

    if-nez p0, :cond_8

    move-object p0, v0

    :cond_8
    iget-object v1, p0, Lgbf;->j:Lvbf;

    iput-object p1, v1, Lvbf;->G:Leri;

    invoke-virtual {v1}, Lvbf;->q()V

    if-eqz p2, :cond_3a

    invoke-virtual {v1}, Lvbf;->p()Z

    move-result p1

    if-nez p1, :cond_3a

    iget-object p1, v1, Lvbf;->t:Ltbf;

    iget-object p1, p1, Ltbf;->b:Lypm;

    iget-object p1, p1, Lypm;->g:Lzg;

    if-eqz p1, :cond_35

    iget p1, p1, Lzg;->a:I

    iget-object p0, p0, Lgbf;->t:Lbpd;

    invoke-virtual {p0}, Lbpd;->y()Lupm;

    move-result-object p0

    invoke-interface {p0}, Lupm;->g()Lxbf;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 p2, 0x4

    sget-object v0, Lskk;->b:Lskk;

    invoke-static {p0, v0, p1, p2}, Lxbf;->F(Lxbf;Lj7h;II)V

    return-void

    :cond_35
    sget-object p1, Lhbf;->d:Lhbf;

    invoke-virtual {p0, v0, p1}, Lgbf;->l(Lbsi;Lhbf;)V

    :cond_3a
    return-void
.end method

.method public final W(Lndc;)V
    .registers 3

    iget-object p1, p0, Lfu3;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p1}, Ldx3;->M()Llg;

    move-result-object v0

    iget-object v0, v0, Llg;->a:Ljava/util/ArrayList;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p1}, Ldx3;->M()Llg;

    move-result-object p1

    invoke-virtual {p1}, Llg;->b()Leri;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lfu3;->R(Leri;Z)V

    return-void
.end method

.method public final onDestroy(Lndc;)V
    .registers 2

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    iget-object p1, p0, Lfu3;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p1}, Ldx3;->M()Llg;

    move-result-object p1

    iget-object p1, p1, Llg;->a:Ljava/util/ArrayList;

    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method public final q(Leri;Z)V
    .registers 3

    invoke-virtual {p0, p1, p2}, Lfu3;->R(Leri;Z)V

    return-void
.end method
