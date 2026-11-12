.class public final Lcom/opera/android/widget/FaqItemView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u0007\u0018\u00002\u00020\u0001:\u0001\u0002\u00a8\u0006\u0003"
    }
    d2 = {
        "Lcom/opera/android/widget/FaqItemView;",
        "Landroidx/constraintlayout/widget/ConstraintLayout;",
        "pp8",
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
.field public static final synthetic t:I


# instance fields
.field public final p:Lpp8;

.field public q:Lvs;

.field public r:Lh63;

.field public s:Lh63;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 7
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0, v0}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    sget-object v1, Lkhh;->n:[I

    invoke-virtual {p1, p2, v1, v0, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p1

    :try_start_a
    new-instance p2, Lpp8;

    const/4 v1, 0x2

    invoke-virtual {p1, v1, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    invoke-virtual {p1, v0, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v2

    const/4 v3, 0x1

    invoke-virtual {p1, v3, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v0

    invoke-direct {p2, v1, v2, v0}, Lpp8;-><init>(IIZ)V
    :try_end_1d
    .catchall {:try_start_a .. :try_end_1d} :catchall_23

    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    iput-object p2, p0, Lcom/opera/android/widget/FaqItemView;->p:Lpp8;

    return-void

    :catchall_23
    move-exception p0

    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    throw p0
.end method


# virtual methods
.method public final onAttachedToWindow()V
    .registers 7

    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    iget-object v0, p0, Lcom/opera/android/widget/FaqItemView;->q:Lvs;

    const/4 v1, 0x0

    if-nez v0, :cond_9

    move-object v0, v1

    :cond_9
    iget-object v0, v0, Lvs;->e:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    new-instance v2, Lh63;

    invoke-direct {v2, p0, v0}, Lh63;-><init>(Lcom/opera/android/widget/FaqItemView;Lcom/opera/android/custom_views/StylingTextView;)V

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    invoke-virtual {v0}, Lyq1;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    const/16 v4, 0x8

    const/4 v5, 0x0

    if-eqz v3, :cond_26

    invoke-interface {v3}, Ljava/lang/CharSequence;->length()I

    move-result v3

    if-eqz v3, :cond_26

    move v3, v5

    goto :goto_27

    :cond_26
    move v3, v4

    :goto_27
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    iput-object v2, p0, Lcom/opera/android/widget/FaqItemView;->r:Lh63;

    iget-object v0, p0, Lcom/opera/android/widget/FaqItemView;->q:Lvs;

    if-eqz v0, :cond_31

    move-object v1, v0

    :cond_31
    iget-object v0, v1, Lvs;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    new-instance v1, Lh63;

    invoke-direct {v1, p0, v0}, Lh63;-><init>(Lcom/opera/android/widget/FaqItemView;Lcom/opera/android/custom_views/StylingTextView;)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    invoke-virtual {v0}, Lyq1;->getText()Ljava/lang/CharSequence;

    move-result-object v2

    if-eqz v2, :cond_4a

    invoke-interface {v2}, Ljava/lang/CharSequence;->length()I

    move-result v2

    if-eqz v2, :cond_4a

    move v4, v5

    :cond_4a
    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    iput-object v1, p0, Lcom/opera/android/widget/FaqItemView;->s:Lh63;

    return-void
.end method

.method public final onDetachedFromWindow()V
    .registers 4

    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    iget-object v0, p0, Lcom/opera/android/widget/FaqItemView;->r:Lh63;

    const/4 v1, 0x0

    if-eqz v0, :cond_14

    iget-object v2, p0, Lcom/opera/android/widget/FaqItemView;->q:Lvs;

    if-nez v2, :cond_d

    move-object v2, v1

    :cond_d
    iget-object v2, v2, Lvs;->e:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->removeTextChangedListener(Landroid/text/TextWatcher;)V

    :cond_14
    iput-object v1, p0, Lcom/opera/android/widget/FaqItemView;->r:Lh63;

    iget-object v0, p0, Lcom/opera/android/widget/FaqItemView;->s:Lh63;

    if-eqz v0, :cond_26

    iget-object v2, p0, Lcom/opera/android/widget/FaqItemView;->q:Lvs;

    if-nez v2, :cond_1f

    move-object v2, v1

    :cond_1f
    iget-object v2, v2, Lvs;->d:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->removeTextChangedListener(Landroid/text/TextWatcher;)V

    :cond_26
    iput-object v1, p0, Lcom/opera/android/widget/FaqItemView;->s:Lh63;

    return-void
.end method

.method public final onFinishInflate()V
    .registers 11

    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0d013d

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const v1, 0x7f0a041b

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object v6, v3

    check-cast v6, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v6, :cond_7d

    const v1, 0x7f0a041d

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object v7, v3

    check-cast v7, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v7, :cond_7d

    const v1, 0x7f0a041e

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object v8, v3

    check-cast v8, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v8, :cond_7d

    new-instance v4, Lvs;

    move-object v5, v0

    check-cast v5, Landroidx/constraintlayout/widget/ConstraintLayout;

    const/16 v9, 0xb

    invoke-direct/range {v4 .. v9}, Lvs;-><init>(Landroid/view/ViewGroup;Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v4, p0, Lcom/opera/android/widget/FaqItemView;->q:Lvs;

    iget-object v0, p0, Lcom/opera/android/widget/FaqItemView;->p:Lpp8;

    iget v1, v0, Lpp8;->a:I

    const-string v3, ""

    if-eqz v1, :cond_52

    invoke-virtual {v8, v1}, Landroid/widget/TextView;->setText(I)V

    goto :goto_55

    :cond_52
    invoke-virtual {v8, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_55
    iget v1, v0, Lpp8;->b:I

    iget-object v4, p0, Lcom/opera/android/widget/FaqItemView;->q:Lvs;

    const/4 v5, 0x0

    if-nez v4, :cond_5d

    move-object v4, v5

    :cond_5d
    iget-object v4, v4, Lvs;->d:Ljava/lang/Object;

    check-cast v4, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v1, :cond_67

    invoke-virtual {v4, v1}, Landroid/widget/TextView;->setText(I)V

    goto :goto_6a

    :cond_67
    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_6a
    iget-boolean v0, v0, Lpp8;->c:Z

    iget-object p0, p0, Lcom/opera/android/widget/FaqItemView;->q:Lvs;

    if-eqz p0, :cond_71

    move-object v5, p0

    :cond_71
    iget-object p0, v5, Lvs;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/StylingImageView;

    if-nez v0, :cond_79

    const/16 v2, 0x8

    :cond_79
    invoke-virtual {p0, v2}, Landroid/view/View;->setVisibility(I)V

    return-void

    :cond_7d
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string v0, "Missing required view with ID: "

    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-void
.end method
