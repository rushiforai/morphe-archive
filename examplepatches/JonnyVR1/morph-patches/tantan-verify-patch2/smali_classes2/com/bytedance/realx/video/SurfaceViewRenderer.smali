.class public Lcom/bytedance/realx/video/SurfaceViewRenderer;
.super Landroid/view/SurfaceView;
.source "SourceFile"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback;
.implements Lcom/bytedance/realx/video/VideoSink;
.implements Lcom/bytedance/realx/video/RendererCommon$RendererEvents;


# static fields
.field private static final TAG:Ljava/lang/String; = "SurfaceViewRenderer"


# instance fields
.field private final eglRenderer:Lcom/bytedance/realx/video/SurfaceEglRenderer;

.field private enableFixedSize:Z

.field private radius:F

.field private rendererEvents:Lcom/bytedance/realx/video/RendererCommon$RendererEvents;

.field private final resourceName:Ljava/lang/String;

.field private rotatedFrameHeight:I

.field private rotatedFrameWidth:I

.field private surfaceHeight:I

.field private surfaceWidth:I

.field private final videoLayoutMeasure:Lcom/bytedance/realx/video/RendererCommon$VideoLayoutMeasure;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Lcom/bytedance/realx/video/RendererCommon$VideoLayoutMeasure;

    .line 5
    .line 6
    invoke-direct {p1}, Lcom/bytedance/realx/video/RendererCommon$VideoLayoutMeasure;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/bytedance/realx/video/SurfaceViewRenderer;->videoLayoutMeasure:Lcom/bytedance/realx/video/RendererCommon$VideoLayoutMeasure;

    .line 10
    .line 11
    invoke-direct {p0}, Lcom/bytedance/realx/video/SurfaceViewRenderer;->getResourceName()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iput-object p1, p0, Lcom/bytedance/realx/video/SurfaceViewRenderer;->resourceName:Ljava/lang/String;

    .line 16
    .line 17
    new-instance v0, Lcom/bytedance/realx/video/SurfaceEglRenderer;

    .line 18
    .line 19
    invoke-direct {v0, p1}, Lcom/bytedance/realx/video/SurfaceEglRenderer;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Lcom/bytedance/realx/video/SurfaceViewRenderer;->eglRenderer:Lcom/bytedance/realx/video/SurfaceEglRenderer;

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-interface {p1, p0}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-interface {p1, v0}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 36
    .line 37
    .line 38
    const/4 p1, 0x0

    .line 39
    iput p1, p0, Lcom/bytedance/realx/video/SurfaceViewRenderer;->radius:F

    .line 40
    .line 41
    new-instance p1, Landroid/graphics/drawable/ColorDrawable;

    .line 42
    .line 43
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    const v1, 0x106000d

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    invoke-direct {p1, v0}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 61
    invoke-direct {p0, p1, p2}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 62
    new-instance p1, Lcom/bytedance/realx/video/RendererCommon$VideoLayoutMeasure;

    invoke-direct {p1}, Lcom/bytedance/realx/video/RendererCommon$VideoLayoutMeasure;-><init>()V

    iput-object p1, p0, Lcom/bytedance/realx/video/SurfaceViewRenderer;->videoLayoutMeasure:Lcom/bytedance/realx/video/RendererCommon$VideoLayoutMeasure;

    .line 63
    invoke-direct {p0}, Lcom/bytedance/realx/video/SurfaceViewRenderer;->getResourceName()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/bytedance/realx/video/SurfaceViewRenderer;->resourceName:Ljava/lang/String;

    .line 64
    new-instance p2, Lcom/bytedance/realx/video/SurfaceEglRenderer;

    invoke-direct {p2, p1}, Lcom/bytedance/realx/video/SurfaceEglRenderer;-><init>(Ljava/lang/String;)V

    iput-object p2, p0, Lcom/bytedance/realx/video/SurfaceViewRenderer;->eglRenderer:Lcom/bytedance/realx/video/SurfaceEglRenderer;

    .line 65
    invoke-virtual {p0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object p1

    invoke-interface {p1, p0}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 66
    invoke-virtual {p0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object p1

    invoke-interface {p1, p2}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    const/4 p1, 0x0

    .line 67
    iput p1, p0, Lcom/bytedance/realx/video/SurfaceViewRenderer;->radius:F

    .line 68
    new-instance p1, Landroid/graphics/drawable/ColorDrawable;

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const v0, 0x106000d

    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getColor(I)I

    move-result p2

    invoke-direct {p1, p2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public static synthetic a(Lcom/bytedance/realx/video/SurfaceViewRenderer;II)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/bytedance/realx/video/SurfaceViewRenderer;->rotatedFrameWidth:I

    .line 2
    .line 3
    iput p2, p0, Lcom/bytedance/realx/video/SurfaceViewRenderer;->rotatedFrameHeight:I

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/bytedance/realx/video/SurfaceViewRenderer;->updateSurfaceSize()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private getResourceName()Ljava/lang/String;
    .locals 1

    .line 1
    :try_start_0
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getId()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-virtual {v0, p0}, Landroid/content/res/Resources;->getResourceEntryName(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0
    :try_end_0
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    return-object p0

    .line 14
    :catch_0
    const-string p0, ""

    .line 15
    .line 16
    return-object p0
.end method

.method private logD(Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/bytedance/realx/video/SurfaceViewRenderer;->resourceName:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string p0, ": "

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const-string p1, "SurfaceViewRenderer"

    .line 24
    .line 25
    invoke-static {p1, p0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method private postOrRun(Ljava/lang/Runnable;)V
    .locals 2

    .line 1
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    if-ne v0, v1, :cond_0

    .line 14
    .line 15
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    invoke-virtual {p0, p1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method private updateSurfaceSize()V
    .locals 5

    .line 1
    invoke-static {}, Lcom/bytedance/realx/base/ThreadUtils;->checkIsOnMainThread()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/bytedance/realx/video/SurfaceViewRenderer;->enableFixedSize:Z

    .line 5
    .line 6
    if-eqz v0, :cond_3

    .line 7
    .line 8
    iget v0, p0, Lcom/bytedance/realx/video/SurfaceViewRenderer;->rotatedFrameWidth:I

    .line 9
    .line 10
    if-eqz v0, :cond_3

    .line 11
    .line 12
    iget v0, p0, Lcom/bytedance/realx/video/SurfaceViewRenderer;->rotatedFrameHeight:I

    .line 13
    .line 14
    if-eqz v0, :cond_3

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_3

    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_3

    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    int-to-float v0, v0

    .line 33
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    int-to-float v1, v1

    .line 38
    div-float/2addr v0, v1

    .line 39
    iget v1, p0, Lcom/bytedance/realx/video/SurfaceViewRenderer;->rotatedFrameWidth:I

    .line 40
    .line 41
    int-to-float v2, v1

    .line 42
    iget v3, p0, Lcom/bytedance/realx/video/SurfaceViewRenderer;->rotatedFrameHeight:I

    .line 43
    .line 44
    int-to-float v4, v3

    .line 45
    div-float/2addr v2, v4

    .line 46
    cmpl-float v2, v2, v0

    .line 47
    .line 48
    if-lez v2, :cond_0

    .line 49
    .line 50
    int-to-float v1, v3

    .line 51
    mul-float/2addr v1, v0

    .line 52
    float-to-int v1, v1

    .line 53
    goto :goto_0

    .line 54
    :cond_0
    int-to-float v2, v1

    .line 55
    div-float/2addr v2, v0

    .line 56
    float-to-int v3, v2

    .line 57
    :goto_0
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    invoke-static {v1, v3}, Ljava/lang/Math;->min(II)I

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    new-instance v2, Ljava/lang/StringBuilder;

    .line 74
    .line 75
    const-string v3, "updateSurfaceSize. Layout size: "

    .line 76
    .line 77
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 81
    .line 82
    .line 83
    move-result v3

    .line 84
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    const-string v3, "x"

    .line 88
    .line 89
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 93
    .line 94
    .line 95
    move-result v4

    .line 96
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    const-string v4, ", frame size: "

    .line 100
    .line 101
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    iget v4, p0, Lcom/bytedance/realx/video/SurfaceViewRenderer;->rotatedFrameWidth:I

    .line 105
    .line 106
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    iget v4, p0, Lcom/bytedance/realx/video/SurfaceViewRenderer;->rotatedFrameHeight:I

    .line 113
    .line 114
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    const-string v4, ", requested surface size: "

    .line 118
    .line 119
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    const-string v4, ", old surface size: "

    .line 132
    .line 133
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    iget v4, p0, Lcom/bytedance/realx/video/SurfaceViewRenderer;->surfaceWidth:I

    .line 137
    .line 138
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    iget v3, p0, Lcom/bytedance/realx/video/SurfaceViewRenderer;->surfaceHeight:I

    .line 145
    .line 146
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v2

    .line 153
    invoke-direct {p0, v2}, Lcom/bytedance/realx/video/SurfaceViewRenderer;->logD(Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    iget v2, p0, Lcom/bytedance/realx/video/SurfaceViewRenderer;->surfaceWidth:I

    .line 157
    .line 158
    if-ne v0, v2, :cond_2

    .line 159
    .line 160
    iget v2, p0, Lcom/bytedance/realx/video/SurfaceViewRenderer;->surfaceHeight:I

    .line 161
    .line 162
    if-eq v1, v2, :cond_1

    .line 163
    .line 164
    goto :goto_1

    .line 165
    :cond_1
    return-void

    .line 166
    :cond_2
    :goto_1
    iput v0, p0, Lcom/bytedance/realx/video/SurfaceViewRenderer;->surfaceWidth:I

    .line 167
    .line 168
    iput v1, p0, Lcom/bytedance/realx/video/SurfaceViewRenderer;->surfaceHeight:I

    .line 169
    .line 170
    invoke-virtual {p0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    .line 171
    .line 172
    .line 173
    move-result-object p0

    .line 174
    invoke-interface {p0, v0, v1}, Landroid/view/SurfaceHolder;->setFixedSize(II)V

    .line 175
    .line 176
    .line 177
    return-void

    .line 178
    :cond_3
    const/4 v0, 0x0

    .line 179
    iput v0, p0, Lcom/bytedance/realx/video/SurfaceViewRenderer;->surfaceHeight:I

    .line 180
    .line 181
    iput v0, p0, Lcom/bytedance/realx/video/SurfaceViewRenderer;->surfaceWidth:I

    .line 182
    .line 183
    invoke-virtual {p0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    .line 184
    .line 185
    .line 186
    move-result-object p0

    .line 187
    invoke-interface {p0}, Landroid/view/SurfaceHolder;->setSizeFromLayout()V

    .line 188
    .line 189
    .line 190
    return-void
.end method


# virtual methods
.method public addFrameListener(Lcom/bytedance/realx/video/EglRenderer$FrameListener;F)V
    .locals 0

    .line 7
    iget-object p0, p0, Lcom/bytedance/realx/video/SurfaceViewRenderer;->eglRenderer:Lcom/bytedance/realx/video/SurfaceEglRenderer;

    invoke-virtual {p0, p1, p2}, Lcom/bytedance/realx/video/EglRenderer;->addFrameListener(Lcom/bytedance/realx/video/EglRenderer$FrameListener;F)V

    return-void
.end method

.method public addFrameListener(Lcom/bytedance/realx/video/EglRenderer$FrameListener;FLcom/bytedance/realx/video/RendererCommon$GlDrawer;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/SurfaceViewRenderer;->eglRenderer:Lcom/bytedance/realx/video/SurfaceEglRenderer;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Lcom/bytedance/realx/video/EglRenderer;->addFrameListener(Lcom/bytedance/realx/video/EglRenderer$FrameListener;FLcom/bytedance/realx/video/RendererCommon$GlDrawer;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public clearImage()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/SurfaceViewRenderer;->eglRenderer:Lcom/bytedance/realx/video/SurfaceEglRenderer;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/bytedance/realx/video/EglRenderer;->clearImage()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public disableFpsReduction()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/SurfaceViewRenderer;->eglRenderer:Lcom/bytedance/realx/video/SurfaceEglRenderer;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/bytedance/realx/video/SurfaceEglRenderer;->disableFpsReduction()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 5

    .line 1
    iget v0, p0, Lcom/bytedance/realx/video/SurfaceViewRenderer;->radius:F

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    cmpl-float v0, v0, v1

    .line 5
    .line 6
    if-lez v0, :cond_0

    .line 7
    .line 8
    new-instance v0, Landroid/graphics/Path;

    .line 9
    .line 10
    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 11
    .line 12
    .line 13
    new-instance v2, Landroid/graphics/RectF;

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    int-to-float v3, v3

    .line 20
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 21
    .line 22
    .line 23
    move-result v4

    .line 24
    int-to-float v4, v4

    .line 25
    invoke-direct {v2, v1, v1, v3, v4}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 26
    .line 27
    .line 28
    iget v1, p0, Lcom/bytedance/realx/video/SurfaceViewRenderer;->radius:F

    .line 29
    .line 30
    sget-object v3, Landroid/graphics/Path$Direction;->CCW:Landroid/graphics/Path$Direction;

    .line 31
    .line 32
    invoke-virtual {v0, v2, v1, v1, v3}, Landroid/graphics/Path;->addRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Path$Direction;)V

    .line 33
    .line 34
    .line 35
    sget-object v1, Landroid/graphics/Region$Op;->REPLACE:Landroid/graphics/Region$Op;

    .line 36
    .line 37
    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;Landroid/graphics/Region$Op;)Z

    .line 38
    .line 39
    .line 40
    :cond_0
    invoke-super {p0, p1}, Landroid/view/SurfaceView;->draw(Landroid/graphics/Canvas;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public init(Lcom/bytedance/realx/video/EglBase$Context;Lcom/bytedance/realx/video/RendererCommon$RendererEvents;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/bytedance/realx/video/EglBase$EglVersion;->getPreferredEglVersion()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    sget-object v1, Lcom/bytedance/realx/video/EglBase$Config;->CONFIG_PLAIN:Lcom/bytedance/realx/video/EglBase$Config;

    .line 6
    .line 7
    invoke-static {v0, v1}, Lcom/bytedance/realx/video/EglBase;->getEGLConfig(ILcom/bytedance/realx/video/EglBase$Config;)[I

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Lcom/bytedance/realx/video/GlRectDrawer;

    .line 12
    .line 13
    invoke-direct {v1}, Lcom/bytedance/realx/video/GlRectDrawer;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/bytedance/realx/video/SurfaceViewRenderer;->init(Lcom/bytedance/realx/video/EglBase$Context;Lcom/bytedance/realx/video/RendererCommon$RendererEvents;[ILcom/bytedance/realx/video/RendererCommon$GlDrawer;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public init(Lcom/bytedance/realx/video/EglBase$Context;Lcom/bytedance/realx/video/RendererCommon$RendererEvents;[ILcom/bytedance/realx/video/RendererCommon$GlDrawer;)V
    .locals 0

    .line 20
    invoke-static {}, Lcom/bytedance/realx/base/ThreadUtils;->checkIsOnMainThread()V

    .line 21
    iput-object p2, p0, Lcom/bytedance/realx/video/SurfaceViewRenderer;->rendererEvents:Lcom/bytedance/realx/video/RendererCommon$RendererEvents;

    const/4 p2, 0x0

    .line 22
    iput p2, p0, Lcom/bytedance/realx/video/SurfaceViewRenderer;->rotatedFrameWidth:I

    .line 23
    iput p2, p0, Lcom/bytedance/realx/video/SurfaceViewRenderer;->rotatedFrameHeight:I

    .line 24
    iget-object p2, p0, Lcom/bytedance/realx/video/SurfaceViewRenderer;->eglRenderer:Lcom/bytedance/realx/video/SurfaceEglRenderer;

    invoke-virtual {p2, p1, p0, p3, p4}, Lcom/bytedance/realx/video/SurfaceEglRenderer;->init(Lcom/bytedance/realx/video/EglBase$Context;Lcom/bytedance/realx/video/RendererCommon$RendererEvents;[ILcom/bytedance/realx/video/RendererCommon$GlDrawer;)V

    return-void
.end method

.method public onFirstFrameRendered()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/SurfaceViewRenderer;->rendererEvents:Lcom/bytedance/realx/video/RendererCommon$RendererEvents;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/bytedance/realx/video/RendererCommon$RendererEvents;->onFirstFrameRendered()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public onFrame(Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/SurfaceViewRenderer;->eglRenderer:Lcom/bytedance/realx/video/SurfaceEglRenderer;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/bytedance/realx/video/SurfaceEglRenderer;->onFrame(Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onFrameResolutionChanged(III)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/bytedance/realx/video/SurfaceViewRenderer;->rendererEvents:Lcom/bytedance/realx/video/RendererCommon$RendererEvents;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p1, p2, p3}, Lcom/bytedance/realx/video/RendererCommon$RendererEvents;->onFrameResolutionChanged(III)V

    .line 6
    .line 7
    .line 8
    :cond_0
    const/16 v0, 0xb4

    .line 9
    .line 10
    if-eqz p3, :cond_2

    .line 11
    .line 12
    if-ne p3, v0, :cond_1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_1
    move v1, p2

    .line 16
    goto :goto_1

    .line 17
    :cond_2
    :goto_0
    move v1, p1

    .line 18
    :goto_1
    if-eqz p3, :cond_3

    .line 19
    .line 20
    if-ne p3, v0, :cond_4

    .line 21
    .line 22
    :cond_3
    move p1, p2

    .line 23
    :cond_4
    new-instance p2, Ll/dbh0;

    .line 24
    .line 25
    invoke-direct {p2, p0, v1, p1}, Ll/dbh0;-><init>(Lcom/bytedance/realx/video/SurfaceViewRenderer;II)V

    .line 26
    .line 27
    .line 28
    invoke-direct {p0, p2}, Lcom/bytedance/realx/video/SurfaceViewRenderer;->postOrRun(Ljava/lang/Runnable;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public onLayout(ZIIII)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/bytedance/realx/base/ThreadUtils;->checkIsOnMainThread()V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/bytedance/realx/video/SurfaceViewRenderer;->eglRenderer:Lcom/bytedance/realx/video/SurfaceEglRenderer;

    .line 5
    .line 6
    sub-int/2addr p4, p2

    .line 7
    int-to-float p2, p4

    .line 8
    sub-int/2addr p5, p3

    .line 9
    int-to-float p3, p5

    .line 10
    div-float/2addr p2, p3

    .line 11
    invoke-virtual {p1, p2}, Lcom/bytedance/realx/video/EglRenderer;->setLayoutAspectRatio(F)V

    .line 12
    .line 13
    .line 14
    invoke-direct {p0}, Lcom/bytedance/realx/video/SurfaceViewRenderer;->updateSurfaceSize()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public onMeasure(II)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/bytedance/realx/base/ThreadUtils;->checkIsOnMainThread()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/bytedance/realx/video/SurfaceViewRenderer;->videoLayoutMeasure:Lcom/bytedance/realx/video/RendererCommon$VideoLayoutMeasure;

    .line 5
    .line 6
    iget v1, p0, Lcom/bytedance/realx/video/SurfaceViewRenderer;->rotatedFrameWidth:I

    .line 7
    .line 8
    iget v2, p0, Lcom/bytedance/realx/video/SurfaceViewRenderer;->rotatedFrameHeight:I

    .line 9
    .line 10
    invoke-virtual {v0, p1, p2, v1, v2}, Lcom/bytedance/realx/video/RendererCommon$VideoLayoutMeasure;->measure(IIII)Landroid/graphics/Point;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iget p2, p1, Landroid/graphics/Point;->x:I

    .line 15
    .line 16
    iget v0, p1, Landroid/graphics/Point;->y:I

    .line 17
    .line 18
    invoke-virtual {p0, p2, v0}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 19
    .line 20
    .line 21
    new-instance p2, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    const-string v0, "onMeasure(). New size: "

    .line 24
    .line 25
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget v0, p1, Landroid/graphics/Point;->x:I

    .line 29
    .line 30
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v0, "x"

    .line 34
    .line 35
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget p1, p1, Landroid/graphics/Point;->y:I

    .line 39
    .line 40
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-direct {p0, p1}, Lcom/bytedance/realx/video/SurfaceViewRenderer;->logD(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public pauseVideo()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/SurfaceViewRenderer;->eglRenderer:Lcom/bytedance/realx/video/SurfaceEglRenderer;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/bytedance/realx/video/SurfaceEglRenderer;->pauseVideo()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public release()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/SurfaceViewRenderer;->eglRenderer:Lcom/bytedance/realx/video/SurfaceEglRenderer;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/bytedance/realx/video/SurfaceEglRenderer;->release()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public removeFrameListener(Lcom/bytedance/realx/video/EglRenderer$FrameListener;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/SurfaceViewRenderer;->eglRenderer:Lcom/bytedance/realx/video/SurfaceEglRenderer;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/bytedance/realx/video/EglRenderer;->removeFrameListener(Lcom/bytedance/realx/video/EglRenderer$FrameListener;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setEnableHardwareScaler(Z)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/bytedance/realx/base/ThreadUtils;->checkIsOnMainThread()V

    .line 2
    .line 3
    .line 4
    iput-boolean p1, p0, Lcom/bytedance/realx/video/SurfaceViewRenderer;->enableFixedSize:Z

    .line 5
    .line 6
    invoke-direct {p0}, Lcom/bytedance/realx/video/SurfaceViewRenderer;->updateSurfaceSize()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setFpsReduction(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/SurfaceViewRenderer;->eglRenderer:Lcom/bytedance/realx/video/SurfaceEglRenderer;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/bytedance/realx/video/SurfaceEglRenderer;->setFpsReduction(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setMirror(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/SurfaceViewRenderer;->eglRenderer:Lcom/bytedance/realx/video/SurfaceEglRenderer;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/bytedance/realx/video/EglRenderer;->setMirror(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setRadius(F)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0, p1}, Ljava/lang/Math;->max(FF)F

    .line 3
    .line 4
    .line 5
    move-result p1

    .line 6
    iput p1, p0, Lcom/bytedance/realx/video/SurfaceViewRenderer;->radius:F

    .line 7
    .line 8
    return-void
.end method

.method public setScalingType(Lcom/bytedance/realx/video/RendererCommon$ScalingType;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/bytedance/realx/base/ThreadUtils;->checkIsOnMainThread()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/bytedance/realx/video/SurfaceViewRenderer;->videoLayoutMeasure:Lcom/bytedance/realx/video/RendererCommon$VideoLayoutMeasure;

    .line 5
    .line 6
    invoke-virtual {v0, p1}, Lcom/bytedance/realx/video/RendererCommon$VideoLayoutMeasure;->setScalingType(Lcom/bytedance/realx/video/RendererCommon$ScalingType;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/bytedance/realx/video/SurfaceViewRenderer;->eglRenderer:Lcom/bytedance/realx/video/SurfaceEglRenderer;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Lcom/bytedance/realx/video/EglRenderer;->setRenderModel(Lcom/bytedance/realx/video/RendererCommon$ScalingType;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public setScalingType(Lcom/bytedance/realx/video/RendererCommon$ScalingType;Lcom/bytedance/realx/video/RendererCommon$ScalingType;)V
    .locals 1

    .line 18
    invoke-static {}, Lcom/bytedance/realx/base/ThreadUtils;->checkIsOnMainThread()V

    .line 19
    iget-object v0, p0, Lcom/bytedance/realx/video/SurfaceViewRenderer;->videoLayoutMeasure:Lcom/bytedance/realx/video/RendererCommon$VideoLayoutMeasure;

    invoke-virtual {v0, p1, p2}, Lcom/bytedance/realx/video/RendererCommon$VideoLayoutMeasure;->setScalingType(Lcom/bytedance/realx/video/RendererCommon$ScalingType;Lcom/bytedance/realx/video/RendererCommon$ScalingType;)V

    .line 20
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    return-void
.end method

.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 0

    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/bytedance/realx/base/ThreadUtils;->checkIsOnMainThread()V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput p1, p0, Lcom/bytedance/realx/video/SurfaceViewRenderer;->surfaceHeight:I

    .line 6
    .line 7
    iput p1, p0, Lcom/bytedance/realx/video/SurfaceViewRenderer;->surfaceWidth:I

    .line 8
    .line 9
    invoke-direct {p0}, Lcom/bytedance/realx/video/SurfaceViewRenderer;->updateSurfaceSize()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 0

    return-void
.end method
