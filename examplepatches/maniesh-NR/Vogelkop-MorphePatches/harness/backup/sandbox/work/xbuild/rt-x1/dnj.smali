.class public final synthetic Ldnj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Ldnj;->a:B

    iput-object p1, p0, Ldnj;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 28

    move-object/from16 v0, p0

    iget-byte v1, v0, Ldnj;->a:B

    const-wide/16 v4, 0xff

    const-wide v6, -0x7f7f7f7f7f7f7f80L    # -2.937446524422997E-306

    const/4 v8, 0x7

    const/16 v9, 0x8

    const/4 v10, 0x2

    const/4 v11, 0x1

    packed-switch v1, :pswitch_data_5a0

    iget-object v0, v0, Ldnj;->b:Ljava/lang/Object;

    check-cast v0, Ln7l;

    iget-object v0, v0, Ln7l;->b:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/opera/android/tabui2/screenshots/TabScreenshotEntryDatabase;

    invoke-virtual {v0}, Lcom/opera/android/tabui2/screenshots/TabScreenshotEntryDatabase;->x()Lf58;

    move-result-object v0

    return-object v0

    :pswitch_24
    iget-object v0, v0, Ldnj;->b:Ljava/lang/Object;

    check-cast v0, Lp77;

    iget-object v0, v0, Lp77;->c:Landroid/view/KeyEvent$Callback;

    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;

    iget-byte v0, v0, Landroidx/recyclerview/widget/RecyclerView;->N:B

    if-eq v0, v11, :cond_3d7

    if-ne v0, v10, :cond_3d6

    goto/16 :goto_3d7

    :pswitch_34
    iget-object v0, v0, Ldnj;->b:Ljava/lang/Object;

    check-cast v0, Landroidx/recyclerview/widget/i;

    if-eqz v0, :cond_3d6

    goto/16 :goto_3d7

    :pswitch_3c
    iget-object v0, v0, Ldnj;->b:Ljava/lang/Object;

    check-cast v0, La5l;

    iget-object v0, v0, La5l;->e:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/opera/android/tabui2/siteimages/ImageUrlRepDatabase;

    invoke-virtual {v0}, Lcom/opera/android/tabui2/siteimages/ImageUrlRepDatabase;->x()Le58;

    move-result-object v0

    return-object v0

    :pswitch_4d
    iget-object v0, v0, Ldnj;->b:Ljava/lang/Object;

    check-cast v0, Lshf;

    invoke-virtual {v0}, Lshf;->R()V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_57
    iget-object v0, v0, Ldnj;->b:Ljava/lang/Object;

    check-cast v0, Lplk;

    invoke-virtual {v0}, Lplk;->u()V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_61
    iget-object v0, v0, Ldnj;->b:Ljava/lang/Object;

    check-cast v0, Lfzk;

    invoke-virtual {v0}, Lfzk;->a()V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_6b
    iget-object v0, v0, Ldnj;->b:Ljava/lang/Object;

    check-cast v0, Ldyk;

    iget-object v1, v0, Ldyk;->f:Ldb;

    iget-object v2, v0, Ldyk;->i:Lzwk;

    invoke-static {v1, v2}, Lxgh;->s(Ldb;Lzwk;)Z

    move-result v1

    if-nez v1, :cond_82

    iget-object v0, v0, Ldyk;->e:Lzxk;

    iget-object v1, v0, Lzxk;->g:Lh5k;

    iput-boolean v11, v1, Lh5k;->a:Z

    invoke-virtual {v0}, Lzxk;->b()V

    :cond_82
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_85
    iget-object v0, v0, Ldnj;->b:Ljava/lang/Object;

    move-object v1, v0

    check-cast v1, Lcvk;

    const-string v2, "100%"

    const-string v3, "SVG document is empty"

    iget-object v0, v1, Lcvk;->a:Loza;

    iget-object v4, v1, Lcvk;->b:Lvrf;

    invoke-interface {v0}, Loza;->source()Lv04;

    move-result-object v5

    sget-object v0, Lzuk;->a:Lzuk;

    :try_start_98
    invoke-virtual {v0, v5}, Lzuk;->b(Lv04;)Li16;

    move-result-object v6
    :try_end_9c
    .catchall {:try_start_98 .. :try_end_9c} :catchall_a3

    :try_start_9c
    invoke-interface {v5}, Ljava/io/Closeable;->close()V
    :try_end_9f
    .catchall {:try_start_9c .. :try_end_9f} :catchall_a1

    const/4 v0, 0x0

    goto :goto_af

    :catchall_a1
    move-exception v0

    goto :goto_af

    :catchall_a3
    move-exception v0

    move-object v6, v0

    :try_start_a5
    invoke-interface {v5}, Ljava/io/Closeable;->close()V
    :try_end_a8
    .catchall {:try_start_a5 .. :try_end_a8} :catchall_a9

    goto :goto_ad

    :catchall_a9
    move-exception v0

    invoke-static {v6, v0}, Lwf8;->a(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    :goto_ad
    move-object v0, v6

    const/4 v6, 0x0

    :goto_af
    if-nez v0, :cond_24c

    iget-object v0, v6, Li16;->b:Ljava/lang/Object;

    check-cast v0, Lp8f;

    iget-object v5, v0, Lp8f;->b:Ljava/lang/Object;

    check-cast v5, Lcfi;

    if-eqz v5, :cond_246

    iget-object v5, v5, Lnfi;->o:Lree;

    if-nez v5, :cond_c1

    const/4 v7, 0x0

    goto :goto_d2

    :cond_c1
    new-instance v7, Landroid/graphics/RectF;

    iget v8, v5, Lree;->b:F

    iget v9, v5, Lree;->c:F

    invoke-virtual {v5}, Lree;->c()F

    move-result v14

    invoke-virtual {v5}, Lree;->d()F

    move-result v5

    invoke-direct {v7, v8, v9, v14, v5}, Landroid/graphics/RectF;-><init>(FFFF)V

    :goto_d2
    if-eqz v7, :cond_e2

    new-instance v5, Lavk;

    iget v8, v7, Landroid/graphics/RectF;->left:F

    iget v9, v7, Landroid/graphics/RectF;->top:F

    iget v14, v7, Landroid/graphics/RectF;->right:F

    iget v7, v7, Landroid/graphics/RectF;->bottom:F

    invoke-direct {v5, v8, v9, v14, v7}, Lavk;-><init>(FFFF)V

    goto :goto_e3

    :cond_e2
    const/4 v5, 0x0

    :goto_e3
    if-eqz v5, :cond_f0

    iget v7, v5, Lavk;->c:F

    iget v8, v5, Lavk;->a:F

    sub-float/2addr v7, v8

    iget v8, v5, Lavk;->d:F

    iget v9, v5, Lavk;->b:F

    sub-float/2addr v8, v9

    goto :goto_108

    :cond_f0
    iget-object v7, v0, Lp8f;->b:Ljava/lang/Object;

    check-cast v7, Lcfi;

    if-eqz v7, :cond_241

    invoke-virtual {v0}, Lp8f;->m()Lree;

    move-result-object v7

    iget v7, v7, Lree;->d:F

    iget-object v8, v0, Lp8f;->b:Ljava/lang/Object;

    check-cast v8, Lcfi;

    if-eqz v8, :cond_23c

    invoke-virtual {v0}, Lp8f;->m()Lree;

    move-result-object v8

    iget v8, v8, Lree;->e:F

    :goto_108
    iget-object v9, v4, Lvrf;->b:Lapj;

    iget-object v14, v4, Lvrf;->c:Llli;

    sget-object v15, Lapj;->c:Lapj;

    invoke-static {v9, v15}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    const/4 v15, 0x0

    if-eqz v9, :cond_12d

    iget-object v1, v1, Lcvk;->c:Lkotlin/jvm/functions/Function1;

    iget-object v9, v4, Lvrf;->a:Landroid/content/Context;

    invoke-interface {v1, v9}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->floatValue()F

    move-result v1

    cmpl-float v9, v7, v15

    if-lez v9, :cond_128

    mul-float/2addr v7, v1

    :cond_128
    cmpl-float v9, v8, v15

    if-lez v9, :cond_12d

    mul-float/2addr v8, v1

    :cond_12d
    cmpl-float v1, v7, v15

    if-lez v1, :cond_138

    invoke-static {v7}, Lzed;->b(F)I

    move-result v16

    move/from16 v9, v16

    goto :goto_13a

    :cond_138
    const/16 v9, 0x200

    :goto_13a
    cmpl-float v16, v8, v15

    if-lez v16, :cond_145

    invoke-static {v8}, Lzed;->b(F)I

    move-result v17

    move/from16 v13, v17

    goto :goto_147

    :cond_145
    const/16 v13, 0x200

    :goto_147
    iget-object v10, v4, Lvrf;->b:Lapj;

    sget-object v12, Ldza;->b:Lxm5;

    invoke-static {v4, v12}, Lxf8;->K(Lvrf;Lxm5;)Ljava/lang/Object;

    move-result-object v19

    move/from16 p0, v15

    move-object/from16 v15, v19

    check-cast v15, Lapj;

    invoke-static {v9, v13, v10, v14, v15}, Lzi4;->q(IILapj;Llli;Lapj;)J

    move-result-wide v9

    const/16 v13, 0x20

    move-object/from16 v19, v12

    shr-long v11, v9, v13

    long-to-int v11, v11

    const-wide v12, 0xffffffffL

    and-long/2addr v9, v12

    long-to-int v9, v9

    if-lez v1, :cond_1d0

    if-lez v16, :cond_1d0

    int-to-float v1, v11

    int-to-float v9, v9

    move-object/from16 v10, v19

    invoke-static {v4, v10}, Lxf8;->K(Lvrf;Lxm5;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lapj;

    div-float/2addr v1, v7

    div-float/2addr v9, v8

    invoke-virtual {v14}, Ljava/lang/Enum;->ordinal()I

    move-result v11

    if-eqz v11, :cond_18b

    const/4 v15, 0x1

    if-ne v11, v15, :cond_185

    invoke-static {v1, v9}, Ljava/lang/Math;->min(FF)F

    move-result v1

    goto :goto_18f

    :cond_185
    invoke-static {}, Lh9o;->p()V

    :goto_188
    const/4 v13, 0x0

    goto/16 :goto_24b

    :cond_18b
    invoke-static {v1, v9}, Ljava/lang/Math;->max(FF)F

    move-result v1

    :goto_18f
    iget-object v9, v10, Lapj;->a:Lg97;

    instance-of v11, v9, Le97;

    if-eqz v11, :cond_1a0

    check-cast v9, Le97;

    iget v9, v9, Le97;->a:I

    int-to-float v9, v9

    div-float/2addr v9, v7

    cmpl-float v11, v1, v9

    if-lez v11, :cond_1a0

    move v1, v9

    :cond_1a0
    iget-object v9, v10, Lapj;->b:Lg97;

    instance-of v10, v9, Le97;

    if-eqz v10, :cond_1b1

    check-cast v9, Le97;

    iget v9, v9, Le97;->a:I

    int-to-float v9, v9

    div-float/2addr v9, v8

    cmpl-float v10, v1, v9

    if-lez v10, :cond_1b1

    move v1, v9

    :cond_1b1
    mul-float v9, v1, v7

    float-to-int v11, v9

    mul-float/2addr v1, v8

    float-to-int v9, v1

    if-nez v5, :cond_1d0

    sub-float v7, v7, p0

    sub-float v8, v8, p0

    iget-object v1, v0, Lp8f;->b:Ljava/lang/Object;

    check-cast v1, Lcfi;

    if-eqz v1, :cond_1cc

    new-instance v5, Lree;

    move/from16 v10, p0

    invoke-direct {v5, v10, v10, v7, v8}, Lree;-><init>(FFFF)V

    iput-object v5, v1, Lnfi;->o:Lree;

    goto :goto_1d0

    :cond_1cc
    invoke-static {v3}, Lqp2;->o(Ljava/lang/String;)V

    goto :goto_188

    :cond_1d0
    :goto_1d0
    iget-object v1, v0, Lp8f;->b:Ljava/lang/Object;

    check-cast v1, Lcfi;

    if-eqz v1, :cond_237

    invoke-static {v2}, Lsgi;->t(Ljava/lang/String;)Lnei;

    move-result-object v5

    iput-object v5, v1, Lcfi;->r:Lnei;

    iget-object v1, v0, Lp8f;->b:Ljava/lang/Object;

    check-cast v1, Lcfi;

    if-eqz v1, :cond_232

    invoke-static {v2}, Lsgi;->t(Ljava/lang/String;)Lnei;

    move-result-object v2

    iput-object v2, v1, Lcfi;->s:Lnei;

    sget-object v1, Lvtp;->c:Lxm5;

    invoke-static {v4, v1}, Lxf8;->K(Lvrf;Lxm5;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    if-eqz v1, :cond_20f

    new-instance v2, Liuh;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Liuh;-><init>(B)V

    new-instance v3, Lz;

    const/4 v4, 0x3

    const/4 v5, 0x2

    invoke-direct {v3, v4, v5}, Lz;-><init>(BI)V

    new-instance v4, Li64;

    invoke-direct {v4, v1}, Li64;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Li1;->W()V

    invoke-virtual {v3, v4}, Lz;->k(Li64;)Ls64;

    move-result-object v1

    iput-object v1, v2, Liuh;->b:Ljava/lang/Object;

    iput-object v2, v6, Li16;->c:Ljava/lang/Object;

    :cond_20f
    new-instance v1, Levk;

    iget-object v2, v6, Li16;->c:Ljava/lang/Object;

    check-cast v2, Liuh;

    invoke-direct {v1, v0, v2, v11, v9}, Levk;-><init>(Lp8f;Liuh;II)V

    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v11, v9, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    new-instance v2, Landroid/graphics/Canvas;

    invoke-direct {v2, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    invoke-virtual {v1, v2}, Levk;->c(Landroid/graphics/Canvas;)V

    new-instance v1, Ltg3;

    invoke-direct {v1, v0}, Ltg3;-><init>(Landroid/graphics/Bitmap;)V

    new-instance v13, Lej6;

    const/4 v15, 0x1

    invoke-direct {v13, v1, v15}, Lej6;-><init>(Ljva;Z)V

    goto :goto_24b

    :cond_232
    invoke-static {v3}, Lqp2;->o(Ljava/lang/String;)V

    goto/16 :goto_188

    :cond_237
    invoke-static {v3}, Lqp2;->o(Ljava/lang/String;)V

    goto/16 :goto_188

    :cond_23c
    invoke-static {v3}, Lqp2;->o(Ljava/lang/String;)V

    goto/16 :goto_188

    :cond_241
    invoke-static {v3}, Lqp2;->o(Ljava/lang/String;)V

    goto/16 :goto_188

    :cond_246
    invoke-static {v3}, Lqp2;->o(Ljava/lang/String;)V

    goto/16 :goto_188

    :goto_24b
    return-object v13

    :cond_24c
    throw v0

    :pswitch_24d
    iget-object v0, v0, Ldnj;->b:Ljava/lang/Object;

    check-cast v0, Lm59;

    iget v0, v0, Lm59;->b:I

    int-to-long v0, v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    return-object v0

    :pswitch_259
    iget-object v0, v0, Ldnj;->b:Ljava/lang/Object;

    check-cast v0, Lhkk;

    invoke-virtual {v0}, Lhkk;->a()Lz3c;

    move-result-object v0

    iget-object v1, v0, Lz3c;->a:Lm3c;

    invoke-virtual {v1}, Lm3c;->o()Ljava/util/List;

    move-result-object v10

    check-cast v10, Lbee;

    iget-object v10, v10, Lbee;->b:Ljava/lang/Object;

    check-cast v10, Ldfe;

    iget v10, v10, Ldfe;->c:I

    iget v11, v0, Lz3c;->n:I

    if-eq v11, v10, :cond_2dc

    iget-object v0, v0, Lz3c;->f:Lsee;

    iget-object v10, v0, Lsee;->c:[Ljava/lang/Object;

    iget-object v0, v0, Lsee;->a:[J

    array-length v11, v0

    const/16 v18, 0x2

    add-int/lit8 v11, v11, -0x2

    if-ltz v11, :cond_2c3

    const/4 v12, 0x0

    :goto_281
    aget-wide v13, v0, v12

    const-wide/16 v16, 0x80

    not-long v2, v13

    shl-long/2addr v2, v8

    and-long/2addr v2, v13

    and-long/2addr v2, v6

    cmp-long v2, v2, v6

    if-eqz v2, :cond_2ba

    sub-int v2, v12, v11

    not-int v2, v2

    ushr-int/lit8 v2, v2, 0x1f

    rsub-int/lit8 v2, v2, 0x8

    const/4 v3, 0x0

    :goto_295
    if-ge v3, v2, :cond_2b5

    and-long v19, v13, v4

    cmp-long v18, v19, v16

    if-gez v18, :cond_2ad

    shl-int/lit8 v18, v12, 0x3

    add-int v18, v18, v3

    aget-object v18, v10, v18

    move-wide/from16 v19, v4

    move-object/from16 v4, v18

    check-cast v4, Ls3c;

    const/4 v15, 0x1

    iput-boolean v15, v4, Ls3c;->d:Z

    goto :goto_2af

    :cond_2ad
    move-wide/from16 v19, v4

    :goto_2af
    shr-long/2addr v13, v9

    add-int/lit8 v3, v3, 0x1

    move-wide/from16 v4, v19

    goto :goto_295

    :cond_2b5
    move-wide/from16 v19, v4

    if-ne v2, v9, :cond_2c3

    goto :goto_2bc

    :cond_2ba
    move-wide/from16 v19, v4

    :goto_2bc
    if-eq v12, v11, :cond_2c3

    add-int/lit8 v12, v12, 0x1

    move-wide/from16 v4, v19

    goto :goto_281

    :cond_2c3
    iget-object v0, v1, Lm3c;->h:Lm3c;

    if-eqz v0, :cond_2d2

    iget-object v0, v1, Lm3c;->G:Lq3c;

    iget-boolean v0, v0, Lq3c;->e:Z

    if-nez v0, :cond_2dc

    const/4 v3, 0x0

    invoke-static {v1, v3, v8}, Lm3c;->T(Lm3c;ZI)V

    goto :goto_2dc

    :cond_2d2
    const/4 v3, 0x0

    invoke-virtual {v1}, Lm3c;->q()Z

    move-result v0

    if-nez v0, :cond_2dc

    invoke-static {v1, v3, v8}, Lm3c;->V(Lm3c;ZI)V

    :cond_2dc
    :goto_2dc
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_2df
    iget-object v0, v0, Ldnj;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingImageCheckableWithText;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/opera/android/custom_views/StylingImageCheckableWithText;->r:Landroid/animation/ValueAnimator;

    iget-object v0, v0, Lcom/opera/android/custom_views/StylingImageCheckableWithText;->p:Lov0;

    iget-object v0, v0, Lov0;->d:Ljava/lang/Object;

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0, v9}, Landroid/view/View;->setVisibility(I)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_2f2
    iget-object v0, v0, Ldnj;->b:Ljava/lang/Object;

    check-cast v0, Lhfk;

    invoke-interface {v0}, Lhfk;->a()V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_2fc
    iget-object v0, v0, Ldnj;->b:Ljava/lang/Object;

    check-cast v0, Ld7h;

    const-string v1, ""

    iget-object v0, v0, Ld7h;->b:Ljava/lang/Object;

    check-cast v0, Landroid/content/SharedPreferences;

    const-string v2, "pref_key_sticky_variant"

    const/4 v3, 0x0

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_37a

    const-string v2, "|"

    filled-new-array {v2}, [Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x6

    const/4 v4, 0x0

    invoke-static {v0, v2, v4, v3}, Lkotlin/text/StringsKt;->Y(Ljava/lang/CharSequence;[Ljava/lang/String;II)Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_37a

    check-cast v0, Ljava/lang/Iterable;

    const/16 v2, 0xa

    invoke-static {v0, v2}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v2

    invoke-static {v2}, Lqbd;->a(I)I

    move-result v2

    const/16 v3, 0x10

    if-ge v2, v3, :cond_32e

    move v2, v3

    :cond_32e
    new-instance v3, Ljava/util/LinkedHashMap;

    invoke-direct {v3, v2}, Ljava/util/LinkedHashMap;-><init>(I)V

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_337
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_374

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    const-string v4, "="

    filled-new-array {v4}, [Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x2

    invoke-static {v2, v4, v5, v5}, Lkotlin/text/StringsKt;->Y(Ljava/lang/CharSequence;[Ljava/lang/String;II)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v4

    if-eq v4, v5, :cond_355

    const/4 v2, 0x0

    :cond_355
    if-eqz v2, :cond_367

    const/4 v4, 0x0

    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    const/4 v15, 0x1

    invoke-interface {v2, v15}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    new-instance v4, Lkotlin/Pair;

    invoke-direct {v4, v5, v2}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_36c

    :cond_367
    new-instance v4, Lkotlin/Pair;

    invoke-direct {v4, v1, v1}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    :goto_36c
    iget-object v2, v4, Lkotlin/Pair;->a:Ljava/lang/Object;

    iget-object v4, v4, Lkotlin/Pair;->b:Ljava/lang/Object;

    invoke-interface {v3, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_337

    :cond_374
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0, v3}, Ljava/util/LinkedHashMap;-><init>(Ljava/util/Map;)V

    goto :goto_37f

    :cond_37a
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    :goto_37f
    return-object v0

    :pswitch_380
    iget-object v0, v0, Ldnj;->b:Ljava/lang/Object;

    check-cast v0, Le2d;

    invoke-virtual {v0}, Le2d;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->floatValue()F

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    return-object v0

    :pswitch_393
    iget-object v0, v0, Ldnj;->b:Ljava/lang/Object;

    check-cast v0, Ly8k;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object v0

    check-cast v0, Lcom/opera/android/startup/WelcomeActivity;

    invoke-virtual {v0}, Lcom/opera/android/startup/WelcomeActivity;->X()V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_3a3
    iget-object v0, v0, Ldnj;->b:Ljava/lang/Object;

    check-cast v0, Lj8k;

    invoke-virtual {v0}, Lj8k;->e0()V

    iget-object v1, v0, Lj8k;->d:Lor2;

    iget-object v2, v1, Lor2;->e:Ljava/lang/Object;

    check-cast v2, Landroid/widget/FrameLayout;

    iget-object v1, v1, Lor2;->f:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/StylingTextView;

    sget-object v3, Lpc;->A:Lpc;

    invoke-virtual {v0, v2, v1, v3}, Lj8k;->c0(Landroid/view/View;Lcom/opera/android/custom_views/StylingTextView;Lpc;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_3bc
    iget-object v0, v0, Ldnj;->b:Ljava/lang/Object;

    check-cast v0, Lk8k;

    invoke-virtual {v0}, Lu5k;->A()V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_3c6
    iget-object v0, v0, Ldnj;->b:Ljava/lang/Object;

    check-cast v0, La7k;

    iget-object v0, v0, La7k;->e:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v0}, Lcom/opera/android/settings/SettingsManager;->g()Lg7j;

    move-result-object v0

    sget-object v1, Lg7j;->g:Lg7j;

    if-ne v0, v1, :cond_3d6

    const/4 v11, 0x1

    goto :goto_3d7

    :cond_3d6
    const/4 v11, 0x0

    :cond_3d7
    :goto_3d7
    invoke-static {v11}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :pswitch_3dc
    iget-object v0, v0, Ldnj;->b:Ljava/lang/Object;

    check-cast v0, Lne5;

    invoke-virtual {v0}, Lne5;->V()V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_3e6
    iget-object v0, v0, Ldnj;->b:Ljava/lang/Object;

    check-cast v0, Ld6k;

    iget-object v0, v0, Ld6k;->a:Ljava/util/ArrayList;

    new-instance v1, Lvoj;

    const/16 v2, 0xf

    invoke-direct {v1, v2}, Lvoj;-><init>(B)V

    new-instance v2, Lvd3;

    const/4 v3, 0x4

    invoke-direct {v2, v1, v3}, Lvd3;-><init>(Ljava/lang/Object;B)V

    invoke-static {v2, v0}, Lkotlin/collections/CollectionsKt;->c0(Ljava/util/Comparator;Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v0

    return-object v0

    :pswitch_3fe
    iget-object v0, v0, Ldnj;->b:Ljava/lang/Object;

    check-cast v0, Ly5k;

    new-instance v1, Lx5k;

    iget-object v0, v0, Ly5k;->d:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v2

    const v3, 0x7f0d03ba

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v0, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_41f

    check-cast v0, Lcom/opera/android/custom_views/CardView;

    invoke-direct {v1, v0}, Lab2;-><init>(Landroid/view/View;)V

    move-object v13, v1

    goto :goto_425

    :cond_41f
    const-string v0, "rootView"

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 v13, 0x0

    :goto_425
    return-object v13

    :pswitch_426
    iget-object v0, v0, Ldnj;->b:Ljava/lang/Object;

    check-cast v0, Ls5k;

    new-instance v1, Lr5k;

    iget-object v2, v0, Ls5k;->d:Landroidx/recyclerview/widget/RecyclerView;

    iget v3, v0, Lv5k;->c:I

    const/4 v4, 0x0

    invoke-static {v2, v3, v4}, Lha2;->M(Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object v2

    iget-object v0, v0, Ls5k;->f:Lo4b;

    iget-object v0, v0, Lk6k;->c:Lpde;

    invoke-direct {v1, v2}, Lab2;-><init>(Landroid/view/View;)V

    iget-object v2, v1, Lab2;->c:Lkze;

    new-instance v3, Lqzg;

    const/16 v4, 0xd

    invoke-direct {v3, v1, v4}, Lqzg;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0, v2, v3}, La26;->T(Lekc;Likc;Lf7f;)V

    return-object v1

    :pswitch_449
    iget-object v0, v0, Ldnj;->b:Ljava/lang/Object;

    check-cast v0, Lp5k;

    new-instance v1, Lo5k;

    iget-object v0, v0, Lp5k;->d:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v2

    const v3, 0x7f0d01a5

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v0, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_46a

    check-cast v0, Lcom/opera/android/custom_views/CardView;

    invoke-direct {v1, v0}, Lab2;-><init>(Landroid/view/View;)V

    move-object v13, v1

    goto :goto_470

    :cond_46a
    const-string v0, "rootView"

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 v13, 0x0

    :goto_470
    return-object v13

    :pswitch_471
    iget-object v0, v0, Ldnj;->b:Ljava/lang/Object;

    check-cast v0, Lks3;

    iget-object v0, v0, Lks3;->h:Ljava/lang/Object;

    check-cast v0, Lkze;

    return-object v0

    :pswitch_47a
    iget-object v0, v0, Ldnj;->b:Ljava/lang/Object;

    check-cast v0, Lw6j;

    iget-object v0, v0, Lw6j;->d:Ljava/lang/Object;

    check-cast v0, Lv9j;

    invoke-static {v0}, Lb8h;->d(Lekc;)Lh42;

    move-result-object v0

    return-object v0

    :pswitch_487
    iget-object v0, v0, Ldnj;->b:Ljava/lang/Object;

    check-cast v0, Lszj;

    sget-object v1, Lszj;->w:[Lxtb;

    invoke-virtual {v0}, Lszj;->H0()Lrm9;

    move-result-object v1

    iget-object v1, v1, Lrm9;->e:Lvs;

    iget-object v1, v1, Lvs;->c:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/settings/speed_dial/SpeedDialShapePreview;

    invoke-virtual {v0}, Lszj;->H0()Lrm9;

    move-result-object v2

    iget-object v2, v2, Lrm9;->e:Lvs;

    iget-object v2, v2, Lvs;->e:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/settings/speed_dial/SpeedDialShapePreview;

    invoke-virtual {v0}, Lszj;->H0()Lrm9;

    move-result-object v0

    iget-object v0, v0, Lrm9;->e:Lvs;

    iget-object v0, v0, Lvs;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/settings/speed_dial/SpeedDialShapePreview;

    filled-new-array {v1, v2, v0}, [Lcom/opera/android/settings/speed_dial/SpeedDialShapePreview;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0

    :pswitch_4b4
    iget-object v0, v0, Ldnj;->b:Ljava/lang/Object;

    check-cast v0, Luyj;

    iget-object v1, v0, Luyj;->b:Lkze;

    sget-object v2, Lazj;->a:Lazj;

    invoke-virtual {v1, v2}, Lekc;->n(Ljava/lang/Object;)V

    iget-object v1, v0, Luyj;->h:Lpyl;

    const/4 v3, 0x0

    iput-object v3, v1, Lpyl;->c:Ljava/lang/Object;

    iput-object v3, v1, Lpyl;->d:Ljava/lang/Object;

    const/4 v4, 0x0

    iput v4, v1, Lpyl;->b:I

    iget-object v1, v1, Lpyl;->e:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    iget-object v1, v0, Luyj;->d:Landroid/speech/tts/TextToSpeech;

    invoke-virtual {v1}, Landroid/speech/tts/TextToSpeech;->stop()I

    move-result v1

    iget-object v0, v0, Luyj;->b:Lkze;

    if-eqz v1, :cond_4e5

    new-instance v1, Lvyj;

    sget-object v2, Lryj;->d:Lryj;

    invoke-direct {v1, v2}, Lvyj;-><init>(Lryj;)V

    invoke-virtual {v0, v1}, Lekc;->n(Ljava/lang/Object;)V

    goto :goto_4ea

    :cond_4e5
    sget-object v1, Lzyj;->a:Lzyj;

    invoke-virtual {v0, v1}, Lekc;->n(Ljava/lang/Object;)V

    :goto_4ea
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_4ed
    move-wide/from16 v19, v4

    const-wide/16 v16, 0x80

    iget-object v0, v0, Ldnj;->b:Ljava/lang/Object;

    move-object v1, v0

    check-cast v1, Ltuj;

    :goto_4f6
    iget-object v2, v1, Ltuj;->i:Ljava/lang/Object;

    monitor-enter v2

    :try_start_4f9
    iget-boolean v0, v1, Ltuj;->c:Z

    if-nez v0, :cond_57a

    const/4 v15, 0x1

    iput-boolean v15, v1, Ltuj;->c:Z
    :try_end_500
    .catchall {:try_start_4f9 .. :try_end_500} :catchall_590

    :try_start_500
    iget-object v0, v1, Ltuj;->h:Ljava/lang/Object;

    check-cast v0, Ldfe;

    iget-object v3, v0, Ldfe;->a:[Ljava/lang/Object;

    iget v0, v0, Ldfe;->c:I

    const/4 v4, 0x0

    :goto_509
    if-ge v4, v0, :cond_56c

    aget-object v5, v3, v4

    check-cast v5, Lsuj;

    iget-object v10, v5, Lsuj;->g:Ltee;

    iget-object v5, v5, Lsuj;->a:Lkotlin/jvm/functions/Function1;

    iget-object v11, v10, Ltee;->b:[Ljava/lang/Object;

    iget-object v12, v10, Ltee;->a:[J

    array-length v13, v12

    const/16 v18, 0x2

    add-int/lit8 v13, v13, -0x2

    move-wide/from16 v21, v6

    if-ltz v13, :cond_55e

    const/4 v14, 0x0

    :goto_521
    aget-wide v6, v12, v14

    move/from16 v23, v8

    move/from16 v24, v9

    not-long v8, v6

    shl-long v8, v8, v23

    and-long/2addr v8, v6

    and-long v8, v8, v21

    cmp-long v8, v8, v21

    if-eqz v8, :cond_554

    sub-int v8, v14, v13

    not-int v8, v8

    ushr-int/lit8 v8, v8, 0x1f

    rsub-int/lit8 v9, v8, 0x8

    const/4 v8, 0x0

    :goto_539
    if-ge v8, v9, :cond_54f

    and-long v25, v6, v19

    cmp-long v25, v25, v16

    if-gez v25, :cond_54a

    shl-int/lit8 v25, v14, 0x3

    add-int v25, v25, v8

    aget-object v15, v11, v25

    invoke-interface {v5, v15}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_54a
    shr-long v6, v6, v24

    add-int/lit8 v8, v8, 0x1

    goto :goto_539

    :cond_54f
    move/from16 v6, v24

    if-ne v9, v6, :cond_561

    goto :goto_556

    :cond_554
    move/from16 v6, v24

    :goto_556
    if-eq v14, v13, :cond_561

    add-int/lit8 v14, v14, 0x1

    move v9, v6

    move/from16 v8, v23

    goto :goto_521

    :cond_55e
    move/from16 v23, v8

    move v6, v9

    :cond_561
    invoke-virtual {v10}, Ltee;->b()V
    :try_end_564
    .catchall {:try_start_500 .. :try_end_564} :catchall_575

    add-int/lit8 v4, v4, 0x1

    move v9, v6

    move-wide/from16 v6, v21

    move/from16 v8, v23

    goto :goto_509

    :cond_56c
    move-wide/from16 v21, v6

    move/from16 v23, v8

    move v6, v9

    const/4 v4, 0x0

    :try_start_572
    iput-boolean v4, v1, Ltuj;->c:Z

    goto :goto_57f

    :catchall_575
    move-exception v0

    const/4 v4, 0x0

    iput-boolean v4, v1, Ltuj;->c:Z

    throw v0
    :try_end_57a
    .catchall {:try_start_572 .. :try_end_57a} :catchall_590

    :cond_57a
    move-wide/from16 v21, v6

    move/from16 v23, v8

    move v6, v9

    :goto_57f
    monitor-exit v2

    invoke-virtual {v1}, Ltuj;->d()Z

    move-result v0

    if-nez v0, :cond_589

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :cond_589
    move v9, v6

    move-wide/from16 v6, v21

    move/from16 v8, v23

    goto/16 :goto_4f6

    :catchall_590
    move-exception v0

    monitor-exit v2

    throw v0

    :pswitch_593
    iget-object v0, v0, Ldnj;->b:Ljava/lang/Object;

    check-cast v0, Lvnj;

    const/4 v4, 0x0

    iput-boolean v4, v0, Lvnj;->f:Z

    invoke-virtual {v0}, Lvnj;->a()V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_data_5a0
    .packed-switch 0x0
        :pswitch_593
        :pswitch_4ed
        :pswitch_4b4
        :pswitch_487
        :pswitch_47a
        :pswitch_471
        :pswitch_449
        :pswitch_426
        :pswitch_3fe
        :pswitch_3e6
        :pswitch_3dc
        :pswitch_3c6
        :pswitch_3bc
        :pswitch_3a3
        :pswitch_393
        :pswitch_380
        :pswitch_2fc
        :pswitch_2f2
        :pswitch_2df
        :pswitch_259
        :pswitch_24d
        :pswitch_85
        :pswitch_6b
        :pswitch_61
        :pswitch_57
        :pswitch_4d
        :pswitch_3c
        :pswitch_34
        :pswitch_24
    .end packed-switch
.end method
