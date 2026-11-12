.class public final Lcom/opera/android/custom_views/AnimationEmptyListView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u0008\u0007\u0018\u00002\u00020\u0001\u00a8\u0006\u0002"
    }
    d2 = {
        "Lcom/opera/android/custom_views/AnimationEmptyListView;",
        "Landroid/widget/FrameLayout;",
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
.field public static final synthetic e:I


# instance fields
.field public final a:Lov0;

.field public b:I

.field public c:I

.field public d:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 121
    const/16 v0, 0xc

    invoke-direct {p0, p1, p2, v0}, Lcom/opera/android/custom_views/AnimationEmptyListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 9

    const/4 v0, 0x2

    and-int/2addr p3, v0

    const/4 v1, 0x0

    if-eqz p3, :cond_6

    move-object p2, v1

    :cond_6
    const/4 p3, 0x0

    invoke-direct {p0, p1, p2, p3, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v2

    const v3, 0x7f0d0121

    invoke-virtual {v2, v3, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    const v2, 0x7f0a00f2

    invoke-static {v2, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/opera/android/widget/ThemeableLottieAnimationView;

    if-eqz v3, :cond_67

    const v2, 0x7f0a06b5

    invoke-static {v2, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v4, :cond_67

    new-instance v1, Lov0;

    const/16 v2, 0xc

    invoke-direct {v1, p0, v3, v4, v2}, Lov0;-><init>(Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v1, p0, Lcom/opera/android/custom_views/AnimationEmptyListView;->a:Lov0;

    const/4 v1, -0x1

    iput v1, p0, Lcom/opera/android/custom_views/AnimationEmptyListView;->c:I

    new-instance v2, Lu7;

    const/16 v4, 0x9

    invoke-direct {v2, p0, v4}, Lu7;-><init>(Ljava/lang/Object;B)V

    invoke-static {v3, v2}, Lq9n;->e(Landroid/view/View;Lr8n;)V

    invoke-virtual {v2, v3}, Lu7;->a(Landroid/view/View;)V

    if-eqz p2, :cond_66

    sget-object v2, Lkhh;->c:[I

    invoke-virtual {p1, p2, v2, p3, p3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p1

    invoke-virtual {p1, v0, p3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p2

    invoke-virtual {p0, p2}, Lcom/opera/android/custom_views/AnimationEmptyListView;->c(I)V

    invoke-virtual {p1, p3, p3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p2

    invoke-virtual {p0, p2}, Lcom/opera/android/custom_views/AnimationEmptyListView;->b(I)V

    const/4 p2, 0x1

    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result p2

    if-lt p2, v1, :cond_61

    move v1, p2

    :cond_61
    iput v1, p0, Lcom/opera/android/custom_views/AnimationEmptyListView;->c:I

    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    :cond_66
    return-void

    :cond_67
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v2}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    throw v1
.end method


# virtual methods
.method public final a()V
    .registers 3

    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_18

    iget-object v0, p0, Lcom/opera/android/custom_views/AnimationEmptyListView;->a:Lov0;

    iget-object v1, v0, Lov0;->c:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/widget/ThemeableLottieAnimationView;

    iget p0, p0, Lcom/opera/android/custom_views/AnimationEmptyListView;->c:I

    invoke-virtual {v1, p0}, Ln2d;->p(I)V

    iget-object p0, v0, Lov0;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/widget/ThemeableLottieAnimationView;

    invoke-virtual {p0}, Lcom/opera/android/widget/LottieAnimationView;->h()V

    :cond_18
    return-void
.end method

.method public final b(I)V
    .registers 8

    iget v0, p0, Lcom/opera/android/custom_views/AnimationEmptyListView;->b:I

    if-ne p1, v0, :cond_5

    return-void

    :cond_5
    iput p1, p0, Lcom/opera/android/custom_views/AnimationEmptyListView;->b:I

    iget-object v0, p0, Lcom/opera/android/custom_views/AnimationEmptyListView;->a:Lov0;

    iget-object v1, v0, Lov0;->c:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/widget/ThemeableLottieAnimationView;

    iget-object v0, v0, Lov0;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/widget/ThemeableLottieAnimationView;

    invoke-virtual {v1, p1}, Ln2d;->j(I)V

    new-instance p1, Ldvb;

    const-string v1, "IconTheme"

    const-string v2, "**"

    filled-new-array {v2, v1, v2}, [Ljava/lang/String;

    move-result-object v1

    invoke-direct {p1, v1}, Ldvb;-><init>([Ljava/lang/String;)V

    sget-object v1, Lk3d;->a:Landroid/graphics/PointF;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    new-instance v4, Lne1;

    const/4 v5, 0x0

    invoke-direct {v4, p0, v5}, Lne1;-><init>(Lcom/opera/android/custom_views/AnimationEmptyListView;B)V

    invoke-virtual {v0, p1, v3, v4}, Lcom/opera/android/widget/ThemeableLottieAnimationView;->v(Ldvb;Ljava/lang/Object;Lykj;)V

    new-instance p1, Ldvb;

    const-string v3, "IconThemeStroke"

    filled-new-array {v2, v3, v2}, [Ljava/lang/String;

    move-result-object v2

    invoke-direct {p1, v2}, Ldvb;-><init>([Ljava/lang/String;)V

    const/4 v2, 0x2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    new-instance v3, Lne1;

    invoke-direct {v3, p0, v1}, Lne1;-><init>(Lcom/opera/android/custom_views/AnimationEmptyListView;B)V

    invoke-virtual {v0, p1, v2, v3}, Lcom/opera/android/widget/ThemeableLottieAnimationView;->v(Ldvb;Ljava/lang/Object;Lykj;)V

    return-void
.end method

.method public final c(I)V
    .registers 2

    iget-object p0, p0, Lcom/opera/android/custom_views/AnimationEmptyListView;->a:Lov0;

    iget-object p0, p0, Lov0;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    return-void
.end method

.method public final onAttachedToWindow()V
    .registers 2

    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    invoke-virtual {p0}, Landroid/view/View;->isInEditMode()Z

    move-result v0

    if-eqz v0, :cond_a

    return-void

    :cond_a
    invoke-virtual {p0}, Lcom/opera/android/custom_views/AnimationEmptyListView;->a()V

    return-void
.end method

.method public final onDetachedFromWindow()V
    .registers 1

    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    invoke-virtual {p0}, Landroid/view/View;->isInEditMode()Z

    return-void
.end method

.method public final setVisibility(I)V
    .registers 2

    invoke-super {p0, p1}, Landroid/view/View;->setVisibility(I)V

    if-nez p1, :cond_9

    invoke-virtual {p0}, Lcom/opera/android/custom_views/AnimationEmptyListView;->a()V

    return-void

    :cond_9
    iget-object p0, p0, Lcom/opera/android/custom_views/AnimationEmptyListView;->a:Lov0;

    iget-object p0, p0, Lov0;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/widget/ThemeableLottieAnimationView;

    invoke-virtual {p0}, Lcom/opera/android/widget/LottieAnimationView;->f()V

    return-void
.end method
