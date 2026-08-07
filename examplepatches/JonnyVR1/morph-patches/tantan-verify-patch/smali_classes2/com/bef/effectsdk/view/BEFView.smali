.class public Lcom/bef/effectsdk/view/BEFView;
.super Lcom/bef/effectsdk/GLTextureView;
.source "SourceFile"

# interfaces
.implements Landroid/opengl/GLSurfaceView$Renderer;
.implements Lcom/bef/effectsdk/view/ViewControllerInterface$NativeMessageListener;
.implements Lcom/bef/effectsdk/message/MessageCenter$Listener;


# annotations
.annotation build Lcom/amazing/annotation/EffectKeep;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bef/effectsdk/view/BEFView$BEFViewSceneKey;,
        Lcom/bef/effectsdk/view/BEFView$FitMode;,
        Lcom/bef/effectsdk/view/BEFView$MessageListener;,
        Lcom/bef/effectsdk/view/BEFView$Builder;,
        Lcom/bef/effectsdk/view/BEFView$Color;
    }
.end annotation


# static fields
.field protected static final NANO_SECONDS_PER_MICRO_SECOND:J = 0xf4240L

.field protected static final NANO_SECONDS_PER_SECOND:J = 0x3b9aca00L

.field private static final TAG:Ljava/lang/String; = "BEFView"


# instance fields
.field protected mAdBundlePath:Ljava/lang/String;

.field private mAssetResourceFinder:Lcom/bef/effectsdk/AssetResourceFinder;

.field private mAttachedEffect:J

.field protected mCacheMessages:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private mDestroyed:Z

.field protected mHandle:J

.field private mLastAttachedEffect:J

.field private mLastTickInNanoSeconds:J

.field protected mListeners:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Lcom/bef/effectsdk/view/BEFView$MessageListener;",
            ">;"
        }
    .end annotation
.end field

