.class public Lcom/momo/xeengine/svgaplayer/SVGAImageView;
.super Landroid/widget/ImageView;
.source "SourceFile"

# interfaces
.implements Lcom/momo/xeengine/svgaplayer/SVGAParser$ParseCompletion;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/xeengine/svgaplayer/SVGAImageView$FillMode;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u0000r\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0008\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0013\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u0006\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u000b\u0008\u0016\u0018\u00002\u00020\u00012\u00020\u0002:\u0001NB\u0011\u0008\u0016\u0012\u0008\u0010\u0003\u001a\u0004\u0018\u00010\u0004\u00a2\u0006\u0002\u0010\u0005B\u001b\u0008\u0016\u0012\u0008\u0010\u0003\u001a\u0004\u0018\u00010\u0004\u0012\u0008\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u00a2\u0006\u0002\u0010\u0008B#\u0008\u0016\u0012\u0008\u0010\u0003\u001a\u0004\u0018\u00010\u0004\u0012\u0008\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u0012\u0006\u0010\t\u001a\u00020\n\u00a2\u0006\u0002\u0010\u000bB+\u0008\u0016\u0012\u0008\u0010\u0003\u001a\u0004\u0018\u00010\u0004\u0012\u0008\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u0012\u0006\u0010\t\u001a\u00020\n\u0012\u0006\u0010\u000c\u001a\u00020\n\u00a2\u0006\u0002\u0010\rJ\u0006\u00102\u001a\u000203J\u0008\u00104\u001a\u000205H\u0002J\u0010\u00106\u001a\u0002032\u0006\u00107\u001a\u000208H\u0016J\u0008\u00109\u001a\u000203H\u0014J\u0010\u0010:\u001a\u0002032\u0006\u0010;\u001a\u00020<H\u0016J\u0006\u0010=\u001a\u000203J\u0010\u0010>\u001a\u0002032\u0008\u0010\u0019\u001a\u0004\u0018\u00010\u001aJ\u0010\u0010?\u001a\u0002032\u0006\u00107\u001a\u000208H\u0004J\u0018\u0010?\u001a\u0002032\u0006\u00107\u001a\u0002082\u0006\u0010@\u001a\u00020AH\u0004J\u0006\u0010B\u001a\u000203J\u001c\u0010B\u001a\u0002032\u0008\u0010C\u001a\u0004\u0018\u00010D2\u0008\u0008\u0002\u0010E\u001a\u00020\u0011H\u0004J\u0016\u0010F\u001a\u0002032\u0006\u0010G\u001a\u00020\n2\u0006\u0010H\u001a\u00020\u0011J\u0016\u0010I\u001a\u0002032\u0006\u0010J\u001a\u0002052\u0006\u0010H\u001a\u00020\u0011J\u0008\u0010K\u001a\u000203H\u0002J\u0006\u0010L\u001a\u000203J\u000e\u0010L\u001a\u0002032\u0006\u0010M\u001a\u00020\u0011R\u0010\u0010\u000e\u001a\u0004\u0018\u00010\u000fX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u001a\u0010\u0010\u001a\u00020\u0011X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0012\u0010\u0013\"\u0004\u0008\u0014\u0010\u0015R\u001a\u0010\u0016\u001a\u00020\u0011X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0017\u0010\u0013\"\u0004\u0008\u0018\u0010\u0015R\u0010\u0010\u0019\u001a\u0004\u0018\u00010\u001aX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u001a\u0010\u001b\u001a\u00020\u0011X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u001c\u0010\u0013\"\u0004\u0008\u001d\u0010\u0015R\u001a\u0010\u001e\u001a\u00020\u001fX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008 \u0010!\"\u0004\u0008\"\u0010#R\u001e\u0010%\u001a\u00020\u00112\u0006\u0010$\u001a\u00020\u0011@BX\u0086\u000e\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008%\u0010\u0013R$\u0010\'\u001a\u00020\n2\u0006\u0010&\u001a\u00020\n@FX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008(\u0010)\"\u0004\u0008*\u0010+R\u001a\u0010,\u001a\u00020\nX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008-\u0010)\"\u0004\u0008.\u0010+R\u001a\u0010/\u001a\u00020\nX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u00080\u0010)\"\u0004\u00081\u0010+\u00a8\u0006O"
    }
    d2 = {
        "Lcom/momo/xeengine/svgaplayer/SVGAImageView;",
        "Landroid/widget/ImageView;",
        "Lcom/momo/xeengine/svgaplayer/SVGAParser$ParseCompletion;",
        "context",
        "Landroid/content/Context;",
        "(Landroid/content/Context;)V",
        "attrs",
        "Landroid/util/AttributeSet;",
        "(Landroid/content/Context;Landroid/util/AttributeSet;)V",
        "defStyleAttr",
        "",
        "(Landroid/content/Context;Landroid/util/AttributeSet;I)V",
        "defStyleRes",
        "(Landroid/content/Context;Landroid/util/AttributeSet;II)V",
        "animator",
        "Landroid/animation/ValueAnimator;",
        "antiAlias",
        "",
        "getAntiAlias",
        "()Z",
        "setAntiAlias",
        "(Z)V",
        "autoPlay",
        "getAutoPlay",
        "setAutoPlay",
        "callback",
        "Lcom/momo/xeengine/svgaplayer/listener/SVGACallback;",
        "clearsAfterStop",
        "getClearsAfterStop",
        "setClearsAfterStop",
        "fillMode",
        "Lcom/momo/xeengine/svgaplayer/SVGAImageView$FillMode;",
        "getFillMode",
        "()Lcom/momo/xeengine/svgaplayer/SVGAImageView$FillMode;",
        "setFillMode",
        "(Lcom/momo/xeengine/svgaplayer/SVGAImageView$FillMode;)V",
        "<set-?>",
        "isAnimating",
        "value",
        "loops",
        "getLoops",
        "()I",
        "setLoops",
        "(I)V",
        "mEndFrame",
        "getMEndFrame",
        "setMEndFrame",
        "mStartFrame",
        "getMStartFrame",
        "setMStartFrame",
        "fullRelease",
        "",
        "generateScale",
        "",
        "onComplete",
        "videoItem",
        "Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;",
        "onDetachedFromWindow",
        "onError",
        "errorMsg",
        "",
        "pauseAnimation",
        "setCallback",
        "setVideoItem",
        "dynamicItem",
        "Lcom/momo/xeengine/svgaplayer/SVGADynamicEntity;",
        "startAnimation",
        "range",
        "Lcom/momo/xeengine/svgaplayer/SVGARange;",
        "reverse",
        "stepToFrame",
        "frame",
        "andPlay",
        "stepToPercentage",
        "percentage",
        "stopAnim",
        "stopAnimation",
        "clear",
        "FillMode",
        "gift_player_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x1,
        0xf
    }
