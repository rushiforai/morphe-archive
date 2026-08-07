.class public Lcom/p1/mobile/putong/core/ui/gift/HorRecyclerViewIndicator;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/view/View;

.field public b:I

.field public c:I

.field public d:Landroidx/recyclerview/widget/RecyclerView$t;

.field public e:I


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Lcom/p1/mobile/putong/core/ui/gift/HorRecyclerViewIndicator$a;

    .line 5
    .line 6
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/ui/gift/HorRecyclerViewIndicator$a;-><init>(Lcom/p1/mobile/putong/core/ui/gift/HorRecyclerViewIndicator;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/gift/HorRecyclerViewIndicator;->d:Landroidx/recyclerview/widget/RecyclerView$t;

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
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 13
    new-instance p1, Lcom/p1/mobile/putong/core/ui/gift/HorRecyclerViewIndicator$a;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/ui/gift/HorRecyclerViewIndicator$a;-><init>(Lcom/p1/mobile/putong/core/ui/gift/HorRecyclerViewIndicator;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/gift/HorRecyclerViewIndicator;->d:Landroidx/recyclerview/widget/RecyclerView$t;

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

    .line 14
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 15
    new-instance p1, Lcom/p1/mobile/putong/core/ui/gift/HorRecyclerViewIndicator$a;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/ui/gift/HorRecyclerViewIndicator$a;-><init>(Lcom/p1/mobile/putong/core/ui/gift/HorRecyclerViewIndicator;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/gift/HorRecyclerViewIndicator;->d:Landroidx/recyclerview/widget/RecyclerView$t;

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/gift/HorRecyclerViewIndicator;Landroidx/recyclerview/widget/RecyclerView;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/gift/HorRecyclerViewIndicator;->e(Landroidx/recyclerview/widget/RecyclerView;)V

    return-void
.end method


# virtual methods
.method public b(Landroidx/recyclerview/widget/RecyclerView;)V
    .locals 1

    .line 1
    new-instance v0, Ll/zgl;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/zgl;-><init>(Lcom/p1/mobile/putong/core/ui/gift/HorRecyclerViewIndicator;Landroidx/recyclerview/widget/RecyclerView;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public c(Landroidx/recyclerview/widget/RecyclerView;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->computeHorizontalScrollOffset()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->computeHorizontalScrollExtent()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->computeHorizontalScrollRange()I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    sub-int/2addr p1, v1

    .line 14
    if-gtz p1, :cond_0

    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    int-to-float v0, v0

    .line 18
    int-to-float p1, p1

    .line 19
    div-float/2addr v0, p1

    .line 20
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/gift/HorRecyclerViewIndicator;->c:I

    .line 25
    .line 26
    sub-int/2addr p1, v1

    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/gift/HorRecyclerViewIndicator;->a:Landroid/view/View;

    .line 28
    .line 29
    int-to-float p1, p1

    .line 30
    mul-float/2addr v0, p1

    .line 31
    invoke-virtual {p0, v0}, Landroid/view/View;->setX(F)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public d()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/HorRecyclerViewIndicator;->a:Landroid/view/View;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroid/view/View;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-direct {v0, v1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/HorRecyclerViewIndicator;->a:Landroid/view/View;

    .line 15
    .line 16
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/gift/HorRecyclerViewIndicator;->b:I

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 19
    .line 20
    .line 21
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/gift/HorRecyclerViewIndicator;->e:I

    .line 22
    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/HorRecyclerViewIndicator;->a:Landroid/view/View;

    .line 26
    .line 27
    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Landroid/graphics/drawable/GradientDrawable;

    .line 32
    .line 33
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/gift/HorRecyclerViewIndicator;->e:I

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/gift/HorRecyclerViewIndicator;->a:Landroid/view/View;

    .line 39
    .line 40
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 41
    .line 42
    .line 43
    :cond_0
    return-void
.end method

.method public final synthetic e(Landroidx/recyclerview/widget/RecyclerView;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/gift/HorRecyclerViewIndicator;->d()V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0, p1}, Ll/r97;->h2(Landroidx/recyclerview/widget/RecyclerView;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const/4 v1, -0x1

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/HorRecyclerViewIndicator;->d:Landroidx/recyclerview/widget/RecyclerView$t;

    .line 23
    .line 24
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->removeOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$t;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/HorRecyclerViewIndicator;->a:Landroid/view/View;

    .line 28
    .line 29
    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    .line 30
    .line 31
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/gift/HorRecyclerViewIndicator;->c:I

    .line 32
    .line 33
    invoke-direct {v2, v3, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0, v0, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/gift/HorRecyclerViewIndicator;->d:Landroidx/recyclerview/widget/RecyclerView$t;

    .line 40
    .line 41
    invoke-virtual {p1, p0}, Landroidx/recyclerview/widget/RecyclerView;->addOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$t;)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/gift/HorRecyclerViewIndicator;->a:Landroid/view/View;

    .line 46
    .line 47
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 48
    .line 49
    invoke-direct {v0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0, p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    const/high16 v0, 0x41b80000    # 23.0f

    .line 5
    .line 6
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/gift/HorRecyclerViewIndicator;->c:I

    .line 11
    .line 12
    sget v0, Ll/ibc0;->d0:I

    .line 13
    .line 14
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/gift/HorRecyclerViewIndicator;->b:I

    .line 15
    .line 16
    return-void
.end method

.method public setBarColor(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/gift/HorRecyclerViewIndicator;->e:I

    .line 2
    .line 3
    return-void
.end method