.field protected mMatrix:[F

.field private mMultipleTouchEnabled:Z

.field protected mNativeInited:Z

.field private mParams:Lcom/bef/effectsdk/view/BEFView$Builder$Params;

.field protected mSourceTexture:I

.field private mTouch_ids:[I

.field private mTouch_xs:[F

.field private mTouch_ys:[F


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 5

    .line 1
    invoke-direct {p0, p1}, Lcom/bef/effectsdk/GLTextureView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/bef/effectsdk/view/BEFView;->mHandle:J

    .line 7
    .line 8
    const-string v2, ""

    .line 9
    .line 10
    iput-object v2, p0, Lcom/bef/effectsdk/view/BEFView;->mAdBundlePath:Ljava/lang/String;

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    iput-boolean v2, p0, Lcom/bef/effectsdk/view/BEFView;->mNativeInited:Z

    .line 14
    .line 15
    const/16 v3, 0x10

    .line 16
    .line 17
    new-array v3, v3, [F

    .line 18
    .line 19
    iput-object v3, p0, Lcom/bef/effectsdk/view/BEFView;->mMatrix:[F

    .line 20
    .line 21
    const/16 v3, 0xa

    .line 22
    .line 23
    new-array v4, v3, [I

    .line 24
    .line 25
    iput-object v4, p0, Lcom/bef/effectsdk/view/BEFView;->mTouch_ids:[I

    .line 26
    .line 27
    new-array v4, v3, [F

    .line 28
    .line 29
    iput-object v4, p0, Lcom/bef/effectsdk/view/BEFView;->mTouch_xs:[F

    .line 30
    .line 31
    new-array v3, v3, [F

    .line 32
    .line 33
    iput-object v3, p0, Lcom/bef/effectsdk/view/BEFView;->mTouch_ys:[F

    .line 34
    .line 35
    const/4 v3, 0x1

    .line 36
    iput-boolean v3, p0, Lcom/bef/effectsdk/view/BEFView;->mMultipleTouchEnabled:Z

    .line 37
    .line 38
    iput-wide v0, p0, Lcom/bef/effectsdk/view/BEFView;->mAttachedEffect:J

    .line 39
    .line 40
    iput-wide v0, p0, Lcom/bef/effectsdk/view/BEFView;->mLastAttachedEffect:J

    .line 41
    .line 42
    iput-boolean v2, p0, Lcom/bef/effectsdk/view/BEFView;->mDestroyed:Z

    .line 43
    .line 44
    const/4 v0, 0x0

    .line 45
    iput-object v0, p0, Lcom/bef/effectsdk/view/BEFView;->mAssetResourceFinder:Lcom/bef/effectsdk/AssetResourceFinder;

    .line 46
    .line 47
    invoke-direct {p0, p1}, Lcom/bef/effectsdk/view/BEFView;->init(Landroid/content/Context;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method private constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 4

    .line 53
    invoke-direct {p0, p1, p2}, Lcom/bef/effectsdk/GLTextureView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const-wide/16 v0, 0x0

    .line 54
    iput-wide v0, p0, Lcom/bef/effectsdk/view/BEFView;->mHandle:J

    .line 55
    const-string p2, ""

    iput-object p2, p0, Lcom/bef/effectsdk/view/BEFView;->mAdBundlePath:Ljava/lang/String;

    const/4 p2, 0x0

    .line 56
    iput-boolean p2, p0, Lcom/bef/effectsdk/view/BEFView;->mNativeInited:Z

    const/16 v2, 0x10

    .line 57
    new-array v2, v2, [F

    iput-object v2, p0, Lcom/bef/effectsdk/view/BEFView;->mMatrix:[F

    const/16 v2, 0xa

    .line 58
    new-array v3, v2, [I

    iput-object v3, p0, Lcom/bef/effectsdk/view/BEFView;->mTouch_ids:[I

    .line 59
    new-array v3, v2, [F

    iput-object v3, p0, Lcom/bef/effectsdk/view/BEFView;->mTouch_xs:[F

    .line 60
    new-array v2, v2, [F

    iput-object v2, p0, Lcom/bef/effectsdk/view/BEFView;->mTouch_ys:[F

    const/4 v2, 0x1

    .line 61
    iput-boolean v2, p0, Lcom/bef/effectsdk/view/BEFView;->mMultipleTouchEnabled:Z

    .line 62
    iput-wide v0, p0, Lcom/bef/effectsdk/view/BEFView;->mAttachedEffect:J

    .line 63
    iput-wide v0, p0, Lcom/bef/effectsdk/view/BEFView;->mLastAttachedEffect:J

    .line 64
    iput-boolean p2, p0, Lcom/bef/effectsdk/view/BEFView;->mDestroyed:Z

    const/4 p2, 0x0

    .line 65
    iput-object p2, p0, Lcom/bef/effectsdk/view/BEFView;->mAssetResourceFinder:Lcom/bef/effectsdk/AssetResourceFinder;

    .line 66
    invoke-direct {p0, p1}, Lcom/bef/effectsdk/view/BEFView;->init(Landroid/content/Context;)V

    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;Lcom/bef/effectsdk/view/BEFView$1;)V
    .locals 0

    .line 52
    invoke-direct {p0, p1, p2}, Lcom/bef/effectsdk/view/BEFView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Lcom/bef/effectsdk/view/BEFView$1;)V
    .locals 0

    .line 51
    invoke-direct {p0, p1}, Lcom/bef/effectsdk/view/BEFView;-><init>(Landroid/content/Context;)V

    return-void
.end method

.method public static synthetic access$1000(Lcom/bef/effectsdk/view/BEFView;Lcom/bef/effectsdk/view/BEFView$Builder$Params;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/bef/effectsdk/view/BEFView;->setParams(Lcom/bef/effectsdk/view/BEFView$Builder$Params;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1200(Lcom/bef/effectsdk/view/BEFView;)Lcom/bef/effectsdk/view/BEFView$Builder$Params;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bef/effectsdk/view/BEFView;->mParams:Lcom/bef/effectsdk/view/BEFView$Builder$Params;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1300(Lcom/bef/effectsdk/view/BEFView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/bef/effectsdk/view/BEFView;->destoryRender()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1400(Lcom/bef/effectsdk/view/BEFView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/bef/effectsdk/view/BEFView;->initRender()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private convertTouchesToNormalizedPos([F[FI)V
    .locals 14

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x0

    .line 10
    move/from16 v3, p3

    .line 11
    .line 12
    :goto_0
    if-ge v2, v3, :cond_3

    .line 13
    .line 14
    aget v4, p1, v2

    .line 15
    .line 16
    aget v5, p2, v2

    .line 17
    .line 18
    new-instance v6, Landroid/graphics/PointF;

    .line 19
    .line 20
    invoke-direct {v6, v4, v5}, Landroid/graphics/PointF;-><init>(FF)V

    .line 21
    .line 22
    .line 23
    new-instance v7, Landroid/graphics/RectF;

    .line 24
    .line 25
    int-to-float v8, v0

    .line 26
    int-to-float v9, v1

    .line 27
    const/4 v10, 0x0

    .line 28
    invoke-direct {v7, v10, v10, v8, v9}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 29
    .line 30
    .line 31
    new-instance v11, Landroid/graphics/PointF;

    .line 32
    .line 33
    invoke-direct {v11}, Landroid/graphics/PointF;-><init>()V

    .line 34
    .line 35
    .line 36
    iget-object v11, p0, Lcom/bef/effectsdk/view/BEFView;->mParams:Lcom/bef/effectsdk/view/BEFView$Builder$Params;

    .line 37
    .line 38
    invoke-static {v11}, Lcom/bef/effectsdk/view/BEFView$Builder$Params;->access$400(Lcom/bef/effectsdk/view/BEFView$Builder$Params;)Lcom/bef/effectsdk/view/BEFView$FitMode;

    .line 39
    .line 40
    .line 41
    move-result-object v11

    .line 42
    sget-object v12, Lcom/bef/effectsdk/view/BEFView$FitMode;->FILL_SCREEN:Lcom/bef/effectsdk/view/BEFView$FitMode;

    .line 43
    .line 44
    if-ne v11, v12, :cond_0

    .line 45
    .line 46
    new-instance v4, Landroid/graphics/RectF;

    .line 47
    .line 48
    iget-object v5, p0, Lcom/bef/effectsdk/view/BEFView;->mParams:Lcom/bef/effectsdk/view/BEFView$Builder$Params;

    .line 49
    .line 50
    invoke-static {v5}, Lcom/bef/effectsdk/view/BEFView$Builder$Params;->access$100(Lcom/bef/effectsdk/view/BEFView$Builder$Params;)I

    .line 51
    .line 52
    .line 53
    move-result v5

    .line 54
    int-to-float v5, v5

    .line 55
    iget-object v8, p0, Lcom/bef/effectsdk/view/BEFView;->mParams:Lcom/bef/effectsdk/view/BEFView$Builder$Params;

    .line 56
    .line 57
    invoke-static {v8}, Lcom/bef/effectsdk/view/BEFView$Builder$Params;->access$200(Lcom/bef/effectsdk/view/BEFView$Builder$Params;)I

    .line 58
    .line 59
    .line 60
    move-result v8

    .line 61
    int-to-float v8, v8

    .line 62
    invoke-direct {v4, v10, v10, v5, v8}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 63
    .line 64
    .line 65
    sget-object v5, Lcom/bef/effectsdk/view/BEFView$FitMode;->NO_CLIP:Lcom/bef/effectsdk/view/BEFView$FitMode;

    .line 66
    .line 67
    invoke-direct {p0, v6, v7, v4, v5}, Lcom/bef/effectsdk/view/BEFView;->fitResolution(Landroid/graphics/PointF;Landroid/graphics/RectF;Landroid/graphics/RectF;Lcom/bef/effectsdk/view/BEFView$FitMode;)Landroid/graphics/PointF;

    .line 68
    .line 69
    .line 70
    move-result-object v4

    .line 71
    goto :goto_1

    .line 72
    :cond_0
    iget-object v11, p0, Lcom/bef/effectsdk/view/BEFView;->mParams:Lcom/bef/effectsdk/view/BEFView$Builder$Params;

    .line 73
    .line 74
    invoke-static {v11}, Lcom/bef/effectsdk/view/BEFView$Builder$Params;->access$400(Lcom/bef/effectsdk/view/BEFView$Builder$Params;)Lcom/bef/effectsdk/view/BEFView$FitMode;

    .line 75
    .line 76
    .line 77
    move-result-object v11

    .line 78
    sget-object v13, Lcom/bef/effectsdk/view/BEFView$FitMode;->NO_CLIP:Lcom/bef/effectsdk/view/BEFView$FitMode;

    .line 79
    .line 80
    if-ne v11, v13, :cond_1

    .line 81
    .line 82
    new-instance v4, Landroid/graphics/RectF;

    .line 83
    .line 84
    iget-object v5, p0, Lcom/bef/effectsdk/view/BEFView;->mParams:Lcom/bef/effectsdk/view/BEFView$Builder$Params;

    .line 85
    .line 86
    invoke-static {v5}, Lcom/bef/effectsdk/view/BEFView$Builder$Params;->access$100(Lcom/bef/effectsdk/view/BEFView$Builder$Params;)I

    .line 87
    .line 88
    .line 89
    move-result v5

    .line 90
    int-to-float v5, v5

    .line 91
    iget-object v8, p0, Lcom/bef/effectsdk/view/BEFView;->mParams:Lcom/bef/effectsdk/view/BEFView$Builder$Params;

    .line 92
    .line 93
    invoke-static {v8}, Lcom/bef/effectsdk/view/BEFView$Builder$Params;->access$200(Lcom/bef/effectsdk/view/BEFView$Builder$Params;)I

    .line 94
    .line 95
    .line 96
    move-result v8

    .line 97
    int-to-float v8, v8

    .line 98
    invoke-direct {v4, v10, v10, v5, v8}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 99
    .line 100
    .line 101
    invoke-direct {p0, v6, v7, v4, v12}, Lcom/bef/effectsdk/view/BEFView;->fitResolution(Landroid/graphics/PointF;Landroid/graphics/RectF;Landroid/graphics/RectF;Lcom/bef/effectsdk/view/BEFView$FitMode;)Landroid/graphics/PointF;

    .line 102
    .line 103
    .line 104
    move-result-object v4

    .line 105
    goto :goto_1

    .line 106
    :cond_1
    iget-object v11, p0, Lcom/bef/effectsdk/view/BEFView;->mParams:Lcom/bef/effectsdk/view/BEFView$Builder$Params;

    .line 107
    .line 108
    invoke-static {v11}, Lcom/bef/effectsdk/view/BEFView$Builder$Params;->access$400(Lcom/bef/effectsdk/view/BEFView$Builder$Params;)Lcom/bef/effectsdk/view/BEFView$FitMode;

    .line 109
    .line 110
    .line 111
    move-result-object v11

    .line 112
    sget-object v12, Lcom/bef/effectsdk/view/BEFView$FitMode;->FIT_WIDTH_BOTTOM:Lcom/bef/effectsdk/view/BEFView$FitMode;

    .line 113
    .line 114
    if-ne v11, v12, :cond_2

    .line 115
    .line 116
    const/high16 v6, 0x3f800000    # 1.0f

    .line 117
    .line 118
    mul-float v7, v8, v6

    .line 119
    .line 120
    iget-object v10, p0, Lcom/bef/effectsdk/view/BEFView;->mParams:Lcom/bef/effectsdk/view/BEFView$Builder$Params;

    .line 121
    .line 122
    invoke-static {v10}, Lcom/bef/effectsdk/view/BEFView$Builder$Params;->access$100(Lcom/bef/effectsdk/view/BEFView$Builder$Params;)I

    .line 123
    .line 124
    .line 125
    move-result v10

    .line 126
    int-to-float v10, v10

    .line 127
    div-float/2addr v7, v10

    .line 128
    iget-object v10, p0, Lcom/bef/effectsdk/view/BEFView;->mParams:Lcom/bef/effectsdk/view/BEFView$Builder$Params;

    .line 129
    .line 130
    invoke-static {v10}, Lcom/bef/effectsdk/view/BEFView$Builder$Params;->access$200(Lcom/bef/effectsdk/view/BEFView$Builder$Params;)I

    .line 131
    .line 132
    .line 133
    move-result v10

    .line 134
    int-to-float v10, v10

    .line 135
    mul-float/2addr v7, v10

    .line 136
    sub-float/2addr v9, v7

    .line 137
    mul-float/2addr v4, v6

    .line 138
    div-float/2addr v4, v8

    .line 139
    aput v4, p1, v2

    .line 140
    .line 141
    sub-float/2addr v5, v9

    .line 142
    mul-float/2addr v5, v6

    .line 143
    div-float/2addr v5, v7

    .line 144
    aput v5, p2, v2

    .line 145
    .line 146
    goto :goto_2

    .line 147
    :cond_2
    new-instance v4, Landroid/graphics/RectF;

    .line 148
    .line 149
    iget-object v5, p0, Lcom/bef/effectsdk/view/BEFView;->mParams:Lcom/bef/effectsdk/view/BEFView$Builder$Params;

    .line 150
    .line 151
    invoke-static {v5}, Lcom/bef/effectsdk/view/BEFView$Builder$Params;->access$100(Lcom/bef/effectsdk/view/BEFView$Builder$Params;)I

    .line 152
    .line 153
    .line 154
    move-result v5

    .line 155
    int-to-float v5, v5

    .line 156
    iget-object v8, p0, Lcom/bef/effectsdk/view/BEFView;->mParams:Lcom/bef/effectsdk/view/BEFView$Builder$Params;

    .line 157
    .line 158
    invoke-static {v8}, Lcom/bef/effectsdk/view/BEFView$Builder$Params;->access$200(Lcom/bef/effectsdk/view/BEFView$Builder$Params;)I

    .line 159
    .line 160
    .line 161
    move-result v8

    .line 162
    int-to-float v8, v8

    .line 163
    invoke-direct {v4, v10, v10, v5, v8}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 164
    .line 165
    .line 166
    iget-object v5, p0, Lcom/bef/effectsdk/view/BEFView;->mParams:Lcom/bef/effectsdk/view/BEFView$Builder$Params;

    .line 167
    .line 168
    invoke-static {v5}, Lcom/bef/effectsdk/view/BEFView$Builder$Params;->access$400(Lcom/bef/effectsdk/view/BEFView$Builder$Params;)Lcom/bef/effectsdk/view/BEFView$FitMode;

    .line 169
    .line 170
    .line 171
    move-result-object v5

    .line 172
    invoke-direct {p0, v6, v7, v4, v5}, Lcom/bef/effectsdk/view/BEFView;->fitResolution(Landroid/graphics/PointF;Landroid/graphics/RectF;Landroid/graphics/RectF;Lcom/bef/effectsdk/view/BEFView$FitMode;)Landroid/graphics/PointF;

    .line 173
    .line 174
    .line 175
    move-result-object v4

    .line 176
    :goto_1
    iget v5, v4, Landroid/graphics/PointF;->x:F

    .line 177
    .line 178
    iget-object v6, p0, Lcom/bef/effectsdk/view/BEFView;->mParams:Lcom/bef/effectsdk/view/BEFView$Builder$Params;

    .line 179
    .line 180
    invoke-static {v6}, Lcom/bef/effectsdk/view/BEFView$Builder$Params;->access$100(Lcom/bef/effectsdk/view/BEFView$Builder$Params;)I

    .line 181
    .line 182
    .line 183
    move-result v6

    .line 184
    int-to-float v6, v6

    .line 185
    div-float/2addr v5, v6

    .line 186
    aput v5, p1, v2

    .line 187
    .line 188
    iget v4, v4, Landroid/graphics/PointF;->y:F

    .line 189
    .line 190
    iget-object v5, p0, Lcom/bef/effectsdk/view/BEFView;->mParams:Lcom/bef/effectsdk/view/BEFView$Builder$Params;

    .line 191
    .line 192
    invoke-static {v5}, Lcom/bef/effectsdk/view/BEFView$Builder$Params;->access$200(Lcom/bef/effectsdk/view/BEFView$Builder$Params;)I

    .line 193
    .line 194
    .line 195
    move-result v5

    .line 196
    int-to-float v5, v5

    .line 197
    div-float/2addr v4, v5

    .line 198
    aput v4, p2, v2

    .line 199
    .line 200
    :goto_2
    add-int/lit8 v2, v2, 0x1

    .line 201
    .line 202
    goto/16 :goto_0

    .line 203
    .line 204
    :cond_3
    return-void
.end method

.method private dealWithTouches(Landroid/view/MotionEvent;)V
    .locals 8

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/16 v1, 0xa

    .line 6
    .line 7
    if-le v0, v1, :cond_0

    .line 8
    .line 9
    move v7, v1

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    move v7, v0

    .line 12
    :goto_0
    const/4 v0, 0x0

    .line 13
    move v1, v0

    .line 14
    :goto_1
    if-ge v1, v7, :cond_1

    .line 15
    .line 16
    iget-object v2, p0, Lcom/bef/effectsdk/view/BEFView;->mTouch_ids:[I

    .line 17
    .line 18
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    aput v3, v2, v1

    .line 23
    .line 24
    iget-object v2, p0, Lcom/bef/effectsdk/view/BEFView;->mTouch_xs:[F

    .line 25
    .line 26
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getX(I)F

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    aput v3, v2, v1

    .line 31
    .line 32
    iget-object v2, p0, Lcom/bef/effectsdk/view/BEFView;->mTouch_ys:[F

    .line 33
    .line 34
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getY(I)F

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    aput v3, v2, v1

    .line 39
    .line 40
    add-int/lit8 v1, v1, 0x1

    .line 41
    .line 42
    goto :goto_1

    .line 43
    :cond_1
    iget-object v1, p0, Lcom/bef/effectsdk/view/BEFView;->mTouch_xs:[F

    .line 44
    .line 45
    iget-object v2, p0, Lcom/bef/effectsdk/view/BEFView;->mTouch_ys:[F

    .line 46
    .line 47
    invoke-direct {p0, v1, v2, v7}, Lcom/bef/effectsdk/view/BEFView;->convertTouchesToNormalizedPos([F[FI)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    iget-boolean v2, p0, Lcom/bef/effectsdk/view/BEFView;->mMultipleTouchEnabled:Z

    .line 55
    .line 56
    if-nez v2, :cond_2

    .line 57
    .line 58
    if-nez v1, :cond_3

    .line 59
    .line 60
    :cond_2
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    and-int/lit16 p1, p1, 0xff

    .line 65
    .line 66
    const/4 v2, 0x1

    .line 67
    if-eqz p1, :cond_5

    .line 68
    .line 69
    if-eq p1, v2, :cond_4

    .line 70
    .line 71
    const/4 v3, 0x2

    .line 72
    if-eq p1, v3, :cond_6

    .line 73
    .line 74
    const/4 v3, 0x5

    .line 75
    if-eq p1, v3, :cond_5

    .line 76
    .line 77
    const/4 v3, 0x6

    .line 78
    if-eq p1, v3, :cond_4

    .line 79
    .line 80
    :cond_3
    return-void

    .line 81
    :cond_4
    move-object v3, p0

    .line 82
    goto :goto_3

    .line 83
    :cond_5
    move-object v3, p0

    .line 84
    goto :goto_4

    .line 85
    :cond_6
    new-array v4, v7, [I

    .line 86
    .line 87
    new-array v5, v7, [F

    .line 88
    .line 89
    new-array v6, v7, [F

    .line 90
    .line 91
    :goto_2
    if-ge v0, v7, :cond_7

    .line 92
    .line 93
    iget-object p1, p0, Lcom/bef/effectsdk/view/BEFView;->mTouch_ids:[I

    .line 94
    .line 95
    aget p1, p1, v0

    .line 96
    .line 97
    aput p1, v4, v0

    .line 98
    .line 99
    iget-object p1, p0, Lcom/bef/effectsdk/view/BEFView;->mTouch_xs:[F

    .line 100
    .line 101
    aget p1, p1, v0

    .line 102
    .line 103
    aput p1, v5, v0

    .line 104
    .line 105
    iget-object p1, p0, Lcom/bef/effectsdk/view/BEFView;->mTouch_ys:[F

    .line 106
    .line 107
    aget p1, p1, v0

    .line 108
    .line 109
    aput p1, v6, v0

    .line 110
    .line 111
    add-int/lit8 v0, v0, 0x1

    .line 112
    .line 113
    goto :goto_2

    .line 114
    :cond_7
    new-instance v2, Lcom/bef/effectsdk/view/BEFView$4;

    .line 115
    .line 116
    move-object v3, p0

    .line 117
    invoke-direct/range {v2 .. v7}, Lcom/bef/effectsdk/view/BEFView$4;-><init>(Lcom/bef/effectsdk/view/BEFView;[I[F[FI)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {v3, v2}, Lcom/bef/effectsdk/GLTextureView;->queueEvent(Ljava/lang/Runnable;)V

    .line 121
    .line 122
    .line 123
    return-void

    .line 124
    :goto_3
    iget-object p0, v3, Lcom/bef/effectsdk/view/BEFView;->mTouch_ids:[I

    .line 125
    .line 126
    aget p0, p0, v1

    .line 127
    .line 128
    filled-new-array {p0}, [I

    .line 129
    .line 130
    .line 131
    move-result-object v4

    .line 132
    iget-object p0, v3, Lcom/bef/effectsdk/view/BEFView;->mTouch_xs:[F

    .line 133
    .line 134
    aget p0, p0, v1

    .line 135
    .line 136
    new-array v5, v2, [F

    .line 137
    .line 138
    aput p0, v5, v0

    .line 139
    .line 140
    iget-object p0, v3, Lcom/bef/effectsdk/view/BEFView;->mTouch_ys:[F

    .line 141
    .line 142
    aget p0, p0, v1

    .line 143
    .line 144
    new-array v6, v2, [F

    .line 145
    .line 146
    aput p0, v6, v0

    .line 147
    .line 148
    new-instance v2, Lcom/bef/effectsdk/view/BEFView$5;

    .line 149
    .line 150
    invoke-direct/range {v2 .. v7}, Lcom/bef/effectsdk/view/BEFView$5;-><init>(Lcom/bef/effectsdk/view/BEFView;[I[F[FI)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {v3, v2}, Lcom/bef/effectsdk/GLTextureView;->queueEvent(Ljava/lang/Runnable;)V

    .line 154
    .line 155
    .line 156
    return-void

    .line 157
    :goto_4
    iget-object p0, v3, Lcom/bef/effectsdk/view/BEFView;->mTouch_ids:[I

    .line 158
    .line 159
    aget p0, p0, v1

    .line 160
    .line 161
    filled-new-array {p0}, [I

    .line 162
    .line 163
    .line 164
    move-result-object v4

    .line 165
    iget-object p0, v3, Lcom/bef/effectsdk/view/BEFView;->mTouch_xs:[F

    .line 166
    .line 167
    aget p0, p0, v1

    .line 168
    .line 169
    new-array v5, v2, [F

    .line 170
    .line 171
    aput p0, v5, v0

    .line 172
    .line 173
    iget-object p0, v3, Lcom/bef/effectsdk/view/BEFView;->mTouch_ys:[F

    .line 174
    .line 175
    aget p0, p0, v1

    .line 176
    .line 177
    new-array v6, v2, [F

    .line 178
    .line 179
    aput p0, v6, v0

    .line 180
    .line 181
    new-instance v2, Lcom/bef/effectsdk/view/BEFView$3;

    .line 182
    .line 183
    invoke-direct/range {v2 .. v7}, Lcom/bef/effectsdk/view/BEFView$3;-><init>(Lcom/bef/effectsdk/view/BEFView;[I[F[FI)V

    .line 184
    .line 185
    .line 186
    invoke-virtual {v3, v2}, Lcom/bef/effectsdk/GLTextureView;->queueEvent(Ljava/lang/Runnable;)V

    .line 187
    .line 188
    .line 189
    return-void
.end method

.method private destoryRender()V
    .locals 6

    .line 1
    invoke-virtual {p0}, Lcom/bef/effectsdk/view/BEFView;->getNativeInited()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-ne v0, v1, :cond_2

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p0, v0}, Lcom/bef/effectsdk/view/BEFView;->setNativeInited(Z)V

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Lcom/bef/effectsdk/view/BEFView;->mParams:Lcom/bef/effectsdk/view/BEFView$Builder$Params;

    .line 13
    .line 14
    invoke-static {v1}, Lcom/bef/effectsdk/view/BEFView$Builder$Params;->access$500(Lcom/bef/effectsdk/view/BEFView$Builder$Params;)Lcom/bef/effectsdk/ResourceFinder;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    iget-object v1, p0, Lcom/bef/effectsdk/view/BEFView;->mParams:Lcom/bef/effectsdk/view/BEFView$Builder$Params;

    .line 21
    .line 22
    invoke-static {v1}, Lcom/bef/effectsdk/view/BEFView$Builder$Params;->access$500(Lcom/bef/effectsdk/view/BEFView$Builder$Params;)Lcom/bef/effectsdk/ResourceFinder;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    iget-wide v2, p0, Lcom/bef/effectsdk/view/BEFView;->mHandle:J

    .line 27
    .line 28
    invoke-interface {v1, v2, v3}, Lcom/bef/effectsdk/ResourceFinder;->release(J)V

    .line 29
    .line 30
    .line 31
    :cond_0
    iget-object v1, p0, Lcom/bef/effectsdk/view/BEFView;->mAssetResourceFinder:Lcom/bef/effectsdk/AssetResourceFinder;

    .line 32
    .line 33
    const-wide/16 v2, 0x0

    .line 34
    .line 35
    if-eqz v1, :cond_1

    .line 36
    .line 37
    invoke-virtual {v1, v2, v3}, Lcom/bef/effectsdk/AssetResourceFinder;->release(J)V

    .line 38
    .line 39
    .line 40
    :cond_1
    iget-wide v4, p0, Lcom/bef/effectsdk/view/BEFView;->mHandle:J

    .line 41
    .line 42
    invoke-static {v4, v5, p0}, Lcom/bef/effectsdk/view/ViewControllerInterface;->removeMessageListener(JLcom/bef/effectsdk/view/ViewControllerInterface$NativeMessageListener;)I

    .line 43
    .line 44
    .line 45
    iget-wide v4, p0, Lcom/bef/effectsdk/view/BEFView;->mHandle:J

    .line 46
    .line 47
    invoke-static {v4, v5}, Lcom/bef/effectsdk/view/ViewControllerInterface;->destroy(J)I

    .line 48
    .line 49
    .line 50
    iput-wide v2, p0, Lcom/bef/effectsdk/view/BEFView;->mHandle:J

    .line 51
    .line 52
    iget v1, p0, Lcom/bef/effectsdk/view/BEFView;->mSourceTexture:I

    .line 53
    .line 54
    invoke-static {v1}, Lcom/bef/effectsdk/view/ViewControllerInterface;->deleteTexture(I)I

    .line 55
    .line 56
    .line 57
    iput v0, p0, Lcom/bef/effectsdk/view/BEFView;->mSourceTexture:I

    .line 58
    .line 59
    invoke-static {p0}, Lcom/bef/effectsdk/message/MessageCenter;->removeListener(Lcom/bef/effectsdk/message/MessageCenter$Listener;)V

    .line 60
    .line 61
    .line 62
    invoke-static {}, Lcom/bef/effectsdk/message/MessageCenter;->destroy()V

    .line 63
    .line 64
    .line 65
    iput-wide v2, p0, Lcom/bef/effectsdk/view/BEFView;->mLastAttachedEffect:J

    .line 66
    .line 67
    :cond_2
    return-void
.end method

.method private fitResolution(Landroid/graphics/PointF;Landroid/graphics/RectF;Landroid/graphics/RectF;Lcom/bef/effectsdk/view/BEFView$FitMode;)Landroid/graphics/PointF;
    .locals 9

    .line 1
    new-instance v0, Landroid/graphics/PointF;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, p3, Landroid/graphics/RectF;->left:F

    .line 7
    .line 8
    iget v2, p3, Landroid/graphics/RectF;->top:F

    .line 9
    .line 10
    invoke-virtual {p3}, Landroid/graphics/RectF;->width()F

    .line 11
    .line 12
    .line 13
    move-result v3

    .line 14
    invoke-virtual {p3}, Landroid/graphics/RectF;->height()F

    .line 15
    .line 16
    .line 17
    move-result v4

    .line 18
    iget v5, p1, Landroid/graphics/PointF;->x:F

    .line 19
    .line 20
    iget v6, p2, Landroid/graphics/RectF;->left:F

    .line 21
    .line 22
    sub-float/2addr v5, v6

    .line 23
    invoke-virtual {p2}, Landroid/graphics/RectF;->width()F

    .line 24
    .line 25
    .line 26
    move-result v6

    .line 27
    div-float/2addr v5, v6

    .line 28
    iget v6, p1, Landroid/graphics/PointF;->y:F

    .line 29
    .line 30
    iget v7, p2, Landroid/graphics/RectF;->top:F

    .line 31
    .line 32
    sub-float/2addr v6, v7

    .line 33
    invoke-virtual {p2}, Landroid/graphics/RectF;->height()F

    .line 34
    .line 35
    .line 36
    move-result v7

    .line 37
    div-float/2addr v6, v7

    .line 38
    sget-object v7, Lcom/bef/effectsdk/view/BEFView$12;->$SwitchMap$com$bef$effectsdk$view$BEFView$FitMode:[I

    .line 39
    .line 40
    invoke-virtual {p4}, Ljava/lang/Enum;->ordinal()I

    .line 41
    .line 42
    .line 43
    move-result p4

    .line 44
    aget p4, v7, p4

    .line 45
    .line 46
    const/4 v7, 0x1

    .line 47
    const/high16 v8, 0x40000000    # 2.0f

    .line 48
    .line 49
    if-eq p4, v7, :cond_5

    .line 50
    .line 51
    const/4 v7, 0x2

    .line 52
    if-eq p4, v7, :cond_4

    .line 53
    .line 54
    const/4 v1, 0x3

    .line 55
    if-eq p4, v1, :cond_2

    .line 56
    .line 57
    const/4 v1, 0x4

    .line 58
    if-eq p4, v1, :cond_0

    .line 59
    .line 60
    return-object v0

    .line 61
    :cond_0
    invoke-virtual {p2}, Landroid/graphics/RectF;->width()F

    .line 62
    .line 63
    .line 64
    move-result p4

    .line 65
    div-float/2addr v3, p4

    .line 66
    invoke-virtual {p2}, Landroid/graphics/RectF;->height()F

    .line 67
    .line 68
    .line 69
    move-result p4

    .line 70
    div-float/2addr v4, p4

    .line 71
    cmpl-float p4, v3, v4

    .line 72
    .line 73
    if-lez p4, :cond_1

    .line 74
    .line 75
    sget-object p4, Lcom/bef/effectsdk/view/BEFView$FitMode;->FIT_HEIGHT:Lcom/bef/effectsdk/view/BEFView$FitMode;

    .line 76
    .line 77
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/bef/effectsdk/view/BEFView;->fitResolution(Landroid/graphics/PointF;Landroid/graphics/RectF;Landroid/graphics/RectF;Lcom/bef/effectsdk/view/BEFView$FitMode;)Landroid/graphics/PointF;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    return-object p0

    .line 82
    :cond_1
    sget-object p4, Lcom/bef/effectsdk/view/BEFView$FitMode;->FIT_WIDTH:Lcom/bef/effectsdk/view/BEFView$FitMode;

    .line 83
    .line 84
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/bef/effectsdk/view/BEFView;->fitResolution(Landroid/graphics/PointF;Landroid/graphics/RectF;Landroid/graphics/RectF;Lcom/bef/effectsdk/view/BEFView$FitMode;)Landroid/graphics/PointF;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    return-object p0

    .line 89
    :cond_2
    invoke-virtual {p2}, Landroid/graphics/RectF;->width()F

    .line 90
    .line 91
    .line 92
    move-result p4

    .line 93
    div-float/2addr v3, p4

    .line 94
    invoke-virtual {p2}, Landroid/graphics/RectF;->height()F

    .line 95
    .line 96
    .line 97
    move-result p4

    .line 98
    div-float/2addr v4, p4

    .line 99
    cmpg-float p4, v3, v4

    .line 100
    .line 101
    if-gez p4, :cond_3

    .line 102
    .line 103
    sget-object p4, Lcom/bef/effectsdk/view/BEFView$FitMode;->FIT_HEIGHT:Lcom/bef/effectsdk/view/BEFView$FitMode;

    .line 104
    .line 105
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/bef/effectsdk/view/BEFView;->fitResolution(Landroid/graphics/PointF;Landroid/graphics/RectF;Landroid/graphics/RectF;Lcom/bef/effectsdk/view/BEFView$FitMode;)Landroid/graphics/PointF;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    return-object p0

    .line 110
    :cond_3
    sget-object p4, Lcom/bef/effectsdk/view/BEFView$FitMode;->FIT_WIDTH:Lcom/bef/effectsdk/view/BEFView$FitMode;

    .line 111
    .line 112
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/bef/effectsdk/view/BEFView;->fitResolution(Landroid/graphics/PointF;Landroid/graphics/RectF;Landroid/graphics/RectF;Lcom/bef/effectsdk/view/BEFView$FitMode;)Landroid/graphics/PointF;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    return-object p0

    .line 117
    :cond_4
    invoke-virtual {p2}, Landroid/graphics/RectF;->height()F

    .line 118
    .line 119
    .line 120
    move-result p0

    .line 121
    div-float p0, v4, p0

    .line 122
    .line 123
    invoke-virtual {p2}, Landroid/graphics/RectF;->width()F

    .line 124
    .line 125
    .line 126
    move-result p1

    .line 127
    mul-float/2addr p1, p0

    .line 128
    sub-float/2addr v3, p1

    .line 129
    div-float/2addr v3, v8

    .line 130
    add-float/2addr v1, v3

    .line 131
    mul-float/2addr v5, p0

    .line 132
    invoke-virtual {p2}, Landroid/graphics/RectF;->width()F

    .line 133
    .line 134
    .line 135
    move-result p0

    .line 136
    mul-float/2addr v5, p0

    .line 137
    add-float/2addr v1, v5

    .line 138
    float-to-int p0, v1

    .line 139
    int-to-float p0, p0

    .line 140
    iput p0, v0, Landroid/graphics/PointF;->x:F

    .line 141
    .line 142
    mul-float/2addr v6, v4

    .line 143
    add-float/2addr v2, v6

    .line 144
    float-to-int p0, v2

    .line 145
    int-to-float p0, p0

    .line 146
    iput p0, v0, Landroid/graphics/PointF;->y:F

    .line 147
    .line 148
    return-object v0

    .line 149
    :cond_5
    invoke-virtual {p2}, Landroid/graphics/RectF;->width()F

    .line 150
    .line 151
    .line 152
    move-result p0

    .line 153
    div-float p0, v3, p0

    .line 154
    .line 155
    mul-float/2addr v5, v3

    .line 156
    add-float/2addr v1, v5

    .line 157
    float-to-int p1, v1

    .line 158
    int-to-float p1, p1

    .line 159
    iput p1, v0, Landroid/graphics/PointF;->x:F

    .line 160
    .line 161
    invoke-virtual {p2}, Landroid/graphics/RectF;->height()F

    .line 162
    .line 163
    .line 164
    move-result p1

    .line 165
    mul-float/2addr p1, p0

    .line 166
    sub-float/2addr v4, p1

    .line 167
    div-float/2addr v4, v8

    .line 168
    add-float/2addr v2, v4

    .line 169
    mul-float/2addr v6, p0

    .line 170
    invoke-virtual {p2}, Landroid/graphics/RectF;->height()F

    .line 171
    .line 172
    .line 173
    move-result p0

    .line 174
    mul-float/2addr v6, p0

    .line 175
    add-float/2addr v2, v6

    .line 176
    float-to-int p0, v2

    .line 177
    int-to-float p0, p0

    .line 178
    iput p0, v0, Landroid/graphics/PointF;->y:F

    .line 179
    .line 180
    return-object v0
.end method

.method private init(Landroid/content/Context;)V
    .locals 8

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Lcom/bef/effectsdk/GLTextureView;->setPreserveEGLContextOnPause(Z)V

    .line 3
    .line 4
    .line 5
    const/16 v6, 0x10

    .line 6
    .line 7
    const/4 v7, 0x0

    .line 8
    const/16 v2, 0x8

    .line 9
    .line 10
    const/16 v3, 0x8

    .line 11
    .line 12
    const/16 v4, 0x8

    .line 13
    .line 14
    const/16 v5, 0x8

    .line 15
    .line 16
    move-object v1, p0

    .line 17
    invoke-virtual/range {v1 .. v7}, Lcom/bef/effectsdk/GLTextureView;->setEGLConfigChooser(IIIIII)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1, v1}, Lcom/bef/effectsdk/GLTextureView;->setRenderer(Landroid/opengl/GLSurfaceView$Renderer;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1, v0}, Lcom/bef/effectsdk/GLTextureView;->setRenderMode(I)V

    .line 24
    .line 25
    .line 26
    new-instance p0, Ljava/util/HashSet;

    .line 27
    .line 28
    invoke-direct {p0}, Ljava/util/HashSet;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object p0, v1, Lcom/bef/effectsdk/view/BEFView;->mListeners:Ljava/util/HashSet;

    .line 32
    .line 33
    new-instance p0, Ljava/util/LinkedList;

    .line 34
    .line 35
    invoke-direct {p0}, Ljava/util/LinkedList;-><init>()V

    .line 36
    .line 37
    .line 38
    iput-object p0, v1, Lcom/bef/effectsdk/view/BEFView;->mCacheMessages:Ljava/util/Queue;

    .line 39
    .line 40
    new-instance p0, Lcom/bef/effectsdk/AssetResourceFinder;

    .line 41
    .line 42
    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    const-string v0, ""

    .line 47
    .line 48
    invoke-direct {p0, p1, v0}, Lcom/bef/effectsdk/AssetResourceFinder;-><init>(Landroid/content/res/AssetManager;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    iput-object p0, v1, Lcom/bef/effectsdk/view/BEFView;->mAssetResourceFinder:Lcom/bef/effectsdk/AssetResourceFinder;

    .line 52
    .line 53
    const-wide/16 v2, 0x0

    .line 54
    .line 55
    invoke-virtual {p0, v2, v3}, Lcom/bef/effectsdk/AssetResourceFinder;->createNativeResourceFinder(J)J

    .line 56
    .line 57
    .line 58
    const/4 p0, 0x0

    .line 59
    iput-boolean p0, v1, Lcom/bef/effectsdk/view/BEFView;->mDestroyed:Z

    .line 60
    .line 61
    return-void
.end method

.method private initRender()V
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Lcom/bef/effectsdk/view/BEFView;->setNativeInited(Z)V

    .line 5
    .line 6
    .line 7
    iget-wide v2, v0, Lcom/bef/effectsdk/view/BEFView;->mHandle:J

    .line 8
    .line 9
    const-wide/16 v4, 0x0

    .line 10
    .line 11
    cmp-long v6, v2, v4

    .line 12
    .line 13
    if-eqz v6, :cond_0

    .line 14
    .line 15
    :try_start_0
    invoke-static {v2, v3}, Lcom/bef/effectsdk/view/ViewControllerInterface;->destroy(J)I

    .line 16
    .line 17
    .line 18
    iput-wide v4, v0, Lcom/bef/effectsdk/view/BEFView;->mHandle:J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :catch_0
    const-string v2, "BEFView"

    .line 22
    .line 23
    const-string v3, "Destroy old effect handle failed"

    .line 24
    .line 25
    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    :cond_0
    :goto_0
    iget v2, v0, Lcom/bef/effectsdk/view/BEFView;->mSourceTexture:I

    .line 29
    .line 30
    if-lez v2, :cond_1

    .line 31
    .line 32
    invoke-static {v2}, Lcom/bef/effectsdk/view/ViewControllerInterface;->deleteTexture(I)I

    .line 33
    .line 34
    .line 35
    :cond_1
    iget-wide v2, v0, Lcom/bef/effectsdk/view/BEFView;->mHandle:J

    .line 36
    .line 37
    cmp-long v2, v2, v4

    .line 38
    .line 39
    if-nez v2, :cond_3

    .line 40
    .line 41
    const/4 v2, 0x2

    .line 42
    new-array v2, v2, [J

    .line 43
    .line 44
    iget-object v3, v0, Lcom/bef/effectsdk/view/BEFView;->mParams:Lcom/bef/effectsdk/view/BEFView$Builder$Params;

    .line 45
    .line 46
    invoke-static {v3}, Lcom/bef/effectsdk/view/BEFView$Builder$Params;->access$600(Lcom/bef/effectsdk/view/BEFView$Builder$Params;)Lcom/bef/effectsdk/view/BEFView$BEFViewSceneKey;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    .line 51
    .line 52
    .line 53
    move-result v3

    .line 54
    invoke-static {v2, v3}, Lcom/bef/effectsdk/view/ViewControllerInterface;->createHandle([JI)V

    .line 55
    .line 56
    .line 57
    aget-wide v6, v2, v1

    .line 58
    .line 59
    iput-wide v6, v0, Lcom/bef/effectsdk/view/BEFView;->mHandle:J

    .line 60
    .line 61
    iget-object v2, v0, Lcom/bef/effectsdk/view/BEFView;->mParams:Lcom/bef/effectsdk/view/BEFView$Builder$Params;

    .line 62
    .line 63
    invoke-static {v2}, Lcom/bef/effectsdk/view/BEFView$Builder$Params;->access$500(Lcom/bef/effectsdk/view/BEFView$Builder$Params;)Lcom/bef/effectsdk/ResourceFinder;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    iget-wide v6, v0, Lcom/bef/effectsdk/view/BEFView;->mHandle:J

    .line 68
    .line 69
    if-eqz v2, :cond_2

    .line 70
    .line 71
    iget-object v2, v0, Lcom/bef/effectsdk/view/BEFView;->mParams:Lcom/bef/effectsdk/view/BEFView$Builder$Params;

    .line 72
    .line 73
    invoke-static {v2}, Lcom/bef/effectsdk/view/BEFView$Builder$Params;->access$500(Lcom/bef/effectsdk/view/BEFView$Builder$Params;)Lcom/bef/effectsdk/ResourceFinder;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    iget-wide v8, v0, Lcom/bef/effectsdk/view/BEFView;->mHandle:J

    .line 78
    .line 79
    invoke-interface {v2, v8, v9}, Lcom/bef/effectsdk/ResourceFinder;->createNativeResourceFinder(J)J

    .line 80
    .line 81
    .line 82
    move-result-wide v8

    .line 83
    const-wide/16 v10, 0x0

    .line 84
    .line 85
    invoke-static/range {v6 .. v11}, Lcom/bef/effectsdk/view/ViewControllerInterface;->setResourceFinder(JJJ)I

    .line 86
    .line 87
    .line 88
    goto :goto_1

    .line 89
    :cond_2
    const-wide/16 v8, 0x0

    .line 90
    .line 91
    const-wide/16 v10, 0x0

    .line 92
    .line 93
    invoke-static/range {v6 .. v11}, Lcom/bef/effectsdk/view/ViewControllerInterface;->setResourceFinder(JJJ)I

    .line 94
    .line 95
    .line 96
    :goto_1
    iget-wide v2, v0, Lcom/bef/effectsdk/view/BEFView;->mHandle:J

    .line 97
    .line 98
    iget-object v6, v0, Lcom/bef/effectsdk/view/BEFView;->mParams:Lcom/bef/effectsdk/view/BEFView$Builder$Params;

    .line 99
    .line 100
    invoke-static {v6}, Lcom/bef/effectsdk/view/BEFView$Builder$Params;->access$100(Lcom/bef/effectsdk/view/BEFView$Builder$Params;)I

    .line 101
    .line 102
    .line 103
    move-result v6

    .line 104
    iget-object v7, v0, Lcom/bef/effectsdk/view/BEFView;->mParams:Lcom/bef/effectsdk/view/BEFView$Builder$Params;

    .line 105
    .line 106
    invoke-static {v7}, Lcom/bef/effectsdk/view/BEFView$Builder$Params;->access$200(Lcom/bef/effectsdk/view/BEFView$Builder$Params;)I

    .line 107
    .line 108
    .line 109
    move-result v7

    .line 110
    invoke-static {v2, v3, v6, v7}, Lcom/bef/effectsdk/view/ViewControllerInterface;->init(JII)I

    .line 111
    .line 112
    .line 113
    :cond_3
    iget-wide v2, v0, Lcom/bef/effectsdk/view/BEFView;->mHandle:J

    .line 114
    .line 115
    invoke-static {v2, v3, v0}, Lcom/bef/effectsdk/view/ViewControllerInterface;->addMessageListener(JLcom/bef/effectsdk/view/ViewControllerInterface$NativeMessageListener;)I

    .line 116
    .line 117
    .line 118
    invoke-static {}, Lcom/bef/effectsdk/message/MessageCenter;->init()V

    .line 119
    .line 120
    .line 121
    invoke-static {v0}, Lcom/bef/effectsdk/message/MessageCenter;->addListener(Lcom/bef/effectsdk/message/MessageCenter$Listener;)V

    .line 122
    .line 123
    .line 124
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 125
    .line 126
    .line 127
    move-result-wide v2

    .line 128
    iput-wide v2, v0, Lcom/bef/effectsdk/view/BEFView;->mLastTickInNanoSeconds:J

    .line 129
    .line 130
    const/4 v2, 0x1

    .line 131
    new-array v3, v2, [I

    .line 132
    .line 133
    new-array v6, v2, [I

    .line 134
    .line 135
    new-array v7, v2, [I

    .line 136
    .line 137
    invoke-static {v2, v3, v1}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 138
    .line 139
    .line 140
    aget v8, v3, v1

    .line 141
    .line 142
    const/16 v9, 0xde1

    .line 143
    .line 144
    invoke-static {v9, v8}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 145
    .line 146
    .line 147
    const/16 v8, 0x2800

    .line 148
    .line 149
    const v10, 0x46180400    # 9729.0f

    .line 150
    .line 151
    .line 152
    invoke-static {v9, v8, v10}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 153
    .line 154
    .line 155
    const/16 v8, 0x2801

    .line 156
    .line 157
    invoke-static {v9, v8, v10}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 158
    .line 159
    .line 160
    const/16 v8, 0x2802

    .line 161
    .line 162
    const v10, 0x47012f00    # 33071.0f

    .line 163
    .line 164
    .line 165
    invoke-static {v9, v8, v10}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 166
    .line 167
    .line 168
    const/16 v8, 0x2803

    .line 169
    .line 170
    invoke-static {v9, v8, v10}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 171
    .line 172
    .line 173
    iget-object v8, v0, Lcom/bef/effectsdk/view/BEFView;->mParams:Lcom/bef/effectsdk/view/BEFView$Builder$Params;

    .line 174
    .line 175
    invoke-static {v8}, Lcom/bef/effectsdk/view/BEFView$Builder$Params;->access$100(Lcom/bef/effectsdk/view/BEFView$Builder$Params;)I

    .line 176
    .line 177
    .line 178
    move-result v13

    .line 179
    iget-object v8, v0, Lcom/bef/effectsdk/view/BEFView;->mParams:Lcom/bef/effectsdk/view/BEFView$Builder$Params;

    .line 180
    .line 181
    invoke-static {v8}, Lcom/bef/effectsdk/view/BEFView$Builder$Params;->access$200(Lcom/bef/effectsdk/view/BEFView$Builder$Params;)I

    .line 182
    .line 183
    .line 184
    move-result v14

    .line 185
    const/16 v17, 0x1401

    .line 186
    .line 187
    const/16 v18, 0x0

    .line 188
    .line 189
    const/16 v10, 0xde1

    .line 190
    .line 191
    const/4 v11, 0x0

    .line 192
    const/16 v12, 0x1908

    .line 193
    .line 194
    const/4 v15, 0x0

    .line 195
    const/16 v16, 0x1908

    .line 196
    .line 197
    invoke-static/range {v10 .. v18}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 198
    .line 199
    .line 200
    invoke-static {v9, v1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 201
    .line 202
    .line 203
    const v8, 0x8ca6

    .line 204
    .line 205
    .line 206
    invoke-static {v8, v7, v1}, Landroid/opengl/GLES20;->glGetIntegerv(I[II)V

    .line 207
    .line 208
    .line 209
    invoke-static {v2, v6, v1}, Landroid/opengl/GLES20;->glGenFramebuffers(I[II)V

    .line 210
    .line 211
    .line 212
    aget v8, v6, v1

    .line 213
    .line 214
    const v10, 0x8d40

    .line 215
    .line 216
    .line 217
    invoke-static {v10, v8}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 218
    .line 219
    .line 220
    const v8, 0x8ce0

    .line 221
    .line 222
    .line 223
    aget v11, v3, v1

    .line 224
    .line 225
    invoke-static {v10, v8, v9, v11, v1}, Landroid/opengl/GLES20;->glFramebufferTexture2D(IIIII)V

    .line 226
    .line 227
    .line 228
    iget-object v8, v0, Lcom/bef/effectsdk/view/BEFView;->mParams:Lcom/bef/effectsdk/view/BEFView$Builder$Params;

    .line 229
    .line 230
    invoke-static {v8}, Lcom/bef/effectsdk/view/BEFView$Builder$Params;->access$100(Lcom/bef/effectsdk/view/BEFView$Builder$Params;)I

    .line 231
    .line 232
    .line 233
    move-result v8

    .line 234
    iget-object v9, v0, Lcom/bef/effectsdk/view/BEFView;->mParams:Lcom/bef/effectsdk/view/BEFView$Builder$Params;

    .line 235
    .line 236
    invoke-static {v9}, Lcom/bef/effectsdk/view/BEFView$Builder$Params;->access$200(Lcom/bef/effectsdk/view/BEFView$Builder$Params;)I

    .line 237
    .line 238
    .line 239
    move-result v9

    .line 240
    invoke-static {v1, v1, v8, v9}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 241
    .line 242
    .line 243
    const/4 v8, 0x0

    .line 244
    invoke-static {v8, v8, v8, v8}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 245
    .line 246
    .line 247
    const/16 v8, 0x4000

    .line 248
    .line 249
    invoke-static {v8}, Landroid/opengl/GLES20;->glClear(I)V

    .line 250
    .line 251
    .line 252
    aget v7, v7, v1

    .line 253
    .line 254
    invoke-static {v10, v7}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 255
    .line 256
    .line 257
    invoke-static {v2, v6, v1}, Landroid/opengl/GLES20;->glDeleteFramebuffers(I[II)V

    .line 258
    .line 259
    .line 260
    aget v1, v3, v1

    .line 261
    .line 262
    iput v1, v0, Lcom/bef/effectsdk/view/BEFView;->mSourceTexture:I

    .line 263
    .line 264
    iget-object v1, v0, Lcom/bef/effectsdk/view/BEFView;->mAdBundlePath:Ljava/lang/String;

    .line 265
    .line 266
    const-string v3, ""

    .line 267
    .line 268
    if-eq v1, v3, :cond_4

    .line 269
    .line 270
    iget-wide v6, v0, Lcom/bef/effectsdk/view/BEFView;->mHandle:J

    .line 271
    .line 272
    invoke-static {v6, v7, v1}, Lcom/bef/effectsdk/view/ViewControllerInterface;->setStickerPath(JLjava/lang/String;)I

    .line 273
    .line 274
    .line 275
    :cond_4
    iput-wide v4, v0, Lcom/bef/effectsdk/view/BEFView;->mLastAttachedEffect:J

    .line 276
    .line 277
    invoke-virtual {v0, v2}, Lcom/bef/effectsdk/view/BEFView;->setNativeInited(Z)V

    .line 278
    .line 279
    .line 280
    return-void
.end method

.method private setParams(Lcom/bef/effectsdk/view/BEFView$Builder$Params;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/bef/effectsdk/view/BEFView;->mParams:Lcom/bef/effectsdk/view/BEFView$Builder$Params;

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method public declared-synchronized addMessageListener(Lcom/bef/effectsdk/view/BEFView$MessageListener;)I
    .locals 1
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    monitor-exit p0

    .line 5
    const/4 p0, -0x1

    .line 6
    return p0

    .line 7
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/bef/effectsdk/view/BEFView;->mListeners:Ljava/util/HashSet;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    .line 11
    .line 12
    monitor-exit p0

    .line 13
    const/4 p0, 0x0

    .line 14
    return p0

    .line 15
    :catchall_0
    move-exception p1

    .line 16
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 17
    throw p1
.end method

.method public declared-synchronized attachEffect(J)V
    .locals 0
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iput-wide p1, p0, Lcom/bef/effectsdk/view/BEFView;->mAttachedEffect:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    monitor-exit p0

    .line 5
    return-void

    .line 6
    :catchall_0
    move-exception p1

    .line 7
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 8
    throw p1
.end method

.method public getNativeInited()Z
    .locals 0
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation

    .line 1
    iget-boolean p0, p0, Lcom/bef/effectsdk/view/BEFView;->mNativeInited:Z

    .line 2
    .line 3
    return p0
.end method

.method public declared-synchronized nativeOnMsgReceived(JJJLjava/lang/String;)I
    .locals 10
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/bef/effectsdk/view/BEFView;->mListeners:Ljava/util/HashSet;

    .line 3
    .line 4
    invoke-virtual {v0}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    move-object v2, v1

    .line 19
    check-cast v2, Lcom/bef/effectsdk/view/BEFView$MessageListener;

    .line 20
    .line 21
    move-wide v3, p1

    .line 22
    move-wide v5, p3

    .line 23
    move-wide v7, p5

    .line 24
    move-object/from16 v9, p7

    .line 25
    .line 26
    invoke-interface/range {v2 .. v9}, Lcom/bef/effectsdk/view/BEFView$MessageListener;->onMessageReceived(JJJLjava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :catchall_0
    move-exception v0

    .line 31
    move-object p1, v0

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    monitor-exit p0

    .line 34
    const/4 p0, 0x0

    .line 35
    return p0

    .line 36
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 37
    throw p1
.end method

.method public onDestroy()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/bef/effectsdk/view/BEFView;->mDestroyed:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const-string p0, "BEFView"

    .line 6
    .line 7
    const-string v0, "onDestroy Duplicate!"

    .line 8
    .line 9
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    new-instance v0, Lcom/bef/effectsdk/view/BEFView$8;

    .line 14
    .line 15
    invoke-direct {v0, p0}, Lcom/bef/effectsdk/view/BEFView$8;-><init>(Lcom/bef/effectsdk/view/BEFView;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, v0}, Lcom/bef/effectsdk/GLTextureView;->queueEvent(Ljava/lang/Runnable;)V

    .line 19
    .line 20
    .line 21
    invoke-super {p0}, Lcom/bef/effectsdk/GLTextureView;->onDestroy()V

    .line 22
    .line 23
    .line 24
    const/4 v0, 0x1

    .line 25
    iput-boolean v0, p0, Lcom/bef/effectsdk/view/BEFView;->mDestroyed:Z

    .line 26
    .line 27
    return-void
.end method

.method public onDrawFrame(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/bef/effectsdk/view/BEFView;->getNativeInited()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    const v1, 0x8d40

    .line 11
    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-static {v1, v2}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 15
    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    invoke-static {v1, v1, v1, v1}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 19
    .line 20
    .line 21
    const/16 v3, 0x4000

    .line 22
    .line 23
    invoke-static {v3}, Landroid/opengl/GLES20;->glClear(I)V

    .line 24
    .line 25
    .line 26
    iget-wide v3, v0, Lcom/bef/effectsdk/view/BEFView;->mAttachedEffect:J

    .line 27
    .line 28
    iget-wide v5, v0, Lcom/bef/effectsdk/view/BEFView;->mLastAttachedEffect:J

    .line 29
    .line 30
    cmp-long v5, v3, v5

    .line 31
    .line 32
    if-eqz v5, :cond_1

    .line 33
    .line 34
    iget-wide v5, v0, Lcom/bef/effectsdk/view/BEFView;->mHandle:J

    .line 35
    .line 36
    invoke-static {v5, v6, v3, v4}, Lcom/bef/effectsdk/view/ViewControllerInterface;->attachEffect(JJ)I

    .line 37
    .line 38
    .line 39
    iget-wide v3, v0, Lcom/bef/effectsdk/view/BEFView;->mAttachedEffect:J

    .line 40
    .line 41
    iput-wide v3, v0, Lcom/bef/effectsdk/view/BEFView;->mLastAttachedEffect:J

    .line 42
    .line 43
    :cond_1
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 44
    .line 45
    .line 46
    move-result-wide v3

    .line 47
    iget-wide v5, v0, Lcom/bef/effectsdk/view/BEFView;->mLastTickInNanoSeconds:J

    .line 48
    .line 49
    sub-long/2addr v3, v5

    .line 50
    iget-object v5, v0, Lcom/bef/effectsdk/view/BEFView;->mParams:Lcom/bef/effectsdk/view/BEFView$Builder$Params;

    .line 51
    .line 52
    invoke-static {v5}, Lcom/bef/effectsdk/view/BEFView$Builder$Params;->access$300(Lcom/bef/effectsdk/view/BEFView$Builder$Params;)D

    .line 53
    .line 54
    .line 55
    move-result-wide v5

    .line 56
    const-wide/high16 v7, 0x3ff0000000000000L    # 1.0

    .line 57
    .line 58
    div-double v5, v7, v5

    .line 59
    .line 60
    const-wide v9, 0x41cdcd6500000000L    # 1.0E9

    .line 61
    .line 62
    .line 63
    .line 64
    .line 65
    mul-double/2addr v5, v9

    .line 66
    long-to-double v3, v3

    .line 67
    cmpg-double v11, v3, v5

    .line 68
    .line 69
    if-gez v11, :cond_2

    .line 70
    .line 71
    sub-double/2addr v5, v3

    .line 72
    mul-double/2addr v5, v7

    .line 73
    const-wide v3, 0x412e848000000000L    # 1000000.0

    .line 74
    .line 75
    .line 76
    .line 77
    .line 78
    div-double/2addr v5, v3

    .line 79
    double-to-long v3, v5

    .line 80
    :try_start_0
    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 81
    .line 82
    .line 83
    :catch_0
    :cond_2
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 84
    .line 85
    .line 86
    move-result-wide v3

    .line 87
    iput-wide v3, v0, Lcom/bef/effectsdk/view/BEFView;->mLastTickInNanoSeconds:J

    .line 88
    .line 89
    :goto_0
    iget-object v3, v0, Lcom/bef/effectsdk/view/BEFView;->mCacheMessages:Ljava/util/Queue;

    .line 90
    .line 91
    invoke-interface {v3}, Ljava/util/Collection;->isEmpty()Z

    .line 92
    .line 93
    .line 94
    move-result v3

    .line 95
    if-nez v3, :cond_3

    .line 96
    .line 97
    iget-object v3, v0, Lcom/bef/effectsdk/view/BEFView;->mCacheMessages:Ljava/util/Queue;

    .line 98
    .line 99
    invoke-interface {v3}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    move-result-object v3

    .line 103
    check-cast v3, Ljava/lang/Runnable;

    .line 104
    .line 105
    invoke-interface {v3}, Ljava/lang/Runnable;->run()V

    .line 106
    .line 107
    .line 108
    goto :goto_0

    .line 109
    :cond_3
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 110
    .line 111
    .line 112
    move-result-wide v3

    .line 113
    long-to-double v3, v3

    .line 114
    div-double v18, v3, v9

    .line 115
    .line 116
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 117
    .line 118
    .line 119
    move-result v3

    .line 120
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 121
    .line 122
    .line 123
    move-result v4

    .line 124
    iget-object v5, v0, Lcom/bef/effectsdk/view/BEFView;->mMatrix:[F

    .line 125
    .line 126
    invoke-static {v5, v2}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    .line 127
    .line 128
    .line 129
    new-instance v5, Landroid/graphics/RectF;

    .line 130
    .line 131
    iget-object v6, v0, Lcom/bef/effectsdk/view/BEFView;->mParams:Lcom/bef/effectsdk/view/BEFView$Builder$Params;

    .line 132
    .line 133
    invoke-static {v6}, Lcom/bef/effectsdk/view/BEFView$Builder$Params;->access$100(Lcom/bef/effectsdk/view/BEFView$Builder$Params;)I

    .line 134
    .line 135
    .line 136
    move-result v6

    .line 137
    int-to-float v6, v6

    .line 138
    iget-object v7, v0, Lcom/bef/effectsdk/view/BEFView;->mParams:Lcom/bef/effectsdk/view/BEFView$Builder$Params;

    .line 139
    .line 140
    invoke-static {v7}, Lcom/bef/effectsdk/view/BEFView$Builder$Params;->access$200(Lcom/bef/effectsdk/view/BEFView$Builder$Params;)I

    .line 141
    .line 142
    .line 143
    move-result v7

    .line 144
    int-to-float v7, v7

    .line 145
    invoke-direct {v5, v1, v1, v6, v7}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 146
    .line 147
    .line 148
    new-instance v6, Landroid/graphics/RectF;

    .line 149
    .line 150
    int-to-float v7, v3

    .line 151
    int-to-float v4, v4

    .line 152
    invoke-direct {v6, v1, v1, v7, v4}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 153
    .line 154
    .line 155
    new-instance v4, Landroid/graphics/PointF;

    .line 156
    .line 157
    invoke-direct {v4, v1, v1}, Landroid/graphics/PointF;-><init>(FF)V

    .line 158
    .line 159
    .line 160
    iget-object v8, v0, Lcom/bef/effectsdk/view/BEFView;->mParams:Lcom/bef/effectsdk/view/BEFView$Builder$Params;

    .line 161
    .line 162
    invoke-static {v8}, Lcom/bef/effectsdk/view/BEFView$Builder$Params;->access$400(Lcom/bef/effectsdk/view/BEFView$Builder$Params;)Lcom/bef/effectsdk/view/BEFView$FitMode;

    .line 163
    .line 164
    .line 165
    move-result-object v8

    .line 166
    invoke-direct {v0, v4, v5, v6, v8}, Lcom/bef/effectsdk/view/BEFView;->fitResolution(Landroid/graphics/PointF;Landroid/graphics/RectF;Landroid/graphics/RectF;Lcom/bef/effectsdk/view/BEFView$FitMode;)Landroid/graphics/PointF;

    .line 167
    .line 168
    .line 169
    move-result-object v4

    .line 170
    new-instance v8, Landroid/graphics/PointF;

    .line 171
    .line 172
    iget-object v9, v0, Lcom/bef/effectsdk/view/BEFView;->mParams:Lcom/bef/effectsdk/view/BEFView$Builder$Params;

    .line 173
    .line 174
    invoke-static {v9}, Lcom/bef/effectsdk/view/BEFView$Builder$Params;->access$100(Lcom/bef/effectsdk/view/BEFView$Builder$Params;)I

    .line 175
    .line 176
    .line 177
    move-result v9

    .line 178
    int-to-float v9, v9

    .line 179
    iget-object v10, v0, Lcom/bef/effectsdk/view/BEFView;->mParams:Lcom/bef/effectsdk/view/BEFView$Builder$Params;

    .line 180
    .line 181
    invoke-static {v10}, Lcom/bef/effectsdk/view/BEFView$Builder$Params;->access$200(Lcom/bef/effectsdk/view/BEFView$Builder$Params;)I

    .line 182
    .line 183
    .line 184
    move-result v10

    .line 185
    int-to-float v10, v10

    .line 186
    invoke-direct {v8, v9, v10}, Landroid/graphics/PointF;-><init>(FF)V

    .line 187
    .line 188
    .line 189
    iget-object v9, v0, Lcom/bef/effectsdk/view/BEFView;->mParams:Lcom/bef/effectsdk/view/BEFView$Builder$Params;

    .line 190
    .line 191
    invoke-static {v9}, Lcom/bef/effectsdk/view/BEFView$Builder$Params;->access$400(Lcom/bef/effectsdk/view/BEFView$Builder$Params;)Lcom/bef/effectsdk/view/BEFView$FitMode;

    .line 192
    .line 193
    .line 194
    move-result-object v9

    .line 195
    invoke-direct {v0, v8, v5, v6, v9}, Lcom/bef/effectsdk/view/BEFView;->fitResolution(Landroid/graphics/PointF;Landroid/graphics/RectF;Landroid/graphics/RectF;Lcom/bef/effectsdk/view/BEFView$FitMode;)Landroid/graphics/PointF;

    .line 196
    .line 197
    .line 198
    move-result-object v5

    .line 199
    iget-object v6, v0, Lcom/bef/effectsdk/view/BEFView;->mParams:Lcom/bef/effectsdk/view/BEFView$Builder$Params;

    .line 200
    .line 201
    invoke-static {v6}, Lcom/bef/effectsdk/view/BEFView$Builder$Params;->access$400(Lcom/bef/effectsdk/view/BEFView$Builder$Params;)Lcom/bef/effectsdk/view/BEFView$FitMode;

    .line 202
    .line 203
    .line 204
    move-result-object v6

    .line 205
    sget-object v8, Lcom/bef/effectsdk/view/BEFView$FitMode;->FIT_WIDTH_BOTTOM:Lcom/bef/effectsdk/view/BEFView$FitMode;

    .line 206
    .line 207
    if-ne v6, v8, :cond_4

    .line 208
    .line 209
    new-instance v4, Landroid/graphics/PointF;

    .line 210
    .line 211
    invoke-direct {v4, v1, v1}, Landroid/graphics/PointF;-><init>(FF)V

    .line 212
    .line 213
    .line 214
    new-instance v5, Landroid/graphics/PointF;

    .line 215
    .line 216
    iget-object v1, v0, Lcom/bef/effectsdk/view/BEFView;->mParams:Lcom/bef/effectsdk/view/BEFView$Builder$Params;

    .line 217
    .line 218
    invoke-static {v1}, Lcom/bef/effectsdk/view/BEFView$Builder$Params;->access$200(Lcom/bef/effectsdk/view/BEFView$Builder$Params;)I

    .line 219
    .line 220
    .line 221
    move-result v1

    .line 222
    mul-int/2addr v1, v3

    .line 223
    iget-object v3, v0, Lcom/bef/effectsdk/view/BEFView;->mParams:Lcom/bef/effectsdk/view/BEFView$Builder$Params;

    .line 224
    .line 225
    invoke-static {v3}, Lcom/bef/effectsdk/view/BEFView$Builder$Params;->access$100(Lcom/bef/effectsdk/view/BEFView$Builder$Params;)I

    .line 226
    .line 227
    .line 228
    move-result v3

    .line 229
    div-int/2addr v1, v3

    .line 230
    int-to-float v1, v1

    .line 231
    invoke-direct {v5, v7, v1}, Landroid/graphics/PointF;-><init>(FF)V

    .line 232
    .line 233
    .line 234
    :cond_4
    iget v1, v4, Landroid/graphics/PointF;->x:F

    .line 235
    .line 236
    iget v3, v4, Landroid/graphics/PointF;->y:F

    .line 237
    .line 238
    iget v4, v5, Landroid/graphics/PointF;->x:F

    .line 239
    .line 240
    sub-float/2addr v4, v1

    .line 241
    iget v5, v5, Landroid/graphics/PointF;->y:F

    .line 242
    .line 243
    sub-float/2addr v5, v3

    .line 244
    const/4 v6, 0x4

    .line 245
    new-array v6, v6, [F

    .line 246
    .line 247
    aput v1, v6, v2

    .line 248
    .line 249
    const/4 v1, 0x1

    .line 250
    aput v3, v6, v1

    .line 251
    .line 252
    const/4 v1, 0x2

    .line 253
    aput v4, v6, v1

    .line 254
    .line 255
    const/4 v1, 0x3

    .line 256
    aput v5, v6, v1

    .line 257
    .line 258
    iget-wide v11, v0, Lcom/bef/effectsdk/view/BEFView;->mHandle:J

    .line 259
    .line 260
    iget v13, v0, Lcom/bef/effectsdk/view/BEFView;->mSourceTexture:I

    .line 261
    .line 262
    iget-object v1, v0, Lcom/bef/effectsdk/view/BEFView;->mParams:Lcom/bef/effectsdk/view/BEFView$Builder$Params;

    .line 263
    .line 264
    invoke-static {v1}, Lcom/bef/effectsdk/view/BEFView$Builder$Params;->access$100(Lcom/bef/effectsdk/view/BEFView$Builder$Params;)I

    .line 265
    .line 266
    .line 267
    move-result v14

    .line 268
    iget-object v1, v0, Lcom/bef/effectsdk/view/BEFView;->mParams:Lcom/bef/effectsdk/view/BEFView$Builder$Params;

    .line 269
    .line 270
    invoke-static {v1}, Lcom/bef/effectsdk/view/BEFView$Builder$Params;->access$200(Lcom/bef/effectsdk/view/BEFView$Builder$Params;)I

    .line 271
    .line 272
    .line 273
    move-result v15

    .line 274
    iget-object v0, v0, Lcom/bef/effectsdk/view/BEFView;->mMatrix:[F

    .line 275
    .line 276
    move-object/from16 v16, v0

    .line 277
    .line 278
    move-object/from16 v17, v6

    .line 279
    .line 280
    invoke-static/range {v11 .. v19}, Lcom/bef/effectsdk/view/ViewControllerInterface;->processFrame(JIII[F[FD)I

    .line 281
    .line 282
    .line 283
    return-void
.end method

.method public onExitContext()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/bef/effectsdk/view/BEFView;->destoryRender()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onMessageReceived(IIILjava/lang/String;)V
    .locals 8

    .line 1
    int-to-long v1, p1

    .line 2
    int-to-long v3, p2

    .line 3
    int-to-long v5, p3

    .line 4
    move-object v0, p0

    .line 5
    move-object v7, p4

    .line 6
    invoke-virtual/range {v0 .. v7}, Lcom/bef/effectsdk/view/BEFView;->postMessage(JJJLjava/lang/String;)I

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onPause()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/bef/effectsdk/view/BEFView;->mDestroyed:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const-string p0, "BEFView"

    .line 6
    .line 7
    const-string v0, "onPause called after onDestroy!"

    .line 8
    .line 9
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    new-instance v0, Lcom/bef/effectsdk/view/BEFView$6;

    .line 14
    .line 15
    invoke-direct {v0, p0}, Lcom/bef/effectsdk/view/BEFView$6;-><init>(Lcom/bef/effectsdk/view/BEFView;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, v0}, Lcom/bef/effectsdk/GLTextureView;->queueEvent(Ljava/lang/Runnable;)V

    .line 19
    .line 20
    .line 21
    invoke-super {p0}, Lcom/bef/effectsdk/GLTextureView;->onPause()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public onResume()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/bef/effectsdk/view/BEFView;->mDestroyed:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const-string p0, "BEFView"

    .line 6
    .line 7
    const-string v0, "onResume called after onDestroy!"

    .line 8
    .line 9
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-super {p0}, Lcom/bef/effectsdk/GLTextureView;->onResume()V

    .line 14
    .line 15
    .line 16
    new-instance v0, Lcom/bef/effectsdk/view/BEFView$7;

    .line 17
    .line 18
    invoke-direct {v0, p0}, Lcom/bef/effectsdk/view/BEFView$7;-><init>(Lcom/bef/effectsdk/view/BEFView;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, v0}, Lcom/bef/effectsdk/GLTextureView;->queueEvent(Ljava/lang/Runnable;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public onSurfaceChanged(Ljavax/microedition/khronos/opengles/GL10;II)V
    .locals 0

    return-void
.end method

.method public onSurfaceCreated(Ljavax/microedition/khronos/opengles/GL10;Ljavax/microedition/khronos/egl/EGLConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/bef/effectsdk/view/BEFView;->initRender()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/bef/effectsdk/view/BEFView;->getNativeInited()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Lcom/bef/effectsdk/view/BEFView;->mAdBundlePath:Ljava/lang/String;

    .line 8
    .line 9
    const-string v1, ""

    .line 10
    .line 11
    if-eq v0, v1, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, Lcom/bef/effectsdk/view/BEFView;->mParams:Lcom/bef/effectsdk/view/BEFView$Builder$Params;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/bef/effectsdk/view/BEFView$Builder$Params;->access$700(Lcom/bef/effectsdk/view/BEFView$Builder$Params;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const/4 v1, 0x1

    .line 20
    if-ne v0, v1, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    invoke-direct {p0, p1}, Lcom/bef/effectsdk/view/BEFView;->dealWithTouches(Landroid/view/MotionEvent;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    check-cast p0, Landroid/view/ViewGroup;

    .line 31
    .line 32
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->requestDisallowInterceptTouchEvent(Z)V

    .line 33
    .line 34
    .line 35
    return v1

    .line 36
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 37
    return p0
.end method

.method public declared-synchronized postMessage(JJJLjava/lang/String;)I
    .locals 9
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    new-instance v0, Lcom/bef/effectsdk/view/BEFView$2;

    .line 3
    .line 4
    move-object v1, p0

    .line 5
    move-wide v2, p1

    .line 6
    move-wide v4, p3

    .line 7
    move-wide v6, p5

    .line 8
    move-object/from16 v8, p7

    .line 9
    .line 10
    invoke-direct/range {v0 .. v8}, Lcom/bef/effectsdk/view/BEFView$2;-><init>(Lcom/bef/effectsdk/view/BEFView;JJJLjava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, v0}, Lcom/bef/effectsdk/GLTextureView;->queueEvent(Ljava/lang/Runnable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 14
    .line 15
    .line 16
    monitor-exit p0

    .line 17
    const/4 p0, 0x0

    .line 18
    return p0

    .line 19
    :catchall_0
    move-exception v0

    .line 20
    move-object p1, v0

    .line 21
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 22
    throw p1
.end method

.method public declared-synchronized removeMessageListener(Lcom/bef/effectsdk/view/BEFView$MessageListener;)I
    .locals 1
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    monitor-exit p0

    .line 5
    const/4 p0, -0x1

    .line 6
    return p0

    .line 7
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/bef/effectsdk/view/BEFView;->mListeners:Ljava/util/HashSet;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    .line 11
    .line 12
    monitor-exit p0

    .line 13
    const/4 p0, 0x0

    .line 14
    return p0

    .line 15
    :catchall_0
    move-exception p1

    .line 16
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 17
    throw p1
.end method

.method public declared-synchronized setExternalTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-virtual {p0}, Lcom/bef/effectsdk/view/BEFView;->getNativeInited()Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    iget-object v0, p0, Lcom/bef/effectsdk/view/BEFView;->mAdBundlePath:Ljava/lang/String;

    .line 9
    .line 10
    const-string v1, ""

    .line 11
    .line 12
    if-ne v0, v1, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    invoke-direct {p0, p1}, Lcom/bef/effectsdk/view/BEFView;->dealWithTouches(Landroid/view/MotionEvent;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 16
    .line 17
    .line 18
    monitor-exit p0

    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :catchall_0
    move-exception p1

    .line 22
    goto :goto_1

    .line 23
    :cond_1
    :goto_0
    monitor-exit p0

    .line 24
    const/4 p0, 0x0

    .line 25
    return p0

    .line 26
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 27
    throw p1
.end method

.method public setNativeInited(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/bef/effectsdk/view/BEFView;->mNativeInited:Z

    .line 2
    .line 3
    return-void
.end method

.method public declared-synchronized setRenderCacheData(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    new-instance v0, Lcom/bef/effectsdk/view/BEFView$9;

    .line 3
    .line 4
    invoke-direct {v0, p0, p1, p2}, Lcom/bef/effectsdk/view/BEFView$9;-><init>(Lcom/bef/effectsdk/view/BEFView;Ljava/lang/String;Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, v0}, Lcom/bef/effectsdk/GLTextureView;->queueEvent(Ljava/lang/Runnable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    .line 9
    .line 10
    monitor-exit p0

    .line 11
    return-void

    .line 12
    :catchall_0
    move-exception p1

    .line 13
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 14
    throw p1
.end method

.method public declared-synchronized setRenderCacheTexture(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    new-instance v0, Lcom/bef/effectsdk/view/BEFView$10;

    .line 3
    .line 4
    invoke-direct {v0, p0, p1, p2}, Lcom/bef/effectsdk/view/BEFView$10;-><init>(Lcom/bef/effectsdk/view/BEFView;Ljava/lang/String;Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, v0}, Lcom/bef/effectsdk/GLTextureView;->queueEvent(Ljava/lang/Runnable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    .line 9
    .line 10
    monitor-exit p0

    .line 11
    return-void

    .line 12
    :catchall_0
    move-exception p1

    .line 13
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 14
    throw p1
.end method

.method public declared-synchronized setRenderCacheTextureWithBuffer(Ljava/lang/String;[BII)V
    .locals 6
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    new-instance v0, Lcom/bef/effectsdk/view/BEFView$11;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 3
    .line 4
    move-object v1, p0

    .line 5
    move-object v2, p1

    .line 6
    move-object v3, p2

    .line 7
    move v4, p3

    .line 8
    move v5, p4

    .line 9
    :try_start_1
    invoke-direct/range {v0 .. v5}, Lcom/bef/effectsdk/view/BEFView$11;-><init>(Lcom/bef/effectsdk/view/BEFView;Ljava/lang/String;[BII)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v1, v0}, Lcom/bef/effectsdk/GLTextureView;->queueEvent(Ljava/lang/Runnable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 13
    .line 14
    .line 15
    monitor-exit v1

    .line 16
    return-void

    .line 17
    :catchall_0
    move-exception v0

    .line 18
    :goto_0
    move-object p0, v0

    .line 19
    goto :goto_1

    .line 20
    :catchall_1
    move-exception v0

    .line 21
    move-object v1, p0

    .line 22
    goto :goto_0

    .line 23
    :goto_1
    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 24
    throw p0
.end method

.method public declared-synchronized setStickerPath(Ljava/lang/String;)V
    .locals 1
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    new-instance v0, Lcom/bef/effectsdk/view/BEFView$1;

    .line 3
    .line 4
    invoke-direct {v0, p0, p1}, Lcom/bef/effectsdk/view/BEFView$1;-><init>(Lcom/bef/effectsdk/view/BEFView;Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, v0}, Lcom/bef/effectsdk/GLTextureView;->queueEvent(Ljava/lang/Runnable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    .line 9
    .line 10
    monitor-exit p0

    .line 11
    return-void

    .line 12
    :catchall_0
    move-exception p1

    .line 13
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 14
    throw p1
.end method
