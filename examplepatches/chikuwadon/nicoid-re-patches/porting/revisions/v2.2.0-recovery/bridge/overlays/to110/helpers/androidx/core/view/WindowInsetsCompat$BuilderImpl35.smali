.class Landroidx/core/view/WindowInsetsCompat$BuilderImpl35;
.super Landroidx/core/view/WindowInsetsCompat$BuilderImpl34;
.source "WindowInsetsCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/core/view/WindowInsetsCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "BuilderImpl35"
.end annotation


# instance fields
.field private mSetInsetsCalled:Z

.field private mSetInsetsIgnoringVisibilityCalled:Z


# direct methods
.method constructor <init>()V
    .registers 2

    .line 2504
    invoke-direct {p0}, Landroidx/core/view/WindowInsetsCompat$BuilderImpl34;-><init>()V

    .line 2500
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/core/view/WindowInsetsCompat$BuilderImpl35;->mSetInsetsCalled:Z

    .line 2501
    iput-boolean v0, p0, Landroidx/core/view/WindowInsetsCompat$BuilderImpl35;->mSetInsetsIgnoringVisibilityCalled:Z

    .line 2505
    return-void
.end method

.method constructor <init>(Landroidx/core/view/WindowInsetsCompat;)V
    .registers 3
    .param p1, "insets"    # Landroidx/core/view/WindowInsetsCompat;

    .line 2508
    invoke-direct {p0, p1}, Landroidx/core/view/WindowInsetsCompat$BuilderImpl34;-><init>(Landroidx/core/view/WindowInsetsCompat;)V

    .line 2500
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/core/view/WindowInsetsCompat$BuilderImpl35;->mSetInsetsCalled:Z

    .line 2501
    iput-boolean v0, p0, Landroidx/core/view/WindowInsetsCompat$BuilderImpl35;->mSetInsetsIgnoringVisibilityCalled:Z

    .line 2509
    invoke-virtual {p1}, Landroidx/core/view/WindowInsetsCompat;->isConsumed()Z

    move-result v0

    if-nez v0, :cond_0

    .line 2510
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/core/view/WindowInsetsCompat$BuilderImpl35;->mSetInsetsCalled:Z

    .line 2511
    iput-boolean v0, p0, Landroidx/core/view/WindowInsetsCompat$BuilderImpl35;->mSetInsetsIgnoringVisibilityCalled:Z

    .line 2513
    :cond_0
    return-void
.end method


# virtual methods
.method initTypeBoundingRects(Landroidx/core/view/WindowInsetsCompat;)V
    .registers 2
    .param p1, "insets"    # Landroidx/core/view/WindowInsetsCompat;

    .line 2558
    return-void
.end method

.method setBoundingRects(ILjava/util/List;)V
    .registers 6
    .param p1, "typeMask"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Landroid/graphics/Rect;",
            ">;)V"
        }
    .end annotation

    .line 2529
    .local p2, "rects":Ljava/util/List;, "Ljava/util/List<Landroid/graphics/Rect;>;"
    invoke-static {p1}, Landroidx/core/view/WindowInsetsCompat$TypeImpl34;->toPlatformType(I)I

    move-result v0

    .line 2531
    .local v0, "types":I
    iget-object v1, p0, Landroidx/core/view/WindowInsetsCompat$BuilderImpl35;->mPlatBuilder:Landroid/view/WindowInsets$Builder;

    invoke-virtual {v1, v0, p2}, Landroid/view/WindowInsets$Builder;->setBoundingRects(ILjava/util/List;)Landroid/view/WindowInsets$Builder;

    .line 2532
    iget-boolean v1, p0, Landroidx/core/view/WindowInsetsCompat$BuilderImpl35;->mSetInsetsCalled:Z

    if-nez v1, :cond_0

    .line 2535
    const/4 v1, 0x1

    iput-boolean v1, p0, Landroidx/core/view/WindowInsetsCompat$BuilderImpl35;->mSetInsetsCalled:Z

    .line 2536
    iget-object v1, p0, Landroidx/core/view/WindowInsetsCompat$BuilderImpl35;->mPlatBuilder:Landroid/view/WindowInsets$Builder;

    sget-object v2, Landroid/graphics/Insets;->NONE:Landroid/graphics/Insets;

    invoke-virtual {v1, v0, v2}, Landroid/view/WindowInsets$Builder;->setInsets(ILandroid/graphics/Insets;)Landroid/view/WindowInsets$Builder;

    .line 2538
    :cond_0
    return-void
.end method

.method setBoundingRectsIgnoringVisibility(ILjava/util/List;)V
    .registers 6
    .param p1, "typeMask"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Landroid/graphics/Rect;",
            ">;)V"
        }
    .end annotation

    .line 2543
    .local p2, "rects":Ljava/util/List;, "Ljava/util/List<Landroid/graphics/Rect;>;"
    invoke-static {p1}, Landroidx/core/view/WindowInsetsCompat$TypeImpl34;->toPlatformType(I)I

    move-result v0

    .line 2545
    .local v0, "types":I
    iget-object v1, p0, Landroidx/core/view/WindowInsetsCompat$BuilderImpl35;->mPlatBuilder:Landroid/view/WindowInsets$Builder;

    invoke-virtual {v1, v0, p2}, Landroid/view/WindowInsets$Builder;->setBoundingRectsIgnoringVisibility(ILjava/util/List;)Landroid/view/WindowInsets$Builder;

    .line 2546
    iget-boolean v1, p0, Landroidx/core/view/WindowInsetsCompat$BuilderImpl35;->mSetInsetsIgnoringVisibilityCalled:Z

    if-nez v1, :cond_0

    .line 2549
    const/4 v1, 0x1

    iput-boolean v1, p0, Landroidx/core/view/WindowInsetsCompat$BuilderImpl35;->mSetInsetsIgnoringVisibilityCalled:Z

    .line 2550
    iget-object v1, p0, Landroidx/core/view/WindowInsetsCompat$BuilderImpl35;->mPlatBuilder:Landroid/view/WindowInsets$Builder;

    sget-object v2, Landroid/graphics/Insets;->NONE:Landroid/graphics/Insets;

    invoke-virtual {v1, v0, v2}, Landroid/view/WindowInsets$Builder;->setInsetsIgnoringVisibility(ILandroid/graphics/Insets;)Landroid/view/WindowInsets$Builder;

    .line 2552
    :cond_0
    return-void
.end method

.method setInsets(ILandroidx/core/graphics/Insets;)V
    .registers 4
    .param p1, "typeMask"    # I
    .param p2, "insets"    # Landroidx/core/graphics/Insets;

    .line 2517
    invoke-super {p0, p1, p2}, Landroidx/core/view/WindowInsetsCompat$BuilderImpl34;->setInsets(ILandroidx/core/graphics/Insets;)V

    .line 2518
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/core/view/WindowInsetsCompat$BuilderImpl35;->mSetInsetsCalled:Z

    .line 2519
    return-void
.end method

.method setInsetsIgnoringVisibility(ILandroidx/core/graphics/Insets;)V
    .registers 4
    .param p1, "typeMask"    # I
    .param p2, "insets"    # Landroidx/core/graphics/Insets;

    .line 2523
    invoke-super {p0, p1, p2}, Landroidx/core/view/WindowInsetsCompat$BuilderImpl34;->setInsetsIgnoringVisibility(ILandroidx/core/graphics/Insets;)V

    .line 2524
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/core/view/WindowInsetsCompat$BuilderImpl35;->mSetInsetsIgnoringVisibilityCalled:Z

    .line 2525
    return-void
.end method
