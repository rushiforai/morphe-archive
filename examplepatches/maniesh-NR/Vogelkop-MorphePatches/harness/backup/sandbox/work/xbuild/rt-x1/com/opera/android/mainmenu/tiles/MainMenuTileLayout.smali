.class public Lcom/opera/android/mainmenu/tiles/MainMenuTileLayout;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public final a:Landroid/icu/text/BreakIterator;

.field public final b:Lpt1;

.field public c:I

.field public d:I

.field public e:Z

.field public f:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 14
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0, v0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    invoke-static {}, Landroid/icu/text/BreakIterator;->getWordInstance()Landroid/icu/text/BreakIterator;

    move-result-object v1

    iput-object v1, p0, Lcom/opera/android/mainmenu/tiles/MainMenuTileLayout;->a:Landroid/icu/text/BreakIterator;

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const v2, 0x7f0d0261

    invoke-virtual {v1, v2, p0, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const v2, 0x7f0a0149

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object v6, v3

    check-cast v6, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v6, :cond_87

    const v2, 0x7f0a01b5

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object v7, v3

    check-cast v7, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v7, :cond_87

    const v2, 0x7f0a01bd

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object v8, v3

    check-cast v8, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v8, :cond_87

    const v2, 0x7f0a0270

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object v9, v3

    check-cast v9, Landroidx/cardview/widget/CardView;

    if-eqz v9, :cond_87

    const v2, 0x7f0a0275

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/LinearLayout;

    if-eqz v3, :cond_87

    const v2, 0x7f0a0613

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object v10, v3

    check-cast v10, Lcom/google/android/material/progressindicator/CircularProgressIndicator;

    if-eqz v10, :cond_87

    new-instance v4, Lpt1;

    move-object v5, v1

    check-cast v5, Landroid/widget/FrameLayout;

    invoke-direct/range {v4 .. v10}, Lpt1;-><init>(Landroid/widget/FrameLayout;Lcom/opera/android/custom_views/StylingImageView;Lcom/opera/android/custom_views/StylingImageView;Lcom/opera/android/custom_views/StylingTextView;Landroidx/cardview/widget/CardView;Lcom/google/android/material/progressindicator/CircularProgressIndicator;)V

    iput-object v4, p0, Lcom/opera/android/mainmenu/tiles/MainMenuTileLayout;->b:Lpt1;

    sget-object v1, Lkhh;->r:[I

    invoke-virtual {p1, p2, v1, v0, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p1

    invoke-virtual {p1, v0, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p2

    iput p2, p0, Lcom/opera/android/mainmenu/tiles/MainMenuTileLayout;->c:I

    const/4 p2, 0x1

    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p2

    iput p2, p0, Lcom/opera/android/mainmenu/tiles/MainMenuTileLayout;->d:I

    const/4 p2, 0x2

    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p2

    iput-boolean p2, p0, Lcom/opera/android/mainmenu/tiles/MainMenuTileLayout;->e:Z

    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    return-void

    :cond_87
    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v2}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    throw p0
.end method


# virtual methods
.method public final a()V
    .registers 3

    iget-boolean v0, p0, Lcom/opera/android/mainmenu/tiles/MainMenuTileLayout;->e:Z

    iget-object v1, p0, Lcom/opera/android/mainmenu/tiles/MainMenuTileLayout;->b:Lpt1;

    if-eqz v0, :cond_13

    iget-boolean p0, p0, Lcom/opera/android/mainmenu/tiles/MainMenuTileLayout;->f:Z

    if-nez p0, :cond_13

    iget-object p0, v1, Lpt1;->e:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/StylingImageView;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    return-void

    :cond_13
    iget-object p0, v1, Lpt1;->e:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/StylingImageView;

    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public final b()V
    .registers 5

    iget-boolean v0, p0, Lcom/opera/android/mainmenu/tiles/MainMenuTileLayout;->f:Z

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/opera/android/mainmenu/tiles/MainMenuTileLayout;->b:Lpt1;

    if-eqz v0, :cond_17

    iget-object v0, v2, Lpt1;->g:Landroid/view/View;

    check-cast v0, Lcom/google/android/material/progressindicator/CircularProgressIndicator;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, v2, Lpt1;->f:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingImageView;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_27

    :cond_17
    iget-object v0, v2, Lpt1;->g:Landroid/view/View;

    check-cast v0, Lcom/google/android/material/progressindicator/CircularProgressIndicator;

    const/16 v3, 0x8

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, v2, Lpt1;->f:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    :goto_27
    invoke-virtual {p0}, Lcom/opera/android/mainmenu/tiles/MainMenuTileLayout;->a()V

    return-void
.end method

.method public final c()V
    .registers 5

    iget v0, p0, Lcom/opera/android/mainmenu/tiles/MainMenuTileLayout;->d:I

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/opera/android/mainmenu/tiles/MainMenuTileLayout;->b:Lpt1;

    if-eqz v0, :cond_4d

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iget v3, p0, Lcom/opera/android/mainmenu/tiles/MainMenuTileLayout;->d:I

    invoke-virtual {v0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    iget-object v3, p0, Lcom/opera/android/mainmenu/tiles/MainMenuTileLayout;->a:Landroid/icu/text/BreakIterator;

    invoke-virtual {v3, v0}, Landroid/icu/text/BreakIterator;->setText(Ljava/lang/String;)V

    invoke-virtual {v3}, Landroid/icu/text/BreakIterator;->next()I

    invoke-virtual {v3}, Landroid/icu/text/BreakIterator;->next()I

    move-result v0

    const/4 v3, -0x1

    if-ne v0, v3, :cond_32

    iget-object v0, v2, Lpt1;->c:Landroid/view/View;

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    sget-object v1, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    iget-object v0, v2, Lpt1;->c:Landroid/view/View;

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMaxLines(I)V

    goto :goto_43

    :cond_32
    iget-object v0, v2, Lpt1;->c:Landroid/view/View;

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    iget-object v0, v2, Lpt1;->c:Landroid/view/View;

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    const v1, 0x7fffffff

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMaxLines(I)V

    :goto_43
    iget-object v0, v2, Lpt1;->c:Landroid/view/View;

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    iget p0, p0, Lcom/opera/android/mainmenu/tiles/MainMenuTileLayout;->d:I

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(I)V

    return-void

    :cond_4d
    iget-object p0, v2, Lpt1;->c:Landroid/view/View;

    check-cast p0, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final onFinishInflate()V
    .registers 4

    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    iget-object v0, p0, Lcom/opera/android/mainmenu/tiles/MainMenuTileLayout;->b:Lpt1;

    iget-object v0, v0, Lpt1;->f:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingImageView;

    iget v1, p0, Lcom/opera/android/mainmenu/tiles/MainMenuTileLayout;->c:I

    if-eqz v1, :cond_18

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    iget v2, p0, Lcom/opera/android/mainmenu/tiles/MainMenuTileLayout;->c:I

    invoke-static {v2, v1}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    goto :goto_19

    :cond_18
    const/4 v1, 0x0

    :goto_19
    invoke-virtual {v0, v1}, Lcom/opera/android/custom_views/StylingImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0}, Lcom/opera/android/mainmenu/tiles/MainMenuTileLayout;->a()V

    invoke-virtual {p0}, Lcom/opera/android/mainmenu/tiles/MainMenuTileLayout;->b()V

    invoke-virtual {p0}, Lcom/opera/android/mainmenu/tiles/MainMenuTileLayout;->c()V

    return-void
.end method

.method public final onHoverChanged(Z)V
    .registers 3

    invoke-super {p0, p1}, Landroid/view/View;->onHoverChanged(Z)V

    iget-object v0, p0, Lcom/opera/android/mainmenu/tiles/MainMenuTileLayout;->b:Lpt1;

    if-eqz p1, :cond_1a

    iget-object p1, v0, Lpt1;->d:Ljava/lang/Object;

    check-cast p1, Landroidx/cardview/widget/CardView;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    const v0, 0x7f06026c

    invoke-virtual {p0, v0}, Landroid/content/Context;->getColor(I)I

    move-result p0

    invoke-virtual {p1, p0}, Landroidx/cardview/widget/CardView;->b(I)V

    return-void

    :cond_1a
    iget-object p0, v0, Lpt1;->d:Ljava/lang/Object;

    check-cast p0, Landroidx/cardview/widget/CardView;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroidx/cardview/widget/CardView;->b(I)V

    return-void
.end method
