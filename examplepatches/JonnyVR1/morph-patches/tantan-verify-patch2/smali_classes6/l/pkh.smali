.class public Ll/pkh;
.super Landroid/view/ViewOutlineProvider;
.source "SourceFile"


# instance fields
.field public a:F

.field public b:Z


# direct methods
.method public constructor <init>(F)V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/view/ViewOutlineProvider;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/pkh;->a:F

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getOutline(Landroid/view/View;Landroid/graphics/Outline;)V
    .locals 9

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    .line 7
    .line 8
    .line 9
    new-instance p1, Landroid/graphics/Rect;

    .line 10
    .line 11
    iget v1, v0, Landroid/graphics/Rect;->right:I

    .line 12
    .line 13
    iget v2, v0, Landroid/graphics/Rect;->left:I

    .line 14
    .line 15
    sub-int/2addr v1, v2

    .line 16
    iget v2, v0, Landroid/graphics/Rect;->bottom:I

    .line 17
    .line 18
    iget v3, v0, Landroid/graphics/Rect;->top:I

    .line 19
    .line 20
    sub-int/2addr v2, v3

    .line 21
    const/4 v4, 0x0

    .line 22
    const/4 v5, 0x0

    .line 23
    invoke-direct {p1, v4, v5, v1, v2}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 24
    .line 25
    .line 26
    iget-boolean v1, p0, Ll/pkh;->b:Z

    .line 27
    .line 28
    if-eqz v1, :cond_0

    .line 29
    .line 30
    iget p1, v0, Landroid/graphics/Rect;->right:I

    .line 31
    .line 32
    iget v1, v0, Landroid/graphics/Rect;->left:I

    .line 33
    .line 34
    sub-int v6, p1, v1

    .line 35
    .line 36
    iget p1, v0, Landroid/graphics/Rect;->bottom:I

    .line 37
    .line 38
    iget v0, v0, Landroid/graphics/Rect;->top:I

    .line 39
    .line 40
    sub-int/2addr p1, v0

    .line 41
    add-int/lit8 v7, p1, 0x28

    .line 42
    .line 43
    iget v8, p0, Ll/pkh;->a:F

    .line 44
    .line 45
    move-object v3, p2

    .line 46
    invoke-virtual/range {v3 .. v8}, Landroid/graphics/Outline;->setRoundRect(IIIIF)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_0
    move-object v3, p2

    .line 51
    iget p0, p0, Ll/pkh;->a:F

    .line 52
    .line 53
    invoke-virtual {v3, p1, p0}, Landroid/graphics/Outline;->setRoundRect(Landroid/graphics/Rect;F)V

    .line 54
    .line 55
    .line 56
    return-void
.end method
