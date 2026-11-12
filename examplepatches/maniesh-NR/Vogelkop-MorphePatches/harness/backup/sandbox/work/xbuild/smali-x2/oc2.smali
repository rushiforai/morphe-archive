.class public final synthetic Loc2;
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

    iput-byte p2, p0, Loc2;->a:B

    iput-object p1, p0, Loc2;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 25

    move-object/from16 v0, p0

    iget-byte v1, v0, Loc2;->a:B

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x0

    iget-object v0, v0, Loc2;->b:Ljava/lang/Object;

    packed-switch v1, :pswitch_data_4a6

    check-cast v0, Lqb7;

    iget-object v1, v0, Lqb7;->a:Ljava/lang/Object;

    check-cast v1, Landroid/widget/ImageView;

    sget-object v2, Lpc;->y:Lpc;

    invoke-virtual {v0, v1, v2}, Lqb7;->A(Landroid/widget/ImageView;Lpc;)V

    iget-object v1, v0, Lqb7;->b:Ljava/lang/Object;

    check-cast v1, Landroid/widget/ImageView;

    sget-object v2, Lpc;->v:Lpc;

    invoke-virtual {v0, v1, v2}, Lqb7;->A(Landroid/widget/ImageView;Lpc;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_23
    check-cast v0, Lw04;

    iget-object v1, v0, Lw04;->b:Lx05;

    iget-object v0, v0, Lw04;->a:Landroid/content/Context;

    sget-object v2, Lwz3;->a:Lixh;

    invoke-virtual {v2, v0}, Ly7h;->l(Landroid/content/Context;)F

    move-result v2

    iget-object v3, v1, Lx05;->a:Lu05;

    iput v2, v3, Lu05;->h:F

    iget-object v3, v3, Lu05;->b:Landroid/graphics/Paint;

    invoke-virtual {v3, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    const v2, 0x7f0402d7

    const v3, 0x7f06063b

    invoke-static {v2, v0, v3}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v0

    filled-new-array {v0}, [I

    move-result-object v0

    invoke-virtual {v1, v0}, Lx05;->b([I)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_4f
    check-cast v0, Ltz3;

    invoke-virtual {v0}, Ltz3;->c()V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_57
    check-cast v0, Lhx3;

    iget-object v0, v0, Lhx3;->b:Ldx3;

    iget-object v0, v0, Ldx3;->j:Lqi;

    return-object v0

    :pswitch_5e
    check-cast v0, Ldx3;

    invoke-static {v0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v0

    return-object v0

    :pswitch_65
    check-cast v0, Llu3;

    invoke-virtual {v0}, Llu3;->invoke()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfd;

    return-object v0

    :pswitch_6e
    check-cast v0, Lmt3;

    iget-object v0, v0, Lmt3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v0}, Lcom/opera/android/BrowserActivity;->H0()Lcom/opera/android/settings/SettingsManager;

    move-result-object v0

    return-object v0

    :pswitch_77
    check-cast v0, Lli;

    invoke-virtual {v0}, Lli;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lskm;

    return-object v0

    :pswitch_80
    check-cast v0, Lli;

    invoke-virtual {v0}, Lli;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorm;

    return-object v0

    :pswitch_89
    check-cast v0, [Z

    aput-boolean v2, v0, v3

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_90
    check-cast v0, Lc5o;

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v0, v0, Lc5o;->a:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->H()Lglh;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Lwzg;

    invoke-direct {v1, v2}, Lwzg;-><init>(B)V

    iget-object v2, v0, Lglh;->d:Lqie;

    iget-object v3, v0, Lglh;->c:Lumi;

    new-instance v5, Lq2g;

    const/16 v6, 0x14

    invoke-direct {v5, v0, v1, v6}, Lq2g;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {v3, v5}, Ltcl;->c(Ljava/lang/Runnable;)Lnml;

    move-result-object v0

    new-instance v3, Loml;

    invoke-direct {v3, v0}, Loml;-><init>(Lnml;)V

    invoke-virtual {v2, v3, v4}, Lqie;->n(Loml;Ljava/lang/Object;)Lp1j;

    :try_start_c1
    iget-object v0, v1, Lwzg;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->await()V
    :try_end_c8
    .catch Ljava/lang/InterruptedException; {:try_start_c1 .. :try_end_c8} :catch_c9

    goto :goto_cd

    :catch_c9
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    iput-object v0, v1, Lwzg;->c:Ljava/lang/Object;

    :goto_cd
    iget-object v0, v1, Lwzg;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/List;

    return-object v0

    :pswitch_d2
    check-cast v0, Lju3;

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v0, v0, Lju3;->e:Lku3;

    iget-object v0, v0, Lku3;->e:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v0

    iget-object v0, v0, Ld6j;->c:Lx5f;

    const-wide/16 v1, -0x1

    invoke-virtual {v0, v1, v2}, Lx5f;->z0(J)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_ee
    check-cast v0, Lvoh;

    return-object v0

    :pswitch_f1
    check-cast v0, Lgq3;

    invoke-virtual {v0}, Lgq3;->b()V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_f9
    check-cast v0, Lbp3;

    invoke-virtual {v0, v3}, Lbp3;->i(Z)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_101
    check-cast v0, Lami;

    iget-object v0, v0, Lami;->g:Ljava/lang/Object;

    check-cast v0, Lv9j;

    invoke-static {v0}, Lb8h;->d(Lekc;)Lh42;

    move-result-object v0

    return-object v0

    :pswitch_10c
    check-cast v0, Lqb7;

    invoke-virtual {v0}, Lqb7;->z()V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_114
    check-cast v0, Lij3;

    iget-object v0, v0, Lij3;->f:Lkze;

    return-object v0

    :pswitch_119
    check-cast v0, Lcom/opera/android/browser/blocklist/manifest/db/BlockListDatabase_Impl;

    new-instance v1, Lmi3;

    invoke-direct {v1, v0}, Lmi3;-><init>(Ly5i;)V

    return-object v1

    :pswitch_121
    check-cast v0, Ljg3;

    new-instance v1, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v1}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    iget-object v5, v0, Ljg3;->b:Lvrf;

    new-instance v6, Lgg3;

    iget-object v7, v0, Ljg3;->d:Ljava/lang/Object;

    check-cast v7, Loza;

    invoke-interface {v7}, Loza;->source()Lv04;

    move-result-object v7

    invoke-direct {v6, v7, v3}, Lgg3;-><init>(Lewj;B)V

    new-instance v7, Ltlh;

    invoke-direct {v7, v6}, Ltlh;-><init>(Lewj;)V

    iput-boolean v2, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    invoke-virtual {v7}, Ltlh;->peek()Ltlh;

    move-result-object v8

    new-instance v9, Ljk3;

    const/4 v10, 0x3

    invoke-direct {v9, v8, v10}, Ljk3;-><init>(Ljava/lang/Object;B)V

    invoke-static {v9, v4, v1}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    iget-object v8, v6, Lgg3;->b:Ljava/lang/Exception;

    if-nez v8, :cond_3fb

    iput-boolean v3, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    sget-object v8, Lmh8;->a:Landroid/graphics/Paint;

    iget-object v8, v1, Landroid/graphics/BitmapFactory$Options;->outMimeType:Ljava/lang/String;

    iget-object v0, v0, Ljg3;->e:Ljava/lang/Object;

    check-cast v0, Lih8;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v0, "image/jpeg"

    if-eqz v8, :cond_180

    invoke-virtual {v8, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_17e

    const-string v9, "image/webp"

    invoke-virtual {v8, v9}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_17e

    const-string v9, "image/heic"

    invoke-virtual {v8, v9}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_17e

    const-string v9, "image/heif"

    invoke-virtual {v8, v9}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_180

    :cond_17e
    move v8, v2

    goto :goto_181

    :cond_180
    move v8, v3

    :goto_181
    const/16 v9, 0x10e

    const/16 v11, 0x5a

    if-eqz v8, :cond_1c4

    new-instance v8, Lgh8;

    new-instance v12, Li34;

    invoke-virtual {v7}, Ltlh;->peek()Ltlh;

    move-result-object v13

    new-instance v14, Ljk3;

    invoke-direct {v14, v13, v10}, Ljk3;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v12, v14}, Li34;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v8, v12}, Lgh8;-><init>(Ljava/io/InputStream;)V

    new-instance v12, Lyg8;

    const-string v13, "Orientation"

    invoke-virtual {v8, v2, v13}, Lgh8;->d(ILjava/lang/String;)I

    move-result v14

    const/4 v15, 0x2

    if-eq v14, v15, :cond_1b0

    const/4 v15, 0x7

    if-eq v14, v15, :cond_1b0

    const/4 v15, 0x4

    if-eq v14, v15, :cond_1b0

    const/4 v15, 0x5

    if-eq v14, v15, :cond_1b0

    move v14, v3

    goto :goto_1b1

    :cond_1b0
    move v14, v2

    :goto_1b1
    invoke-virtual {v8, v2, v13}, Lgh8;->d(ILjava/lang/String;)I

    move-result v8

    packed-switch v8, :pswitch_data_4e4

    move v8, v3

    goto :goto_1c0

    :pswitch_1ba
    move v8, v11

    goto :goto_1c0

    :pswitch_1bc
    move v8, v9

    goto :goto_1c0

    :pswitch_1be
    const/16 v8, 0xb4

    :goto_1c0
    invoke-direct {v12, v14, v8}, Lyg8;-><init>(ZI)V

    goto :goto_1c6

    :cond_1c4
    sget-object v12, Lyg8;->c:Lyg8;

    :goto_1c6
    iget v8, v12, Lyg8;->a:I

    iget-boolean v12, v12, Lyg8;->b:Z

    iget-object v13, v6, Lgg3;->b:Ljava/lang/Exception;

    if-nez v13, :cond_3fa

    iput-boolean v3, v1, Landroid/graphics/BitmapFactory$Options;->inMutable:Z

    sget-object v13, Leza;->c:Lxm5;

    invoke-static {v5, v13}, Lxf8;->K(Lvrf;Lxm5;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Landroid/graphics/ColorSpace;

    iget-object v15, v5, Lvrf;->a:Landroid/content/Context;

    if-eqz v14, :cond_1e4

    invoke-static {v5, v13}, Lxf8;->K(Lvrf;Lxm5;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Landroid/graphics/ColorSpace;

    iput-object v13, v1, Landroid/graphics/BitmapFactory$Options;->inPreferredColorSpace:Landroid/graphics/ColorSpace;

    :cond_1e4
    sget-object v13, Leza;->d:Lxm5;

    invoke-static {v5, v13}, Lxf8;->K(Lvrf;Lxm5;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/Boolean;

    invoke-virtual {v13}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v13

    iput-boolean v13, v1, Landroid/graphics/BitmapFactory$Options;->inPremultiplied:Z

    sget-object v13, Leza;->b:Lxm5;

    invoke-static {v5, v13}, Lxf8;->K(Lvrf;Lxm5;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Landroid/graphics/Bitmap$Config;

    if-nez v12, :cond_1fe

    if-lez v8, :cond_206

    :cond_1fe
    if-eqz v13, :cond_204

    sget-object v14, Landroid/graphics/Bitmap$Config;->HARDWARE:Landroid/graphics/Bitmap$Config;

    if-ne v13, v14, :cond_206

    :cond_204
    sget-object v13, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    :cond_206
    sget-object v14, Leza;->g:Lxm5;

    invoke-static {v5, v14}, Lxf8;->K(Lvrf;Lxm5;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/Boolean;

    invoke-virtual {v14}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v14

    if-eqz v14, :cond_222

    sget-object v14, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    if-ne v13, v14, :cond_222

    iget-object v14, v1, Landroid/graphics/BitmapFactory$Options;->outMimeType:Ljava/lang/String;

    invoke-static {v14, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_222

    sget-object v13, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    :cond_222
    iget-object v0, v1, Landroid/graphics/BitmapFactory$Options;->outConfig:Landroid/graphics/Bitmap$Config;

    sget-object v14, Landroid/graphics/Bitmap$Config;->RGBA_F16:Landroid/graphics/Bitmap$Config;

    if-ne v0, v14, :cond_22d

    sget-object v0, Landroid/graphics/Bitmap$Config;->HARDWARE:Landroid/graphics/Bitmap$Config;

    if-eq v13, v0, :cond_22d

    move-object v13, v14

    :cond_22d
    iput-object v13, v1, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    iget v0, v1, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    if-lez v0, :cond_319

    iget v13, v1, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    if-lez v13, :cond_319

    if-eq v8, v11, :cond_23d

    if-eq v8, v9, :cond_23d

    move v14, v0

    goto :goto_23e

    :cond_23d
    move v14, v13

    :goto_23e
    if-eq v8, v11, :cond_243

    if-eq v8, v9, :cond_243

    move v0, v13

    :cond_243
    iget-object v13, v5, Lvrf;->b:Lapj;

    iget-object v9, v5, Lvrf;->c:Llli;

    sget-object v11, Ldza;->b:Lxm5;

    invoke-static {v5, v11}, Lxf8;->K(Lvrf;Lxm5;)Ljava/lang/Object;

    move-result-object v16

    move-object/from16 v4, v16

    check-cast v4, Lapj;

    invoke-static {v14, v0, v13, v9, v4}, Lzi4;->q(IILapj;Llli;Lapj;)J

    move-result-wide v17

    const/16 v4, 0x20

    shr-long v3, v17, v4

    long-to-int v3, v3

    const-wide v19, 0xffffffffL

    move-object v13, v11

    and-long v10, v17, v19

    long-to-int v10, v10

    div-int v11, v14, v3

    invoke-static {v11}, Ljava/lang/Integer;->highestOneBit(I)I

    move-result v11

    div-int v17, v0, v10

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->highestOneBit(I)I

    move-result v4

    move-object/from16 v17, v9

    invoke-virtual/range {v17 .. v17}, Ljava/lang/Enum;->ordinal()I

    move-result v9

    if-eqz v9, :cond_284

    if-ne v9, v2, :cond_27e

    invoke-static {v11, v4}, Ljava/lang/Math;->max(II)I

    move-result v4

    goto :goto_288

    :cond_27e
    invoke-static {}, Lh9o;->p()V

    :goto_281
    const/4 v4, 0x0

    goto/16 :goto_3f0

    :cond_284
    invoke-static {v11, v4}, Ljava/lang/Math;->min(II)I

    move-result v4

    :goto_288
    if-ge v4, v2, :cond_28b

    move v4, v2

    :cond_28b
    iput v4, v1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    move v11, v3

    int-to-double v2, v14

    move v14, v10

    int-to-double v9, v4

    div-double/2addr v2, v9

    move-wide/from16 v20, v2

    int-to-double v2, v0

    div-double/2addr v2, v9

    int-to-double v9, v11

    move-wide/from16 v22, v2

    int-to-double v2, v14

    invoke-static {v5, v13}, Lxf8;->K(Lvrf;Lxm5;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lapj;

    div-double v10, v9, v20

    div-double v2, v2, v22

    invoke-virtual/range {v17 .. v17}, Ljava/lang/Enum;->ordinal()I

    move-result v4

    if-eqz v4, :cond_2b6

    const/4 v9, 0x1

    if-ne v4, v9, :cond_2b2

    invoke-static {v10, v11, v2, v3}, Ljava/lang/Math;->min(DD)D

    move-result-wide v2

    goto :goto_2ba

    :cond_2b2
    invoke-static {}, Lh9o;->p()V

    goto :goto_281

    :cond_2b6
    invoke-static {v10, v11, v2, v3}, Ljava/lang/Math;->max(DD)D

    move-result-wide v2

    :goto_2ba
    iget-object v4, v0, Lapj;->a:Lg97;

    instance-of v10, v4, Le97;

    if-eqz v10, :cond_2cc

    check-cast v4, Le97;

    iget v4, v4, Le97;->a:I

    int-to-double v10, v4

    div-double v10, v10, v20

    cmpl-double v4, v2, v10

    if-lez v4, :cond_2cc

    move-wide v2, v10

    :cond_2cc
    iget-object v0, v0, Lapj;->b:Lg97;

    instance-of v4, v0, Le97;

    if-eqz v4, :cond_2de

    check-cast v0, Le97;

    iget v0, v0, Le97;->a:I

    int-to-double v10, v0

    div-double v10, v10, v22

    cmpl-double v0, v2, v10

    if-lez v0, :cond_2de

    move-wide v2, v10

    :cond_2de
    iget-object v0, v5, Lvrf;->d:Lwog;

    sget-object v4, Lwog;->b:Lwog;

    const-wide/high16 v10, 0x3ff0000000000000L    # 1.0

    if-ne v0, v4, :cond_2eb

    cmpl-double v0, v2, v10

    if-lez v0, :cond_2eb

    move-wide v2, v10

    :cond_2eb
    cmpg-double v0, v2, v10

    if-nez v0, :cond_2f1

    const/4 v0, 0x1

    goto :goto_2f2

    :cond_2f1
    const/4 v0, 0x0

    :goto_2f2
    xor-int/lit8 v4, v0, 0x1

    iput-boolean v4, v1, Landroid/graphics/BitmapFactory$Options;->inScaled:Z

    if-nez v0, :cond_30d

    cmpl-double v0, v2, v10

    const v4, 0x7fffffff

    const-wide v10, 0x41dfffffffc00000L    # 2.147483647E9

    if-lez v0, :cond_30f

    div-double/2addr v10, v2

    invoke-static {v10, v11}, Lzed;->a(D)I

    move-result v0

    iput v0, v1, Landroid/graphics/BitmapFactory$Options;->inDensity:I

    iput v4, v1, Landroid/graphics/BitmapFactory$Options;->inTargetDensity:I

    :cond_30d
    :goto_30d
    const/4 v0, 0x0

    goto :goto_31f

    :cond_30f
    iput v4, v1, Landroid/graphics/BitmapFactory$Options;->inDensity:I

    mul-double/2addr v10, v2

    invoke-static {v10, v11}, Lzed;->a(D)I

    move-result v0

    iput v0, v1, Landroid/graphics/BitmapFactory$Options;->inTargetDensity:I

    goto :goto_30d

    :cond_319
    move v9, v2

    iput v9, v1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    const/4 v0, 0x0

    iput-boolean v0, v1, Landroid/graphics/BitmapFactory$Options;->inScaled:Z

    :goto_31f
    :try_start_31f
    new-instance v2, Ljk3;

    const/4 v4, 0x3

    invoke-direct {v2, v7, v4}, Ljk3;-><init>(Ljava/lang/Object;B)V

    const/4 v3, 0x0

    invoke-static {v2, v3, v1}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v2
    :try_end_32a
    .catchall {:try_start_31f .. :try_end_32a} :catchall_3f2

    invoke-virtual {v7}, Ltlh;->close()V

    iget-object v4, v6, Lgg3;->b:Ljava/lang/Exception;

    if-nez v4, :cond_3f1

    if-eqz v2, :cond_3ea

    invoke-virtual {v15}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    iget v3, v3, Landroid/util/DisplayMetrics;->densityDpi:I

    invoke-virtual {v2, v3}, Landroid/graphics/Bitmap;->setDensity(I)V

    if-nez v12, :cond_344

    if-lez v8, :cond_3cd

    :cond_344
    new-instance v3, Landroid/graphics/Matrix;

    invoke-direct {v3}, Landroid/graphics/Matrix;-><init>()V

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    int-to-float v4, v4

    const/high16 v5, 0x40000000    # 2.0f

    div-float/2addr v4, v5

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v6

    int-to-float v6, v6

    div-float/2addr v6, v5

    if-eqz v12, :cond_360

    const/high16 v5, -0x40800000    # -1.0f

    const/high16 v7, 0x3f800000    # 1.0f

    invoke-virtual {v3, v5, v7, v4, v6}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    :cond_360
    if-lez v8, :cond_366

    int-to-float v5, v8

    invoke-virtual {v3, v5, v4, v6}, Landroid/graphics/Matrix;->postRotate(FFF)Z

    :cond_366
    new-instance v4, Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    int-to-float v5, v5

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v6

    int-to-float v6, v6

    const/4 v7, 0x0

    invoke-direct {v4, v7, v7, v5, v6}, Landroid/graphics/RectF;-><init>(FFFF)V

    invoke-virtual {v3, v4}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    iget v5, v4, Landroid/graphics/RectF;->left:F

    cmpg-float v6, v5, v7

    if-nez v6, :cond_388

    iget v6, v4, Landroid/graphics/RectF;->top:F

    cmpg-float v6, v6, v7

    if-nez v6, :cond_388

    :goto_385
    const/16 v4, 0x5a

    goto :goto_390

    :cond_388
    neg-float v5, v5

    iget v4, v4, Landroid/graphics/RectF;->top:F

    neg-float v4, v4

    invoke-virtual {v3, v5, v4}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    goto :goto_385

    :goto_390
    if-eq v8, v4, :cond_3ab

    const/16 v4, 0x10e

    if-eq v8, v4, :cond_3ab

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v6

    if-nez v6, :cond_3a6

    sget-object v6, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    :cond_3a6
    invoke-static {v4, v5, v6}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v4

    goto :goto_3bf

    :cond_3ab
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v6

    if-nez v6, :cond_3bb

    sget-object v6, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    :cond_3bb
    invoke-static {v4, v5, v6}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v4

    :goto_3bf
    new-instance v5, Landroid/graphics/Canvas;

    invoke-direct {v5, v4}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    sget-object v6, Lmh8;->a:Landroid/graphics/Paint;

    invoke-virtual {v5, v2, v3, v6}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->recycle()V

    move-object v2, v4

    :cond_3cd
    new-instance v4, Lej6;

    invoke-virtual {v15}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    new-instance v5, Landroid/graphics/drawable/BitmapDrawable;

    invoke-direct {v5, v3, v2}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    invoke-static {v5}, Lipe;->k(Landroid/graphics/drawable/Drawable;)Ljva;

    move-result-object v2

    iget v3, v1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    const/4 v9, 0x1

    if-gt v3, v9, :cond_3e5

    iget-boolean v1, v1, Landroid/graphics/BitmapFactory$Options;->inScaled:Z

    if-eqz v1, :cond_3e6

    :cond_3e5
    move v0, v9

    :cond_3e6
    invoke-direct {v4, v2, v0}, Lej6;-><init>(Ljva;Z)V

    goto :goto_3f0

    :cond_3ea
    const-string v0, "BitmapFactory returned a null bitmap. Often this means BitmapFactory could not decode the image data read from the image source (e.g. network, disk, or memory) as it\'s not encoded as a valid image format."

    invoke-static {v0}, Lqp2;->n(Ljava/lang/String;)V

    move-object v4, v3

    :goto_3f0
    return-object v4

    :cond_3f1
    throw v4

    :catchall_3f2
    move-exception v0

    move-object v1, v0

    :try_start_3f4
    throw v1
    :try_end_3f5
    .catchall {:try_start_3f4 .. :try_end_3f5} :catchall_3f5

    :catchall_3f5
    move-exception v0

    invoke-static {v7, v1}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v0

    :cond_3fa
    throw v13

    :cond_3fb
    throw v8

    :pswitch_3fc
    check-cast v0, Lsf1;

    return-object v0

    :pswitch_3ff
    check-cast v0, Lw43;

    iget-object v1, v0, Lw43;->b:Ljava/lang/Object;

    check-cast v1, Lk6l;

    iget-object v1, v1, Lk6l;->o:Lb2l;

    invoke-virtual {v0, v1}, Lw43;->W(Lb2l;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_40d
    check-cast v0, Lz43;

    iget-object v1, v0, Lz43;->f:Ljava/lang/Object;

    check-cast v1, Lv43;

    iget-object v0, v0, Lz43;->c:Ljava/lang/Object;

    check-cast v0, Lk6l;

    iget-object v0, v0, Lk6l;->o:Lb2l;

    invoke-virtual {v1, v0}, Lv43;->c(Lb2l;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_41f
    check-cast v0, Lg1b;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0

    :pswitch_42a
    check-cast v0, Ld13;

    iget-object v0, v0, Ld13;->o:La8e;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Ljava/lang/ClassCastException;

    invoke-direct {v0}, Ljava/lang/ClassCastException;-><init>()V

    throw v0

    :pswitch_437
    check-cast v0, Lnv2;

    sget-object v1, Lhk6;->i:Lh58;

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v1}, Lz4;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_444
    :goto_444
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_45b

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    move-object v4, v3

    check-cast v4, Lhk6;

    invoke-virtual {v0, v4}, Lnv2;->a(Lhk6;)Z

    move-result v4

    if-eqz v4, :cond_444

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_444

    :cond_45b
    return-object v2

    :pswitch_45c
    move-object v3, v4

    check-cast v0, Lts2;

    iget-object v0, v0, Lts2;->a:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {v0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v0

    invoke-static {v0}, Ldx3;->L(Lorg/chromium/content_public/browser/WebContents;)Ldx3;

    move-result-object v0

    if-eqz v0, :cond_47f

    invoke-virtual {v0}, Ldx3;->N()Lex3;

    move-result-object v0

    if-eqz v0, :cond_47f

    invoke-interface {v0}, Lex3;->f()Lcom/opera/android/Lazy;

    move-result-object v0

    if-eqz v0, :cond_47f

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Lbt2;

    goto :goto_480

    :cond_47f
    move-object v4, v3

    :goto_480
    return-object v4

    :pswitch_481
    check-cast v0, Ltjc;

    new-instance v1, Lyr2;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v0, v1, Lyr2;->a:Lt3g;

    return-object v1

    :pswitch_48b
    check-cast v0, Lxq2;

    iget-object v0, v0, Lxq2;->v:Lua7;

    sget-object v1, Ltq2;->a:Ltq2;

    invoke-static {v0, v1}, Lcqp;->r0(Lua7;Ljava/lang/Object;)V

    invoke-virtual {v0}, Lua7;->D()V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_49a
    check-cast v0, Ligi;

    iget-object v0, v0, Ligi;->e:Ljava/lang/Object;

    check-cast v0, Lv9j;

    invoke-static {v0}, Lb8h;->d(Lekc;)Lh42;

    move-result-object v0

    return-object v0

    nop

    :pswitch_data_4a6
    .packed-switch 0x0
        :pswitch_49a
        :pswitch_48b
        :pswitch_481
        :pswitch_45c
        :pswitch_437
        :pswitch_42a
        :pswitch_41f
        :pswitch_40d
        :pswitch_3ff
        :pswitch_3fc
        :pswitch_121
        :pswitch_119
        :pswitch_114
        :pswitch_10c
        :pswitch_101
        :pswitch_f9
        :pswitch_f1
        :pswitch_ee
        :pswitch_d2
        :pswitch_90
        :pswitch_89
        :pswitch_80
        :pswitch_77
        :pswitch_6e
        :pswitch_65
        :pswitch_5e
        :pswitch_57
        :pswitch_4f
        :pswitch_23
    .end packed-switch

    :pswitch_data_4e4
    .packed-switch 0x3
        :pswitch_1be
        :pswitch_1be
        :pswitch_1bc
        :pswitch_1ba
        :pswitch_1ba
        :pswitch_1bc
    .end packed-switch
.end method
