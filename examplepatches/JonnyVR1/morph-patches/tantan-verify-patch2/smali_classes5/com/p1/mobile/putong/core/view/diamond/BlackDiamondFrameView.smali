.class public Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondFrameView;
.super Landroid/view/View;
.source "SourceFile"

# interfaces
.implements Landroid/hardware/SensorEventListener;


# instance fields
.field public a:Landroid/graphics/drawable/Drawable;

.field public b:Landroid/graphics/Bitmap;

.field public c:Landroid/graphics/Paint;

.field public d:Landroid/graphics/Rect;

.field public e:I

.field public f:I

.field public g:I

.field public h:I

.field public i:Landroid/hardware/SensorManager;

.field public j:Landroid/hardware/Sensor;

.field public k:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 42
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondFrameView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, -0x1

    .line 41
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondFrameView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondFrameView;->a:Landroid/graphics/drawable/Drawable;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondFrameView;->b:Landroid/graphics/Bitmap;

    .line 8
    .line 9
    new-instance p2, Landroid/graphics/Paint;

    .line 10
    .line 11
    const/4 p3, 0x1

    .line 12
    invoke-direct {p2, p3}, Landroid/graphics/Paint;-><init>(I)V

    .line 13
    .line 14
    .line 15
    iput-object p2, p0, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondFrameView;->c:Landroid/graphics/Paint;

    .line 16
    .line 17
    iput-object p1, p0, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondFrameView;->d:Landroid/graphics/Rect;

    .line 18
    .line 19
    const/4 p2, 0x0

    .line 20
    iput p2, p0, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondFrameView;->e:I

    .line 21
    .line 22
    iput p2, p0, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondFrameView;->f:I

    .line 23
    .line 24
    iput p2, p0, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondFrameView;->g:I

    .line 25
    .line 26
    const/high16 p3, 0x43480000    # 200.0f

    .line 27
    .line 28
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 29
    .line 30
    .line 31
    move-result p3

    .line 32
    iput p3, p0, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondFrameView;->h:I

    .line 33
    .line 34
    iput-object p1, p0, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondFrameView;->i:Landroid/hardware/SensorManager;

    .line 35
    .line 36
    iput-object p1, p0, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondFrameView;->j:Landroid/hardware/Sensor;

    .line 37
    .line 38
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondFrameView;->k:Z

    .line 39
    .line 40
    return-void
.end method


# virtual methods
.method public a()Lcom/p1/mobile/android/app/Act;
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return-object p0
.end method

.method public b(F)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondFrameView;->a()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_6

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondFrameView;->d:Landroid/graphics/Rect;

    .line 8
    .line 9
    if-eqz v0, :cond_6

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondFrameView;->a()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sget-object v1, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 20
    .line 21
    if-eq v0, v1, :cond_0

    .line 22
    .line 23
    goto :goto_1

    .line 24
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondFrameView;->a()Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    instance-of v0, v0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 29
    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondFrameView;->a()Lcom/p1/mobile/android/app/Act;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    check-cast v0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 37
    .line 38
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->p7()Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 43
    .line 44
    if-eq v0, v1, :cond_1

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_1
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    const/high16 v1, 0x40400000    # 3.0f

    .line 52
    .line 53
    cmpg-float v0, v0, v1

    .line 54
    .line 55
    if-gez v0, :cond_2

    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_2
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    if-lez p1, :cond_3

    .line 63
    .line 64
    add-int/lit8 p1, p1, 0x23

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_3
    add-int/lit8 p1, p1, -0x23

    .line 68
    .line 69
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondFrameView;->d:Landroid/graphics/Rect;

    .line 70
    .line 71
    iget v1, v0, Landroid/graphics/Rect;->top:I

    .line 72
    .line 73
    add-int/2addr v1, p1

    .line 74
    iput v1, v0, Landroid/graphics/Rect;->top:I

    .line 75
    .line 76
    if-gez v1, :cond_4

    .line 77
    .line 78
    const/4 p1, 0x0

    .line 79
    iput p1, v0, Landroid/graphics/Rect;->top:I

    .line 80
    .line 81
    :cond_4
    iget p1, v0, Landroid/graphics/Rect;->top:I

    .line 82
    .line 83
    iget v1, p0, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondFrameView;->h:I

    .line 84
    .line 85
    add-int/2addr p1, v1

    .line 86
    iput p1, v0, Landroid/graphics/Rect;->bottom:I

    .line 87
    .line 88
    iget v2, p0, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondFrameView;->f:I

    .line 89
    .line 90
    if-le p1, v2, :cond_5

    .line 91
    .line 92
    iput v2, v0, Landroid/graphics/Rect;->bottom:I

    .line 93
    .line 94
    sub-int/2addr v2, v1

    .line 95
    iput v2, v0, Landroid/graphics/Rect;->top:I

    .line 96
    .line 97
    :cond_5
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 98
    .line 99
    .line 100
    :cond_6
    :goto_1
    return-void
.end method

