.class Landroidx/core/view/WindowInsetsCompat$Impl;
.super Ljava/lang/Object;
.source "WindowInsetsCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/core/view/WindowInsetsCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Impl"
.end annotation


# static fields
.field static final CONSUMED:Landroidx/core/view/WindowInsetsCompat;


# instance fields
.field final mHost:Landroidx/core/view/WindowInsetsCompat;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 854
    new-instance v0, Landroidx/core/view/WindowInsetsCompat$Builder;

    invoke-direct {v0}, Landroidx/core/view/WindowInsetsCompat$Builder;-><init>()V

    .line 855
    invoke-virtual {v0}, Landroidx/core/view/WindowInsetsCompat$Builder;->build()Landroidx/core/view/WindowInsetsCompat;

    move-result-object v0

    .line 856
    invoke-virtual {v0}, Landroidx/core/view/WindowInsetsCompat;->consumeDisplayCutout()Landroidx/core/view/WindowInsetsCompat;

    move-result-object v0

    .line 857
    invoke-virtual {v0}, Landroidx/core/view/WindowInsetsCompat;->consumeStableInsets()Landroidx/core/view/WindowInsetsCompat;

    move-result-object v0

    .line 858
    invoke-virtual {v0}, Landroidx/core/view/WindowInsetsCompat;->consumeSystemWindowInsets()Landroidx/core/view/WindowInsetsCompat;

    move-result-object v0

    sput-object v0, Landroidx/core/view/WindowInsetsCompat$Impl;->CONSUMED:Landroidx/core/view/WindowInsetsCompat;

    .line 854
    return-void
.end method

.method constructor <init>(Landroidx/core/view/WindowInsetsCompat;)V
    .registers 2
    .param p1, "host"    # Landroidx/core/view/WindowInsetsCompat;

    .line 862
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 863
    iput-object p1, p0, Landroidx/core/view/WindowInsetsCompat$Impl;->mHost:Landroidx/core/view/WindowInsetsCompat;

    .line 864
    return-void
.end method


# virtual methods
.method consumeDisplayCutout()Landroidx/core/view/WindowInsetsCompat;
    .registers 2

    .line 887
    iget-object v0, p0, Landroidx/core/view/WindowInsetsCompat$Impl;->mHost:Landroidx/core/view/WindowInsetsCompat;

    return-object v0
.end method

.method consumeStableInsets()Landroidx/core/view/WindowInsetsCompat;
    .registers 2

    .line 879
    iget-object v0, p0, Landroidx/core/view/WindowInsetsCompat$Impl;->mHost:Landroidx/core/view/WindowInsetsCompat;

    return-object v0
.end method

.method consumeSystemWindowInsets()Landroidx/core/view/WindowInsetsCompat;
    .registers 2

    .line 875
    iget-object v0, p0, Landroidx/core/view/WindowInsetsCompat$Impl;->mHost:Landroidx/core/view/WindowInsetsCompat;

    return-object v0
.end method

.method copyRootViewBounds(Landroid/view/View;)V
    .registers 2
    .param p1, "rootView"    # Landroid/view/View;

    .line 979
    return-void
.end method

