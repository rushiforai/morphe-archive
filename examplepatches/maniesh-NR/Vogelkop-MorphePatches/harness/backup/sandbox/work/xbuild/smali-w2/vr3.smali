.class public final Lvr3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lpri;


# instance fields
.field public a:I

.field public b:Z

.field public c:Ljava/lang/Object;

.field public d:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/widget/TextView;)V
    .registers 3

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lvr3;->d:Ljava/lang/Object;

    const/4 v0, 0x1

    .line 57
    iput v0, p0, Lvr3;->a:I

    .line 58
    iput-object p1, p0, Lvr3;->c:Ljava/lang/Object;

    .line 59
    invoke-virtual {p0}, Lvr3;->l()Z

    move-result p1

    iput-boolean p1, p0, Lvr3;->b:Z

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/widget/UrlFieldEditText;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lvr3;->c:Ljava/lang/Object;

    invoke-virtual {p1}, Landroid/widget/TextView;->getHighlightColor()I

    move-result p1

    iput p1, p0, Lvr3;->a:I

    new-instance p1, Ljq3;

    const/16 v0, 0x8

    invoke-direct {p1, p0, v0}, Ljq3;-><init>(Ljava/lang/Object;B)V

    const/4 v0, 0x1

    new-array v0, v0, [F

    const/high16 v1, 0x3f800000    # 1.0f

    const/4 v2, 0x0

    aput v1, v0, v2

    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    sget-object p1, Llf1;->f:Landroid/view/animation/LinearInterpolator;

    invoke-virtual {v0, p1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    const-wide/16 v1, 0x64

    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    iput-object v0, p0, Lvr3;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lcom/opera/api/Callback;)V
    .registers 2

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lvr3;->c:Ljava/lang/Object;

    .line 47
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lvr3;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lv0k;)V
    .registers 5

    .line 53
    sget-object v0, Lot4;->f:Lot4;

    const v1, 0x7fffffff

    const/4 v2, 0x0

    .line 54
    invoke-direct {p0, p1, v2, v0, v1}, Lvr3;-><init>(Lv0k;ZLot4;I)V

    return-void
.end method

.method public constructor <init>(Lv0k;ZLot4;I)V
    .registers 5

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    iput-object p1, p0, Lvr3;->d:Ljava/lang/Object;

    .line 50
    iput-boolean p2, p0, Lvr3;->b:Z

    .line 51
    iput-object p3, p0, Lvr3;->c:Ljava/lang/Object;

    .line 52
    iput p4, p0, Lvr3;->a:I

    return-void
.end method

.method public static i(C)Lvr3;
    .registers 4

    new-instance v0, Lst4;

    const/4 v1, 0x0

    invoke-direct {v0, v1, p0}, Lst4;-><init>(BC)V

    new-instance p0, Lvr3;

    new-instance v1, Ltxi;

    const/16 v2, 0xe

    invoke-direct {v1, v0, v2}, Ltxi;-><init>(Ljava/lang/Object;B)V

    invoke-direct {p0, v1}, Lvr3;-><init>(Lv0k;)V

    return-object p0
.end method

.method public static j(Ljava/lang/String;)Lvr3;
    .registers 4

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    const/4 v1, 0x1

    xor-int/2addr v0, v1

    const-string v2, "The separator may not be the empty string."

    invoke-static {v2, v0}, Lz4o;->v(Ljava/lang/String;Z)V

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-ne v0, v1, :cond_1b

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result p0

    invoke-static {p0}, Lvr3;->i(C)Lvr3;

    move-result-object p0

    return-object p0

    :cond_1b
    new-instance v0, Lvr3;

    new-instance v1, Ljp5;

    const/16 v2, 0x9

    invoke-direct {v1, p0, v2}, Ljp5;-><init>(Ljava/lang/String;B)V

    invoke-direct {v0, v1}, Lvr3;-><init>(Lv0k;)V

    return-object v0
