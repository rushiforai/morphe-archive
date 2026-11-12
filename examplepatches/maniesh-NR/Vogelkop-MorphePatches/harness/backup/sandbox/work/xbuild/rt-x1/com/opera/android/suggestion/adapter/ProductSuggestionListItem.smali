.class public final Lcom/opera/android/suggestion/adapter/ProductSuggestionListItem;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"

# interfaces
.implements Lpvb;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u0008\u0007\u0018\u00002\u00020\u00012\u00020\u0002\u00a8\u0006\u0003"
    }
    d2 = {
        "Lcom/opera/android/suggestion/adapter/ProductSuggestionListItem;",
        "Landroidx/constraintlayout/widget/ConstraintLayout;",
        "Lpvb;",
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
.field public static final u:[I


# instance fields
.field public p:Lcom/opera/android/suggestion/Suggestion;

.field public final q:Lpt1;

.field public final r:Lpbj;

.field public s:Z

.field public final t:Ljava/util/LinkedHashSet;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const v0, 0x101009c

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lcom/opera/android/suggestion/adapter/ProductSuggestionListItem;->u:[I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 13
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0, v0}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    const v0, 0x7f0d0350

    invoke-virtual {p2, v0, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    const p2, 0x7f0a085d

    invoke-static {p2, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Landroid/widget/ImageView;

    if-eqz v3, :cond_8d

    const p2, 0x7f0a0866

    invoke-static {p2, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    if-eqz v4, :cond_8d

    const p2, 0x7f0a0a6b

    invoke-static {p2, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Lcom/opera/android/custom_views/CircleImageView;

    if-eqz v5, :cond_8d

    const p2, 0x7f0a0ae2

    invoke-static {p2, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v6, v0

    check-cast v6, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    if-eqz v6, :cond_8d

    const p2, 0x7f0a06c5

    invoke-static {p2, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v7, v0

    check-cast v7, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    if-eqz v7, :cond_8d

    new-instance v1, Lpt1;

    const/16 v8, 0xf

    move-object v2, p0

    invoke-direct/range {v1 .. v8}, Lpt1;-><init>(Landroid/view/ViewGroup;Landroid/view/View;Ljava/lang/Object;Landroid/view/View;Landroid/view/View;Landroid/view/View;B)V

    iput-object v1, v2, Lcom/opera/android/suggestion/adapter/ProductSuggestionListItem;->q:Lpt1;

    new-instance p0, Ljava/util/LinkedHashSet;

    invoke-direct {p0}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object p0, v2, Lcom/opera/android/suggestion/adapter/ProductSuggestionListItem;->t:Ljava/util/LinkedHashSet;

    invoke-static {p1}, Lgjf;->a(Landroid/content/Context;)Lgjf;

    move-result-object v5

    new-instance p0, Lecd;

    const/4 p2, 0x2

    invoke-direct {p0, v5, p2}, Lecd;-><init>(Lgjf;I)V

    invoke-virtual {v3, p0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    new-instance v4, Lpbj;

    new-instance p0, Lixh;

    const/high16 p2, 0x3f800000    # 1.0f

    invoke-direct {p0, p2}, Lixh;-><init>(F)V

    invoke-virtual {p0, p1}, Ly7h;->l(Landroid/content/Context;)F

    move-result v7

    const/4 v8, 0x0

    const/4 v9, -0x1

    const/4 v6, 0x2

    invoke-direct/range {v4 .. v9}, Lpbj;-><init>(Lgjf;IFII)V

    iput-object v4, v2, Lcom/opera/android/suggestion/adapter/ProductSuggestionListItem;->r:Lpbj;

    invoke-virtual {v3, v4}, Landroid/view/View;->setForeground(Landroid/graphics/drawable/Drawable;)V

    new-instance p0, Lkkf;

    const/4 p1, 0x6

    invoke-direct {p0, v2, p1}, Lkkf;-><init>(Ljava/lang/Object;B)V

    invoke-static {v3, p0}, Lq9n;->e(Landroid/view/View;Lr8n;)V

    invoke-virtual {p0, v3}, Lkkf;->a(Landroid/view/View;)V

    return-void

    :cond_8d
    move-object v2, p0

    invoke-virtual {v2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    throw p0
.end method


# virtual methods
.method public final c()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lcom/opera/android/suggestion/adapter/ProductSuggestionListItem;->p:Lcom/opera/android/suggestion/Suggestion;

    if-eqz p0, :cond_7

    iget-object p0, p0, Lcom/opera/android/suggestion/Suggestion;->b:Ljava/lang/String;

    goto :goto_8

    :cond_7
    const/4 p0, 0x0

    :goto_8
    if-nez p0, :cond_c

    const-string p0, ""

    :cond_c
    return-object p0
.end method

.method public final getView()Landroid/view/View;
    .registers 1

    return-object p0
.end method

.method public final j()Z
    .registers 1

    iget-object p0, p0, Lcom/opera/android/suggestion/adapter/ProductSuggestionListItem;->p:Lcom/opera/android/suggestion/Suggestion;

    if-eqz p0, :cond_6

    const/4 p0, 0x1

    return p0

    :cond_6
    const/4 p0, 0x0

    return p0
.end method

.method public final m()Li1;
    .registers 5

    iget-object v0, p0, Lcom/opera/android/suggestion/adapter/ProductSuggestionListItem;->p:Lcom/opera/android/suggestion/Suggestion;

    const/4 v1, 0x0

    if-eqz v0, :cond_a

    invoke-virtual {v0}, Lcom/opera/android/suggestion/Suggestion;->a()Ljava/lang/String;

    move-result-object v0

    goto :goto_b

    :cond_a
    move-object v0, v1

    :goto_b
    iget-object v2, p0, Lcom/opera/android/suggestion/adapter/ProductSuggestionListItem;->p:Lcom/opera/android/suggestion/Suggestion;

    if-eqz v2, :cond_12

    iget-object v2, v2, Lcom/opera/android/suggestion/Suggestion;->h:Ljava/lang/String;

    goto :goto_13

    :cond_12
    move-object v2, v1

    :goto_13
    if-eqz v0, :cond_30

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_30

    if-eqz v2, :cond_30

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_30

    new-instance v1, Li1;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lnr8;->e(Landroid/content/Context;)I

    move-result p0

    invoke-direct {v1, v2, v0, p0}, Li1;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    :cond_30
    return-object v1
.end method

.method public final onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 3

    invoke-super {p0, p1}, Landroid/view/View;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lr9n;->i(Landroid/content/Context;)Landroid/graphics/Rect;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    invoke-static {v0, p1}, Lddh;->s(ILandroid/content/Context;)Lgpj;

    move-result-object p1

    sget-object v0, Lgpj;->a:Lgpj;

    invoke-virtual {p1}, Lgpj;->d()Z

    move-result p1

    if-eqz p1, :cond_34

    new-instance p1, Lixh;

    const/high16 v0, 0x42800000    # 64.0f

    invoke-direct {p1, v0}, Lixh;-><init>(F)V

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p1, v0}, Ly7h;->k(Landroid/content/Context;)I

    move-result p1

    iget v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->e:I

    if-eq p1, v0, :cond_47

    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->e:I

    invoke-virtual {p0}, Landroidx/constraintlayout/widget/ConstraintLayout;->requestLayout()V

    return-void

    :cond_34
    new-instance p1, Lixh;

    const/high16 v0, 0x42900000    # 72.0f

    invoke-direct {p1, v0}, Lixh;-><init>(F)V

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p1, v0}, Ly7h;->k(Landroid/content/Context;)I

    move-result p1

    iget v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->e:I

    if-ne p1, v0, :cond_48

    :cond_47
    return-void

    :cond_48
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout;->e:I

    invoke-virtual {p0}, Landroidx/constraintlayout/widget/ConstraintLayout;->requestLayout()V

    return-void
.end method

.method public final onCreateDrawableState(I)[I
    .registers 3

    invoke-virtual {p0}, Landroid/view/View;->isSelected()Z

    move-result v0

    if-eqz v0, :cond_13

    add-int/lit8 p1, p1, 0x1

    invoke-super {p0, p1}, Landroid/view/View;->onCreateDrawableState(I)[I

    move-result-object p0

    sget-object p1, Lcom/opera/android/suggestion/adapter/ProductSuggestionListItem;->u:[I

    invoke-static {p0, p1}, Landroid/view/View;->mergeDrawableStates([I[I)[I

    move-result-object p0

    return-object p0

    :cond_13
    invoke-super {p0, p1}, Landroid/view/View;->onCreateDrawableState(I)[I

    move-result-object p0

    return-object p0
.end method

.method public final r(Ljava/lang/String;IZLkotlin/jvm/functions/Function0;)V
    .registers 7

    sget-object v0, Lyne;->b:Ldeg;

    invoke-virtual {v0, p1}, Ldeg;->i(Ljava/lang/String;)Ldwh;

    move-result-object v0

    iget-object v1, v0, Ldwh;->b:Lgvh;

    if-eqz p3, :cond_d

    const/4 p3, 0x1

    iput-boolean p3, v1, Lgvh;->k:Z

    :cond_d
    invoke-virtual {v1, p2, p2}, Lgvh;->b(II)V

    invoke-virtual {v0}, Ldwh;->b()V

    iget-object p2, p0, Lcom/opera/android/suggestion/adapter/ProductSuggestionListItem;->q:Lpt1;

    iget-object p2, p2, Lpt1;->c:Landroid/view/View;

    check-cast p2, Lcom/opera/android/custom_views/CircleImageView;

    new-instance p3, Lp8f;

    const/16 v1, 0x8

    invoke-direct {p3, v1, p0, p4, p1}, Lp8f;-><init>(BLjava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v0, p2, p3}, Ldwh;->g(Landroid/widget/ImageView;Ld94;)V

    return-void
.end method

.method public final s(Lc3h;I)V
    .registers 5

    iget-object v0, p1, Lc3h;->e:Ljava/lang/String;

    iget-object p1, p1, Lc3h;->d:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1e

    iget-object p1, p0, Lcom/opera/android/suggestion/adapter/ProductSuggestionListItem;->t:Ljava/util/LinkedHashSet;

    invoke-interface {p1, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1e

    new-instance p1, Ld8e;

    const/16 v1, 0x15

    invoke-direct {p1, p0, v1}, Ld8e;-><init>(Ljava/lang/Object;B)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p2, v1, p1}, Lcom/opera/android/suggestion/adapter/ProductSuggestionListItem;->r(Ljava/lang/String;IZLkotlin/jvm/functions/Function0;)V

    return-void

    :cond_1e
    iget-object p0, p0, Lcom/opera/android/suggestion/adapter/ProductSuggestionListItem;->q:Lpt1;

    iget-object p0, p0, Lpt1;->c:Landroid/view/View;

    check-cast p0, Lcom/opera/android/custom_views/CircleImageView;

    const/16 p1, 0x8

    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public final t()V
    .registers 3

    iget-boolean v0, p0, Lcom/opera/android/suggestion/adapter/ProductSuggestionListItem;->s:Z

    iget-object p0, p0, Lcom/opera/android/suggestion/adapter/ProductSuggestionListItem;->q:Lpt1;

    if-eqz v0, :cond_31

    iget-object v0, p0, Lpt1;->e:Ljava/lang/Object;

    check-cast v0, Landroid/widget/ImageView;

    iget-object p0, p0, Lpt1;->e:Ljava/lang/Object;

    check-cast p0, Landroid/widget/ImageView;

    const v1, 0x7f080716

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0402c8

    invoke-static {v1, v0}, Lf03;->W(ILandroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setImageTintList(Landroid/content/res/ColorStateList;)V

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0402f1

    invoke-static {v1, v0}, Lf03;->W(ILandroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    return-void

    :cond_31
    iget-object v0, p0, Lpt1;->e:Ljava/lang/Object;

    check-cast v0, Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageTintList(Landroid/content/res/ColorStateList;)V

    iget-object p0, p0, Lpt1;->e:Ljava/lang/Object;

    check-cast p0, Landroid/widget/ImageView;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f04021b

    invoke-static {v1, v0}, Lf03;->W(ILandroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    return-void
.end method
