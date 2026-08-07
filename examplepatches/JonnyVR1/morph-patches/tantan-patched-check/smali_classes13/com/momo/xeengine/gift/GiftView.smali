.class public Lcom/momo/xeengine/gift/GiftView;
.super Lcom/momo/xeengine/game/XEGameView;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/xeengine/gift/GiftView$TouchPolicy;
    }
.end annotation


# instance fields
.field private svgaImageView:Lcom/momo/xeengine/svgaplayer/SVGAImageView;

.field private touchPolicy:Lcom/momo/xeengine/gift/GiftView$TouchPolicy;

.field private final validTouchAreas:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/graphics/RectF;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/momo/xeengine/game/XEGameView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    sget-object p1, Lcom/momo/xeengine/gift/GiftView$TouchPolicy;->DEFAULT:Lcom/momo/xeengine/gift/GiftView$TouchPolicy;

    .line 5
    .line 6
    iput-object p1, p0, Lcom/momo/xeengine/gift/GiftView;->touchPolicy:Lcom/momo/xeengine/gift/GiftView$TouchPolicy;

    .line 7
    .line 8
    new-instance p1, Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Lcom/momo/xeengine/gift/GiftView;->validTouchAreas:Ljava/util/List;

    .line 14
    .line 15
    const/4 p1, 0x1

    .line 16
    iput-boolean p1, p0, Lcom/momo/xeengine/game/XEGameView;->enableBackgroundTick:Z

    .line 17
    .line 18
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 19
    invoke-direct {p0, p1, p2}, Lcom/momo/xeengine/game/XEGameView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 20
    sget-object p1, Lcom/momo/xeengine/gift/GiftView$TouchPolicy;->DEFAULT:Lcom/momo/xeengine/gift/GiftView$TouchPolicy;

    iput-object p1, p0, Lcom/momo/xeengine/gift/GiftView;->touchPolicy:Lcom/momo/xeengine/gift/GiftView$TouchPolicy;

    .line 21
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/momo/xeengine/gift/GiftView;->validTouchAreas:Ljava/util/List;

    const/4 p1, 0x1

    .line 22
    iput-boolean p1, p0, Lcom/momo/xeengine/game/XEGameView;->enableBackgroundTick:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 23
    invoke-direct {p0, p1, p2, p3}, Lcom/momo/xeengine/game/XEGameView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 24
    sget-object p1, Lcom/momo/xeengine/gift/GiftView$TouchPolicy;->DEFAULT:Lcom/momo/xeengine/gift/GiftView$TouchPolicy;

    iput-object p1, p0, Lcom/momo/xeengine/gift/GiftView;->touchPolicy:Lcom/momo/xeengine/gift/GiftView$TouchPolicy;

    .line 25
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/momo/xeengine/gift/GiftView;->validTouchAreas:Ljava/util/List;

    const/4 p1, 0x1

    .line 26
    iput-boolean p1, p0, Lcom/momo/xeengine/game/XEGameView;->enableBackgroundTick:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0

    .line 27
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/momo/xeengine/game/XEGameView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 28
    sget-object p1, Lcom/momo/xeengine/gift/GiftView$TouchPolicy;->DEFAULT:Lcom/momo/xeengine/gift/GiftView$TouchPolicy;

    iput-object p1, p0, Lcom/momo/xeengine/gift/GiftView;->touchPolicy:Lcom/momo/xeengine/gift/GiftView$TouchPolicy;

    .line 29
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/momo/xeengine/gift/GiftView;->validTouchAreas:Ljava/util/List;

    const/4 p1, 0x1

    .line 30
    iput-boolean p1, p0, Lcom/momo/xeengine/game/XEGameView;->enableBackgroundTick:Z

    return-void
.end method

.method private dpToPx(F)I
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    .line 10
    .line 11
    const/high16 v0, 0x40000000    # 2.0f

    .line 12
    .line 13
    cmpl-float v1, p0, v0

    .line 14
    .line 15
    if-lez v1, :cond_0

    .line 16
    .line 17
    move p0, v0

    .line 18
    :cond_0
    mul-float/2addr p1, p0

    .line 19
    float-to-int p0, p1

    .line 20
    return p0
