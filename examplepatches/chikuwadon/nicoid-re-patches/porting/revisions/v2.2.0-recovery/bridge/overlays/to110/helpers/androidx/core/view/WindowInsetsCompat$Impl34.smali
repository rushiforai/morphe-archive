.class Landroidx/core/view/WindowInsetsCompat$Impl34;
.super Landroidx/core/view/WindowInsetsCompat$Impl31;
.source "WindowInsetsCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/core/view/WindowInsetsCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Impl34"
.end annotation


# static fields
.field static final CONSUMED:Landroidx/core/view/WindowInsetsCompat;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 1696
    sget-object v0, Landroid/view/WindowInsets;->CONSUMED:Landroid/view/WindowInsets;

    .line 1697
    invoke-static {v0}, Landroidx/core/view/WindowInsetsCompat;->toWindowInsetsCompat(Landroid/view/WindowInsets;)Landroidx/core/view/WindowInsetsCompat;

    move-result-object v0

    sput-object v0, Landroidx/core/view/WindowInsetsCompat$Impl34;->CONSUMED:Landroidx/core/view/WindowInsetsCompat;

    .line 1696
    return-void
.end method

.method constructor <init>(Landroidx/core/view/WindowInsetsCompat;Landroid/view/WindowInsets;)V
    .registers 3
    .param p1, "host"    # Landroidx/core/view/WindowInsetsCompat;
    .param p2, "insets"    # Landroid/view/WindowInsets;

    .line 1700
    invoke-direct {p0, p1, p2}, Landroidx/core/view/WindowInsetsCompat$Impl31;-><init>(Landroidx/core/view/WindowInsetsCompat;Landroid/view/WindowInsets;)V

    .line 1701
    return-void
.end method

.method constructor <init>(Landroidx/core/view/WindowInsetsCompat;Landroidx/core/view/WindowInsetsCompat$Impl34;)V
    .registers 3
    .param p1, "host"    # Landroidx/core/view/WindowInsetsCompat;
    .param p2, "other"    # Landroidx/core/view/WindowInsetsCompat$Impl34;

    .line 1704
    invoke-direct {p0, p1, p2}, Landroidx/core/view/WindowInsetsCompat$Impl31;-><init>(Landroidx/core/view/WindowInsetsCompat;Landroidx/core/view/WindowInsetsCompat$Impl31;)V

    .line 1705
    return-void
.end method


# virtual methods
.method getDisplayShape()Landroidx/core/view/DisplayShapeCompat;
    .registers 2

    .line 1734
    iget-object v0, p0, Landroidx/core/view/WindowInsetsCompat$Impl34;->mDisplayShapeCompat:Landroidx/core/view/DisplayShapeCompat;

    if-eqz v0, :cond_0

    .line 1735
    iget-object v0, p0, Landroidx/core/view/WindowInsetsCompat$Impl34;->mDisplayShapeCompat:Landroidx/core/view/DisplayShapeCompat;

    return-object v0

    .line 1737
    :cond_0
    iget-object v0, p0, Landroidx/core/view/WindowInsetsCompat$Impl34;->mPlatformInsets:Landroid/view/WindowInsets;

    invoke-virtual {v0}, Landroid/view/WindowInsets;->getDisplayShape()Landroid/view/DisplayShape;

    move-result-object v0

    invoke-static {v0}, Landroidx/core/view/DisplayShapeCompat;->toDisplayShapeCompat(Landroid/view/DisplayShape;)Landroidx/core/view/DisplayShapeCompat;

    move-result-object v0

    return-object v0
.end method

.method public getInsets(I)Landroidx/core/graphics/Insets;
    .registers 4
    .param p1, "typeMask"    # I

    .line 1709
    iget-object v0, p0, Landroidx/core/view/WindowInsetsCompat$Impl34;->mPlatformInsets:Landroid/view/WindowInsets;

    .line 1710
    invoke-static {p1}, Landroidx/core/view/WindowInsetsCompat$TypeImpl34;->toPlatformType(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/WindowInsets;->getInsets(I)Landroid/graphics/Insets;

    move-result-object v0

    .line 1709
    invoke-static {v0}, Landroidx/core/graphics/Insets;->toCompatInsets(Landroid/graphics/Insets;)Landroidx/core/graphics/Insets;

    move-result-object v0

    return-object v0
.end method

.method public getInsetsIgnoringVisibility(I)Landroidx/core/graphics/Insets;
    .registers 4
    .param p1, "typeMask"    # I

    .line 1716
    iget-object v0, p0, Landroidx/core/view/WindowInsetsCompat$Impl34;->mPlatformInsets:Landroid/view/WindowInsets;

    .line 1717
    invoke-static {p1}, Landroidx/core/view/WindowInsetsCompat$TypeImpl34;->toPlatformType(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/WindowInsets;->getInsetsIgnoringVisibility(I)Landroid/graphics/Insets;

    move-result-object v0

    .line 1716
    invoke-static {v0}, Landroidx/core/graphics/Insets;->toCompatInsets(Landroid/graphics/Insets;)Landroidx/core/graphics/Insets;

    move-result-object v0

    return-object v0
.end method

.method initDisplayShape(Landroid/view/View;)V
    .registers 2
    .param p1, "rootView"    # Landroid/view/View;

    .line 1730
    return-void
.end method

.method public isVisible(I)Z
    .registers 4
    .param p1, "typeMask"    # I

    .line 1723
    iget-object v0, p0, Landroidx/core/view/WindowInsetsCompat$Impl34;->mPlatformInsets:Landroid/view/WindowInsets;

    invoke-static {p1}, Landroidx/core/view/WindowInsetsCompat$TypeImpl34;->toPlatformType(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/WindowInsets;->isVisible(I)Z

    move-result v0

    return v0
.end method
