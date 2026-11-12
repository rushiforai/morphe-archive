.class public final synthetic Lq2;
.super Lnr9;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V
    .registers 8

    .line 18
    iput-byte p7, p0, Lq2;->a:B

    invoke-direct/range {p0 .. p6}, Lmr9;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-void
.end method

.method public constructor <init>(Lven;)V
    .registers 10

    const/16 v0, 0xb

    iput-byte v0, p0, Lq2;->a:B

    const-string v6, "isEnabled()Z"

    const/4 v7, 0x0

    const/4 v2, 0x0

    const-class v4, Lven;

    const-string v5, "isEnabled"

    move-object v1, p0

    move-object v3, p1

    invoke-direct/range {v1 .. v7}, Lmr9;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 15

    iget-byte v0, p0, Lq2;->a:B

    const/16 v1, 0x17

    const-string v2, "OFA.INITIALLY_SUBMITTED_FILES"

    const/4 v3, 0x3

    const/4 v4, 0x1

    const/4 v5, 0x0

    const/4 v6, 0x0

    packed-switch v0, :pswitch_data_4ea

    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lpv7;

    iget-object p0, p0, Lpv7;->e:Lrv7;

    invoke-virtual {p0, v4}, Lrv7;->c(Z)V

    invoke-virtual {p0}, Lrv7;->a()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1c
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lpv7;

    iget-object p0, p0, Lpv7;->e:Lrv7;

    invoke-virtual {p0, v4}, Lrv7;->c(Z)V

    invoke-virtual {p0}, Lrv7;->a()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_2b
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lhi7;

    invoke-virtual {p0}, Lhi7;->b()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_35
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lhi7;

    invoke-virtual {p0}, Lhi7;->d()V

    iput-object v6, p0, Lhi7;->m:Landroid/graphics/Point;

    sget-wide v0, Lhi7;->q:J

    invoke-static {v0, v1}, Lpn7;->f(J)J

    move-result-wide v0

    iget-object v2, p0, Lhi7;->e:Ligi;

    iget-object v3, v2, Ligi;->f:Ljava/lang/Object;

    check-cast v3, Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v3

    invoke-virtual {v3, v0, v1}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v3

    new-instance v4, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v4}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    invoke-virtual {v3, v4}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    iget-object v2, v2, Ligi;->d:Ljava/lang/Object;

    check-cast v2, Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    invoke-virtual {v2, v0, v1}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v1, Lai7;

    const/4 v2, 0x2

    invoke-direct {v1, p0, v2}, Lai7;-><init>(Lhi7;B)V

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->withStartAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_7d
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lhi7;

    invoke-virtual {p0}, Lhi7;->f()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_87
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Llfl;

    invoke-interface {p0}, Llfl;->y()Lkfl;

    move-result-object p0

    return-object p0

    :pswitch_90
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lml6;

    iget-object v0, p0, Lml6;->b:Lz8b;

    if-eqz v0, :cond_a5

    iget-object v0, v0, Lz8b;->b:Ljava/lang/Object;

    check-cast v0, Lgz2;

    if-eqz v0, :cond_a5

    iget-object v0, v0, Lgz2;->f:Lq2;

    if-eqz v0, :cond_a5

    invoke-virtual {v0}, Lq2;->invoke()Ljava/lang/Object;

    :cond_a5
    iput-object v6, p0, Lml6;->b:Lz8b;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_aa
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lorm;

    check-cast p0, Lx5f;

    iget-boolean v0, p0, Lx5f;->h:Z

    if-eqz v0, :cond_b7

    invoke-virtual {p0, v5}, Lx5f;->k(I)V

    :cond_b7
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_ba
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lkw6;

    invoke-virtual {p0}, Lkw6;->c()Lk2j;

    move-result-object p0

    return-object p0

    :pswitch_c3
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lfm4;

    check-cast p0, Lmm4;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lve8;->b:Lve8;

    iget-object p0, p0, Lmm4;->d:Lt3e;

    new-instance v1, Lza8;

    invoke-direct {v1, v0}, Lza8;-><init>(Lve8;)V

    check-cast p0, Lh5e;

    invoke-virtual {p0, v1}, Lh5e;->t(Lfb8;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_dd
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lfm4;

    check-cast p0, Lmm4;

    iget-object v0, p0, Lmm4;->s:Lnak;

    invoke-virtual {v0}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v1

    instance-of v1, v1, Ldm4;

    invoke-virtual {v0, v6}, Lnak;->j(Ljava/lang/Object;)V

    if-eqz v1, :cond_f7

    iget-object p0, p0, Lmm4;->c:Lgm4;

    iget-object p0, p0, Lgm4;->a:Ln7i;

    invoke-virtual {p0}, Ln7i;->invoke()Ljava/lang/Object;

    :cond_f7
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_fa
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lfm4;

    move-object v8, p0

    check-cast v8, Lmm4;

    iget-object v9, v8, Lmm4;->B:Ljava/lang/String;

    iget-object p0, v8, Lmm4;->v:Lnak;

    invoke-virtual {p0}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lom4;

    if-eqz p0, :cond_111

    iget-object p0, p0, Lom4;->a:Ll01;

    move-object v10, p0

    goto :goto_112

    :cond_111
    move-object v10, v6

    :goto_112
    iget-object p0, v8, Lmm4;->s:Lnak;

    invoke-virtual {p0}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object p0

    instance-of v0, p0, Lzl4;

    if-eqz v0, :cond_11f

    check-cast p0, Lzl4;

    goto :goto_120

    :cond_11f
    move-object p0, v6

    :goto_120
    if-eqz p0, :cond_126

    iget-object p0, p0, Lzl4;->d:Ljava/lang/String;

    move-object v11, p0

    goto :goto_127

    :cond_126
    move-object v11, v6

    :goto_127
    if-eqz v9, :cond_14b

    if-eqz v10, :cond_14b

    if-eqz v11, :cond_14b

    iget-object p0, v8, Lmm4;->s:Lnak;

    sget-object v0, Lbm4;->a:Lbm4;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0, v6, v0}, Lnak;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    sget-object p0, Lde8;->k:Lde8;

    invoke-virtual {v8, p0, v10}, Lmm4;->e(Lde8;Ll01;)V

    invoke-static {v8}, Lo0g;->Q(Lae5;)Lnx5;

    move-result-object p0

    new-instance v7, Ls71;

    const/4 v12, 0x0

    const/4 v13, 0x4

    invoke-direct/range {v7 .. v13}, Ls71;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    invoke-static {p0, v6, v6, v7, v3}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    goto :goto_160

    :cond_14b
    iget-object p0, v8, Lmm4;->h:Lhzc;

    iget-object v0, p0, Lhzc;->b:Ljava/lang/String;

    sget-object v1, Leaj;->e:Leaj;

    iget-object v2, p0, Lhzc;->a:Letb;

    iget-object v2, v2, Letb;->a:Leaj;

    invoke-virtual {v2, v1}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    move-result v2

    if-gtz v2, :cond_160

    const-string v2, "onConfirmCashOut: Unexpected state. Required data not set."

    invoke-virtual {p0, v1, v0, v2, v6}, Lhzc;->b(Leaj;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_160
    :goto_160
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_163
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lfm4;

    move-object v8, p0

    check-cast v8, Lmm4;

    sget-object p0, Lfn4;->a:Lfn4;

    iget-object v0, v8, Lmm4;->i:Lnak;

    invoke-virtual {v0}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lhn4;

    sget-object v1, Ldn4;->a:Ldn4;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_34b

    sget-object v1, Lgn4;->a:Lgn4;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_34b

    sget-object v1, Len4;->a:Len4;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    const/4 v11, 0x0

    if-eqz v1, :cond_200

    iget-object v0, v8, Lmm4;->k:Lhdg;

    iget-object v1, v8, Lmm4;->v:Lnak;

    invoke-virtual {v1}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lom4;

    if-eqz v1, :cond_19d

    iget-object v1, v1, Lom4;->a:Ll01;

    move-object v10, v1

    goto :goto_19e

    :cond_19d
    move-object v10, v11

    :goto_19e
    iget-object v1, v0, Lhdg;->b:Lt0g;

    invoke-virtual {v1}, Lt0g;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ley5;

    if-eqz v1, :cond_1ab

    iget-object v1, v1, Ley5;->b:Ljava/lang/String;

    goto :goto_1ad

    :cond_1ab
    const-string v1, ""

    :goto_1ad
    iget-object v2, v0, Lhdg;->a:Lt0g;

    invoke-virtual {v2}, Lt0g;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v1, v2}, Lsko;->j(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lde8;->d:Lde8;

    invoke-virtual {v8, v2, v10}, Lmm4;->e(Lde8;Ll01;)V

    iget-object v2, v8, Lmm4;->e:Li91;

    invoke-virtual {v2, v1}, Li91;->a(Ljava/lang/String;)Lrdg;

    move-result-object v1

    instance-of v2, v1, Lqdg;

    if-nez v2, :cond_1da

    sget-object p0, Lde8;->f:Lde8;

    invoke-virtual {v8, p0, v10}, Lmm4;->e(Lde8;Ll01;)V

    sget-object p0, Lahk;->O0:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lshk;

    invoke-virtual {v0, p0}, Lhdg;->b(Lshk;)V

    goto/16 :goto_34b

    :cond_1da
    sget-object v2, Lde8;->e:Lde8;

    invoke-virtual {v8, v2, v10}, Lmm4;->e(Lde8;Ll01;)V

    invoke-virtual {v0, v11}, Lhdg;->b(Lshk;)V

    iget-object v0, v8, Lmm4;->i:Lnak;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0, v11, p0}, Lnak;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    invoke-static {v8}, Lo0g;->Q(Lae5;)Lnx5;

    move-result-object p0

    new-instance v7, Ls3;

    move-object v9, v1

    check-cast v9, Lqdg;

    const/16 v12, 0xe

    invoke-direct/range {v7 .. v12}, Ls3;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    invoke-static {p0, v11, v11, v7, v3}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    move-result-object p0

    iput-object p0, v8, Lmm4;->C:Ld3k;

    goto/16 :goto_34b

    :cond_200
    instance-of v1, v0, Lcn4;

    if-eqz v1, :cond_341

    check-cast v0, Lcn4;

    iget-object p0, v8, Lmm4;->v:Lnak;

    invoke-virtual {p0}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lom4;

    if-nez p0, :cond_227

    iget-object p0, v8, Lmm4;->h:Lhzc;

    iget-object v0, p0, Lhzc;->b:Ljava/lang/String;

    sget-object v1, Leaj;->e:Leaj;

    iget-object v2, p0, Lhzc;->a:Letb;

    iget-object v2, v2, Letb;->a:Leaj;

    invoke-virtual {v2, v1}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    move-result v2

    if-gtz v2, :cond_34b

    const-string v2, "validateAndConfirm: Unexpected state. Config not selected yet."

    invoke-virtual {p0, v1, v0, v2, v11}, Lhzc;->b(Leaj;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_34b

    :cond_227
    iget-object v1, v8, Lmm4;->l:Lnak;

    invoke-virtual {v1}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iget-object v2, p0, Lom4;->a:Ll01;

    invoke-static {v2, v1}, Lic4;->B(Ll01;Ljava/lang/String;)Lw8e;

    move-result-object v1

    if-eqz v1, :cond_324

    iget-object v2, v1, Lw8e;->c:Ljava/math/BigInteger;

    invoke-virtual {v2}, Ljava/math/BigInteger;->signum()I

    move-result v2

    if-lez v2, :cond_324

    iget-object v2, v8, Lmm4;->z:Lrlh;

    iget-object v2, v2, Lrlh;->a:Lnak;

    invoke-virtual {v2}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iget-object v3, p0, Lom4;->b:Ln01;

    invoke-static {v3}, Lyi4;->X(Ln01;)Lw8e;

    move-result-object v3

    if-eqz v3, :cond_28c

    iget-object v4, v1, Lw8e;->d:Lh46;

    iget-object v5, v3, Lw8e;->d:Lh46;

    if-ne v4, v5, :cond_28c

    invoke-virtual {v1, v3}, Lx8e;->d(Lx8e;)V

    invoke-virtual {v1}, Lx8e;->c()Ljava/math/BigDecimal;

    move-result-object v4

    invoke-virtual {v3}, Lx8e;->c()Ljava/math/BigDecimal;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/math/BigDecimal;->compareTo(Ljava/math/BigDecimal;)I

    move-result v3

    if-gez v3, :cond_28c

    iget-object v0, v8, Lmm4;->n:Lnak;

    new-instance v1, Lo01;

    sget-object v2, Lahk;->g:Lzyk;

    invoke-virtual {v2}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lshk;

    iget-object v3, p0, Lom4;->b:Ln01;

    invoke-static {v3}, Lqyn;->B(Ln01;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lo01;-><init>(Lshk;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0, v11, v1}, Lnak;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    sget-object v0, Lde8;->i:Lde8;

    iget-object p0, p0, Lom4;->a:Ll01;

    invoke-virtual {v8, v0, p0}, Lmm4;->e(Lde8;Ll01;)V

    goto/16 :goto_34b

    :cond_28c
    iget-object v3, v8, Lmm4;->w:Lrlh;

    iget-object v3, v3, Lrlh;->a:Lnak;

    invoke-virtual {v3}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ln01;

    if-eqz v3, :cond_307

    invoke-static {v3}, Lyi4;->X(Ln01;)Lw8e;

    move-result-object v3

    if-eqz v3, :cond_307

    iget-object v4, v1, Lw8e;->d:Lh46;

    iget-object v5, v3, Lw8e;->d:Lh46;

    if-ne v4, v5, :cond_307

    invoke-virtual {v1, v3}, Lx8e;->d(Lx8e;)V

    invoke-virtual {v1}, Lx8e;->c()Ljava/math/BigDecimal;

    move-result-object v4

    invoke-virtual {v3}, Lx8e;->c()Ljava/math/BigDecimal;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/math/BigDecimal;->compareTo(Ljava/math/BigDecimal;)I

    move-result v4

    if-lez v4, :cond_2de

    iget-object v4, v1, Lw8e;->d:Lh46;

    iget v4, v4, Lh46;->e:I

    invoke-static {v4}, Ly8e;->b(I)Ljava/math/BigDecimal;

    move-result-object v4

    invoke-virtual {v1, v3}, Lx8e;->d(Lx8e;)V

    invoke-virtual {v1}, Lx8e;->c()Ljava/math/BigDecimal;

    move-result-object v5

    invoke-virtual {v3}, Lx8e;->c()Ljava/math/BigDecimal;

    move-result-object v3

    invoke-virtual {v5, v3}, Ljava/math/BigDecimal;->subtract(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v3

    invoke-virtual {v3}, Ljava/math/BigDecimal;->abs()Ljava/math/BigDecimal;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/math/BigDecimal;->compareTo(Ljava/math/BigDecimal;)I

    move-result v4

    if-lez v4, :cond_2de

    sget-object v4, Lhe3;->a:Ljava/math/BigDecimal;

    invoke-virtual {v3, v4}, Ljava/math/BigDecimal;->compareTo(Ljava/math/BigDecimal;)I

    move-result v3

    if-gez v3, :cond_307

    :cond_2de
    iget-object v3, v8, Lmm4;->x:Li16;

    sget-object v4, Lj46;->a:Lj46;

    sget-object v4, Lnk9;->a:Lnk9;

    const/16 v4, 0x18

    invoke-static {v3, v1, v4}, Li16;->o(Li16;Lx8e;I)Lqj9;

    move-result-object v1

    invoke-virtual {v1}, Lqj9;->a()Ljava/lang/String;

    move-result-object v1

    iget-object v3, v8, Lmm4;->s:Lnak;

    new-instance v4, Lzl4;

    iget-object v5, p0, Lom4;->a:Ll01;

    iget-object v0, v0, Lcn4;->a:Ljava/lang/String;

    invoke-direct {v4, v1, v5, v2, v0}, Lzl4;-><init>(Ljava/lang/String;Ll01;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v3, v11, v4}, Lnak;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    sget-object v0, Lde8;->j:Lde8;

    iget-object p0, p0, Lom4;->a:Ll01;

    invoke-virtual {v8, v0, p0}, Lmm4;->e(Lde8;Ll01;)V

    goto :goto_34b

    :cond_307
    iget-object v0, v8, Lmm4;->n:Lnak;

    new-instance v1, Lo01;

    sget-object v2, Lahk;->k:Lzyk;

    invoke-virtual {v2}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lshk;

    invoke-direct {v1, v2}, Lo01;-><init>(Lshk;)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0, v11, v1}, Lnak;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    sget-object v0, Lde8;->i:Lde8;

    iget-object p0, p0, Lom4;->a:Ll01;

    invoke-virtual {v8, v0, p0}, Lmm4;->e(Lde8;Ll01;)V

    goto :goto_34b

    :cond_324
    iget-object v0, v8, Lmm4;->n:Lnak;

    new-instance v1, Lo01;

    sget-object v2, Lahk;->l:Lzyk;

    invoke-virtual {v2}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lshk;

    invoke-direct {v1, v2}, Lo01;-><init>(Lshk;)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0, v11, v1}, Lnak;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    sget-object v0, Lde8;->i:Lde8;

    iget-object p0, p0, Lom4;->a:Ll01;

    invoke-virtual {v8, v0, p0}, Lmm4;->e(Lde8;Ll01;)V

    goto :goto_34b

    :cond_341
    invoke-static {v0, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_34b

    invoke-static {}, Lh9o;->p()V

    goto :goto_34d

    :cond_34b
    :goto_34b
    sget-object v6, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_34d
    return-object v6

    :pswitch_34e
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lfm4;

    check-cast p0, Lmm4;

    iget-object v0, p0, Lmm4;->c:Lgm4;

    iget-object v1, p0, Lmm4;->i:Lnak;

    invoke-virtual {v1}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lhn4;

    sget-object v3, Ldn4;->a:Ldn4;

    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3b4

    sget-object v3, Lgn4;->a:Lgn4;

    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_3b4

    sget-object v5, Len4;->a:Len4;

    invoke-static {v2, v5}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_390

    iget-object p0, p0, Lmm4;->r:Lrlh;

    iget-object p0, p0, Lrlh;->a:Lnak;

    invoke-virtual {p0}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lg1b;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    if-le p0, v4, :cond_38a

    invoke-virtual {v1, v6, v3}, Lnak;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    goto :goto_3b9

    :cond_38a
    iget-object p0, v0, Lgm4;->a:Ln7i;

    invoke-virtual {p0}, Ln7i;->invoke()Ljava/lang/Object;

    goto :goto_3b9

    :cond_390
    sget-object v0, Lfn4;->a:Lfn4;

    invoke-static {v2, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3a3

    iget-object p0, p0, Lmm4;->C:Ld3k;

    if-eqz p0, :cond_39f

    invoke-virtual {p0, v6}, Lxob;->k(Ljava/util/concurrent/CancellationException;)V

    :cond_39f
    invoke-virtual {v1, v6, v5}, Lnak;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    goto :goto_3b9

    :cond_3a3
    instance-of v0, v2, Lcn4;

    if-eqz v0, :cond_3b0

    iget-object p0, p0, Lmm4;->n:Lnak;

    invoke-virtual {p0, v6}, Lnak;->j(Ljava/lang/Object;)V

    invoke-virtual {v1, v6, v5}, Lnak;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    goto :goto_3b9

    :cond_3b0
    invoke-static {}, Lh9o;->p()V

    goto :goto_3bb

    :cond_3b4
    iget-object p0, v0, Lgm4;->a:Ln7i;

    invoke-virtual {p0}, Ln7i;->invoke()Ljava/lang/Object;

    :goto_3b9
    sget-object v6, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_3bb
    return-object v6

    :pswitch_3bc
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/Lazy;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lnvg;

    return-object p0

    :pswitch_3c7
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/Lazy;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lgjm;

    return-object p0

    :pswitch_3d2
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/Lazy;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lyug;

    return-object p0

    :pswitch_3dd
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/Lazy;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lzh7;

    return-object p0

    :pswitch_3e8
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lven;

    iget-object p0, p0, Lven;->c:Lji;

    iget-object p0, p0, Lji;->b:Lcom/opera/android/OperaApplication;

    invoke-static {p0}, Ltvg;->t(Landroid/content/Context;)Ltvg;

    move-result-object p0

    invoke-virtual {p0}, Lno7;->i()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lsvg;

    const/16 v0, 0x800

    invoke-virtual {p0, v0}, Lsvg;->a(I)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_405
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Leu2;

    new-instance v0, Lau2;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v1

    new-instance v2, Lwth;

    const/16 v3, 0xf

    invoke-direct {v2, p0, v3}, Lwth;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0}, Leu2;->H0()Lhu2;

    move-result-object p0

    iget-object p0, p0, Lhu2;->e:Lx5g;

    iget-object p0, p0, Lx5g;->d:Lw4g;

    invoke-direct {v0, v1, v2, p0}, Lau2;-><init>(Landroid/content/Context;Lwth;Lw4g;)V

    return-object v0

    :pswitch_422
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lqt2;

    invoke-virtual {p0}, Lqt2;->I0()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_42c
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lqt2;

    invoke-virtual {p0}, Lqt2;->I0()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_436
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lkc2;

    iget-object p0, p0, Lltl;->n:Lqm9;

    new-instance v0, Lglj;

    new-instance v1, Lrxh;

    const v2, 0x7f140beb

    invoke-direct {v1, v2}, Lrxh;-><init>(I)V

    const/16 v2, 0x9c4

    invoke-direct {v0, v1, v2}, Lglj;-><init>(Lpxh;I)V

    invoke-virtual {p0, v0}, Lqm9;->f(Lo93;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_451
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lv22;

    iget-object v0, p0, Lv22;->g:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lm02;

    new-instance v3, Ls22;

    invoke-direct {v3, p0, v5}, Ls22;-><init>(Lv22;B)V

    new-instance p0, Lq3;

    invoke-direct {p0, v0, v3, v1}, Lq3;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v2, p0}, Lf12;->e(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_46d
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lv22;

    iget-object v0, p0, Lv22;->g:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lm02;

    new-instance v3, Ls22;

    invoke-direct {v3, p0, v5}, Ls22;-><init>(Lv22;B)V

    new-instance p0, Lq3;

    invoke-direct {p0, v0, v3, v1}, Lq3;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v2, p0}, Lf12;->e(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_489
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lc12;

    invoke-virtual {p0}, Lc12;->a()Lela;

    move-result-object p0

    return-object p0

    :pswitch_492
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Landroid/view/View;

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    if-lt v0, v1, :cond_49f

    invoke-static {p0}, Lr9n;->Q(Landroid/view/View;)V

    :cond_49f
    invoke-virtual {p0}, Landroid/view/View;->getContentCaptureSession()Landroid/view/contentcapture/ContentCaptureSession;

    move-result-object v0

    if-eqz v0, :cond_4ac

    new-instance v6, Lesg;

    const/16 v1, 0xa

    invoke-direct {v6, v1, v0, p0, v5}, Lesg;-><init>(BLjava/lang/Object;Ljava/lang/Object;Z)V

    :cond_4ac
    return-object v6

    :pswitch_4ad
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Ld3;

    iget-object p0, p0, Ld3;->g:Lnak;

    invoke-virtual {p0}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lb3;

    iget-object p0, p0, Lb3;->d:Ljava/lang/String;

    if-eqz p0, :cond_4ce

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_4ce

    sget-object v0, Llqm;->u:Llqm;

    invoke-static {p0, v0, v5}, Lay3;->a(Ljava/lang/String;Llqm;Z)Lvx3;

    move-result-object p0

    iput v3, p0, Lvx3;->b:I

    invoke-static {p0, v4, p0}, Lo18;->t(Lvx3;ZLvx3;)V

    :cond_4ce
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_4d1
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Ld3;

    iget-object p0, p0, Ld3;->f:Ld8j;

    check-cast p0, Lg8j;

    invoke-virtual {p0}, Lg8j;->h()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_4df
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lu2;

    invoke-virtual {p0}, Lryl;->g0()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_4ea
    .packed-switch 0x0
        :pswitch_4df
        :pswitch_4d1
        :pswitch_4ad
        :pswitch_492
        :pswitch_489
        :pswitch_46d
        :pswitch_451
        :pswitch_436
        :pswitch_42c
        :pswitch_422
        :pswitch_405
        :pswitch_3e8
        :pswitch_3dd
        :pswitch_3d2
        :pswitch_3c7
        :pswitch_3bc
        :pswitch_34e
        :pswitch_163
        :pswitch_fa
        :pswitch_dd
        :pswitch_c3
        :pswitch_ba
        :pswitch_aa
        :pswitch_90
        :pswitch_87
        :pswitch_7d
        :pswitch_35
        :pswitch_2b
        :pswitch_1c
    .end packed-switch
.end method
