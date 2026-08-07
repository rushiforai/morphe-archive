.class public Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$c;
.super Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "c"
.end annotation


# instance fields
.field public i:I


# direct methods
.method public constructor <init>(Landroid/content/res/TypedArray;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;-><init>(Landroid/content/res/TypedArray;)V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/vhc0;->N:I

    .line 5
    .line 6
    const/16 v1, 0x64

    .line 7
    .line 8
    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$c;->i:I

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public c()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;->a:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public e(Landroid/graphics/Canvas;IIII)V
    .locals 1

    .line 1
    sub-int/2addr p5, p3

    .line 2
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;->b:Landroid/graphics/drawable/Drawable;

    .line 3
    .line 4
    invoke-virtual {p2}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    .line 5
    .line 6
    .line 7
    move-result p2

    .line 8
    sub-int/2addr p5, p2

    .line 9
    div-int/lit8 p5, p5, 0x2

    .line 10
    .line 11
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;->b:Landroid/graphics/drawable/Drawable;

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    add-int/2addr p2, p5

    .line 15
    invoke-virtual {p3, v0, p5, p4, p2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;->b:Landroid/graphics/drawable/Drawable;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public f(Landroid/graphics/Canvas;IIII)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;->f:I

    .line 2
    .line 3
    if-gtz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$c;->i:I

    .line 7
    .line 8
    if-le v0, v1, :cond_1

    .line 9
    .line 10
    iput v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;->f:I

    .line 11
    .line 12
    :cond_1
    sub-int/2addr p5, p3

    .line 13
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;->c:Landroid/graphics/drawable/Drawable;

    .line 14
    .line 15
    invoke-virtual {p3}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    .line 16
    .line 17
    .line 18
    move-result p3

    .line 19
    sub-int/2addr p5, p3

    .line 20
    div-int/lit8 p5, p5, 0x2

    .line 21
    .line 22
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;->f:I

    .line 23
    .line 24
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    int-to-float v0, v0

    .line 29
    const/high16 v1, 0x3f800000    # 1.0f

    .line 30
    .line 31
    mul-float/2addr v0, v1

    .line 32
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$c;->i:I

    .line 33
    .line 34
    int-to-float v1, v1

    .line 35
    div-float/2addr v0, v1

    .line 36
    sub-int/2addr p4, p2

    .line 37
    int-to-float p2, p4

    .line 38
    mul-float/2addr v0, p2

    .line 39
    float-to-int p2, v0

    .line 40
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;->c:Landroid/graphics/drawable/Drawable;

    .line 41
    .line 42
    const/4 v0, 0x0

    .line 43
    add-int/2addr p3, p5

    .line 44
    invoke-virtual {p4, v0, p5, p2, p3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 45
    .line 46
    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;->c:Landroid/graphics/drawable/Drawable;

    .line 48
    .line 49
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public g(Landroid/graphics/Canvas;IIII)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;->f:I

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    int-to-float v0, v0

    .line 8
    const/high16 v1, 0x3f800000    # 1.0f

    .line 9
    .line 10
    mul-float/2addr v0, v1

    .line 11
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$c;->i:I

    .line 12
    .line 13
    int-to-float v1, v1

    .line 14
    div-float/2addr v0, v1

    .line 15
    sub-int/2addr p4, p2

    .line 16
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;->a:Landroid/graphics/drawable/Drawable;

    .line 17
    .line 18
    invoke-virtual {p2}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 19
    .line 20
    .line 21
    move-result p2

    .line 22
    sub-int/2addr p4, p2

    .line 23
    int-to-float p2, p4

    .line 24
    mul-float/2addr v0, p2

    .line 25
    float-to-int p2, v0

    .line 26
    sub-int/2addr p5, p3

    .line 27
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;->a:Landroid/graphics/drawable/Drawable;

    .line 28
    .line 29
    invoke-virtual {p3}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    .line 30
    .line 31
    .line 32
    move-result p3

    .line 33
    sub-int/2addr p5, p3

    .line 34
    div-int/lit8 p5, p5, 0x2

    .line 35
    .line 36
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;->a:Landroid/graphics/drawable/Drawable;

    .line 37
    .line 38
    invoke-virtual {p4}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 39
    .line 40
    .line 41
    move-result p4

    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;->a:Landroid/graphics/drawable/Drawable;

    .line 43
    .line 44
    add-int/2addr p4, p2

    .line 45
    add-int/2addr p3, p5

    .line 46
    invoke-virtual {v0, p2, p5, p4, p3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;->a:Landroid/graphics/drawable/Drawable;

    .line 50
    .line 51
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public h(Landroid/graphics/Canvas;IIII)V
    .locals 2

    .line 1
    iget p3, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;->f:I

    .line 2
    .line 3
    invoke-static {p3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p3

    .line 7
    iget-object p5, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;->g:Landroid/graphics/Paint;

    .line 8
    .line 9
    invoke-virtual {p5, p3}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 10
    .line 11
    .line 12
    move-result p5

    .line 13
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;->f:I

    .line 14
    .line 15
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    int-to-float v0, v0

    .line 20
    const/high16 v1, 0x3f800000    # 1.0f

    .line 21
    .line 22
    mul-float/2addr v0, v1

    .line 23
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$c;->i:I

    .line 24
    .line 25
    int-to-float v1, v1

    .line 26
    div-float/2addr v0, v1

    .line 27
    sub-int/2addr p4, p2

    .line 28
    int-to-float p2, p4

    .line 29
    mul-float/2addr v0, p2

    .line 30
    float-to-int p2, v0

    .line 31
    int-to-float p2, p2

    .line 32
    const/high16 p4, 0x40000000    # 2.0f

    .line 33
    .line 34
    div-float/2addr p5, p4

    .line 35
    sub-float/2addr p2, p5

    .line 36
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;->g:Landroid/graphics/Paint;

    .line 37
    .line 38
    invoke-virtual {p4}, Landroid/graphics/Paint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    .line 39
    .line 40
    .line 41
    move-result-object p4

    .line 42
    iget p4, p4, Landroid/graphics/Paint$FontMetrics;->descent:F

    .line 43
    .line 44
    neg-float p4, p4

    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;->g:Landroid/graphics/Paint;

    .line 46
    .line 47
    invoke-virtual {p1, p3, p2, p4, p0}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public j(FI)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;->a:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sub-int/2addr p2, v0

    .line 8
    int-to-float p2, p2

    .line 9
    div-float/2addr p1, p2

    .line 10
    const/high16 p2, 0x42c80000    # 100.0f

    .line 11
    .line 12
    mul-float/2addr p1, p2

    .line 13
    float-to-int p1, p1

    .line 14
    iget p2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$c;->i:I

    .line 15
    .line 16
    if-le p1, p2, :cond_0

    .line 17
    .line 18
    move p1, p2

    .line 19
    :cond_0
    iget p2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;->f:I

    .line 20
    .line 21
    if-eq p1, p2, :cond_1

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;->k(I)V

    .line 24
    .line 25
    .line 26
    :cond_1
    return-void
.end method
