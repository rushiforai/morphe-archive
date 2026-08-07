.class public Lcom/p1/mobile/putong/core/ui/match/view/MatchTransView;
.super Landroid/view/View;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:I

.field public c:Landroid/graphics/Paint;

.field public d:Landroid/graphics/Paint;

.field public e:Landroid/graphics/Rect;

.field public f:Landroid/graphics/Rect;

.field public g:I

.field public h:Z

.field public i:Z

.field public j:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const p1, -0x232324

    .line 5
    .line 6
    .line 7
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchTransView;->g:I

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchTransView;->h:Z

    .line 11
    .line 12
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchTransView;->i:Z

    .line 13
    .line 14
    const/high16 p1, 0x3f800000    # 1.0f

    .line 15
    .line 16
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchTransView;->j:I

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchTransView;->a()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 26
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const p1, -0x232324

    .line 27
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchTransView;->g:I

    const/4 p1, 0x0

    .line 28
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchTransView;->h:Z

    .line 29
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchTransView;->i:Z

    const/high16 p1, 0x3f800000    # 1.0f

    .line 30
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchTransView;->j:I

    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchTransView;->a()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 32
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const p1, -0x232324

    .line 33
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchTransView;->g:I

    const/4 p1, 0x0

    .line 34
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchTransView;->h:Z

    .line 35
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchTransView;->i:Z

    const/high16 p1, 0x3f800000    # 1.0f

    .line 36
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchTransView;->j:I

    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchTransView;->a()V

    return-void
.end method

