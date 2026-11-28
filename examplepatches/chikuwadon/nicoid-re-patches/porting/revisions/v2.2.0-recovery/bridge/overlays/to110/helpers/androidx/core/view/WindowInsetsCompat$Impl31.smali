.class Landroidx/core/view/WindowInsetsCompat$Impl31;
.super Landroidx/core/view/WindowInsetsCompat$Impl30;
.source "WindowInsetsCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/core/view/WindowInsetsCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Impl31"
.end annotation


# direct methods
.method constructor <init>(Landroidx/core/view/WindowInsetsCompat;Landroid/view/WindowInsets;)V
    .registers 3
    .param p1, "host"    # Landroidx/core/view/WindowInsetsCompat;
    .param p2, "insets"    # Landroid/view/WindowInsets;

    .line 1673
    invoke-direct {p0, p1, p2}, Landroidx/core/view/WindowInsetsCompat$Impl30;-><init>(Landroidx/core/view/WindowInsetsCompat;Landroid/view/WindowInsets;)V

    .line 1674
    return-void
.end method

.method constructor <init>(Landroidx/core/view/WindowInsetsCompat;Landroidx/core/view/WindowInsetsCompat$Impl31;)V
    .registers 3
    .param p1, "host"    # Landroidx/core/view/WindowInsetsCompat;
    .param p2, "other"    # Landroidx/core/view/WindowInsetsCompat$Impl31;

    .line 1677
    invoke-direct {p0, p1, p2}, Landroidx/core/view/WindowInsetsCompat$Impl30;-><init>(Landroidx/core/view/WindowInsetsCompat;Landroidx/core/view/WindowInsetsCompat$Impl30;)V

    .line 1678
    return-void
.end method


# virtual methods
.method getPrivacyIndicatorBounds()Landroid/graphics/Rect;
    .registers 3

    .line 1688
    iget-object v0, p0, Landroidx/core/view/WindowInsetsCompat$Impl31;->mPlatformInsets:Landroid/view/WindowInsets;

    invoke-virtual {v0}, Landroid/view/WindowInsets;->getPrivacyIndicatorBounds()Landroid/graphics/Rect;

    move-result-object v0

    .line 1690
    .local v0, "bounds":Landroid/graphics/Rect;
    if-eqz v0, :cond_0

    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1, v0}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return-object v1
.end method

.method getRoundedCorner(I)Landroidx/core/view/RoundedCornerCompat;
    .registers 3
    .param p1, "position"    # I

    .line 1682
    iget-object v0, p0, Landroidx/core/view/WindowInsetsCompat$Impl31;->mPlatformInsets:Landroid/view/WindowInsets;

    .line 1683
    invoke-virtual {v0, p1}, Landroid/view/WindowInsets;->getRoundedCorner(I)Landroid/view/RoundedCorner;

    move-result-object v0

    .line 1682
    invoke-static {v0}, Landroidx/core/view/RoundedCornerCompat;->toRoundedCornerCompat(Landroid/view/RoundedCorner;)Landroidx/core/view/RoundedCornerCompat;

    move-result-object v0

    return-object v0
.end method
