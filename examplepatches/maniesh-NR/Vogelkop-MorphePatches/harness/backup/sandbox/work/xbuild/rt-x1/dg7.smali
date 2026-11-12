.class public final synthetic Ldg7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Ldg7;->a:B

    iput-object p1, p0, Ldg7;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 15

    iget-byte v0, p0, Ldg7;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x1

    iget-object p0, p0, Ldg7;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_374

    move-object v5, p0

    check-cast v5, Ltah;

    check-cast p1, Lly1;

    if-eqz p1, :cond_14

    iget-object p0, p1, Lly1;->b:Ljava/lang/String;

    goto :goto_15

    :cond_14
    move-object p0, v1

    :goto_15
    if-eqz p0, :cond_76

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v7

    iget-object p0, p1, Lly1;->a:Landroid/net/Uri;

    iget-object v9, p1, Lly1;->d:Lo29;

    iget-object v10, p1, Lly1;->b:Ljava/lang/String;

    iget-object p1, p1, Lly1;->c:Ljava/lang/String;

    sget-object v0, Lo29;->k:Lo29;

    if-ne v9, v0, :cond_3a

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v5, p0, p1}, Ltah;->a(Landroid/net/Uri;Ljava/lang/String;)V

    goto :goto_8d

    :cond_3a
    new-instance v6, Lzz9;

    invoke-direct {v6, v9, v1, v7}, Lzz9;-><init>(Lo29;Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v5, v6}, Ltah;->c(Lzz9;)V

    invoke-virtual {v5, v7, p1}, Ltah;->r(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    move-result-object v8

    new-instance p1, Lpy1;

    invoke-direct {p1, p0, v8}, Lpy1;-><init>(Landroid/net/Uri;Ljava/io/File;)V

    new-instance v4, Lpr3;

    const/4 v11, 0x1

    invoke-direct/range {v4 .. v11}, Lpr3;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/io/Serializable;Ljava/io/Serializable;Ljava/lang/Object;B)V

    iget-object p0, v5, Ltah;->c:Ljava/lang/Object;

    check-cast p0, Lumi;

    new-instance v0, Lrml;

    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-direct {v0, v1, p0}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance p0, Lry7;

    const/16 v1, 0xf

    invoke-direct {p0, v5, p1, v1}, Lry7;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, p0}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p0

    new-instance p1, Ltu7;

    const/16 v0, 0x12

    invoke-direct {p1, v4, v0}, Ltu7;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, p1}, Lplk;->t(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p0

    invoke-virtual {p0}, Lplk;->l()Loml;

    goto :goto_8d

    :cond_76
    iget-object p0, v5, Ltah;->g:Ljava/lang/Object;

    check-cast p0, Lf0a;

    iget-object p0, p0, Lf0a;->a:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lysj;

    new-instance p1, Lrxh;

    const v0, 0x7f140800

    invoke-direct {p1, v0}, Lrxh;-><init>(I)V

    invoke-static {p0, p1}, Ljoh;->h(Lysj;Lpxh;)V

    :goto_8d
    return-void

    :pswitch_8e
    check-cast p0, Lhu9;

    check-cast p1, Ljava/lang/String;

    if-nez p1, :cond_9a

    const-string p1, "Server error"

    invoke-virtual {p0, p1, v2, v3}, Lhu9;->g(Ljava/lang/String;ZZ)V

    goto :goto_c9

    :cond_9a
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const-string v1, "No fill"

    if-eqz v0, :cond_a6

    invoke-virtual {p0, v1, v3, v2}, Lhu9;->g(Ljava/lang/String;ZZ)V

    goto :goto_c9

    :cond_a6
    :try_start_a6
    invoke-virtual {p0, p1}, Lhu9;->h(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p1
    :try_end_aa
    .catch Lorg/json/JSONException; {:try_start_a6 .. :try_end_aa} :catch_c0
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_a6 .. :try_end_aa} :catch_c0

    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_b4

    invoke-virtual {p0, v1, v3, v2}, Lhu9;->g(Ljava/lang/String;ZZ)V

    goto :goto_c9

    :cond_b4
    iget-object v0, p0, Lhu9;->l:Liu9;

    iput-boolean v3, v0, Liu9;->x:Z

    iget-wide v1, p0, Lhu9;->k:J

    iput-wide v1, v0, Liu9;->w:J

    invoke-virtual {p0, p1}, Lk43;->e(Ljava/util/List;)V

    goto :goto_c9

    :catch_c0
    move-exception v0

    move-object p1, v0

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1, v2, v2}, Lhu9;->g(Ljava/lang/String;ZZ)V

    :goto_c9
    return-void

    :pswitch_ca
    check-cast p0, Lc37;

    check-cast p1, Lb2l;

    iget-object p0, p0, Lc37;->b:Ljava/lang/Object;

    check-cast p0, Landroid/view/MenuItem;

    if-eqz p1, :cond_dd

    check-cast p1, Ld7l;

    invoke-virtual {p1}, Ld7l;->n()Z

    move-result p1

    if-ne p1, v3, :cond_dd

    move v2, v3

    :cond_dd
    invoke-interface {p0, v2}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    return-void

    :pswitch_e1
    move-object v3, p0

    check-cast v3, Lpc9;

    check-cast p1, Ljava/lang/Boolean;

    const-string v11, ""

    const/4 v12, 0x0

    const-wide/high16 v4, -0x8000000000000000L

    const-string v6, ""

    const-string v7, ""

    const-string v8, ""

    const/4 v9, 0x0

    const-string v10, ""

    invoke-virtual/range {v3 .. v12}, Lpc9;->f(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    return-void

    :pswitch_f8
    check-cast p0, Lhu5;

    check-cast p1, Lq43;

    if-eqz p0, :cond_103

    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Lhu5;->run(Ljava/lang/Object;)V

    :cond_103
    return-void

    :pswitch_104
    check-cast p0, Ljd9;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_11a

    new-instance p1, Lp99;

    invoke-direct {p1}, Lp99;-><init>()V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object p0

    invoke-virtual {p1, p0}, Ls63;->w0(Landroid/content/Context;)V

    :cond_11a
    return-void

    :pswitch_11b
    check-cast p0, Landroid/os/CancellationSignal;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p0}, Landroid/os/CancellationSignal;->cancel()V

    return-void

    :pswitch_123
    check-cast p0, Lxc9;

    check-cast p1, Landroid/content/SharedPreferences;

    iget-object p0, p0, Lxc9;->b:Lnrl;

    invoke-virtual {p0}, Lnrl;->K()V

    return-void

    :pswitch_12d
    check-cast p0, Lrc9;

    check-cast p1, Ljava/lang/Boolean;

    iput-object v1, p0, Lrc9;->g:Lih4;

    new-instance v0, Ljava/util/ArrayList;

    iget-object p0, p0, Lrc9;->f:Ljava/util/ArrayList;

    invoke-direct {v0, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p0

    :goto_141
    if-ge v2, p0, :cond_14f

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    add-int/lit8 v2, v2, 0x1

    check-cast v1, Lcom/opera/api/Callback;

    invoke-interface {v1, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    goto :goto_141

    :cond_14f
    return-void

    :pswitch_150
    check-cast p0, Lp99;

    check-cast p1, Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getParentFragmentManager()Landroidx/fragment/app/w;

    move-result-object p0

    const-string v0, "flow-code-verification"

    const-string v1, "two-factor-authentication"

    const-string v4, "flow-scan-intro"

    const-string v5, "flow-generate"

    filled-new-array {v4, v5, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    move v1, v2

    :goto_169
    const/4 v4, 0x4

    if-ge v1, v4, :cond_17b

    aget-object v4, v0, v1

    invoke-virtual {p0, v4}, Landroidx/fragment/app/w;->F(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object v5

    if-eqz v5, :cond_178

    invoke-virtual {p0, v3, v4}, Landroidx/fragment/app/w;->V(ILjava/lang/String;)V

    goto :goto_17e

    :cond_178
    add-int/lit8 v1, v1, 0x1

    goto :goto_169

    :cond_17b
    invoke-virtual {p0}, Landroidx/fragment/app/w;->U()V

    :goto_17e
    invoke-static {p1}, Lq9n;->o(Landroid/content/Context;)Lcom/opera/android/BrowserActivity;

    move-result-object p0

    if-eqz p0, :cond_195

    const-class p1, Lhxk;

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->g0:Lwub;

    invoke-virtual {p0, p1}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object p0

    check-cast p0, Lhxk;

    new-array p1, v2, [I

    check-cast p0, Lkxk;

    invoke-virtual {p0, p1}, Lkxk;->a([I)V

    :cond_195
    return-void

    :pswitch_196
    check-cast p0, Lc59;

    check-cast p1, Landroid/content/SharedPreferences;

    iget-object p1, p0, Lc59;->b:Lm59;

    if-nez p1, :cond_1af

    new-instance p1, Lm59;

    invoke-virtual {p0}, Lc59;->b()Landroid/content/SharedPreferences;

    move-result-object v0

    iget-object v2, p0, Lc59;->c:Lj59;

    iget-object v2, v2, Lj59;->e:Ljava/lang/String;

    iget-object v3, p0, Lc59;->h:Lb59;

    invoke-direct {p1, v0, v2, v3, p0}, Lm59;-><init>(Landroid/content/SharedPreferences;Ljava/lang/String;Lb59;Lc59;)V

    iput-object p1, p0, Lc59;->b:Lm59;

    :cond_1af
    iget-boolean v0, p0, Lc59;->e:Z

    if-nez v0, :cond_1b6

    invoke-virtual {p0, p1}, Lc59;->a(Lm59;)V

    :cond_1b6
    iget-object p1, p0, Lc59;->j:Ljava/lang/Boolean;

    if-eqz p1, :cond_1c3

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-object v1, p0, Lc59;->j:Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Lc59;->f(Z)V

    :cond_1c3
    return-void

    :pswitch_1c4
    check-cast p0, Lkx8;

    check-cast p1, Ljava/lang/Boolean;

    iget-object p0, p0, Lkx8;->s:Landroidx/media3/ui/PlayerView;

    if-eqz p0, :cond_1d3

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-virtual {p0, p1}, Landroid/view/View;->setKeepScreenOn(Z)V

    :cond_1d3
    return-void

    :pswitch_1d4
    check-cast p0, Lbx8;

    check-cast p1, Lxw8;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1, v3}, Lxw8;->c(Z)V

    iget-object p0, p0, Lbx8;->m:Lhx8;

    iget-object p1, p1, Lxw8;->b:Lbwf;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Lbwf;->a()Ljava/lang/String;

    move-result-object p1

    const-string v0, "topnews"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1f4

    invoke-virtual {p0, v1}, Lhx8;->c(Lbwf;)V

    :cond_1f4
    return-void

    :pswitch_1f5
    check-cast p0, Lxw8;

    check-cast p1, Ljava/util/Collection;

    iget-object v0, p0, Lxw8;->h:Low8;

    invoke-virtual {v0, p1}, Lcu8;->b0(Ljava/util/Collection;)V

    invoke-virtual {p0}, Lxw8;->a()V

    return-void

    :pswitch_202
    check-cast p0, Liw8;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p0}, Lnv9;->w()V

    return-void

    :pswitch_20a
    check-cast p0, Lcv8;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iget-object p0, p0, Lcv8;->B:Lkm5;

    iput-boolean p1, p0, Lkm5;->a:Z

    return-void

    :pswitch_217
    check-cast p0, Ls9i;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-virtual {p0, p1}, Ls9i;->k0(Z)V

    return-void

    :pswitch_223
    check-cast p0, Lqmj;

    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lqmj;->J(Ljava/lang/String;)V

    return-void

    :pswitch_22b
    check-cast p0, Ldm8;

    check-cast p1, Ljava/lang/String;

    iget-object p0, p0, Ldm8;->r:Lgjm;

    new-instance v0, Lc9g;

    invoke-direct {v0, p1}, Lc9g;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0, v2}, Lgjm;->e(Ln37;Z)V

    return-void

    :pswitch_23a
    check-cast p0, Lvl6;

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    const/high16 v0, 0x3f800000    # 1.0f

    const/4 v1, 0x0

    invoke-static {p1, v1, v0}, Lcs5;->s(FFF)F

    move-result v0

    iget-object p0, p0, Lvl6;->c:Ljava/lang/Object;

    check-cast p0, Lnj8;

    invoke-interface {p0, v0}, Lnj8;->n0(F)V

    const/high16 v0, -0x40800000    # -1.0f

    invoke-static {p1, v0, v1}, Lcs5;->s(FFF)F

    move-result p1

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    invoke-interface {p0, p1}, Lnj8;->U(F)V

    return-void

    :pswitch_25e
    check-cast p0, Lyz5;

    check-cast p1, Landroid/view/View;

    sget-object p1, Lhjm;->a:Lhjm;

    invoke-virtual {p0, p1}, Ld63;->finish(Lhjm;)V

    const-string p0, "https://support-vpn-pro.opera.com/"

    sget-object p1, Llqm;->v:Llqm;

    invoke-static {p0, p1, v2}, Lay3;->a(Ljava/lang/String;Llqm;Z)Lvx3;

    move-result-object p0

    const/4 p1, 0x3

    iput p1, p0, Lvx3;->b:I

    invoke-static {p0, v3, p0}, Lo18;->t(Lvx3;ZLvx3;)V

    return-void

    :pswitch_276
    check-cast p0, Ls28;

    check-cast p1, [B

    iget-object v0, p0, Ls28;->b:Lb59;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    iget-object p0, p0, Ls28;->f:Ljava/lang/Object;

    check-cast p0, Lt1;

    invoke-virtual {p0}, Lt1;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lc36;

    invoke-virtual {p0, p1}, Lc36;->d([B)[B

    move-result-object p0

    if-eqz p0, :cond_29c

    const/4 p1, 0x2

    invoke-static {p0, p1}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object p0

    const-string p1, "k2"

    invoke-static {v0, p1, p0}, Lcom/appsflyer/internal/j;->c(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)V

    :cond_29c
    return-void

    :pswitch_29d
    check-cast p0, Lvp2;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-virtual {p0, p1}, Lvp2;->l(Z)V

    return-void

    :pswitch_2a9
    check-cast p0, Law7;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p0, v2}, Law7;->l0(Z)V

    return-void

    :pswitch_2b1
    check-cast p0, Lhd;

    check-cast p1, Ldy1;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-eqz p1, :cond_2d0

    if-ne p1, v3, :cond_2cd

    iget-object p0, p0, Lhd;->d:Ljava/lang/Object;

    check-cast p0, Lysj;

    new-instance p1, Lrxh;

    const v0, 0x7f140cd3

    invoke-direct {p1, v0}, Lrxh;-><init>(I)V

    invoke-static {p0, p1}, Ljoh;->h(Lysj;Lpxh;)V

    goto :goto_2d0

    :cond_2cd
    invoke-static {}, Lh9o;->p()V

    :cond_2d0
    :goto_2d0
    return-void

    :pswitch_2d1
    check-cast p0, Lss7;

    check-cast p1, Lml3;

    iget-object v0, p0, Lss7;->B:Lml3;

    if-eq v0, p1, :cond_2f0

    if-eqz v0, :cond_2dd

    iput-boolean v3, p0, Lss7;->z:Z

    :cond_2dd
    iput-object p1, p0, Lss7;->B:Lml3;

    iget-object v0, p0, Lss7;->A:Li53;

    check-cast v0, Lcom/opera/android/bookmarks/h;

    invoke-virtual {v0}, Lcom/opera/android/bookmarks/h;->o()Lcom/opera/android/bookmarks/c;

    move-result-object v0

    invoke-static {p1, v0}, Lqm3;->a(Lml3;Lcom/opera/android/bookmarks/c;)Lqm3;

    move-result-object p1

    iput-object p1, p0, Lss7;->C:Lqm3;

    invoke-virtual {p0}, Lss7;->P0()V

    :cond_2f0
    return-void

    :pswitch_2f1
    check-cast p0, Lua7;

    check-cast p1, Ljava/lang/String;

    sget-object p1, Lap7;->a:Lap7;

    iput-object p1, p0, Lua7;->c:Ljava/lang/Object;

    iget-object p0, p0, Lua7;->d:Ljava/lang/Object;

    check-cast p0, Lzo7;

    iget-object p0, p0, Lzo7;->a:Lode;

    sget-object p1, Lbp7;->b:Lbp7;

    invoke-virtual {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    return-void

    :pswitch_305
    check-cast p0, Ljava/util/HashMap;

    check-cast p1, Lpne;

    iget-object v0, p1, Lpne;->c:Ljava/util/List;

    iget-object v3, p1, Lpne;->a:Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_34b

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object p1, p1, Lpne;->c:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_31e
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_33f

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    const-string v5, "sha256/"

    invoke-static {v5, v4}, Lsko;->j(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    filled-new-array {v4}, [Ljava/lang/String;

    move-result-object v4

    aget-object v4, v4, v2

    new-instance v5, Lmq4;

    invoke-direct {v5, v3, v4}, Lmq4;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_31e

    :cond_33f
    new-instance p1, Lnq4;

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->n0(Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object v0

    invoke-direct {p1, v0, v1}, Lnq4;-><init>(Ljava/util/Set;Lokhttp3/internal/tls/CertificateChainCleaner;)V

    invoke-virtual {p0, v3, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_34b
    return-void

    :pswitch_34c
    check-cast p0, Ligi;

    check-cast p1, Ljava/util/Set;

    iget-object v0, p0, Ligi;->e:Ljava/lang/Object;

    check-cast v0, Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->clear()V

    invoke-interface {v0, p1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    iget-object p1, p0, Ligi;->g:Ljava/lang/Object;

    check-cast p1, Lkg7;

    if-eqz p1, :cond_363

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    :cond_363
    invoke-virtual {p0}, Ligi;->I0()V

    return-void

    :pswitch_367
    check-cast p0, Lcom/opera/android/downloads/DownloadService;

    check-cast p1, Landroid/app/Notification;

    sget-boolean v0, Lcom/opera/android/downloads/DownloadService;->e:Z

    const v0, 0x7f0a02ed

    invoke-virtual {p0, p1, v0}, Lzp5;->b(Landroid/app/Notification;I)V

    return-void

    :pswitch_data_374
    .packed-switch 0x0
        :pswitch_367
        :pswitch_34c
        :pswitch_305
        :pswitch_2f1
        :pswitch_2d1
        :pswitch_2b1
        :pswitch_2a9
        :pswitch_29d
        :pswitch_276
        :pswitch_25e
        :pswitch_23a
        :pswitch_22b
        :pswitch_223
        :pswitch_217
        :pswitch_20a
        :pswitch_202
        :pswitch_1f5
        :pswitch_1d4
        :pswitch_1c4
        :pswitch_196
        :pswitch_150
        :pswitch_12d
        :pswitch_123
        :pswitch_11b
        :pswitch_104
        :pswitch_f8
        :pswitch_e1
        :pswitch_ca
        :pswitch_8e
    .end packed-switch
.end method
