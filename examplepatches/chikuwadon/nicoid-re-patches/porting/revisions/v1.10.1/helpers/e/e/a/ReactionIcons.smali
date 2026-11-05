.class public final Le/e/a/ReactionIcons;
.super Ljava/lang/Object;
.source "ReactionIcons.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/ReactionIcons$Face;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static mix(IIF)I
    .registers 7

    .line 4
    invoke-static {p0}, Landroid/graphics/Color;->red(I)I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x3f800000    # 1.0f

    sub-float/2addr v1, p2

    mul-float v0, v0, v1

    invoke-static {p1}, Landroid/graphics/Color;->red(I)I

    move-result v2

    int-to-float v2, v2

    mul-float v2, v2, p2

    add-float/2addr v0, v2

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    invoke-static {p0}, Landroid/graphics/Color;->green(I)I

    move-result v2

    int-to-float v2, v2

    mul-float v2, v2, v1

    invoke-static {p1}, Landroid/graphics/Color;->green(I)I

    move-result v3

    int-to-float v3, v3

    mul-float v3, v3, p2

    add-float/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    invoke-static {p0}, Landroid/graphics/Color;->blue(I)I

    move-result p0

    int-to-float p0, p0

    mul-float p0, p0, v1

    invoke-static {p1}, Landroid/graphics/Color;->blue(I)I

    move-result p1

    int-to-float p1, p1

    mul-float p1, p1, p2

    add-float/2addr p0, p1

    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    move-result p0

    invoke-static {v0, v2, p0}, Landroid/graphics/Color;->rgb(III)I

    move-result p0

    return p0
.end method

.method static neutral(Landroid/view/View;)I
    .registers 4

    .line 5
    invoke-static {p0}, Le/e/a/ThemeChoice;->textColor(Landroid/view/View;)I

    move-result p0

    invoke-static {p0}, Landroid/graphics/Color;->red(I)I

    move-result v0

    int-to-float v0, v0

    const v1, 0x3e991687    # 0.299f

    mul-float v0, v0, v1

    invoke-static {p0}, Landroid/graphics/Color;->green(I)I

    move-result v1

    int-to-float v1, v1

    const v2, 0x3f1645a2    # 0.587f

    mul-float v1, v1, v2

    add-float/2addr v0, v1

    invoke-static {p0}, Landroid/graphics/Color;->blue(I)I

    move-result p0

    int-to-float p0, p0

    const v1, 0x3de978d5    # 0.114f

    mul-float p0, p0, v1

    add-float/2addr v0, p0

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result p0

    invoke-static {p0, p0, p0}, Landroid/graphics/Color;->rgb(III)I

    move-result p0

    return p0
.end method

.method static selected(Landroid/view/View;Z)I
    .registers 3

    .line 6
    invoke-static {p0}, Le/e/a/ReactionIcons;->neutral(Landroid/view/View;)I

    move-result p0

    if-eqz p1, :cond_a

    const p1, -0x475e9b

    goto :goto_d

    :cond_a
    const p1, -0x428273

    :goto_d
    const v0, 0x3f19999a    # 0.6f

    invoke-static {p0, p1, v0}, Le/e/a/ReactionIcons;->mix(IIF)I

    move-result p0

    return p0
.end method
