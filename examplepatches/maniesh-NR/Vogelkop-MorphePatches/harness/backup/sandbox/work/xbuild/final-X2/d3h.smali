.class public final Ld3h;
.super Lmqk;
.source "SourceFile"


# instance fields
.field public final j:Lplh;

.field public k:Z


# direct methods
.method public constructor <init>(Lcom/opera/android/settings/SettingsManager;Liv7;Lqde;Lndc;Lnqi;Lplh;)V
    .registers 15

    sget-object v1, Lkqk;->h:Lkqk;

    const-string v2, "enable_product_suggestion"

    move-object v0, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    move-object v7, p5

    invoke-direct/range {v0 .. v7}, Lmqk;-><init>(Lkqk;Ljava/lang/String;Lcom/opera/android/settings/SettingsManager;Liv7;Likc;Lndc;Lkotlin/jvm/functions/Function2;)V

    iput-object p6, v0, Ld3h;->j:Lplh;

    return-void
.end method


# virtual methods
.method public final a()Z
    .registers 2

    invoke-super {p0}, Lmqk;->a()Z

    move-result v0

    if-eqz v0, :cond_c

    iget-boolean p0, p0, Ld3h;->k:Z

    if-eqz p0, :cond_c

    const/4 p0, 0x1

    return p0

    :cond_c
    const/4 p0, 0x0

    return p0
.end method

.method public final d()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final f()V
    .registers 6

    invoke-super {p0}, Lmqk;->f()V

    iget-object v0, p0, Lmqk;->f:Lndc;

    invoke-interface {v0}, Lndc;->getLifecycle()Ltcc;

    move-result-object v1

    iget-object v2, p0, Ld3h;->j:Lplh;

    invoke-static {v2, v1}, Lscd;->D(Lf99;Ltcc;)Lj94;

    move-result-object v1

    invoke-interface {v0}, Lndc;->getLifecycle()Ltcc;

    move-result-object v0

    invoke-static {v0}, Lcqp;->V(Ltcc;)Lddc;

    move-result-object v0

    new-instance v2, Lfb9;

    const/16 v3, 0x13

    const/4 v4, 0x0

    invoke-direct {v2, v3, v4, p0}, Lfb9;-><init>(BLmt5;Ljava/lang/Object;)V

    invoke-static {v1, v0, v2}, Lw7d;->i(Lf99;Lnx5;Lkotlin/jvm/functions/Function2;)Ld3k;

    return-void
.end method