.end annotation


# instance fields
.field private animator:Landroid/animation/ValueAnimator;

.field private antiAlias:Z

.field private autoPlay:Z

.field private callback:Lcom/momo/xeengine/svgaplayer/listener/SVGACallback;

.field private clearsAfterStop:Z

.field private fillMode:Lcom/momo/xeengine/svgaplayer/SVGAImageView$FillMode;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private isAnimating:Z

.field private loops:I

.field private mEndFrame:I

.field private mStartFrame:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    iput-boolean p1, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->clearsAfterStop:Z

    .line 6
    .line 7
    iput-boolean p1, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->antiAlias:Z

    .line 8
    .line 9
    iput-boolean p1, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->autoPlay:Z

    .line 10
    .line 11
    sget-object p1, Lcom/momo/xeengine/svgaplayer/SVGAImageView$FillMode;->Forward:Lcom/momo/xeengine/svgaplayer/SVGAImageView$FillMode;

    .line 12
    .line 13
    iput-object p1, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->fillMode:Lcom/momo/xeengine/svgaplayer/SVGAImageView$FillMode;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 16
    invoke-direct {p0, p1, p2}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x1

    .line 17
    iput-boolean p1, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->clearsAfterStop:Z

    .line 18
    iput-boolean p1, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->antiAlias:Z

    .line 19
    iput-boolean p1, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->autoPlay:Z

    .line 20
    sget-object p1, Lcom/momo/xeengine/svgaplayer/SVGAImageView$FillMode;->Forward:Lcom/momo/xeengine/svgaplayer/SVGAImageView$FillMode;

    iput-object p1, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->fillMode:Lcom/momo/xeengine/svgaplayer/SVGAImageView$FillMode;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 21
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x1

    .line 22
    iput-boolean p1, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->clearsAfterStop:Z

    .line 23
    iput-boolean p1, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->antiAlias:Z

    .line 24
    iput-boolean p1, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->autoPlay:Z

    .line 25
    sget-object p1, Lcom/momo/xeengine/svgaplayer/SVGAImageView$FillMode;->Forward:Lcom/momo/xeengine/svgaplayer/SVGAImageView$FillMode;

    iput-object p1, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->fillMode:Lcom/momo/xeengine/svgaplayer/SVGAImageView$FillMode;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 26
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    const/4 p1, 0x1

    .line 27
    iput-boolean p1, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->clearsAfterStop:Z

    .line 28
    iput-boolean p1, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->antiAlias:Z

    .line 29
    iput-boolean p1, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->autoPlay:Z

    .line 30
    sget-object p1, Lcom/momo/xeengine/svgaplayer/SVGAImageView$FillMode;->Forward:Lcom/momo/xeengine/svgaplayer/SVGAImageView$FillMode;

    iput-object p1, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->fillMode:Lcom/momo/xeengine/svgaplayer/SVGAImageView$FillMode;

    return-void
