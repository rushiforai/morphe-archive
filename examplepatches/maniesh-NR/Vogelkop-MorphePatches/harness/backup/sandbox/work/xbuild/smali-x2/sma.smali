.class public final synthetic Lsma;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lsma;->a:B

    iput-object p1, p0, Lsma;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 13

    iget-byte v0, p0, Lsma;->a:B

    const-string v1, "ACTION_DESTINATION_VIEW"

    const-string v2, "DESTINATION_VIEW_ID"

    const-string v3, "android.intent.category.LAUNCHER"

    const-string v4, "android.intent.action.MAIN"

    const/4 v5, 0x3

    const/4 v6, 0x2

    const/4 v7, 0x0

    const/4 v8, 0x1

    const/4 v9, 0x0

    const/4 v10, 0x4

    iget-object p0, p0, Lsma;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_35a

    check-cast p0, Lexd;

    sget-object p1, Lhjm;->a:Lhjm;

    invoke-virtual {p0, p1}, Llz3;->b(Lhjm;)Z

    return-void

    :pswitch_1d
    check-cast p0, Lknd;

    iget-object p1, p0, Lknd;->h:Lnnd;

    iget-object p1, p1, Lnnd;->j:Lond;

    iget-object p1, p1, Lond;->g:Ldod;

    iget-object v0, p0, Lknd;->g:Lcod;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-eqz v0, :cond_a7

    invoke-static {}, Ldod;->b()V

    invoke-static {}, Ldod;->c()Lez9;

    move-result-object p1

    iget-object v1, p1, Lez9;->d:Lcod;

    invoke-virtual {v1}, Lcod;->a()Lynd;

    move-result-object v1

    if-eqz v1, :cond_9c

    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_48
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_6e

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcod;

    iget-object v4, v1, Lynd;->x:Landroidx/collection/ArrayMap;

    iget-object v5, v3, Lcod;->c:Ljava/lang/String;

    invoke-virtual {v4, v5}, Lhkj;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lqnd;

    if-eqz v4, :cond_6a

    iget-boolean v4, v4, Lqnd;->e:Z

    if-eqz v4, :cond_6a

    iget-object v3, v3, Lcod;->b:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_48

    :cond_6a
    invoke-virtual {v3}, Lcod;->toString()Ljava/lang/String;

    goto :goto_48

    :cond_6e
    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_9c

    invoke-virtual {v1}, Lcod;->g()Z

    move-result v0

    if-eqz v0, :cond_8c

    iget-object p1, p1, Lez9;->e:Lsnd;

    instance-of v0, p1, Lrnd;

    if-eqz v0, :cond_86

    check-cast p1, Lrnd;

    invoke-virtual {p1, v2}, Lrnd;->o(Ljava/util/ArrayList;)V

    goto :goto_9c

    :cond_86
    const-string p0, "There is no currently selected dynamic group route."

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_ac

    :cond_8c
    invoke-virtual {v1}, Lynd;->n()Z

    move-result v0

    if-eqz v0, :cond_99

    invoke-virtual {p1}, Lez9;->f()V

    invoke-virtual {v1}, Lcod;->toString()Ljava/lang/String;

    goto :goto_9c

    :cond_99
    invoke-virtual {v1}, Lcod;->toString()Ljava/lang/String;

    :cond_9c
    :goto_9c
    iget-object p1, p0, Lknd;->c:Landroid/widget/ImageView;

    invoke-virtual {p1, v10}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-object p0, p0, Lknd;->d:Landroid/widget/ProgressBar;

    invoke-virtual {p0, v9}, Landroid/view/View;->setVisibility(I)V

    goto :goto_ac

    :cond_a7
    const-string p0, "route must not be null"

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    :goto_ac
    return-void

    :pswitch_ad
    check-cast p0, Landroidx/mediarouter/app/e;

    iget-object v0, p0, Landroidx/mediarouter/app/e;->e:Lond;

    iget-object v1, v0, Lond;->x:Lcod;

    iget-object v2, v0, Lond;->s:Lue2;

    if-eqz v1, :cond_ba

    invoke-virtual {v2, v6}, Landroid/os/Handler;->removeMessages(I)V

    :cond_ba
    iget-object v1, p0, Landroidx/mediarouter/app/e;->b:Lcod;

    iput-object v1, v0, Lond;->x:Lcod;

    invoke-virtual {p1}, Landroid/view/View;->isActivated()Z

    move-result p1

    xor-int/lit8 v1, p1, 0x1

    if-eqz p1, :cond_dd

    iget-object p1, v0, Lond;->y:Ljava/util/HashMap;

    iget-object v0, p0, Landroidx/mediarouter/app/e;->b:Lcod;

    iget-object v0, v0, Lcod;->c:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    if-eqz p1, :cond_dc

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-static {v8, p1}, Ljava/lang/Math;->max(II)I

    move-result v8

    :cond_dc
    move v9, v8

    :cond_dd
    invoke-virtual {p0, v1}, Landroidx/mediarouter/app/e;->V(Z)V

    iget-object p1, p0, Landroidx/mediarouter/app/e;->d:Landroidx/mediarouter/app/MediaRouteVolumeSlider;

    invoke-virtual {p1, v9}, Landroid/widget/ProgressBar;->setProgress(I)V

    iget-object p0, p0, Landroidx/mediarouter/app/e;->b:Lcod;

    invoke-virtual {p0, v9}, Lcod;->j(I)V

    const-wide/16 p0, 0x1f4

    invoke-virtual {v2, v6, p0, p1}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    return-void

    :pswitch_f0
    check-cast p0, Lhnd;

    invoke-virtual {p0}, Lzp1;->dismiss()V

    return-void

    :pswitch_f6
    check-cast p0, Lnmd;

    invoke-virtual {p0}, Lnmd;->dismiss()V

    return-void

    :pswitch_fc
    check-cast p0, Lqdd;

    invoke-virtual {p0}, Lqdd;->g0()V

    throw v7

    :pswitch_102
    check-cast p0, Lh8d;

    iget-object p1, p0, Lh8d;->j:Lq5g;

    iget-object p1, p1, Lq5g;->d:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/premium/ui/view/SubscriptionPlanList;

    invoke-virtual {p1}, Lcom/opera/android/premium/ui/view/SubscriptionPlanList;->a()Lamk;

    move-result-object p1

    if-eqz p1, :cond_11a

    iget-object v0, p0, Lh8d;->g:Lg8d;

    new-instance v1, Ljg4;

    invoke-direct {v1, p0, p1, v10}, Ljg4;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {v0, v1}, Lg8d;->j(Ljg4;)V

    :cond_11a
    return-void

    :pswitch_11b
    check-cast p0, Lr7d;

    iget-object p0, p0, Lr7d;->b:Lp12;

    iget-object p1, p0, Lp12;->h:Ljava/lang/Object;

    check-cast p1, Ltsd;

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lp7d;

    if-eqz p1, :cond_177

    iget-object v0, p0, Lp12;->f:Ljava/lang/Object;

    check-cast v0, Lx5f;

    iget-boolean v1, p1, Lp7d;->b:Z

    if-eqz v1, :cond_136

    sget-object v1, Lnh0;->b:Lnh0;

    goto :goto_138

    :cond_136
    sget-object v1, Lnh0;->c:Lnh0;

    :goto_138
    iget-boolean v2, v0, Lx5f;->h:Z

    if-eqz v2, :cond_160

    iget-object v2, v0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v3

    new-instance v4, Llh0;

    const/16 v6, 0x98b

    const/4 v7, -0x1

    invoke-direct {v4, v6, v7, v10}, Ljf0;-><init>(III)V

    sget-object v6, Lmh0;->z:Lmh0;

    invoke-virtual {v4, v9, v8, v6}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v4, v5, v8, v1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v3, v2}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object v1

    invoke-virtual {v1}, Lqd0;->B0()Lhf0;

    move-result-object v1

    invoke-virtual {v1, v4}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v0, v3}, Lx5f;->U0(Lx56;)V

    :cond_160
    iget-object p0, p0, Lp12;->g:Ljava/lang/Object;

    check-cast p0, Lva2;

    iget-byte p1, p1, Lp7d;->a:B

    iget-object p0, p0, Lva2;->b:Ljava/lang/Object;

    check-cast p0, Lf7d;

    iget-object v0, p0, Lf7d;->h:Ljtg;

    invoke-virtual {v0}, Ljtg;->d()Z

    move-result v0

    if-eqz v0, :cond_177

    iget-object p0, p0, Lf7d;->j:Lyug;

    invoke-virtual {p0, p1}, Lyug;->a(I)V

    :cond_177
    return-void

    :pswitch_178
    check-cast p0, Li7d;

    invoke-virtual {p0}, Li7d;->o0()V

    return-void

    :pswitch_17e
    check-cast p0, Lzuc;

    iget-object p0, p0, Lzuc;->f:Lyqa;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p0, p1}, Lyqa;->r(Landroid/content/Context;)V

    return-void

    :pswitch_18a
    check-cast p0, Llrc;

    iget-object p0, p0, Llrc;->s:Lqrc;

    iget-object p0, p0, Lqrc;->b:Ldnb;

    invoke-virtual {p0}, Ldnb;->run()V

    return-void

    :pswitch_194
    check-cast p0, Lq4b;

    invoke-virtual {p0}, Lq4b;->invoke()Ljava/lang/Object;

    return-void

    :pswitch_19a
    check-cast p0, Ljkc;

    invoke-virtual {p0, p1}, Ljkc;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_1a0
    check-cast p0, Lzoc;

    iget-object p1, p0, Lzoc;->j:Lwmc;

    if-eqz p1, :cond_1af

    iget-object p0, p0, Lzoc;->d:Lokc;

    iget-object p0, p0, Lokc;->a:Lqkc;

    iget-object p0, p0, Lqkc;->b:Ljs6;

    invoke-virtual {p0, p1}, Ljs6;->b(Lzmc;)V

    :cond_1af
    return-void

    :pswitch_1b0
    check-cast p0, Ljkc;

    invoke-virtual {p0, p1}, Ljkc;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_1b6
    check-cast p0, Lhoc;

    iget-object p1, p0, Lhoc;->h:Lqmc;

    if-eqz p1, :cond_1c5

    iget-object p0, p0, Lhoc;->d:Lokc;

    iget-object p0, p0, Lokc;->a:Lqkc;

    iget-object p0, p0, Lqkc;->b:Ljs6;

    invoke-virtual {p0, p1}, Ljs6;->b(Lzmc;)V

    :cond_1c5
    return-void

    :pswitch_1c6
    check-cast p0, Lfoc;

    iget-object p1, p0, Lfoc;->g:Lpmc;

    if-eqz p1, :cond_1d5

    iget-object p0, p0, Lfoc;->d:Lokc;

    iget-object p0, p0, Lokc;->a:Lqkc;

    iget-object p0, p0, Lqkc;->b:Ljs6;

    invoke-virtual {p0, p1}, Ljs6;->b(Lzmc;)V

    :cond_1d5
    return-void

    :pswitch_1d6
    check-cast p0, Lznc;

    iget-object p1, p0, Lznc;->h:Lnmc;

    if-eqz p1, :cond_1e5

    iget-object p0, p0, Lznc;->d:Lokc;

    iget-object p0, p0, Lokc;->a:Lqkc;

    iget-object p0, p0, Lqkc;->b:Ljs6;

    invoke-virtual {p0, p1}, Ljs6;->b(Lzmc;)V

    :cond_1e5
    return-void

    :pswitch_1e6
    check-cast p0, Lxkc;

    iget-object p1, p0, Lxkc;->g:Lkmc;

    if-eqz p1, :cond_1f5

    iget-object p0, p0, Lxkc;->d:Lokc;

    iget-object p0, p0, Lokc;->a:Lqkc;

    iget-object p0, p0, Lqkc;->b:Ljs6;

    invoke-virtual {p0, p1}, Ljs6;->b(Lzmc;)V

    :cond_1f5
    return-void

    :pswitch_1f6
    check-cast p0, Lqkc;

    iget-object p0, p0, Lqkc;->b:Ljs6;

    iput-boolean v8, p0, Ljs6;->b:Z

    iget-object p1, p0, Ljs6;->d:Ljava/lang/Object;

    check-cast p1, Lfs6;

    iget-object p1, p1, Lfs6;->a:Lcom/opera/android/settings/SettingsManager;

    const-string v0, "live_scores_enabled"

    invoke-virtual {p1, v9, v0}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    iget-object p0, p0, Ljs6;->g:Ljava/lang/Object;

    check-cast p0, Lxoc;

    sget-object p1, Ltg0;->f:Ltg0;

    invoke-virtual {p0, p1}, Lxoc;->a(Ltg0;)V

    return-void

    :pswitch_211
    check-cast p0, Lg9c;

    invoke-virtual {p0, p1}, Lo73;->p(Landroid/view/View;)V

    return-void

    :pswitch_217
    check-cast p0, Li9c;

    iget-object p0, p0, Li9c;->f:Ljava/lang/Object;

    check-cast p0, Li16;

    iget-object p1, p0, Li16;->c:Ljava/lang/Object;

    check-cast p1, Ly00;

    iget-object p1, p1, Lg10;->G:Lw00;

    iget-object p0, p0, Li16;->b:Ljava/lang/Object;

    check-cast p0, Lcie;

    iput-boolean v8, p1, Lw00;->m:Z

    invoke-static {p0, v5}, Lcs5;->q0(Lcie;I)V

    iget-object v0, p0, Lcie;->P:Ljsd;

    if-eqz v0, :cond_237

    iget-object p0, p0, Lcie;->w0:Laoo;

    if-eqz p0, :cond_237

    invoke-virtual {p0, v0}, Laoo;->j(Landroid/view/View;)V

    :cond_237
    iput-boolean v9, p1, Lw00;->m:Z

    return-void

    :pswitch_23a
    check-cast p0, Lf9c;

    invoke-virtual {p0}, Lryl;->g0()V

    iget-object p0, p0, Lf9c;->v:Ljava/lang/Object;

    check-cast p0, Li9c;

    invoke-virtual {p0}, Li9c;->g()V

    return-void

    :pswitch_247
    check-cast p0, Ly83;

    iget-object p0, p0, Ly83;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {p0}, Landroid/view/View;->callOnClick()Z

    return-void

    :pswitch_251
    check-cast p0, Lh0c;

    iget-object v0, p0, Lh0c;->c:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->dismiss()V

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    instance-of v0, p1, Ljava/lang/String;

    if-eqz v0, :cond_263

    move-object v7, p1

    check-cast v7, Ljava/lang/String;

    :cond_263
    if-eqz v7, :cond_26c

    iget-object p0, p0, Lh0c;->d:Lkotlin/jvm/functions/Function1;

    if-eqz p0, :cond_26c

    invoke-interface {p0, v7}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_26c
    return-void

    :pswitch_26d
    check-cast p0, Lo2b;

    iget-object p1, p0, Lo2b;->t:Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lq2b;

    new-instance v0, Lal7;

    const/16 v1, 0x1c

    invoke-direct {v0, p0, v1}, Lal7;-><init>(Ljava/lang/Object;B)V

    iget-object p0, p1, Lq2b;->b:Lu2b;

    iget-object p1, p1, Lq2b;->c:Lpde;

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ln3b;

    iget-boolean v1, v1, Ln3b;->a:Z

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ln3b;

    iget-boolean p1, p1, Ln3b;->b:Z

    if-eqz v1, :cond_2e5

    if-eqz p1, :cond_2ce

    new-instance p1, Lp2b;

    invoke-direct {p1, v0, v9}, Lp2b;-><init>(Lal7;B)V

    new-instance v0, Lqj2;

    const/4 v1, 0x6

    invoke-direct {v0, p1, v1}, Lqj2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget p1, Lcom/opera/android/import_data/ImportChromeDataActivity;->d0:I

    iget-object v1, p0, Lu2b;->a:Lcom/opera/android/BrowserActivity;

    sget-object p0, Lw2b;->b:Lhv5;

    new-instance v4, Lrxh;

    const p0, 0x7f140c6a

    invoke-direct {v4, p0}, Lrxh;-><init>(I)V

    sget-object v6, Llqm;->d:Llqm;

    const/4 v5, 0x1

    const-class v2, Lcom/opera/android/import_data/ImportChromeDataActivity;

    const-string v3, "https://passwords.google.com/options"

    invoke-static/range {v1 .. v6}, Lcom/opera/android/FullscreenWebActivity;->e0(Landroid/content/Context;Ljava/lang/Class;Ljava/lang/String;Lpxh;ZLlqm;)Landroid/content/Intent;

    move-result-object p0

    const-string p1, "extra_import_entry_point"

    const-string v2, "deeplink"

    invoke-virtual {p0, p1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-static {v1}, Loi;->d(Landroid/content/Context;)Loi;

    move-result-object p1

    check-cast p1, Lhjf;

    invoke-virtual {p1, p0, v0}, Lhjf;->D(Landroid/content/Intent;Lni;)V

    goto :goto_2fe

    :cond_2ce
    new-instance p1, Lp2b;

    invoke-direct {p1, v0, v8}, Lp2b;-><init>(Lal7;B)V

    new-instance v0, Lqj2;

    invoke-direct {v0, p1, v10}, Lqj2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget p1, Lcom/opera/android/import_data/ImportChromeBookmarksActivity;->b0:I

    iget-object p0, p0, Lu2b;->a:Lcom/opera/android/BrowserActivity;

    sget-object p1, Lw2b;->e:Lw2b;

    invoke-static {p0, v0, p1}, Lo0g;->E0(Lcom/opera/android/BrowserActivity;Lni;Lw2b;)V

    goto :goto_2fe

    :cond_2e5
    if-eqz p1, :cond_2fe

    new-instance p1, Lp2b;

    invoke-direct {p1, v0, v6}, Lp2b;-><init>(Lal7;B)V

    new-instance v0, Lqj2;

    const/4 v1, 0x5

    invoke-direct {v0, p1, v1}, Lqj2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget p1, Lcom/opera/android/import_data/ImportChromePasswordsActivity;->b0:I

    iget-object p0, p0, Lu2b;->a:Lcom/opera/android/BrowserActivity;

    sget-object p1, Lw2b;->e:Lw2b;

    invoke-static {p0, v0, p1}, Lk1g;->f0(Lcom/opera/android/BrowserActivity;Lni;Lw2b;)V

    :cond_2fe
    :goto_2fe
    return-void

    :pswitch_2ff
    check-cast p0, Ll2b;

    invoke-static {p0}, Lmdb;->b(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p1, v4}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p1, v3}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    invoke-static {v10}, Lj7c;->f(I)B

    move-result v0

    invoke-virtual {p1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    invoke-virtual {p1, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void

    :pswitch_319
    check-cast p0, Lcom/opera/android/import_data/ImportChromeDataActivity;

    sget p1, Lcom/opera/android/import_data/ImportChromeDataActivity;->d0:I

    invoke-static {p0}, Lmdb;->b(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p1, v4}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p1, v3}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    invoke-static {v10}, Lj7c;->f(I)B

    move-result v0

    invoke-virtual {p1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    invoke-virtual {p1, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    sget-object p0, Laij;->a:Laij;

    invoke-static {p0}, Lac8;->b(Ljava/lang/Object;)V

    return-void

    :pswitch_33a
    check-cast p0, Lorg/chromium/ui/modelutil/PropertyModel;

    sget-object p1, Lkfo;->f:Lu5h;

    invoke-virtual {p0, p1}, Lorg/chromium/ui/modelutil/PropertyModel;->c(Lu5h;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/chromium/base/Callback;

    sget-object v0, Lkfo;->b:Lu5h;

    invoke-virtual {p0, v0}, Lorg/chromium/ui/modelutil/PropertyModel;->b(Lu5h;)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-interface {p1, p0}, Lorg/chromium/base/Callback;->onResult(Ljava/lang/Object;)V

    return-void

    :pswitch_352
    check-cast p0, Lvma;

    iget-object p0, p0, Lvma;->b:Lorg/chromium/base/Callback;

    invoke-interface {p0, v7}, Lorg/chromium/base/Callback;->onResult(Ljava/lang/Object;)V

    return-void

    :pswitch_data_35a
    .packed-switch 0x0
        :pswitch_352
        :pswitch_33a
        :pswitch_319
        :pswitch_2ff
        :pswitch_26d
        :pswitch_251
        :pswitch_247
        :pswitch_23a
        :pswitch_217
        :pswitch_211
        :pswitch_1f6
        :pswitch_1e6
        :pswitch_1d6
        :pswitch_1c6
        :pswitch_1b6
        :pswitch_1b0
        :pswitch_1a0
        :pswitch_19a
        :pswitch_194
        :pswitch_18a
        :pswitch_17e
        :pswitch_178
        :pswitch_11b
        :pswitch_102
        :pswitch_fc
        :pswitch_f6
        :pswitch_f0
        :pswitch_ad
        :pswitch_1d
    .end packed-switch
.end method
