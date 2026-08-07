.class public Lcom/p1/mobile/putong/core/ui/match/view/MatchBlackShadowView;
.super Landroid/view/View;
.source "SourceFile"


# instance fields
.field public a:Landroid/graphics/Rect;

.field public b:Landroid/graphics/Paint;

.field public c:I

.field public d:I

.field public e:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/high16 p1, 0x3f800000    # 1.0f

    .line 5
    .line 6
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchBlackShadowView;->e:I

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchBlackShadowView;->a()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 16
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/high16 p1, 0x3f800000    # 1.0f

    .line 17
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchBlackShadowView;->e:I

    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchBlackShadowView;->a()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 19
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/high16 p1, 0x3f800000    # 1.0f

    .line 20
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchBlackShadowView;->e:I

    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchBlackShadowView;->a()V

    return-void
.end method

.method private setColorAndSize(Z)V
    .locals 10

    .line 1
    const/high16 v0, 0x43880000    # 272.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchBlackShadowView;->d:I

    .line 11
    .line 12
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchBlackShadowView;->c:I

    .line 13
    .line 14
    int-to-float v2, v2

    .line 15
    const v3, 0x3f0f5c29    # 0.56f

    .line 16
    .line 17
    .line 18
    div-float/2addr v2, v3

    .line 19
    float-to-int v2, v2

    .line 20
    sub-int/2addr p1, v2

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    move p1, v1

    .line 23
    :goto_0
    new-instance v2, Landroid/graphics/LinearGradient;

    .line 24
    .line 25
    add-int/2addr v0, p1

    .line 26
    int-to-float v6, v0

    .line 27
    const/high16 p1, -0x4d000000

    .line 28
    .line 29
    filled-new-array {v1, p1}, [I

    .line 30
    .line 31
    .line 32
    move-result-object v7

    .line 33
    const/4 v8, 0x0

    .line 34
    sget-object v9, Landroid/graphics/Shader$TileMode;->REPEAT:Landroid/graphics/Shader$TileMode;

    .line 35
    .line 36
    const/4 v3, 0x0

    .line 37
    const/4 v4, 0x0

    .line 38
    const/4 v5, 0x0

    .line 39
    invoke-direct/range {v2 .. v9}, Landroid/graphics/LinearGradient;-><init>(FFFF[I[FLandroid/graphics/Shader$TileMode;)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchBlackShadowView;->b:Landroid/graphics/Paint;

    .line 43
    .line 44
    invoke-virtual {p1, v2}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchBlackShadowView;->a:Landroid/graphics/Rect;

    .line 48
    .line 49
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchBlackShadowView;->e:I

    .line 50
    .line 51
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchBlackShadowView;->c:I

    .line 52
    .line 53
    invoke-virtual {p1, v1, v2, v3, v0}, Landroid/graphics/Rect;->set(IIII)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 57
    .line 58
    .line 59
    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    new-instance v0, Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchBlackShadowView;->b:Landroid/graphics/Paint;

    .line 7
    .line 8
    new-instance v0, Landroid/graphics/Rect;

    .line 9
    .line 10
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchBlackShadowView;->a:Landroid/graphics/Rect;

    .line 14
    .line 15
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchBlackShadowView;->c:I

    .line 5
    .line 6
    if-lez v0, :cond_0

    .line 7
    .line 8
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchBlackShadowView;->d:I

    .line 9
    .line 10
    if-lez v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchBlackShadowView;->a:Landroid/graphics/Rect;

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchBlackShadowView;->b:Landroid/graphics/Paint;

    .line 15
    .line 16
    invoke-virtual {p1, v0, p0}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public onMeasure(II)V
    .locals 3

    .line 1
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchBlackShadowView;->d:I

    .line 10
    .line 11
    if-ne v2, v0, :cond_0

    .line 12
    .line 13
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchBlackShadowView;->c:I

    .line 14
    .line 15
    if-eq v0, v1, :cond_2

    .line 16
    .line 17
    :cond_0
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchBlackShadowView;->d:I

    .line 22
    .line 23
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchBlackShadowView;->c:I

    .line 28
    .line 29
    int-to-float p1, p1

    .line 30
    iget p2, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchBlackShadowView;->d:I

    .line 31
    .line 32
    int-to-float p2, p2

    .line 33
    div-float/2addr p1, p2

    .line 34
    const p2, 0x3f0f5c29    # 0.56f

    .line 35
    .line 36
    .line 37
    cmpl-float p1, p1, p2

    .line 38
    .line 39
    if-lez p1, :cond_1

    .line 40
    .line 41
    const/4 p1, 0x0

    .line 42
    goto :goto_0

    .line 43
    :cond_1
    const/4 p1, 0x1

    .line 44
    :goto_0
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/match/view/MatchBlackShadowView;->setColorAndSize(Z)V

    .line 45
    .line 46
    .line 47
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchBlackShadowView;->a:Landroid/graphics/Rect;

    .line 48
    .line 49
    iget p2, p1, Landroid/graphics/Rect;->bottom:I

    .line 50
    .line 51
    iget p1, p1, Landroid/graphics/Rect;->top:I

    .line 52
    .line 53
    sub-int/2addr p2, p1

    .line 54
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchBlackShadowView;->c:I

    .line 55
    .line 56
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 57
    .line 58
    .line 59
    return-void
.end method
