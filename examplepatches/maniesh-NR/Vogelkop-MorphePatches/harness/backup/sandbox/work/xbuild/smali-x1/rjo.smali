.class public final Lrjo;
.super Ln1;
.source "SourceFile"


# instance fields
.field public c:Loji;

.field public final d:Llro;


# direct methods
.method public constructor <init>(Lcom/opera/ad/interstitial/AdActivity;Llro;)V
    .registers 4

    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Ln1;-><init>(Ljava/lang/Object;B)V

    iput-object p2, p0, Lrjo;->d:Llro;

    return-void
.end method


# virtual methods
.method public final R()V
    .registers 6

    iget-object v0, p0, Ln1;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/ad/interstitial/AdActivity;

    iget-object v1, p0, Lrjo;->d:Llro;

    iget v2, v1, Llro;->p:I

    invoke-virtual {v0, v2}, Landroid/app/Activity;->setContentView(I)V

    iget-object v2, v1, Lk8;->a:Ljava/lang/Object;

    check-cast v2, Luuj;

    sget-object v3, Lvgo;->a:[I

    iget-object v4, v2, Luuj;->b:Ljava/lang/Object;

    check-cast v4, Lahb;

    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    move-result v4

    aget v3, v3, v4

    const/4 v4, 0x1

    if-eq v3, v4, :cond_2e

    const/4 v4, 0x2

    if-eq v3, v4, :cond_2a

    const/4 v4, 0x3

    if-ne v3, v4, :cond_32

    const v3, 0x7f0a0ad6

    :goto_27
    iput v3, v2, Luuj;->a:I

    goto :goto_32

    :cond_2a
    const v3, 0x7f0a0907

    goto :goto_27

    :cond_2e
    const v3, 0x7f0a0a82

    goto :goto_27

    :cond_32
    :goto_32
    new-instance v3, Ldgo;

    const/4 v4, 0x0

    invoke-direct {v3, p0, v4}, Ldgo;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v2, v0, v3}, Luuj;->d(Lcom/opera/ad/interstitial/AdActivity;Lg94;)Loji;

    move-result-object v2

    iput-object v2, p0, Lrjo;->c:Loji;

    invoke-virtual {v1, v0}, Llro;->t0(Landroid/app/Activity;)V

    return-void
.end method

.method public final X()V
    .registers 1

    iget-object p0, p0, Lrjo;->d:Llro;

    iget-object p0, p0, Llro;->v:Lnoo;

    if-eqz p0, :cond_9

    invoke-virtual {p0}, Lsc;->a()V

    :cond_9
    return-void
.end method

.method public final c0()V
    .registers 2

    iget-object p0, p0, Lrjo;->c:Loji;

    if-eqz p0, :cond_11

    iget-object p0, p0, Loji;->a:Ljava/lang/Object;

    check-cast p0, Lbx7;

    iget-object p0, p0, Lbx7;->b:Ljava/lang/Object;

    check-cast p0, Lttn;

    sget-object v0, Lgxo;->d:Landroid/os/Handler;

    invoke-virtual {v0, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    :cond_11
    return-void
.end method

.method public final e0()V
    .registers 1

    iget-object p0, p0, Lrjo;->c:Loji;

    if-eqz p0, :cond_b

    iget-object p0, p0, Loji;->a:Ljava/lang/Object;

    check-cast p0, Lbx7;

    invoke-virtual {p0}, Lbx7;->c()V

    :cond_b
    return-void
.end method