.method copyWindowDataInto(Landroidx/core/view/WindowInsetsCompat;)V
    .registers 2
    .param p1, "other"    # Landroidx/core/view/WindowInsetsCompat;

    .line 991
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "o"    # Ljava/lang/Object;

    .line 955
    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    .line 956
    :cond_0
    instance-of v1, p1, Landroidx/core/view/WindowInsetsCompat$Impl;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    .line 957
    :cond_1
    move-object v1, p1

    check-cast v1, Landroidx/core/view/WindowInsetsCompat$Impl;

    .line 958
    .local v1, "impl":Landroidx/core/view/WindowInsetsCompat$Impl;
    invoke-virtual {p0}, Landroidx/core/view/WindowInsetsCompat$Impl;->isRound()Z

    move-result v3

    invoke-virtual {v1}, Landroidx/core/view/WindowInsetsCompat$Impl;->isRound()Z

    move-result v4

    if-ne v3, v4, :cond_2

    .line 959
    invoke-virtual {p0}, Landroidx/core/view/WindowInsetsCompat$Impl;->isConsumed()Z

    move-result v3

    invoke-virtual {v1}, Landroidx/core/view/WindowInsetsCompat$Impl;->isConsumed()Z

    move-result v4

    if-ne v3, v4, :cond_2

    .line 960
    invoke-virtual {p0}, Landroidx/core/view/WindowInsetsCompat$Impl;->getSystemWindowInsets()Landroidx/core/graphics/Insets;

    move-result-object v3

    invoke-virtual {v1}, Landroidx/core/view/WindowInsetsCompat$Impl;->getSystemWindowInsets()Landroidx/core/graphics/Insets;

    move-result-object v4

    invoke-static {v3, v4}, Landroidx/core/util/ObjectsCompat;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 961
    invoke-virtual {p0}, Landroidx/core/view/WindowInsetsCompat$Impl;->getStableInsets()Landroidx/core/graphics/Insets;

    move-result-object v3

    invoke-virtual {v1}, Landroidx/core/view/WindowInsetsCompat$Impl;->getStableInsets()Landroidx/core/graphics/Insets;

    move-result-object v4

    invoke-static {v3, v4}, Landroidx/core/util/ObjectsCompat;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 962
    invoke-virtual {p0}, Landroidx/core/view/WindowInsetsCompat$Impl;->getDisplayCutout()Landroidx/core/view/DisplayCutoutCompat;

    move-result-object v3

    invoke-virtual {v1}, Landroidx/core/view/WindowInsetsCompat$Impl;->getDisplayCutout()Landroidx/core/view/DisplayCutoutCompat;

    move-result-object v4

    invoke-static {v3, v4}, Landroidx/core/util/ObjectsCompat;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    goto :goto_0

    :cond_2
    move v0, v2

    .line 958
    :goto_0
    return v0
.end method

.method getBoundingRects(I)Ljava/util/List;
    .registers 3
    .param p1, "typeMask"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "Landroid/graphics/Rect;",
            ">;"
        }
    .end annotation

    .line 949
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method getBoundingRectsIgnoringVisibility(I)Ljava/util/List;
    .registers 3
    .param p1, "typeMask"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "Landroid/graphics/Rect;",
            ">;"
        }
    .end annotation

    .line 937
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method getDisplayCutout()Landroidx/core/view/DisplayCutoutCompat;
    .registers 2

    .line 883
    const/4 v0, 0x0

    return-object v0
.end method

.method getDisplayShape()Landroidx/core/view/DisplayShapeCompat;
    .registers 2

    .line 941
    sget-object v0, Landroidx/core/view/DisplayShapeCompat;->EMPTY:Landroidx/core/view/DisplayShapeCompat;

    return-object v0
.end method

.method getInsets(I)Landroidx/core/graphics/Insets;
    .registers 3
    .param p1, "typeMask"    # I

    .line 918
    sget-object v0, Landroidx/core/graphics/Insets;->NONE:Landroidx/core/graphics/Insets;

    return-object v0
.end method

.method getInsetsIgnoringVisibility(I)Landroidx/core/graphics/Insets;
    .registers 4
    .param p1, "typeMask"    # I

    .line 922
    and-int/lit8 v0, p1, 0x8

    if-nez v0, :cond_0

    .line 925
    sget-object v0, Landroidx/core/graphics/Insets;->NONE:Landroidx/core/graphics/Insets;

    return-object v0

    .line 923
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Unable to query the maximum insets for IME"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method getMandatorySystemGestureInsets()Landroidx/core/graphics/Insets;
    .registers 2

    .line 905
    invoke-virtual {p0}, Landroidx/core/view/WindowInsetsCompat$Impl;->getSystemWindowInsets()Landroidx/core/graphics/Insets;

    move-result-object v0

    return-object v0
.end method

.method getPrivacyIndicatorBounds()Landroid/graphics/Rect;
    .registers 2

    .line 945
    const/4 v0, 0x0

    return-object v0
.end method

.method getRoundedCorner(I)Landroidx/core/view/RoundedCornerCompat;
    .registers 3
    .param p1, "position"    # I

    .line 933
    const/4 v0, 0x0

    return-object v0
.end method

.method getStableInsets()Landroidx/core/graphics/Insets;
    .registers 2

    .line 895
    sget-object v0, Landroidx/core/graphics/Insets;->NONE:Landroidx/core/graphics/Insets;

    return-object v0
.end method

.method getSystemGestureInsets()Landroidx/core/graphics/Insets;
    .registers 2

    .line 900
    invoke-virtual {p0}, Landroidx/core/view/WindowInsetsCompat$Impl;->getSystemWindowInsets()Landroidx/core/graphics/Insets;

    move-result-object v0

    return-object v0
.end method

