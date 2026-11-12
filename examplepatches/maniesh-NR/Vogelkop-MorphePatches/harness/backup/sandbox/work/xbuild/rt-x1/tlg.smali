.class public final Ltlg;
.super Llim;
.source "SourceFile"


# instance fields
.field public final a:Lnr8;

.field public final b:Lcom/opera/android/settings/SettingsManager;

.field public final c:Le8k;

.field public final d:Lu59;

.field public final e:Lmdh;

.field public final f:Lu8k;

.field public final g:Lkze;

.field public final h:Lkze;

.field public final i:Lkze;

.field public final j:Lwq8;

.field public final k:Ls9;

.field public l:Z


# direct methods
.method public constructor <init>(Lnr8;Lcom/opera/android/settings/SettingsManager;Le8k;Lu59;Lmdh;Lu8k;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ltlg;->a:Lnr8;

    iput-object p2, p0, Ltlg;->b:Lcom/opera/android/settings/SettingsManager;

    iput-object p3, p0, Ltlg;->c:Le8k;

    iput-object p4, p0, Ltlg;->d:Lu59;

    iput-object p5, p0, Ltlg;->e:Lmdh;

    iput-object p6, p0, Ltlg;->f:Lu8k;

    new-instance p1, Lkze;

    sget-object p2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-direct {p1, p2}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Ltlg;->g:Lkze;

    new-instance p1, Lkze;

    sget-object p2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-direct {p1, p2}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Ltlg;->h:Lkze;

    new-instance p1, Lkze;

    invoke-virtual {p6}, Lu8k;->b()Lt8k;

    sget-object p2, Lpzj;->b:Lpzj;

    invoke-direct {p1, p2}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Ltlg;->i:Lkze;

    new-instance p1, Lwq8;

    const/4 p2, 0x1

    invoke-direct {p1, p0, p2}, Lwq8;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Ltlg;->j:Lwq8;

    new-instance p1, Ls9;

    const/16 p2, 0x1d

    invoke-direct {p1, p0, p2}, Ls9;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Ltlg;->k:Ls9;

    return-void
.end method


# virtual methods
.method public final R()V
    .registers 9

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object v2, p0, Ltlg;->d:Lu59;

    invoke-virtual {v2}, Lu59;->H()Lt59;

    move-result-object v2

    iget-wide v2, v2, Lt59;->b:J

    sub-long/2addr v0, v2

    sget-object v2, Lpn7;->b:Lon7;

    iget-object v2, p0, Ltlg;->c:Le8k;

    iget-object v3, v2, Le8k;->d:Lkze;

    invoke-virtual {v3}, Lekc;->g()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Number;

    invoke-virtual {v3}, Ljava/lang/Number;->intValue()I

    move-result v3

    sget-object v4, Lun7;->g:Lun7;

    invoke-static {v3, v4}, Lcs5;->x0(ILun7;)J

    move-result-wide v3

    invoke-static {v3, v4}, Lpn7;->f(J)J

    move-result-wide v3

    const-wide/16 v5, 0x0

    cmp-long v7, v3, v5

    if-lez v7, :cond_35

    cmp-long v5, v5, v0

    if-gtz v5, :cond_35

    cmp-long v0, v0, v3

    if-lez v0, :cond_45

    :cond_35
    iget-object v0, v2, Le8k;->e:Lkze;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_45

    const/4 v0, 0x1

    goto :goto_46

    :cond_45
    const/4 v0, 0x0

    :goto_46
    iget-object p0, p0, Ltlg;->b:Lcom/opera/android/settings/SettingsManager;

    const-string v1, "speed_dial.plus_button"

    invoke-virtual {p0, v0, v1}, Lcom/opera/android/settings/SettingsManager;->R(ILjava/lang/String;)V

    return-void
.end method

.method public final S()V
    .registers 4

    iget-object v0, p0, Ltlg;->c:Le8k;

    iget-object v0, v0, Le8k;->f:Lkze;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_3c

    iget-boolean v0, p0, Ltlg;->l:Z

    if-eqz v0, :cond_3c

    iget-object v0, p0, Ltlg;->a:Lnr8;

    check-cast v0, Lcom/opera/android/favorites/e;

    iget-object v0, v0, Lcom/opera/android/favorites/e;->f:Lcom/opera/android/favorites/b;

    iget-object v0, v0, Ltq8;->e:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-gtz v0, :cond_3c

    iget-object v0, p0, Ltlg;->e:Lmdh;

    iget-object v0, v0, Lmdh;->h:Lh42;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    if-eqz v0, :cond_38

    check-cast v0, Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    xor-int/2addr v0, v2

    goto :goto_39

    :cond_38
    move v0, v1

    :goto_39
    if-eqz v0, :cond_3c

    move v1, v2

    :cond_3c
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iget-object v1, p0, Ltlg;->g:Lkze;

    invoke-virtual {v1, v0}, Lekc;->r(Ljava/lang/Object;)V

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    xor-int/2addr v0, v2

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iget-object p0, p0, Ltlg;->h:Lkze;

    invoke-virtual {p0, v0}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method

.method public final W(Lndc;)V
    .registers 7

    new-instance v0, Lq2g;

    const/4 v1, 0x5

    invoke-direct {v0, p0, p1, v1}, Lq2g;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v1, p0, Ltlg;->a:Lnr8;

    invoke-virtual {v1, v0}, Lnr8;->f(Ljava/lang/Runnable;)V

    iget-object v0, p0, Ltlg;->e:Lmdh;

    iget-object v0, v0, Lmdh;->h:Lh42;

    new-instance v1, Lslg;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lslg;-><init>(Ltlg;B)V

    new-instance v2, Lt7d;

    const/4 v3, 0x4

    invoke-direct {v2, v1, v3}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v0, p1, v2}, Lekc;->j(Lndc;Lf7f;)V

    iget-object v0, p0, Ltlg;->b:Lcom/opera/android/settings/SettingsManager;

    iget-object v1, p0, Ltlg;->k:Ls9;

    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    iget-object v0, p0, Ltlg;->c:Le8k;

    iget-object v1, v0, Le8k;->f:Lkze;

    new-instance v2, Lslg;

    const/4 v4, 0x1

    invoke-direct {v2, p0, v4}, Lslg;-><init>(Ltlg;B)V

    new-instance v4, Lt7d;

    invoke-direct {v4, v2, v3}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v1, p1, v4}, Lekc;->j(Lndc;Lf7f;)V

    iget-object v1, v0, Le8k;->d:Lkze;

    new-instance v2, Lslg;

    const/4 v4, 0x2

    invoke-direct {v2, p0, v4}, Lslg;-><init>(Ltlg;B)V

    new-instance v4, Lt7d;

    invoke-direct {v4, v2, v3}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v1, p1, v4}, Lekc;->j(Lndc;Lf7f;)V

    iget-object v0, v0, Le8k;->e:Lkze;

    new-instance v1, Lslg;

    const/4 v2, 0x3

    invoke-direct {v1, p0, v2}, Lslg;-><init>(Ltlg;B)V

    new-instance v2, Lt7d;

    invoke-direct {v2, v1, v3}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v0, p1, v2}, Lekc;->j(Lndc;Lf7f;)V

    invoke-virtual {p0}, Ltlg;->R()V

    iget-object v0, p0, Ltlg;->f:Lu8k;

    iget-object v0, v0, Lu8k;->d:Lode;

    new-instance v1, Lslg;

    invoke-direct {v1, p0, v3}, Lslg;-><init>(Ltlg;B)V

    new-instance p0, Lt7d;

    invoke-direct {p0, v1, v3}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v0, p1, p0}, Lekc;->j(Lndc;Lf7f;)V

    return-void
.end method

.method public final onDestroy(Lndc;)V
    .registers 3

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    iget-boolean p1, p0, Ltlg;->l:Z

    if-eqz p1, :cond_19

    iget-object p1, p0, Ltlg;->a:Lnr8;

    check-cast p1, Lcom/opera/android/favorites/e;

    iget-object p1, p1, Lcom/opera/android/favorites/e;->f:Lcom/opera/android/favorites/b;

    iget-object v0, p0, Ltlg;->j:Lwq8;

    invoke-virtual {p1, v0}, Ltq8;->B(Lsq8;)V

    const/4 p1, 0x0

    iput-boolean p1, p0, Ltlg;->l:Z

    :cond_19
    iget-object p1, p0, Ltlg;->b:Lcom/opera/android/settings/SettingsManager;

    iget-object p0, p0, Ltlg;->k:Ls9;

    invoke-virtual {p1, p0}, Lcom/opera/android/settings/SettingsManager;->T(Lp5j;)V

    return-void
.end method
