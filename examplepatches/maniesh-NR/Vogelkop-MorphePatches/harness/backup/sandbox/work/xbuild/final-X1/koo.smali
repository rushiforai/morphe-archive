.class public final Lkoo;
.super Lk8;
.source "SourceFile"

# interfaces
.implements Lioo;
.implements Lecn;


# instance fields
.field public final o:Lnxo;

.field public p:Lqb7;


# direct methods
.method public constructor <init>(Lnxo;Luuj;)V
    .registers 4

    const/4 v0, 0x0

    invoke-direct {p0, p2, v0}, Lk8;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    iput-object p1, p0, Lkoo;->o:Lnxo;

    return-void
.end method


# virtual methods
.method public final a(Z)V
    .registers 3

    iget-object v0, p0, Lkoo;->o:Lnxo;

    if-eqz p1, :cond_8

    invoke-virtual {v0}, Lnxo;->e()V

    goto :goto_b

    :cond_8
    invoke-virtual {v0}, Lnxo;->h()V

    :goto_b
    iget-object p0, p0, Lkoo;->p:Lqb7;

    if-eqz p0, :cond_1c

    iget-object v0, p0, Lqb7;->b:Ljava/lang/Object;

    check-cast v0, Lj10;

    iget-object v0, v0, Lj10;->a:Lyl;

    iget-object p0, p0, Lqb7;->c:Ljava/lang/Object;

    check-cast p0, Lyz;

    invoke-virtual {v0, p0, p1}, Ln1;->n(Lyz;Z)V

    :cond_1c
    return-void
.end method

.method public final a()Z
    .registers 1

    .line 29
    iget-object p0, p0, Lkoo;->o:Lnxo;

    invoke-virtual {p0}, Lnxo;->d()Z

    move-result p0

    return p0
.end method

.method public final b()Lbm;
    .registers 1

    iget-object p0, p0, Lkoo;->o:Lnxo;

    iget-object p0, p0, Lnxo;->l:Lbm;

    return-object p0
.end method

.method public final p(Lqb7;)V
    .registers 2

    iput-object p1, p0, Lkoo;->p:Lqb7;

    iget-object p0, p0, Lkoo;->o:Lnxo;

    iget-object p0, p0, Lnxo;->g:Lfzo;

    if-eqz p0, :cond_a

    iput-object p1, p0, Lk8;->a:Ljava/lang/Object;

    :cond_a
    return-void
.end method

.method public final v(Lcom/opera/android/BrowserActivity;)V
    .registers 2

    invoke-static {p0, p1}, Lcom/opera/ad/interstitial/AdActivity;->b(Lioo;Lcom/opera/android/BrowserActivity;)V

    return-void
.end method
