.class public Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVerificationGuideCardView;
.super Landroidx/cardview/widget/CardView;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVerificationGuideCardView;

.field public b:Lv/VImage;

.field public c:Lv/VText;

.field public d:Lv/VText;

.field public e:Landroid/widget/FrameLayout;

.field public f:Landroidx/appcompat/widget/AppCompatTextView;

.field public g:Lv/VText;

.field public h:Lv/VText;

.field public i:I
    .annotation build Landroidx/annotation/DrawableRes;
    .end annotation
.end field

.field public j:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroidx/cardview/widget/CardView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    sget p1, Ll/dbc0;->d2:I

    .line 5
    .line 6
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVerificationGuideCardView;->i:I

    .line 7
    .line 8
    const/4 p1, 0x1

    .line 9
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVerificationGuideCardView;->j:Z

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 12
    invoke-direct {p0, p1, p2}, Landroidx/cardview/widget/CardView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 13
    sget p1, Ll/dbc0;->d2:I

    iput p1, p0, Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVerificationGuideCardView;->i:I

    const/4 p1, 0x1

    .line 14
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVerificationGuideCardView;->j:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 15
    invoke-direct {p0, p1, p2, p3}, Landroidx/cardview/widget/CardView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 16
    sget p1, Ll/dbc0;->d2:I

    iput p1, p0, Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVerificationGuideCardView;->i:I

    const/4 p1, 0x1

    .line 17
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVerificationGuideCardView;->j:Z

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, "e_trial_end_buy_svip"

    .line 2
    .line 3
    const-string v0, "p_suggest_users_home_view"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->Y4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    const-string p1, "p_home,verification_card"

    .line 13
    .line 14
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->advanced_filter:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 15
    .line 16
    invoke-static {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/purchase/c;->x0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;Landroid/view/View;)V
    .locals 2

    .line 1
    const-string p1, "e_trial_end_go_verify"

    .line 2
    .line 3
    const-string v0, "p_suggest_users_home_view"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->Y4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->Y4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const/4 v0, 0x0

    .line 17
    const-string v1, "button"

    .line 18
    .line 19
    invoke-static {p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterAct;->Z1(Landroid/content/Context;ZLjava/lang/String;)Landroid/content/Intent;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method


# virtual methods
.method public final f(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/sei;->a(Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVerificationGuideCardView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public h(Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;Ll/pei;Ljava/util/List;)V
    .locals 32
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;",
            "Ll/pei;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$a;",
            ">;)V"
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p3

    if-eqz v1, :cond_35

    if-eqz p2, :cond_35

    .line 1
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    move-result v3

    if-eqz v3, :cond_0

    goto/16 :goto_1d

    .line 2
    :cond_0
    iget-boolean v3, v0, Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVerificationGuideCardView;->j:Z

    if-eqz v3, :cond_35

    const/4 v3, 0x0

    .line 3
    iput-boolean v3, v0, Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVerificationGuideCardView;->j:Z

    .line 4
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v4

    .line 5
    iget-object v5, v0, Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVerificationGuideCardView;->c:Lv/VText;

    const/4 v6, 0x1

    invoke-static {v6}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    move-result-object v7

    invoke-virtual {v5, v7}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 6
    iget-object v5, v0, Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVerificationGuideCardView;->g:Lv/VText;

    invoke-static {v6}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    move-result-object v7

    invoke-virtual {v5, v7}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 7
    iget-object v5, v0, Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVerificationGuideCardView;->g:Lv/VText;

    invoke-static {}, Ll/of7;->s()Z

    move-result v7

    if-eqz v7, :cond_1

    const-string v7, "\u8ba4\u8bc1\u5ba1\u6838\u4e2d"

    goto :goto_0

    :cond_1
    const-string v7, "\u53bb\u8ba4\u8bc1"

    :goto_0
    invoke-virtual {v5, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 8
    iget-object v5, v0, Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVerificationGuideCardView;->f:Landroidx/appcompat/widget/AppCompatTextView;

    invoke-static {v6}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    move-result-object v7

    invoke-virtual {v5, v7}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 9
    iget-object v5, v0, Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVerificationGuideCardView;->e:Landroid/widget/FrameLayout;

    invoke-virtual {v5, v3}, Landroid/view/View;->setVisibility(I)V

    .line 10
    iget-object v5, v0, Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVerificationGuideCardView;->d:Lv/VText;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    filled-new-array {v7}, [Ljava/lang/Object;

    move-result-object v7

    const-string v8, "\u4f60\u559c\u6b22\u4e86%d\u4f4d\u5934\u50cf\u5df2\u8ba4\u8bc1\u7684\u7528\u6237"

    invoke-static {v8, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    if-ne v4, v6, :cond_3

    .line 11
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$a;

    iget-object v5, v5, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$a;->a:Lcom/p1/mobile/putong/data/User;

    invoke-virtual {v5}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    move-result v5

    if-eqz v5, :cond_2

    const-string v5, "\u5979"

    goto :goto_3

    :cond_2
    const-string v5, "\u4ed6"

    goto :goto_3

    :cond_3
    move v5, v3

    move v7, v5

    move v8, v7

    .line 12
    :goto_1
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v9

    if-ge v5, v9, :cond_5

    .line 13
    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$a;

    iget-object v9, v9, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$a;->a:Lcom/p1/mobile/putong/data/User;

    invoke-virtual {v9}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    move-result v9

    if-eqz v9, :cond_4

    move v8, v6

    goto :goto_2

    :cond_4
    move v7, v6

    :goto_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 14
    :cond_5
    const-string v5, "\u4ed6\u4eec"

    if-eqz v7, :cond_6

    if-eqz v8, :cond_6

    goto :goto_3

    :cond_6
    if-eqz v7, :cond_7

    goto :goto_3

    :cond_7
    if-eqz v8, :cond_8

    .line 15
    const-string v5, "\u5979\u4eec"

    goto :goto_3

    .line 16
    :cond_8
    const-string v5, ""

    .line 17
    :goto_3
    iget-object v7, v0, Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVerificationGuideCardView;->f:Landroidx/appcompat/widget/AppCompatTextView;

    const-string v8, "\u5b8c\u6210\u8ba4\u8bc1\u6216\u5f00\u901aSVIP\n\u5411%s\u53d1\u51fa\u559c\u6b22\n\u5e76\u53ef\u7ee7\u7eed\u4f7f\u7528\u201c\u53ea\u770b\u8ba4\u8bc1\u7528\u6237\u201d\u529f\u80fd"

    filled-new-array {v5}, [Ljava/lang/Object;

    move-result-object v5

    invoke-static {v8, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v7, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 18
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v5

    iget v5, v5, Landroid/util/DisplayMetrics;->density:F

    const/high16 v7, 0x42040000    # 33.0f

    const/16 v8, 0x51

    const/high16 v9, 0x43200000    # 160.0f

    const/high16 v10, 0x42f00000    # 120.0f

    const/high16 v11, 0x40a00000    # 5.0f

    const/high16 v12, 0x41200000    # 10.0f

    const/high16 v13, 0x42080000    # 34.0f

    const/16 v14, 0x11

    const/high16 v15, 0x41500000    # 13.0f

    const/high16 v16, 0x40400000    # 3.0f

    if-ne v4, v6, :cond_9

    .line 19
    new-instance v4, Lcom/facebook/drawee/generic/RoundingParams;

    invoke-direct {v4}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 20
    invoke-static {v15}, Ll/qa00;->d(F)I

    move-result v6

    int-to-float v6, v6

    invoke-virtual {v4, v6}, Lcom/facebook/drawee/generic/RoundingParams;->s(F)Lcom/facebook/drawee/generic/RoundingParams;

    .line 21
    new-instance v6, Ll/xlj;

    .line 22
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v15

    invoke-virtual {v15}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v15

    invoke-direct {v6, v15}, Ll/xlj;-><init>(Landroid/content/res/Resources;)V

    .line 23
    invoke-virtual {v6}, Ll/xlj;->a()Ll/wlj;

    move-result-object v6

    .line 24
    invoke-virtual {v6, v4}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 25
    new-instance v4, Landroid/widget/FrameLayout$LayoutParams;

    invoke-static {v10}, Ll/qa00;->d(F)I

    move-result v10

    invoke-static {v9}, Ll/qa00;->d(F)I

    move-result v9

    invoke-direct {v4, v10, v9}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 26
    iput v14, v4, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 27
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$a;

    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$a;->a:Lcom/p1/mobile/putong/data/User;

    if-eqz v2, :cond_34

    .line 28
    new-instance v3, Lv/VDraweeView;

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->Y4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    move-result-object v9

    invoke-direct {v3, v9}, Lv/VDraweeView;-><init>(Landroid/content/Context;)V

    .line 29
    invoke-static/range {v16 .. v16}, Ll/qa00;->d(F)I

    move-result v9

    invoke-static/range {v16 .. v16}, Ll/qa00;->d(F)I

    move-result v10

    invoke-static/range {v16 .. v16}, Ll/qa00;->d(F)I

    move-result v14

    invoke-static/range {v16 .. v16}, Ll/qa00;->d(F)I

    move-result v15

    invoke-virtual {v3, v9, v10, v14, v15}, Landroid/view/View;->setPadding(IIII)V

    .line 30
    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v9

    sget v10, Ll/dbc0;->rr:I

    invoke-virtual {v9, v10}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v9

    .line 31
    invoke-virtual {v3, v9}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 32
    invoke-virtual {v3, v6}, Lcom/facebook/drawee/view/DraweeView;->setHierarchy(Ll/mde;)V

    .line 33
    sget-object v6, Ll/uqb0;->G:Ll/fsb0;

    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    move-result-object v2

    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    move-result-object v2

    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    move-result-object v2

    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v6, v3, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 34
    iget-object v2, v0, Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVerificationGuideCardView;->e:Landroid/widget/FrameLayout;

    invoke-virtual {v2, v3, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 35
    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    invoke-static {v13}, Ll/qa00;->d(F)I

    move-result v3

    invoke-static {v13}, Ll/qa00;->d(F)I

    move-result v4

    invoke-direct {v2, v3, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 36
    iput v8, v2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 37
    invoke-static {v12}, Ll/qa00;->d(F)I

    move-result v3

    iput v3, v2, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 38
    new-instance v3, Landroid/widget/ImageView;

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->Y4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    move-result-object v4

    invoke-direct {v3, v4}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 39
    iget v4, v0, Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVerificationGuideCardView;->i:I

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setImageResource(I)V

    mul-float/2addr v5, v7

    .line 40
    invoke-virtual {v3, v5}, Landroid/view/View;->setTranslationX(F)V

    .line 41
    iget-object v4, v0, Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVerificationGuideCardView;->e:Landroid/widget/FrameLayout;

    invoke-virtual {v4, v3, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 42
    iget-object v2, v0, Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVerificationGuideCardView;->e:Landroid/widget/FrameLayout;

    invoke-virtual {v2, v11}, Landroid/view/View;->setRotation(F)V

    goto/16 :goto_1c

    :cond_9
    const v3, 0x800055

    move/from16 v17, v7

    const/high16 v7, -0x3f600000    # -5.0f

    move/from16 v18, v9

    const/4 v9, 0x2

    if-ne v4, v9, :cond_c

    const/4 v6, 0x0

    :goto_4
    if-ge v6, v4, :cond_34

    .line 43
    invoke-interface {v2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$a;

    iget-object v8, v8, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$a;->a:Lcom/p1/mobile/putong/data/User;

    if-eqz v8, :cond_b

    .line 44
    new-instance v9, Lv/VDraweeView;

    move/from16 v19, v10

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->Y4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    move-result-object v10

    invoke-direct {v9, v10}, Lv/VDraweeView;-><init>(Landroid/content/Context;)V

    .line 45
    new-instance v10, Lcom/facebook/drawee/generic/RoundingParams;

    invoke-direct {v10}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    move/from16 v20, v12

    .line 46
    invoke-static {v15}, Ll/qa00;->d(F)I

    move-result v12

    int-to-float v12, v12

    invoke-virtual {v10, v12}, Lcom/facebook/drawee/generic/RoundingParams;->s(F)Lcom/facebook/drawee/generic/RoundingParams;

    .line 47
    new-instance v12, Ll/xlj;

    .line 48
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v17

    move/from16 v21, v13

    invoke-virtual/range {v17 .. v17}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v13

    invoke-direct {v12, v13}, Ll/xlj;-><init>(Landroid/content/res/Resources;)V

    .line 49
    invoke-virtual {v12}, Ll/xlj;->a()Ll/wlj;

    move-result-object v12

    .line 50
    invoke-virtual {v12, v10}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 51
    new-instance v10, Landroid/widget/FrameLayout$LayoutParams;

    invoke-static/range {v19 .. v19}, Ll/qa00;->d(F)I

    move-result v13

    move/from16 v22, v15

    invoke-static/range {v18 .. v18}, Ll/qa00;->d(F)I

    move-result v15

    invoke-direct {v10, v13, v15}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 52
    iput v14, v10, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 53
    invoke-virtual {v9, v12}, Lcom/facebook/drawee/view/DraweeView;->setHierarchy(Ll/mde;)V

    .line 54
    invoke-static/range {v16 .. v16}, Ll/qa00;->d(F)I

    move-result v12

    invoke-static/range {v16 .. v16}, Ll/qa00;->d(F)I

    move-result v13

    invoke-static/range {v16 .. v16}, Ll/qa00;->d(F)I

    move-result v15

    invoke-static/range {v16 .. v16}, Ll/qa00;->d(F)I

    move-result v11

    invoke-virtual {v9, v12, v13, v15, v11}, Landroid/view/View;->setPadding(IIII)V

    .line 55
    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v11

    sget v12, Ll/dbc0;->rr:I

    invoke-virtual {v11, v12}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v11

    .line 56
    invoke-virtual {v9, v11}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    if-nez v6, :cond_a

    .line 57
    invoke-virtual {v9, v7}, Landroid/view/View;->setRotation(F)V

    const/high16 v11, -0x3dc00000    # -48.0f

    mul-float/2addr v11, v5

    .line 58
    invoke-virtual {v9, v11}, Landroid/view/View;->setTranslationX(F)V

    .line 59
    iget-object v11, v0, Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVerificationGuideCardView;->e:Landroid/widget/FrameLayout;

    invoke-virtual {v11, v9, v10}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_5

    .line 60
    :cond_a
    new-instance v11, Landroid/widget/FrameLayout;

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->Y4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    move-result-object v12

    invoke-direct {v11, v12}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 61
    new-instance v12, Landroid/widget/FrameLayout$LayoutParams;

    invoke-static/range {v19 .. v19}, Ll/qa00;->d(F)I

    move-result v13

    invoke-static/range {v18 .. v18}, Ll/qa00;->d(F)I

    move-result v15

    invoke-direct {v12, v13, v15}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 62
    iput v14, v12, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 63
    new-instance v13, Landroid/widget/ImageView;

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->Y4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    move-result-object v15

    invoke-direct {v13, v15}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 64
    iget v15, v0, Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVerificationGuideCardView;->i:I

    invoke-virtual {v13, v15}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 65
    new-instance v15, Landroid/widget/FrameLayout$LayoutParams;

    invoke-static/range {v21 .. v21}, Ll/qa00;->d(F)I

    move-result v7

    invoke-static/range {v21 .. v21}, Ll/qa00;->d(F)I

    move-result v14

    invoke-direct {v15, v7, v14}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 66
    invoke-static/range {v20 .. v20}, Ll/qa00;->d(F)I

    move-result v7

    iput v7, v15, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 67
    invoke-static/range {v20 .. v20}, Ll/qa00;->d(F)I

    move-result v7

    iput v7, v15, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 68
    iput v3, v15, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 69
    invoke-virtual {v11, v9, v10}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 70
    invoke-virtual {v11, v13, v15}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const/high16 v7, 0x40a00000    # 5.0f

    .line 71
    invoke-virtual {v11, v7}, Landroid/view/View;->setRotation(F)V

    const/high16 v7, 0x42400000    # 48.0f

    mul-float/2addr v7, v5

    .line 72
    invoke-virtual {v11, v7}, Landroid/view/View;->setTranslationX(F)V

    .line 73
    iget-object v7, v0, Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVerificationGuideCardView;->e:Landroid/widget/FrameLayout;

    invoke-virtual {v7, v11, v12}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 74
    :goto_5
    sget-object v7, Ll/uqb0;->G:Ll/fsb0;

    invoke-virtual {v8}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    move-result-object v8

    invoke-virtual {v8}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    move-result-object v8

    invoke-virtual {v8}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    move-result-object v8

    invoke-virtual {v8}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v9, v8}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    goto :goto_6

    :cond_b
    move/from16 v19, v10

    move/from16 v20, v12

    move/from16 v21, v13

    move/from16 v22, v15

    :goto_6
    add-int/lit8 v6, v6, 0x1

    move/from16 v10, v19

    move/from16 v12, v20

    move/from16 v13, v21

    move/from16 v15, v22

    const/high16 v7, -0x3f600000    # -5.0f

    const/high16 v11, 0x40a00000    # 5.0f

    const/16 v14, 0x11

    goto/16 :goto_4

    :cond_c
    move/from16 v19, v10

    move/from16 v20, v12

    move/from16 v21, v13

    move/from16 v22, v15

    const/high16 v7, 0x43120000    # 146.0f

    const/high16 v10, 0x42dc0000    # 110.0f

    const/4 v11, 0x3

    if-ne v4, v11, :cond_10

    const/4 v8, 0x0

    :goto_7
    if-ge v8, v4, :cond_34

    .line 75
    invoke-interface {v2, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$a;

    iget-object v9, v9, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$a;->a:Lcom/p1/mobile/putong/data/User;

    if-eqz v9, :cond_f

    .line 76
    new-instance v11, Lv/VDraweeView;

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->Y4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    move-result-object v12

    invoke-direct {v11, v12}, Lv/VDraweeView;-><init>(Landroid/content/Context;)V

    .line 77
    invoke-static/range {v16 .. v16}, Ll/qa00;->d(F)I

    move-result v12

    invoke-static/range {v16 .. v16}, Ll/qa00;->d(F)I

    move-result v13

    invoke-static/range {v16 .. v16}, Ll/qa00;->d(F)I

    move-result v14

    invoke-static/range {v16 .. v16}, Ll/qa00;->d(F)I

    move-result v15

    invoke-virtual {v11, v12, v13, v14, v15}, Landroid/view/View;->setPadding(IIII)V

    .line 78
    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v12

    sget v13, Ll/dbc0;->rr:I

    invoke-virtual {v12, v13}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v12

    .line 79
    invoke-virtual {v11, v12}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 80
    new-instance v12, Lcom/facebook/drawee/generic/RoundingParams;

    invoke-direct {v12}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 81
    invoke-static/range {v22 .. v22}, Ll/qa00;->d(F)I

    move-result v13

    int-to-float v13, v13

    invoke-virtual {v12, v13}, Lcom/facebook/drawee/generic/RoundingParams;->s(F)Lcom/facebook/drawee/generic/RoundingParams;

    .line 82
    new-instance v13, Ll/xlj;

    .line 83
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v14

    invoke-virtual {v14}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v14

    invoke-direct {v13, v14}, Ll/xlj;-><init>(Landroid/content/res/Resources;)V

    .line 84
    invoke-virtual {v13}, Ll/xlj;->a()Ll/wlj;

    move-result-object v13

    .line 85
    invoke-virtual {v13, v12}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 86
    new-instance v12, Landroid/widget/FrameLayout$LayoutParams;

    invoke-static {v10}, Ll/qa00;->d(F)I

    move-result v14

    invoke-static {v7}, Ll/qa00;->d(F)I

    move-result v15

    invoke-direct {v12, v14, v15}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    const/16 v14, 0x11

    .line 87
    iput v14, v12, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 88
    invoke-virtual {v11, v13}, Lcom/facebook/drawee/view/DraweeView;->setHierarchy(Ll/mde;)V

    if-nez v8, :cond_d

    const/high16 v13, -0x3f600000    # -5.0f

    .line 89
    invoke-virtual {v11, v13}, Landroid/view/View;->setRotation(F)V

    const/high16 v13, -0x3d680000    # -76.0f

    mul-float/2addr v13, v5

    .line 90
    invoke-virtual {v11, v13}, Landroid/view/View;->setTranslationX(F)V

    .line 91
    iget-object v13, v0, Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVerificationGuideCardView;->e:Landroid/widget/FrameLayout;

    invoke-virtual {v13, v11, v12}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :goto_8
    move/from16 v25, v7

    move/from16 v26, v10

    goto :goto_9

    :cond_d
    if-ne v8, v6, :cond_e

    const/high16 v13, -0x3f000000    # -8.0f

    mul-float/2addr v13, v5

    .line 92
    invoke-virtual {v11, v13}, Landroid/view/View;->setTranslationY(F)V

    .line 93
    iget-object v13, v0, Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVerificationGuideCardView;->e:Landroid/widget/FrameLayout;

    invoke-virtual {v13, v11, v12}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_8

    .line 94
    :cond_e
    new-instance v13, Landroid/widget/FrameLayout;

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->Y4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    move-result-object v14

    invoke-direct {v13, v14}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 95
    new-instance v14, Landroid/widget/FrameLayout$LayoutParams;

    invoke-static {v10}, Ll/qa00;->d(F)I

    move-result v15

    move/from16 v25, v7

    invoke-static/range {v25 .. v25}, Ll/qa00;->d(F)I

    move-result v7

    invoke-direct {v14, v15, v7}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    const/16 v7, 0x11

    .line 96
    iput v7, v14, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 97
    new-instance v7, Landroid/widget/ImageView;

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->Y4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    move-result-object v15

    invoke-direct {v7, v15}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 98
    iget v15, v0, Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVerificationGuideCardView;->i:I

    invoke-virtual {v7, v15}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 99
    new-instance v15, Landroid/widget/FrameLayout$LayoutParams;

    move/from16 v26, v10

    invoke-static/range {v21 .. v21}, Ll/qa00;->d(F)I

    move-result v10

    invoke-static/range {v21 .. v21}, Ll/qa00;->d(F)I

    move-result v6

    invoke-direct {v15, v10, v6}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 100
    invoke-static/range {v20 .. v20}, Ll/qa00;->d(F)I

    move-result v6

    iput v6, v15, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 101
    invoke-static/range {v20 .. v20}, Ll/qa00;->d(F)I

    move-result v6

    iput v6, v15, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 102
    iput v3, v15, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 103
    invoke-virtual {v13, v11, v12}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 104
    invoke-virtual {v13, v7, v15}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const/high16 v7, 0x40a00000    # 5.0f

    .line 105
    invoke-virtual {v13, v7}, Landroid/view/View;->setRotation(F)V

    const/high16 v6, 0x42980000    # 76.0f

    mul-float/2addr v6, v5

    .line 106
    invoke-virtual {v13, v6}, Landroid/view/View;->setTranslationX(F)V

    .line 107
    iget-object v6, v0, Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVerificationGuideCardView;->e:Landroid/widget/FrameLayout;

    invoke-virtual {v6, v13, v14}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 108
    :goto_9
    sget-object v6, Ll/uqb0;->G:Ll/fsb0;

    invoke-virtual {v9}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    move-result-object v7

    invoke-virtual {v7}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    move-result-object v7

    invoke-virtual {v7}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    move-result-object v7

    invoke-virtual {v7}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v11, v7}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    goto :goto_a

    :cond_f
    move/from16 v25, v7

    move/from16 v26, v10

    :goto_a
    add-int/lit8 v8, v8, 0x1

    move/from16 v7, v25

    move/from16 v10, v26

    const/4 v6, 0x1

    goto/16 :goto_7

    :cond_10
    move/from16 v25, v7

    move/from16 v26, v10

    const/4 v6, 0x4

    const/high16 v10, -0x3e900000    # -15.0f

    if-ne v4, v6, :cond_15

    const/4 v6, 0x0

    :goto_b
    if-ge v6, v4, :cond_34

    .line 109
    invoke-interface {v2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$a;

    iget-object v8, v8, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$a;->a:Lcom/p1/mobile/putong/data/User;

    if-eqz v8, :cond_14

    .line 110
    new-instance v11, Lv/VDraweeView;

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->Y4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    move-result-object v12

    invoke-direct {v11, v12}, Lv/VDraweeView;-><init>(Landroid/content/Context;)V

    .line 111
    new-instance v12, Lcom/facebook/drawee/generic/RoundingParams;

    invoke-direct {v12}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 112
    invoke-static/range {v22 .. v22}, Ll/qa00;->d(F)I

    move-result v13

    int-to-float v13, v13

    invoke-virtual {v12, v13}, Lcom/facebook/drawee/generic/RoundingParams;->s(F)Lcom/facebook/drawee/generic/RoundingParams;

    .line 113
    new-instance v13, Ll/xlj;

    .line 114
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v14

    invoke-virtual {v14}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v14

    invoke-direct {v13, v14}, Ll/xlj;-><init>(Landroid/content/res/Resources;)V

    .line 115
    invoke-virtual {v13}, Ll/xlj;->a()Ll/wlj;

    move-result-object v13

    .line 116
    invoke-virtual {v13, v12}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 117
    new-instance v12, Landroid/widget/FrameLayout$LayoutParams;

    invoke-static/range {v26 .. v26}, Ll/qa00;->d(F)I

    move-result v14

    invoke-static/range {v25 .. v25}, Ll/qa00;->d(F)I

    move-result v15

    invoke-direct {v12, v14, v15}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    const/16 v14, 0x11

    .line 118
    iput v14, v12, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 119
    invoke-virtual {v11, v13}, Lcom/facebook/drawee/view/DraweeView;->setHierarchy(Ll/mde;)V

    .line 120
    invoke-static/range {v16 .. v16}, Ll/qa00;->d(F)I

    move-result v13

    invoke-static/range {v16 .. v16}, Ll/qa00;->d(F)I

    move-result v14

    invoke-static/range {v16 .. v16}, Ll/qa00;->d(F)I

    move-result v15

    invoke-static/range {v16 .. v16}, Ll/qa00;->d(F)I

    move-result v7

    invoke-virtual {v11, v13, v14, v15, v7}, Landroid/view/View;->setPadding(IIII)V

    .line 121
    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v7

    sget v13, Ll/dbc0;->rr:I

    invoke-virtual {v7, v13}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v7

    .line 122
    invoke-virtual {v11, v7}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 123
    sget-object v7, Ll/uqb0;->G:Ll/fsb0;

    invoke-virtual {v8}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    move-result-object v8

    invoke-virtual {v8}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    move-result-object v8

    invoke-virtual {v8}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    move-result-object v8

    invoke-virtual {v8}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v11, v8}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    if-nez v6, :cond_11

    .line 124
    invoke-virtual {v11, v10}, Landroid/view/View;->setRotation(F)V

    const/high16 v7, -0x3d4c0000    # -90.0f

    mul-float/2addr v7, v5

    .line 125
    invoke-virtual {v11, v7}, Landroid/view/View;->setTranslationX(F)V

    .line 126
    iget-object v7, v0, Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVerificationGuideCardView;->e:Landroid/widget/FrameLayout;

    invoke-virtual {v7, v11, v12}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto/16 :goto_c

    :cond_11
    const/high16 v7, -0x3ea00000    # -14.0f

    const/4 v8, 0x1

    if-ne v6, v8, :cond_12

    const/high16 v13, -0x3f600000    # -5.0f

    .line 127
    invoke-virtual {v11, v13}, Landroid/view/View;->setRotation(F)V

    const/high16 v8, -0x3e100000    # -30.0f

    mul-float/2addr v8, v5

    .line 128
    invoke-virtual {v11, v8}, Landroid/view/View;->setTranslationX(F)V

    mul-float/2addr v7, v5

    .line 129
    invoke-virtual {v11, v7}, Landroid/view/View;->setTranslationY(F)V

    .line 130
    iget-object v7, v0, Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVerificationGuideCardView;->e:Landroid/widget/FrameLayout;

    invoke-virtual {v7, v11, v12}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_c

    :cond_12
    if-ne v6, v9, :cond_13

    const/high16 v8, 0x40a00000    # 5.0f

    .line 131
    invoke-virtual {v11, v8}, Landroid/view/View;->setRotation(F)V

    const/high16 v8, 0x41f00000    # 30.0f

    mul-float/2addr v8, v5

    .line 132
    invoke-virtual {v11, v8}, Landroid/view/View;->setTranslationX(F)V

    mul-float/2addr v7, v5

    .line 133
    invoke-virtual {v11, v7}, Landroid/view/View;->setTranslationY(F)V

    .line 134
    iget-object v7, v0, Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVerificationGuideCardView;->e:Landroid/widget/FrameLayout;

    invoke-virtual {v7, v11, v12}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_c

    .line 135
    :cond_13
    new-instance v7, Landroid/widget/FrameLayout;

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->Y4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    move-result-object v8

    invoke-direct {v7, v8}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 136
    new-instance v8, Landroid/widget/FrameLayout$LayoutParams;

    invoke-static/range {v26 .. v26}, Ll/qa00;->d(F)I

    move-result v13

    invoke-static/range {v25 .. v25}, Ll/qa00;->d(F)I

    move-result v14

    invoke-direct {v8, v13, v14}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    const/16 v14, 0x11

    .line 137
    iput v14, v8, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 138
    new-instance v13, Landroid/widget/ImageView;

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->Y4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    move-result-object v14

    invoke-direct {v13, v14}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 139
    iget v14, v0, Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVerificationGuideCardView;->i:I

    invoke-virtual {v13, v14}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 140
    new-instance v14, Landroid/widget/FrameLayout$LayoutParams;

    invoke-static/range {v21 .. v21}, Ll/qa00;->d(F)I

    move-result v15

    invoke-static/range {v21 .. v21}, Ll/qa00;->d(F)I

    move-result v9

    invoke-direct {v14, v15, v9}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 141
    invoke-static/range {v20 .. v20}, Ll/qa00;->d(F)I

    move-result v9

    iput v9, v14, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 142
    invoke-static/range {v20 .. v20}, Ll/qa00;->d(F)I

    move-result v9

    iput v9, v14, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 143
    iput v3, v14, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 144
    invoke-virtual {v7, v11, v12}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 145
    invoke-virtual {v7, v13, v14}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const/high16 v9, 0x41700000    # 15.0f

    .line 146
    invoke-virtual {v7, v9}, Landroid/view/View;->setRotation(F)V

    const/high16 v9, 0x42b40000    # 90.0f

    mul-float/2addr v9, v5

    .line 147
    invoke-virtual {v7, v9}, Landroid/view/View;->setTranslationX(F)V

    .line 148
    iget-object v9, v0, Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVerificationGuideCardView;->e:Landroid/widget/FrameLayout;

    invoke-virtual {v9, v7, v8}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :cond_14
    :goto_c
    add-int/lit8 v6, v6, 0x1

    const/4 v9, 0x2

    goto/16 :goto_b

    :cond_15
    const/4 v3, 0x5

    const/high16 v13, 0x43050000    # 133.0f

    const/high16 v14, 0x42c80000    # 100.0f

    const/high16 v15, 0x42a00000    # 80.0f

    const/high16 v25, 0x42d60000    # 107.0f

    if-ne v4, v3, :cond_1c

    .line 149
    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    invoke-static {v15}, Ll/qa00;->d(F)I

    move-result v6

    invoke-static/range {v25 .. v25}, Ll/qa00;->d(F)I

    move-result v15

    invoke-direct {v3, v6, v15}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    const/16 v6, 0x11

    .line 150
    iput v6, v3, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 151
    new-instance v15, Landroid/widget/FrameLayout$LayoutParams;

    invoke-static {v14}, Ll/qa00;->d(F)I

    move-result v14

    invoke-static {v13}, Ll/qa00;->d(F)I

    move-result v13

    invoke-direct {v15, v14, v13}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 152
    iput v6, v15, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 153
    new-instance v13, Landroid/widget/FrameLayout$LayoutParams;

    invoke-static/range {v19 .. v19}, Ll/qa00;->d(F)I

    move-result v14

    const/high16 v26, 0x426c0000    # 59.0f

    invoke-static/range {v18 .. v18}, Ll/qa00;->d(F)I

    move-result v7

    invoke-direct {v13, v14, v7}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 154
    iput v6, v13, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    const/4 v6, 0x0

    :goto_d
    if-ge v6, v4, :cond_1b

    .line 155
    invoke-interface {v2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$a;

    iget-object v7, v7, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$a;->a:Lcom/p1/mobile/putong/data/User;

    if-eqz v7, :cond_1a

    .line 156
    new-instance v14, Lv/VDraweeView;

    const/high16 v27, -0x3d940000    # -59.0f

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->Y4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    move-result-object v9

    invoke-direct {v14, v9}, Lv/VDraweeView;-><init>(Landroid/content/Context;)V

    if-nez v6, :cond_16

    .line 157
    new-instance v9, Lcom/facebook/drawee/generic/RoundingParams;

    invoke-direct {v9}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    const/high16 v28, -0x3d2a0000    # -107.0f

    .line 158
    invoke-static/range {v22 .. v22}, Ll/qa00;->d(F)I

    move-result v12

    int-to-float v12, v12

    invoke-virtual {v9, v12}, Lcom/facebook/drawee/generic/RoundingParams;->s(F)Lcom/facebook/drawee/generic/RoundingParams;

    .line 159
    new-instance v12, Ll/xlj;

    .line 160
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-direct {v12, v8}, Ll/xlj;-><init>(Landroid/content/res/Resources;)V

    .line 161
    invoke-virtual {v12}, Ll/xlj;->a()Ll/wlj;

    move-result-object v8

    .line 162
    invoke-virtual {v8, v9}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 163
    invoke-virtual {v14, v8}, Lcom/facebook/drawee/view/DraweeView;->setHierarchy(Ll/mde;)V

    .line 164
    invoke-virtual {v14, v10}, Landroid/view/View;->setRotation(F)V

    mul-float v12, v5, v28

    .line 165
    invoke-virtual {v14, v12}, Landroid/view/View;->setTranslationX(F)V

    .line 166
    iget-object v8, v0, Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVerificationGuideCardView;->e:Landroid/widget/FrameLayout;

    invoke-virtual {v8, v14, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto/16 :goto_e

    :cond_16
    const/4 v8, 0x1

    const/high16 v28, -0x3d2a0000    # -107.0f

    if-ne v6, v8, :cond_17

    .line 167
    new-instance v8, Lcom/facebook/drawee/generic/RoundingParams;

    invoke-direct {v8}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 168
    invoke-static/range {v22 .. v22}, Ll/qa00;->d(F)I

    move-result v9

    int-to-float v9, v9

    invoke-virtual {v8, v9}, Lcom/facebook/drawee/generic/RoundingParams;->s(F)Lcom/facebook/drawee/generic/RoundingParams;

    .line 169
    new-instance v9, Ll/xlj;

    .line 170
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v12

    invoke-virtual {v12}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    invoke-direct {v9, v12}, Ll/xlj;-><init>(Landroid/content/res/Resources;)V

    .line 171
    invoke-virtual {v9}, Ll/xlj;->a()Ll/wlj;

    move-result-object v9

    .line 172
    invoke-virtual {v9, v8}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 173
    invoke-virtual {v14, v9}, Lcom/facebook/drawee/view/DraweeView;->setHierarchy(Ll/mde;)V

    const/high16 v9, 0x41700000    # 15.0f

    .line 174
    invoke-virtual {v14, v9}, Landroid/view/View;->setRotation(F)V

    mul-float v8, v5, v25

    .line 175
    invoke-virtual {v14, v8}, Landroid/view/View;->setTranslationX(F)V

    .line 176
    iget-object v8, v0, Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVerificationGuideCardView;->e:Landroid/widget/FrameLayout;

    invoke-virtual {v8, v14, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto/16 :goto_e

    :cond_17
    const/4 v8, 0x2

    if-ne v6, v8, :cond_18

    .line 177
    new-instance v8, Lcom/facebook/drawee/generic/RoundingParams;

    invoke-direct {v8}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 178
    invoke-static/range {v22 .. v22}, Ll/qa00;->d(F)I

    move-result v9

    int-to-float v9, v9

    invoke-virtual {v8, v9}, Lcom/facebook/drawee/generic/RoundingParams;->s(F)Lcom/facebook/drawee/generic/RoundingParams;

    .line 179
    new-instance v9, Ll/xlj;

    .line 180
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v12

    invoke-virtual {v12}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    invoke-direct {v9, v12}, Ll/xlj;-><init>(Landroid/content/res/Resources;)V

    .line 181
    invoke-virtual {v9}, Ll/xlj;->a()Ll/wlj;

    move-result-object v9

    .line 182
    invoke-virtual {v9, v8}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 183
    invoke-virtual {v14, v9}, Lcom/facebook/drawee/view/DraweeView;->setHierarchy(Ll/mde;)V

    const/high16 v8, -0x3f600000    # -5.0f

    .line 184
    invoke-virtual {v14, v8}, Landroid/view/View;->setRotation(F)V

    mul-float v9, v5, v27

    .line 185
    invoke-virtual {v14, v9}, Landroid/view/View;->setTranslationX(F)V

    .line 186
    iget-object v8, v0, Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVerificationGuideCardView;->e:Landroid/widget/FrameLayout;

    invoke-virtual {v8, v14, v15}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_e

    :cond_18
    if-ne v6, v11, :cond_19

    .line 187
    new-instance v8, Lcom/facebook/drawee/generic/RoundingParams;

    invoke-direct {v8}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 188
    invoke-static/range {v22 .. v22}, Ll/qa00;->d(F)I

    move-result v9

    int-to-float v9, v9

    invoke-virtual {v8, v9}, Lcom/facebook/drawee/generic/RoundingParams;->s(F)Lcom/facebook/drawee/generic/RoundingParams;

    .line 189
    new-instance v9, Ll/xlj;

    .line 190
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v12

    invoke-virtual {v12}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    invoke-direct {v9, v12}, Ll/xlj;-><init>(Landroid/content/res/Resources;)V

    .line 191
    invoke-virtual {v9}, Ll/xlj;->a()Ll/wlj;

    move-result-object v9

    .line 192
    invoke-virtual {v9, v8}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 193
    invoke-virtual {v14, v9}, Lcom/facebook/drawee/view/DraweeView;->setHierarchy(Ll/mde;)V

    const/high16 v8, 0x40a00000    # 5.0f

    .line 194
    invoke-virtual {v14, v8}, Landroid/view/View;->setRotation(F)V

    mul-float v8, v5, v26

    .line 195
    invoke-virtual {v14, v8}, Landroid/view/View;->setTranslationX(F)V

    .line 196
    iget-object v8, v0, Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVerificationGuideCardView;->e:Landroid/widget/FrameLayout;

    invoke-virtual {v8, v14, v15}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_e

    .line 197
    :cond_19
    new-instance v8, Lcom/facebook/drawee/generic/RoundingParams;

    invoke-direct {v8}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 198
    invoke-static/range {v22 .. v22}, Ll/qa00;->d(F)I

    move-result v9

    int-to-float v9, v9

    invoke-virtual {v8, v9}, Lcom/facebook/drawee/generic/RoundingParams;->s(F)Lcom/facebook/drawee/generic/RoundingParams;

    .line 199
    new-instance v9, Ll/xlj;

    .line 200
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v12

    invoke-virtual {v12}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    invoke-direct {v9, v12}, Ll/xlj;-><init>(Landroid/content/res/Resources;)V

    .line 201
    invoke-virtual {v9}, Ll/xlj;->a()Ll/wlj;

    move-result-object v9

    .line 202
    invoke-virtual {v9, v8}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 203
    invoke-virtual {v14, v9}, Lcom/facebook/drawee/view/DraweeView;->setHierarchy(Ll/mde;)V

    .line 204
    iget-object v8, v0, Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVerificationGuideCardView;->e:Landroid/widget/FrameLayout;

    invoke-virtual {v8, v14, v13}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 205
    :goto_e
    invoke-static/range {v16 .. v16}, Ll/qa00;->d(F)I

    move-result v8

    invoke-static/range {v16 .. v16}, Ll/qa00;->d(F)I

    move-result v9

    invoke-static/range {v16 .. v16}, Ll/qa00;->d(F)I

    move-result v12

    invoke-static/range {v16 .. v16}, Ll/qa00;->d(F)I

    move-result v11

    invoke-virtual {v14, v8, v9, v12, v11}, Landroid/view/View;->setPadding(IIII)V

    .line 206
    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v8

    sget v9, Ll/dbc0;->rr:I

    invoke-virtual {v8, v9}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v8

    .line 207
    invoke-virtual {v14, v8}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 208
    sget-object v8, Ll/uqb0;->G:Ll/fsb0;

    invoke-virtual {v7}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    move-result-object v7

    invoke-virtual {v7}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    move-result-object v7

    invoke-virtual {v7}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    move-result-object v7

    invoke-virtual {v7}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v8, v14, v7}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    goto :goto_f

    :cond_1a
    const/high16 v27, -0x3d940000    # -59.0f

    const/high16 v28, -0x3d2a0000    # -107.0f

    :goto_f
    add-int/lit8 v6, v6, 0x1

    const/16 v8, 0x51

    const/4 v11, 0x3

    goto/16 :goto_d

    .line 209
    :cond_1b
    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    invoke-static/range {v21 .. v21}, Ll/qa00;->d(F)I

    move-result v3

    invoke-static/range {v21 .. v21}, Ll/qa00;->d(F)I

    move-result v4

    invoke-direct {v2, v3, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 210
    invoke-static/range {v20 .. v20}, Ll/qa00;->d(F)I

    move-result v3

    iput v3, v2, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    const/16 v3, 0x51

    .line 211
    iput v3, v2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 212
    new-instance v3, Landroid/widget/ImageView;

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->Y4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    move-result-object v4

    invoke-direct {v3, v4}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 213
    iget v4, v0, Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVerificationGuideCardView;->i:I

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setImageResource(I)V

    mul-float v5, v5, v17

    .line 214
    invoke-virtual {v3, v5}, Landroid/view/View;->setTranslationX(F)V

    .line 215
    iget-object v4, v0, Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVerificationGuideCardView;->e:Landroid/widget/FrameLayout;

    invoke-virtual {v4, v3, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto/16 :goto_1c

    :cond_1c
    const/high16 v26, 0x426c0000    # 59.0f

    const/high16 v27, -0x3d940000    # -59.0f

    const/high16 v28, -0x3d2a0000    # -107.0f

    const/high16 v11, 0x41c80000    # 25.0f

    const/high16 v12, 0x42700000    # 60.0f

    const/high16 v29, -0x3cfa0000    # -134.0f

    const/high16 v30, 0x43060000    # 134.0f

    const/4 v9, 0x6

    if-ne v4, v9, :cond_25

    .line 216
    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    invoke-static {v12}, Ll/qa00;->d(F)I

    move-result v9

    invoke-static {v15}, Ll/qa00;->d(F)I

    move-result v12

    invoke-direct {v3, v9, v12}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    const/16 v9, 0x11

    .line 217
    iput v9, v3, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 218
    new-instance v12, Landroid/widget/FrameLayout$LayoutParams;

    invoke-static {v15}, Ll/qa00;->d(F)I

    move-result v15

    move/from16 v31, v13

    invoke-static/range {v25 .. v25}, Ll/qa00;->d(F)I

    move-result v13

    invoke-direct {v12, v15, v13}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 219
    iput v9, v12, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 220
    new-instance v13, Landroid/widget/FrameLayout$LayoutParams;

    invoke-static {v14}, Ll/qa00;->d(F)I

    move-result v14

    invoke-static/range {v31 .. v31}, Ll/qa00;->d(F)I

    move-result v15

    invoke-direct {v13, v14, v15}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 221
    iput v9, v13, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 222
    new-instance v14, Landroid/widget/FrameLayout$LayoutParams;

    invoke-static/range {v19 .. v19}, Ll/qa00;->d(F)I

    move-result v15

    invoke-static/range {v18 .. v18}, Ll/qa00;->d(F)I

    move-result v6

    invoke-direct {v14, v15, v6}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 223
    iput v9, v14, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 224
    new-instance v6, Ll/xlj;

    .line 225
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v9

    invoke-virtual {v9}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    invoke-direct {v6, v9}, Ll/xlj;-><init>(Landroid/content/res/Resources;)V

    .line 226
    invoke-virtual {v6}, Ll/xlj;->a()Ll/wlj;

    move-result-object v6

    .line 227
    sget v9, Ll/dbc0;->qr:I

    invoke-virtual {v6, v9}, Ll/wlj;->D(I)V

    .line 228
    new-instance v9, Lv/VDraweeView;

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->Y4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    move-result-object v15

    invoke-direct {v9, v15}, Lv/VDraweeView;-><init>(Landroid/content/Context;)V

    .line 229
    invoke-virtual {v9, v6}, Lcom/facebook/drawee/view/DraweeView;->setHierarchy(Ll/mde;)V

    .line 230
    invoke-virtual {v9, v11}, Landroid/view/View;->setRotation(F)V

    const/high16 v23, 0x40a00000    # 5.0f

    mul-float v11, v5, v23

    .line 231
    invoke-virtual {v9, v11}, Landroid/view/View;->setTranslationY(F)V

    mul-float v6, v5, v30

    .line 232
    invoke-virtual {v9, v6}, Landroid/view/View;->setTranslationX(F)V

    .line 233
    iget-object v6, v0, Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVerificationGuideCardView;->e:Landroid/widget/FrameLayout;

    invoke-virtual {v6, v9, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const/4 v6, 0x0

    :goto_10
    if-ge v6, v4, :cond_24

    .line 234
    invoke-interface {v2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$a;

    iget-object v9, v9, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$a;->a:Lcom/p1/mobile/putong/data/User;

    if-eqz v9, :cond_23

    .line 235
    new-instance v15, Lv/VDraweeView;

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->Y4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    move-result-object v10

    invoke-direct {v15, v10}, Lv/VDraweeView;-><init>(Landroid/content/Context;)V

    if-nez v6, :cond_1d

    .line 236
    new-instance v10, Lcom/facebook/drawee/generic/RoundingParams;

    invoke-direct {v10}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 237
    invoke-static/range {v20 .. v20}, Ll/qa00;->d(F)I

    move-result v8

    int-to-float v8, v8

    invoke-virtual {v10, v8}, Lcom/facebook/drawee/generic/RoundingParams;->s(F)Lcom/facebook/drawee/generic/RoundingParams;

    .line 238
    new-instance v8, Ll/xlj;

    .line 239
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    invoke-direct {v8, v7}, Ll/xlj;-><init>(Landroid/content/res/Resources;)V

    .line 240
    invoke-virtual {v8}, Ll/xlj;->a()Ll/wlj;

    move-result-object v7

    .line 241
    invoke-virtual {v7, v10}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 242
    invoke-virtual {v15, v7}, Lcom/facebook/drawee/view/DraweeView;->setHierarchy(Ll/mde;)V

    const v7, 0x3e4ccccd    # 0.2f

    .line 243
    invoke-virtual {v15, v7}, Landroid/view/View;->setAlpha(F)V

    const/high16 v7, -0x3e380000    # -25.0f

    .line 244
    invoke-virtual {v15, v7}, Landroid/view/View;->setRotation(F)V

    mul-float v7, v5, v29

    .line 245
    invoke-virtual {v15, v7}, Landroid/view/View;->setTranslationX(F)V

    .line 246
    invoke-virtual {v15, v11}, Landroid/view/View;->setTranslationY(F)V

    .line 247
    iget-object v7, v0, Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVerificationGuideCardView;->e:Landroid/widget/FrameLayout;

    invoke-virtual {v7, v15, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto/16 :goto_11

    :cond_1d
    const/4 v8, 0x1

    if-ne v6, v8, :cond_1e

    .line 248
    new-instance v7, Lcom/facebook/drawee/generic/RoundingParams;

    invoke-direct {v7}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 249
    invoke-static/range {v22 .. v22}, Ll/qa00;->d(F)I

    move-result v8

    int-to-float v8, v8

    invoke-virtual {v7, v8}, Lcom/facebook/drawee/generic/RoundingParams;->s(F)Lcom/facebook/drawee/generic/RoundingParams;

    .line 250
    new-instance v8, Ll/xlj;

    .line 251
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v10

    invoke-virtual {v10}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    invoke-direct {v8, v10}, Ll/xlj;-><init>(Landroid/content/res/Resources;)V

    .line 252
    invoke-virtual {v8}, Ll/xlj;->a()Ll/wlj;

    move-result-object v8

    .line 253
    invoke-virtual {v8, v7}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 254
    invoke-virtual {v15, v8}, Lcom/facebook/drawee/view/DraweeView;->setHierarchy(Ll/mde;)V

    const/high16 v7, -0x3e900000    # -15.0f

    .line 255
    invoke-virtual {v15, v7}, Landroid/view/View;->setRotation(F)V

    mul-float v7, v5, v28

    .line 256
    invoke-virtual {v15, v7}, Landroid/view/View;->setTranslationX(F)V

    .line 257
    iget-object v7, v0, Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVerificationGuideCardView;->e:Landroid/widget/FrameLayout;

    invoke-virtual {v7, v15, v12}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto/16 :goto_11

    :cond_1e
    const/4 v8, 0x2

    if-ne v6, v8, :cond_1f

    .line 258
    new-instance v7, Lcom/facebook/drawee/generic/RoundingParams;

    invoke-direct {v7}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 259
    invoke-static/range {v22 .. v22}, Ll/qa00;->d(F)I

    move-result v8

    int-to-float v8, v8

    invoke-virtual {v7, v8}, Lcom/facebook/drawee/generic/RoundingParams;->s(F)Lcom/facebook/drawee/generic/RoundingParams;

    .line 260
    new-instance v8, Ll/xlj;

    .line 261
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v10

    invoke-virtual {v10}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    invoke-direct {v8, v10}, Ll/xlj;-><init>(Landroid/content/res/Resources;)V

    .line 262
    invoke-virtual {v8}, Ll/xlj;->a()Ll/wlj;

    move-result-object v8

    .line 263
    invoke-virtual {v8, v7}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 264
    invoke-virtual {v15, v8}, Lcom/facebook/drawee/view/DraweeView;->setHierarchy(Ll/mde;)V

    const/high16 v7, 0x41700000    # 15.0f

    .line 265
    invoke-virtual {v15, v7}, Landroid/view/View;->setRotation(F)V

    mul-float v7, v5, v25

    .line 266
    invoke-virtual {v15, v7}, Landroid/view/View;->setTranslationX(F)V

    .line 267
    iget-object v7, v0, Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVerificationGuideCardView;->e:Landroid/widget/FrameLayout;

    invoke-virtual {v7, v15, v12}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto/16 :goto_11

    :cond_1f
    const/4 v7, 0x3

    if-ne v6, v7, :cond_20

    .line 268
    new-instance v7, Lcom/facebook/drawee/generic/RoundingParams;

    invoke-direct {v7}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 269
    invoke-static/range {v22 .. v22}, Ll/qa00;->d(F)I

    move-result v8

    int-to-float v8, v8

    invoke-virtual {v7, v8}, Lcom/facebook/drawee/generic/RoundingParams;->s(F)Lcom/facebook/drawee/generic/RoundingParams;

    .line 270
    new-instance v8, Ll/xlj;

    .line 271
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v10

    invoke-virtual {v10}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    invoke-direct {v8, v10}, Ll/xlj;-><init>(Landroid/content/res/Resources;)V

    .line 272
    invoke-virtual {v8}, Ll/xlj;->a()Ll/wlj;

    move-result-object v8

    .line 273
    invoke-virtual {v8, v7}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 274
    invoke-virtual {v15, v8}, Lcom/facebook/drawee/view/DraweeView;->setHierarchy(Ll/mde;)V

    const/high16 v8, -0x3f600000    # -5.0f

    .line 275
    invoke-virtual {v15, v8}, Landroid/view/View;->setRotation(F)V

    mul-float v7, v5, v27

    .line 276
    invoke-virtual {v15, v7}, Landroid/view/View;->setTranslationX(F)V

    .line 277
    iget-object v7, v0, Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVerificationGuideCardView;->e:Landroid/widget/FrameLayout;

    invoke-virtual {v7, v15, v13}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_11

    :cond_20
    const/4 v7, 0x4

    if-ne v6, v7, :cond_21

    .line 278
    new-instance v7, Lcom/facebook/drawee/generic/RoundingParams;

    invoke-direct {v7}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 279
    invoke-static/range {v22 .. v22}, Ll/qa00;->d(F)I

    move-result v8

    int-to-float v8, v8

    invoke-virtual {v7, v8}, Lcom/facebook/drawee/generic/RoundingParams;->s(F)Lcom/facebook/drawee/generic/RoundingParams;

    .line 280
    new-instance v8, Ll/xlj;

    .line 281
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v10

    invoke-virtual {v10}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    invoke-direct {v8, v10}, Ll/xlj;-><init>(Landroid/content/res/Resources;)V

    .line 282
    invoke-virtual {v8}, Ll/xlj;->a()Ll/wlj;

    move-result-object v8

    .line 283
    invoke-virtual {v8, v7}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 284
    invoke-virtual {v15, v8}, Lcom/facebook/drawee/view/DraweeView;->setHierarchy(Ll/mde;)V

    const/high16 v7, 0x40a00000    # 5.0f

    .line 285
    invoke-virtual {v15, v7}, Landroid/view/View;->setRotation(F)V

    mul-float v7, v5, v26

    .line 286
    invoke-virtual {v15, v7}, Landroid/view/View;->setTranslationX(F)V

    .line 287
    iget-object v7, v0, Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVerificationGuideCardView;->e:Landroid/widget/FrameLayout;

    invoke-virtual {v7, v15, v13}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_11

    .line 288
    :cond_21
    new-instance v7, Lcom/facebook/drawee/generic/RoundingParams;

    invoke-direct {v7}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 289
    invoke-static/range {v22 .. v22}, Ll/qa00;->d(F)I

    move-result v8

    int-to-float v8, v8

    invoke-virtual {v7, v8}, Lcom/facebook/drawee/generic/RoundingParams;->s(F)Lcom/facebook/drawee/generic/RoundingParams;

    .line 290
    new-instance v8, Ll/xlj;

    .line 291
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v10

    invoke-virtual {v10}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    invoke-direct {v8, v10}, Ll/xlj;-><init>(Landroid/content/res/Resources;)V

    .line 292
    invoke-virtual {v8}, Ll/xlj;->a()Ll/wlj;

    move-result-object v8

    .line 293
    invoke-virtual {v8, v7}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 294
    invoke-virtual {v15, v8}, Lcom/facebook/drawee/view/DraweeView;->setHierarchy(Ll/mde;)V

    .line 295
    iget-object v7, v0, Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVerificationGuideCardView;->e:Landroid/widget/FrameLayout;

    invoke-virtual {v7, v15, v14}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 296
    :goto_11
    invoke-static/range {v16 .. v16}, Ll/qa00;->d(F)I

    move-result v7

    invoke-static/range {v16 .. v16}, Ll/qa00;->d(F)I

    move-result v8

    invoke-static/range {v16 .. v16}, Ll/qa00;->d(F)I

    move-result v10

    move-object/from16 v24, v3

    invoke-static/range {v16 .. v16}, Ll/qa00;->d(F)I

    move-result v3

    invoke-virtual {v15, v7, v8, v10, v3}, Landroid/view/View;->setPadding(IIII)V

    if-nez v6, :cond_22

    .line 297
    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v3

    sget v7, Ll/dbc0;->sr:I

    .line 298
    invoke-virtual {v3, v7}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 299
    invoke-virtual {v15, v3}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_12

    .line 300
    :cond_22
    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v3

    sget v7, Ll/dbc0;->rr:I

    invoke-virtual {v3, v7}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 301
    invoke-virtual {v15, v3}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 302
    :goto_12
    sget-object v3, Ll/uqb0;->G:Ll/fsb0;

    invoke-virtual {v9}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    move-result-object v7

    invoke-virtual {v7}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    move-result-object v7

    invoke-virtual {v7}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    move-result-object v7

    invoke-virtual {v7}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v15, v7}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    goto :goto_13

    :cond_23
    move-object/from16 v24, v3

    :goto_13
    add-int/lit8 v6, v6, 0x1

    move-object/from16 v3, v24

    const/high16 v10, -0x3e900000    # -15.0f

    goto/16 :goto_10

    .line 303
    :cond_24
    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    invoke-static/range {v21 .. v21}, Ll/qa00;->d(F)I

    move-result v3

    invoke-static/range {v21 .. v21}, Ll/qa00;->d(F)I

    move-result v4

    invoke-direct {v2, v3, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 304
    invoke-static/range {v20 .. v20}, Ll/qa00;->d(F)I

    move-result v3

    iput v3, v2, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    const/16 v3, 0x51

    .line 305
    iput v3, v2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 306
    new-instance v3, Landroid/widget/ImageView;

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->Y4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    move-result-object v4

    invoke-direct {v3, v4}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 307
    iget v4, v0, Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVerificationGuideCardView;->i:I

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setImageResource(I)V

    mul-float v5, v5, v17

    .line 308
    invoke-virtual {v3, v5}, Landroid/view/View;->setTranslationX(F)V

    .line 309
    iget-object v4, v0, Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVerificationGuideCardView;->e:Landroid/widget/FrameLayout;

    invoke-virtual {v4, v3, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto/16 :goto_1c

    :cond_25
    move/from16 v31, v13

    if-le v4, v9, :cond_34

    const/16 v6, 0x8

    if-ne v4, v6, :cond_26

    const/4 v8, 0x1

    .line 310
    invoke-interface {v2, v8, v4}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v2

    goto :goto_14

    :cond_26
    const/16 v6, 0x9

    if-ne v4, v6, :cond_27

    const/4 v8, 0x2

    .line 311
    invoke-interface {v2, v8, v4}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v2

    goto :goto_14

    :cond_27
    const/16 v6, 0xa

    if-ne v4, v6, :cond_28

    const/4 v7, 0x3

    .line 312
    invoke-interface {v2, v7, v4}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v2

    .line 313
    :cond_28
    :goto_14
    new-instance v4, Landroid/widget/FrameLayout$LayoutParams;

    invoke-static {v12}, Ll/qa00;->d(F)I

    move-result v6

    invoke-static {v15}, Ll/qa00;->d(F)I

    move-result v7

    invoke-direct {v4, v6, v7}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    const/16 v6, 0x11

    .line 314
    iput v6, v4, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 315
    new-instance v7, Landroid/widget/FrameLayout$LayoutParams;

    invoke-static {v15}, Ll/qa00;->d(F)I

    move-result v8

    invoke-static/range {v25 .. v25}, Ll/qa00;->d(F)I

    move-result v10

    invoke-direct {v7, v8, v10}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 316
    iput v6, v7, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 317
    new-instance v8, Landroid/widget/FrameLayout$LayoutParams;

    invoke-static {v14}, Ll/qa00;->d(F)I

    move-result v10

    invoke-static/range {v31 .. v31}, Ll/qa00;->d(F)I

    move-result v12

    invoke-direct {v8, v10, v12}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 318
    iput v6, v8, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 319
    new-instance v10, Landroid/widget/FrameLayout$LayoutParams;

    invoke-static/range {v19 .. v19}, Ll/qa00;->d(F)I

    move-result v12

    invoke-static/range {v18 .. v18}, Ll/qa00;->d(F)I

    move-result v13

    invoke-direct {v10, v12, v13}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 320
    iput v6, v10, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    const/4 v6, 0x0

    .line 321
    :goto_15
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v12

    if-ge v6, v12, :cond_33

    .line 322
    invoke-interface {v2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$a;

    iget-object v12, v12, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$a;->a:Lcom/p1/mobile/putong/data/User;

    if-eqz v12, :cond_32

    .line 323
    new-instance v13, Lv/VDraweeView;

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->Y4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    move-result-object v14

    invoke-direct {v13, v14}, Lv/VDraweeView;-><init>(Landroid/content/Context;)V

    if-nez v6, :cond_29

    .line 324
    new-instance v14, Lcom/facebook/drawee/generic/RoundingParams;

    invoke-direct {v14}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 325
    invoke-static/range {v20 .. v20}, Ll/qa00;->d(F)I

    move-result v15

    int-to-float v15, v15

    invoke-virtual {v14, v15}, Lcom/facebook/drawee/generic/RoundingParams;->s(F)Lcom/facebook/drawee/generic/RoundingParams;

    .line 326
    new-instance v15, Ll/xlj;

    .line 327
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    invoke-direct {v15, v9}, Ll/xlj;-><init>(Landroid/content/res/Resources;)V

    .line 328
    invoke-virtual {v15}, Ll/xlj;->a()Ll/wlj;

    move-result-object v9

    .line 329
    invoke-virtual {v9, v14}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 330
    invoke-virtual {v13, v9}, Lcom/facebook/drawee/view/DraweeView;->setHierarchy(Ll/mde;)V

    const v9, 0x3e4ccccd    # 0.2f

    .line 331
    invoke-virtual {v13, v9}, Landroid/view/View;->setAlpha(F)V

    const/high16 v9, -0x3e380000    # -25.0f

    .line 332
    invoke-virtual {v13, v9}, Landroid/view/View;->setRotation(F)V

    const/high16 v23, 0x40a00000    # 5.0f

    mul-float v14, v5, v23

    .line 333
    invoke-virtual {v13, v14}, Landroid/view/View;->setTranslationY(F)V

    mul-float v14, v5, v29

    .line 334
    invoke-virtual {v13, v14}, Landroid/view/View;->setTranslationX(F)V

    .line 335
    iget-object v14, v0, Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVerificationGuideCardView;->e:Landroid/widget/FrameLayout;

    invoke-virtual {v14, v13, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :goto_16
    const/4 v11, 0x6

    const/4 v14, 0x2

    goto/16 :goto_18

    :cond_29
    const/high16 v9, -0x3e380000    # -25.0f

    const/4 v14, 0x1

    if-ne v6, v14, :cond_2a

    .line 336
    new-instance v14, Lcom/facebook/drawee/generic/RoundingParams;

    invoke-direct {v14}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 337
    invoke-static/range {v20 .. v20}, Ll/qa00;->d(F)I

    move-result v15

    int-to-float v15, v15

    invoke-virtual {v14, v15}, Lcom/facebook/drawee/generic/RoundingParams;->s(F)Lcom/facebook/drawee/generic/RoundingParams;

    .line 338
    new-instance v15, Ll/xlj;

    .line 339
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    invoke-direct {v15, v9}, Ll/xlj;-><init>(Landroid/content/res/Resources;)V

    .line 340
    invoke-virtual {v15}, Ll/xlj;->a()Ll/wlj;

    move-result-object v9

    .line 341
    invoke-virtual {v9, v14}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 342
    invoke-virtual {v13, v9}, Lcom/facebook/drawee/view/DraweeView;->setHierarchy(Ll/mde;)V

    .line 343
    invoke-virtual {v13, v11}, Landroid/view/View;->setRotation(F)V

    const v9, 0x3e4ccccd    # 0.2f

    .line 344
    invoke-virtual {v13, v9}, Landroid/view/View;->setAlpha(F)V

    const/high16 v23, 0x40a00000    # 5.0f

    mul-float v14, v5, v23

    .line 345
    invoke-virtual {v13, v14}, Landroid/view/View;->setTranslationY(F)V

    mul-float v14, v5, v30

    .line 346
    invoke-virtual {v13, v14}, Landroid/view/View;->setTranslationX(F)V

    .line 347
    iget-object v14, v0, Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVerificationGuideCardView;->e:Landroid/widget/FrameLayout;

    invoke-virtual {v14, v13, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_16

    :cond_2a
    const v9, 0x3e4ccccd    # 0.2f

    const/4 v14, 0x2

    if-ne v6, v14, :cond_2b

    .line 348
    new-instance v15, Lcom/facebook/drawee/generic/RoundingParams;

    invoke-direct {v15}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 349
    invoke-static/range {v22 .. v22}, Ll/qa00;->d(F)I

    move-result v9

    int-to-float v9, v9

    invoke-virtual {v15, v9}, Lcom/facebook/drawee/generic/RoundingParams;->s(F)Lcom/facebook/drawee/generic/RoundingParams;

    .line 350
    new-instance v9, Ll/xlj;

    .line 351
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    invoke-direct {v9, v11}, Ll/xlj;-><init>(Landroid/content/res/Resources;)V

    .line 352
    invoke-virtual {v9}, Ll/xlj;->a()Ll/wlj;

    move-result-object v9

    .line 353
    invoke-virtual {v9, v15}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 354
    invoke-virtual {v13, v9}, Lcom/facebook/drawee/view/DraweeView;->setHierarchy(Ll/mde;)V

    const/high16 v9, -0x3e900000    # -15.0f

    .line 355
    invoke-virtual {v13, v9}, Landroid/view/View;->setRotation(F)V

    mul-float v11, v5, v28

    .line 356
    invoke-virtual {v13, v11}, Landroid/view/View;->setTranslationX(F)V

    .line 357
    iget-object v11, v0, Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVerificationGuideCardView;->e:Landroid/widget/FrameLayout;

    invoke-virtual {v11, v13, v7}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :goto_17
    const/4 v11, 0x6

    goto/16 :goto_18

    :cond_2b
    const/high16 v9, -0x3e900000    # -15.0f

    const/4 v11, 0x3

    if-ne v6, v11, :cond_2c

    .line 358
    new-instance v15, Lcom/facebook/drawee/generic/RoundingParams;

    invoke-direct {v15}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 359
    invoke-static/range {v22 .. v22}, Ll/qa00;->d(F)I

    move-result v9

    int-to-float v9, v9

    invoke-virtual {v15, v9}, Lcom/facebook/drawee/generic/RoundingParams;->s(F)Lcom/facebook/drawee/generic/RoundingParams;

    .line 360
    new-instance v9, Ll/xlj;

    .line 361
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    invoke-direct {v9, v11}, Ll/xlj;-><init>(Landroid/content/res/Resources;)V

    .line 362
    invoke-virtual {v9}, Ll/xlj;->a()Ll/wlj;

    move-result-object v9

    .line 363
    invoke-virtual {v9, v15}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 364
    invoke-virtual {v13, v9}, Lcom/facebook/drawee/view/DraweeView;->setHierarchy(Ll/mde;)V

    const/high16 v9, 0x41700000    # 15.0f

    .line 365
    invoke-virtual {v13, v9}, Landroid/view/View;->setRotation(F)V

    mul-float v11, v5, v25

    .line 366
    invoke-virtual {v13, v11}, Landroid/view/View;->setTranslationX(F)V

    .line 367
    iget-object v11, v0, Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVerificationGuideCardView;->e:Landroid/widget/FrameLayout;

    invoke-virtual {v11, v13, v7}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_17

    :cond_2c
    const/high16 v9, 0x41700000    # 15.0f

    const/4 v11, 0x4

    if-ne v6, v11, :cond_2d

    .line 368
    new-instance v15, Lcom/facebook/drawee/generic/RoundingParams;

    invoke-direct {v15}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 369
    invoke-static/range {v22 .. v22}, Ll/qa00;->d(F)I

    move-result v9

    int-to-float v9, v9

    invoke-virtual {v15, v9}, Lcom/facebook/drawee/generic/RoundingParams;->s(F)Lcom/facebook/drawee/generic/RoundingParams;

    .line 370
    new-instance v9, Ll/xlj;

    .line 371
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    invoke-direct {v9, v11}, Ll/xlj;-><init>(Landroid/content/res/Resources;)V

    .line 372
    invoke-virtual {v9}, Ll/xlj;->a()Ll/wlj;

    move-result-object v9

    .line 373
    invoke-virtual {v9, v15}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 374
    invoke-virtual {v13, v9}, Lcom/facebook/drawee/view/DraweeView;->setHierarchy(Ll/mde;)V

    const/high16 v9, -0x3f600000    # -5.0f

    .line 375
    invoke-virtual {v13, v9}, Landroid/view/View;->setRotation(F)V

    mul-float v11, v5, v27

    .line 376
    invoke-virtual {v13, v11}, Landroid/view/View;->setTranslationX(F)V

    .line 377
    iget-object v11, v0, Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVerificationGuideCardView;->e:Landroid/widget/FrameLayout;

    invoke-virtual {v11, v13, v8}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_17

    :cond_2d
    const/high16 v9, -0x3f600000    # -5.0f

    if-ne v6, v3, :cond_2e

    .line 378
    new-instance v11, Lcom/facebook/drawee/generic/RoundingParams;

    invoke-direct {v11}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 379
    invoke-static/range {v22 .. v22}, Ll/qa00;->d(F)I

    move-result v15

    int-to-float v15, v15

    invoke-virtual {v11, v15}, Lcom/facebook/drawee/generic/RoundingParams;->s(F)Lcom/facebook/drawee/generic/RoundingParams;

    .line 380
    new-instance v15, Ll/xlj;

    .line 381
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-direct {v15, v3}, Ll/xlj;-><init>(Landroid/content/res/Resources;)V

    .line 382
    invoke-virtual {v15}, Ll/xlj;->a()Ll/wlj;

    move-result-object v3

    .line 383
    invoke-virtual {v3, v11}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 384
    invoke-virtual {v13, v3}, Lcom/facebook/drawee/view/DraweeView;->setHierarchy(Ll/mde;)V

    const/high16 v3, 0x40a00000    # 5.0f

    .line 385
    invoke-virtual {v13, v3}, Landroid/view/View;->setRotation(F)V

    mul-float v11, v5, v26

    .line 386
    invoke-virtual {v13, v11}, Landroid/view/View;->setTranslationX(F)V

    .line 387
    iget-object v11, v0, Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVerificationGuideCardView;->e:Landroid/widget/FrameLayout;

    invoke-virtual {v11, v13, v8}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto/16 :goto_17

    :cond_2e
    const/high16 v3, 0x40a00000    # 5.0f

    const/4 v11, 0x6

    if-ne v6, v11, :cond_2f

    .line 388
    new-instance v15, Lcom/facebook/drawee/generic/RoundingParams;

    invoke-direct {v15}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 389
    invoke-static/range {v22 .. v22}, Ll/qa00;->d(F)I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v15, v3}, Lcom/facebook/drawee/generic/RoundingParams;->s(F)Lcom/facebook/drawee/generic/RoundingParams;

    .line 390
    new-instance v3, Ll/xlj;

    .line 391
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    invoke-direct {v3, v9}, Ll/xlj;-><init>(Landroid/content/res/Resources;)V

    .line 392
    invoke-virtual {v3}, Ll/xlj;->a()Ll/wlj;

    move-result-object v3

    .line 393
    invoke-virtual {v3, v15}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 394
    invoke-virtual {v13, v3}, Lcom/facebook/drawee/view/DraweeView;->setHierarchy(Ll/mde;)V

    .line 395
    iget-object v3, v0, Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVerificationGuideCardView;->e:Landroid/widget/FrameLayout;

    invoke-virtual {v3, v13, v10}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 396
    :cond_2f
    :goto_18
    invoke-static/range {v16 .. v16}, Ll/qa00;->d(F)I

    move-result v3

    invoke-static/range {v16 .. v16}, Ll/qa00;->d(F)I

    move-result v9

    invoke-static/range {v16 .. v16}, Ll/qa00;->d(F)I

    move-result v15

    invoke-static/range {v16 .. v16}, Ll/qa00;->d(F)I

    move-result v11

    invoke-virtual {v13, v3, v9, v15, v11}, Landroid/view/View;->setPadding(IIII)V

    const/4 v3, 0x1

    if-eqz v6, :cond_31

    if-ne v6, v3, :cond_30

    goto :goto_19

    .line 397
    :cond_30
    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v9

    sget v11, Ll/dbc0;->rr:I

    invoke-virtual {v9, v11}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v9

    .line 398
    invoke-virtual {v13, v9}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_1a

    .line 399
    :cond_31
    :goto_19
    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v9

    sget v11, Ll/dbc0;->sr:I

    .line 400
    invoke-virtual {v9, v11}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v9

    .line 401
    invoke-virtual {v13, v9}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 402
    :goto_1a
    sget-object v9, Ll/uqb0;->G:Ll/fsb0;

    invoke-virtual {v12}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    move-result-object v11

    invoke-virtual {v11}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    move-result-object v11

    invoke-virtual {v11}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    move-result-object v11

    invoke-virtual {v11}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v9, v13, v11}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    goto :goto_1b

    :cond_32
    const/4 v3, 0x1

    const/4 v14, 0x2

    :goto_1b
    add-int/lit8 v6, v6, 0x1

    const/4 v3, 0x5

    const/4 v9, 0x6

    const/high16 v11, 0x41c80000    # 25.0f

    goto/16 :goto_15

    .line 403
    :cond_33
    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    invoke-static/range {v21 .. v21}, Ll/qa00;->d(F)I

    move-result v3

    invoke-static/range {v21 .. v21}, Ll/qa00;->d(F)I

    move-result v4

    invoke-direct {v2, v3, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 404
    invoke-static/range {v20 .. v20}, Ll/qa00;->d(F)I

    move-result v3

    iput v3, v2, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    const/16 v3, 0x51

    .line 405
    iput v3, v2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 406
    new-instance v3, Landroid/widget/ImageView;

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->Y4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    move-result-object v4

    invoke-direct {v3, v4}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 407
    iget v4, v0, Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVerificationGuideCardView;->i:I

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setImageResource(I)V

    mul-float v5, v5, v17

    .line 408
    invoke-virtual {v3, v5}, Landroid/view/View;->setTranslationX(F)V

    .line 409
    iget-object v4, v0, Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVerificationGuideCardView;->e:Landroid/widget/FrameLayout;

    invoke-virtual {v4, v3, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 410
    :cond_34
    :goto_1c
    iget-object v2, v0, Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVerificationGuideCardView;->g:Lv/VText;

    new-instance v3, Ll/qei;

    invoke-direct {v3, v1}, Ll/qei;-><init>(Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;)V

    invoke-static {v2, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 411
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVerificationGuideCardView;->h:Lv/VText;

    new-instance v2, Ll/rei;

    invoke-direct {v2, v1}, Ll/rei;-><init>(Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;)V

    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    :cond_35
    :goto_1d
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    return-void

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVerificationGuideCardView;->f(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ll/gra;->z()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVerificationGuideCardView;->b:Lv/VImage;

    .line 14
    .line 15
    sget v1, Ll/dbc0;->Ph:I

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVerificationGuideCardView;->g:Lv/VText;

    .line 21
    .line 22
    const/high16 v1, -0x1000000

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVerificationGuideCardView;->g:Lv/VText;

    .line 28
    .line 29
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const/4 v1, 0x1

    .line 34
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 35
    .line 36
    .line 37
    sget v0, Ll/dbc0;->Lh:I

    .line 38
    .line 39
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVerificationGuideCardView;->i:I

    .line 40
    .line 41
    :cond_0
    return-void
.end method
