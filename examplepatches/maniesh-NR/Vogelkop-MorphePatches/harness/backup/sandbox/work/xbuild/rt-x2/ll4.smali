.class public final Lll4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;

.field public final c:Ljava/lang/Object;

.field public final d:Ljava/lang/Object;

.field public final e:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 6

    iput-byte p5, p0, Lll4;->a:B

    iput-object p1, p0, Lll4;->e:Ljava/lang/Object;

    iput-object p2, p0, Lll4;->b:Ljava/lang/Object;

    iput-object p3, p0, Lll4;->c:Ljava/lang/Object;

    iput-object p4, p0, Lll4;->d:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;BZ)V
    .registers 7

    .line 14
    iput-byte p5, p0, Lll4;->a:B

    iput-object p1, p0, Lll4;->b:Ljava/lang/Object;

    iput-object p2, p0, Lll4;->c:Ljava/lang/Object;

    iput-object p3, p0, Lll4;->d:Ljava/lang/Object;

    iput-object p4, p0, Lll4;->e:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 14

    iget-byte v0, p0, Lll4;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x0

    iget-object v4, p0, Lll4;->b:Ljava/lang/Object;

    iget-object v5, p0, Lll4;->e:Ljava/lang/Object;

    iget-object v6, p0, Lll4;->d:Ljava/lang/Object;

    iget-object p0, p0, Lll4;->c:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_16c

    check-cast v4, Lgpp;

    check-cast p0, Ljava/lang/String;

    check-cast v6, Ljava/lang/String;

    check-cast v5, Landroid/os/Bundle;

    :try_start_18
    iget-object v0, v4, Lgpp;->b:Lg7m;

    iget-object v0, v0, Lg7m;->k:Ljava/lang/Object;

    check-cast v0, Landroid/os/IInterface;

    check-cast v0, Lwsp;

    if-eqz v0, :cond_43

    iget-object v1, v4, Lgpp;->a:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    iget-object v2, v4, Lgpp;->d:Lrop;

    check-cast v0, Lisp;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/playcore_hsdp/zza;->zza()Landroid/os/Parcel;

    move-result-object v3

    invoke-virtual {v3, v1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    invoke-virtual {v3, p0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    invoke-virtual {v3, v6}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    invoke-static {v3, v5}, Lcom/google/android/gms/internal/playcore_hsdp/zzc;->zzc(Landroid/os/Parcel;Landroid/os/Parcelable;)V

    invoke-static {v3, v2}, Lcom/google/android/gms/internal/playcore_hsdp/zzc;->zzd(Landroid/os/Parcel;Landroid/os/IInterface;)V

    const/4 p0, 0x2

    invoke-virtual {v0, p0, v3}, Lcom/google/android/gms/internal/playcore_hsdp/zza;->zzb(ILandroid/os/Parcel;)V
    :try_end_43
    .catch Landroid/os/DeadObjectException; {:try_start_18 .. :try_end_43} :catch_43
    .catch Landroid/os/RemoteException; {:try_start_18 .. :try_end_43} :catch_43

    :catch_43
    :cond_43
    return-void

    :pswitch_44
    check-cast p0, Ljava/lang/String;

    check-cast v6, Ljava/lang/String;

    check-cast v4, Landroid/app/Activity;

    check-cast v5, Ljava/util/Map;

    invoke-static {p0, v6, v5}, Ly4h;->t(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Landroid/content/Intent;

    move-result-object p0

    invoke-virtual {v4, p0, v3}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    return-void

    :pswitch_54
    check-cast v4, Landroid/view/View;

    check-cast p0, Ln2o;

    check-cast v6, Lmgh;

    invoke-static {v4, p0, v6}, Lj2o;->i(Landroid/view/View;Ln2o;Lmgh;)V

    check-cast v5, Landroid/animation/ValueAnimator;

    invoke-virtual {v5}, Landroid/animation/ValueAnimator;->start()V

    return-void

    :pswitch_63
    check-cast p0, Lcom/opera/android/settings/SettingsManager;

    const-string v0, "version_code"

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->n(Ljava/lang/String;)I

    move-result v1

    check-cast v5, Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v2

    :goto_71
    if-ge v3, v2, :cond_7f

    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    add-int/lit8 v3, v3, 0x1

    check-cast v7, Lw1n;

    invoke-interface {v7, v1}, Lw1n;->apply(I)V

    goto :goto_71

    :cond_7f
    check-cast v4, Lcom/opera/android/BrowserActivity;

    invoke-static {v4}, Ldj9;->t(Landroid/content/Context;)Ldj9;

    move-result-object v1

    new-instance v2, La2n;

    check-cast v6, Lwv1;

    iget-object v3, v6, Lwv1;->b:Lb6h;

    invoke-interface {v3}, Lvtb;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lskm;

    invoke-direct {v2, v1, v3}, La2n;-><init>(Ldj9;Lskm;)V

    invoke-virtual {v1, v2}, Lno7;->g(Lmo7;)V

    invoke-virtual {p0}, Lcom/opera/android/settings/SettingsManager;->J()Z

    move-result v1

    iput-boolean v1, p0, Lcom/opera/android/settings/SettingsManager;->h:Z

    const v1, 0x71de74d2

    invoke-virtual {p0, v1, v0}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    const-string v0, "last_upgrade_time"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-virtual {p0, v1, v2, v0}, Lcom/opera/android/settings/SettingsManager;->W(JLjava/lang/String;)V

    return-void

    :pswitch_ad
    check-cast v5, Lj5k;

    iget-object v0, v5, Lj5k;->a:Ljava/util/Set;

    iget-object v2, v5, Lj5k;->e:Lk5k;

    check-cast v4, Lyz;

    check-cast p0, Lmq;

    iget-object v8, p0, Lmq;->c:Ldl;

    iget-object v3, v5, Lj5k;->d:Lbz;

    iget-object v12, p0, Lmq;->f:Ljava/util/List;

    iget-object v5, v2, Lk5k;->d:Lwy;

    iget-object v9, v5, Lwy;->l:Lyl;

    iget-object v10, v2, Lk5k;->e:Lg5k;

    iget-object v11, v2, Lk5k;->f:Lf5k;

    instance-of v5, v4, Lnq;

    if-eqz v5, :cond_d6

    move-object v7, v4

    check-cast v7, Lnq;

    invoke-interface/range {v7 .. v12}, Lnq;->a(Ldl;Lkm;Lk8;Lkq;Ljava/util/List;)Lmq;

    move-result-object v1

    invoke-interface {v3}, Lbz;->i()I

    move-result v3

    iput v3, v1, Lmq;->e:I

    :cond_d6
    if-eqz v1, :cond_ff

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    invoke-interface {v0, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    iget-object v0, v2, Lk5k;->a:Ljava/util/ArrayList;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v0

    if-ltz v0, :cond_ff

    iget-object v3, v2, Lk5k;->a:Ljava/util/ArrayList;

    invoke-virtual {v3, v0, v1}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    iget-object v0, v2, Lk5k;->g:Leu8;

    if-eqz v0, :cond_f2

    invoke-virtual {v0, p0, v1}, Leu8;->e(Lmq;Lmq;)V

    :cond_f2
    check-cast v6, Ltxi;

    if-eqz v6, :cond_fc

    iget-object v0, v6, Ltxi;->b:Ljava/lang/Object;

    check-cast v0, Li5k;

    iput-object v1, v0, Li5k;->c:Lmq;

    :cond_fc
    invoke-virtual {p0}, Lmq;->f()V

    :cond_ff
    return-void

    :pswitch_100
    check-cast v5, Lp03;

    iget-boolean v0, v5, Lp03;->b:Z

    if-nez v0, :cond_142

    check-cast p0, Lzcl;

    check-cast v6, Lqie;

    iget-byte v0, v5, Lp03;->d:B

    const-string v1, "SoonestWakeupTime"

    packed-switch v0, :pswitch_data_17c

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    iget-object p0, p0, Lzcl;->b:Landroid/os/PersistableBundle;

    invoke-virtual {p0, v1}, Landroid/os/BaseBundle;->getLong(Ljava/lang/String;)J

    move-result-wide v0

    sub-long/2addr v3, v0

    const-string p0, "BackgroundSync.Periodic.Wakeup.DelayTime"

    invoke-static {v3, v4, p0}, Lioh;->z(JLjava/lang/String;)V

    new-instance p0, Lo03;

    invoke-direct {p0, v6, v2}, Lo03;-><init>(Lqie;B)V

    invoke-static {p0}, LJ/N;->MggSNLX2(Ljava/lang/Object;)V

    goto :goto_142

    :pswitch_12a
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iget-object p0, p0, Lzcl;->b:Landroid/os/PersistableBundle;

    invoke-virtual {p0, v1}, Landroid/os/BaseBundle;->getLong(Ljava/lang/String;)J

    move-result-wide v0

    sub-long/2addr v4, v0

    const-string p0, "BackgroundSync.Wakeup.DelayTime"

    invoke-static {v4, v5, p0}, Lioh;->z(JLjava/lang/String;)V

    new-instance p0, Lo03;

    invoke-direct {p0, v6, v3}, Lo03;-><init>(Lqie;B)V

    invoke-static {p0}, LJ/N;->M_JeS6H$(Ljava/lang/Object;)V

    :cond_142
    :goto_142
    return-void

    :pswitch_143
    check-cast v5, Leme;

    iget-object v0, v5, Leme;->a:Ljava/lang/Object;

    check-cast v0, Lnl4;

    check-cast p0, Lptd;

    check-cast v4, Lml4;

    if-eqz v4, :cond_158

    iput-boolean v2, v0, Lnl4;->A:Z

    iget-object v2, v4, Lml4;->b:Litd;

    invoke-virtual {v2, v3}, Litd;->c(Z)V

    iput-boolean v3, v0, Lnl4;->A:Z

    :cond_158
    invoke-virtual {p0}, Lptd;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_16a

    invoke-virtual {p0}, Lptd;->hasSubMenu()Z

    move-result v0

    if-eqz v0, :cond_16a

    check-cast v6, Litd;

    const/4 v0, 0x4

    invoke-virtual {v6, p0, v1, v0}, Litd;->q(Landroid/view/MenuItem;Llud;I)Z

    :cond_16a
    return-void

    nop

    :pswitch_data_16c
    .packed-switch 0x0
        :pswitch_143
        :pswitch_100
        :pswitch_ad
        :pswitch_63
        :pswitch_54
        :pswitch_44
    .end packed-switch

    :pswitch_data_17c
    .packed-switch 0x0
        :pswitch_12a
    .end packed-switch
.end method