.method private setColorAndSize(Z)V
    .locals 13

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
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchTransView;->b:I

    .line 11
    .line 12
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchTransView;->a:I

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
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchTransView;->f:Landroid/graphics/Rect;

    .line 24
    .line 25
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchTransView;->b:I

    .line 26
    .line 27
    sub-int v4, v3, p1

    .line 28
    .line 29
    iget v5, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchTransView;->a:I

    .line 30
    .line 31
    invoke-virtual {v2, v1, v4, v5, v3}, Landroid/graphics/Rect;->set(IIII)V

    .line 32
    .line 33
    .line 34
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchTransView;->b:I

    .line 35
    .line 36
    sub-int v3, v2, p1

    .line 37
    .line 38
    sub-int/2addr v3, v0

    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchTransView;->e:Landroid/graphics/Rect;

    .line 40
    .line 41
    iget v4, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchTransView;->j:I

    .line 42
    .line 43
    add-int/2addr v3, v4

    .line 44
    iget v4, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchTransView;->a:I

    .line 45
    .line 46
    sub-int/2addr v2, p1

    .line 47
    invoke-virtual {v0, v1, v3, v4, v2}, Landroid/graphics/Rect;->set(IIII)V

    .line 48
    .line 49
    .line 50
    new-instance v5, Landroid/graphics/LinearGradient;

    .line 51
    .line 52
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchTransView;->e:Landroid/graphics/Rect;

    .line 53
    .line 54
    iget v0, p1, Landroid/graphics/Rect;->top:I

    .line 55
    .line 56
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchTransView;->j:I

    .line 57
    .line 58
    sub-int/2addr v0, v2

    .line 59
    int-to-float v7, v0

    .line 60
    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    .line 61
    .line 62
    int-to-float v9, p1

    .line 63
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchTransView;->g:I

    .line 64
    .line 65
    filled-new-array {v1, p1}, [I

    .line 66
    .line 67
    .line 68
    move-result-object v10

    .line 69
    const/4 v11, 0x0

    .line 70
    sget-object v12, Landroid/graphics/Shader$TileMode;->REPEAT:Landroid/graphics/Shader$TileMode;

    .line 71
    .line 72
    const/4 v6, 0x0

    .line 73
    const/4 v8, 0x0

    .line 74
    invoke-direct/range {v5 .. v12}, Landroid/graphics/LinearGradient;-><init>(FFFF[I[FLandroid/graphics/Shader$TileMode;)V

    .line 75
    .line 76
    .line 77
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchTransView;->d:Landroid/graphics/Paint;

    .line 78
    .line 79
    invoke-virtual {p0, v5}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 80
    .line 81
    .line 82
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 2

    .line 1
    new-instance v0, Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchTransView;->d:Landroid/graphics/Paint;

    .line 7
    .line 8
    new-instance v0, Landroid/graphics/Paint;

    .line 9
    .line 10
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchTransView;->c:Landroid/graphics/Paint;

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchTransView;->d:Landroid/graphics/Paint;

    .line 16
    .line 17
    const/4 v1, 0x1

    .line 18
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 19
    .line 20
    .line 21
    new-instance v0, Landroid/graphics/Rect;

    .line 22
    .line 23
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchTransView;->e:Landroid/graphics/Rect;

    .line 27
    .line 28
    new-instance v0, Landroid/graphics/Rect;

    .line 29
    .line 30
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchTransView;->f:Landroid/graphics/Rect;

    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchTransView;->c:Landroid/graphics/Paint;

    .line 36
    .line 37
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchTransView;->g:I

    .line 38
    .line 39
    invoke-virtual {v0, p0}, Landroid/graphics/Paint;->setColor(I)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchTransView;->a:I

    .line 5
    .line 6
    if-lez v0, :cond_1

    .line 7
    .line 8
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchTransView;->b:I

    .line 9
    .line 10
    if-lez v0, :cond_1

    .line 11
    .line 12
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchTransView;->i:Z

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchTransView;->e:Landroid/graphics/Rect;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchTransView;->d:Landroid/graphics/Paint;

    .line 19
    .line 20
    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchTransView;->h:Z

    .line 24
    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchTransView;->f:Landroid/graphics/Rect;

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchTransView;->c:Landroid/graphics/Paint;

    .line 30
    .line 31
    invoke-virtual {p1, v0, p0}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 32
    .line 33
    .line 34
    :cond_1
    return-void
.end method

.method public onMeasure(II)V
    .locals 3

    .line 1
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchTransView;->b:I

    .line 13
    .line 14
    if-ne v2, v0, :cond_1

    .line 15
    .line 16
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchTransView;->a:I

    .line 17
    .line 18
    if-eq v0, v1, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    return-void

    .line 22
    :cond_1
    :goto_0
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchTransView;->b:I

    .line 27
    .line 28
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchTransView;->a:I

    .line 33
    .line 34
    int-to-float p1, p1

    .line 35
    iget p2, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchTransView;->b:I

    .line 36
    .line 37
    int-to-float p2, p2

    .line 38
    div-float/2addr p1, p2

    .line 39
    const p2, 0x3f0f5c29    # 0.56f

    .line 40
    .line 41
    .line 42
    cmpl-float p1, p1, p2

    .line 43
    .line 44
    const/4 p2, 0x1

    .line 45
    if-lez p1, :cond_2

    .line 46
    .line 47
    const/4 p1, 0x0

    .line 48
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchTransView;->h:Z

    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_2
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchTransView;->h:Z

    .line 52
    .line 53
    :goto_1
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchTransView;->i:Z

    .line 54
    .line 55
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchTransView;->h:Z

    .line 56
    .line 57
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/match/view/MatchTransView;->setColorAndSize(Z)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public setRenderColor(I)V
    .locals 9

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchTransView;->g:I

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchTransView;->c:Landroid/graphics/Paint;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 6
    .line 7
    .line 8
    new-instance v1, Landroid/graphics/LinearGradient;

    .line 9
    .line 10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchTransView;->e:Landroid/graphics/Rect;

    .line 11
    .line 12
    iget v0, p1, Landroid/graphics/Rect;->top:I

    .line 13
    .line 14
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchTransView;->j:I

    .line 15
    .line 16
    sub-int/2addr v0, v2

    .line 17
    int-to-float v3, v0

    .line 18
    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    .line 19
    .line 20
    int-to-float v5, p1

    .line 21
    const/4 p1, 0x0

    .line 22
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchTransView;->g:I

    .line 23
    .line 24
    filled-new-array {p1, v0}, [I

    .line 25
    .line 26
    .line 27
    move-result-object v6

    .line 28
    const/4 v7, 0x0

    .line 29
    sget-object v8, Landroid/graphics/Shader$TileMode;->REPEAT:Landroid/graphics/Shader$TileMode;

    .line 30
    .line 31
    const/4 v2, 0x0

    .line 32
    const/4 v4, 0x0

    .line 33
    invoke-direct/range {v1 .. v8}, Landroid/graphics/LinearGradient;-><init>(FFFF[I[FLandroid/graphics/Shader$TileMode;)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchTransView;->d:Landroid/graphics/Paint;

    .line 37
    .line 38
    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 42
    .line 43
    .line 44
    return-void
.end method
