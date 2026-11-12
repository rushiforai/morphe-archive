.class public final Lcom/opera/android/premium/ui/view/SubscriptionPlanList;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0007\u0018\u00002\u00020\u0001:\u0002\u0002\u0003\u00a8\u0006\u0004"
    }
    d2 = {
        "Lcom/opera/android/premium/ui/view/SubscriptionPlanList;",
        "Landroid/widget/LinearLayout;",
        "f8d",
        "vlk",
        "app"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final synthetic c:I


# instance fields
.field public final a:Lor2;

.field public b:Lvlk;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 11
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    const p2, 0x7f0d03d8

    invoke-virtual {p1, p2, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    const p1, 0x7f0a050f

    invoke-static {p1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p2

    if-eqz p2, :cond_76

    new-instance v3, Lqvg;

    check-cast p2, Lcom/opera/android/premium/ui/view/PremiumPricingCard;

    invoke-direct {v3, p2}, Lqvg;-><init>(Lcom/opera/android/premium/ui/view/PremiumPricingCard;)V

    const p1, 0x7f0a06da

    invoke-static {p1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p2

    if-eqz p2, :cond_76

    new-instance v4, Lqvg;

    check-cast p2, Lcom/opera/android/premium/ui/view/PremiumPricingCard;

    invoke-direct {v4, p2}, Lqvg;-><init>(Lcom/opera/android/premium/ui/view/PremiumPricingCard;)V

    const p1, 0x7f0a088c

    invoke-static {p1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p2

    if-eqz p2, :cond_76

    new-instance v5, Lqvg;

    check-cast p2, Lcom/opera/android/premium/ui/view/PremiumPricingCard;

    invoke-direct {v5, p2}, Lqvg;-><init>(Lcom/opera/android/premium/ui/view/PremiumPricingCard;)V

    const p1, 0x7f0a0cf9

    invoke-static {p1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p2

    if-eqz p2, :cond_76

    new-instance v6, Lqvg;

    check-cast p2, Lcom/opera/android/premium/ui/view/PremiumPricingCard;

    invoke-direct {v6, p2}, Lqvg;-><init>(Lcom/opera/android/premium/ui/view/PremiumPricingCard;)V

    new-instance v1, Lor2;

    const/16 v7, 0x1c

    move-object v2, p0

    invoke-direct/range {v1 .. v7}, Lor2;-><init>(Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v1, v2, Lcom/opera/android/premium/ui/view/SubscriptionPlanList;->a:Lor2;

    invoke-virtual {v2}, Lcom/opera/android/premium/ui/view/SubscriptionPlanList;->c()Ljava/util/ArrayList;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p1

    :goto_60
    if-ge v0, p1, :cond_75

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    add-int/lit8 v0, v0, 0x1

    check-cast p2, Lcom/opera/android/premium/ui/view/PremiumPricingCard;

    new-instance v1, Lh4i;

    const/16 v3, 0x10

    invoke-direct {v1, v2, v3}, Lh4i;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p2, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_60

    :cond_75
    return-void

    :cond_76
    move-object v2, p0

    invoke-virtual {v2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    throw p0
.end method


# virtual methods
.method public final a()Lamk;
    .registers 6

    invoke-virtual {p0}, Lcom/opera/android/premium/ui/view/SubscriptionPlanList;->c()Ljava/util/ArrayList;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :cond_9
    const/4 v2, 0x0

    if-ge v1, v0, :cond_1a

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v1, v1, 0x1

    move-object v4, v3

    check-cast v4, Lcom/opera/android/premium/ui/view/PremiumPricingCard;

    iget-boolean v4, v4, Lcom/opera/android/premium/ui/view/PremiumPricingCard;->p:Z

    if-eqz v4, :cond_9

    goto :goto_1b

    :cond_1a
    move-object v3, v2

    :goto_1b
    check-cast v3, Lcom/opera/android/premium/ui/view/PremiumPricingCard;

    if-eqz v3, :cond_27

    const p0, 0x7f0a0af1

    invoke-virtual {v3, p0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object p0

    goto :goto_28

    :cond_27
    move-object p0, v2

    :goto_28
    instance-of v0, p0, Lamk;

    if-eqz v0, :cond_2f

    check-cast p0, Lamk;

    return-object p0

    :cond_2f
    return-object v2
.end method

.method public final b(Ljava/lang/String;)Lcom/opera/android/premium/ui/view/PremiumPricingCard;
    .registers 3

    sget-object v0, Lzsk;->f:Ljava/util/Map;

    const-string v0, ""

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    iget-object p0, p0, Lcom/opera/android/premium/ui/view/SubscriptionPlanList;->a:Lor2;

    if-eqz v0, :cond_13

    iget-object p0, p0, Lor2;->b:Ljava/lang/Object;

    check-cast p0, Lqvg;

    iget-object p0, p0, Lqvg;->a:Lcom/opera/android/premium/ui/view/PremiumPricingCard;

    return-object p0

    :cond_13
    const-string v0, "premium_6month"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_22

    iget-object p0, p0, Lor2;->d:Ljava/lang/Object;

    check-cast p0, Lqvg;

    iget-object p0, p0, Lqvg;->a:Lcom/opera/android/premium/ui/view/PremiumPricingCard;

    return-object p0

    :cond_22
    const-string v0, "premium_3month"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_31

    iget-object p0, p0, Lor2;->f:Ljava/lang/Object;

    check-cast p0, Lqvg;

    iget-object p0, p0, Lqvg;->a:Lcom/opera/android/premium/ui/view/PremiumPricingCard;

    return-object p0

    :cond_31
    const-string v0, "premium_monthly"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_40

    iget-object p0, p0, Lor2;->e:Ljava/lang/Object;

    check-cast p0, Lqvg;

    iget-object p0, p0, Lqvg;->a:Lcom/opera/android/premium/ui/view/PremiumPricingCard;

    return-object p0

    :cond_40
    const/4 p0, 0x0

    return-object p0
.end method

.method public final c()Ljava/util/ArrayList;
    .registers 4

    iget-object p0, p0, Lcom/opera/android/premium/ui/view/SubscriptionPlanList;->a:Lor2;

    iget-object v0, p0, Lor2;->b:Ljava/lang/Object;

    check-cast v0, Lqvg;

    iget-object v1, p0, Lor2;->d:Ljava/lang/Object;

    check-cast v1, Lqvg;

    iget-object v2, p0, Lor2;->f:Ljava/lang/Object;

    check-cast v2, Lqvg;

    iget-object p0, p0, Lor2;->e:Ljava/lang/Object;

    check-cast p0, Lqvg;

    filled-new-array {v0, v1, v2, p0}, [Lqvg;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    check-cast p0, Ljava/lang/Iterable;

    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0xa

    invoke-static {p0, v1}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_2b
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3d

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lqvg;

    iget-object v1, v1, Lqvg;->a:Lcom/opera/android/premium/ui/view/PremiumPricingCard;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2b

    :cond_3d
    return-object v0
.end method

.method public final d(Ljava/util/List;Lf8d;)V
    .registers 22

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0}, Lcom/opera/android/premium/ui/view/SubscriptionPlanList;->c()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v4, 0x0

    move v5, v4

    :goto_e
    const/16 v6, 0x8

    if-ge v5, v3, :cond_1e

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    add-int/lit8 v5, v5, 0x1

    check-cast v7, Lcom/opera/android/premium/ui/view/PremiumPricingCard;

    invoke-virtual {v7, v6}, Landroid/view/View;->setVisibility(I)V

    goto :goto_e

    :cond_1e
    move-object/from16 v2, p1

    check-cast v2, Ljava/lang/Iterable;

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_26
    :goto_26
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_40

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lamk;

    iget-object v5, v5, Lamk;->a:Lzsk;

    iget-object v5, v5, Lzsk;->a:Ljava/lang/String;

    invoke-virtual {v0, v5}, Lcom/opera/android/premium/ui/view/SubscriptionPlanList;->b(Ljava/lang/String;)Lcom/opera/android/premium/ui/view/PremiumPricingCard;

    move-result-object v5

    if-eqz v5, :cond_26

    invoke-virtual {v5, v4}, Landroid/view/View;->setVisibility(I)V

    goto :goto_26

    :cond_40
    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_44
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_288

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lamk;

    iget-object v5, v3, Lamk;->a:Lzsk;

    iget-object v7, v3, Lamk;->c:Lxlk;

    iget-object v5, v5, Lzsk;->a:Ljava/lang/String;

    invoke-virtual {v0, v5}, Lcom/opera/android/premium/ui/view/SubscriptionPlanList;->b(Ljava/lang/String;)Lcom/opera/android/premium/ui/view/PremiumPricingCard;

    move-result-object v5

    if-eqz v5, :cond_284

    const v8, 0x7f0a0af1

    invoke-virtual {v5, v8, v3}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    invoke-virtual {v0}, Lcom/opera/android/premium/ui/view/SubscriptionPlanList;->c()Ljava/util/ArrayList;

    move-result-object v8

    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v10

    move v11, v4

    :cond_70
    :goto_70
    if-ge v11, v10, :cond_85

    invoke-virtual {v8, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    add-int/lit8 v11, v11, 0x1

    move-object v13, v12

    check-cast v13, Lcom/opera/android/premium/ui/view/PremiumPricingCard;

    invoke-virtual {v13}, Landroid/view/View;->getVisibility()I

    move-result v13

    if-nez v13, :cond_70

    invoke-virtual {v9, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_70

    :cond_85
    invoke-virtual {v9, v5}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v8

    invoke-virtual {v5}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    iget-object v5, v5, Lcom/opera/android/premium/ui/view/PremiumPricingCard;->q:Lrvg;

    iget-object v10, v3, Lamk;->a:Lzsk;

    iget-byte v11, v10, Lzsk;->c:B

    const/4 v12, 0x1

    const/16 v13, 0xc

    if-ne v11, v13, :cond_a0

    const v11, 0x7f140199

    invoke-virtual {v9, v11}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v11

    goto :goto_cd

    :cond_a0
    if-ne v11, v12, :cond_aa

    const v11, 0x7f140a5c

    invoke-virtual {v9, v11}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v11

    goto :goto_cd

    :cond_aa
    if-lt v11, v13, :cond_be

    div-int/lit8 v11, v11, 0xc

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    filled-new-array {v13}, [Ljava/lang/Object;

    move-result-object v13

    const v14, 0x7f120071

    invoke-virtual {v9, v14, v11, v13}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    goto :goto_cd

    :cond_be
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    filled-new-array {v13}, [Ljava/lang/Object;

    move-result-object v13

    const v14, 0x7f12003f

    invoke-virtual {v9, v14, v11, v13}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    :goto_cd
    iget-object v13, v5, Lrvg;->h:Landroid/view/View;

    check-cast v13, Landroid/widget/TextView;

    iget-object v14, v5, Lrvg;->k:Landroid/view/View;

    check-cast v14, Landroid/widget/TextView;

    invoke-static {v13, v11}, Lna2;->S(Landroid/widget/TextView;Ljava/lang/CharSequence;)V

    iget-object v11, v7, Lxlk;->a:Lwlk;

    iget-object v13, v7, Lxlk;->c:Lwlk;

    iget-object v15, v7, Lxlk;->b:Lwlk;

    const/16 v16, 0x0

    move/from16 p1, v12

    if-eqz v11, :cond_11c

    iget-boolean v12, v1, Lf8d;->a:Z

    if-eqz v12, :cond_11c

    iget-object v11, v11, Lwlk;->c:Lo9g;

    iget v12, v11, Lo9g;->b:I

    iget v4, v11, Lo9g;->a:I

    if-gtz v12, :cond_109

    if-gtz v4, :cond_109

    iget v4, v11, Lo9g;->c:I

    mul-int/lit8 v4, v4, 0x7

    iget v11, v11, Lo9g;->d:I

    add-int/2addr v4, v11

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    filled-new-array {v11}, [Ljava/lang/Object;

    move-result-object v11

    const v12, 0x7f120063

    invoke-virtual {v9, v12, v4, v11}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    goto :goto_11e

    :cond_109
    mul-int/lit8 v4, v4, 0xc

    add-int/2addr v4, v12

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    filled-new-array {v11}, [Ljava/lang/Object;

    move-result-object v11

    const v12, 0x7f120064

    invoke-virtual {v9, v12, v4, v11}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    goto :goto_11e

    :cond_11c
    move-object/from16 v4, v16

    :goto_11e
    iget-object v11, v5, Lrvg;->n:Landroid/view/View;

    check-cast v11, Landroid/widget/TextView;

    invoke-static {v11, v4}, Lna2;->S(Landroid/widget/TextView;Ljava/lang/CharSequence;)V

    if-eqz v15, :cond_133

    iget-object v4, v15, Lwlk;->b:Ljava/lang/String;

    iget v11, v15, Lwlk;->d:F

    float-to-double v11, v11

    invoke-static {v4, v11, v12}, Lz7h;->k(Ljava/lang/String;D)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v18, v7

    goto :goto_140

    :cond_133
    iget-object v4, v7, Lxlk;->c:Lwlk;

    iget-object v11, v4, Lwlk;->b:Ljava/lang/String;

    iget v4, v4, Lwlk;->d:F

    move-object/from16 v18, v7

    float-to-double v6, v4

    invoke-static {v11, v6, v7}, Lz7h;->k(Ljava/lang/String;D)Ljava/lang/String;

    move-result-object v4

    :goto_140
    iget-object v6, v5, Lrvg;->f:Landroid/view/View;

    check-cast v6, Landroid/widget/TextView;

    invoke-static {v6, v4}, Lna2;->S(Landroid/widget/TextView;Ljava/lang/CharSequence;)V

    if-eqz v15, :cond_158

    move-object/from16 v4, v18

    iget-object v6, v4, Lxlk;->c:Lwlk;

    iget-object v7, v6, Lwlk;->b:Ljava/lang/String;

    iget v6, v6, Lwlk;->d:F

    move-object v11, v13

    float-to-double v12, v6

    invoke-static {v7, v12, v13}, Lz7h;->k(Ljava/lang/String;D)Ljava/lang/String;

    move-result-object v6

    goto :goto_15d

    :cond_158
    move-object v11, v13

    move-object/from16 v4, v18

    move-object/from16 v6, v16

    :goto_15d
    if-nez v6, :cond_16a

    iget-object v6, v5, Lrvg;->o:Landroid/view/View;

    check-cast v6, Landroidx/constraintlayout/helper/widget/Flow;

    const/16 v12, 0x8

    invoke-virtual {v6, v12}, Landroidx/constraintlayout/helper/widget/Flow;->setVisibility(I)V

    const/4 v7, 0x0

    goto :goto_171

    :cond_16a
    const/4 v7, 0x0

    invoke-virtual {v14, v7}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v14, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_171
    iget-byte v6, v1, Lf8d;->c:B

    const v13, 0x3c23d70a    # 0.01f

    const/high16 v14, 0x3f800000    # 1.0f

    packed-switch v6, :pswitch_data_28a

    if-nez v8, :cond_188

    iget v6, v3, Lamk;->e:F

    iget v8, v1, Lf8d;->d:F

    div-float/2addr v6, v8

    sub-float v6, v14, v6

    cmpg-float v8, v6, v13

    if-gez v8, :cond_18d

    :cond_188
    move/from16 v17, v13

    :cond_18a
    move-object/from16 v6, v16

    goto :goto_1bb

    :cond_18d
    invoke-static {}, Ljava/text/NumberFormat;->getIntegerInstance()Ljava/text/NumberFormat;

    move-result-object v8

    const/high16 v17, 0x42c80000    # 100.0f

    mul-float v6, v6, v17

    move/from16 v17, v13

    float-to-double v12, v6

    invoke-virtual {v8, v12, v13}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    move-result-object v6

    filled-new-array {v6}, [Ljava/lang/Object;

    move-result-object v6

    const v8, 0x7f140ef8

    invoke-virtual {v9, v8, v6}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    goto :goto_1bb

    :pswitch_1a8
    move/from16 v17, v13

    if-nez v8, :cond_18a

    iget v6, v3, Lamk;->e:F

    iget v8, v1, Lf8d;->d:F

    cmpg-float v6, v6, v8

    if-gez v6, :cond_18a

    const v6, 0x7f141197

    invoke-virtual {v9, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    :goto_1bb
    iget-object v8, v5, Lrvg;->m:Landroid/view/View;

    check-cast v8, Landroid/widget/TextView;

    invoke-static {v8, v6}, Lna2;->S(Landroid/widget/TextView;Ljava/lang/CharSequence;)V

    if-nez v15, :cond_1c9

    invoke-static {v11, v9}, Lf8d;->a(Lwlk;Landroid/content/res/Resources;)Ljava/lang/String;

    move-result-object v6

    goto :goto_1cd

    :cond_1c9
    invoke-static {v15, v9}, Lf8d;->a(Lwlk;Landroid/content/res/Resources;)Ljava/lang/String;

    move-result-object v6

    :goto_1cd
    iget-object v8, v5, Lrvg;->g:Ljava/lang/Object;

    check-cast v8, Landroid/widget/TextView;

    invoke-static {v8, v6}, Lna2;->S(Landroid/widget/TextView;Ljava/lang/CharSequence;)V

    if-nez v15, :cond_1d9

    move-object/from16 v6, v16

    goto :goto_1dd

    :cond_1d9
    invoke-static {v11, v9}, Lf8d;->a(Lwlk;Landroid/content/res/Resources;)Ljava/lang/String;

    move-result-object v6

    :goto_1dd
    iget-object v8, v5, Lrvg;->l:Landroid/view/View;

    check-cast v8, Landroid/widget/TextView;

    invoke-static {v8, v6}, Lna2;->S(Landroid/widget/TextView;Ljava/lang/CharSequence;)V

    if-eqz v15, :cond_210

    iget-object v6, v15, Lwlk;->c:Lo9g;

    iget v8, v6, Lo9g;->a:I

    if-lez v8, :cond_1fc

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    filled-new-array {v6}, [Ljava/lang/Object;

    move-result-object v6

    const v11, 0x7f120007

    invoke-virtual {v9, v11, v8, v6}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    goto :goto_212

    :cond_1fc
    iget v6, v6, Lo9g;->b:I

    if-lez v6, :cond_210

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    filled-new-array {v8}, [Ljava/lang/Object;

    move-result-object v8

    const v11, 0x7f12003e

    invoke-virtual {v9, v11, v6, v8}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    goto :goto_212

    :cond_210
    move-object/from16 v6, v16

    :goto_212
    iget-object v8, v5, Lrvg;->e:Ljava/lang/Object;

    check-cast v8, Landroid/widget/TextView;

    invoke-static {v8, v6}, Lna2;->S(Landroid/widget/TextView;Ljava/lang/CharSequence;)V

    if-eqz v15, :cond_22a

    iget v6, v10, Lzsk;->e:I

    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    filled-new-array {v8}, [Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v9, v6, v8}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    goto :goto_22c

    :cond_22a
    move-object/from16 v6, v16

    :goto_22c
    iget-object v8, v5, Lrvg;->j:Landroid/view/View;

    check-cast v8, Landroid/widget/TextView;

    invoke-static {v8, v6}, Lna2;->S(Landroid/widget/TextView;Ljava/lang/CharSequence;)V

    iget-byte v6, v1, Lf8d;->c:B

    packed-switch v6, :pswitch_data_290

    goto :goto_24f

    :pswitch_239
    iget v3, v3, Lamk;->e:F

    iget v6, v1, Lf8d;->d:F

    div-float/2addr v3, v6

    sub-float/2addr v14, v3

    cmpg-float v3, v14, v17

    if-ltz v3, :cond_24f

    invoke-static {}, Ljava/text/NumberFormat;->getPercentInstance()Ljava/text/NumberFormat;

    move-result-object v3

    neg-float v6, v14

    float-to-double v11, v6

    invoke-virtual {v3, v11, v12}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v16, v3

    :cond_24f
    :goto_24f
    move-object/from16 v3, v16

    iget-object v6, v5, Lrvg;->d:Ljava/lang/Object;

    check-cast v6, Landroid/widget/TextView;

    invoke-static {v6, v3}, Lna2;->S(Landroid/widget/TextView;Ljava/lang/CharSequence;)V

    iget v3, v10, Lzsk;->d:I

    iget-object v4, v4, Lxlk;->c:Lwlk;

    iget-object v6, v4, Lwlk;->b:Ljava/lang/String;

    iget v4, v4, Lwlk;->d:F

    float-to-double v10, v4

    invoke-static {v6, v10, v11}, Lz7h;->k(Ljava/lang/String;D)Ljava/lang/String;

    move-result-object v4

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v9, v3, v4}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    iget-object v4, v5, Lrvg;->i:Ljava/lang/Object;

    check-cast v4, Landroid/widget/TextView;

    invoke-static {v4, v3}, Lna2;->S(Landroid/widget/TextView;Ljava/lang/CharSequence;)V

    iget-boolean v3, v1, Lf8d;->b:Z

    iget-object v4, v5, Lrvg;->p:Landroid/view/View;

    check-cast v4, Landroid/widget/ImageView;

    if-eqz v3, :cond_27e

    move v3, v7

    goto :goto_280

    :cond_27e
    const/16 v3, 0x8

    :goto_280
    invoke-virtual {v4, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_285

    :cond_284
    move v7, v4

    :goto_285
    move v4, v7

    goto/16 :goto_44

    :cond_288
    return-void

    nop

    :pswitch_data_28a
    .packed-switch 0x0
        :pswitch_1a8
    .end packed-switch

    :pswitch_data_290
    .packed-switch 0x0
        :pswitch_239
    .end packed-switch
.end method

.method public final e(Lcom/opera/android/premium/ui/view/PremiumPricingCard;)V
    .registers 7

    iget-boolean v0, p1, Lcom/opera/android/premium/ui/view/PremiumPricingCard;->p:Z

    if-nez v0, :cond_30

    invoke-virtual {p0}, Lcom/opera/android/premium/ui/view/SubscriptionPlanList;->c()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    move v3, v2

    :goto_e
    if-ge v3, v1, :cond_1c

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v3, v3, 0x1

    check-cast v4, Lcom/opera/android/premium/ui/view/PremiumPricingCard;

    invoke-virtual {v4, v2}, Lcom/opera/android/premium/ui/view/PremiumPricingCard;->setChecked(Z)V

    goto :goto_e

    :cond_1c
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/opera/android/premium/ui/view/PremiumPricingCard;->setChecked(Z)V

    iget-object p0, p0, Lcom/opera/android/premium/ui/view/SubscriptionPlanList;->b:Lvlk;

    if-eqz p0, :cond_30

    const v0, 0x7f0a0af1

    invoke-virtual {p1, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lamk;

    invoke-interface {p0, p1}, Lvlk;->i(Lamk;)V

    :cond_30
    return-void
.end method

.method public final f(Ljava/lang/String;Z)Z
    .registers 8

    const/4 v0, 0x0

    if-eqz p1, :cond_8

    invoke-virtual {p0, p1}, Lcom/opera/android/premium/ui/view/SubscriptionPlanList;->b(Ljava/lang/String;)Lcom/opera/android/premium/ui/view/PremiumPricingCard;

    move-result-object p1

    goto :goto_9

    :cond_8
    move-object p1, v0

    :goto_9
    if-eqz p1, :cond_16

    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result v1

    if-nez v1, :cond_16

    invoke-virtual {p0, p1}, Lcom/opera/android/premium/ui/view/SubscriptionPlanList;->e(Lcom/opera/android/premium/ui/view/PremiumPricingCard;)V

    const/4 p0, 0x1

    return p0

    :cond_16
    const/4 p1, 0x0

    if-eqz p2, :cond_3b

    invoke-virtual {p0}, Lcom/opera/android/premium/ui/view/SubscriptionPlanList;->c()Ljava/util/ArrayList;

    move-result-object p2

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v1

    move v2, p1

    :cond_22
    if-ge v2, v1, :cond_34

    invoke-virtual {p2, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    move-object v4, v3

    check-cast v4, Lcom/opera/android/premium/ui/view/PremiumPricingCard;

    invoke-virtual {v4}, Landroid/view/View;->getVisibility()I

    move-result v4

    if-nez v4, :cond_22

    move-object v0, v3

    :cond_34
    check-cast v0, Lcom/opera/android/premium/ui/view/PremiumPricingCard;

    if-eqz v0, :cond_3b

    invoke-virtual {p0, v0}, Lcom/opera/android/premium/ui/view/SubscriptionPlanList;->e(Lcom/opera/android/premium/ui/view/PremiumPricingCard;)V

    :cond_3b
    return p1
.end method