.end method


# virtual methods
.method public final a(Ldri;I)Lcom/opera/android/suggestion/Suggestion;
    .registers 28

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-byte v2, v1, Ldri;->a:B

    iget-object v4, v1, Ldri;->b:Ljava/lang/String;

    const/4 v11, 0x2

    const/4 v12, 0x1

    if-eqz v2, :cond_13

    if-eq v2, v12, :cond_10

    if-ne v2, v11, :cond_13

    :cond_10
    iget-object v2, v1, Ldri;->c:Ljava/lang/String;

    goto :goto_14

    :cond_13
    move-object v2, v4

    :goto_14
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    iget-byte v5, v1, Ldri;->a:B

    invoke-virtual {v0, v3, v5}, Lvr3;->h(II)Z

    move-result v3

    const/4 v13, 0x0

    if-nez v3, :cond_42

    if-eqz v5, :cond_41

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Lvr3;->h(II)Z

    move-result v2

    if-eqz v2, :cond_41

    if-eqz v5, :cond_42

    new-instance v3, Ldri;

    const-string v10, ""

    const/4 v9, 0x0

    const-string v5, ""

    const-string v6, ""

    const-string v7, ""

    const/4 v8, 0x0

    invoke-direct/range {v3 .. v10}, Ldri;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;)V

    move-object v1, v3

    goto :goto_42

    :cond_41
    move-object v1, v13

    :cond_42
    :goto_42
    if-eqz v1, :cond_d6

    iget-byte v2, v1, Ldri;->a:B

    iget-object v0, v0, Lvr3;->d:Ljava/lang/Object;

    check-cast v0, Landroid/util/SparseIntArray;

    invoke-virtual {v0, v2}, Landroid/util/SparseIntArray;->get(I)I

    move-result v3

    add-int/2addr v3, v12

    invoke-virtual {v0, v2, v3}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v0, v1, Ldri;->b:Ljava/lang/String;

    if-eqz v2, :cond_5e

    if-eq v2, v12, :cond_5a

    if-ne v2, v11, :cond_5e

    :cond_5a
    iget-object v3, v1, Ldri;->c:Ljava/lang/String;

    move-object v15, v3

    goto :goto_5f

    :cond_5e
    move-object v15, v0

    :goto_5f
    if-eqz v2, :cond_bd

    if-eq v2, v12, :cond_99

    if-eq v2, v11, :cond_7f

    new-instance v13, Lcom/opera/android/suggestion/Suggestion;

    const/16 v14, 0x8

    const-string v16, ""

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v22, 0x0

    const/16 v23, -0x1

    const/16 v24, 0x0

    move-object/from16 v21, v16

    move/from16 v20, p2

    move-object/from16 v17, v0

    invoke-direct/range {v13 .. v24}, Lcom/opera/android/suggestion/Suggestion;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lrn9;Ljava/lang/String;ILjava/lang/String;IILjava/lang/Object;)V

    return-object v13

    :cond_7f
    move-object/from16 v17, v0

    new-instance v13, Lcom/opera/android/suggestion/Suggestion;

    const/16 v14, 0x13

    const-string v16, ""

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v22, 0x0

    const/16 v23, -0x1

    const/16 v24, 0x0

    move-object/from16 v21, v16

    move/from16 v20, p2

    invoke-direct/range {v13 .. v24}, Lcom/opera/android/suggestion/Suggestion;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lrn9;Ljava/lang/String;ILjava/lang/String;IILjava/lang/Object;)V

    return-object v13

    :cond_99
    move-object/from16 v17, v0

    iget-object v0, v1, Ldri;->e:Ljava/lang/String;

    iget-object v2, v1, Ldri;->f:Ljava/lang/String;

    iget-object v3, v1, Ldri;->d:Ljava/lang/String;

    iget v1, v1, Ldri;->g:I

    new-instance v13, Lcom/opera/android/suggestion/Suggestion;

    const/16 v14, 0x12

    const/16 v18, 0x0

    const/16 v23, -0x1

    const/16 v24, 0x0

    move/from16 v20, p2

    move/from16 v22, v1

    move-object/from16 v21, v2

    move-object/from16 v16, v3

    move-object/from16 v19, v17

    move-object/from16 v17, v0

    invoke-direct/range {v13 .. v24}, Lcom/opera/android/suggestion/Suggestion;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lrn9;Ljava/lang/String;ILjava/lang/String;IILjava/lang/Object;)V

    return-object v13

    :cond_bd
    move-object/from16 v17, v0

    new-instance v13, Lcom/opera/android/suggestion/Suggestion;

    const/16 v14, 0x8

    const-string v16, ""

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v22, 0x0

    const/16 v23, -0x1

    const/16 v24, 0x0

    move-object/from16 v21, v16

    move/from16 v20, p2

    invoke-direct/range {v13 .. v24}, Lcom/opera/android/suggestion/Suggestion;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lrn9;Ljava/lang/String;ILjava/lang/String;IILjava/lang/Object;)V

    :cond_d6
    return-object v13
