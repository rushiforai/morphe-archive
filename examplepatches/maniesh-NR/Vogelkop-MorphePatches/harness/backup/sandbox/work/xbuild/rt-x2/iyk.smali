.class public final synthetic Liyk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    iput-byte p3, p0, Liyk;->a:B

    iput-object p1, p0, Liyk;->b:Ljava/lang/Object;

    iput-object p2, p0, Liyk;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 18

    move-object/from16 v0, p0

    iget-byte v1, v0, Liyk;->a:B

    const/4 v2, 0x1

    const/4 v3, 0x3

    const v4, 0x7f0700a0

    const/4 v5, 0x0

    const/4 v6, 0x0

    iget-object v7, v0, Liyk;->c:Ljava/lang/Object;

    iget-object v0, v0, Liyk;->b:Ljava/lang/Object;

    packed-switch v1, :pswitch_data_312

    check-cast v0, Lwx;

    check-cast v7, Lb2l;

    move-object/from16 v1, p1

    check-cast v1, Ljava/util/List;

    new-instance v2, Ltun;

    check-cast v7, Ld7l;

    invoke-virtual {v7}, Ld7l;->l0()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v1}, Ltun;-><init>(Ljava/lang/String;Ljava/util/List;)V

    invoke-virtual {v0, v2}, Lwx;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_29
    check-cast v0, Lqln;

    check-cast v7, Lcom/opera/api/Callback;

    move-object/from16 v1, p1

    check-cast v1, Laln;

    if-eqz v1, :cond_71

    iget-object v2, v0, Lqln;->m:Lrgh;

    iget-object v3, v2, Lrgh;->b:Ljava/lang/Object;

    check-cast v3, Landroid/content/res/Resources;

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    iget v3, v3, Landroid/util/DisplayMetrics;->widthPixels:I

    mul-int/lit8 v3, v3, 0x5a

    div-int/lit8 v3, v3, 0x64

    iget-object v5, v2, Lrgh;->b:Ljava/lang/Object;

    check-cast v5, Landroid/content/res/Resources;

    invoke-virtual {v5}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v5

    iget v5, v5, Landroid/util/DisplayMetrics;->heightPixels:I

    iget-object v2, v2, Lrgh;->a:Ljava/lang/Object;

    check-cast v2, Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    sub-int/2addr v5, v2

    mul-int/lit8 v5, v5, 0x5a

    div-int/lit8 v5, v5, 0x64

    new-instance v2, Lo2c;

    invoke-direct {v2, v6, v3, v5, v6}, Lo2c;-><init>(ZIIZ)V

    iget-object v3, v0, Lqln;->a:Landroid/content/Context;

    invoke-interface {v1, v3, v2}, Laln;->c(Landroid/content/Context;Lo2c;)Lxkn;

    move-result-object v1

    iget-object v0, v0, Lqln;->g:Lagm;

    new-instance v3, Lqjn;

    invoke-direct {v3, v0, v1, v7, v2}, Lqjn;-><init>(Lagm;Lxkn;Lcom/opera/api/Callback;Lo2c;)V

    goto :goto_79

    :cond_71
    new-instance v0, Lzmn;

    invoke-direct {v0, v6}, Lzmn;-><init>(B)V

    invoke-interface {v7, v0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    :goto_79
    return-void

    :pswitch_7a
    check-cast v0, Lqln;

    check-cast v7, Lqjn;

    move-object/from16 v1, p1

    check-cast v1, Laln;

    if-eqz v1, :cond_e5

    iget-object v2, v0, Lqln;->a:Landroid/content/Context;

    iget-object v8, v0, Lqln;->m:Lrgh;

    iget-object v9, v8, Lrgh;->b:Ljava/lang/Object;

    check-cast v9, Landroid/content/res/Resources;

    invoke-virtual {v9}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v9

    iget v9, v9, Landroid/util/DisplayMetrics;->widthPixels:I

    mul-int/lit8 v9, v9, 0x5a

    div-int/lit8 v9, v9, 0x64

    iget-object v10, v8, Lrgh;->b:Ljava/lang/Object;

    check-cast v10, Landroid/content/res/Resources;

    invoke-virtual {v10}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v10

    iget v10, v10, Landroid/util/DisplayMetrics;->heightPixels:I

    iget-object v8, v8, Lrgh;->a:Ljava/lang/Object;

    check-cast v8, Landroid/content/Context;

    invoke-virtual {v8}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v8, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    sub-int/2addr v10, v4

    mul-int/lit8 v10, v10, 0x5a

    div-int/lit8 v10, v10, 0x64

    new-instance v4, Lo2c;

    invoke-direct {v4, v6, v9, v10, v6}, Lo2c;-><init>(ZIIZ)V

    invoke-interface {v1, v2, v4}, Laln;->c(Landroid/content/Context;Lo2c;)Lxkn;

    move-result-object v1

    iget-object v1, v1, Lxkn;->c:Ljava/lang/String;

    if-eqz v1, :cond_e5

    iget-object v2, v7, Lqjn;->a:Lxkn;

    iget-object v2, v2, Lxkn;->c:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_e5

    iget-object v2, v0, Lqln;->g:Lagm;

    iget-object v0, v0, Lqln;->b:Lumi;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v4, Lwqm;->a:[Ljava/lang/String;

    invoke-static {v1}, LJ/N;->Mhbidx2d(Ljava/lang/Object;)I

    move-result v4

    if-ne v4, v3, :cond_e5

    new-instance v3, Ljp5;

    const/16 v4, 0xa

    invoke-direct {v3, v2, v1, v4}, Ljp5;-><init>(Ljava/lang/Object;Ljava/lang/String;B)V

    invoke-virtual {v0, v3}, Lumi;->g(Ln5o;)Lnml;

    move-result-object v0

    invoke-virtual {v0, v5}, Lnml;->a(Ljava/lang/Object;)Loml;

    :cond_e5
    return-void

    :pswitch_e6
    check-cast v0, Lpkn;

    check-cast v7, Lwln;

    move-object/from16 v10, p1

    check-cast v10, Ljava/util/List;

    iget-object v1, v0, Lpkn;->f:Lqkn;

    iget-boolean v3, v1, Lqkn;->o:Z

    if-nez v3, :cond_14c

    if-eqz v10, :cond_14c

    invoke-interface {v10}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_14c

    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v3

    if-ne v3, v2, :cond_120

    invoke-interface {v10, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v10

    new-instance v8, Lcmn;

    const/4 v11, 0x0

    const/4 v12, 0x5

    const/4 v9, 0x0

    const/4 v13, 0x1

    invoke-direct/range {v8 .. v13}, Lcmn;-><init>(Ljava/lang/String;Ljava/lang/String;IIZ)V

    iget-object v0, v1, Lqkn;->a:Lgjm;

    new-instance v1, Ldmn;

    invoke-direct {v1, v7, v8}, Ldmn;-><init>(Lwln;Lcmn;)V

    invoke-virtual {v0, v1, v6}, Lgjm;->e(Ln37;Z)V

    goto :goto_14c

    :cond_120
    iget-object v1, v1, Lqkn;->f:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v12

    iget-object v1, v0, Lpkn;->c:Lqln;

    iget-object v1, v1, Lqln;->f:Lami;

    new-instance v11, Lilm;

    const/16 v2, 0x9

    invoke-direct {v11, v0, v2}, Lilm;-><init>(Ljava/lang/Object;B)V

    iget-object v0, v1, Lami;->d:Ljava/lang/Object;

    move-object v9, v0

    check-cast v9, Ls14;

    iget-object v0, v9, Ls14;->d:Ljava/lang/Object;

    check-cast v0, Lumi;

    new-instance v8, Lws1;

    const/16 v13, 0x13

    invoke-direct/range {v8 .. v13}, Lws1;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v8}, Lumi;->e(Ln5o;)Lnml;

    move-result-object v0

    invoke-virtual {v0, v5}, Lnml;->a(Ljava/lang/Object;)Loml;

    :cond_14c
    :goto_14c
    return-void

    :pswitch_14d
    check-cast v0, Lqsh;

    check-cast v7, Lcom/opera/api/Callback;

    move-object/from16 v1, p1

    check-cast v1, Lqmn;

    new-instance v2, Ln9h;

    const/16 v3, 0xc

    invoke-direct {v2, v3, v0, v7, v6}, Ln9h;-><init>(BLjava/lang/Object;Ljava/lang/Object;Z)V

    invoke-virtual {v1, v2}, Lqmn;->a(Lnmn;)V

    return-void

    :pswitch_160
    move-object v12, v0

    check-cast v12, Ld7k;

    move-object v10, v7

    check-cast v10, Lojn;

    move-object/from16 v11, p1

    check-cast v11, Ljava/util/List;

    invoke-interface {v11}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_176

    sget-object v0, Lljn;->c:Lljn;

    invoke-virtual {v12, v0}, Ld7k;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_190

    :cond_176
    iget-object v0, v10, Lojn;->d:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    move-object v9, v0

    check-cast v9, Lvj2;

    new-instance v8, Lqn;

    const/16 v13, 0x1a

    invoke-direct/range {v8 .. v13}, Lqn;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v0, Ly1n;

    const/16 v1, 0x13

    invoke-direct {v0, v12, v1}, Ly1n;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v9, v8, v0}, Lvj2;->c(Ljava/lang/Runnable;Ljava/lang/Runnable;)V

    :goto_190
    return-void

    :pswitch_191
    check-cast v0, Lw7j;

    check-cast v7, Lsdn;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-nez v1, :cond_1a3

    invoke-virtual {v0, v7}, Lw7j;->n(Lsdn;)V

    goto :goto_1b2

    :cond_1a3
    iget-object v0, v0, Lw7j;->b:Ljava/lang/Object;

    check-cast v0, Lsz4;

    invoke-static {v0}, Lyi4;->y(Lsz4;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v7, v0}, Lsdn;->run(Ljava/lang/Object;)V

    :goto_1b2
    return-void

    :pswitch_1b3
    check-cast v0, Lbg7;

    check-cast v7, Landroid/content/Context;

    move-object/from16 v1, p1

    check-cast v1, Landroid/view/View;

    iget-object v1, v0, Lbg7;->d:Ljava/lang/Object;

    check-cast v1, Lx5f;

    const/4 v3, 0x7

    sget-object v4, Lwb0;->e:Lwb0;

    invoke-virtual {v1, v3, v4, v5}, Lx5f;->L(ILwb0;Ljava/lang/Integer;)V

    sget-object v1, Lhjm;->a:Lhjm;

    invoke-virtual {v0, v1}, Ld63;->finish(Lhjm;)V

    new-array v0, v6, [Ln6h;

    new-instance v9, Lwzg;

    const/4 v1, 0x4

    const-class v3, Li8d;

    invoke-direct {v9, v5, v3, v1}, Lwzg;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    sget-object v1, Lcg5;->a:Lcg5;

    new-instance v10, Landroid/os/Bundle;

    invoke-direct {v10}, Landroid/os/Bundle;-><init>()V

    const-string v1, "compose_highlight_target_key"

    invoke-virtual {v10, v1, v2}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v1, "compose_highlight_scroll_behavior"

    const-string v2, "AlignTopIfNotVisible"

    invoke-virtual {v10, v1, v2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v8, Lzhj;

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v15

    const/4 v11, 0x2

    const/16 v12, 0x1003

    const/4 v13, 0x0

    const/4 v14, 0x0

    invoke-direct/range {v8 .. v15}, Lzhj;-><init>(Lwzg;Landroid/os/Bundle;IILjava/lang/String;ZLjava/util/List;)V

    invoke-virtual {v8, v7}, Lzhj;->c(Landroid/content/Context;)V

    return-void

    :pswitch_1f9
    check-cast v0, Lydn;

    check-cast v7, Lvdn;

    move-object/from16 v1, p1

    check-cast v1, Lefn;

    invoke-virtual {v7}, Lvdn;->b()Z

    move-result v2

    invoke-virtual {v0}, Lydn;->p()Lwdn;

    move-result-object v3

    iget-boolean v3, v3, Lwdn;->a:Z

    iget-object v4, v0, Lydn;->c:Lgfn;

    invoke-interface {v4}, Lgfn;->isEnabled()Z

    move-result v4

    if-nez v4, :cond_214

    move v6, v2

    :cond_214
    new-instance v2, Lvdn;

    invoke-direct {v2, v3, v6, v1, v5}, Lvdn;-><init>(ZZLefn;Lhfn;)V

    invoke-virtual {v0, v2}, Lydn;->I(Lvdn;)V

    return-void

    :pswitch_21d
    check-cast v0, Lcom/opera/api/Callback;

    check-cast v7, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;

    move-object/from16 v1, p1

    check-cast v1, Lex1;

    invoke-static {v0, v7, v1}, Lcom/leanplum/messagetemplates/UtilsKt;->a(Lcom/opera/api/Callback;Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;Lex1;)V

    return-void

    :pswitch_229
    check-cast v0, Ljl4;

    check-cast v7, Lsu;

    move-object/from16 v1, p1

    check-cast v1, Ltw7;

    iget-object v0, v0, Ljl4;->b:Ljava/lang/Object;

    check-cast v0, Lbz0;

    invoke-virtual {v0}, Lzp1;->dismiss()V

    invoke-virtual {v7, v1}, Lsu;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_23c
    check-cast v0, Ld7h;

    check-cast v7, Lcom/opera/api/Callback;

    move-object/from16 v1, p1

    check-cast v1, Landroid/graphics/Bitmap;

    iget-object v0, v0, Ld7h;->b:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    if-eqz v1, :cond_257

    new-instance v2, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-direct {v2, v0, v1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    invoke-interface {v7, v2}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    goto :goto_261

    :cond_257
    const v1, 0x7f080467

    invoke-static {v1, v0}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-interface {v7, v0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    :goto_261
    return-void

    :pswitch_262
    check-cast v0, Lcom/opera/android/account/auth/TwoFactorAuthenticationActivity;

    check-cast v7, Lcom/opera/api/Callback;

    move-object/from16 v1, p1

    check-cast v1, Lorb;

    sget v2, Lcom/opera/android/account/auth/TwoFactorAuthenticationActivity;->T:I

    if-nez v1, :cond_275

    invoke-interface {v7, v5}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    goto :goto_27e

    :cond_275
    iget-object v0, v1, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v7, v0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    :goto_27e
    return-void

    :pswitch_27f
    check-cast v0, Lplk;

    check-cast v7, Lszb;

    move-object/from16 v1, p1

    check-cast v1, Lg4m;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Ljava/util/ArrayList;

    iget-object v1, v1, Lg4m;->a:Ljava/util/List;

    invoke-direct {v2, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :cond_298
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2b6

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    move-object v5, v4

    check-cast v5, Lj0c;

    iget-object v5, v5, Lj0c;->a:Ljava/lang/String;

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_298

    invoke-static {v4}, Lorf;->h(Ljava/lang/Object;)Lewg;

    move-result-object v1

    goto :goto_2b8

    :cond_2b6
    sget-object v1, Lh3;->a:Lh3;

    :goto_2b8
    invoke-virtual {v1}, Lorf;->j()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lj0c;

    if-eqz v1, :cond_2d8

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    iget-object v1, v0, Lplk;->b:Ljava/lang/Object;

    check-cast v1, Lxl;

    new-instance v4, Ld4m;

    invoke-direct {v4, v0, v3}, Ld4m;-><init>(Lplk;B)V

    iget-object v0, v1, Lxl;->l:Ljava/lang/Object;

    check-cast v0, Lnrl;

    new-instance v3, Lh4m;

    invoke-direct {v3, v1, v2, v4, v6}, Lh4m;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v3}, Lnrl;->d(Ljava/lang/Runnable;)Ljava/lang/Runnable;

    :cond_2d8
    return-void

    :pswitch_2d9
    check-cast v0, Lplk;

    check-cast v7, Ljava/util/ArrayList;

    move-object/from16 v1, p1

    check-cast v1, Lg4m;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Ljava/util/ArrayList;

    iget-object v1, v1, Lg4m;->b:Ljava/util/List;

    invoke-direct {v2, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v2, v7}, Ljava/util/ArrayList;->removeAll(Ljava/util/Collection;)Z

    move-result v1

    if-eqz v1, :cond_2f4

    invoke-virtual {v0, v2}, Lplk;->s(Ljava/util/ArrayList;)V

    :cond_2f4
    return-void

    :pswitch_2f5
    check-cast v0, Lfi2;

    check-cast v7, Lab;

    move-object/from16 v1, p1

    check-cast v1, Lq43;

    iget v2, v1, Lq43;->a:I

    iget-object v1, v1, Lq43;->b:Ljava/lang/String;

    const/16 v3, 0x19c

    if-ne v2, v3, :cond_30e

    :try_start_305
    new-instance v2, Lorb;

    invoke-direct {v2, v1}, Lorb;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Lfi2;->run(Ljava/lang/Object;)V
    :try_end_30d
    .catch Lorg/json/JSONException; {:try_start_305 .. :try_end_30d} :catch_30e

    goto :goto_311

    :catch_30e
    :cond_30e
    invoke-virtual {v7, v1}, Lab;->run(Ljava/lang/Object;)V

    :goto_311
    return-void

    :pswitch_data_312
    .packed-switch 0x0
        :pswitch_2f5
        :pswitch_2d9
        :pswitch_27f
        :pswitch_262
        :pswitch_23c
        :pswitch_229
        :pswitch_21d
        :pswitch_1f9
        :pswitch_1b3
        :pswitch_191
        :pswitch_160
        :pswitch_14d
        :pswitch_e6
        :pswitch_7a
        :pswitch_29
    .end packed-switch
.end method
