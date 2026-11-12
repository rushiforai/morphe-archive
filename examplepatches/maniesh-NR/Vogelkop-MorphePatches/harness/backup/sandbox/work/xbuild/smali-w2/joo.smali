.class public final Ljoo;
.super Lk8;
.source "SourceFile"

# interfaces
.implements Lioo;


# instance fields
.field public final o:Llxo;

.field public final p:Lw6j;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lchb;Lw6j;Ll45;Luuj;Lp12;Lfio;)V
    .registers 10

    invoke-direct {p0, p5, p6}, Lk8;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    iput-object p3, p0, Ljoo;->p:Lw6j;

    move-object p5, p4

    move-object p4, p3

    move-object p3, p2

    move-object p2, p1

    new-instance p1, Llxo;

    move-object p6, p5

    new-instance p5, Lwzg;

    if-nez p6, :cond_12

    sget-object p6, Ldn;->Co:Lpsp;

    :cond_12
    const/16 v0, 0xf

    const/4 v1, 0x0

    invoke-direct {p5, v0, p0, p6, v1}, Lwzg;-><init>(BLjava/lang/Object;Ljava/lang/Object;Z)V

    const/4 p6, 0x0

    invoke-direct/range {p1 .. p7}, Llxo;-><init>(Landroid/content/Context;Lbzo;Lw6j;Ldn;Lbl;Lfio;)V

    iput-object p1, p0, Ljoo;->o:Llxo;

    return-void
.end method


# virtual methods
.method public final a()Z
    .registers 3

    iget-object v0, p0, Ljoo;->p:Lw6j;

    iget-object v0, v0, Lw6j;->a:Ljava/lang/Object;

    check-cast v0, Ltmo;

    iget-object v0, v0, Li7c;->a:Ljava/lang/Object;

    sget-object v1, Li7c;->c:Ljava/lang/Object;

    if-eq v0, v1, :cond_1a

    iget-object p0, p0, Ljoo;->o:Llxo;

    iget-object p0, p0, Llxo;->p:Ldcl;

    iget-object p0, p0, Ldcl;->a:Ljava/lang/Object;

    check-cast p0, Ldzo;

    iget-boolean p0, p0, Ldzo;->e:Z

    if-eqz p0, :cond_1a

    const/4 p0, 0x1

    return p0

    :cond_1a
    const/4 p0, 0x0

    return p0
.end method

.method public final b()Lbm;
    .registers 2

    iget-object p0, p0, Ljoo;->p:Lw6j;

    iget-object p0, p0, Lw6j;->a:Ljava/lang/Object;

    check-cast p0, Ltmo;

    iget-object p0, p0, Li7c;->a:Ljava/lang/Object;

    sget-object v0, Li7c;->c:Ljava/lang/Object;

    if-eq p0, v0, :cond_e

    const/4 p0, 0x0

    return-object p0

    :cond_e
    sget-object p0, Lbm;->d:Lbm;

    return-object p0
.end method

.method public final p(Lqb7;)V
    .registers 2

    iget-object p0, p0, Ljoo;->o:Llxo;

    iput-object p1, p0, Lk8;->a:Ljava/lang/Object;

    return-void
.end method

.method public final s0(Lcom/opera/ad/interstitial/AdActivity;)Ly9p;
    .registers 4

    iget-object p0, p0, Ljoo;->o:Llxo;

    iget-object v0, p0, Llxo;->r:Ly9p;

    if-nez v0, :cond_38

    :try_start_6
    new-instance v0, Ly9p;

    iget-object v1, p0, Llxo;->p:Ldcl;

    invoke-direct {v0, p1, v1}, Ly9p;-><init>(Landroid/content/Context;Ldcl;)V

    iput-object v0, p0, Llxo;->r:Ly9p;
    :try_end_f
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_6 .. :try_end_f} :catch_30

    iget-object p1, p0, Llxo;->o:Lbzo;

    iput-object p1, v0, Laoo;->i:Lbzo;

    new-instance p1, Ltvk;

    invoke-direct {p1, p0}, Ltvk;-><init>(Ljava/lang/Object;)V

    iput-object p1, v0, Laoo;->e:Lloo;

    iget-object p1, p0, Llxo;->q:Lw6j;

    iget-object v1, p1, Lw6j;->d:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    iput-object v1, v0, Laoo;->h:Ljava/util/ArrayList;

    iget-object v1, p1, Lw6j;->c:Ljava/lang/Object;

    check-cast v1, Loam;

    iput-object v1, v0, Laoo;->r:Loam;

    iget-object p1, p1, Lw6j;->e:Ljava/lang/Object;

    check-cast p1, Lw06;

    invoke-virtual {v0, p1}, Laoo;->l(Lw06;)V

    goto :goto_38

    :catch_30
    new-instance p0, Lzno;

    sget-object p1, Lbm;->g:Lbm;

    invoke-direct {p0, p1}, Lzno;-><init>(Lbm;)V

    throw p0

    :cond_38
    :goto_38
    iget-object p0, p0, Llxo;->r:Ly9p;

    return-object p0
.end method

.method public final v(Lcom/opera/android/BrowserActivity;)V
    .registers 4

    iget-object v0, p0, Ljoo;->o:Llxo;

    iget-object v1, v0, Llxo;->p:Ldcl;

    iget-object v1, v1, Ldcl;->a:Ljava/lang/Object;

    check-cast v1, Ldzo;

    iget-object v1, v1, Ldzo;->c:Lnyo;

    if-nez v1, :cond_18

    iget-object p0, v0, Lk8;->a:Ljava/lang/Object;

    check-cast p0, Lwm;

    if-eqz p0, :cond_17

    sget-object p1, Lbm;->g:Lbm;

    invoke-interface {p0, p1}, Lwm;->d(Lbm;)V

    :cond_17
    return-void

    :cond_18
    invoke-static {p0, p1}, Lcom/opera/ad/interstitial/AdActivity;->b(Lioo;Lcom/opera/android/BrowserActivity;)V

    return-void
.end method
