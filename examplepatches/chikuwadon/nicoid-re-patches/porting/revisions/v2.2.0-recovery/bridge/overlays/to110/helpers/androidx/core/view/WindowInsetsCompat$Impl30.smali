.class Landroidx/core/view/WindowInsetsCompat$Impl30;
.super Landroidx/core/view/WindowInsetsCompat$Impl29;
.source "WindowInsetsCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/core/view/WindowInsetsCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Impl30"
.end annotation


# static fields
.field static final CONSUMED:Landroidx/core/view/WindowInsetsCompat;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 1630
    sget-object v0, Landroid/view/WindowInsets;->CONSUMED:Landroid/view/WindowInsets;

    .line 1631
    invoke-static {v0}, Landroidx/core/view/WindowInsetsCompat;->toWindowInsetsCompat(Landroid/view/WindowInsets;)Landroidx/core/view/WindowInsetsCompat;

    move-result-object v0

    sput-object v0, Landroidx/core/view/WindowInsetsCompat$Impl30;->CONSUMED:Landroidx/core/view/WindowInsetsCompat;

    .line 1630
    return-void
.end method

.method constructor <init>(Landroidx/core/view/WindowInsetsCompat;Landroid/view/WindowInsets;)V
    .registers 3
    .param p1, "host"    # Landroidx/core/view/WindowInsetsCompat;
    .param p2, "insets"    # Landroid/view/WindowInsets;

    .line 1634
    invoke-direct {p0, p1, p2}, Landroidx/core/view/WindowInsetsCompat$Impl29;-><init>(Landroidx/core/view/WindowInsetsCompat;Landroid/view/WindowInsets;)V

    .line 1635
    return-void
.end method

.method constructor <init>(Landroidx/core/view/WindowInsetsCompat;Landroidx/core/view/WindowInsetsCompat$Impl30;)V
    .registers 3
    .param p1, "host"    # Landroidx/core/view/WindowInsetsCompat;
    .param p2, "other"    # Landroidx/core/view/WindowInsetsCompat$Impl30;

    .line 1638
    invoke-direct {p0, p1, p2}, Landroidx/core/view/WindowInsetsCompat$Impl29;-><init>(Landroidx/core/view/WindowInsetsCompat;Landroidx/core/view/WindowInsetsCompat$Impl29;)V

    .line 1639
    return-void
.end method


# virtual methods
.method final copyRootViewBounds(Landroid/view/View;)V
    .registers 2
    .param p1, "rootView"    # Landroid/view/View;

    .line 1666
    return-void
.end method

.method public getInsets(I)Landroidx/core/graphics/Insets;
    .registers 4
    .param p1, "typeMask"    # I

    .line 1643
    iget-object v0, p0, Landroidx/core/view/WindowInsetsCompat$Impl30;->mPlatformInsets:Landroid/view/WindowInsets;

    .line 1644
    invoke-static {p1}, Landroidx/core/view/WindowInsetsCompat$TypeImpl30;->toPlatformType(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/WindowInsets;->getInsets(I)Landroid/graphics/Insets;

    move-result-object v0

    .line 1643
    invoke-static {v0}, Landroidx/core/graphics/Insets;->toCompatInsets(Landroid/graphics/Insets;)Landroidx/core/graphics/Insets;

    move-result-object v0

    return-object v0
.end method

.method public getInsetsIgnoringVisibility(I)Landroidx/core/graphics/Insets;
    .registers 4
    .param p1, "typeMask"    # I

    .line 1650
    iget-object v0, p0, Landroidx/core/view/WindowInsetsCompat$Impl30;->mPlatformInsets:Landroid/view/WindowInsets;

    .line 1651
    invoke-static {p1}, Landroidx/core/view/WindowInsetsCompat$TypeImpl30;->toPlatformType(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/WindowInsets;->getInsetsIgnoringVisibility(I)Landroid/graphics/Insets;

    move-result-object v0

    .line 1650
    invoke-static {v0}, Landroidx/core/graphics/Insets;->toCompatInsets(Landroid/graphics/Insets;)Landroidx/core/graphics/Insets;

    move-result-object v0

    return-object v0
.end method

.method public isVisible(I)Z
    .registers 4
    .param p1, "typeMask"    # I

    .line 1657
    iget-object v0, p0, Landroidx/core/view/WindowInsetsCompat$Impl30;->mPlatformInsets:Landroid/view/WindowInsets;

    invoke-static {p1}, Landroidx/core/view/WindowInsetsCompat$TypeImpl30;->toPlatformType(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/WindowInsets;->isVisible(I)Z

    move-result v0

    return v0
.end method
