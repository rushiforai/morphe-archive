.class Landroidx/core/view/WindowInsetsCompat$BuilderImpl;
.super Ljava/lang/Object;
.source "WindowInsetsCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/core/view/WindowInsetsCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "BuilderImpl"
.end annotation


# instance fields
.field mDisplayShapeCompat:Landroidx/core/view/DisplayShapeCompat;

.field private final mInsets:Landroidx/core/view/WindowInsetsCompat;

.field mInsetsTypeMask:[Landroidx/core/graphics/Insets;

.field mTypeBoundingRectsMap:[[Landroid/graphics/Rect;

.field mTypeMaxBoundingRectsMap:[[Landroid/graphics/Rect;


# direct methods
.method constructor <init>()V
    .registers 4

    .line 2081
    new-instance v0, Landroidx/core/view/WindowInsetsCompat;

    const/4 v1, 0x0

    move-object v2, v1

    check-cast v2, Landroidx/core/view/WindowInsetsCompat;

    invoke-direct {v0, v1}, Landroidx/core/view/WindowInsetsCompat;-><init>(Landroidx/core/view/WindowInsetsCompat;)V

    invoke-direct {p0, v0}, Landroidx/core/view/WindowInsetsCompat$BuilderImpl;-><init>(Landroidx/core/view/WindowInsetsCompat;)V

    .line 2082
    return-void
.end method

.method constructor <init>(Landroidx/core/view/WindowInsetsCompat;)V
    .registers 4
    .param p1, "insets"    # Landroidx/core/view/WindowInsetsCompat;

    .line 2084
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2077
    const/16 v0, 0xa

    new-array v1, v0, [[Landroid/graphics/Rect;

    iput-object v1, p0, Landroidx/core/view/WindowInsetsCompat$BuilderImpl;->mTypeBoundingRectsMap:[[Landroid/graphics/Rect;

    .line 2078
    new-array v0, v0, [[Landroid/graphics/Rect;

    iput-object v0, p0, Landroidx/core/view/WindowInsetsCompat$BuilderImpl;->mTypeMaxBoundingRectsMap:[[Landroid/graphics/Rect;

    .line 2085
    iput-object p1, p0, Landroidx/core/view/WindowInsetsCompat$BuilderImpl;->mInsets:Landroidx/core/view/WindowInsetsCompat;

    .line 2086
    invoke-virtual {p0, p1}, Landroidx/core/view/WindowInsetsCompat$BuilderImpl;->initTypeBoundingRects(Landroidx/core/view/WindowInsetsCompat;)V

    .line 2087
    return-void
.end method


# virtual methods
.method protected final applyInsetTypes()V
    .registers 6

    .line 2191
    iget-object v0, p0, Landroidx/core/view/WindowInsetsCompat$BuilderImpl;->mInsetsTypeMask:[Landroidx/core/graphics/Insets;

    if-eqz v0, :cond_4

    .line 2192
    iget-object v0, p0, Landroidx/core/view/WindowInsetsCompat$BuilderImpl;->mInsetsTypeMask:[Landroidx/core/graphics/Insets;

    const/4 v1, 0x1

    invoke-static {v1}, Landroidx/core/view/WindowInsetsCompat$Type;->indexOf(I)I

    move-result v2

    aget-object v0, v0, v2

    .line 2193
    .local v0, "statusBars":Landroidx/core/graphics/Insets;
    iget-object v2, p0, Landroidx/core/view/WindowInsetsCompat$BuilderImpl;->mInsetsTypeMask:[Landroidx/core/graphics/Insets;

    const/4 v3, 0x2

    invoke-static {v3}, Landroidx/core/view/WindowInsetsCompat$Type;->indexOf(I)I

    move-result v4

    aget-object v2, v2, v4

    .line 2197
    .local v2, "navigationBars":Landroidx/core/graphics/Insets;
    if-nez v2, :cond_0

    .line 2198
    iget-object v4, p0, Landroidx/core/view/WindowInsetsCompat$BuilderImpl;->mInsets:Landroidx/core/view/WindowInsetsCompat;

    invoke-virtual {v4, v3}, Landroidx/core/view/WindowInsetsCompat;->getInsets(I)Landroidx/core/graphics/Insets;

    move-result-object v2

    .line 2200
    :cond_0
    if-nez v0, :cond_1

    .line 2201
    iget-object v3, p0, Landroidx/core/view/WindowInsetsCompat$BuilderImpl;->mInsets:Landroidx/core/view/WindowInsetsCompat;

    invoke-virtual {v3, v1}, Landroidx/core/view/WindowInsetsCompat;->getInsets(I)Landroidx/core/graphics/Insets;

    move-result-object v0

    .line 2204
    :cond_1
    invoke-static {v0, v2}, Landroidx/core/graphics/Insets;->max(Landroidx/core/graphics/Insets;Landroidx/core/graphics/Insets;)Landroidx/core/graphics/Insets;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroidx/core/view/WindowInsetsCompat$BuilderImpl;->setSystemWindowInsets(Landroidx/core/graphics/Insets;)V

    .line 2206
    iget-object v1, p0, Landroidx/core/view/WindowInsetsCompat$BuilderImpl;->mInsetsTypeMask:[Landroidx/core/graphics/Insets;

    const/16 v3, 0x10

    invoke-static {v3}, Landroidx/core/view/WindowInsetsCompat$Type;->indexOf(I)I

    move-result v3

    aget-object v1, v1, v3

    .line 2207
    .local v1, "i":Landroidx/core/graphics/Insets;
    if-eqz v1, :cond_2

    invoke-virtual {p0, v1}, Landroidx/core/view/WindowInsetsCompat$BuilderImpl;->setSystemGestureInsets(Landroidx/core/graphics/Insets;)V

    .line 2209
    :cond_2
    iget-object v3, p0, Landroidx/core/view/WindowInsetsCompat$BuilderImpl;->mInsetsTypeMask:[Landroidx/core/graphics/Insets;

    const/16 v4, 0x20

    invoke-static {v4}, Landroidx/core/view/WindowInsetsCompat$Type;->indexOf(I)I

    move-result v4

    aget-object v1, v3, v4

    .line 2210
    if-eqz v1, :cond_3

    invoke-virtual {p0, v1}, Landroidx/core/view/WindowInsetsCompat$BuilderImpl;->setMandatorySystemGestureInsets(Landroidx/core/graphics/Insets;)V

    .line 2212
    :cond_3
    iget-object v3, p0, Landroidx/core/view/WindowInsetsCompat$BuilderImpl;->mInsetsTypeMask:[Landroidx/core/graphics/Insets;

    const/16 v4, 0x40

    invoke-static {v4}, Landroidx/core/view/WindowInsetsCompat$Type;->indexOf(I)I

    move-result v4

    aget-object v1, v3, v4

    .line 2213
    if-eqz v1, :cond_4

    invoke-virtual {p0, v1}, Landroidx/core/view/WindowInsetsCompat$BuilderImpl;->setTappableElementInsets(Landroidx/core/graphics/Insets;)V

    .line 2215
    .end local v0    # "statusBars":Landroidx/core/graphics/Insets;
    .end local v1    # "i":Landroidx/core/graphics/Insets;
    .end local v2    # "navigationBars":Landroidx/core/graphics/Insets;
    :cond_4
    return-void
.end method

.method build()Landroidx/core/view/WindowInsetsCompat;
    .registers 2

    .line 2218
    invoke-virtual {p0}, Landroidx/core/view/WindowInsetsCompat$BuilderImpl;->applyInsetTypes()V

    .line 2219
    iget-object v0, p0, Landroidx/core/view/WindowInsetsCompat$BuilderImpl;->mInsets:Landroidx/core/view/WindowInsetsCompat;

    return-object v0
.end method

.method initTypeBoundingRects(Landroidx/core/view/WindowInsetsCompat;)V
    .registers 8
    .param p1, "insets"    # Landroidx/core/view/WindowInsetsCompat;

    .line 2169
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_0
    const/16 v1, 0x200

    if-gt v0, v1, :cond_1

    .line 2170
    invoke-virtual {p1, v0}, Landroidx/core/view/WindowInsetsCompat;->getBoundingRects(I)Ljava/util/List;

    move-result-object v1

    .line 2171
    .local v1, "boundingRectsForType":Ljava/util/List;, "Ljava/util/List<Landroid/graphics/Rect;>;"
    invoke-static {v0}, Landroidx/core/view/WindowInsetsCompat$Type;->indexOf(I)I

    move-result v2

    .line 2172
    .local v2, "index":I
    iget-object v3, p0, Landroidx/core/view/WindowInsetsCompat$BuilderImpl;->mTypeBoundingRectsMap:[[Landroid/graphics/Rect;

    .line 2173
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v4

    new-array v4, v4, [Landroid/graphics/Rect;

    invoke-interface {v1, v4}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Landroid/graphics/Rect;

    aput-object v4, v3, v2

    .line 2175
    const/16 v3, 0x8

    if-eq v0, v3, :cond_0

    .line 2176
    nop

    .line 2177
    invoke-virtual {p1, v0}, Landroidx/core/view/WindowInsetsCompat;->getBoundingRectsIgnoringVisibility(I)Ljava/util/List;

    move-result-object v3

    .line 2178
    .local v3, "boundingRectsForTypeIgnoringVisibility":Ljava/util/List;, "Ljava/util/List<Landroid/graphics/Rect;>;"
    iget-object v4, p0, Landroidx/core/view/WindowInsetsCompat$BuilderImpl;->mTypeMaxBoundingRectsMap:[[Landroid/graphics/Rect;

    .line 2180
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v5

    new-array v5, v5, [Landroid/graphics/Rect;

    .line 2179
    invoke-interface {v3, v5}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Landroid/graphics/Rect;

    aput-object v5, v4, v2

    .line 2169
    .end local v1    # "boundingRectsForType":Ljava/util/List;, "Ljava/util/List<Landroid/graphics/Rect;>;"
    .end local v2    # "index":I
    .end local v3    # "boundingRectsForTypeIgnoringVisibility":Ljava/util/List;, "Ljava/util/List<Landroid/graphics/Rect;>;"
    :cond_0
    shl-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 2183
    .end local v0    # "i":I
    :cond_1
    return-void
.end method

.method setBoundingRects(ILjava/util/List;)V
    .registers 7
    .param p1, "typeMask"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Landroid/graphics/Rect;",
            ">;)V"
        }
    .end annotation

    .line 2144
    .local p2, "rects":Ljava/util/List;, "Ljava/util/List<Landroid/graphics/Rect;>;"
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_0
    const/16 v1, 0x200

    if-gt v0, v1, :cond_1

    .line 2145
    and-int v1, p1, v0

    if-nez v1, :cond_0

    .line 2146
    goto :goto_1

    .line 2148
    :cond_0
    iget-object v1, p0, Landroidx/core/view/WindowInsetsCompat$BuilderImpl;->mTypeBoundingRectsMap:[[Landroid/graphics/Rect;

    invoke-static {v0}, Landroidx/core/view/WindowInsetsCompat$Type;->indexOf(I)I

    move-result v2

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v3

    new-array v3, v3, [Landroid/graphics/Rect;

    invoke-interface {p2, v3}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Landroid/graphics/Rect;

    aput-object v3, v1, v2

    .line 2144
    :goto_1
    shl-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 2150
    .end local v0    # "i":I
    :cond_1
    return-void
.end method

.method setBoundingRectsIgnoringVisibility(ILjava/util/List;)V
    .registers 7
    .param p1, "typeMask"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Landroid/graphics/Rect;",
            ">;)V"
        }
    .end annotation

    .line 2155
    .local p2, "rects":Ljava/util/List;, "Ljava/util/List<Landroid/graphics/Rect;>;"
    and-int/lit8 v0, p1, 0x8

    if-nez v0, :cond_2

    .line 2159
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_0
    const/16 v1, 0x200

    if-gt v0, v1, :cond_1

    .line 2160
    and-int v1, p1, v0

    if-nez v1, :cond_0

    .line 2161
    goto :goto_1

    .line 2163
    :cond_0
    iget-object v1, p0, Landroidx/core/view/WindowInsetsCompat$BuilderImpl;->mTypeMaxBoundingRectsMap:[[Landroid/graphics/Rect;

    invoke-static {v0}, Landroidx/core/view/WindowInsetsCompat$Type;->indexOf(I)I

    move-result v2

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v3

    new-array v3, v3, [Landroid/graphics/Rect;

    invoke-interface {p2, v3}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Landroid/graphics/Rect;

    aput-object v3, v1, v2

    .line 2159
    :goto_1
    shl-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 2165
    .end local v0    # "i":I
    :cond_1
    return-void

    .line 2156
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Maximum bounding rects not available for IME"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method setDisplayCutout(Landroidx/core/view/DisplayCutoutCompat;)V
    .registers 2
    .param p1, "displayCutout"    # Landroidx/core/view/DisplayCutoutCompat;

    .line 2105
    return-void
.end method

.method setDisplayShape(Landroidx/core/view/DisplayShapeCompat;)V
    .registers 2
    .param p1, "displayShape"    # Landroidx/core/view/DisplayShapeCompat;

    .line 2139
    iput-object p1, p0, Landroidx/core/view/WindowInsetsCompat$BuilderImpl;->mDisplayShapeCompat:Landroidx/core/view/DisplayShapeCompat;

    .line 2140
    return-void
.end method

.method setInsets(ILandroidx/core/graphics/Insets;)V
    .registers 6
    .param p1, "typeMask"    # I
    .param p2, "insets"    # Landroidx/core/graphics/Insets;

    .line 2109
    iget-object v0, p0, Landroidx/core/view/WindowInsetsCompat$BuilderImpl;->mInsetsTypeMask:[Landroidx/core/graphics/Insets;

    if-nez v0, :cond_0

    .line 2110
    const/16 v0, 0xa

    new-array v0, v0, [Landroidx/core/graphics/Insets;

    iput-object v0, p0, Landroidx/core/view/WindowInsetsCompat$BuilderImpl;->mInsetsTypeMask:[Landroidx/core/graphics/Insets;

    .line 2112
    :cond_0
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_0
    const/16 v1, 0x200

    if-gt v0, v1, :cond_2

    .line 2113
    and-int v1, p1, v0

    if-nez v1, :cond_1

    .line 2114
    goto :goto_1

    .line 2116
    :cond_1
    iget-object v1, p0, Landroidx/core/view/WindowInsetsCompat$BuilderImpl;->mInsetsTypeMask:[Landroidx/core/graphics/Insets;

    invoke-static {v0}, Landroidx/core/view/WindowInsetsCompat$Type;->indexOf(I)I

    move-result v2

    aput-object p2, v1, v2

    .line 2112
    :goto_1
    shl-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 2118
    .end local v0    # "i":I
    :cond_2
    return-void
.end method

.method setInsetsIgnoringVisibility(ILandroidx/core/graphics/Insets;)V
    .registers 5
    .param p1, "typeMask"    # I
    .param p2, "insets"    # Landroidx/core/graphics/Insets;

    .line 2121
    const/16 v0, 0x8

    if-eq p1, v0, :cond_0

    .line 2127
    return-void

    .line 2124
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Ignoring visibility inset not available for IME"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method setMandatorySystemGestureInsets(Landroidx/core/graphics/Insets;)V
    .registers 2
    .param p1, "insets"    # Landroidx/core/graphics/Insets;

    .line 2096
    return-void
.end method

.method setPrivacyIndicatorBounds(Landroid/graphics/Rect;)V
    .registers 2
    .param p1, "bounds"    # Landroid/graphics/Rect;

    .line 2136
    return-void
.end method

.method setRoundedCorner(ILandroidx/core/view/RoundedCornerCompat;)V
    .registers 3
    .param p1, "position"    # I
    .param p2, "roundedCorner"    # Landroidx/core/view/RoundedCornerCompat;

    .line 2133
    return-void
.end method

.method setStableInsets(Landroidx/core/graphics/Insets;)V
    .registers 2
    .param p1, "insets"    # Landroidx/core/graphics/Insets;

    .line 2102
    return-void
.end method

.method setSystemGestureInsets(Landroidx/core/graphics/Insets;)V
    .registers 2
    .param p1, "insets"    # Landroidx/core/graphics/Insets;

    .line 2093
    return-void
.end method

.method setSystemWindowInsets(Landroidx/core/graphics/Insets;)V
    .registers 2
    .param p1, "insets"    # Landroidx/core/graphics/Insets;

    .line 2090
    return-void
.end method

.method setTappableElementInsets(Landroidx/core/graphics/Insets;)V
    .registers 2
    .param p1, "insets"    # Landroidx/core/graphics/Insets;

    .line 2099
    return-void
.end method

.method setVisible(IZ)V
    .registers 3
    .param p1, "typeMask"    # I
    .param p2, "visible"    # Z

    .line 2130
    return-void
.end method
