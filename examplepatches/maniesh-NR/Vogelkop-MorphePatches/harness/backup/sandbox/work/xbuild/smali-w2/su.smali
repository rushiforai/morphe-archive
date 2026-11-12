.class public final synthetic Lsu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;

.field public final synthetic d:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 5

    .line 13
    iput-byte p4, p0, Lsu;->a:B

    iput-object p1, p0, Lsu;->b:Ljava/lang/Object;

    iput-object p2, p0, Lsu;->c:Ljava/lang/Object;

    iput-object p3, p0, Lsu;->d:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lxu;Lq3;Lzt1;Ljava/lang/String;)V
    .registers 5

    const/4 p4, 0x0

    iput-byte p4, p0, Lsu;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lsu;->b:Ljava/lang/Object;

    iput-object p2, p0, Lsu;->c:Ljava/lang/Object;

    iput-object p3, p0, Lsu;->d:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 18

    move-object/from16 v0, p0

    iget-byte v1, v0, Lsu;->a:B

    const/4 v2, 0x2

    const/16 v3, 0xa

    const/4 v4, 0x4

    const/4 v5, 0x5

    const/4 v6, 0x1

    const/4 v7, 0x0

    const/4 v8, 0x0

    packed-switch v1, :pswitch_data_7ea

    iget-object v1, v0, Lsu;->b:Ljava/lang/Object;

    check-cast v1, Ltcl;

    iget-object v2, v0, Lsu;->c:Ljava/lang/Object;

    check-cast v2, Lcom/leanplum/ActionContext;

    iget-object v0, v0, Lsu;->d:Ljava/lang/Object;

    check-cast v0, Lorm;

    move-object/from16 v3, p1

    check-cast v3, Ltw7;

    invoke-static {v1, v2, v0, v3}, Lcom/leanplum/messagetemplates/OperaSubscriptionDialog;->c(Ltcl;Lcom/leanplum/ActionContext;Lorm;Ltw7;)V

    return-void

    :pswitch_23
    iget-object v1, v0, Lsu;->b:Ljava/lang/Object;

    move-object v10, v1

    check-cast v10, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;

    iget-object v1, v0, Lsu;->c:Ljava/lang/Object;

    move-object v12, v1

    check-cast v12, Ls3g;

    iget-object v0, v0, Lsu;->d:Ljava/lang/Object;

    check-cast v0, Lt3g;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    sget v2, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->i:I

    if-eqz v1, :cond_77

    invoke-virtual {v10}, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->u()Lxu2;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    iget-object v1, v1, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object v1, v1, Lxv1;->m:Lj4c;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ltv1;

    const v2, 0x7f140323

    invoke-virtual {v10, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v11

    new-instance v13, Lrxh;

    const v2, 0x7f141328

    invoke-direct {v13, v2}, Lrxh;-><init>(I)V

    new-instance v14, Lrxh;

    const v2, 0x7f1403bf

    invoke-direct {v14, v2}, Lrxh;-><init>(I)V

    new-instance v15, La32;

    const/16 v2, 0x16

    invoke-direct {v15, v10, v0, v12, v2}, La32;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v9, Lev2;

    invoke-direct/range {v9 .. v15}, Lev2;-><init>(Landroid/content/Context;Ljava/lang/String;Ls3g;Lrxh;Lrxh;Lav2;)V

    invoke-virtual {v9}, Landroid/app/Dialog;->show()V

    goto :goto_7f

    :cond_77
    new-instance v1, Lve9;

    invoke-direct {v1, v10, v0, v12, v8}, Lve9;-><init>(Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;Lt3g;Ls3g;Z)V

    invoke-interface {v0, v12, v1}, Lt3g;->b(Ls3g;Lve9;)V

    :goto_7f
    return-void

    :pswitch_80
    iget-object v1, v0, Lsu;->b:Ljava/lang/Object;

    check-cast v1, Lgv8;

    iget-object v2, v0, Lsu;->c:Ljava/lang/Object;

    check-cast v2, Landroid/widget/ImageView;

    iget-object v0, v0, Lsu;->d:Ljava/lang/Object;

    check-cast v0, Ligi;

    move-object/from16 v3, p1

    check-cast v3, Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Lgv8;->invoke()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_b6

    if-eqz v3, :cond_b3

    new-instance v7, Lhq4;

    iget-object v0, v0, Ligi;->f:Ljava/lang/Object;

    check-cast v0, Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->floatValue()F

    move-result v0

    const/16 v1, 0xe

    invoke-direct {v7, v0, v8, v1, v3}, Lhq4;-><init>(FIILandroid/graphics/Bitmap;)V

    :cond_b3
    invoke-virtual {v2, v7}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_b6
    return-void

    :pswitch_b7
    iget-object v1, v0, Lsu;->b:Ljava/lang/Object;

    check-cast v1, Lmgh;

    iget-object v2, v0, Lsu;->c:Ljava/lang/Object;

    check-cast v2, Lmyk;

    iget-object v0, v0, Lsu;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/api/Callback;

    move-object/from16 v3, p1

    check-cast v3, Ljava/util/List;

    iget-object v4, v1, Lmgh;->c:Ljava/lang/Object;

    check-cast v4, Lcom/opera/api/Callback;

    if-eqz v4, :cond_111

    invoke-static {}, Ldgh;->h()Landroid/net/Uri;

    move-result-object v6

    invoke-virtual {v6}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_d9
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_105

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljv5;

    iget-object v8, v7, Ljv5;->b:Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_d9

    iget-object v8, v7, Ljv5;->d:Ljava/lang/String;

    const-string v9, "/"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_d9

    iget-object v7, v7, Ljv5;->c:Ljava/lang/String;

    invoke-virtual {v7, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_d9

    sget-object v0, Laf9;->b:Laf9;

    invoke-interface {v4, v0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    goto :goto_111

    :cond_105
    new-instance v3, Lj12;

    invoke-direct {v3, v0, v5}, Lj12;-><init>(Lcom/opera/api/Callback;B)V

    new-instance v0, Ljyk;

    invoke-direct {v0, v2, v3}, Ljyk;-><init>(Lmyk;Lcom/opera/api/Callback;)V

    iput-object v0, v1, Lmgh;->b:Ljava/lang/Object;

    :cond_111
    :goto_111
    return-void

    :pswitch_112
    iget-object v1, v0, Lsu;->b:Ljava/lang/Object;

    check-cast v1, Lbf9;

    iget-object v2, v0, Lsu;->c:Ljava/lang/Object;

    check-cast v2, Laz4;

    iget-object v0, v0, Lsu;->d:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    move-object/from16 v3, p1

    check-cast v3, Lke9;

    iput-object v7, v1, Lbf9;->y:Lmgh;

    new-instance v1, Lze9;

    invoke-direct {v1, v3, v0}, Lze9;-><init>(Lke9;Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Laz4;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_12d
    iget-object v1, v0, Lsu;->b:Ljava/lang/Object;

    check-cast v1, Lbf9;

    iget-object v2, v0, Lsu;->c:Ljava/lang/Object;

    check-cast v2, Lmgh;

    iget-object v0, v0, Lsu;->d:Ljava/lang/Object;

    check-cast v0, Ldg7;

    move-object/from16 v3, p1

    check-cast v3, Ljava/lang/Long;

    invoke-virtual {v1, v3, v0}, Lbf9;->p(Ljava/lang/Long;Lcom/opera/api/Callback;)Lih4;

    move-result-object v0

    iput-object v0, v2, Lmgh;->b:Ljava/lang/Object;

    return-void

    :pswitch_144
    iget-object v1, v0, Lsu;->b:Ljava/lang/Object;

    check-cast v1, Lg77;

    iget-object v2, v0, Lsu;->c:Ljava/lang/Object;

    check-cast v2, Lnq8;

    iget-object v0, v0, Lsu;->d:Ljava/lang/Object;

    check-cast v0, Lqq8;

    move-object/from16 v8, p1

    check-cast v8, Lpne;

    new-instance v9, Ly03;

    sget-object v10, Lpn7;->b:Lon7;

    sget-object v10, Lun7;->e:Lun7;

    invoke-static {v5, v10}, Lcs5;->x0(ILun7;)J

    move-result-wide v10

    invoke-direct {v9, v10, v11}, Ly03;-><init>(J)V

    new-instance v5, Lfvh;

    invoke-direct {v5}, Lfvh;-><init>()V

    sget-object v10, Lrvh;->Companion:Lqvh;

    new-instance v11, Lorg/json/JSONObject;

    invoke-direct {v11}, Lorg/json/JSONObject;-><init>()V

    const-string v12, "clientInfo"

    new-instance v13, Lorb;

    invoke-direct {v13}, Lorb;-><init>()V

    const-string v14, "countryCode"

    iget-object v15, v2, Lnq8;->a:Ljava/lang/String;

    invoke-virtual {v13, v15, v14}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v14, "hashedOperaId"

    iget-object v15, v2, Lnq8;->b:Ljava/lang/String;

    invoke-virtual {v13, v15, v14}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v14, "product"

    iget-object v15, v2, Lnq8;->c:Ljava/lang/String;

    invoke-virtual {v13, v15, v14}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v14, "version"

    iget-object v15, v2, Lnq8;->d:Ljava/lang/String;

    invoke-virtual {v13, v15, v14}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v2, v2, Lnq8;->e:Ljava/lang/String;

    if-eqz v2, :cond_199

    const-string v14, "abGroup"

    invoke-virtual {v13, v2, v14}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_199
    :try_start_199
    invoke-static {v13}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v11, v12, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1a0
    .catch Lorg/json/JSONException; {:try_start_199 .. :try_end_1a0} :catch_1f6

    invoke-virtual {v11}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    sget-object v11, Lesd;->e:Lkotlin/text/Regex;

    const-string v11, "application/json; charset=utf-8"

    invoke-static {v11}, Lwyh;->x(Ljava/lang/String;)Lesd;

    move-result-object v11

    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v2, v11}, Lqvh;->b(Ljava/lang/String;Lesd;)Lpvh;

    move-result-object v2

    const-string v10, "POST"

    invoke-virtual {v5, v10, v2}, Lfvh;->e(Ljava/lang/String;Lrvh;)V

    iget-object v2, v8, Lpne;->a:Ljava/lang/String;

    const-string v10, "https://"

    const-string v11, "/generate-catalog"

    invoke-static {v10, v2, v11}, Lsko;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    new-instance v10, Lrma;

    invoke-direct {v10, v4}, Lrma;-><init>(B)V

    invoke-virtual {v10, v2, v7}, Lrma;->o(Ljava/lang/String;Lhra;)V

    invoke-virtual {v10}, Lrma;->d()Lhra;

    move-result-object v2

    iput-object v2, v5, Lfvh;->a:Lhra;

    const-string v2, "Api-Key"

    iget-object v4, v8, Lpne;->b:Ljava/lang/String;

    invoke-virtual {v5, v2, v4}, Lfvh;->a(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v2, v1, Lg77;->b:Ljava/lang/Object;

    check-cast v2, Lii;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lt9f;

    invoke-static {v5, v2}, Lj7c;->q(Lfvh;Lt9f;)Lokhttp3/internal/connection/RealCall;

    move-result-object v2

    iget v4, v9, Ly03;->a:I

    const/4 v5, 0x3

    if-ge v4, v5, :cond_1ed

    add-int/2addr v4, v6

    iput v4, v9, Ly03;->a:I

    :cond_1ed
    new-instance v4, Lua7;

    invoke-direct {v4, v1, v0, v9, v3}, Lua7;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {v2, v4}, Lv84;->enqueue(Lf94;)V

    goto :goto_1fa

    :catch_1f6
    move-exception v0

    invoke-static {v0}, Lt3p;->n(Ljava/lang/Throwable;)V

    :goto_1fa
    return-void

    :pswitch_1fb
    iget-object v1, v0, Lsu;->b:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/account/auth/EditProfileAuthActivity;

    iget-object v2, v0, Lsu;->c:Ljava/lang/Object;

    check-cast v2, Ldb;

    iget-object v0, v0, Lsu;->d:Ljava/lang/Object;

    check-cast v0, Lbf9;

    move-object/from16 v3, p1

    check-cast v3, Ljava/lang/String;

    sget v3, Lcom/opera/android/account/auth/EditProfileAuthActivity;->V:I

    iget-boolean v3, v1, Lcom/opera/android/account/auth/EditProfileAuthActivity;->U:Z

    if-nez v3, :cond_220

    iget-object v1, v1, Lcom/opera/android/account/auth/EditProfileAuthActivity;->P:Lov0;

    if-eqz v1, :cond_220

    iget-object v1, v1, Lov0;->c:Ljava/lang/Object;

    check-cast v1, Lov0;

    iget-object v1, v1, Lov0;->d:Ljava/lang/Object;

    check-cast v1, Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    :cond_220
    invoke-virtual {v2}, Ldb;->f()Z

    move-result v1

    if-eqz v1, :cond_229

    invoke-virtual {v2, v6}, Ldb;->j(Z)V

    :cond_229
    invoke-virtual {v0}, Lbf9;->h()V

    return-void

    :pswitch_22d
    iget-object v1, v0, Lsu;->b:Ljava/lang/Object;

    check-cast v1, Lev7;

    iget-object v2, v0, Lsu;->c:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    iget-object v0, v0, Lsu;->d:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    move-object/from16 v3, p1

    check-cast v3, Landroid/graphics/drawable/Drawable;

    iget-object v4, v1, Lev7;->f:Ljava/lang/Object;

    check-cast v4, Lvs;

    iget-object v5, v1, Lev7;->b:Ljava/lang/Object;

    check-cast v5, Ljava/util/LinkedHashMap;

    iget-object v1, v1, Lev7;->a:Ljava/lang/Object;

    check-cast v1, Lpde;

    iget-object v4, v4, Lvs;->d:Ljava/lang/Object;

    check-cast v4, Lcom/google/android/material/chip/ChipGroup;

    new-instance v6, Lg6n;

    invoke-direct {v6, v4}, Lg6n;-><init>(Landroid/view/ViewGroup;)V

    invoke-virtual {v6}, Lg6n;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_256
    move-object v6, v4

    check-cast v6, Lh6n;

    invoke-virtual {v6}, Lh6n;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_275

    invoke-virtual {v6}, Lh6n;->next()Ljava/lang/Object;

    move-result-object v6

    move-object v8, v6

    check-cast v8, Landroid/view/View;

    check-cast v8, Lx83;

    invoke-virtual {v8}, Landroid/view/View;->isSelected()Z

    move-result v9

    if-eqz v9, :cond_256

    iget-object v8, v8, Lx83;->A:Lhri;

    sget-object v9, Lhri;->c:Lhri;

    if-ne v8, v9, :cond_256

    goto :goto_276

    :cond_275
    move-object v6, v7

    :goto_276
    check-cast v6, Lgv6;

    if-eqz v6, :cond_2cf

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Luv7;

    iget-object v4, v4, Luv7;->e:Lpvb;

    if-eqz v4, :cond_28f

    invoke-interface {v4}, Lpvb;->m()Li1;

    move-result-object v4

    if-eqz v4, :cond_28f

    iget-object v4, v4, Li1;->d:Ljava/lang/Object;

    check-cast v4, Ljava/lang/String;

    goto :goto_290

    :cond_28f
    move-object v4, v7

    :goto_290
    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Luv7;

    iget-object v1, v1, Luv7;->e:Lpvb;

    if-eqz v1, :cond_2a5

    invoke-interface {v1}, Lpvb;->m()Li1;

    move-result-object v1

    if-eqz v1, :cond_2a5

    iget-object v1, v1, Li1;->e:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    goto :goto_2a6

    :cond_2a5
    move-object v1, v7

    :goto_2a6
    sget-object v8, Lhri;->c:Lhri;

    invoke-virtual {v5, v8}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lgri;

    if-eqz v9, :cond_2cf

    if-eqz v4, :cond_2c1

    invoke-virtual {v4, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2c1

    if-eqz v1, :cond_2c1

    invoke-virtual {v1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2c1

    move-object v7, v9

    :cond_2c1
    if-eqz v7, :cond_2cf

    const/16 v0, 0xef

    invoke-static {v7, v3, v0}, Lgri;->a(Lgri;Landroid/graphics/drawable/Drawable;I)Lgri;

    move-result-object v0

    invoke-interface {v5, v8, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v6, v0}, Lx83;->p(Lgri;)V

    :cond_2cf
    return-void

    :pswitch_2d0
    iget-object v1, v0, Lsu;->b:Ljava/lang/Object;

    check-cast v1, Ltn;

    iget-object v3, v0, Lsu;->c:Ljava/lang/Object;

    check-cast v3, Ltc2;

    iget-object v0, v0, Lsu;->d:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Runnable;

    move-object/from16 v4, p1

    check-cast v4, Lf3j;

    iget-object v1, v1, Ltn;->d:Ljava/lang/Object;

    check-cast v1, Ly73;

    new-instance v5, Lgl6;

    invoke-direct {v5, v4, v3, v0, v2}, Lgl6;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v5, v1, Ly73;->c:Ljava/lang/Object;

    iget-boolean v0, v1, Ly73;->b:Z

    if-eqz v0, :cond_2f4

    iput-object v7, v1, Ly73;->c:Ljava/lang/Object;

    invoke-virtual {v5}, Lgl6;->run()V

    :cond_2f4
    return-void

    :pswitch_2f5
    iget-object v1, v0, Lsu;->b:Ljava/lang/Object;

    check-cast v1, Lju2;

    iget-object v2, v0, Lsu;->c:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    iget-object v0, v0, Lsu;->d:Ljava/lang/Object;

    check-cast v0, Ltzn;

    move-object/from16 v3, p1

    check-cast v3, Ldnn;

    new-instance v4, Ld5o;

    invoke-direct {v4, v1, v2, v0}, Ld5o;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v3, v4}, Ldnn;->a(Lann;)V

    return-void

    :pswitch_30e
    iget-object v1, v0, Lsu;->b:Ljava/lang/Object;

    check-cast v1, Lbk5;

    iget-object v2, v0, Lsu;->c:Ljava/lang/Object;

    check-cast v2, Lgk5;

    iget-object v0, v0, Lsu;->d:Ljava/lang/Object;

    check-cast v0, Lwj5;

    move-object/from16 v3, p1

    check-cast v3, Ltw7;

    instance-of v4, v3, Lrw7;

    if-eqz v4, :cond_32e

    check-cast v3, Lrw7;

    iget-object v3, v3, Lrw7;->a:Ljava/lang/Object;

    check-cast v3, Ljava/util/List;

    iget-object v0, v0, Lwj5;->p:Ljava/lang/String;

    invoke-virtual {v1, v0, v2, v3}, Lbk5;->c(Ljava/lang/String;Lgk5;Ljava/util/List;)V

    goto :goto_387

    :cond_32e
    instance-of v0, v3, Lsw7;

    if-eqz v0, :cond_384

    check-cast v3, Lsw7;

    iget-object v0, v3, Lsw7;->a:Ljava/lang/Object;

    check-cast v0, Luj5;

    iget-object v3, v1, Lbk5;->a:Ljk5;

    iget-object v4, v3, Ljk5;->d:Ljava/lang/Object;

    monitor-enter v4

    :try_start_33d
    iget-object v5, v3, Ljk5;->e:Ljava/lang/String;

    iput-object v7, v3, Ljk5;->e:Ljava/lang/String;
    :try_end_341
    .catchall {:try_start_33d .. :try_end_341} :catchall_381

    monitor-exit v4

    if-eqz v5, :cond_35b

    iget-object v4, v3, Ljk5;->c:Lru9;

    invoke-virtual {v4}, Lru9;->b()Lnv6;

    move-result-object v4

    iget-object v6, v4, Lnv6;->a:Ljava/lang/Object;

    check-cast v6, Landroid/content/SharedPreferences$Editor;

    const-string v8, "config_bundle.active"

    invoke-interface {v6, v8, v5}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v4}, Lnv6;->w()V

    iget-object v3, v3, Ljk5;->a:Lpv1;

    invoke-virtual {v3, v5}, Lpv1;->accept(Ljava/lang/Object;)V

    :cond_35b
    iget-object v3, v1, Lbk5;->e:Ljava/lang/Runnable;

    invoke-interface {v3}, Ljava/lang/Runnable;->run()V

    new-instance v3, Ldk5;

    invoke-direct {v3, v0, v2}, Ldk5;-><init>(Luj5;Lgk5;)V

    iget-object v0, v1, Lbk5;->g:Llh4;

    if-eqz v0, :cond_36d

    iput-object v7, v0, Llh4;->b:Lcom/opera/api/Callback;

    iput-object v7, v1, Lbk5;->g:Llh4;

    :cond_36d
    iput-object v7, v1, Lbk5;->h:Lzj5;

    iget-object v0, v1, Lbk5;->a:Ljk5;

    iget-object v0, v0, Ljk5;->b:Lode;

    new-instance v2, Leb8;

    invoke-direct {v2, v3}, Leb8;-><init>(Lek5;)V

    invoke-virtual {v0, v2}, Lekc;->r(Ljava/lang/Object;)V

    sget-object v0, Lak5;->a:Lak5;

    invoke-virtual {v1, v0}, Lbk5;->d(Lak5;)V

    goto :goto_387

    :catchall_381
    move-exception v0

    monitor-exit v4

    throw v0

    :cond_384
    invoke-static {}, Lh9o;->p()V

    :goto_387
    return-void

    :pswitch_388
    iget-object v1, v0, Lsu;->b:Ljava/lang/Object;

    check-cast v1, Lbk5;

    iget-object v2, v0, Lsu;->c:Ljava/lang/Object;

    check-cast v2, Lgk5;

    iget-object v0, v0, Lsu;->d:Ljava/lang/Object;

    check-cast v0, Lvj5;

    move-object/from16 v3, p1

    check-cast v3, Ltw7;

    instance-of v4, v3, Lrw7;

    if-eqz v4, :cond_3a8

    check-cast v3, Lrw7;

    iget-object v3, v3, Lrw7;->a:Ljava/lang/Object;

    check-cast v3, Ljava/util/List;

    iget-object v0, v0, Lvj5;->p:Ljava/lang/String;

    invoke-virtual {v1, v0, v2, v3}, Lbk5;->c(Ljava/lang/String;Lgk5;Ljava/util/List;)V

    goto :goto_3cc

    :cond_3a8
    instance-of v0, v3, Lsw7;

    if-eqz v0, :cond_3c9

    check-cast v3, Lsw7;

    iget-object v0, v3, Lsw7;->a:Ljava/lang/Object;

    check-cast v0, Lwj5;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v3, Lak5;->d:Lak5;

    invoke-virtual {v1, v3}, Lbk5;->d(Lak5;)V

    iput-object v7, v1, Lbk5;->g:Llh4;

    iget-object v3, v1, Lbk5;->d:Ljw1;

    new-instance v4, Lsu;

    const/16 v5, 0x12

    invoke-direct {v4, v1, v2, v0, v5}, Lsu;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {v3, v0, v4}, Ljw1;->k(Lwj5;Lcom/opera/api/Callback;)V

    goto :goto_3cc

    :cond_3c9
    invoke-static {}, Lh9o;->p()V

    :goto_3cc
    return-void

    :pswitch_3cd
    iget-object v1, v0, Lsu;->b:Ljava/lang/Object;

    check-cast v1, Lbk5;

    iget-object v2, v0, Lsu;->c:Ljava/lang/Object;

    check-cast v2, Lgk5;

    iget-object v0, v0, Lsu;->d:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    move-object/from16 v3, p1

    check-cast v3, Ltw7;

    instance-of v4, v3, Lrw7;

    if-eqz v4, :cond_3eb

    check-cast v3, Lrw7;

    iget-object v3, v3, Lrw7;->a:Ljava/lang/Object;

    check-cast v3, Ljava/util/List;

    invoke-virtual {v1, v0, v2, v3}, Lbk5;->c(Ljava/lang/String;Lgk5;Ljava/util/List;)V

    goto :goto_416

    :cond_3eb
    instance-of v0, v3, Lsw7;

    if-eqz v0, :cond_413

    check-cast v3, Lsw7;

    iget-object v0, v3, Lsw7;->a:Ljava/lang/Object;

    check-cast v0, Lvj5;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v3, Lak5;->c:Lak5;

    invoke-virtual {v1, v3}, Lbk5;->d(Lak5;)V

    new-instance v3, Llh4;

    new-instance v4, Lsu;

    const/16 v5, 0x11

    invoke-direct {v4, v1, v2, v0, v5}, Lsu;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {v3, v4, v8}, Llh4;-><init>(Lcom/opera/api/Callback;B)V

    iput-object v3, v1, Lbk5;->g:Llh4;

    iget-object v1, v1, Lbk5;->c:Lqb7;

    new-instance v2, Ligi;

    invoke-direct {v2, v1, v0, v3}, Ligi;-><init>(Lqb7;Lvj5;Llh4;)V

    goto :goto_416

    :cond_413
    invoke-static {}, Lh9o;->p()V

    :goto_416
    return-void

    :pswitch_417
    iget-object v1, v0, Lsu;->b:Ljava/lang/Object;

    check-cast v1, Ljava/util/HashSet;

    iget-object v2, v0, Lsu;->c:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/BrowserActivity;

    iget-object v0, v0, Lsu;->d:Ljava/lang/Object;

    check-cast v0, Lgh2;

    move-object/from16 v3, p1

    check-cast v3, Ls25;

    new-instance v4, Lfh4;

    const/4 v5, 0x7

    invoke-direct {v4, v2, v0, v5}, Lfh4;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v0, v3, Ls25;->a:Lcom/opera/android/BrowserActivity;

    invoke-static {v0, v1}, Lz4o;->z0(Landroid/content/ContextWrapper;Ljava/util/HashSet;)V

    new-instance v0, Lz;

    invoke-direct {v0, v4}, Lz;-><init>(Ljava/lang/Object;)V

    invoke-static {}, Lz4o;->R()[Lr25;

    move-result-object v2

    array-length v4, v2

    :goto_43c
    if-ge v8, v4, :cond_45f

    aget-object v5, v2, v8

    iget-object v6, v5, Lr25;->a:Ljava/lang/String;

    invoke-virtual {v1, v6}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_45c

    invoke-virtual {v5, v3}, Lr25;->d(Ls25;)Z

    move-result v6

    if-eqz v6, :cond_45c

    invoke-virtual {v0}, Lz;->b()Lyqd;

    move-result-object v6

    new-instance v7, Lk3;

    const/16 v9, 0x1a

    invoke-direct {v7, v3, v5, v6, v9}, Lk3;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v5, v3, v7}, Lr25;->a(Ls25;Ljava/lang/Runnable;)V

    :cond_45c
    add-int/lit8 v8, v8, 0x1

    goto :goto_43c

    :cond_45f
    invoke-virtual {v0}, Lz;->e()V

    return-void

    :pswitch_463
    iget-object v1, v0, Lsu;->b:Ljava/lang/Object;

    check-cast v1, Lt25;

    iget-object v2, v0, Lsu;->c:Ljava/lang/Object;

    check-cast v2, Ls25;

    iget-object v0, v0, Lsu;->d:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Runnable;

    move-object/from16 v3, p1

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v1, v2, v0}, Lt25;->a(Ls25;Ljava/lang/Runnable;)V

    return-void

    :pswitch_477
    iget-object v1, v0, Lsu;->b:Ljava/lang/Object;

    check-cast v1, Lt25;

    iget-object v2, v0, Lsu;->c:Ljava/lang/Object;

    check-cast v2, Lcom/opera/api/Callback;

    iget-object v0, v0, Lsu;->d:Ljava/lang/Object;

    move-object v7, v0

    check-cast v7, Ls25;

    move-object/from16 v0, p1

    check-cast v0, Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v10

    iget-object v3, v1, Lt25;->g:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->clear()V

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const-wide/16 v4, 0x0

    :goto_497
    move-wide v8, v4

    :cond_498
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4b7

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lilh;

    iget-wide v11, v4, Lilh;->a:J

    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v4, v4, Lilh;->i:Ljava/lang/Long;

    if-eqz v4, :cond_498

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    add-long/2addr v4, v8

    goto :goto_497

    :cond_4b7
    iput-boolean v6, v1, Lt25;->h:Z

    const v11, 0x7f12001d

    const v12, 0x7f141052

    invoke-static/range {v7 .. v12}, Lqyn;->C(Ls25;JIII)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v2, v0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_4c7
    iget-object v1, v0, Lsu;->b:Ljava/lang/Object;

    check-cast v1, Lv25;

    iget-object v2, v0, Lsu;->c:Ljava/lang/Object;

    check-cast v2, Ls25;

    iget-object v0, v0, Lsu;->d:Ljava/lang/Object;

    check-cast v0, Liu2;

    move-object/from16 v3, p1

    check-cast v3, Ljava/lang/Long;

    iget-wide v4, v1, Lv25;->f:J

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    add-long/2addr v6, v4

    iput-wide v6, v1, Lv25;->f:J

    invoke-virtual {v1, v2, v0}, Lv25;->e(Ls25;Liu2;)V

    return-void

    :pswitch_4e4
    iget-object v1, v0, Lsu;->b:Ljava/lang/Object;

    check-cast v1, Lt25;

    iget-object v2, v0, Lsu;->c:Ljava/lang/Object;

    check-cast v2, Ls25;

    iget-object v0, v0, Lsu;->d:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Runnable;

    move-object/from16 v3, p1

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v1, v2, v0}, Lt25;->a(Ls25;Ljava/lang/Runnable;)V

    return-void

    :pswitch_4f8
    iget-object v1, v0, Lsu;->b:Ljava/lang/Object;

    check-cast v1, Lt25;

    iget-object v2, v0, Lsu;->c:Ljava/lang/Object;

    check-cast v2, Lcom/opera/api/Callback;

    iget-object v0, v0, Lsu;->d:Ljava/lang/Object;

    move-object v7, v0

    check-cast v7, Ls25;

    move-object/from16 v0, p1

    check-cast v0, Ljava/lang/Long;

    iget-object v3, v1, Lt25;->g:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v10

    iput-boolean v6, v1, Lt25;->h:Z

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    const v11, 0x7f12001a

    const v12, 0x7f14104d

    invoke-static/range {v7 .. v12}, Lqyn;->C(Ls25;JIII)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v2, v0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_523
    iget-object v1, v0, Lsu;->b:Ljava/lang/Object;

    check-cast v1, Ljava/net/InetAddress;

    iget-object v2, v0, Lsu;->c:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/http/server/HttpServer;

    iget-object v0, v0, Lsu;->d:Ljava/lang/Object;

    check-cast v0, Lhu5;

    move-object/from16 v3, p1

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_56f

    new-instance v3, Landroid/net/Uri$Builder;

    invoke-direct {v3}, Landroid/net/Uri$Builder;-><init>()V

    const-string v4, "http"

    invoke-virtual {v3, v4}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ":"

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, v2, Lcom/opera/android/http/server/HttpServer;->c:I

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Landroid/net/Uri$Builder;->encodedAuthority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v1

    new-instance v3, Lzn4;

    invoke-direct {v3, v2, v1}, Lzn4;-><init>(Lcom/opera/android/http/server/HttpServer;Landroid/net/Uri;)V

    invoke-virtual {v0, v3}, Lhu5;->run(Ljava/lang/Object;)V

    goto :goto_572

    :cond_56f
    invoke-virtual {v0, v7}, Lhu5;->run(Ljava/lang/Object;)V

    :goto_572
    return-void

    :pswitch_573
    iget-object v1, v0, Lsu;->b:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/BrowserActivity;

    iget-object v2, v0, Lsu;->c:Ljava/lang/Object;

    check-cast v2, Ltun;

    iget-object v0, v0, Lsu;->d:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    move-object/from16 v3, p1

    check-cast v3, Landroid/graphics/Bitmap;

    sget-object v4, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v1}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->o()Lnr8;

    move-result-object v1

    new-instance v4, Lmzj;

    invoke-virtual {v2}, Ltun;->d()Ljava/lang/String;

    move-result-object v2

    sget-object v5, Laik;->a:[Ljava/lang/String;

    if-nez v2, :cond_59b

    const-string v2, ""

    :cond_59b
    const/16 v5, 0x8

    invoke-direct {v4, v2, v0, v3, v5}, Lmzj;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;I)V

    invoke-virtual {v1, v4}, Lnr8;->a(Lmzj;)J

    return-void

    :pswitch_5a4
    iget-object v1, v0, Lsu;->b:Ljava/lang/Object;

    check-cast v1, Landroid/net/Uri;

    iget-object v2, v0, Lsu;->c:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/BrowserActivity;

    iget-object v0, v0, Lsu;->d:Ljava/lang/Object;

    move-object v15, v0

    check-cast v15, Ll6e;

    move-object/from16 v0, p1

    check-cast v0, Ljava/lang/String;

    new-instance v3, Lfz1;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v1, v4, v0}, Lfz1;-><init>(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, v2, Lcom/opera/android/BrowserActivity;->y:Ltw3;

    iget-object v0, v0, Ltw3;->j:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, La52;

    invoke-static {v3}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    sget-object v3, Lez1;->a:Lez1;

    invoke-virtual {v0, v1, v3, v8}, La52;->c(Ljava/util/List;Lez1;Z)V

    const v0, 0x7f140154

    invoke-virtual {v2, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v10

    iget-object v9, v2, Lcom/opera/android/BrowserActivity;->d0:Lwth;

    const/4 v13, 0x1

    const/4 v14, 0x0

    const/4 v11, 0x6

    const/4 v12, 0x1

    invoke-virtual/range {v9 .. v15}, Lwth;->K(Ljava/lang/String;IZIZLeri;)V

    return-void

    :pswitch_5e6
    iget-object v1, v0, Lsu;->b:Ljava/lang/Object;

    check-cast v1, Ll12;

    iget-object v2, v0, Lsu;->c:Ljava/lang/Object;

    check-cast v2, Lp12;

    iget-object v0, v0, Lsu;->d:Ljava/lang/Object;

    check-cast v0, Lpjn;

    move-object/from16 v3, p1

    check-cast v3, Landroid/net/Uri;

    if-nez v3, :cond_601

    iget-object v0, v1, Ll12;->a:Lpjn;

    const v1, 0x7f140800

    invoke-virtual {v0, v1}, Lpjn;->m(I)V

    goto :goto_60d

    :cond_601
    iget-object v1, v2, Lp12;->d:Ljava/lang/Object;

    check-cast v1, Lqsh;

    new-instance v2, Lk12;

    invoke-direct {v2, v0, v6}, Lk12;-><init>(Lpjn;B)V

    invoke-virtual {v1, v3, v2}, Lqsh;->c(Landroid/net/Uri;Lcom/opera/api/Callback;)V

    :goto_60d
    return-void

    :pswitch_60e
    iget-object v1, v0, Lsu;->b:Ljava/lang/Object;

    check-cast v1, Lt02;

    iget-object v2, v0, Lsu;->c:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    iget-object v0, v0, Lsu;->d:Ljava/lang/Object;

    check-cast v0, Ll02;

    move-object/from16 v3, p1

    check-cast v3, Lisl;

    instance-of v4, v3, Ljsl;

    if-eqz v4, :cond_637

    check-cast v3, Ljsl;

    iget-object v3, v3, Ljsl;->a:Ljava/lang/String;

    invoke-static {v3, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_62f

    sget-object v0, Lj02;->a:Lj02;

    goto :goto_643

    :cond_62f
    iput-object v3, v0, Ll02;->e:Ljava/lang/String;

    new-instance v0, Li02;

    invoke-direct {v0, v3}, Li02;-><init>(Ljava/lang/String;)V

    goto :goto_643

    :cond_637
    sget-object v2, Lhsl;->a:Lhsl;

    invoke-static {v3, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_647

    invoke-virtual {v0}, Ll02;->a()Lk02;

    move-result-object v0

    :goto_643
    invoke-virtual {v1, v0}, Lt02;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_64a

    :cond_647
    invoke-static {}, Lh9o;->p()V

    :goto_64a
    return-void

    :pswitch_64b
    iget-object v1, v0, Lsu;->b:Ljava/lang/Object;

    check-cast v1, Ljz1;

    iget-object v2, v0, Lsu;->c:Ljava/lang/Object;

    check-cast v2, Ltz1;

    iget-object v0, v0, Lsu;->d:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    move-object/from16 v3, p1

    check-cast v3, Ljava/util/List;

    move-object v4, v3

    check-cast v4, Ljava/lang/Iterable;

    instance-of v5, v4, Ljava/util/Collection;

    if-eqz v5, :cond_66b

    move-object v5, v4

    check-cast v5, Ljava/util/Collection;

    invoke-interface {v5}, Ljava/util/Collection;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_684

    :cond_66b
    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_66f
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_684

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljz1;

    iget-object v5, v5, Ljz1;->a:Ljava/lang/String;

    invoke-virtual {v5, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_66f

    goto :goto_693

    :cond_684
    check-cast v3, Ljava/util/Collection;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0, v8, v1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    iget-object v1, v2, Ltz1;->h:Lode;

    invoke-virtual {v1, v0}, Lekc;->r(Ljava/lang/Object;)V

    :goto_693
    return-void

    :pswitch_694
    iget-object v1, v0, Lsu;->b:Ljava/lang/Object;

    check-cast v1, Lebb;

    iget-object v2, v0, Lsu;->c:Ljava/lang/Object;

    check-cast v2, Ltz1;

    iget-object v0, v0, Lsu;->d:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    move-object/from16 v3, p1

    check-cast v3, Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    move v5, v8

    :goto_6a9
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    const/4 v7, -0x1

    if-eqz v6, :cond_6c1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljz1;

    iget-object v6, v6, Ljz1;->a:Ljava/lang/String;

    invoke-virtual {v6, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_6c2

    add-int/lit8 v5, v5, 0x1

    goto :goto_6a9

    :cond_6c1
    move v5, v7

    :cond_6c2
    if-eq v5, v7, :cond_6e7

    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljz1;

    iget-object v4, v0, Ljz1;->a:Ljava/lang/String;

    iget-object v6, v0, Ljz1;->b:Ljava/lang/String;

    iget-object v0, v0, Ljz1;->c:Ljava/lang/String;

    new-instance v7, Ljz1;

    invoke-direct {v7, v4, v6, v0, v1}, Ljz1;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lebb;)V

    check-cast v3, Ljava/util/Collection;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    invoke-virtual {v0, v8, v7}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    iget-object v1, v2, Ltz1;->h:Lode;

    invoke-virtual {v1, v0}, Lekc;->r(Ljava/lang/Object;)V

    :cond_6e7
    return-void

    :pswitch_6e8
    iget-object v1, v0, Lsu;->b:Ljava/lang/Object;

    check-cast v1, Lwy;

    iget-object v2, v0, Lsu;->c:Ljava/lang/Object;

    check-cast v2, Lorb;

    iget-object v0, v0, Lsu;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/api/Callback;

    move-object/from16 v3, p1

    check-cast v3, Lorb;

    const-string v4, "error: "

    :try_start_6fa
    iget-object v5, v1, Lwy;->g:Lux;

    iget-object v5, v5, Lux;->l:Ljava/lang/String;

    const-string v6, "lastCachePreloadFetchResult"

    if-nez v5, :cond_705

    const-string v4, "success"

    goto :goto_709

    :cond_705
    invoke-virtual {v4, v5}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    :goto_709
    invoke-virtual {v2, v4, v6}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v4, v3, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {v4}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v4

    :goto_712
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_726

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v3, v5}, Lorb;->a(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v2, v6, v5}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_712

    :cond_726
    iget-object v1, v1, Lwy;->l:Lyl;

    invoke-virtual {v1, v2}, Lyl;->H0(Lorb;)V
    :try_end_72b
    .catch Lorg/json/JSONException; {:try_start_6fa .. :try_end_72b} :catch_72b

    :catch_72b
    invoke-interface {v0, v2}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_72f
    iget-object v1, v0, Lsu;->b:Ljava/lang/Object;

    check-cast v1, Lwy;

    iget-object v0, v0, Lsu;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/api/Callback;

    move-object/from16 v3, p1

    check-cast v3, Lorb;

    iget-object v4, v1, Lwy;->q:Lw7h;

    new-instance v5, Lsu;

    invoke-direct {v5, v1, v3, v0, v2}, Lsu;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v0, v4, Lw7h;->f:Lpyl;

    iget-object v0, v0, Lpyl;->f:Ljava/lang/Object;

    check-cast v0, Ljec;

    new-instance v1, Lorb;

    invoke-direct {v1}, Lorb;-><init>()V

    new-instance v2, Lvpb;

    invoke-direct {v2}, Lvpb;-><init>()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    const-wide/32 v6, 0x1499700

    sub-long/2addr v3, v6

    :goto_75a
    invoke-virtual {v0}, Ljava/util/AbstractCollection;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_770

    invoke-virtual {v0, v8}, Ljec;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lip;

    iget-wide v6, v6, Lip;->d:J

    cmp-long v6, v6, v3

    if-gez v6, :cond_770

    invoke-virtual {v0, v8}, Ljec;->remove(I)Ljava/lang/Object;

    goto :goto_75a

    :cond_770
    invoke-virtual {v0}, Ljava/util/AbstractCollection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_774
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_7ad

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lip;

    new-instance v4, Lorb;

    invoke-direct {v4}, Lorb;-><init>()V

    const-string v6, "placementId"

    iget-object v7, v3, Lip;->a:Ljava/lang/String;

    invoke-virtual {v4, v7, v6}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v6, "result"

    iget-object v7, v3, Lip;->b:Ljava/lang/String;

    invoke-virtual {v4, v7, v6}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v6, "requestTime"

    iget-wide v7, v3, Lip;->c:J

    invoke-static {v7, v8}, Ltl;->a(J)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7, v6}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v6, "receivingTime"

    iget-wide v7, v3, Lip;->d:J

    invoke-static {v7, v8}, Ltl;->a(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3, v6}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v2, v4}, Lvpb;->a(Ljava/lang/Object;)V

    goto :goto_774

    :cond_7ad
    const-string v0, "adRequests"

    invoke-virtual {v1, v2, v0}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v5, v1}, Lsu;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_7b6
    iget-object v1, v0, Lsu;->b:Ljava/lang/Object;

    check-cast v1, Lxu;

    iget-object v2, v0, Lsu;->c:Ljava/lang/Object;

    check-cast v2, Lq3;

    iget-object v0, v0, Lsu;->d:Ljava/lang/Object;

    check-cast v0, Lzt1;

    move-object/from16 v4, p1

    check-cast v4, Lw3g;

    if-eqz v4, :cond_7d7

    iget-object v0, v1, Lxu;->f:Lvu;

    new-instance v1, Lz3;

    invoke-direct {v1, v2, v3}, Lz3;-><init>(Ljava/lang/Object;B)V

    iput-object v4, v0, Lvu;->a:Lw3g;

    iput-object v1, v0, Lvu;->b:Lz3;

    invoke-virtual {v0}, Lvu;->a()V

    goto :goto_7e8

    :cond_7d7
    new-instance v1, Luu;

    invoke-interface {v0}, Lzt1;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Luu;-><init>(Ljava/lang/String;)V

    new-instance v0, Lrw7;

    invoke-direct {v0, v1}, Lrw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v2, v0}, Lq3;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :goto_7e8
    return-void

    nop

    :pswitch_data_7ea
    .packed-switch 0x0
        :pswitch_7b6
        :pswitch_72f
        :pswitch_6e8
        :pswitch_694
        :pswitch_64b
        :pswitch_60e
        :pswitch_5e6
        :pswitch_5a4
        :pswitch_573
        :pswitch_523
        :pswitch_4f8
        :pswitch_4e4
        :pswitch_4c7
        :pswitch_477
        :pswitch_463
        :pswitch_417
        :pswitch_3cd
        :pswitch_388
        :pswitch_30e
        :pswitch_2f5
        :pswitch_2d0
        :pswitch_22d
        :pswitch_1fb
        :pswitch_144
        :pswitch_12d
        :pswitch_112
        :pswitch_b7
        :pswitch_80
        :pswitch_23
    .end packed-switch
.end method
