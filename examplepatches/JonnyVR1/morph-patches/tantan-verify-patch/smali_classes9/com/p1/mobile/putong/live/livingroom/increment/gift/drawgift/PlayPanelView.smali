.class public Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;
.super Landroid/view/View;
.source "SourceFile"


# static fields
.field public static final o:I


# instance fields
.field public a:Landroid/graphics/Paint;

.field public b:Landroid/graphics/Bitmap;

.field public c:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

.field public d:F

.field public e:Landroid/graphics/Rect;

.field public f:Landroid/graphics/RectF;

.field public g:Landroid/animation/ValueAnimator;

.field public h:I

.field public i:I

.field public j:I

.field public k:I

.field public l:I

.field public m:I

.field public n:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/high16 v0, 0x41400000    # 12.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sput v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->o:I

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/high16 p1, 0x41f00000    # 30.0f

    .line 5
    .line 6
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    int-to-float p1, p1

    .line 11
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->d:F

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->h()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 17
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/high16 p1, 0x41f00000    # 30.0f

    .line 18
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    int-to-float p1, p1

    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->d:F

    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->h()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 20
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/high16 p1, 0x41f00000    # 30.0f

    .line 21
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    int-to-float p1, p1

    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->d:F

    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->h()V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->j(Landroid/graphics/Bitmap;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->k(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->i(Landroid/animation/ValueAnimator;)V

    return-void
.end method


# virtual methods
.method public d()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->g:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->g:Landroid/animation/ValueAnimator;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final e(Landroid/graphics/Canvas;Lcom/p1/mobile/putong/live/base/data/BLivePosition;FFF)V
    .locals 1

    .line 1
    iget v0, p2, Lcom/p1/mobile/putong/live/base/data/BLivePosition;->x:F

    .line 2
    .line 3
    mul-float/2addr v0, p4

    .line 4
    float-to-int p4, v0

    .line 5
    iget p2, p2, Lcom/p1/mobile/putong/live/base/data/BLivePosition;->y:F

    .line 6
    .line 7
    mul-float/2addr p2, p5

    .line 8
    float-to-int p2, p2

    .line 9
    int-to-float p4, p4

    .line 10
    sub-float p5, p4, p3

    .line 11
    .line 12
    int-to-float p2, p2

    .line 13
    sub-float v0, p2, p3

    .line 14
    .line 15
    add-float/2addr p4, p3

    .line 16
    add-float/2addr p2, p3

    .line 17
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->f:Landroid/graphics/RectF;

    .line 18
    .line 19
    invoke-virtual {p3, p5, v0, p4, p2}, Landroid/graphics/RectF;->set(FFFF)V

    .line 20
    .line 21
    .line 22
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->b:Landroid/graphics/Bitmap;

    .line 23
    .line 24
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->e:Landroid/graphics/Rect;

    .line 25
    .line 26
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->f:Landroid/graphics/RectF;

    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->a:Landroid/graphics/Paint;

    .line 29
    .line 30
    invoke-virtual {p1, p2, p3, p4, p0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public f(Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;Ljava/lang/Runnable;)V
    .locals 3

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->c:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->h:I

    .line 5
    .line 6
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->n(Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;)I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    filled-new-array {v0, v1}, [I

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->n(Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;)I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    int-to-long v1, v1

    .line 23
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->g:Landroid/animation/ValueAnimator;

    .line 28
    .line 29
    new-instance v1, Ll/rd80;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/rd80;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->g:Landroid/animation/ValueAnimator;

    .line 38
    .line 39
    invoke-static {v0, p2}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 40
    .line 41
    .line 42
    iget p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->length:F

    .line 43
    .line 44
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->width:F

    .line 45
    .line 46
    div-float/2addr p2, v0

    .line 47
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->i:I

    .line 48
    .line 49
    sget v1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->o:I

    .line 50
    .line 51
    mul-int/lit8 v2, v1, 0x2

    .line 52
    .line 53
    sub-int v2, v0, v2

    .line 54
    .line 55
    iput v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->k:I

    .line 56
    .line 57
    int-to-float v0, v0

    .line 58
    mul-float/2addr v0, p2

    .line 59
    float-to-int p2, v0

    .line 60
    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->l:I

    .line 61
    .line 62
    iput v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->m:I

    .line 63
    .line 64
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->j:I

    .line 65
    .line 66
    sub-int/2addr v0, p2

    .line 67
    div-int/lit8 v0, v0, 0x2

    .line 68
    .line 69
    sub-int/2addr v0, v1

    .line 70
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->n:I

    .line 71
    .line 72
    const-string p2, "context_livingAct"

    .line 73
    .line 74
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->imgUrl:Ljava/lang/String;

    .line 75
    .line 76
    invoke-static {p2, p1}, Ll/izs;->e(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 81
    .line 82
    .line 83
    move-result-object p2

    .line 84
    invoke-virtual {p1, p2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    new-instance p2, Ll/sd80;

    .line 89
    .line 90
    invoke-direct {p2, p0}, Ll/sd80;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;)V

    .line 91
    .line 92
    .line 93
    new-instance v0, Ll/td80;

    .line 94
    .line 95
    invoke-direct {v0, p0}, Ll/td80;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;)V

    .line 96
    .line 97
    .line 98
    invoke-static {p2, v0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 103
    .line 104
    .line 105
    return-void
.end method

.method public final g(I)F
    .locals 5

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->d:F

    .line 2
    .line 3
    const/high16 v0, 0x40000000    # 2.0f

    .line 4
    .line 5
    div-float/2addr p0, v0

    .line 6
    int-to-float p1, p1

    .line 7
    const/high16 v1, 0x42c80000    # 100.0f

    .line 8
    .line 9
    cmpg-float v2, p1, v1

    .line 10
    .line 11
    const v3, 0x3f8ccccd    # 1.1f

    .line 12
    .line 13
    .line 14
    const/high16 v4, 0x43480000    # 200.0f

    .line 15
    .line 16
    if-gez v2, :cond_0

    .line 17
    .line 18
    div-float/2addr p1, v4

    .line 19
    mul-float/2addr p1, v0

    .line 20
    mul-float/2addr p1, v3

    .line 21
    mul-float/2addr p1, p0

    .line 22
    return p1

    .line 23
    :cond_0
    cmpg-float v2, p1, v4

    .line 24
    .line 25
    if-gez v2, :cond_1

    .line 26
    .line 27
    const v2, 0x3dccccd0    # 0.100000024f

    .line 28
    .line 29
    .line 30
    sub-float/2addr p1, v1

    .line 31
    mul-float/2addr p1, v2

    .line 32
    div-float/2addr p1, v4

    .line 33
    mul-float/2addr p1, v0

    .line 34
    sub-float/2addr v3, p1

    .line 35
    mul-float/2addr p0, v3

    .line 36
    :cond_1
    return p0
.end method

.method public final h()V
    .locals 2

    .line 1
    new-instance v0, Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->a:Landroid/graphics/Paint;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->a:Landroid/graphics/Paint;

    .line 13
    .line 14
    const-string v1, "#D81B60"

    .line 15
    .line 16
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->a:Landroid/graphics/Paint;

    .line 24
    .line 25
    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->a:Landroid/graphics/Paint;

    .line 31
    .line 32
    const/high16 v1, 0x40000000    # 2.0f

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 35
    .line 36
    .line 37
    new-instance v0, Landroid/graphics/RectF;

    .line 38
    .line 39
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 40
    .line 41
    .line 42
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->f:Landroid/graphics/RectF;

    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->n()V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public final synthetic i(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->h:I

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic j(Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->n()V

    .line 4
    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->setGiftBitmap(Landroid/graphics/Bitmap;)V

    .line 8
    .line 9
    .line 10
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->g:Landroid/animation/ValueAnimator;

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic k(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->n()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->g:Landroid/animation/ValueAnimator;

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final l(Landroid/graphics/Canvas;)V
    .locals 11

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->h:I

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->c:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

    .line 4
    .line 5
    invoke-static {v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->f(Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    sub-int/2addr v0, v1

    .line 10
    int-to-float v0, v0

    .line 11
    const/high16 v1, 0x43c80000    # 400.0f

    .line 12
    .line 13
    div-float/2addr v0, v1

    .line 14
    const v1, 0x3e4cccd0    # 0.20000005f

    .line 15
    .line 16
    .line 17
    mul-float/2addr v1, v0

    .line 18
    const/high16 v2, 0x3f800000    # 1.0f

    .line 19
    .line 20
    add-float/2addr v1, v2

    .line 21
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->k:I

    .line 22
    .line 23
    int-to-float v2, v2

    .line 24
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->c:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

    .line 25
    .line 26
    iget v4, v3, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->width:F

    .line 27
    .line 28
    div-float v9, v2, v4

    .line 29
    .line 30
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->l:I

    .line 31
    .line 32
    int-to-float v2, v2

    .line 33
    iget v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->length:F

    .line 34
    .line 35
    div-float v10, v2, v3

    .line 36
    .line 37
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->a:Landroid/graphics/Paint;

    .line 38
    .line 39
    const/high16 v3, 0x437f0000    # 255.0f

    .line 40
    .line 41
    mul-float/2addr v0, v3

    .line 42
    sub-float/2addr v3, v0

    .line 43
    float-to-int v0, v3

    .line 44
    invoke-virtual {v2, v0}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    div-int/lit8 v0, v0, 0x2

    .line 52
    .line 53
    int-to-float v0, v0

    .line 54
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    div-int/lit8 v2, v2, 0x2

    .line 59
    .line 60
    int-to-float v2, v2

    .line 61
    invoke-virtual {p1, v1, v1, v0, v2}, Landroid/graphics/Canvas;->scale(FFFF)V

    .line 62
    .line 63
    .line 64
    const/4 v0, 0x0

    .line 65
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->c:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

    .line 66
    .line 67
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->getGiftNum()I

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    if-ge v0, v1, :cond_0

    .line 72
    .line 73
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->c:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

    .line 74
    .line 75
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->getItem(I)Lcom/p1/mobile/putong/live/base/data/BLivePosition;

    .line 76
    .line 77
    .line 78
    move-result-object v7

    .line 79
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->d:F

    .line 80
    .line 81
    const/high16 v2, 0x40000000    # 2.0f

    .line 82
    .line 83
    div-float v8, v1, v2

    .line 84
    .line 85
    move-object v5, p0

    .line 86
    move-object v6, p1

    .line 87
    invoke-virtual/range {v5 .. v10}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->e(Landroid/graphics/Canvas;Lcom/p1/mobile/putong/live/base/data/BLivePosition;FFF)V

    .line 88
    .line 89
    .line 90
    add-int/lit8 v0, v0, 0x1

    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_0
    return-void
.end method

.method public final m(Landroid/graphics/Canvas;)V
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->a:Landroid/graphics/Paint;

    .line 2
    .line 3
    const/16 v1, 0xff

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 6
    .line 7
    .line 8
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->k:I

    .line 9
    .line 10
    int-to-float v0, v0

    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->c:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

    .line 12
    .line 13
    iget v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->width:F

    .line 14
    .line 15
    div-float v7, v0, v2

    .line 16
    .line 17
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->l:I

    .line 18
    .line 19
    int-to-float v0, v0

    .line 20
    iget v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->length:F

    .line 21
    .line 22
    div-float v8, v0, v1

    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->c:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

    .line 26
    .line 27
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->getGiftNum()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-ge v0, v1, :cond_1

    .line 32
    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->c:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

    .line 34
    .line 35
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->getItem(I)Lcom/p1/mobile/putong/live/base/data/BLivePosition;

    .line 36
    .line 37
    .line 38
    move-result-object v5

    .line 39
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->h:I

    .line 40
    .line 41
    int-to-long v1, v1

    .line 42
    int-to-long v3, v0

    .line 43
    iget-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->c:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

    .line 44
    .line 45
    invoke-static {v6}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->m(Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;)J

    .line 46
    .line 47
    .line 48
    move-result-wide v9

    .line 49
    mul-long/2addr v3, v9

    .line 50
    sub-long/2addr v1, v3

    .line 51
    long-to-int v1, v1

    .line 52
    if-ltz v1, :cond_0

    .line 53
    .line 54
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->g(I)F

    .line 55
    .line 56
    .line 57
    move-result v6

    .line 58
    move-object v3, p0

    .line 59
    move-object v4, p1

    .line 60
    invoke-virtual/range {v3 .. v8}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->e(Landroid/graphics/Canvas;Lcom/p1/mobile/putong/live/base/data/BLivePosition;FFF)V

    .line 61
    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_0
    move-object v3, p0

    .line 65
    move-object v4, p1

    .line 66
    :goto_1
    add-int/lit8 v0, v0, 0x1

    .line 67
    .line 68
    move-object p0, v3

    .line 69
    move-object p1, v4

    .line 70
    goto :goto_0

    .line 71
    :cond_1
    return-void
.end method

.method public final n()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Ll/obc0;->h2:I

    .line 10
    .line 11
    invoke-static {v0, v1}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->setGiftBitmap(Landroid/graphics/Bitmap;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->d()V

    .line 2
    .line 3
    .line 4
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->m:I

    .line 5
    .line 6
    int-to-float v0, v0

    .line 7
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->n:I

    .line 8
    .line 9
    int-to-float v1, v1

    .line 10
    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->c:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

    .line 14
    .line 15
    if-eqz v0, :cond_3

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->coordinates:Ljava/util/List;

    .line 18
    .line 19
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->g:Landroid/animation/ValueAnimator;

    .line 27
    .line 28
    if-eqz v0, :cond_3

    .line 29
    .line 30
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-nez v0, :cond_1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->h:I

    .line 38
    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->c:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

    .line 40
    .line 41
    invoke-static {v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->f(Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;)I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-ge v0, v1, :cond_2

    .line 46
    .line 47
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->m(Landroid/graphics/Canvas;)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_2
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->l(Landroid/graphics/Canvas;)V

    .line 52
    .line 53
    .line 54
    :cond_3
    :goto_0
    return-void
.end method

.method public onSizeChanged(IIII)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->i:I

    .line 5
    .line 6
    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->j:I

    .line 7
    .line 8
    return-void
.end method

.method public setGiftBitmap(Landroid/graphics/Bitmap;)V
    .locals 3

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->d:F

    .line 2
    .line 3
    float-to-int v1, v0

    .line 4
    float-to-int v0, v0

    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-static {p1, v1, v0, v2}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->b:Landroid/graphics/Bitmap;

    .line 11
    .line 12
    new-instance p1, Landroid/graphics/Rect;

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->b:Landroid/graphics/Bitmap;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->b:Landroid/graphics/Bitmap;

    .line 21
    .line 22
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    invoke-direct {p1, v2, v2, v0, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 27
    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/PlayPanelView;->e:Landroid/graphics/Rect;

    .line 30
    .line 31
    return-void
.end method