.end method

.method private isTouchInValidArea(FF)Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/gift/GiftView;->validTouchAreas:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Landroid/graphics/RectF;

    .line 18
    .line 19
    invoke-virtual {v0, p1, p2}, Landroid/graphics/RectF;->contains(FF)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_1
    const/4 p0, 0x0

    .line 28
    return p0
.end method

.method private sendTouchEventToEngine(Landroid/view/MotionEvent;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/momo/xeengine/game/XEGameView;->getEngineEventDispatcher()Lcom/momo/xeengine/event/IXEventDispatcher;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/momo/xeengine/game/XEGameView;->getRenderScale()F

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    invoke-virtual {p0}, Lcom/momo/xeengine/game/XEGameView;->getRenderScale()F

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    invoke-interface {v0, p1, v1, p0}, Lcom/momo/xeengine/event/ITouchEventHandler;->handleTouchEvent(Landroid/view/MotionEvent;FF)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method


# virtual methods
.method public addValidTouchArea(Landroid/graphics/RectF;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lcom/momo/xeengine/gift/GiftView;->validTouchAreas:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public clearValidTouchAreas()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/gift/GiftView;->validTouchAreas:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public getSVGAView()Lcom/momo/xeengine/svgaplayer/SVGAImageView;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/gift/GiftView;->svgaImageView:Lcom/momo/xeengine/svgaplayer/SVGAImageView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/momo/xeengine/svgaplayer/SVGAImageView;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-direct {v0, v1}, Lcom/momo/xeengine/svgaplayer/SVGAImageView;-><init>(Landroid/content/Context;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/momo/xeengine/gift/GiftView;->svgaImageView:Lcom/momo/xeengine/svgaplayer/SVGAImageView;

    .line 15
    .line 16
    sget-object v1, Landroid/widget/ImageView$ScaleType;->FIT_XY:Landroid/widget/ImageView$ScaleType;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/momo/xeengine/gift/GiftView;->svgaImageView:Lcom/momo/xeengine/svgaplayer/SVGAImageView;

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    iget-object p0, p0, Lcom/momo/xeengine/gift/GiftView;->svgaImageView:Lcom/momo/xeengine/svgaplayer/SVGAImageView;

    .line 27
    .line 28
    return-object p0
.end method

.method public getTouchPolicy()Lcom/momo/xeengine/gift/GiftView$TouchPolicy;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/gift/GiftView;->touchPolicy:Lcom/momo/xeengine/gift/GiftView$TouchPolicy;

    .line 2
    .line 3
    return-object p0
.end method

.method public getValidTouchAreas()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/graphics/RectF;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/momo/xeengine/gift/GiftView;->validTouchAreas:Ljava/util/List;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 4

    .line 1
    sget-object v0, Lcom/momo/xeengine/gift/GiftView$1;->$SwitchMap$com$momo$xeengine$gift$GiftView$TouchPolicy:[I

    .line 2
    .line 3
    iget-object v1, p0, Lcom/momo/xeengine/gift/GiftView;->touchPolicy:Lcom/momo/xeengine/gift/GiftView$TouchPolicy;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    aget v0, v0, v1

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    if-eq v0, v1, :cond_2

    .line 13
    .line 14
    const/4 v2, 0x2

    .line 15
    const/4 v3, 0x0

    .line 16
    if-eq v0, v2, :cond_1

    .line 17
    .line 18
    const/4 v2, 0x3

    .line 19
    if-eq v0, v2, :cond_0

    .line 20
    .line 21
    invoke-super {p0, p1}, Lcom/momo/xeengine/game/XEGameView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    return p0

    .line 26
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    invoke-direct {p0, v0, v2}, Lcom/momo/xeengine/gift/GiftView;->isTouchInValidArea(FF)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    invoke-direct {p0, p1}, Lcom/momo/xeengine/gift/GiftView;->sendTouchEventToEngine(Landroid/view/MotionEvent;)V

    .line 41
    .line 42
    .line 43
    return v1

    .line 44
    :cond_1
    return v3

    .line 45
    :cond_2
    invoke-direct {p0, p1}, Lcom/momo/xeengine/gift/GiftView;->sendTouchEventToEngine(Landroid/view/MotionEvent;)V

    .line 46
    .line 47
    .line 48
    return v1
.end method

.method public setTouchPolicy(Lcom/momo/xeengine/gift/GiftView$TouchPolicy;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/gift/GiftView;->touchPolicy:Lcom/momo/xeengine/gift/GiftView$TouchPolicy;

    .line 2
    .line 3
    return-void
.end method

.method public setupSVGAViewLayout(Landroid/util/SizeF;Lcom/momo/xeengine/gift/SVGAPositionType;Lcom/momo/xeengine/gift/SVGAScaleType;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/gift/GiftView;->svgaImageView:Lcom/momo/xeengine/svgaplayer/SVGAImageView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 11
    .line 12
    sget-object v1, Lcom/momo/xeengine/gift/SVGAScaleType;->FILL:Lcom/momo/xeengine/gift/SVGAScaleType;

    .line 13
    .line 14
    if-ne p3, v1, :cond_1

    .line 15
    .line 16
    const/4 p1, -0x1

    .line 17
    iput p1, v0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 18
    .line 19
    iput p1, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 20
    .line 21
    goto/16 :goto_0

    .line 22
    .line 23
    :cond_1
    sget-object v1, Lcom/momo/xeengine/gift/SVGAScaleType;->ASPECT_FIT:Lcom/momo/xeengine/gift/SVGAScaleType;

    .line 24
    .line 25
    if-ne p3, v1, :cond_2

    .line 26
    .line 27
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 28
    .line 29
    .line 30
    move-result p3

    .line 31
    int-to-float p3, p3

    .line 32
    invoke-virtual {p1}, Landroid/util/SizeF;->getWidth()F

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    div-float/2addr p3, v1

    .line 37
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    int-to-float v1, v1

    .line 42
    invoke-virtual {p1}, Landroid/util/SizeF;->getHeight()F

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    div-float/2addr v1, v2

    .line 47
    invoke-static {p3, v1}, Ljava/lang/Float;->min(FF)F

    .line 48
    .line 49
    .line 50
    move-result p3

    .line 51
    invoke-virtual {p1}, Landroid/util/SizeF;->getWidth()F

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    mul-float/2addr v1, p3

    .line 56
    float-to-int v1, v1

    .line 57
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 58
    .line 59
    invoke-virtual {p1}, Landroid/util/SizeF;->getHeight()F

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    mul-float/2addr p1, p3

    .line 64
    float-to-int p1, p1

    .line 65
    iput p1, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_2
    sget-object v1, Lcom/momo/xeengine/gift/SVGAScaleType;->ASPECT_FILL:Lcom/momo/xeengine/gift/SVGAScaleType;

    .line 69
    .line 70
    if-ne p3, v1, :cond_3

    .line 71
    .line 72
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 73
    .line 74
    .line 75
    move-result p3

    .line 76
    int-to-float p3, p3

    .line 77
    invoke-virtual {p1}, Landroid/util/SizeF;->getWidth()F

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    div-float/2addr p3, v1

    .line 82
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    int-to-float v1, v1

    .line 87
    invoke-virtual {p1}, Landroid/util/SizeF;->getHeight()F

    .line 88
    .line 89
    .line 90
    move-result v2

    .line 91
    div-float/2addr v1, v2

    .line 92
    invoke-static {p3, v1}, Ljava/lang/Float;->max(FF)F

    .line 93
    .line 94
    .line 95
    move-result p3

    .line 96
    invoke-virtual {p1}, Landroid/util/SizeF;->getWidth()F

    .line 97
    .line 98
    .line 99
    move-result v1

    .line 100
    mul-float/2addr v1, p3

    .line 101
    float-to-int v1, v1

    .line 102
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 103
    .line 104
    invoke-virtual {p1}, Landroid/util/SizeF;->getHeight()F

    .line 105
    .line 106
    .line 107
    move-result p1

    .line 108
    mul-float/2addr p1, p3

    .line 109
    float-to-int p1, p1

    .line 110
    iput p1, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 111
    .line 112
    goto :goto_0

    .line 113
    :cond_3
    sget-object v1, Lcom/momo/xeengine/gift/SVGAScaleType;->WIDTH:Lcom/momo/xeengine/gift/SVGAScaleType;

    .line 114
    .line 115
    if-ne p3, v1, :cond_4

    .line 116
    .line 117
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 118
    .line 119
    .line 120
    move-result p3

    .line 121
    int-to-float p3, p3

    .line 122
    invoke-virtual {p1}, Landroid/util/SizeF;->getWidth()F

    .line 123
    .line 124
    .line 125
    move-result v1

    .line 126
    div-float/2addr p3, v1

    .line 127
    invoke-virtual {p1}, Landroid/util/SizeF;->getWidth()F

    .line 128
    .line 129
    .line 130
    move-result v1

    .line 131
    mul-float/2addr v1, p3

    .line 132
    float-to-int v1, v1

    .line 133
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 134
    .line 135
    invoke-virtual {p1}, Landroid/util/SizeF;->getHeight()F

    .line 136
    .line 137
    .line 138
    move-result p1

    .line 139
    mul-float/2addr p1, p3

    .line 140
    float-to-int p1, p1

    .line 141
    iput p1, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 142
    .line 143
    goto :goto_0

    .line 144
    :cond_4
    invoke-virtual {p1}, Landroid/util/SizeF;->getWidth()F

    .line 145
    .line 146
    .line 147
    move-result p3

    .line 148
    invoke-direct {p0, p3}, Lcom/momo/xeengine/gift/GiftView;->dpToPx(F)I

    .line 149
    .line 150
    .line 151
    move-result p3

    .line 152
    iput p3, v0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 153
    .line 154
    invoke-virtual {p1}, Landroid/util/SizeF;->getHeight()F

    .line 155
    .line 156
    .line 157
    move-result p1

    .line 158
    invoke-direct {p0, p1}, Lcom/momo/xeengine/gift/GiftView;->dpToPx(F)I

    .line 159
    .line 160
    .line 161
    move-result p1

    .line 162
    iput p1, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 163
    .line 164
    :goto_0
    sget-object p1, Lcom/momo/xeengine/gift/SVGAPositionType;->TOP:Lcom/momo/xeengine/gift/SVGAPositionType;

    .line 165
    .line 166
    if-ne p2, p1, :cond_5

    .line 167
    .line 168
    const/16 p1, 0x31

    .line 169
    .line 170
    iput p1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 171
    .line 172
    goto :goto_1

    .line 173
    :cond_5
    sget-object p1, Lcom/momo/xeengine/gift/SVGAPositionType;->BOTTOM:Lcom/momo/xeengine/gift/SVGAPositionType;

    .line 174
    .line 175
    if-ne p2, p1, :cond_6

    .line 176
    .line 177
    const/16 p1, 0x51

    .line 178
    .line 179
    iput p1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 180
    .line 181
    goto :goto_1

    .line 182
    :cond_6
    const/16 p1, 0x11

    .line 183
    .line 184
    iput p1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 185
    .line 186
    :goto_1
    iget-object p0, p0, Lcom/momo/xeengine/gift/GiftView;->svgaImageView:Lcom/momo/xeengine/svgaplayer/SVGAImageView;

    .line 187
    .line 188
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 189
    .line 190
    .line 191
    return-void
.end method

.method public stop()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/momo/xeengine/game/XEGameView;->stop()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/momo/xeengine/gift/GiftView;->clearValidTouchAreas()V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/momo/xeengine/gift/GiftView;->svgaImageView:Lcom/momo/xeengine/svgaplayer/SVGAImageView;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {v0, v1}, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->setCallback(Lcom/momo/xeengine/svgaplayer/listener/SVGACallback;)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lcom/momo/xeengine/gift/GiftView;->svgaImageView:Lcom/momo/xeengine/svgaplayer/SVGAImageView;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->stopAnimation()V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method
