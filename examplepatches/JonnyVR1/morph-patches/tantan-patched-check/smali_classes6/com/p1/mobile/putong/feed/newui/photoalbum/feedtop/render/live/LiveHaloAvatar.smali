.class public final Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;
.super Landroid/view/View;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000V\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0008\n\u0002\u0018\u0002\n\u0002\u0008\u0008\n\u0002\u0010\u0007\n\u0002\u0008\u0010\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0008\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0018\u0000 D2\u00020\u0001:\u0001\u001aB\u0017\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u001d\u0010\u000c\u001a\u00020\u000b2\u0006\u0010\t\u001a\u00020\u00082\u0006\u0010\n\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\u000c\u0010\rJ\u000f\u0010\u000e\u001a\u00020\u000bH\u0014\u00a2\u0006\u0004\u0008\u000e\u0010\u000fJ\u000f\u0010\u0010\u001a\u00020\u000bH\u0014\u00a2\u0006\u0004\u0008\u0010\u0010\u000fJ\u001f\u0010\u0013\u001a\u00020\u000b2\u0006\u0010\u0011\u001a\u00020\u00082\u0006\u0010\u0012\u001a\u00020\u0008H\u0014\u00a2\u0006\u0004\u0008\u0013\u0010\rJ\u0017\u0010\u0016\u001a\u00020\u000b2\u0006\u0010\u0015\u001a\u00020\u0014H\u0014\u00a2\u0006\u0004\u0008\u0016\u0010\u0017J\r\u0010\u0018\u001a\u00020\u000b\u00a2\u0006\u0004\u0008\u0018\u0010\u000fJ\r\u0010\u0019\u001a\u00020\u000b\u00a2\u0006\u0004\u0008\u0019\u0010\u000fR\u0014\u0010\u001c\u001a\u00020\u00088\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u001a\u0010\u001bR\u0014\u0010 \u001a\u00020\u001d8\u0002X\u0082D\u00a2\u0006\u0006\n\u0004\u0008\u001e\u0010\u001fR\u0014\u0010!\u001a\u00020\u001d8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u000c\u0010\u001fR\u0014\u0010\"\u001a\u00020\u001d8\u0002X\u0082D\u00a2\u0006\u0006\n\u0004\u0008\u0018\u0010\u001fR\u0014\u0010#\u001a\u00020\u001d8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0019\u0010\u001fR\u0016\u0010%\u001a\u00020\u00088\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008$\u0010\u001bR\u0016\u0010\'\u001a\u00020\u00088\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008&\u0010\u001bR\u0017\u0010+\u001a\u00020\u00088\u0006\u00a2\u0006\u000c\n\u0004\u0008(\u0010\u001b\u001a\u0004\u0008)\u0010*R\u0016\u0010-\u001a\u00020\u001d8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008,\u0010\u001fR\u001c\u00102\u001a\n /*\u0004\u0018\u00010.0.8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u00080\u00101R\u0014\u00106\u001a\u0002038\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u00084\u00105R.\u0010?\u001a\u0004\u0018\u0001072\u0008\u00108\u001a\u0004\u0018\u0001078\u0006@FX\u0086\u000e\u00a2\u0006\u0012\n\u0004\u00089\u0010:\u001a\u0004\u0008;\u0010<\"\u0004\u0008=\u0010>R\u0014\u0010C\u001a\u00020@8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008A\u0010B\u00a8\u0006E"
    }
    d2 = {
        "Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;",
        "Landroid/view/View;",
        "Landroid/content/Context;",
        "context",
        "Landroid/util/AttributeSet;",
        "attrs",
        "<init>",
        "(Landroid/content/Context;Landroid/util/AttributeSet;)V",
        "",
        "startColor",
        "endColor",
        "",
        "c",
        "(II)V",
        "onAttachedToWindow",
        "()V",
        "onDetachedFromWindow",
        "widthMeasureSpec",
        "heightMeasureSpec",
        "onMeasure",
        "Landroid/graphics/Canvas;",
        "canvas",
        "onDraw",
        "(Landroid/graphics/Canvas;)V",
        "d",
        "e",
        "a",
        "I",
        "haloSize",
        "",
        "b",
        "F",
        "innerStrokeWidth",
        "innerHaloRadius",
        "outerStrokeWidth",
        "outerHaloRadius",
        "f",
        "haloStartColor",
        "g",
        "haloEndColor",
        "h",
        "getAvatarSize",
        "()I",
        "avatarSize",
        "i",
        "animatedFraction",
        "Landroid/animation/ValueAnimator;",
        "kotlin.jvm.PlatformType",
        "j",
        "Landroid/animation/ValueAnimator;",
        "animator",
        "Landroid/graphics/Paint;",
        "k",
        "Landroid/graphics/Paint;",
        "paint",
        "Landroid/graphics/Bitmap;",
        "value",
        "l",
        "Landroid/graphics/Bitmap;",
        "getAvatar",
        "()Landroid/graphics/Bitmap;",
        "setAvatar",
        "(Landroid/graphics/Bitmap;)V",
        "avatar",
        "Landroid/graphics/Matrix;",
        "m",
        "Landroid/graphics/Matrix;",
        "bitmapMatrix",
        "Companion",
        "b_feed_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# static fields
.field public static final Companion:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar$a;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public final a:I

.field public final b:F

.field public final c:F

.field public final d:F

.field public final e:F

.field public f:I

.field public g:I

.field public final h:I

.field public i:F

.field public final j:Landroid/animation/ValueAnimator;

.field public final k:Landroid/graphics/Paint;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public l:Landroid/graphics/Bitmap;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public final m:Landroid/graphics/Matrix;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar$a;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->Companion:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar$a;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 9
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 8
    .line 9
    .line 10
    sget v0, Ll/qa00;->d:I

    .line 11
    .line 12
    int-to-float v0, v0

    .line 13
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->b:F

    .line 14
    .line 15
    sget v1, Ll/qa00;->c:I

    .line 16
    .line 17
    int-to-float v1, v1

    .line 18
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->d:F

    .line 19
    .line 20
    const/4 v2, 0x2

    .line 21
    new-array v2, v2, [F

    .line 22
    .line 23
    fill-array-data v2, :array_0

    .line 24
    .line 25
    .line 26
    invoke-static {v2}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    const-wide/16 v3, 0x5dc

    .line 31
    .line 32
    invoke-virtual {v2, v3, v4}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 33
    .line 34
    .line 35
    const/4 v3, -0x1

    .line 36
    invoke-virtual {v2, v3}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 37
    .line 38
    .line 39
    new-instance v3, Ll/eus;

    .line 40
    .line 41
    invoke-direct {v3, p0, v2}, Ll/eus;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;Landroid/animation/ValueAnimator;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v2, v3}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 45
    .line 46
    .line 47
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->j:Landroid/animation/ValueAnimator;

    .line 48
    .line 49
    sget-object v2, Ll/shc0;->v:[I

    .line 50
    .line 51
    invoke-virtual {p1, p2, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    sget p2, Ll/shc0;->y:I

    .line 56
    .line 57
    const/4 v2, 0x0

    .line 58
    invoke-virtual {p1, p2, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 59
    .line 60
    .line 61
    move-result p2

    .line 62
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->a:I

    .line 63
    .line 64
    sget v3, Ll/shc0;->w:I

    .line 65
    .line 66
    invoke-virtual {p1, v3, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    iput v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->h:I

    .line 71
    .line 72
    sget v2, Ll/shc0;->z:I

    .line 73
    .line 74
    const v3, -0x9655

    .line 75
    .line 76
    .line 77
    invoke-virtual {p1, v2, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 78
    .line 79
    .line 80
    move-result v2

    .line 81
    iput v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->f:I

    .line 82
    .line 83
    sget v2, Ll/shc0;->x:I

    .line 84
    .line 85
    const v3, -0xa116

    .line 86
    .line 87
    .line 88
    invoke-virtual {p1, v2, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 89
    .line 90
    .line 91
    move-result v2

    .line 92
    iput v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->g:I

    .line 93
    .line 94
    int-to-float v2, p2

    .line 95
    sub-float/2addr v2, v0

    .line 96
    const/high16 v0, 0x40000000    # 2.0f

    .line 97
    .line 98
    div-float/2addr v2, v0

    .line 99
    iput v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->c:F

    .line 100
    .line 101
    int-to-float v2, p2

    .line 102
    sub-float/2addr v2, v1

    .line 103
    div-float/2addr v2, v0

    .line 104
    iput v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->e:F

    .line 105
    .line 106
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 107
    .line 108
    .line 109
    new-instance p1, Landroid/graphics/Paint;

    .line 110
    .line 111
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 112
    .line 113
    .line 114
    sget-object v0, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 115
    .line 116
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 117
    .line 118
    .line 119
    const/4 v0, 0x1

    .line 120
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 121
    .line 122
    .line 123
    new-instance v1, Landroid/graphics/LinearGradient;

    .line 124
    .line 125
    int-to-float v4, p2

    .line 126
    iget v6, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->f:I

    .line 127
    .line 128
    iget v7, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->g:I

    .line 129
    .line 130
    sget-object v8, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    .line 131
    .line 132
    const/4 v2, 0x0

    .line 133
    const/4 v3, 0x0

    .line 134
    const/4 v5, 0x0

    .line 135
    invoke-direct/range {v1 .. v8}, Landroid/graphics/LinearGradient;-><init>(FFFFIILandroid/graphics/Shader$TileMode;)V

    .line 136
    .line 137
    .line 138
    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 139
    .line 140
    .line 141
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->k:Landroid/graphics/Paint;

    .line 142
    .line 143
    new-instance p1, Landroid/graphics/Matrix;

    .line 144
    .line 145
    invoke-direct {p1}, Landroid/graphics/Matrix;-><init>()V

    .line 146
    .line 147
    .line 148
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->m:Landroid/graphics/Matrix;

    .line 149
    .line 150
    return-void

    .line 151
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;Landroid/animation/ValueAnimator;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->b(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;Landroid/animation/ValueAnimator;Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static final b(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;Landroid/animation/ValueAnimator;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->i:F

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 11
    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final c(II)V
    .locals 8

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->f:I

    .line 2
    .line 3
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->g:I

    .line 4
    .line 5
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->k:Landroid/graphics/Paint;

    .line 6
    .line 7
    new-instance v0, Landroid/graphics/LinearGradient;

    .line 8
    .line 9
    iget p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->a:I

    .line 10
    .line 11
    int-to-float v3, p2

    .line 12
    iget v5, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->f:I

    .line 13
    .line 14
    iget v6, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->g:I

    .line 15
    .line 16
    sget-object v7, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    const/4 v2, 0x0

    .line 20
    const/4 v4, 0x0

    .line 21
    invoke-direct/range {v0 .. v7}, Landroid/graphics/LinearGradient;-><init>(FFFFIILandroid/graphics/Shader$TileMode;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final d()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->e()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->j:Landroid/animation/ValueAnimator;

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final e()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->j:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->j:Landroid/animation/ValueAnimator;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final getAvatar()Landroid/graphics/Bitmap;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->l:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getAvatarSize()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->h:I

    .line 2
    .line 3
    return p0
.end method

.method public onAttachedToWindow()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    instance-of v1, v0, Landroid/view/ViewGroup;

    .line 9
    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    check-cast v0, Landroid/view/ViewGroup;

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 v0, 0x0

    .line 16
    :goto_0
    if-eqz v0, :cond_1

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 20
    .line 21
    .line 22
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->d()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->j:Landroid/animation/ValueAnimator;

    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/animation/Animator;->removeAllListeners()V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->j:Landroid/animation/ValueAnimator;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 9
    .param p1    # Landroid/graphics/Canvas;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->k:Landroid/graphics/Paint;

    .line 5
    .line 6
    const/16 v1, 0xff

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->k:Landroid/graphics/Paint;

    .line 12
    .line 13
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->b:F

    .line 14
    .line 15
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 16
    .line 17
    .line 18
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->a:I

    .line 19
    .line 20
    int-to-float v2, v0

    .line 21
    const/high16 v3, 0x40000000    # 2.0f

    .line 22
    .line 23
    div-float/2addr v2, v3

    .line 24
    int-to-float v0, v0

    .line 25
    div-float/2addr v0, v3

    .line 26
    iget v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->c:F

    .line 27
    .line 28
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->k:Landroid/graphics/Paint;

    .line 29
    .line 30
    invoke-virtual {p1, v2, v0, v4, v5}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->j:Landroid/animation/ValueAnimator;

    .line 34
    .line 35
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    const v2, 0x44bb8000    # 1500.0f

    .line 40
    .line 41
    .line 42
    const/high16 v4, 0x3f800000    # 1.0f

    .line 43
    .line 44
    if-eqz v0, :cond_1

    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->k:Landroid/graphics/Paint;

    .line 47
    .line 48
    iget v5, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->d:F

    .line 49
    .line 50
    invoke-virtual {v0, v5}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 51
    .line 52
    .line 53
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->i:F

    .line 54
    .line 55
    mul-float v5, v0, v2

    .line 56
    .line 57
    const/high16 v6, 0x43fa0000    # 500.0f

    .line 58
    .line 59
    cmpg-float v5, v5, v6

    .line 60
    .line 61
    iget-object v7, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->k:Landroid/graphics/Paint;

    .line 62
    .line 63
    if-gez v5, :cond_0

    .line 64
    .line 65
    const/4 v0, 0x0

    .line 66
    invoke-virtual {v7, v0}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 67
    .line 68
    .line 69
    move v0, v4

    .line 70
    goto :goto_0

    .line 71
    :cond_0
    mul-float/2addr v0, v2

    .line 72
    sub-float/2addr v0, v6

    .line 73
    const/high16 v5, 0x447a0000    # 1000.0f

    .line 74
    .line 75
    div-float/2addr v0, v5

    .line 76
    sub-float v0, v4, v0

    .line 77
    .line 78
    const/high16 v8, 0x437f0000    # 255.0f

    .line 79
    .line 80
    mul-float/2addr v0, v8

    .line 81
    float-to-int v0, v0

    .line 82
    invoke-virtual {v7, v0}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 83
    .line 84
    .line 85
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->i:F

    .line 86
    .line 87
    mul-float/2addr v0, v2

    .line 88
    sub-float/2addr v0, v6

    .line 89
    div-float/2addr v0, v5

    .line 90
    const v5, 0x3e4cccd0    # 0.20000005f

    .line 91
    .line 92
    .line 93
    mul-float/2addr v0, v5

    .line 94
    add-float/2addr v0, v4

    .line 95
    :goto_0
    iget v5, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->a:I

    .line 96
    .line 97
    int-to-float v6, v5

    .line 98
    div-float/2addr v6, v3

    .line 99
    int-to-float v5, v5

    .line 100
    div-float/2addr v5, v3

    .line 101
    iget v7, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->e:F

    .line 102
    .line 103
    mul-float/2addr v7, v0

    .line 104
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->k:Landroid/graphics/Paint;

    .line 105
    .line 106
    invoke-virtual {p1, v6, v5, v7, v0}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 107
    .line 108
    .line 109
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->l:Landroid/graphics/Bitmap;

    .line 110
    .line 111
    if-eqz v0, :cond_4

    .line 112
    .line 113
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->k:Landroid/graphics/Paint;

    .line 114
    .line 115
    invoke-virtual {v5, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 116
    .line 117
    .line 118
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->a:I

    .line 119
    .line 120
    iget v5, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->h:I

    .line 121
    .line 122
    sub-int/2addr v1, v5

    .line 123
    int-to-float v1, v1

    .line 124
    div-float/2addr v1, v3

    .line 125
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->j:Landroid/animation/ValueAnimator;

    .line 126
    .line 127
    invoke-virtual {v3}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 128
    .line 129
    .line 130
    move-result v3

    .line 131
    if-eqz v3, :cond_3

    .line 132
    .line 133
    iget v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->i:F

    .line 134
    .line 135
    mul-float v5, v3, v2

    .line 136
    .line 137
    const v6, 0x44268000    # 666.0f

    .line 138
    .line 139
    .line 140
    cmpg-float v5, v5, v6

    .line 141
    .line 142
    const v7, 0x3dccccd0    # 0.100000024f

    .line 143
    .line 144
    .line 145
    if-gtz v5, :cond_2

    .line 146
    .line 147
    mul-float/2addr v3, v2

    .line 148
    div-float/2addr v3, v6

    .line 149
    mul-float/2addr v3, v7

    .line 150
    add-float/2addr v4, v3

    .line 151
    goto :goto_1

    .line 152
    :cond_2
    mul-float/2addr v3, v2

    .line 153
    sub-float/2addr v3, v6

    .line 154
    const v2, 0x44508000    # 834.0f

    .line 155
    .line 156
    .line 157
    div-float/2addr v3, v2

    .line 158
    mul-float/2addr v3, v7

    .line 159
    const v2, 0x3f8ccccd    # 1.1f

    .line 160
    .line 161
    .line 162
    sub-float v4, v2, v3

    .line 163
    .line 164
    :goto_1
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->m:Landroid/graphics/Matrix;

    .line 165
    .line 166
    invoke-virtual {v2}, Landroid/graphics/Matrix;->reset()V

    .line 167
    .line 168
    .line 169
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->m:Landroid/graphics/Matrix;

    .line 170
    .line 171
    invoke-virtual {v2, v1, v1}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 172
    .line 173
    .line 174
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->m:Landroid/graphics/Matrix;

    .line 175
    .line 176
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->h:I

    .line 177
    .line 178
    div-int/lit8 v3, v2, 0x2

    .line 179
    .line 180
    int-to-float v3, v3

    .line 181
    div-int/lit8 v2, v2, 0x2

    .line 182
    .line 183
    int-to-float v2, v2

    .line 184
    invoke-virtual {v1, v4, v4, v3, v2}, Landroid/graphics/Matrix;->preScale(FFFF)Z

    .line 185
    .line 186
    .line 187
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->m:Landroid/graphics/Matrix;

    .line 188
    .line 189
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->k:Landroid/graphics/Paint;

    .line 190
    .line 191
    invoke-virtual {p1, v0, v1, p0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V

    .line 192
    .line 193
    .line 194
    return-void

    .line 195
    :cond_3
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->m:Landroid/graphics/Matrix;

    .line 196
    .line 197
    invoke-virtual {v2}, Landroid/graphics/Matrix;->reset()V

    .line 198
    .line 199
    .line 200
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->m:Landroid/graphics/Matrix;

    .line 201
    .line 202
    invoke-virtual {v2, v1, v1}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 203
    .line 204
    .line 205
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->m:Landroid/graphics/Matrix;

    .line 206
    .line 207
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->k:Landroid/graphics/Paint;

    .line 208
    .line 209
    invoke-virtual {p1, v0, v1, p0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V

    .line 210
    .line 211
    .line 212
    :cond_4
    return-void
.end method

.method public onMeasure(II)V
    .locals 0

    .line 1
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->a:I

    .line 2
    .line 3
    const/high16 p2, 0x40000000    # 2.0f

    .line 4
    .line 5
    invoke-static {p1, p2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-virtual {p0, p1, p1}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final setAvatar(Landroid/graphics/Bitmap;)V
    .locals 11
    .param p1    # Landroid/graphics/Bitmap;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->h:I

    .line 4
    .line 5
    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 6
    .line 7
    invoke-static {v0, v0, v1}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    new-instance v1, Landroid/graphics/Canvas;

    .line 15
    .line 16
    invoke-direct {v1, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 17
    .line 18
    .line 19
    new-instance v2, Landroid/graphics/Paint;

    .line 20
    .line 21
    invoke-direct {v2}, Landroid/graphics/Paint;-><init>()V

    .line 22
    .line 23
    .line 24
    const/4 v3, 0x1

    .line 25
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 26
    .line 27
    .line 28
    iget v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->h:I

    .line 29
    .line 30
    int-to-float v4, v3

    .line 31
    const/high16 v5, 0x40000000    # 2.0f

    .line 32
    .line 33
    div-float/2addr v4, v5

    .line 34
    int-to-float v6, v3

    .line 35
    div-float/2addr v6, v5

    .line 36
    int-to-float v3, v3

    .line 37
    div-float/2addr v3, v5

    .line 38
    invoke-virtual {v1, v4, v6, v3, v2}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 46
    .line 47
    .line 48
    move-result v4

    .line 49
    iget v5, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->h:I

    .line 50
    .line 51
    mul-int v6, v3, v5

    .line 52
    .line 53
    mul-int v7, v5, v4

    .line 54
    .line 55
    const/high16 v8, 0x3f000000    # 0.5f

    .line 56
    .line 57
    const/high16 v9, 0x3f800000    # 1.0f

    .line 58
    .line 59
    const/4 v10, 0x0

    .line 60
    if-le v6, v7, :cond_0

    .line 61
    .line 62
    int-to-float v6, v5

    .line 63
    mul-float/2addr v6, v9

    .line 64
    int-to-float v4, v4

    .line 65
    div-float/2addr v6, v4

    .line 66
    int-to-float v4, v5

    .line 67
    int-to-float v3, v3

    .line 68
    mul-float/2addr v3, v6

    .line 69
    sub-float/2addr v4, v3

    .line 70
    mul-float/2addr v4, v8

    .line 71
    move v3, v10

    .line 72
    move v10, v4

    .line 73
    goto :goto_0

    .line 74
    :cond_0
    int-to-float v6, v5

    .line 75
    mul-float/2addr v6, v9

    .line 76
    int-to-float v3, v3

    .line 77
    div-float/2addr v6, v3

    .line 78
    int-to-float v3, v5

    .line 79
    int-to-float v4, v4

    .line 80
    mul-float/2addr v4, v6

    .line 81
    sub-float/2addr v3, v4

    .line 82
    mul-float/2addr v3, v8

    .line 83
    :goto_0
    new-instance v4, Landroid/graphics/Matrix;

    .line 84
    .line 85
    invoke-direct {v4}, Landroid/graphics/Matrix;-><init>()V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v4, v6, v6}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {v4, v10, v3}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 92
    .line 93
    .line 94
    new-instance v3, Landroid/graphics/PorterDuffXfermode;

    .line 95
    .line 96
    sget-object v5, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    .line 97
    .line 98
    invoke-direct {v3, v5}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 102
    .line 103
    .line 104
    invoke-virtual {v1, p1, v4, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V

    .line 105
    .line 106
    .line 107
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->l:Landroid/graphics/Bitmap;

    .line 108
    .line 109
    :cond_1
    return-void
.end method