.method getSystemWindowInsets()Landroidx/core/graphics/Insets;
    .registers 2

    .line 891
    sget-object v0, Landroidx/core/graphics/Insets;->NONE:Landroidx/core/graphics/Insets;

    return-object v0
.end method

.method getTappableElementInsets()Landroidx/core/graphics/Insets;
    .registers 2

    .line 910
    invoke-virtual {p0}, Landroidx/core/view/WindowInsetsCompat$Impl;->getSystemWindowInsets()Landroidx/core/graphics/Insets;

    move-result-object v0

    return-object v0
.end method

.method public hashCode()I
    .registers 6

    .line 968
    invoke-virtual {p0}, Landroidx/core/view/WindowInsetsCompat$Impl;->isRound()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {p0}, Landroidx/core/view/WindowInsetsCompat$Impl;->isConsumed()Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {p0}, Landroidx/core/view/WindowInsetsCompat$Impl;->getSystemWindowInsets()Landroidx/core/graphics/Insets;

    move-result-object v2

    .line 969
    invoke-virtual {p0}, Landroidx/core/view/WindowInsetsCompat$Impl;->getStableInsets()Landroidx/core/graphics/Insets;

    move-result-object v3

    invoke-virtual {p0}, Landroidx/core/view/WindowInsetsCompat$Impl;->getDisplayCutout()Landroidx/core/view/DisplayCutoutCompat;

    move-result-object v4

    filled-new-array {v0, v1, v2, v3, v4}, [Ljava/lang/Object;

    move-result-object v0

    .line 968
    invoke-static {v0}, Landroidx/core/util/ObjectsCompat;->hash([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method initDisplayShape(Landroid/view/View;)V
    .registers 2
    .param p1, "rootView"    # Landroid/view/View;

    .line 982
    return-void
.end method

.method initTypeBoundingRectsMaps()V
    .registers 1

    .line 985
    return-void
.end method

.method inset(IIII)Landroidx/core/view/WindowInsetsCompat;
    .registers 6
    .param p1, "left"    # I
    .param p2, "top"    # I
    .param p3, "right"    # I
    .param p4, "bottom"    # I

    .line 914
    sget-object v0, Landroidx/core/view/WindowInsetsCompat$Impl;->CONSUMED:Landroidx/core/view/WindowInsetsCompat;

    return-object v0
.end method

.method isConsumed()Z
    .registers 2

    .line 871
    const/4 v0, 0x0

    return v0
.end method

.method isRound()Z
    .registers 2

    .line 867
    const/4 v0, 0x0

    return v0
.end method

.method isVisible(I)Z
    .registers 3
    .param p1, "typeMask"    # I

    .line 929
    const/4 v0, 0x1

    return v0
.end method

.method public setDisplayShape(Landroidx/core/view/DisplayShapeCompat;)V
    .registers 2
    .param p1, "displayShape"    # Landroidx/core/view/DisplayShapeCompat;

    .line 1000
    return-void
.end method

.method public setOverriddenInsets([Landroidx/core/graphics/Insets;)V
    .registers 2
    .param p1, "insetsTypeMask"    # [Landroidx/core/graphics/Insets;

    .line 994
    return-void
.end method

.method setRootViewData(Landroidx/core/graphics/Insets;)V
    .registers 2
    .param p1, "visibleInsets"    # Landroidx/core/graphics/Insets;

    .line 976
    return-void
.end method

.method setRootWindowInsets(Landroidx/core/view/WindowInsetsCompat;)V
    .registers 2
    .param p1, "rootWindowInsets"    # Landroidx/core/view/WindowInsetsCompat;

    .line 973
    return-void
.end method

.method public setStableInsets(Landroidx/core/graphics/Insets;)V
    .registers 2
    .param p1, "stableInsets"    # Landroidx/core/graphics/Insets;

    .line 997
    return-void
.end method

.method setSystemUiVisibility(I)V
    .registers 2
    .param p1, "systemUiVisibility"    # I

    .line 988
    return-void
.end method

.method setTypeBoundingRectsMap([[Landroid/graphics/Rect;)V
    .registers 2
    .param p1, "typeBoundingRectsMap"    # [[Landroid/graphics/Rect;

    .line 1003
    return-void
.end method

.method setTypeMaxBoundingRectsMap([[Landroid/graphics/Rect;)V
    .registers 2
    .param p1, "typeMaxBoundingRectsMap"    # [[Landroid/graphics/Rect;

    .line 1006
    return-void
.end method