.end method

.method public final b()Ltt2;
    .registers 4

    iget-object v0, p0, Lvr3;->d:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget v0, p0, Lvr3;->a:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lvr3;->a:I

    new-instance v0, Ltt2;

    const/4 v2, 0x4

    invoke-direct {v0, p0, v1, v2}, Ltt2;-><init>(Ljava/lang/Object;IB)V

    return-object v0
.end method

.method public final c()V
    .registers 5

    iget-object v0, p0, Lvr3;->c:Ljava/lang/Object;

    check-cast v0, Landroid/widget/TextView;

    iget v1, p0, Lvr3;->a:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_a

    return-void

    :cond_a
    invoke-virtual {v0}, Landroid/widget/TextView;->getGravity()I

    move-result v1

    iget v3, p0, Lvr3;->a:I

    if-eq v3, v2, :cond_24

    move-object v2, v0

    check-cast v2, Llgl;

    invoke-interface {v2}, Llgl;->l()Z

    move-result v2

    const v3, -0x800008

    and-int/2addr v1, v3

    iget v3, p0, Lvr3;->a:I

    invoke-virtual {p0, v3, v2}, Lvr3;->e(IZ)I

    move-result p0

    or-int/2addr v1, p0

    :cond_24
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V

    return-void
.end method

.method public final d()V
    .registers 2

    const/4 v0, 0x1

    iput-boolean v0, p0, Lvr3;->b:Z

    iget v0, p0, Lvr3;->a:I

    if-nez v0, :cond_16

    iget-object v0, p0, Lvr3;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/api/Callback;

    iget-object p0, p0, Lvr3;->d:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-static {p0}, Lkotlin/collections/CollectionsKt;->k0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object p0

    invoke-interface {v0, p0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    :cond_16
    return-void
.end method

.method public final e(IZ)I
    .registers 6

    const/4 v0, 0x2

    const/4 v1, 0x6

    const/4 v2, 0x5

    if-eq p1, v0, :cond_20

    const/4 v0, 0x3

    if-eq p1, v0, :cond_16

    if-eq p1, v2, :cond_12

    if-eq p1, v1, :cond_e

    const/4 p0, 0x0

    return p0

    :cond_e
    if-eqz p2, :cond_11

    return v0

    :cond_11
    return v2

    :cond_12
    if-eqz p2, :cond_15

    return v2

    :cond_15
    return v0

    :cond_16
    iget-boolean p1, p0, Lvr3;->b:Z

    if-eq p2, p1, :cond_1b

    move v1, v2

    :cond_1b
    invoke-virtual {p0, v1, p2}, Lvr3;->e(IZ)I

    move-result p0

    return p0

    :cond_20
    iget-boolean p1, p0, Lvr3;->b:Z

    if-ne p2, p1, :cond_25

    move v1, v2

    :cond_25
    invoke-virtual {p0, v1, p2}, Lvr3;->e(IZ)I

    move-result p0

    return p0
.end method

.method public final f()V
    .registers 3

    iget-object v0, p0, Lvr3;->c:Ljava/lang/Object;

    check-cast v0, Landroid/view/ViewGroup;

    if-nez v0, :cond_7

    return-void

    :cond_7
    iget-boolean v1, p0, Lvr3;->b:Z

    if-eqz v1, :cond_30

    const/high16 v1, 0x20000

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setDescendantFocusability(I)V

    iget-object v0, p0, Lvr3;->d:Ljava/lang/Object;

    check-cast v0, Landroid/view/View;

    if-eqz v0, :cond_28

    iget-object v1, p0, Lvr3;->c:Ljava/lang/Object;

    check-cast v1, Landroid/view/ViewGroup;

    invoke-static {v1, v0}, Lq9n;->w(Landroid/view/ViewGroup;Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_28

    iget-object p0, p0, Lvr3;->d:Ljava/lang/Object;

    check-cast p0, Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z

    return-void

    :cond_28
    iget-object p0, p0, Lvr3;->c:Ljava/lang/Object;

    check-cast p0, Landroid/view/ViewGroup;

    invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z

    return-void

    :cond_30
    invoke-virtual {v0}, Landroid/view/ViewGroup;->findFocus()Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lvr3;->d:Ljava/lang/Object;

    iget-object p0, p0, Lvr3;->c:Ljava/lang/Object;

    check-cast p0, Landroid/view/ViewGroup;

    const/high16 v0, 0x60000

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setDescendantFocusability(I)V

    return-void
.end method

.method public final g(Landroid/util/AttributeSet;I)V
    .registers 7

    iget-object v0, p0, Lvr3;->c:Ljava/lang/Object;

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    sget-object v2, Lmhh;->b:[I

    const/4 v3, 0x0

    invoke-virtual {v1, p1, v2, p2, v3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p1

    iget p2, p0, Lvr3;->a:I

    invoke-virtual {p1, v3, p2}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v1

    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    if-ne p2, v1, :cond_1b

    return-void

    :cond_1b
    iget p1, p0, Lvr3;->a:I

    if-eq p1, v1, :cond_3f

    iput v1, p0, Lvr3;->a:I

    invoke-virtual {v0}, Landroid/widget/TextView;->getGravity()I

    move-result p1

    iget p2, p0, Lvr3;->a:I

    const/4 v1, 0x1

    if-eq p2, v1, :cond_3c

    move-object p2, v0

    check-cast p2, Llgl;

    invoke-interface {p2}, Llgl;->l()Z

    move-result p2

    const v1, -0x800008

    and-int/2addr p1, v1

    iget v1, p0, Lvr3;->a:I

    invoke-virtual {p0, v1, p2}, Lvr3;->e(IZ)I

    move-result p2

    or-int/2addr p1, p2

    :cond_3c
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setGravity(I)V

    :cond_3f
    invoke-virtual {p0}, Lvr3;->c()V

    return-void
.end method

.method public final h(II)Z
    .registers 7

    iget-object v0, p0, Lvr3;->c:Ljava/lang/Object;

    check-cast v0, Landroid/util/SparseArray;

    invoke-virtual {v0, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lqri;

    if-eqz v0, :cond_30

    iget-boolean v1, p0, Lvr3;->b:Z

    if-eqz v1, :cond_14

    iget-boolean v1, v0, Lqri;->e:Z

    if-eqz v1, :cond_30

    :cond_14
    iget-byte v1, v0, Lqri;->b:B

    iget v2, v0, Lqri;->c:I

    iget v3, p0, Lvr3;->a:I

    if-gt v1, v3, :cond_30

    if-gt v3, v2, :cond_30

    iget v1, v0, Lqri;->d:I

    if-gt p1, v1, :cond_30

    iget-object p0, p0, Lvr3;->d:Ljava/lang/Object;

    check-cast p0, Landroid/util/SparseIntArray;

    invoke-virtual {p0, p2}, Landroid/util/SparseIntArray;->get(I)I

    move-result p0

    iget p1, v0, Lqri;->a:I

    if-ge p0, p1, :cond_30

    const/4 p0, 0x1

    return p0

    :cond_30
    const/4 p0, 0x0

    return p0
.end method

.method public final k()V
    .registers 7

    invoke-virtual {p0}, Lvr3;->l()Z

    move-result v0

    iget-boolean v1, p0, Lvr3;->b:Z

    if-eq v0, v1, :cond_49

    iput-boolean v0, p0, Lvr3;->b:Z

    iget v0, p0, Lvr3;->a:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_12

    const/4 v1, 0x3

    if-ne v0, v1, :cond_15

    :cond_12
    invoke-virtual {p0}, Lvr3;->c()V

    :cond_15
    iget-object p0, p0, Lvr3;->d:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    move v2, v1

    :goto_1f
    if-ge v2, v0, :cond_49

    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Lcom/opera/android/custom_views/FadingTextView;

    const/4 v4, 0x0

    iput-object v4, v3, Lcom/opera/android/custom_views/FadingTextView;->m:Landroid/graphics/LinearGradient;

    invoke-static {v3}, Lcs5;->W(Landroid/view/View;)Z

    invoke-virtual {v3}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f070206

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v4

    float-to-int v4, v4

    iget-object v5, v3, Lcom/opera/android/custom_views/StylingTextView;->l:Lvr3;

    iget-boolean v5, v5, Lvr3;->b:Z

    if-eqz v5, :cond_44

    move v5, v4

    move v4, v1

    goto :goto_45

    :cond_44
    move v5, v1

    :goto_45
    invoke-virtual {v3, v4, v1, v5, v1}, Landroid/view/View;->setPadding(IIII)V

    goto :goto_1f

    :cond_49
    return-void
.end method

.method public final l()Z
    .registers 4

    iget-object p0, p0, Lvr3;->c:Ljava/lang/Object;

    check-cast p0, Landroid/widget/TextView;

    invoke-virtual {p0}, Landroid/widget/TextView;->getTransformationMethod()Landroid/text/method/TransformationMethod;

    move-result-object v0

    instance-of v0, v0, Landroid/text/method/PasswordTransformationMethod;

    const/4 v1, 0x0

    if-eqz v0, :cond_e

    return v1

    :cond_e
    invoke-virtual {p0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {v0}, Lcs5;->J(Ljava/lang/CharSequence;)I

    move-result v0

    const/4 v2, 0x2

    if-ne v0, v2, :cond_25

    invoke-static {p0}, Ll2c;->a(Landroid/content/Context;)I

    move-result v0

    :cond_25
    const/4 p0, 0x1

    if-ne v0, p0, :cond_29

    return p0

    :cond_29
    return v1
.end method

.method public final m(Ljava/lang/CharSequence;)Le5d;
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Le5d;

    const/4 v1, 0x4

    invoke-direct {v0, p0, p1, v1}, Le5d;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    return-object v0
.end method

.method public final n(Ljava/lang/CharSequence;)Ljava/util/List;
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, p0, Lvr3;->d:Ljava/lang/Object;

    check-cast v0, Lv0k;

    invoke-interface {v0, p0, p1}, Lv0k;->f(Lvr3;Ljava/lang/CharSequence;)Ljava/util/Iterator;

    move-result-object p0

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    :goto_10
    move-object v0, p0

    check-cast v0, Lu0k;

    invoke-virtual {v0}, Lu0k;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_23

    invoke-virtual {v0}, Lu0k;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_10

    :cond_23
    invoke-static {p1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method
