.class public final Ldcl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Llw1;
.implements Lhtd;
.implements Lqvm;
.implements Lb1n;
.implements Lhpf;
.implements Lann;
.implements Lkrn;
.implements Lhti;
.implements Ljrp;
.implements Lph;
.implements Levp;


# instance fields
.field public final a:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Ldtp;->b:Ldtp;

    iput-object v0, p0, Ldcl;->a:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(FFLif1;)V
    .registers 5

    sget-object v0, Lz0n;->a:[I

    if-nez p3, :cond_14

    const/high16 v0, 0x3f800000    # 1.0f

    cmpg-float v0, p1, v0

    if-nez v0, :cond_14

    const v0, 0x44bb8000    # 1500.0f

    cmpg-float v0, p2, v0

    if-nez v0, :cond_14

    sget-object p1, Lfw6;->a:Lfw6;

    goto :goto_2a

    :cond_14
    if-eqz p3, :cond_1d

    new-instance v0, Lrii;

    invoke-direct {v0, p1, p2, p3}, Lrii;-><init>(FFLif1;)V

    move-object p1, v0

    goto :goto_2a

    :cond_1d
    new-instance p3, Loji;

    invoke-direct {p3}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lw89;

    invoke-direct {v0, p1, p2}, Lw89;-><init>(FF)V

    iput-object v0, p3, Loji;->a:Ljava/lang/Object;

    move-object p1, p3

    :goto_2a
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p2, Lw7j;

    invoke-direct {p2, p1}, Lw7j;-><init>(Lmf1;)V

    iput-object p2, p0, Ldcl;->a:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lz4k;Lbl;Lfio;)V
    .registers 6

    .line 55
    new-instance v0, Ldzo;

    invoke-direct {v0, p1, p2, p3, p4}, Ldzo;-><init>(Landroid/content/Context;Lz4k;Lbl;Lfio;)V

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Ldcl;->a:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;)V
    .registers 2

    .line 54
    iput-object p1, p0, Ldcl;->a:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lkw3;Lkw3;Lqii;)V
    .registers 4

    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    iput-object p2, p0, Ldcl;->a:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final I(Lfpf;)V
    .registers 2

    iget-object p0, p0, Ldcl;->a:Ljava/lang/Object;

    check-cast p0, Lggn;

    const/4 p1, 0x0

    iput-boolean p1, p0, Lggn;->o:Z

    invoke-virtual {p0}, Lggn;->a()V

    return-void
.end method

.method public final a(Lpvm;)V
    .registers 2

    iget-object p0, p0, Ldcl;->a:Ljava/lang/Object;

    check-cast p0, Luwm;

    invoke-virtual {p0, p1}, Luwm;->h(Lpvm;)V

    return-void
.end method

.method public final b()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final c(Lif1;Lif1;Lif1;)J
    .registers 4

    iget-object p0, p0, Ldcl;->a:Ljava/lang/Object;

    check-cast p0, Lw7j;

    invoke-virtual {p0, p1, p2, p3}, Lw7j;->c(Lif1;Lif1;Lif1;)J

    move-result-wide p0

    return-wide p0
.end method

.method public final d()V
    .registers 1

    iget-object p0, p0, Ldcl;->a:Ljava/lang/Object;

    check-cast p0, Ll45;

    iget-object p0, p0, Ll45;->c:Ljava/lang/Object;

    check-cast p0, Llmn;

    invoke-interface {p0}, Llmn;->c()V

    return-void
.end method

.method public final e()V
    .registers 1

    iget-object p0, p0, Ldcl;->a:Ljava/lang/Object;

    check-cast p0, Ll45;

    iget-object p0, p0, Ll45;->c:Ljava/lang/Object;

    check-cast p0, Llmn;

    invoke-interface {p0}, Llmn;->c()V

    return-void
.end method

