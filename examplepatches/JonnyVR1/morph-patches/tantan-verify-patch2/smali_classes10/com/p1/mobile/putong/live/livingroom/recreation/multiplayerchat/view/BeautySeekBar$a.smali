.class public Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$a;
.super Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public i:I

.field public j:I


# direct methods
.method public constructor <init>(Landroid/content/res/TypedArray;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;-><init>(Landroid/content/res/TypedArray;)V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/vhc0;->M:I

    .line 5
    .line 6
    const/16 v1, -0x32

    .line 7
    .line 8
    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$a;->i:I

    .line 13
    .line 14
    sget v0, Ll/vhc0;->O:I

    .line 15
    .line 16
    const/16 v1, 0x32

    .line 17
    .line 18
    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$a;->j:I

    .line 23
    .line 24
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
    .locals 4

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;->f:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$a;->i:I

    .line 7
    .line 8
    if-ge v0, v1, :cond_1

    .line 9
    .line 10
    iput v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;->f:I

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_1
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$a;->j:I

    .line 14
    .line 15
    if-le v0, v1, :cond_2

    .line 16
    .line 17
    iput v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;->f:I

    .line 18
    .line 19
    :cond_2
    :goto_0
    sub-int/2addr p5, p3

    .line 20
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;->c:Landroid/graphics/drawable/Drawable;

    .line 21
    .line 22
    invoke-virtual {p3}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    .line 23
    .line 24
    .line 25
    move-result p3

    .line 26
    sub-int/2addr p5, p3

    .line 27
    div-int/lit8 p5, p5, 0x2

    .line 28
    .line 29
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;->f:I

    .line 30
    .line 31
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    int-to-float v0, v0

    .line 36
    const/high16 v1, 0x3f800000    # 1.0f

    .line 37
    .line 38
    mul-float/2addr v0, v1

    .line 39
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$a;->i:I

    .line 40
    .line 41
    invoke-static {v2}, Ljava/lang/Math;->abs(I)I

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    iget v3, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$a;->j:I

    .line 46
    .line 47
    add-int/2addr v2, v3

    .line 48
    int-to-float v2, v2

    .line 49
    div-float/2addr v0, v2

    .line 50
    sub-int/2addr p4, p2

    .line 51
    int-to-float p2, p4

    .line 52
    mul-float/2addr v0, p2

    .line 53
    float-to-int p4, v0

    .line 54
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$a;->i:I

    .line 55
    .line 56
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    int-to-float v0, v0

    .line 61
    mul-float/2addr v0, v1

    .line 62
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$a;->i:I

    .line 63
    .line 64
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$a;->j:I

    .line 69
    .line 70
    add-int/2addr v1, v2

    .line 71
    int-to-float v1, v1

    .line 72
    div-float/2addr v0, v1

    .line 73
    mul-float/2addr v0, p2

    .line 74
    float-to-int p2, v0

    .line 75
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;->f:I

    .line 76
    .line 77
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;->c:Landroid/graphics/drawable/Drawable;

    .line 78
    .line 79
    if-gez v0, :cond_3

    .line 80
    .line 81
    sub-int p4, p2, p4

    .line 82
    .line 83
    add-int/2addr p3, p5

    .line 84
    invoke-virtual {v1, p4, p5, p2, p3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 85
    .line 86
    .line 87
    goto :goto_1

    .line 88
    :cond_3
    add-int/2addr p4, p2

    .line 89
    add-int/2addr p3, p5

    .line 90
    invoke-virtual {v1, p2, p5, p4, p3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 91
    .line 92
    .line 93
    :goto_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;->c:Landroid/graphics/drawable/Drawable;

    .line 94
    .line 95
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 96
    .line 97
    .line 98
    return-void
.end method

.method public g(Landroid/graphics/Canvas;IIII)V
    .locals 4

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
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$a;->i:I

    .line 12
    .line 13
    invoke-static {v2}, Ljava/lang/Math;->abs(I)I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    iget v3, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$a;->j:I

    .line 18
    .line 19
    add-int/2addr v2, v3

    .line 20
    int-to-float v2, v2

    .line 21
    div-float/2addr v0, v2

    .line 22
    sub-int/2addr p4, p2

    .line 23
    int-to-float p2, p4

    .line 24
    mul-float/2addr v0, p2

    .line 25
    float-to-int p4, v0

    .line 26
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$a;->i:I

    .line 27
    .line 28
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    int-to-float v0, v0

    .line 33
    mul-float/2addr v0, v1

    .line 34
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$a;->i:I

    .line 35
    .line 36
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$a;->j:I

    .line 41
    .line 42
    add-int/2addr v1, v2

    .line 43
    int-to-float v1, v1

    .line 44
    div-float/2addr v0, v1

    .line 45
    mul-float/2addr v0, p2

    .line 46
    float-to-int p2, v0

    .line 47
    sub-int/2addr p5, p3

    .line 48
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;->a:Landroid/graphics/drawable/Drawable;

    .line 49
    .line 50
    invoke-virtual {p3}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    .line 51
    .line 52
    .line 53
    move-result p3

    .line 54
    sub-int/2addr p5, p3

    .line 55
    div-int/lit8 p5, p5, 0x2

    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;->a:Landroid/graphics/drawable/Drawable;

    .line 58
    .line 59
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;->f:I

    .line 64
    .line 65
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;->a:Landroid/graphics/drawable/Drawable;

    .line 66
    .line 67
    if-gez v1, :cond_0

    .line 68
    .line 69
    sub-int/2addr p2, p4

    .line 70
    div-int/lit8 v0, v0, 0x2

    .line 71
    .line 72
    sub-int p4, p2, v0

    .line 73
    .line 74
    add-int/2addr p2, v0

    .line 75
    add-int/2addr p3, p5

    .line 76
    invoke-virtual {v2, p4, p5, p2, p3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 77
    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_0
    add-int/2addr p2, p4

    .line 81
    div-int/lit8 v0, v0, 0x2

    .line 82
    .line 83
    sub-int p4, p2, v0

    .line 84
    .line 85
    add-int/2addr p2, v0

    .line 86
    add-int/2addr p3, p5

    .line 87
    invoke-virtual {v2, p4, p5, p2, p3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 88
    .line 89
    .line 90
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;->a:Landroid/graphics/drawable/Drawable;

    .line 91
    .line 92
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method public h(Landroid/graphics/Canvas;IIII)V
    .locals 4

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
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$a;->i:I

    .line 24
    .line 25
    invoke-static {v2}, Ljava/lang/Math;->abs(I)I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    iget v3, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$a;->j:I

    .line 30
    .line 31
    add-int/2addr v2, v3

    .line 32
    int-to-float v2, v2

    .line 33
    div-float/2addr v0, v2

    .line 34
    sub-int/2addr p4, p2

    .line 35
    int-to-float p2, p4

    .line 36
    mul-float/2addr v0, p2

    .line 37
    float-to-int p4, v0

    .line 38
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$a;->i:I

    .line 39
    .line 40
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    int-to-float v0, v0

    .line 45
    mul-float/2addr v0, v1

    .line 46
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$a;->i:I

    .line 47
    .line 48
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$a;->j:I

    .line 53
    .line 54
    add-int/2addr v1, v2

    .line 55
    int-to-float v1, v1

    .line 56
    div-float/2addr v0, v1

    .line 57
    mul-float/2addr v0, p2

    .line 58
    float-to-int p2, v0

    .line 59
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;->f:I

    .line 60
    .line 61
    const/high16 v1, 0x40000000    # 2.0f

    .line 62
    .line 63
    if-gez v0, :cond_0

    .line 64
    .line 65
    sub-int/2addr p2, p4

    .line 66
    :goto_0
    int-to-float p2, p2

    .line 67
    div-float/2addr p5, v1

    .line 68
    sub-float/2addr p2, p5

    .line 69
    goto :goto_1

    .line 70
    :cond_0
    add-int/2addr p2, p4

    .line 71
    goto :goto_0

    .line 72
    :goto_1
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;->g:Landroid/graphics/Paint;

    .line 73
    .line 74
    invoke-virtual {p4}, Landroid/graphics/Paint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    .line 75
    .line 76
    .line 77
    move-result-object p4

    .line 78
    iget p4, p4, Landroid/graphics/Paint$FontMetrics;->descent:F

    .line 79
    .line 80
    neg-float p4, p4

    .line 81
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;->g:Landroid/graphics/Paint;

    .line 82
    .line 83
    invoke-virtual {p1, p3, p2, p4, p0}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method public j(FI)V
    .locals 3

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$a;->i:I

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
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$a;->i:I

    .line 12
    .line 13
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$a;->j:I

    .line 18
    .line 19
    add-int/2addr v1, v2

    .line 20
    int-to-float v1, v1

    .line 21
    div-float/2addr v0, v1

    .line 22
    int-to-float p2, p2

    .line 23
    div-float/2addr p1, p2

    .line 24
    sub-float/2addr p1, v0

    .line 25
    const/4 p2, 0x0

    .line 26
    cmpg-float p2, p1, p2

    .line 27
    .line 28
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$a;->i:I

    .line 29
    .line 30
    if-gez p2, :cond_0

    .line 31
    .line 32
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 33
    .line 34
    .line 35
    move-result p2

    .line 36
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$a;->j:I

    .line 37
    .line 38
    :goto_0
    add-int/2addr p2, v0

    .line 39
    int-to-float p2, p2

    .line 40
    mul-float/2addr p1, p2

    .line 41
    goto :goto_1

    .line 42
    :cond_0
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 43
    .line 44
    .line 45
    move-result p2

    .line 46
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$a;->j:I

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :goto_1
    float-to-int p1, p1

    .line 50
    iget p2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;->f:I

    .line 51
    .line 52
    if-eq p1, p2, :cond_1

    .line 53
    .line 54
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/BeautySeekBar$b;->k(I)V

    .line 55
    .line 56
    .line 57
    :cond_1
    return-void
.end method
