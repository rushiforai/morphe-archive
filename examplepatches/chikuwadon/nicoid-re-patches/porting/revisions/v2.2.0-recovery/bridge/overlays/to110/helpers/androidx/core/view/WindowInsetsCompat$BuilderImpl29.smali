.class Landroidx/core/view/WindowInsetsCompat$BuilderImpl29;
.super Landroidx/core/view/WindowInsetsCompat$BuilderImpl;
.source "WindowInsetsCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/core/view/WindowInsetsCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "BuilderImpl29"
.end annotation


# instance fields
.field final mPlatBuilder:Landroid/view/WindowInsets$Builder;


# direct methods
.method constructor <init>()V
    .registers 2

    .line 2342
    invoke-direct {p0}, Landroidx/core/view/WindowInsetsCompat$BuilderImpl;-><init>()V

    .line 2343
    new-instance v0, Landroid/view/WindowInsets$Builder;

    invoke-direct {v0}, Landroid/view/WindowInsets$Builder;-><init>()V

    iput-object v0, p0, Landroidx/core/view/WindowInsetsCompat$BuilderImpl29;->mPlatBuilder:Landroid/view/WindowInsets$Builder;

    .line 2344
    return-void
.end method

.method constructor <init>(Landroidx/core/view/WindowInsetsCompat;)V
    .registers 4
    .param p1, "insets"    # Landroidx/core/view/WindowInsetsCompat;

    .line 2347
    invoke-direct {p0, p1}, Landroidx/core/view/WindowInsetsCompat$BuilderImpl;-><init>(Landroidx/core/view/WindowInsetsCompat;)V

    .line 2348
    invoke-virtual {p1}, Landroidx/core/view/WindowInsetsCompat;->toWindowInsets()Landroid/view/WindowInsets;

    move-result-object v0

    .line 2349
    .local v0, "platInsets":Landroid/view/WindowInsets;
    if-eqz v0, :cond_0

    .line 2350
    new-instance v1, Landroid/view/WindowInsets$Builder;

    invoke-direct {v1, v0}, Landroid/view/WindowInsets$Builder;-><init>(Landroid/view/WindowInsets;)V

    goto :goto_0

    .line 2351
    :cond_0
    new-instance v1, Landroid/view/WindowInsets$Builder;

    invoke-direct {v1}, Landroid/view/WindowInsets$Builder;-><init>()V

    :goto_0
    iput-object v1, p0, Landroidx/core/view/WindowInsetsCompat$BuilderImpl29;->mPlatBuilder:Landroid/view/WindowInsets$Builder;

    .line 2352
    return-void
.end method