.method public final f(Ltc2;)V
    .registers 7

    iget-object p0, p0, Ldcl;->a:Ljava/lang/Object;

    check-cast p0, Llqn;

    iget-object v0, p0, Llqn;->w:Lvsn;

    iget-boolean v1, p1, Ltc2;->a:Z

    if-eqz v1, :cond_13

    iget-object v1, v0, Lvsn;->c:Ls62;

    invoke-virtual {v1}, Ls62;->f()Lqyj;

    move-result-object v1

    invoke-virtual {v1}, Lqyj;->f()V

    :cond_13
    sget-object v1, Ldrn;->b:Ldrn;

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_28

    invoke-virtual {v0}, Lvsn;->g()V

    iget-object p0, p0, Llqn;->G:Lmrn;

    if-eqz p0, :cond_24

    move-object v2, p0

    :cond_24
    invoke-virtual {v2}, Lmrn;->g()V

    return-void

    :cond_28
    sget-object v1, Ldrn;->c:Ldrn;

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_38

    iget-object p0, v0, Lvsn;->k:Lg7m;

    sget-object p1, Ll60;->h:Ll60;

    invoke-virtual {p0, p1}, Lg7m;->c(Ll60;)V

    return-void

    :cond_38
    sget-object v1, Ldrn;->d:Ldrn;

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v3, 0x0

    if-eqz v1, :cond_4e

    sget-object p1, Lux1;->a:Lux1;

    new-instance v1, Ltu;

    const/16 v2, 0xd

    invoke-direct {v1, p0, v2}, Ltu;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, p1, v3, v1}, Lvsn;->h(Lux1;ZLcom/opera/api/Callback;)V

    return-void

    :cond_4e
    sget-object v1, Ldrn;->e:Ldrn;

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_96

    invoke-virtual {v0}, Lvsn;->b()Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    const/4 p1, 0x3

    if-ge p0, p1, :cond_1af

    iget-object p0, v0, Lvsn;->c:Ls62;

    invoke-virtual {p0}, Ls62;->e()Liy1;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Liy1;->f:Lny1;

    new-instance v1, Lwx;

    const/4 v3, 0x4

    invoke-direct {v1, p0, p1, v3}, Lwx;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p0, v0, Lny1;->a:Landroid/content/Context;

    :try_start_7c
    invoke-virtual {v0, p0, v1}, Lny1;->a(Landroid/content/Context;Lcom/opera/api/Callback;)V
    :try_end_7f
    .catch Landroid/content/ActivityNotFoundException; {:try_start_7c .. :try_end_7f} :catch_80

    return-void

    :catch_80
    new-instance p1, Laz0;

    invoke-direct {p1, p0}, Laz0;-><init>(Landroid/content/Context;)V

    const p0, 0x7f140774

    invoke-virtual {p1, p0}, Laz0;->a(I)V

    const p0, 0x7f140bbb

    invoke-virtual {p1, p0, v2}, Laz0;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Laz0;

    move-result-object p0

    invoke-virtual {p0}, Laz0;->c()Lbz0;

    return-void

    :cond_96
    sget-object v1, Ldrn;->f:Ldrn;

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_a4

    sget-object p0, Lux1;->a:Lux1;

    invoke-virtual {v0, p0}, Lvsn;->i(Lux1;)V

    return-void

    :cond_a4
    sget-object v1, Ldrn;->g:Ldrn;

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_c4

    iget-object p0, p0, Llqn;->G:Lmrn;

    if-eqz p0, :cond_b1

    move-object v2, p0

    :cond_b1
    iget-object p0, v2, Lmrn;->j:Lcom/opera/android/custom_views/OperaEditText;

    invoke-virtual {p0}, Landroid/view/View;->clearFocus()V

    invoke-static {p0}, Lq9n;->u(Landroid/view/View;)Z

    sget-object p0, Ll60;->d:Ll60;

    iget-object p1, v0, Lvsn;->k:Lg7m;

    invoke-virtual {p1, p0}, Lg7m;->c(Ll60;)V

    invoke-virtual {v0}, Lvsn;->g()V

    return-void

    :cond_c4
    sget-object v1, Ldrn;->h:Ldrn;

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_d4

    sget-object p0, Ll60;->e:Ll60;

    iget-object p1, v0, Lvsn;->k:Lg7m;

    invoke-virtual {p1, p0}, Lg7m;->c(Ll60;)V

    return-void

    :cond_d4
    instance-of v1, p1, Lfrn;

    const/4 v4, 0x1

    if-eqz v1, :cond_fc

    check-cast p1, Lfrn;

    iget-object p1, p1, Lfrn;->b:Ljava/lang/String;

    invoke-virtual {v0, p1}, Lvsn;->f(Ljava/lang/String;)Lqx1;

    move-result-object p1

    if-eqz p1, :cond_1af

    iget-object v0, p1, Lqx1;->m:Ljava/io/File;

    invoke-static {v0}, Lw7d;->x(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v0

    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iget-object p1, p1, Lqx1;->n:Ljava/lang/String;

    invoke-virtual {v1, v0, p1}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {v1, v4}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-virtual {p0, v1}, Landroidx/fragment/app/Fragment;->startActivity(Landroid/content/Intent;)V

    return-void

    :cond_fc
    instance-of v1, p1, Lgrn;

    if-eqz v1, :cond_10e

    check-cast p1, Lgrn;

    iget-object p0, p1, Lgrn;->b:Ljava/lang/String;

    iget-object p1, v0, Lvsn;->c:Ls62;

    invoke-virtual {p1}, Ls62;->e()Liy1;

    move-result-object p1

    invoke-virtual {p1, p0, v3}, Liy1;->g(Ljava/lang/String;Z)V

    return-void

    :cond_10e
    instance-of v1, p1, Lhrn;

    if-eqz v1, :cond_120

    check-cast p1, Lhrn;

    iget-object p0, p1, Lhrn;->b:Ljava/lang/String;

    iget-object p1, v0, Lvsn;->c:Ls62;

    invoke-virtual {p1}, Ls62;->e()Liy1;

    move-result-object p1

    invoke-virtual {p1, p0}, Liy1;->h(Ljava/lang/String;)V

    return-void

    :cond_120
    sget-object v1, Ldrn;->i:Ldrn;

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_12c

    invoke-virtual {v0}, Lvsn;->l()V

    return-void

    :cond_12c
    sget-object v1, Ldrn;->j:Ldrn;

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_17c

    iget-object p1, p0, Llqn;->G:Lmrn;

    if-nez p1, :cond_139

    move-object p1, v2

    :cond_139
    iget-object p1, p1, Lmrn;->j:Lcom/opera/android/custom_views/OperaEditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    iget-object v1, v0, Lvsn;->q:Lwnm;

    invoke-static {v1}, Lxf8;->B(Likc;)Ltsd;

    move-result-object v1

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ltsn;

    iget-object v1, v1, Ltsn;->b:Llsn;

    invoke-static {p1}, Lkotlin/text/StringsKt;->N(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_1af

    invoke-interface {v1}, Llsn;->b()Lmsn;

    move-result-object v1

    sget-object v4, Lmsn;->b:Lmsn;

    if-ne v1, v4, :cond_1af

    invoke-virtual {v0, p1, v3}, Lvsn;->m(Ljava/lang/String;Z)V

    iget-object p1, p0, Llqn;->G:Lmrn;

    if-eqz p1, :cond_167

    move-object v2, p1

    :cond_167
    const-string p1, ""

    invoke-virtual {v2, p1}, Lmrn;->i(Ljava/lang/String;)V

    iget-object p0, p0, Llqn;->J:Lorg/chromium/content_public/browser/WebContents;

    if-eqz p0, :cond_1af

    invoke-interface {p0}, Lorg/chromium/content_public/browser/WebContents;->J0()Lorg/chromium/ui/base/ViewAndroidDelegate;

    move-result-object p0

    if-eqz p0, :cond_1af

    iget-object p0, p0, Lorg/chromium/ui/base/ViewAndroidDelegate;->b:Lxr5;

    invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z

    return-void

    :cond_17c
    instance-of v1, p1, Lirn;

    if-eqz v1, :cond_18f

    check-cast p1, Lirn;

    iget-boolean p1, p1, Lirn;->b:Z

    iput-boolean p1, v0, Lvsn;->t:Z

    iget-object v0, v0, Lvsn;->q:Lwnm;

    invoke-virtual {v0}, Lwnm;->u()V

    invoke-static {p0, v3, p1, v4}, Llqn;->I0(Llqn;IZI)V

    return-void

    :cond_18f
    instance-of v1, p1, Ljrn;

    if-eqz v1, :cond_19b

    check-cast p1, Ljrn;

    iget-object p1, p1, Ljrn;->b:Ljava/lang/String;

    invoke-virtual {p0, p1}, Llqn;->H0(Ljava/lang/String;)V

    return-void

    :cond_19b
    instance-of p0, p1, Lern;

    if-eqz p0, :cond_1a7

    check-cast p1, Lern;

    iget-boolean p0, p1, Lern;->b:Z

    invoke-static {v0, p0}, Lvsn;->j(Lvsn;Z)V

    return-void

    :cond_1a7
    sget-object p0, Ldrn;->k:Ldrn;

    invoke-virtual {p1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1b0

    :cond_1af
    return-void

    :cond_1b0
    invoke-static {}, Lh9o;->p()V

    return-void
.end method

.method public final h(Lcpf;)V
    .registers 2

    iget-object p0, p0, Ldcl;->a:Ljava/lang/Object;

    check-cast p0, Lggn;

    const/4 p1, 0x0

    iput-boolean p1, p0, Lggn;->o:Z

    invoke-virtual {p0}, Lggn;->a()V

    return-void
.end method

.method public final i()V
    .registers 4

    iget-object p0, p0, Ldcl;->a:Ljava/lang/Object;

    check-cast p0, Ldzo;

    iget-object v0, p0, Ldzo;->c:Lnyo;

    iget-boolean v1, p0, Ldzo;->f:Z

    if-eqz v1, :cond_18

    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    invoke-virtual {v0}, Lnyo;->onResume()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Ldzo;->f:Z

    :cond_18
    return-void
.end method

.method public final declared-synchronized j(Landroid/content/Context;Ljava/util/HashSet;)V
    .registers 7

    monitor-enter p0

    :try_start_1
    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object p1

    invoke-virtual {p2}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_9
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_29

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    const-string v1, "addAssetPath"

    const-class v2, Ljava/lang/Integer;

    const-class v3, Ljava/lang/String;

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v1, v2, v3, v0}, Lu0h;->u(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Class;Ljava/io/Serializable;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I
    :try_end_28
    .catchall {:try_start_1 .. :try_end_28} :catchall_2d

    goto :goto_9

    :cond_29
    monitor-exit p0

    return-void

    :goto_2b
    :try_start_2b
    monitor-exit p0
    :try_end_2c
    .catchall {:try_start_2b .. :try_end_2c} :catchall_2d

    throw p1

    :catchall_2d
    move-exception p1

    goto :goto_2b
.end method

.method public final k(Ljava/lang/Object;)V
    .registers 6

    iget-object p0, p0, Ldcl;->a:Ljava/lang/Object;

    check-cast p0, Lcom/android/billingclient/api/ProxyBillingActivityV2;

    check-cast p1, Loh;

    iget-object v0, p1, Loh;->b:Landroid/content/Intent;

    const-string v1, "ProxyBillingActivityV2"

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/play_billing/zzc;->zzi(Landroid/content/Intent;Ljava/lang/String;)Lmf3;

    move-result-object v2

    iget v2, v2, Lmf3;->a:I

    iget-object v3, p0, Lcom/android/billingclient/api/ProxyBillingActivityV2;->h:Landroid/os/ResultReceiver;

    if-eqz v3, :cond_1f

    if-nez v0, :cond_18

    const/4 v0, 0x0

    goto :goto_1c

    :cond_18
    invoke-virtual {v0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    :goto_1c
    invoke-virtual {v3, v2, v0}, Landroid/os/ResultReceiver;->send(ILandroid/os/Bundle;)V

    :cond_1f
    iget p1, p1, Loh;->a:I

    const/4 v0, -0x1

    if-ne p1, v0, :cond_26

    if-eqz v2, :cond_3f

    :cond_26
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v3, "External offer dialog finished with resultCode: "

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " and billing\'s responseCode: "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/google/android/gms/internal/play_billing/zzc;->zzo(Ljava/lang/String;Ljava/lang/String;)V

    :cond_3f
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void
.end method

.method public final n(Lepf;)V
    .registers 2

    iget-object p0, p0, Ldcl;->a:Ljava/lang/Object;

    check-cast p0, Lggn;

    const/4 p1, 0x0

    iput-boolean p1, p0, Lggn;->o:Z

    invoke-virtual {p0}, Lggn;->a()V

    return-void
.end method

.method public final p(Ljava/lang/String;)V
    .registers 4

    iget-object p0, p0, Ldcl;->a:Ljava/lang/Object;

    check-cast p0, Ljdo;

    iget-object p0, p0, Ljdo;->v:Ld83;

    if-nez p0, :cond_9

    const/4 p0, 0x0

    :cond_9
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lc83;

    const/4 v1, 0x4

    invoke-direct {v0, p0, v1}, Lc83;-><init>(Landroidx/recyclerview/widget/d;B)V

    invoke-virtual {v0, p1}, Landroid/widget/Filter;->filter(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final q(Lif1;Lif1;Lif1;)Lif1;
    .registers 4

    iget-object p0, p0, Ldcl;->a:Ljava/lang/Object;

    check-cast p0, Lw7j;

    invoke-virtual {p0, p1, p2, p3}, Lw7j;->q(Lif1;Lif1;Lif1;)Lif1;

    move-result-object p0

    return-object p0
.end method

.method public final r(Lgpf;)V
    .registers 2

    iget-object p0, p0, Ldcl;->a:Ljava/lang/Object;

    check-cast p0, Lggn;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lggn;->o:Z

    invoke-virtual {p0}, Lggn;->a()V

    return-void
.end method

.method public final s(Litd;)V
    .registers 5

    iget-object p0, p0, Ldcl;->a:Ljava/lang/Object;

    check-cast p0, Lusl;

    iget-object v0, p0, Lusl;->a:Lrtl;

    iget-object v0, v0, Lrtl;->a:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {v0}, Landroidx/appcompat/widget/Toolbar;->t()Z

    move-result v0

    iget-object p0, p0, Lusl;->b:Lsp1;

    const/16 v1, 0x6c

    if-eqz v0, :cond_16

    invoke-virtual {p0, v1, p1}, Lsp1;->onPanelClosed(ILandroid/view/Menu;)V

    return-void

    :cond_16
    const/4 v0, 0x0

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v2, p1}, Lsp1;->onPreparePanel(ILandroid/view/View;Landroid/view/Menu;)Z

    move-result v0

    if-eqz v0, :cond_21

    invoke-virtual {p0, v1, p1}, Lsp1;->onMenuOpened(ILandroid/view/Menu;)Z

    :cond_21
    return-void
.end method

.method public final t(JLif1;Lif1;Lif1;)Lif1;
    .registers 12

    iget-object p0, p0, Ldcl;->a:Ljava/lang/Object;

    move-object v0, p0

    check-cast v0, Lw7j;

    move-wide v1, p1

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Lw7j;->t(JLif1;Lif1;Lif1;)Lif1;

    move-result-object p0

    return-object p0
.end method

.method public final u(Lbnn;)V
    .registers 2

    iget-object p0, p0, Ldcl;->a:Ljava/lang/Object;

    check-cast p0, Ll45;

    iget-object p0, p0, Ll45;->c:Ljava/lang/Object;

    check-cast p0, Llmn;

    invoke-interface {p0}, Llmn;->c()V

    return-void
.end method

.method public final v(Ljava/lang/String;)V
    .registers 4

    iget-object p0, p0, Ldcl;->a:Ljava/lang/Object;

    check-cast p0, Ljdo;

    iget-object p0, p0, Ljdo;->v:Ld83;

    if-nez p0, :cond_9

    const/4 p0, 0x0

    :cond_9
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lc83;

    const/4 v1, 0x4

    invoke-direct {v0, p0, v1}, Lc83;-><init>(Landroidx/recyclerview/widget/d;B)V

    invoke-virtual {v0, p1}, Landroid/widget/Filter;->filter(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final w(JLif1;Lif1;Lif1;)Lif1;
    .registers 12

    iget-object p0, p0, Ldcl;->a:Ljava/lang/Object;

    move-object v0, p0

    check-cast v0, Lw7j;

    move-wide v1, p1

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Lw7j;->w(JLif1;Lif1;Lif1;)Lif1;

    move-result-object p0

    return-object p0
.end method

.method public final x(Litd;Landroid/view/MenuItem;)Z
    .registers 3

    const/4 p0, 0x0

    return p0
.end method

.method public final y(Lopi;Ljava/lang/Float;Ljava/lang/Float;Litj;Lltj;)Ljava/lang/Object;
    .registers 13

    invoke-virtual {p2}, Ljava/lang/Number;->floatValue()F

    move-result v2

    invoke-virtual {p3}, Ljava/lang/Number;->floatValue()F

    move-result p2

    const/4 p3, 0x0

    const/16 v0, 0x1c

    invoke-static {v0, p3, p2}, Lcs5;->a(IFF)Lxe1;

    move-result-object v3

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result p3

    invoke-static {p2}, Ljava/lang/Math;->signum(F)F

    move-result p2

    mul-float v1, p2, p3

    iget-object p0, p0, Ldcl;->a:Ljava/lang/Object;

    move-object v4, p0

    check-cast v4, La2k;

    move-object v0, p1

    move-object v5, p4

    move-object v6, p5

    invoke-static/range {v0 .. v6}, Lxvg;->j(Lopi;FFLxe1;La2k;Lkotlin/jvm/functions/Function1;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    sget-object p1, Lpx5;->a:Lpx5;

    if-ne p0, p1, :cond_2a

    return-object p0

    :cond_2a
    check-cast p0, Lte1;

    return-object p0
.end method

.method public final z(Lcnn;)V
    .registers 2

    iget-object p0, p0, Ldcl;->a:Ljava/lang/Object;

    check-cast p0, Ll45;

    iget-object p0, p0, Ll45;->c:Ljava/lang/Object;

    check-cast p0, Llmn;

    iget-object p1, p1, Lcnn;->a:Lqjn;

    invoke-interface {p0, p1}, Llmn;->d(Lqjn;)V

    return-void
.end method

.method public final zza()Ljava/lang/Object;
    .registers 1

    .line 72
    iget-object p0, p0, Ldcl;->a:Ljava/lang/Object;

    check-cast p0, Ljrp;

    invoke-interface {p0}, Ljrp;->zza()Ljava/lang/Object;

    move-result-object p0

    .line 73
    check-cast p0, Lktp;

    if-eqz p0, :cond_d

    return-object p0

    .line 74
    :cond_d
    const-string p0, "Cannot return null from a non-@Nullable @Provides method"

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public final zza()V
    .registers 5

    iget-object p0, p0, Ldcl;->a:Ljava/lang/Object;

    check-cast p0, Ltop;

    const/4 v0, 0x0

    :goto_5
    iget-object v1, p0, Ltop;->a:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeCount()I

    move-result v2

    if-ge v0, v2, :cond_3d

    invoke-interface {v1, v0}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeName(I)Ljava/lang/String;

    move-result-object v2

    const-string v3, "defaultErrorCode"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3a

    iget-object v2, p0, Ltop;->b:Lwci;

    invoke-interface {v1, v0}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v1

    sget-object v3, Ljop;->c:Ljava/util/HashMap;

    invoke-virtual {v3, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    if-eqz v3, :cond_2c

    iput-object v3, v2, Lwci;->b:Ljava/lang/Object;

    goto :goto_3a

    :cond_2c
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    const-string v0, " is unknown error."

    invoke-virtual {p0, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    return-void

    :cond_3a
    :goto_3a
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    :cond_3d
    new-instance v0, Ltvk;

    invoke-direct {v0, p0}, Ltvk;-><init>(Ljava/lang/Object;)V

    const-string v1, "split-install-error"

    invoke-virtual {p0, v1, v0}, Ltop;->a(Ljava/lang/String;Levp;)V

    return-void
.end method
