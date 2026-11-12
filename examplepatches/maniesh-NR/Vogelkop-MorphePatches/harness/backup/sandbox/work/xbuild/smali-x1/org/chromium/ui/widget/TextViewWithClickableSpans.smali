.class public Lorg/chromium/ui/widget/TextViewWithClickableSpans;
.super Lorg/chromium/ui/widget/TextViewWithLeading;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# static fields
.field public static final synthetic l:I


# instance fields
.field public h:Landroid/widget/PopupMenu;

.field public i:I

.field public final j:Lz39;

.field public final k:Lbp;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 9

    invoke-direct {p0, p1, p2}, Lorg/chromium/ui/widget/TextViewWithLeading;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 v0, -0x1

    iput v0, p0, Lorg/chromium/ui/widget/TextViewWithClickableSpans;->i:I

    sget-object v0, Lqhh;->c:[I

    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p2

    const v0, 0x7f0809c3

    invoke-static {v0, p1}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f07092d

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    const v2, 0x7f0601ab

    invoke-virtual {p1, v2}, Landroid/content/Context;->getColor(I)I

    move-result v2

    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object p1

    new-instance v3, Landroid/util/TypedValue;

    invoke-direct {v3}, Landroid/util/TypedValue;-><init>()V

    const v4, 0x7f0404d8

    const/4 v5, 0x1

    invoke-virtual {p1, v4, v3, v5}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    move-result p1

    if-eqz p1, :cond_3b

    iget p1, v3, Landroid/util/TypedValue;->data:I

    goto :goto_3c

    :cond_3b
    move p1, v2

    :goto_3c
    const/4 v3, 0x0

    invoke-virtual {p2, v3, p1}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p1

    if-eq p1, v2, :cond_57

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v4, 0x7f07092c

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    check-cast v4, Landroid/graphics/drawable/GradientDrawable;

    invoke-virtual {v4, v2, p1}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    :cond_57
    new-instance p1, Lbp;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput v1, p1, Lbp;->a:I

    iput-object v0, p1, Lbp;->b:Ljava/lang/Object;

    iput-object p1, p0, Lorg/chromium/ui/widget/TextViewWithClickableSpans;->k:Lbp;

    new-instance p1, Lz39;

    invoke-direct {p1, p0, v5}, Lz39;-><init>(Landroid/view/View;B)V

    iput-object p1, p0, Lorg/chromium/ui/widget/TextViewWithClickableSpans;->j:Lz39;

    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    invoke-virtual {p0, v3}, Landroid/view/View;->setSaveEnabled(Z)V

    invoke-super {p0, p0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    new-instance p1, Lzp2;

    const/16 p2, 0x8

    invoke-direct {p1, p0, p2}, Lzp2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, p1}, Landroid/view/View;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    return-void
.end method


# virtual methods
.method public final onDraw(Landroid/graphics/Canvas;)V
    .registers 14

    invoke-virtual {p0}, Lorg/chromium/ui/widget/TextViewWithClickableSpans;->s()[Landroid/text/style/ClickableSpan;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/chromium/ui/widget/TextViewWithClickableSpans;->t([Landroid/text/style/ClickableSpan;)Z

    move-result v1

    if-eqz v1, :cond_ca

    invoke-virtual {p0}, Lyq1;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    instance-of v2, v1, Landroid/text/Spanned;

    if-eqz v2, :cond_ca

    check-cast v1, Landroid/text/Spanned;

    invoke-virtual {p0}, Landroid/widget/TextView;->getTotalPaddingLeft()I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {p0}, Landroid/widget/TextView;->getTotalPaddingTop()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {p1, v2, v3}, Landroid/graphics/Canvas;->translate(FF)V

    iget v2, p0, Lorg/chromium/ui/widget/TextViewWithClickableSpans;->i:I

    aget-object v0, v0, v2

    invoke-virtual {p0}, Landroid/widget/TextView;->getLayout()Landroid/text/Layout;

    move-result-object v4

    iget-object v2, p0, Lorg/chromium/ui/widget/TextViewWithClickableSpans;->k:Lbp;

    iget v8, v2, Lbp;->a:I

    if-nez v4, :cond_32

    move-object v3, p1

    goto/16 :goto_b7

    :cond_32
    invoke-interface {v1, v0}, Landroid/text/Spanned;->getSpanStart(Ljava/lang/Object;)I

    move-result v3

    invoke-interface {v1, v0}, Landroid/text/Spanned;->getSpanEnd(Ljava/lang/Object;)I

    move-result v0

    invoke-virtual {v4, v3}, Landroid/text/Layout;->getLineForOffset(I)I

    move-result v5

    invoke-virtual {v4, v0}, Landroid/text/Layout;->getLineForOffset(I)I

    move-result v1

    invoke-virtual {v4, v5}, Landroid/text/Layout;->getParagraphDirection(I)I

    move-result v6

    const/4 v9, 0x0

    const/4 v10, 0x1

    const/4 v11, -0x1

    if-ne v6, v11, :cond_4d

    move v6, v10

    goto :goto_4e

    :cond_4d
    move v6, v9

    :goto_4e
    invoke-virtual {v4, v3}, Landroid/text/Layout;->getPrimaryHorizontal(I)F

    move-result v3

    if-eqz v6, :cond_56

    neg-int v7, v8

    goto :goto_57

    :cond_56
    move v7, v8

    :goto_57
    int-to-float v7, v7

    sub-float/2addr v3, v7

    float-to-int v3, v3

    invoke-virtual {v4, v0}, Landroid/text/Layout;->getPrimaryHorizontal(I)F

    move-result v0

    if-eqz v6, :cond_62

    neg-int v6, v8

    goto :goto_63

    :cond_62
    move v6, v8

    :goto_63
    int-to-float v6, v6

    add-float/2addr v0, v6

    float-to-int v7, v0

    move v6, v3

    move-object v3, p1

    if-ne v5, v1, :cond_6e

    invoke-virtual/range {v2 .. v7}, Lbp;->q(Landroid/graphics/Canvas;Landroid/text/Layout;III)V

    goto :goto_b7

    :cond_6e
    move p1, v7

    invoke-virtual {v4, v5}, Landroid/text/Layout;->getParagraphDirection(I)I

    move-result v0

    if-ne v0, v11, :cond_76

    move v9, v10

    :cond_76
    if-eqz v9, :cond_80

    invoke-virtual {v4, v5}, Landroid/text/Layout;->getLineLeft(I)F

    move-result v0

    float-to-int v0, v0

    sub-int/2addr v0, v8

    :goto_7e
    move v7, v0

    goto :goto_87

    :cond_80
    invoke-virtual {v4, v5}, Landroid/text/Layout;->getLineRight(I)F

    move-result v0

    float-to-int v0, v0

    add-int/2addr v0, v8

    goto :goto_7e

    :goto_87
    invoke-virtual/range {v2 .. v7}, Lbp;->q(Landroid/graphics/Canvas;Landroid/text/Layout;III)V

    add-int/2addr v5, v10

    :goto_8b
    if-ge v5, v1, :cond_a1

    invoke-virtual {v4, v5}, Landroid/text/Layout;->getLineLeft(I)F

    move-result v0

    float-to-int v0, v0

    sub-int v6, v0, v8

    invoke-virtual {v4, v5}, Landroid/text/Layout;->getLineRight(I)F

    move-result v0

    float-to-int v0, v0

    add-int v7, v0, v8

    invoke-virtual/range {v2 .. v7}, Lbp;->q(Landroid/graphics/Canvas;Landroid/text/Layout;III)V

    add-int/lit8 v5, v5, 0x1

    goto :goto_8b

    :cond_a1
    if-eqz v9, :cond_ad

    invoke-virtual {v4, v1}, Landroid/text/Layout;->getLineRight(I)F

    move-result v0

    float-to-int v0, v0

    add-int/2addr v0, v8

    :goto_a9
    move v7, p1

    move v6, v0

    move v5, v1

    goto :goto_b4

    :cond_ad
    invoke-virtual {v4, v1}, Landroid/text/Layout;->getLineLeft(I)F

    move-result v0

    float-to-int v0, v0

    sub-int/2addr v0, v8

    goto :goto_a9

    :goto_b4
    invoke-virtual/range {v2 .. v7}, Lbp;->q(Landroid/graphics/Canvas;Landroid/text/Layout;III)V

    :goto_b7
    invoke-virtual {p0}, Landroid/widget/TextView;->getTotalPaddingLeft()I

    move-result p1

    neg-int p1, p1

    int-to-float p1, p1

    invoke-virtual {p0}, Landroid/widget/TextView;->getTotalPaddingTop()I

    move-result v0

    neg-int v0, v0

    int-to-float v0, v0

    invoke-virtual {v3, p1, v0}, Landroid/graphics/Canvas;->translate(FF)V

    invoke-super {p0, v3}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    return-void

    :cond_ca
    move-object v3, p1

    invoke-super {p0, v3}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    return-void
.end method

.method public final onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .registers 4

    invoke-super {p0, p1}, Landroid/view/View;->onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    invoke-virtual {p0}, Landroid/view/View;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object p1

    if-nez p1, :cond_27

    invoke-virtual {p0}, Lyq1;->getText()Ljava/lang/CharSequence;

    move-result-object p1

    instance-of v0, p1, Landroid/text/Spanned;

    if-eqz v0, :cond_27

    check-cast p1, Landroid/text/Spanned;

    invoke-virtual {p0}, Lorg/chromium/ui/widget/TextViewWithClickableSpans;->s()[Landroid/text/style/ClickableSpan;

    move-result-object p0

    if-eqz p0, :cond_27

    new-instance v0, Landroid/text/SpannableStringBuilder;

    invoke-direct {v0, p1}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    array-length p1, p0

    const/4 v0, 0x0

    :goto_20
    if-ge v0, p1, :cond_27

    aget-object v1, p0, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_20

    :cond_27
    return-void
.end method

.method public final onLongClick(Landroid/view/View;)Z
    .registers 2

    invoke-static {}, Lorg/chromium/ui/accessibility/AccessibilityState;->d()Z

    move-result p1

    if-eqz p1, :cond_b

    invoke-virtual {p0}, Lorg/chromium/ui/widget/TextViewWithClickableSpans;->u()V

    const/4 p0, 0x1

    return p0

    :cond_b
    const/4 p0, 0x0

    return p0
.end method

.method public final onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 20

    invoke-virtual/range {p0 .. p0}, Lyq1;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    instance-of v1, v0, Landroid/text/Spanned;

    if-eqz v1, :cond_b9

    check-cast v0, Landroid/text/Spanned;

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    float-to-int v1, v1

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    float-to-int v4, v4

    invoke-virtual/range {p0 .. p0}, Landroid/widget/TextView;->getTotalPaddingLeft()I

    move-result v5

    sub-int/2addr v1, v5

    invoke-virtual/range {p0 .. p0}, Landroid/widget/TextView;->getTotalPaddingTop()I

    move-result v5

    sub-int/2addr v4, v5

    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getScrollX()I

    move-result v5

    add-int/2addr v5, v1

    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getScrollY()I

    move-result v1

    add-int/2addr v1, v4

    invoke-virtual/range {p0 .. p0}, Landroid/widget/TextView;->getLayout()Landroid/text/Layout;

    move-result-object v4

    if-nez v4, :cond_33

    const/4 v2, 0x0

    :goto_2f
    const/16 v16, 0x0

    goto/16 :goto_bd

    :cond_33
    invoke-virtual {v4, v1}, Landroid/text/Layout;->getLineForVertical(I)I

    move-result v1

    int-to-float v6, v5

    invoke-virtual {v4, v1, v6}, Landroid/text/Layout;->getOffsetForHorizontal(IF)I

    move-result v6

    const-class v7, Landroid/text/style/ClickableSpan;

    invoke-interface {v0, v6, v6, v7}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [Landroid/text/style/ClickableSpan;

    array-length v6, v6

    if-lez v6, :cond_49

    const/4 v2, 0x1

    goto :goto_2f

    :cond_49
    invoke-virtual {v4, v1}, Landroid/text/Layout;->getLineStart(I)I

    move-result v6

    invoke-virtual {v4, v1}, Landroid/text/Layout;->getLineEnd(I)I

    move-result v8

    invoke-virtual {v4, v1}, Landroid/text/Layout;->getParagraphDirection(I)I

    move-result v9

    const/4 v10, -0x1

    if-ne v9, v10, :cond_5a

    const/4 v9, 0x1

    goto :goto_5b

    :cond_5a
    const/4 v9, 0x0

    :goto_5b
    invoke-interface {v0, v6, v8, v7}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [Landroid/text/style/ClickableSpan;

    array-length v10, v7

    const/4 v11, 0x0

    :goto_63
    if-ge v11, v10, :cond_b9

    aget-object v12, v7, v11

    invoke-interface {v0, v12}, Landroid/text/Spanned;->getSpanStart(Ljava/lang/Object;)I

    move-result v13

    invoke-interface {v0, v12}, Landroid/text/Spanned;->getSpanEnd(Ljava/lang/Object;)I

    move-result v12

    if-ge v13, v6, :cond_7d

    if-eqz v9, :cond_78

    invoke-virtual {v4, v1}, Landroid/text/Layout;->getLineRight(I)F

    move-result v13

    goto :goto_81

    :cond_78
    invoke-virtual {v4, v1}, Landroid/text/Layout;->getLineLeft(I)F

    move-result v13

    goto :goto_81

    :cond_7d
    invoke-virtual {v4, v13}, Landroid/text/Layout;->getPrimaryHorizontal(I)F

    move-result v13

    :goto_81
    if-lt v12, v8, :cond_8f

    if-eqz v9, :cond_8a

    invoke-virtual {v4, v1}, Landroid/text/Layout;->getLineLeft(I)F

    move-result v12

    goto :goto_93

    :cond_8a
    invoke-virtual {v4, v1}, Landroid/text/Layout;->getLineRight(I)F

    move-result v12

    goto :goto_93

    :cond_8f
    invoke-virtual {v4, v12}, Landroid/text/Layout;->getPrimaryHorizontal(I)F

    move-result v12

    :goto_93
    int-to-double v14, v5

    const/16 v16, 0x0

    invoke-static {v13, v12}, Ljava/lang/Math;->min(FF)F

    move-result v2

    move-object/from16 v17, v4

    float-to-double v3, v2

    invoke-static {v3, v4}, Ljava/lang/Math;->floor(D)D

    move-result-wide v2

    cmpl-double v2, v14, v2

    if-ltz v2, :cond_b4

    invoke-static {v13, v12}, Ljava/lang/Math;->max(FF)F

    move-result v2

    float-to-double v2, v2

    invoke-static {v2, v3}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v2

    cmpg-double v2, v14, v2

    if-gtz v2, :cond_b4

    const/4 v2, 0x1

    goto :goto_bd

    :cond_b4
    add-int/lit8 v11, v11, 0x1

    move-object/from16 v4, v17

    goto :goto_63

    :cond_b9
    const/16 v16, 0x0

    move/from16 v2, v16

    :goto_bd
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    if-eqz v2, :cond_c8

    invoke-super/range {p0 .. p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0

    :cond_c8
    const/4 v1, 0x1

    if-eq v0, v1, :cond_eb

    invoke-static {}, Lorg/chromium/ui/accessibility/AccessibilityState;->d()Z

    move-result v0

    if-eqz v0, :cond_eb

    invoke-virtual/range {p0 .. p0}, Lorg/chromium/ui/widget/TextViewWithClickableSpans;->s()[Landroid/text/style/ClickableSpan;

    move-result-object v0

    if-eqz v0, :cond_ea

    array-length v2, v0

    if-eqz v2, :cond_ea

    array-length v2, v0

    if-ne v2, v1, :cond_e5

    aget-object v0, v0, v16

    move-object/from16 v2, p0

    invoke-virtual {v0, v2}, Landroid/text/style/ClickableSpan;->onClick(Landroid/view/View;)V

    goto :goto_ea

    :cond_e5
    move-object/from16 v2, p0

    invoke-virtual {v2}, Lorg/chromium/ui/widget/TextViewWithClickableSpans;->u()V

    :cond_ea
    :goto_ea
    return v1

    :cond_eb
    return v16
.end method

.method public final performAccessibilityAction(ILandroid/os/Bundle;)Z
    .registers 4

    const/16 v0, 0x10

    if-ne p1, v0, :cond_1c

    invoke-virtual {p0}, Lorg/chromium/ui/widget/TextViewWithClickableSpans;->s()[Landroid/text/style/ClickableSpan;

    move-result-object p1

    const/4 p2, 0x1

    if-eqz p1, :cond_1b

    array-length v0, p1

    if-eqz v0, :cond_1b

    array-length v0, p1

    if-ne v0, p2, :cond_18

    const/4 v0, 0x0

    aget-object p1, p1, v0

    invoke-virtual {p1, p0}, Landroid/text/style/ClickableSpan;->onClick(Landroid/view/View;)V

    goto :goto_1b

    :cond_18
    invoke-virtual {p0}, Lorg/chromium/ui/widget/TextViewWithClickableSpans;->u()V

    :cond_1b
    :goto_1b
    return p2

    :cond_1c
    invoke-super {p0, p1, p2}, Landroid/view/View;->performAccessibilityAction(ILandroid/os/Bundle;)Z

    move-result p0

    return p0
.end method

.method public final s()[Landroid/text/style/ClickableSpan;
    .registers 4

    invoke-virtual {p0}, Lyq1;->getText()Ljava/lang/CharSequence;

    move-result-object p0

    instance-of v0, p0, Landroid/text/Spanned;

    if-eqz v0, :cond_18

    check-cast p0, Landroid/text/Spanned;

    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    const-class v1, Landroid/text/style/ClickableSpan;

    const/4 v2, 0x0

    invoke-interface {p0, v2, v0, v1}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Landroid/text/style/ClickableSpan;

    return-object p0

    :cond_18
    const/4 p0, 0x0

    return-object p0
.end method

.method public final t([Landroid/text/style/ClickableSpan;)Z
    .registers 3

    if-eqz p1, :cond_e

    array-length v0, p1

    if-lez v0, :cond_e

    iget p0, p0, Lorg/chromium/ui/widget/TextViewWithClickableSpans;->i:I

    if-ltz p0, :cond_e

    array-length p1, p1

    if-ge p0, p1, :cond_e

    const/4 p0, 0x1

    return p0

    :cond_e
    const/4 p0, 0x0

    return p0
.end method

.method public final u()V
    .registers 10

    invoke-virtual {p0}, Lorg/chromium/ui/widget/TextViewWithClickableSpans;->s()[Landroid/text/style/ClickableSpan;

    move-result-object v0

    if-eqz v0, :cond_53

    array-length v1, v0

    if-eqz v1, :cond_53

    iget-object v1, p0, Lorg/chromium/ui/widget/TextViewWithClickableSpans;->h:Landroid/widget/PopupMenu;

    if-nez v1, :cond_53

    invoke-virtual {p0}, Lyq1;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    check-cast v1, Landroid/text/Spanned;

    new-instance v2, Landroid/widget/PopupMenu;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3, p0}, Landroid/widget/PopupMenu;-><init>(Landroid/content/Context;Landroid/view/View;)V

    iput-object v2, p0, Lorg/chromium/ui/widget/TextViewWithClickableSpans;->h:Landroid/widget/PopupMenu;

    invoke-virtual {v2}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v2

    array-length v3, v0

    const/4 v4, 0x0

    :goto_24
    if-ge v4, v3, :cond_44

    aget-object v5, v0, v4

    invoke-interface {v1, v5}, Landroid/text/Spanned;->getSpanStart(Ljava/lang/Object;)I

    move-result v6

    invoke-interface {v1, v5}, Landroid/text/Spanned;->getSpanEnd(Ljava/lang/Object;)I

    move-result v7

    invoke-interface {v1, v6, v7}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v6

    invoke-interface {v2, v6}, Landroid/view/Menu;->add(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v6

    new-instance v7, Ljsk;

    const/4 v8, 0x2

    invoke-direct {v7, p0, v5, v8}, Ljsk;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {v6, v7}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    add-int/lit8 v4, v4, 0x1

    goto :goto_24

    :cond_44
    iget-object v0, p0, Lorg/chromium/ui/widget/TextViewWithClickableSpans;->h:Landroid/widget/PopupMenu;

    new-instance v1, Lykl;

    invoke-direct {v1, p0}, Lykl;-><init>(Lorg/chromium/ui/widget/TextViewWithClickableSpans;)V

    invoke-virtual {v0, v1}, Landroid/widget/PopupMenu;->setOnDismissListener(Landroid/widget/PopupMenu$OnDismissListener;)V

    iget-object p0, p0, Lorg/chromium/ui/widget/TextViewWithClickableSpans;->h:Landroid/widget/PopupMenu;

    invoke-virtual {p0}, Landroid/widget/PopupMenu;->show()V

    :cond_53
    return-void
.end method

.method public final v(I)Z
    .registers 5

    invoke-virtual {p0}, Lorg/chromium/ui/widget/TextViewWithClickableSpans;->s()[Landroid/text/style/ClickableSpan;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/chromium/ui/widget/TextViewWithClickableSpans;->t([Landroid/text/style/ClickableSpan;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_10

    iget v1, p0, Lorg/chromium/ui/widget/TextViewWithClickableSpans;->i:I

    aget-object v1, v0, v1

    goto :goto_11

    :cond_10
    move-object v1, v2

    :goto_11
    iput p1, p0, Lorg/chromium/ui/widget/TextViewWithClickableSpans;->i:I

    invoke-virtual {p0, v0}, Lorg/chromium/ui/widget/TextViewWithClickableSpans;->t([Landroid/text/style/ClickableSpan;)Z

    move-result p1

    if-nez p1, :cond_26

    const/4 p1, -0x1

    iput p1, p0, Lorg/chromium/ui/widget/TextViewWithClickableSpans;->i:I

    if-eqz v1, :cond_24

    invoke-virtual {p0, v2}, Landroid/view/View;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    :cond_24
    const/4 p0, 0x0

    return p0

    :cond_26
    iget p1, p0, Lorg/chromium/ui/widget/TextViewWithClickableSpans;->i:I

    aget-object p1, v0, p1

    iget-object p1, p0, Lorg/chromium/ui/widget/TextViewWithClickableSpans;->j:Lz39;

    invoke-virtual {p0, p1}, Landroid/view/View;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    const/4 p0, 0x1

    return p0
.end method