# virtual methods
.method build()Landroidx/core/view/WindowInsetsCompat;
    .registers 3

    .line 2386
    invoke-virtual {p0}, Landroidx/core/view/WindowInsetsCompat$BuilderImpl29;->applyInsetTypes()V

    .line 2387
    iget-object v0, p0, Landroidx/core/view/WindowInsetsCompat$BuilderImpl29;->mPlatBuilder:Landroid/view/WindowInsets$Builder;

    .line 2388
    invoke-virtual {v0}, Landroid/view/WindowInsets$Builder;->build()Landroid/view/WindowInsets;

    move-result-object v0

    .line 2387
    invoke-static {v0}, Landroidx/core/view/WindowInsetsCompat;->toWindowInsetsCompat(Landroid/view/WindowInsets;)Landroidx/core/view/WindowInsetsCompat;

    move-result-object v0

    .line 2389
    .local v0, "windowInsetsCompat":Landroidx/core/view/WindowInsetsCompat;
    iget-object v1, p0, Landroidx/core/view/WindowInsetsCompat$BuilderImpl29;->mInsetsTypeMask:[Landroidx/core/graphics/Insets;

    invoke-virtual {v0, v1}, Landroidx/core/view/WindowInsetsCompat;->setOverriddenInsets([Landroidx/core/graphics/Insets;)V

    .line 2390
    iget-object v1, p0, Landroidx/core/view/WindowInsetsCompat$BuilderImpl29;->mDisplayShapeCompat:Landroidx/core/view/DisplayShapeCompat;

    invoke-virtual {v0, v1}, Landroidx/core/view/WindowInsetsCompat;->setDisplayShape(Landroidx/core/view/DisplayShapeCompat;)V

    .line 2391
    iget-object v1, p0, Landroidx/core/view/WindowInsetsCompat$BuilderImpl29;->mTypeBoundingRectsMap:[[Landroid/graphics/Rect;

    invoke-virtual {v0, v1}, Landroidx/core/view/WindowInsetsCompat;->setTypeBoundingRectsMap([[Landroid/graphics/Rect;)V

    .line 2392
    iget-object v1, p0, Landroidx/core/view/WindowInsetsCompat$BuilderImpl29;->mTypeMaxBoundingRectsMap:[[Landroid/graphics/Rect;

    invoke-virtual {v0, v1}, Landroidx/core/view/WindowInsetsCompat;->setTypeMaxBoundingRectsMap([[Landroid/graphics/Rect;)V

    .line 2393
    return-object v0
.end method

.method setDisplayCutout(Landroidx/core/view/DisplayCutoutCompat;)V
    .registers 4
    .param p1, "displayCutout"    # Landroidx/core/view/DisplayCutoutCompat;

    .line 2381
    iget-object v0, p0, Landroidx/core/view/WindowInsetsCompat$BuilderImpl29;->mPlatBuilder:Landroid/view/WindowInsets$Builder;

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroidx/core/view/DisplayCutoutCompat;->unwrap()Landroid/view/DisplayCutout;

    move-result-object v1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    invoke-virtual {v0, v1}, Landroid/view/WindowInsets$Builder;->setDisplayCutout(Landroid/view/DisplayCutout;)Landroid/view/WindowInsets$Builder;

    .line 2382
    return-void
.end method

.method setMandatorySystemGestureInsets(Landroidx/core/graphics/Insets;)V
    .registers 4
    .param p1, "insets"    # Landroidx/core/graphics/Insets;

    .line 2366
    iget-object v0, p0, Landroidx/core/view/WindowInsetsCompat$BuilderImpl29;->mPlatBuilder:Landroid/view/WindowInsets$Builder;

    invoke-virtual {p1}, Landroidx/core/graphics/Insets;->toPlatformInsets()Landroid/graphics/Insets;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/WindowInsets$Builder;->setMandatorySystemGestureInsets(Landroid/graphics/Insets;)Landroid/view/WindowInsets$Builder;

    .line 2367
    return-void
.end method

.method setStableInsets(Landroidx/core/graphics/Insets;)V
    .registers 4
    .param p1, "insets"    # Landroidx/core/graphics/Insets;

    .line 2376
    iget-object v0, p0, Landroidx/core/view/WindowInsetsCompat$BuilderImpl29;->mPlatBuilder:Landroid/view/WindowInsets$Builder;

    invoke-virtual {p1}, Landroidx/core/graphics/Insets;->toPlatformInsets()Landroid/graphics/Insets;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/WindowInsets$Builder;->setStableInsets(Landroid/graphics/Insets;)Landroid/view/WindowInsets$Builder;

    .line 2377
    return-void
.end method

.method setSystemGestureInsets(Landroidx/core/graphics/Insets;)V
    .registers 4
    .param p1, "insets"    # Landroidx/core/graphics/Insets;

    .line 2361
    iget-object v0, p0, Landroidx/core/view/WindowInsetsCompat$BuilderImpl29;->mPlatBuilder:Landroid/view/WindowInsets$Builder;

    invoke-virtual {p1}, Landroidx/core/graphics/Insets;->toPlatformInsets()Landroid/graphics/Insets;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/WindowInsets$Builder;->setSystemGestureInsets(Landroid/graphics/Insets;)Landroid/view/WindowInsets$Builder;

    .line 2362
    return-void
.end method

.method setSystemWindowInsets(Landroidx/core/graphics/Insets;)V
    .registers 4
    .param p1, "insets"    # Landroidx/core/graphics/Insets;

    .line 2356
    iget-object v0, p0, Landroidx/core/view/WindowInsetsCompat$BuilderImpl29;->mPlatBuilder:Landroid/view/WindowInsets$Builder;

    invoke-virtual {p1}, Landroidx/core/graphics/Insets;->toPlatformInsets()Landroid/graphics/Insets;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/WindowInsets$Builder;->setSystemWindowInsets(Landroid/graphics/Insets;)Landroid/view/WindowInsets$Builder;

    .line 2357
    return-void
.end method

.method setTappableElementInsets(Landroidx/core/graphics/Insets;)V
    .registers 4
    .param p1, "insets"    # Landroidx/core/graphics/Insets;

    .line 2371
    iget-object v0, p0, Landroidx/core/view/WindowInsetsCompat$BuilderImpl29;->mPlatBuilder:Landroid/view/WindowInsets$Builder;

    invoke-virtual {p1}, Landroidx/core/graphics/Insets;->toPlatformInsets()Landroid/graphics/Insets;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/WindowInsets$Builder;->setTappableElementInsets(Landroid/graphics/Insets;)Landroid/view/WindowInsets$Builder;

    .line 2372
    return-void
.end method
