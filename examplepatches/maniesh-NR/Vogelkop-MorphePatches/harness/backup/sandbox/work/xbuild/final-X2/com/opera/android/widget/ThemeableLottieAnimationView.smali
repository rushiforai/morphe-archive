.class public Lcom/opera/android/widget/ThemeableLottieAnimationView;
.super Lcom/opera/android/widget/LottieAnimationView;
.source "SourceFile"


# static fields
.field public static final synthetic x:I


# instance fields
.field public final t:Ljava/util/ArrayList;

.field public final u:Ljava/util/ArrayList;

.field public final v:Ljava/util/ArrayList;

.field public final w:Lnll;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 33
    invoke-direct {p0, p1, p2}, Lcom/opera/android/widget/LottieAnimationView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 34
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/opera/android/widget/ThemeableLottieAnimationView;->t:Ljava/util/ArrayList;

    .line 35
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/opera/android/widget/ThemeableLottieAnimationView;->u:Ljava/util/ArrayList;

    .line 36
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/opera/android/widget/ThemeableLottieAnimationView;->v:Ljava/util/ArrayList;

    .line 37
    new-instance p1, Lnll;

    invoke-direct {p1, p0}, Lnll;-><init>(Lcom/opera/android/widget/ThemeableLottieAnimationView;)V

    iput-object p1, p0, Lcom/opera/android/widget/ThemeableLottieAnimationView;->w:Lnll;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4

    const/4 p3, 0x0

    invoke-direct {p0, p1, p2, p3}, Lcom/opera/android/widget/LottieAnimationView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/opera/android/widget/ThemeableLottieAnimationView;->t:Ljava/util/ArrayList;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/opera/android/widget/ThemeableLottieAnimationView;->u:Ljava/util/ArrayList;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/opera/android/widget/ThemeableLottieAnimationView;->v:Ljava/util/ArrayList;

    new-instance p1, Lnll;

    invoke-direct {p1, p0}, Lnll;-><init>(Lcom/opera/android/widget/ThemeableLottieAnimationView;)V

    iput-object p1, p0, Lcom/opera/android/widget/ThemeableLottieAnimationView;->w:Lnll;

    return-void
.end method


# virtual methods
.method public final a(Ldvb;Ljava/lang/Object;Lua7;)V
    .registers 10

    new-instance v0, Llll;

    const/4 v5, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    invoke-direct/range {v0 .. v5}, Llll;-><init>(Lcom/opera/android/widget/ThemeableLottieAnimationView;Ldvb;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v1, v0}, Lcom/opera/android/widget/ThemeableLottieAnimationView;->u(Loll;)V

    return-void
.end method