.end method

.method public static final synthetic access$getAnimator$p(Lcom/momo/xeengine/svgaplayer/SVGAImageView;)Landroid/animation/ValueAnimator;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->animator:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic access$getCallback$p(Lcom/momo/xeengine/svgaplayer/SVGAImageView;)Lcom/momo/xeengine/svgaplayer/listener/SVGACallback;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->callback:Lcom/momo/xeengine/svgaplayer/listener/SVGACallback;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic access$isAnimating$p(Lcom/momo/xeengine/svgaplayer/SVGAImageView;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->isAnimating:Z

    .line 2
    .line 3
    return p0
.end method

.method public static final synthetic access$setAnimating$p(Lcom/momo/xeengine/svgaplayer/SVGAImageView;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->isAnimating:Z

    .line 2
    .line 3
    return-void
.end method

.method public static final synthetic access$setAnimator$p(Lcom/momo/xeengine/svgaplayer/SVGAImageView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->animator:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    return-void
.end method

.method public static final synthetic access$setCallback$p(Lcom/momo/xeengine/svgaplayer/SVGAImageView;Lcom/momo/xeengine/svgaplayer/listener/SVGACallback;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->callback:Lcom/momo/xeengine/svgaplayer/listener/SVGACallback;

    .line 2
    .line 3
    return-void
.end method

.method private final generateScale()D
    .locals 6

    .line 1
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    .line 2
    .line 3
    :try_start_0
    const-string p0, "android.animation.ValueAnimator"

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string v2, "getDurationScale"

    .line 10
    .line 11
    const/4 v3, 0x0

    .line 12
    invoke-virtual {p0, v2, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    if-eqz v2, :cond_2

    .line 17
    .line 18
    invoke-virtual {v2, p0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    if-eqz v2, :cond_1

    .line 23
    .line 24
    check-cast v2, Ljava/lang/Float;

    .line 25
    .line 26
    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    .line 27
    .line 28
    .line 29
    move-result v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 30
    float-to-double v2, v2

    .line 31
    const-wide/16 v4, 0x0

    .line 32
    .line 33
    cmpg-double v4, v2, v4

    .line 34
    .line 35
    if-nez v4, :cond_0

    .line 36
    .line 37
    :try_start_1
    const-string v4, "setDurationScale"

    .line 38
    .line 39
    sget-object v5, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    .line 40
    .line 41
    filled-new-array {v5}, [Ljava/lang/Class;

    .line 42
    .line 43
    .line 44
    move-result-object v5

    .line 45
    invoke-virtual {p0, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    if-eqz v4, :cond_0

    .line 50
    .line 51
    const/4 v5, 0x1

    .line 52
    invoke-virtual {v4, v5}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    .line 53
    .line 54
    .line 55
    const/high16 v5, 0x3f800000    # 1.0f

    .line 56
    .line 57
    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 58
    .line 59
    .line 60
    move-result-object v5

    .line 61
    filled-new-array {v5}, [Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v5

    .line 65
    invoke-virtual {v4, p0, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 66
    .line 67
    .line 68
    return-wide v0

    .line 69
    :catch_0
    move-exception p0

    .line 70
    move-wide v0, v2

    .line 71
    goto :goto_0

    .line 72
    :cond_0
    return-wide v2

    .line 73
    :catch_1
    move-exception p0

    .line 74
    goto :goto_0

    .line 75
    :cond_1
    :try_start_2
    new-instance p0, Lkotlin/TypeCastException;

    .line 76
    .line 77
    const-string v2, "null cannot be cast to non-null type kotlin.Float"

    .line 78
    .line 79
    invoke-direct {p0, v2}, Lkotlin/TypeCastException;-><init>(Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    throw p0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 83
    :cond_2
    return-wide v0

    .line 84
    :goto_0
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 85
    .line 86
    .line 87
    return-wide v0
.end method

.method public static synthetic startAnimation$default(Lcom/momo/xeengine/svgaplayer/SVGAImageView;Lcom/momo/xeengine/svgaplayer/SVGARange;ZILjava/lang/Object;)V
    .locals 0

    .line 1
    if-nez p4, :cond_1

    .line 2
    .line 3
    and-int/lit8 p3, p3, 0x2

    .line 4
    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    const/4 p2, 0x0

    .line 8
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->startAnimation(Lcom/momo/xeengine/svgaplayer/SVGARange;Z)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_1
    const-string p0, "Super calls with default arguments not supported in this target, function: startAnimation"

    .line 13
    .line 14
    invoke-static {p0}, Ll/pr3;->a(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method private final stopAnim()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->animator:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->animator:Landroid/animation/ValueAnimator;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->removeAllUpdateListeners()V

    .line 13
    .line 14
    .line 15
    :cond_1
    iget-object p0, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->animator:Landroid/animation/ValueAnimator;

    .line 16
    .line 17
    if-eqz p0, :cond_2

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/animation/Animator;->removeAllListeners()V

    .line 20
    .line 21
    .line 22
    :cond_2
    return-void
.end method


# virtual methods
.method public final fullRelease()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->stopAnim()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->callback:Lcom/momo/xeengine/svgaplayer/listener/SVGACallback;

    .line 6
    .line 7
    return-void
.end method

.method public final getAntiAlias()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->antiAlias:Z

    .line 2
    .line 3
    return p0
.end method

.method public final getAutoPlay()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->autoPlay:Z

    .line 2
    .line 3
    return p0
.end method

.method public final getClearsAfterStop()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->clearsAfterStop:Z

    .line 2
    .line 3
    return p0
.end method

.method public final getFillMode()Lcom/momo/xeengine/svgaplayer/SVGAImageView$FillMode;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->fillMode:Lcom/momo/xeengine/svgaplayer/SVGAImageView$FillMode;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getLoops()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->loops:I

    .line 2
    .line 3
    return p0
.end method

.method public final getMEndFrame()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->mEndFrame:I

    .line 2
    .line 3
    return p0
.end method

.method public final getMStartFrame()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->mStartFrame:I

    .line 2
    .line 3
    return p0
.end method

.method public final isAnimating()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->isAnimating:Z

    .line 2
    .line 3
    return p0
.end method

.method public onComplete(Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;)V
    .locals 2
    .param p1    # Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getHandler()Landroid/os/Handler;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    new-instance v1, Lcom/momo/xeengine/svgaplayer/SVGAImageView$onComplete$1;

    .line 11
    .line 12
    invoke-direct {v1, p0, p1}, Lcom/momo/xeengine/svgaplayer/SVGAImageView$onComplete$1;-><init>(Lcom/momo/xeengine/svgaplayer/SVGAImageView;Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/widget/ImageView;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->fullRelease()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onError(Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance p0, Lkotlin/NotImplementedError;

    .line 5
    .line 6
    const-string p1, "An operation is not implemented: Not yet implemented"

    .line 7
    .line 8
    invoke-direct {p0, p1}, Lkotlin/NotImplementedError;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    throw p0
.end method

.method public final pauseAnimation()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->stopAnimation(Z)V

    .line 3
    .line 4
    .line 5
    iget-object p0, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->callback:Lcom/momo/xeengine/svgaplayer/listener/SVGACallback;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-interface {p0}, Lcom/momo/xeengine/svgaplayer/listener/SVGACallback;->onPause()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public final setAntiAlias(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->antiAlias:Z

    .line 2
    .line 3
    return-void
.end method

.method public final setAutoPlay(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->autoPlay:Z

    .line 2
    .line 3
    return-void
.end method

.method public final setCallback(Lcom/momo/xeengine/svgaplayer/listener/SVGACallback;)V
    .locals 0
    .param p1    # Lcom/momo/xeengine/svgaplayer/listener/SVGACallback;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->callback:Lcom/momo/xeengine/svgaplayer/listener/SVGACallback;

    .line 2
    .line 3
    return-void
.end method

.method public final setClearsAfterStop(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->clearsAfterStop:Z

    .line 2
    .line 3
    return-void
.end method

.method public final setFillMode(Lcom/momo/xeengine/svgaplayer/SVGAImageView$FillMode;)V
    .locals 0
    .param p1    # Lcom/momo/xeengine/svgaplayer/SVGAImageView$FillMode;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->fillMode:Lcom/momo/xeengine/svgaplayer/SVGAImageView$FillMode;

    .line 5
    .line 6
    return-void
.end method

.method public final setLoops(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->loops:I

    .line 2
    .line 3
    iget-object p0, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->animator:Landroid/animation/ValueAnimator;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public final setMEndFrame(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->mEndFrame:I

    .line 2
    .line 3
    return-void
.end method

.method public final setMStartFrame(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->mStartFrame:I

    .line 2
    .line 3
    return-void
.end method

.method public final setVideoItem(Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;)V
    .locals 1
    .param p1    # Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 21
    new-instance v0, Lcom/momo/xeengine/svgaplayer/SVGADynamicEntity;

    invoke-direct {v0}, Lcom/momo/xeengine/svgaplayer/SVGADynamicEntity;-><init>()V

    invoke-virtual {p0, p1, v0}, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->setVideoItem(Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;Lcom/momo/xeengine/svgaplayer/SVGADynamicEntity;)V

    return-void
.end method

.method public final setVideoItem(Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;Lcom/momo/xeengine/svgaplayer/SVGADynamicEntity;)V
    .locals 1
    .param p1    # Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/momo/xeengine/svgaplayer/SVGADynamicEntity;
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
    new-instance v0, Lcom/momo/xeengine/svgaplayer/SVGADrawable;

    .line 8
    .line 9
    invoke-direct {v0, p1, p2}, Lcom/momo/xeengine/svgaplayer/SVGADrawable;-><init>(Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;Lcom/momo/xeengine/svgaplayer/SVGADynamicEntity;)V

    .line 10
    .line 11
    .line 12
    iget-boolean p1, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->clearsAfterStop:Z

    .line 13
    .line 14
    invoke-virtual {v0, p1}, Lcom/momo/xeengine/svgaplayer/SVGADrawable;->setCleared$gift_player_release(Z)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final startAnimation()V
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 234
    invoke-virtual {p0, v0, v1}, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->startAnimation(Lcom/momo/xeengine/svgaplayer/SVGARange;Z)V

    return-void
.end method

.method public final startAnimation(Lcom/momo/xeengine/svgaplayer/SVGARange;Z)V
    .locals 9
    .param p1    # Lcom/momo/xeengine/svgaplayer/SVGARange;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->stopAnimation(Z)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    instance-of v2, v1, Lcom/momo/xeengine/svgaplayer/SVGADrawable;

    .line 10
    .line 11
    if-nez v2, :cond_0

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    :cond_0
    move-object v7, v1

    .line 15
    check-cast v7, Lcom/momo/xeengine/svgaplayer/SVGADrawable;

    .line 16
    .line 17
    if-eqz v7, :cond_f

    .line 18
    .line 19
    invoke-virtual {v7, v0}, Lcom/momo/xeengine/svgaplayer/SVGADrawable;->setCleared$gift_player_release(Z)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/widget/ImageView;->getScaleType()Landroid/widget/ImageView$ScaleType;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v7, v1}, Lcom/momo/xeengine/svgaplayer/SVGADrawable;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v7}, Lcom/momo/xeengine/svgaplayer/SVGADrawable;->getVideoItem()Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    new-instance v3, Lkotlin/jvm/internal/Ref$IntRef;

    .line 37
    .line 38
    invoke-direct {v3}, Lkotlin/jvm/internal/Ref$IntRef;-><init>()V

    .line 39
    .line 40
    .line 41
    if-eqz p1, :cond_1

    .line 42
    .line 43
    invoke-virtual {p1}, Lcom/momo/xeengine/svgaplayer/SVGARange;->getLocation()I

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    goto :goto_0

    .line 48
    :cond_1
    move v2, v0

    .line 49
    :goto_0
    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    iput v2, v3, Lkotlin/jvm/internal/Ref$IntRef;->element:I

    .line 54
    .line 55
    new-instance v4, Lkotlin/jvm/internal/Ref$IntRef;

    .line 56
    .line 57
    invoke-direct {v4}, Lkotlin/jvm/internal/Ref$IntRef;-><init>()V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v1}, Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;->getFrames()I

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    add-int/lit8 v2, v2, -0x1

    .line 65
    .line 66
    if-eqz p1, :cond_2

    .line 67
    .line 68
    invoke-virtual {p1}, Lcom/momo/xeengine/svgaplayer/SVGARange;->getLocation()I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    :cond_2
    if-eqz p1, :cond_3

    .line 73
    .line 74
    invoke-virtual {p1}, Lcom/momo/xeengine/svgaplayer/SVGARange;->getLength()I

    .line 75
    .line 76
    .line 77
    move-result v5

    .line 78
    goto :goto_1

    .line 79
    :cond_3
    const v5, 0x7fffffff

    .line 80
    .line 81
    .line 82
    :goto_1
    add-int/2addr v0, v5

    .line 83
    add-int/lit8 v0, v0, -0x1

    .line 84
    .line 85
    invoke-static {v2, v0}, Ljava/lang/Math;->min(II)I

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    iput v0, v4, Lkotlin/jvm/internal/Ref$IntRef;->element:I

    .line 90
    .line 91
    iget v2, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->mStartFrame:I

    .line 92
    .line 93
    if-gez v2, :cond_4

    .line 94
    .line 95
    goto :goto_2

    .line 96
    :cond_4
    if-le v0, v2, :cond_5

    .line 97
    .line 98
    iput v2, v3, Lkotlin/jvm/internal/Ref$IntRef;->element:I

    .line 99
    .line 100
    :cond_5
    :goto_2
    iget v0, v4, Lkotlin/jvm/internal/Ref$IntRef;->element:I

    .line 101
    .line 102
    add-int/lit8 v2, v2, 0x1

    .line 103
    .line 104
    iget v5, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->mEndFrame:I

    .line 105
    .line 106
    if-le v2, v5, :cond_6

    .line 107
    .line 108
    goto :goto_3

    .line 109
    :cond_6
    if-lt v0, v5, :cond_7

    .line 110
    .line 111
    iput v5, v4, Lkotlin/jvm/internal/Ref$IntRef;->element:I

    .line 112
    .line 113
    :cond_7
    :goto_3
    invoke-direct {p0}, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->stopAnim()V

    .line 114
    .line 115
    .line 116
    iget v0, v3, Lkotlin/jvm/internal/Ref$IntRef;->element:I

    .line 117
    .line 118
    iget v2, v4, Lkotlin/jvm/internal/Ref$IntRef;->element:I

    .line 119
    .line 120
    filled-new-array {v0, v2}, [I

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    iput-object v0, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->animator:Landroid/animation/ValueAnimator;

    .line 129
    .line 130
    if-eqz v0, :cond_8

    .line 131
    .line 132
    new-instance v2, Landroid/view/animation/LinearInterpolator;

    .line 133
    .line 134
    invoke-direct {v2}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 135
    .line 136
    .line 137
    invoke-virtual {v0, v2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 138
    .line 139
    .line 140
    :cond_8
    iget v0, v4, Lkotlin/jvm/internal/Ref$IntRef;->element:I

    .line 141
    .line 142
    iget v2, v3, Lkotlin/jvm/internal/Ref$IntRef;->element:I

    .line 143
    .line 144
    sub-int/2addr v0, v2

    .line 145
    add-int/lit8 v0, v0, 0x1

    .line 146
    .line 147
    int-to-float v0, v0

    .line 148
    invoke-virtual {v1}, Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;->getFPS()I

    .line 149
    .line 150
    .line 151
    move-result v1

    .line 152
    int-to-float v1, v1

    .line 153
    div-float/2addr v0, v1

    .line 154
    const/high16 v1, 0x447a0000    # 1000.0f

    .line 155
    .line 156
    mul-float/2addr v0, v1

    .line 157
    float-to-double v0, v0

    .line 158
    invoke-direct {p0}, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->generateScale()D

    .line 159
    .line 160
    .line 161
    move-result-wide v5

    .line 162
    div-double/2addr v0, v5

    .line 163
    double-to-long v0, v0

    .line 164
    iget-object v2, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->animator:Landroid/animation/ValueAnimator;

    .line 165
    .line 166
    if-eqz v2, :cond_9

    .line 167
    .line 168
    invoke-virtual {v2, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 169
    .line 170
    .line 171
    :cond_9
    iget-object v0, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->animator:Landroid/animation/ValueAnimator;

    .line 172
    .line 173
    if-eqz v0, :cond_b

    .line 174
    .line 175
    iget v1, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->loops:I

    .line 176
    .line 177
    if-gtz v1, :cond_a

    .line 178
    .line 179
    const v1, 0x1869f

    .line 180
    .line 181
    .line 182
    goto :goto_4

    .line 183
    :cond_a
    add-int/lit8 v1, v1, -0x1

    .line 184
    .line 185
    :goto_4
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 186
    .line 187
    .line 188
    :cond_b
    iget-object v0, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->animator:Landroid/animation/ValueAnimator;

    .line 189
    .line 190
    if-eqz v0, :cond_c

    .line 191
    .line 192
    new-instance v1, Lcom/momo/xeengine/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$1;

    .line 193
    .line 194
    invoke-direct {v1, p0, p1, v7, p2}, Lcom/momo/xeengine/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$1;-><init>(Lcom/momo/xeengine/svgaplayer/SVGAImageView;Lcom/momo/xeengine/svgaplayer/SVGARange;Lcom/momo/xeengine/svgaplayer/SVGADrawable;Z)V

    .line 195
    .line 196
    .line 197
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 198
    .line 199
    .line 200
    :cond_c
    iget-object v0, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->animator:Landroid/animation/ValueAnimator;

    .line 201
    .line 202
    if-eqz v0, :cond_d

    .line 203
    .line 204
    new-instance v2, Lcom/momo/xeengine/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$2;

    .line 205
    .line 206
    move-object v5, p0

    .line 207
    move-object v6, p1

    .line 208
    move v8, p2

    .line 209
    invoke-direct/range {v2 .. v8}, Lcom/momo/xeengine/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$2;-><init>(Lkotlin/jvm/internal/Ref$IntRef;Lkotlin/jvm/internal/Ref$IntRef;Lcom/momo/xeengine/svgaplayer/SVGAImageView;Lcom/momo/xeengine/svgaplayer/SVGARange;Lcom/momo/xeengine/svgaplayer/SVGADrawable;Z)V

    .line 210
    .line 211
    .line 212
    invoke-virtual {v0, v2}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 213
    .line 214
    .line 215
    goto :goto_5

    .line 216
    :cond_d
    move-object v5, p0

    .line 217
    move v8, p2

    .line 218
    :goto_5
    iget-object p0, v5, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->animator:Landroid/animation/ValueAnimator;

    .line 219
    .line 220
    if-eqz v8, :cond_e

    .line 221
    .line 222
    if-eqz p0, :cond_f

    .line 223
    .line 224
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->reverse()V

    .line 225
    .line 226
    .line 227
    return-void

    .line 228
    :cond_e
    if-eqz p0, :cond_f

    .line 229
    .line 230
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 231
    .line 232
    .line 233
    :cond_f
    return-void
.end method

.method public final stepToFrame(IZ)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->pauseAnimation()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    instance-of v1, v0, Lcom/momo/xeengine/svgaplayer/SVGADrawable;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    :cond_0
    check-cast v0, Lcom/momo/xeengine/svgaplayer/SVGADrawable;

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {v0, p1}, Lcom/momo/xeengine/svgaplayer/SVGADrawable;->setCurrentFrame$gift_player_release(I)V

    .line 18
    .line 19
    .line 20
    if-eqz p2, :cond_1

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->startAnimation()V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->animator:Landroid/animation/ValueAnimator;

    .line 26
    .line 27
    if-eqz p0, :cond_1

    .line 28
    .line 29
    int-to-float p1, p1

    .line 30
    invoke-virtual {v0}, Lcom/momo/xeengine/svgaplayer/SVGADrawable;->getVideoItem()Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    invoke-virtual {p2}, Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;->getFrames()I

    .line 35
    .line 36
    .line 37
    move-result p2

    .line 38
    int-to-float p2, p2

    .line 39
    div-float/2addr p1, p2

    .line 40
    const/high16 p2, 0x3f800000    # 1.0f

    .line 41
    .line 42
    invoke-static {p2, p1}, Ljava/lang/Math;->min(FF)F

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    const/4 p2, 0x0

    .line 47
    invoke-static {p2, p1}, Ljava/lang/Math;->max(FF)F

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->getDuration()J

    .line 52
    .line 53
    .line 54
    move-result-wide v0

    .line 55
    long-to-float p2, v0

    .line 56
    mul-float/2addr p1, p2

    .line 57
    float-to-long p1, p1

    .line 58
    invoke-virtual {p0, p1, p2}, Landroid/animation/ValueAnimator;->setCurrentPlayTime(J)V

    .line 59
    .line 60
    .line 61
    :cond_1
    return-void
.end method

.method public final stepToPercentage(DZ)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v1, v0, Lcom/momo/xeengine/svgaplayer/SVGADrawable;

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    :cond_0
    check-cast v0, Lcom/momo/xeengine/svgaplayer/SVGADrawable;

    .line 11
    .line 12
    if-eqz v0, :cond_2

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/momo/xeengine/svgaplayer/SVGADrawable;->getVideoItem()Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v1}, Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;->getFrames()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    int-to-double v1, v1

    .line 23
    mul-double/2addr v1, p1

    .line 24
    double-to-int p1, v1

    .line 25
    invoke-virtual {v0}, Lcom/momo/xeengine/svgaplayer/SVGADrawable;->getVideoItem()Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    invoke-virtual {p2}, Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;->getFrames()I

    .line 30
    .line 31
    .line 32
    move-result p2

    .line 33
    if-lt p1, p2, :cond_1

    .line 34
    .line 35
    if-lez p1, :cond_1

    .line 36
    .line 37
    invoke-virtual {v0}, Lcom/momo/xeengine/svgaplayer/SVGADrawable;->getVideoItem()Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {p1}, Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;->getFrames()I

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    add-int/lit8 p1, p1, -0x1

    .line 46
    .line 47
    :cond_1
    invoke-virtual {p0, p1, p3}, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->stepToFrame(IZ)V

    .line 48
    .line 49
    .line 50
    :cond_2
    return-void
.end method

.method public final stopAnimation()V
    .locals 1

    .line 21
    iget-boolean v0, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->clearsAfterStop:Z

    invoke-virtual {p0, v0}, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->stopAnimation(Z)V

    return-void
.end method

.method public final stopAnimation(Z)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->stopAnim()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    instance-of v0, p0, Lcom/momo/xeengine/svgaplayer/SVGADrawable;

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    :cond_0
    check-cast p0, Lcom/momo/xeengine/svgaplayer/SVGADrawable;

    .line 14
    .line 15
    if-eqz p0, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Lcom/momo/xeengine/svgaplayer/SVGADrawable;->setCleared$gift_player_release(Z)V

    .line 18
    .line 19
    .line 20
    :cond_1
    return-void
.end method
