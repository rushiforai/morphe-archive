.class public final synthetic Lwg5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lwg5;->a:B

    iput-object p1, p0, Lwg5;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 13

    iget-byte v0, p0, Lwg5;->a:B

    const/16 v1, 0xd

    const/4 v2, 0x3

    const/4 v3, 0x0

    const/4 v4, 0x6

    const/4 v5, 0x1

    const/4 v6, 0x0

    iget-object p0, p0, Lwg5;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_39e

    check-cast p0, Lg77;

    check-cast p1, Ljava/util/Set;

    iget-object p1, p0, Lg77;->b:Ljava/lang/Object;

    check-cast p1, Lcom/google/android/material/chip/ChipGroup;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->removeAllViews()V

    iget-object v0, p0, Lg77;->c:Ljava/lang/Object;

    check-cast v0, Ltsd;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_27
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_e9

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lo0a;

    new-instance v2, Lqu7;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-direct {v2, v7, v6, v4, v3}, Lcom/opera/android/ui/catalog/widget/OperaChip;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    iget-object v8, v2, Lcom/google/android/material/chip/Chip;->e:Ltx4;

    if-eqz v8, :cond_58

    iget v9, v8, Ltx4;->M:F

    const/4 v10, 0x0

    cmpl-float v9, v9, v10

    if-eqz v9, :cond_58

    iput v10, v8, Ltx4;->M:F

    iget-object v9, v8, Ltx4;->m0:Landroid/graphics/Paint;

    invoke-virtual {v9, v10}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-boolean v9, v8, Ltx4;->L0:Z

    if-eqz v9, :cond_55

    invoke-virtual {v8, v10}, Lzdd;->A(F)V

    :cond_55
    invoke-virtual {v8}, Lzdd;->invalidateSelf()V

    :cond_58
    const/high16 v9, 0x42000000    # 32.0f

    invoke-static {v7, v9}, Lz7h;->h(Landroid/content/Context;F)I

    move-result v9

    int-to-float v9, v9

    if-eqz v8, :cond_6f

    iget v10, v8, Ltx4;->J:F

    cmpl-float v10, v10, v9

    if-eqz v10, :cond_6f

    iput v9, v8, Ltx4;->J:F

    invoke-virtual {v8}, Lzdd;->invalidateSelf()V

    invoke-virtual {v8}, Ltx4;->M()V

    :cond_6f
    const/high16 v9, 0x42c80000    # 100.0f

    invoke-static {v7, v9}, Lz7h;->h(Landroid/content/Context;F)I

    move-result v9

    int-to-float v9, v9

    if-eqz v8, :cond_8b

    iget v10, v8, Ltx4;->K:F

    cmpl-float v10, v10, v9

    if-eqz v10, :cond_8b

    iput v9, v8, Ltx4;->K:F

    invoke-virtual {v8}, Lzdd;->l()Lsaj;

    move-result-object v10

    invoke-virtual {v10, v9}, Lsaj;->a(F)Lsaj;

    move-result-object v9

    invoke-virtual {v8, v9}, Lzdd;->k(Lsaj;)V

    :cond_8b
    const/high16 v9, 0x43480000    # 200.0f

    invoke-static {v7, v9}, Lz7h;->h(Landroid/content/Context;F)I

    move-result v7

    invoke-virtual {v2, v7}, Lcom/google/android/material/chip/Chip;->setMaxWidth(I)V

    sget-object v7, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v2, v7}, Lcom/google/android/material/chip/Chip;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    if-eqz v8, :cond_9e

    invoke-virtual {v8, v5}, Ltx4;->T(Z)V

    :cond_9e
    invoke-virtual {v2}, Lcom/google/android/material/chip/Chip;->i()V

    new-instance v7, Lpc5;

    const/16 v8, 0x8

    invoke-direct {v7, v2, v8}, Lpc5;-><init>(Ljava/lang/Object;B)V

    invoke-static {v2}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object v8

    if-eqz v8, :cond_b1

    invoke-static {v8, v2, v7}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_b1
    invoke-virtual {v7, v2}, Lpc5;->a(Landroid/view/View;)V

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v7

    if-eqz v7, :cond_c9

    if-ne v7, v5, :cond_c5

    new-instance v7, Lrxh;

    const v8, 0x7f14016e

    invoke-direct {v7, v8}, Lrxh;-><init>(I)V

    goto :goto_d1

    :cond_c5
    invoke-static {}, Lh9o;->p()V

    goto :goto_eb

    :cond_c9
    new-instance v7, Lrxh;

    const v8, 0x7f14016d

    invoke-direct {v7, v8}, Lrxh;-><init>(I)V

    :goto_d1
    invoke-virtual {v2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v7, v8}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v7

    invoke-virtual {v2, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    new-instance v7, Ljf7;

    invoke-direct {v7, p0, v1, v4}, Ljf7;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v2, v7}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    goto/16 :goto_27

    :cond_e9
    sget-object v6, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_eb
    return-object v6

    :pswitch_ec
    check-cast p0, Lba3;

    check-cast p1, Landroid/view/View;

    sget-object v0, Lcom/opera/hype/image/editor/EditImage;->s:[Lxtb;

    const v0, 0x7f0a0561

    invoke-virtual {p1, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object p1

    instance-of v0, p1, Lbfl;

    if-eqz v0, :cond_100

    check-cast p1, Lbfl;

    goto :goto_101

    :cond_100
    move-object p1, v6

    :goto_101
    if-eqz p1, :cond_105

    iget-object v6, p1, Lbfl;->b:Lba3;

    :cond_105
    invoke-static {v6, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_10e
    check-cast p0, Lzo7;

    check-cast p1, Lbp7;

    iget-object p0, p0, Lzo7;->a:Lode;

    invoke-virtual {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_11a
    check-cast p0, Lcom/opera/android/custom_views/DropShadowFrameLayout;

    check-cast p1, Landroid/graphics/Canvas;

    invoke-static {p0, p1}, Lcom/opera/android/custom_views/DropShadowFrameLayout;->a(Lcom/opera/android/custom_views/DropShadowFrameLayout;Landroid/graphics/Canvas;)Lkotlin/Unit;

    move-result-object p0

    return-object p0

    :pswitch_123
    check-cast p0, Ljj7;

    check-cast p1, Law9;

    instance-of v0, p1, Lck7;

    if-eqz v0, :cond_135

    invoke-virtual {p0, p1}, Ljj7;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    :cond_135
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_13a
    check-cast p0, La1d;

    check-cast p1, Llmg;

    invoke-virtual {p0}, La1d;->invoke()Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_144
    check-cast p0, Lni7;

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    iget-object p0, p0, Lni7;->e:Lkotlin/jvm/functions/Function1;

    const/high16 v0, 0x3f800000    # 1.0f

    sub-float/2addr v0, p1

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_15b
    check-cast p0, Ld06;

    check-cast p1, Lrh7;

    iget-object v0, p1, Lb8e;->a:Lb8e;

    iget-boolean v0, v0, Lb8e;->n:Z

    if-nez v0, :cond_168

    sget-object p0, Lt5m;->b:Lt5m;

    goto :goto_184

    :cond_168
    iget-object v0, p1, Lrh7;->p:Lrh7;

    if-eqz v0, :cond_17e

    new-instance v1, Lwg5;

    const/16 v2, 0x16

    invoke-direct {v1, p0, v2}, Lwg5;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, v0}, Lwg5;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    sget-object v2, Lt5m;->a:Lt5m;

    if-ne p0, v2, :cond_17e

    invoke-static {v0, v1}, Lzch;->E(Lu5m;Lkotlin/jvm/functions/Function1;)V

    :cond_17e
    iput-object v6, p1, Lrh7;->p:Lrh7;

    iput-object v6, p1, Lrh7;->o:Lrh7;

    sget-object p0, Lt5m;->a:Lt5m;

    :goto_184
    return-object p0

    :pswitch_185
    check-cast p0, Lfa7;

    check-cast p1, Ljava/io/IOException;

    iput-boolean v5, p0, Lfa7;->l:Z

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_18e
    check-cast p0, Lokhttp3/internal/cache/DiskLruCache;

    check-cast p1, Ljava/io/IOException;

    invoke-static {p0, p1}, Lokhttp3/internal/cache/DiskLruCache;->h(Lokhttp3/internal/cache/DiskLruCache;Ljava/io/IOException;)Lkotlin/Unit;

    move-result-object p0

    return-object p0

    :pswitch_197
    check-cast p0, Li8m;

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    iget-object p0, p0, Li8m;->o:Lrul;

    invoke-interface {p0}, Lrul;->getState()Ltul;

    move-result-object p0

    iget-object v0, p0, Ltul;->c:Lp0g;

    invoke-virtual {v0}, Lp0g;->h()F

    move-result v0

    add-float/2addr v0, p1

    invoke-virtual {p0, v0}, Ltul;->b(F)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1b2
    check-cast p0, Lynb;

    check-cast p1, Ljava/lang/Throwable;

    invoke-virtual {p0}, Lynb;->B0()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1bc
    check-cast p0, Liak;

    move-object v0, p1

    check-cast v0, Lmk7;

    invoke-interface {p0}, Liak;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lu95;

    iget-wide v1, p0, Lu95;->a:J

    sget-wide p0, Lu95;->g:J

    invoke-static {v1, v2, p0, p1}, Ljgm;->a(JJ)Z

    move-result p0

    if-nez p0, :cond_1d9

    const/4 v5, 0x0

    const/16 v6, 0x7e

    const-wide/16 v3, 0x0

    invoke-static/range {v0 .. v6}, Lmk7;->z0(Lmk7;JJFI)V

    :cond_1d9
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1dc
    check-cast p0, Lamj;

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    iget-object p0, p0, Lamj;->k:Lrul;

    invoke-interface {p0}, Lrul;->getState()Ltul;

    move-result-object p0

    iget-object v0, p0, Ltul;->c:Lp0g;

    invoke-virtual {v0}, Lp0g;->h()F

    move-result v0

    add-float/2addr v0, p1

    invoke-virtual {p0, v0}, Ltul;->b(F)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1f7
    check-cast p0, Lvna;

    check-cast p1, Lfna;

    iget-boolean p0, p0, Lvna;->e:Z

    iput-boolean p0, p1, Lfna;->c:Z

    new-instance p0, Lee6;

    const/4 v0, 0x2

    invoke-direct {p0, v0, v6}, Lee6;-><init>(ILmt5;)V

    iget-object p1, p1, Lfna;->a:Ljava/util/ArrayList;

    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_20d
    check-cast p0, Ltn;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Ltn;->a:Z

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_21a
    check-cast p0, Lcq6;

    check-cast p1, Ltpc;

    iget-object p1, p0, Lcq6;->b:Lfs6;

    iget-object p1, p1, Lfs6;->d:Ljze;

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_23b

    iget-object p0, p0, Lcq6;->d:Lti9;

    iget-object p1, p0, Lti9;->a:Lnx5;

    new-instance v0, Lrf4;

    const/4 v1, 0x5

    invoke-direct {v0, v1, v6, p0}, Lrf4;-><init>(BLmt5;Ljava/lang/Object;)V

    invoke-static {p1, v6, v6, v0, v2}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    :cond_23b
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_23e
    check-cast p0, Lzm6;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0}, Lzm6;->f()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_24b
    check-cast p0, Lml6;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0}, Lml6;->f()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_258
    check-cast p0, Lie6;

    iget-object v0, p0, Lie6;->j:Lzyk;

    check-cast p1, Ljava/lang/Throwable;

    if-eqz p1, :cond_26a

    iget-object p0, p0, Lie6;->h:Lje6;

    new-instance v1, Lw39;

    invoke-direct {v1, p1}, Lw39;-><init>(Ljava/lang/Throwable;)V

    invoke-virtual {p0, v1}, Lje6;->c(Lfak;)V

    :cond_26a
    invoke-virtual {v0}, Lzyk;->isInitialized()Z

    move-result p0

    if-eqz p0, :cond_279

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lhdk;

    invoke-interface {p0}, Le65;->close()V

    :cond_279
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_27c
    check-cast p0, Lwjh;

    check-cast p1, Lkotlin/Unit;

    iget-object p0, p0, Lwjh;->d:Ljava/lang/Object;

    check-cast p0, Lisd;

    invoke-virtual {p0}, Lisd;->G()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_28a
    check-cast p0, Li9c;

    check-cast p1, Lt0i;

    iget-object p1, p1, Lt0i;->a:Ljava/lang/Object;

    invoke-static {p1}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v0

    if-nez v0, :cond_2a7

    check-cast p1, Lehf;

    iget-object p1, p0, Li9c;->d:Ljava/lang/Object;

    check-cast p1, Lghj;

    new-instance v0, Liu2;

    const/16 v1, 0x17

    invoke-direct {v0, p0, v1}, Liu2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Lghj;->a(Lcom/opera/api/Callback;)V

    goto :goto_2b7

    :cond_2a7
    iget-object p1, p0, Li9c;->f:Ljava/lang/Object;

    check-cast p1, Lx5f;

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v1, v0}, Lx5f;->R(ILjava/lang/String;)V

    sget-object p1, Lhsl;->a:Lhsl;

    invoke-virtual {p0, p1}, Li9c;->f(Lisl;)V

    :goto_2b7
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_2ba
    check-cast p0, Lsxd;

    check-cast p1, Losk;

    invoke-virtual {p0}, Lsxd;->call()Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_2c3
    check-cast p0, Ll94;

    check-cast p1, Ljava/lang/Throwable;

    if-eqz p1, :cond_2d5

    instance-of v0, p1, Ljava/util/concurrent/CancellationException;

    if-eqz v0, :cond_2d1

    invoke-virtual {p0}, Ll94;->c()V

    goto :goto_2d8

    :cond_2d1
    invoke-virtual {p0, p1}, Ll94;->d(Ljava/lang/Throwable;)Z

    goto :goto_2d8

    :cond_2d5
    invoke-virtual {p0, v6}, Ll94;->b(Ljava/lang/Object;)Z

    :goto_2d8
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_2db
    check-cast p0, Lt9f;

    check-cast p1, Ls9f;

    iget-boolean v0, p0, Lt9f;->h:Z

    iput-boolean v0, p1, Ls9f;->i:Z

    iget-boolean v0, p0, Lt9f;->i:Z

    iput-boolean v0, p1, Ls9f;->j:Z

    iget-boolean p0, p0, Lt9f;->e:Z

    iput-boolean p0, p1, Ls9f;->f:Z

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_2ee
    check-cast p0, Lqt5;

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iget-object v0, p0, Lqt5;->c:Ljava/lang/Object;

    check-cast v0, Lrt5;

    iget-object p0, p0, Lqt5;->e:Ljava/lang/Object;

    check-cast p0, Ljava/util/List;

    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, p0}, Lrt5;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_308
    check-cast p0, Llt5;

    check-cast p1, Lt15;

    iget-object p0, p0, Llt5;->b:Lkotlinx/serialization/KSerializer;

    if-eqz p0, :cond_31a

    invoke-interface {p0}, Lkotlinx/serialization/KSerializer;->getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;

    move-result-object p0

    if-eqz p0, :cond_31a

    invoke-interface {p0}, Lkotlinx/serialization/descriptors/SerialDescriptor;->getAnnotations()Ljava/util/List;

    move-result-object v6

    :cond_31a
    if-nez v6, :cond_31e

    sget-object v6, Ll08;->a:Ll08;

    :cond_31e
    iput-object v6, p1, Lt15;->b:Ljava/util/List;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_323
    check-cast p0, Lqi5;

    check-cast p1, Ljava/util/Set;

    iget-object p1, p0, Lqi5;->b:Ljava/lang/Object;

    check-cast p1, [Lwkn;

    move v0, v3

    :goto_32c
    if-ge v0, v4, :cond_33d

    aget-object v2, p1, v0

    invoke-interface {v2}, Lwkn;->a()Lekc;

    move-result-object v2

    invoke-virtual {v2}, Lekc;->i()Z

    move-result v2

    if-eqz v2, :cond_37f

    add-int/lit8 v0, v0, 0x1

    goto :goto_32c

    :cond_33d
    invoke-static {p1}, Le82;->m([Ljava/lang/Object;)Lkotlin/sequences/Sequence;

    move-result-object p1

    new-instance v0, Lhf5;

    const/16 v2, 0xb

    invoke-direct {v0, v2}, Lhf5;-><init>(B)V

    new-instance v4, Lm2m;

    invoke-direct {v4, p1, v0}, Lm2m;-><init>(Lkotlin/sequences/Sequence;Lkotlin/jvm/functions/Function1;)V

    new-instance p1, Lhf5;

    const/16 v0, 0xc

    invoke-direct {p1, v0}, Lhf5;-><init>(B)V

    new-instance v0, Lm2m;

    invoke-direct {v0, v4, p1}, Lm2m;-><init>(Lkotlin/sequences/Sequence;Lkotlin/jvm/functions/Function1;)V

    new-instance p1, Lbli;

    invoke-direct {p1, v1}, Lbli;-><init>(B)V

    new-instance v1, Lv39;

    invoke-direct {v1, v0, v3, p1}, Lv39;-><init>(Lkotlin/sequences/Sequence;ZLkotlin/jvm/functions/Function1;)V

    new-instance p1, Lbli;

    const/16 v0, 0xa

    invoke-direct {p1, v0}, Lbli;-><init>(B)V

    new-instance v0, Lr79;

    new-instance v3, Lbli;

    invoke-direct {v3, v2}, Lbli;-><init>(B)V

    invoke-direct {v0, v1, v3, p1}, Lr79;-><init>(Lkotlin/sequences/Sequence;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)V

    invoke-static {v0}, Ly1j;->h(Lkotlin/sequences/Sequence;)Ljava/util/Set;

    move-result-object p1

    iget-object p0, p0, Lqi5;->c:Lode;

    check-cast p0, Lh42;

    invoke-static {p0, p1}, Lxf8;->E0(Lode;Ljava/lang/Object;)Z

    :cond_37f
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_382
    check-cast p0, Lfh5;

    check-cast p1, Loag;

    iget-object p1, p0, Lfh5;->x:Lra1;

    if-nez p1, :cond_393

    new-instance p1, Lra1;

    iget-object v0, p0, Lfh5;->a:Landroid/view/View;

    invoke-direct {p1, v0}, Lra1;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Lfh5;->x:Lra1;

    :cond_393
    return-object p1

    :pswitch_394
    check-cast p0, Lo93;

    check-cast p1, Lhjm;

    invoke-virtual {p0, p1, v2}, Lo93;->b(Lhjm;I)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_39e
    .packed-switch 0x0
        :pswitch_394
        :pswitch_382
        :pswitch_323
        :pswitch_308
        :pswitch_2ee
        :pswitch_2db
        :pswitch_2c3
        :pswitch_2ba
        :pswitch_28a
        :pswitch_27c
        :pswitch_258
        :pswitch_24b
        :pswitch_23e
        :pswitch_21a
        :pswitch_20d
        :pswitch_1f7
        :pswitch_1dc
        :pswitch_1bc
        :pswitch_1b2
        :pswitch_197
        :pswitch_18e
        :pswitch_185
        :pswitch_15b
        :pswitch_144
        :pswitch_13a
        :pswitch_123
        :pswitch_11a
        :pswitch_10e
        :pswitch_ec
    .end packed-switch
.end method