.method public final u(Loll;)V
    .registers 7

    iget-object p0, p0, Lcom/opera/android/widget/ThemeableLottieAnimationView;->w:Lnll;

    iget-object v0, p0, Lnll;->a:Li7f;

    iget-object v1, p0, Lnll;->b:Lcom/opera/android/widget/ThemeableLottieAnimationView;

    iget-object v2, v1, Ln2d;->m:Lp2d;

    const/4 v3, 0x2

    if-eqz v2, :cond_11

    iget-byte v2, p0, Lnll;->c:B

    if-nez v2, :cond_11

    iput-byte v3, p0, Lnll;->c:B

    :cond_11
    iget-byte v2, p0, Lnll;->c:B

    const/4 v4, 0x1

    if-eqz v2, :cond_23

    if-eq v2, v4, :cond_1f

    if-eq v2, v3, :cond_1b

    return-void

    :cond_1b
    invoke-interface {p1}, Loll;->a()V

    return-void

    :cond_1f
    invoke-virtual {v0, p1}, Li7f;->b(Ljava/lang/Object;)Z

    return-void

    :cond_23
    invoke-virtual {v0, p1}, Li7f;->b(Ljava/lang/Object;)Z

    iput-byte v4, p0, Lnll;->c:B

    iget-object p1, v1, Ln2d;->m:Lp2d;

    if-eqz p1, :cond_2f

    invoke-virtual {p0}, Lnll;->a()V

    :cond_2f
    iget-object p1, v1, Ln2d;->k:Ljava/util/HashSet;

    invoke-virtual {p1, p0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final v(Ldvb;Ljava/lang/Object;Lykj;)V
    .registers 10

    new-instance v0, Llll;

    const/4 v5, 0x1

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    invoke-direct/range {v0 .. v5}, Llll;-><init>(Lcom/opera/android/widget/ThemeableLottieAnimationView;Ldvb;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v1, v0}, Lcom/opera/android/widget/ThemeableLottieAnimationView;->u(Loll;)V

    return-void
.end method

.method public final w()V
    .registers 7

    iget-object v0, p0, Lcom/opera/android/widget/ThemeableLottieAnimationView;->v:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    :goto_7
    if-ge v2, v1, :cond_22

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Li3d;

    iget-object v4, v3, Li3d;->a:Ldvb;

    iget v3, v3, Li3d;->c:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    new-instance v5, Lkll;

    invoke-direct {v5, p0, v4, v3}, Lkll;-><init>(Lcom/opera/android/widget/ThemeableLottieAnimationView;Ldvb;Ljava/lang/Integer;)V

    invoke-virtual {p0, v5}, Lcom/opera/android/widget/ThemeableLottieAnimationView;->u(Loll;)V

    goto :goto_7

    :cond_22
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    iget-object p0, p0, Lcom/opera/android/widget/ThemeableLottieAnimationView;->t:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    return-void
.end method

.method public final synthetic x(Ldvb;Ljava/lang/Object;Lua7;)V
    .registers 4

    invoke-super {p0, p1, p2, p3}, Ln2d;->a(Ldvb;Ljava/lang/Object;Lua7;)V

    return-void
.end method

.method public y()V
    .registers 9

    iget-object v0, p0, Lcom/opera/android/widget/ThemeableLottieAnimationView;->t:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    move v3, v2

    :goto_8
    if-ge v3, v1, :cond_22

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v3, v3, 0x1

    check-cast v4, Lpll;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v5

    iget v6, v4, Lpll;->a:I

    const v7, 0x7f06063b

    invoke-static {v6, v5, v7}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v5

    iput v5, v4, Lpll;->b:I

    goto :goto_8

    :cond_22
    iget-object v0, p0, Lcom/opera/android/widget/ThemeableLottieAnimationView;->u:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    :goto_28
    if-ge v2, v1, :cond_3b

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Lqll;

    iget-object v4, v3, Lqll;->a:Lrll;

    invoke-interface {v4}, Lrll;->getValue()Ljava/lang/Object;

    move-result-object v4

    iput-object v4, v3, Lqll;->b:Ljava/lang/Object;

    goto :goto_28

    :cond_3b
    invoke-virtual {p0}, Ln2d;->invalidate()V

    return-void
.end method

.method public final varargs z([Li3d;)V
    .registers 11

    iget-object v0, p0, Lcom/opera/android/widget/ThemeableLottieAnimationView;->v:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_b

    invoke-virtual {p0}, Lcom/opera/android/widget/ThemeableLottieAnimationView;->w()V

    :cond_b
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p1

    const/4 v1, 0x0

    move v2, v1

    :cond_18
    :goto_18
    if-ge v2, p1, :cond_60

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Li3d;

    new-instance v4, Lpll;

    iget v5, v3, Li3d;->b:I

    iget-object v6, v3, Li3d;->a:Ldvb;

    invoke-direct {v4, v5}, Lpll;-><init>(I)V

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v7

    const v8, 0x7f06063b

    invoke-static {v5, v7, v8}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v5

    iput v5, v4, Lpll;->b:I

    iget-object v5, p0, Lcom/opera/android/widget/ThemeableLottieAnimationView;->t:Ljava/util/ArrayList;

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget v5, v3, Li3d;->c:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    new-instance v7, Lmll;

    invoke-direct {v7, v4, v1}, Lmll;-><init>(Lpll;B)V

    invoke-virtual {p0, v6, v5, v7}, Lcom/opera/android/widget/ThemeableLottieAnimationView;->v(Ldvb;Ljava/lang/Object;Lykj;)V

    iget-boolean v3, v3, Li3d;->d:Z

    if-eqz v3, :cond_18

    sget-object v3, Lk3d;->a:Landroid/graphics/PointF;

    const/4 v3, 0x4

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    new-instance v5, Lmll;

    const/4 v7, 0x1

    invoke-direct {v5, v4, v7}, Lmll;-><init>(Lpll;B)V

    invoke-virtual {p0, v6, v3, v5}, Lcom/opera/android/widget/ThemeableLottieAnimationView;->v(Ldvb;Ljava/lang/Object;Lykj;)V

    goto :goto_18

    :cond_60
    return-void
.end method