.method public c(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 7

    .line 1
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v3

    .line 5
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 6
    .line 7
    .line 8
    move-result v4

    .line 9
    if-lez v3, :cond_0

    .line 10
    .line 11
    if-gtz v4, :cond_1

    .line 12
    .line 13
    :cond_0
    move-object v0, p1

    .line 14
    goto :goto_0

    .line 15
    :cond_1
    new-instance v5, Landroid/graphics/Matrix;

    .line 16
    .line 17
    invoke-direct {v5}, Landroid/graphics/Matrix;-><init>()V

    .line 18
    .line 19
    .line 20
    iget p0, p0, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondFrameView;->e:I

    .line 21
    .line 22
    int-to-float p0, p0

    .line 23
    const/high16 v0, 0x3f800000    # 1.0f

    .line 24
    .line 25
    mul-float/2addr p0, v0

    .line 26
    int-to-float v0, v3

    .line 27
    div-float/2addr p0, v0

    .line 28
    invoke-virtual {v5, p0, p0}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 29
    .line 30
    .line 31
    const/4 v2, 0x0

    .line 32
    const/4 v6, 0x1

    .line 33
    const/4 v1, 0x0

    .line 34
    move-object v0, p1

    .line 35
    invoke-static/range {v0 .. v6}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    if-nez p1, :cond_2

    .line 44
    .line 45
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-nez p1, :cond_2

    .line 50
    .line 51
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 52
    .line 53
    .line 54
    :cond_2
    return-object p0

    .line 55
    :goto_0
    return-object v0
.end method

.method public d()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondFrameView;->i:Landroid/hardware/SensorManager;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {v0, p0}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondFrameView;->i:Landroid/hardware/SensorManager;

    .line 11
    .line 12
    return-void
.end method

.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .locals 0

    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondFrameView;->d()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 8
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "DrawAllocation"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondFrameView;->k:Z

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget v0, p0, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondFrameView;->e:I

    .line 10
    .line 11
    int-to-float v4, v0

    .line 12
    iget v0, p0, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondFrameView;->f:I

    .line 13
    .line 14
    int-to-float v5, v0

    .line 15
    iget-object v6, p0, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondFrameView;->c:Landroid/graphics/Paint;

    .line 16
    .line 17
    const/16 v7, 0x1f

    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    const/4 v3, 0x0

    .line 21
    move-object v1, p1

    .line 22
    invoke-virtual/range {v1 .. v7}, Landroid/graphics/Canvas;->saveLayer(FFFFLandroid/graphics/Paint;I)I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondFrameView;->a:Landroid/graphics/drawable/Drawable;

    .line 27
    .line 28
    iget v2, p0, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondFrameView;->e:I

    .line 29
    .line 30
    iget v3, p0, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondFrameView;->f:I

    .line 31
    .line 32
    const/4 v4, 0x0

    .line 33
    invoke-virtual {v0, v4, v4, v2, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondFrameView;->a:Landroid/graphics/drawable/Drawable;

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondFrameView;->c:Landroid/graphics/Paint;

    .line 42
    .line 43
    new-instance v2, Landroid/graphics/PorterDuffXfermode;

    .line 44
    .line 45
    sget-object v3, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    .line 46
    .line 47
    invoke-direct {v2, v3}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondFrameView;->b:Landroid/graphics/Bitmap;

    .line 54
    .line 55
    iget-object v2, p0, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondFrameView;->d:Landroid/graphics/Rect;

    .line 56
    .line 57
    iget-object v3, p0, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondFrameView;->c:Landroid/graphics/Paint;

    .line 58
    .line 59
    const/4 v4, 0x0

    .line 60
    invoke-virtual {v1, v0, v4, v2, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 61
    .line 62
    .line 63
    iget-object p0, p0, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondFrameView;->c:Landroid/graphics/Paint;

    .line 64
    .line 65
    invoke-virtual {p0, v4}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v1, p1}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 1

    .line 1
    iget-object p1, p1, Landroid/hardware/SensorEvent;->values:[F

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    aget p1, p1, v0

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondFrameView;->b(F)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onSizeChanged(IIII)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    .line 2
    .line 3
    .line 4
    iget-boolean p3, p0, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondFrameView;->k:Z

    .line 5
    .line 6
    if-nez p3, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iput p1, p0, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondFrameView;->e:I

    .line 10
    .line 11
    iput p2, p0, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondFrameView;->f:I

    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondFrameView;->a:Landroid/graphics/drawable/Drawable;

    .line 14
    .line 15
    if-nez p1, :cond_1

    .line 16
    .line 17
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 18
    .line 19
    sget p2, Ll/dbc0;->K1:I

    .line 20
    .line 21
    invoke-virtual {p1, p2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iput-object p1, p0, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondFrameView;->a:Landroid/graphics/drawable/Drawable;

    .line 26
    .line 27
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondFrameView;->b:Landroid/graphics/Bitmap;

    .line 28
    .line 29
    if-nez p1, :cond_2

    .line 30
    .line 31
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    sget p2, Ll/dbc0;->L1:I

    .line 36
    .line 37
    invoke-static {p1, p2}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondFrameView;->c(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    iput-object p1, p0, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondFrameView;->b:Landroid/graphics/Bitmap;

    .line 46
    .line 47
    :cond_2
    iget p1, p0, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondFrameView;->f:I

    .line 48
    .line 49
    iget p2, p0, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondFrameView;->h:I

    .line 50
    .line 51
    sub-int/2addr p1, p2

    .line 52
    div-int/lit8 p1, p1, 0x2

    .line 53
    .line 54
    iput p1, p0, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondFrameView;->g:I

    .line 55
    .line 56
    new-instance p1, Landroid/graphics/Rect;

    .line 57
    .line 58
    iget p2, p0, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondFrameView;->g:I

    .line 59
    .line 60
    iget p3, p0, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondFrameView;->e:I

    .line 61
    .line 62
    iget p4, p0, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondFrameView;->h:I

    .line 63
    .line 64
    add-int/2addr p4, p2

    .line 65
    const/4 v0, 0x0

    .line 66
    invoke-direct {p1, v0, p2, p3, p4}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 67
    .line 68
    .line 69
    iput-object p1, p0, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondFrameView;->d:Landroid/graphics/Rect;

    .line 70
    .line 71
    return-void
.end method

.method public setIsBlackDiamond(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondFrameView;->k:Z

    .line 2
    .line 3
    return-void
.end method
