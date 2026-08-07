.class public Lcom/immomo/svgaplayer/SVGAImageView;
.super Landroid/widget/ImageView;
.source "SourceFile"

# interfaces
.implements Lcom/immomo/svgaplayer/SVGAParser$ParseCompletion;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/immomo/svgaplayer/SVGAImageView$FillMode;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x2
    }
    d1 = {
        "\u0000\u0080\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0004\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0015\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\t\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0010\u0006\n\u0002\u0008\u0004\u0008\u0016\u0018\u00002\u00020\u00012\u00020\u0002:\u0001XB\u0011\u0008\u0016\u0012\u0008\u0010\u0003\u001a\u0004\u0018\u00010\u0004\u00a2\u0006\u0002\u0010\u0005B\u001b\u0008\u0016\u0012\u0008\u0010\u0003\u001a\u0004\u0018\u00010\u0004\u0012\u0008\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u00a2\u0006\u0002\u0010\u0008B#\u0008\u0016\u0012\u0008\u0010\u0003\u001a\u0004\u0018\u00010\u0004\u0012\u0008\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u0012\u0006\u0010\t\u001a\u00020\n\u00a2\u0006\u0002\u0010\u000bB+\u0008\u0016\u0012\u0008\u0010\u0003\u001a\u0004\u0018\u00010\u0004\u0012\u0008\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u0012\u0006\u0010\t\u001a\u00020\n\u0012\u0006\u0010\u000c\u001a\u00020\n\u00a2\u0006\u0002\u0010\rJ\u0008\u00109\u001a\u0004\u0018\u00010:J\u0008\u0010;\u001a\u00020<H\u0002J\u0010\u0010=\u001a\u00020>2\u0006\u0010\u0006\u001a\u00020\u0007H\u0002J\u0010\u0010?\u001a\u00020>2\u0006\u0010@\u001a\u00020AH\u0016J\u0008\u0010B\u001a\u00020>H\u0014J\u0010\u0010C\u001a\u00020>2\u0006\u0010D\u001a\u00020\u000fH\u0016J\u0006\u0010E\u001a\u00020>J\u0012\u0010F\u001a\u00020>2\u0008\u0010G\u001a\u0004\u0018\u00010:H\u0016J\u0010\u0010F\u001a\u00020>2\u0008\u0010\u001e\u001a\u0004\u0018\u00010\u001fJ\u0008\u0010H\u001a\u00020>H\u0002J\u0010\u0010I\u001a\u00020>2\u0006\u0010@\u001a\u00020AH\u0004J\u0018\u0010I\u001a\u00020>2\u0006\u0010@\u001a\u00020A2\u0006\u0010J\u001a\u00020KH\u0004J\u0006\u0010L\u001a\u00020>J\u001c\u0010L\u001a\u00020>2\u0008\u0010M\u001a\u0004\u0018\u00010N2\u0008\u0008\u0002\u0010O\u001a\u00020\u0011H\u0004J\u0016\u0010P\u001a\u00020>2\u0006\u0010Q\u001a\u00020\n2\u0006\u0010R\u001a\u00020\u0011J\u0016\u0010S\u001a\u00020>2\u0006\u0010T\u001a\u00020U2\u0006\u0010R\u001a\u00020\u0011J\u0006\u0010V\u001a\u00020>J\u000e\u0010V\u001a\u00020>2\u0006\u0010W\u001a\u00020\u0011R\u000e\u0010\u000e\u001a\u00020\u000fX\u0082D\u00a2\u0006\u0002\n\u0000R\u001a\u0010\u0010\u001a\u00020\u0011X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0012\u0010\u0013\"\u0004\u0008\u0014\u0010\u0015R\u0010\u0010\u0016\u001a\u0004\u0018\u00010\u0017X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u001a\u0010\u0018\u001a\u00020\u0011X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0019\u0010\u0013\"\u0004\u0008\u001a\u0010\u0015R\u001a\u0010\u001b\u001a\u00020\u0011X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u001c\u0010\u0013\"\u0004\u0008\u001d\u0010\u0015R\u0010\u0010\u001e\u001a\u0004\u0018\u00010\u001fX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u001a\u0010 \u001a\u00020\u0011X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008!\u0010\u0013\"\u0004\u0008\"\u0010\u0015R\u001a\u0010#\u001a\u00020$X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008%\u0010&\"\u0004\u0008\'\u0010(R$\u0010*\u001a\u00020\u00112\u0006\u0010)\u001a\u00020\u0011@BX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008*\u0010\u0013\"\u0004\u0008+\u0010\u0015R\u000e\u0010,\u001a\u00020\u0011X\u0082\u000e\u00a2\u0006\u0002\n\u0000R$\u0010.\u001a\u00020\n2\u0006\u0010-\u001a\u00020\n@FX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008/\u00100\"\u0004\u00081\u00102R\u001a\u00103\u001a\u00020\nX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u00084\u00100\"\u0004\u00085\u00102R\u001a\u00106\u001a\u00020\nX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u00087\u00100\"\u0004\u00088\u00102\u00a8\u0006Y"
    }
    d2 = {
        "Lcom/immomo/svgaplayer/SVGAImageView;",
        "Landroid/widget/ImageView;",
        "Lcom/immomo/svgaplayer/SVGAParser$ParseCompletion;",
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
        "TAG",
        "",
        "addCache",
        "",
        "getAddCache",
        "()Z",
        "setAddCache",
        "(Z)V",
        "animator",
        "Landroid/animation/ValueAnimator;",
        "antiAlias",
        "getAntiAlias",
        "setAntiAlias",
        "autoPlay",
        "getAutoPlay",
        "setAutoPlay",
        "callback",
        "Lcom/immomo/svgaplayer/listener/SVGACallback;",
        "clearsAfterStop",
        "getClearsAfterStop",
        "setClearsAfterStop",
        "fillMode",
        "Lcom/immomo/svgaplayer/SVGAImageView$FillMode;",
        "getFillMode",
        "()Lcom/immomo/svgaplayer/SVGAImageView$FillMode;",
        "setFillMode",
        "(Lcom/immomo/svgaplayer/SVGAImageView$FillMode;)V",
        "<set-?>",
        "isAnimating",
        "setAnimating",
        "isPause",
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
        "getCallBack",
        "Lcom/immomo/svgaplayer/SVGAAnimListenerAdapter;",
        "getTaskTag",
        "",
        "loadAttrs",
        "",
        "onComplete",
        "videoItem",
        "Lcom/immomo/svgaplayer/SVGAVideoEntity;",
        "onDetachedFromWindow",
        "onError",
        "errorMsg",
        "pauseAnimation",
        "setCallback",
        "listAdapter",
        "setSoftwareLayerType",
        "setVideoItem",
        "dynamicItem",
        "Lcom/immomo/svgaplayer/SVGADynamicEntity;",
        "startAnimation",
        "range",
        "Lcom/immomo/svgaplayer/SVGARange;",
        "reverse",
        "stepToFrame",
        "frame",
        "andPlay",
        "stepToPercentage",
        "percentage",
        "",
        "stopAnimation",
        "clear",
        "FillMode",
        "svgalibrary_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x1,
        0xa
    }
.end annotation


# instance fields
.field private final TAG:Ljava/lang/String;

.field private addCache:Z

.field private animator:Landroid/animation/ValueAnimator;

.field private antiAlias:Z

.field private autoPlay:Z

.field private callback:Lcom/immomo/svgaplayer/listener/SVGACallback;

.field private clearsAfterStop:Z

.field private fillMode:Lcom/immomo/svgaplayer/SVGAImageView$FillMode;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private isAnimating:Z

.field private isPause:Z

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

    .line 30
    invoke-direct {p0, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 31
    const-string p1, "SVGAImageView"

    iput-object p1, p0, Lcom/immomo/svgaplayer/SVGAImageView;->TAG:Ljava/lang/String;

    const/4 p1, 0x1

    .line 32
    iput-boolean p1, p0, Lcom/immomo/svgaplayer/SVGAImageView;->clearsAfterStop:Z

    .line 33
    iput-boolean p1, p0, Lcom/immomo/svgaplayer/SVGAImageView;->addCache:Z

    .line 34
    iput-boolean p1, p0, Lcom/immomo/svgaplayer/SVGAImageView;->antiAlias:Z

    .line 35
    iput-boolean p1, p0, Lcom/immomo/svgaplayer/SVGAImageView;->autoPlay:Z

    .line 36
    sget-object p1, Lcom/immomo/svgaplayer/SVGAImageView$FillMode;->Forward:Lcom/immomo/svgaplayer/SVGAImageView$FillMode;

    iput-object p1, p0, Lcom/immomo/svgaplayer/SVGAImageView;->fillMode:Lcom/immomo/svgaplayer/SVGAImageView$FillMode;

    .line 37
    invoke-direct {p0}, Lcom/immomo/svgaplayer/SVGAImageView;->setSoftwareLayerType()V

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

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    const-string p1, "SVGAImageView"

    .line 5
    .line 6
    iput-object p1, p0, Lcom/immomo/svgaplayer/SVGAImageView;->TAG:Ljava/lang/String;

    .line 7
    .line 8
    const/4 p1, 0x1

    .line 9
    iput-boolean p1, p0, Lcom/immomo/svgaplayer/SVGAImageView;->clearsAfterStop:Z

    .line 10
    .line 11
    iput-boolean p1, p0, Lcom/immomo/svgaplayer/SVGAImageView;->addCache:Z

    .line 12
    .line 13
    iput-boolean p1, p0, Lcom/immomo/svgaplayer/SVGAImageView;->antiAlias:Z

    .line 14
    .line 15
    iput-boolean p1, p0, Lcom/immomo/svgaplayer/SVGAImageView;->autoPlay:Z

    .line 16
    .line 17
    sget-object p1, Lcom/immomo/svgaplayer/SVGAImageView$FillMode;->Forward:Lcom/immomo/svgaplayer/SVGAImageView$FillMode;

    .line 18
    .line 19
    iput-object p1, p0, Lcom/immomo/svgaplayer/SVGAImageView;->fillMode:Lcom/immomo/svgaplayer/SVGAImageView$FillMode;

    .line 20
    .line 21
    invoke-direct {p0}, Lcom/immomo/svgaplayer/SVGAImageView;->setSoftwareLayerType()V

    .line 22
    .line 23
    .line 24
    if-eqz p2, :cond_0

    .line 25
    .line 26
    invoke-direct {p0, p2}, Lcom/immomo/svgaplayer/SVGAImageView;->loadAttrs(Landroid/util/AttributeSet;)V

    .line 27
    .line 28
    .line 29
    :cond_0
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

    .line 38
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 39
    const-string p1, "SVGAImageView"

    iput-object p1, p0, Lcom/immomo/svgaplayer/SVGAImageView;->TAG:Ljava/lang/String;

    const/4 p1, 0x1

    .line 40
    iput-boolean p1, p0, Lcom/immomo/svgaplayer/SVGAImageView;->clearsAfterStop:Z

    .line 41
    iput-boolean p1, p0, Lcom/immomo/svgaplayer/SVGAImageView;->addCache:Z

    .line 42
    iput-boolean p1, p0, Lcom/immomo/svgaplayer/SVGAImageView;->antiAlias:Z

    .line 43
    iput-boolean p1, p0, Lcom/immomo/svgaplayer/SVGAImageView;->autoPlay:Z

    .line 44
    sget-object p1, Lcom/immomo/svgaplayer/SVGAImageView$FillMode;->Forward:Lcom/immomo/svgaplayer/SVGAImageView$FillMode;

    iput-object p1, p0, Lcom/immomo/svgaplayer/SVGAImageView;->fillMode:Lcom/immomo/svgaplayer/SVGAImageView$FillMode;

    .line 45
    invoke-direct {p0}, Lcom/immomo/svgaplayer/SVGAImageView;->setSoftwareLayerType()V

    if-eqz p2, :cond_0

    .line 46
    invoke-direct {p0, p2}, Lcom/immomo/svgaplayer/SVGAImageView;->loadAttrs(Landroid/util/AttributeSet;)V

    :cond_0
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

    .line 47
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 48
    const-string p1, "SVGAImageView"

    iput-object p1, p0, Lcom/immomo/svgaplayer/SVGAImageView;->TAG:Ljava/lang/String;

    const/4 p1, 0x1

    .line 49
    iput-boolean p1, p0, Lcom/immomo/svgaplayer/SVGAImageView;->clearsAfterStop:Z

    .line 50
    iput-boolean p1, p0, Lcom/immomo/svgaplayer/SVGAImageView;->addCache:Z

    .line 51
    iput-boolean p1, p0, Lcom/immomo/svgaplayer/SVGAImageView;->antiAlias:Z

    .line 52
    iput-boolean p1, p0, Lcom/immomo/svgaplayer/SVGAImageView;->autoPlay:Z

    .line 53
    sget-object p1, Lcom/immomo/svgaplayer/SVGAImageView$FillMode;->Forward:Lcom/immomo/svgaplayer/SVGAImageView$FillMode;

    iput-object p1, p0, Lcom/immomo/svgaplayer/SVGAImageView;->fillMode:Lcom/immomo/svgaplayer/SVGAImageView$FillMode;

    .line 54
    invoke-direct {p0}, Lcom/immomo/svgaplayer/SVGAImageView;->setSoftwareLayerType()V

    if-eqz p2, :cond_0

    .line 55
    invoke-direct {p0, p2}, Lcom/immomo/svgaplayer/SVGAImageView;->loadAttrs(Landroid/util/AttributeSet;)V

    :cond_0
    return-void
.end method

.method public static final synthetic access$getAnimator$p(Lcom/immomo/svgaplayer/SVGAImageView;)Landroid/animation/ValueAnimator;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/immomo/svgaplayer/SVGAImageView;->animator:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic access$getCallback$p(Lcom/immomo/svgaplayer/SVGAImageView;)Lcom/immomo/svgaplayer/listener/SVGACallback;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/immomo/svgaplayer/SVGAImageView;->callback:Lcom/immomo/svgaplayer/listener/SVGACallback;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic access$getTaskTag(Lcom/immomo/svgaplayer/SVGAImageView;)Ljava/lang/Object;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/immomo/svgaplayer/SVGAImageView;->getTaskTag()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static final synthetic access$isAnimating$p(Lcom/immomo/svgaplayer/SVGAImageView;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/immomo/svgaplayer/SVGAImageView;->isAnimating:Z

    .line 2
    .line 3
    return p0
.end method

.method public static final synthetic access$isPause$p(Lcom/immomo/svgaplayer/SVGAImageView;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/immomo/svgaplayer/SVGAImageView;->isPause:Z

    .line 2
    .line 3
    return p0
.end method

.method public static final synthetic access$setAnimating$p(Lcom/immomo/svgaplayer/SVGAImageView;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/svgaplayer/SVGAImageView;->isAnimating:Z

    .line 2
    .line 3
    return-void
.end method

.method public static final synthetic access$setAnimator$p(Lcom/immomo/svgaplayer/SVGAImageView;Landroid/animation/ValueAnimator;)V
    .locals 0
    .param p1    # Landroid/animation/ValueAnimator;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/immomo/svgaplayer/SVGAImageView;->animator:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    return-void
.end method

.method public static final synthetic access$setCallback$p(Lcom/immomo/svgaplayer/SVGAImageView;Lcom/immomo/svgaplayer/listener/SVGACallback;)V
    .locals 0
    .param p1    # Lcom/immomo/svgaplayer/listener/SVGACallback;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/immomo/svgaplayer/SVGAImageView;->callback:Lcom/immomo/svgaplayer/listener/SVGACallback;

    .line 2
    .line 3
    return-void
.end method

.method public static final synthetic access$setPause$p(Lcom/immomo/svgaplayer/SVGAImageView;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/svgaplayer/SVGAImageView;->isPause:Z

    .line 2
    .line 3
    return-void
.end method

.method private final getTaskTag()Ljava/lang/Object;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/immomo/svgaplayer/SVGAImageView;->TAG:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method private final loadAttrs(Landroid/util/AttributeSet;)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    sget-object v1, Lcom/immomo/svgaplayer/R$styleable;->SVGAImageView:[I

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    invoke-virtual {v0, p1, v1, v2, v2}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    sget v0, Lcom/immomo/svgaplayer/R$styleable;->SVGAImageView_loopCount:I

    .line 20
    .line 21
    invoke-virtual {p1, v0, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    invoke-virtual {p0, v0}, Lcom/immomo/svgaplayer/SVGAImageView;->setLoops(I)V

    .line 26
    .line 27
    .line 28
    sget v0, Lcom/immomo/svgaplayer/R$styleable;->SVGAImageView_addCache:I

    .line 29
    .line 30
    const/4 v1, 0x1

    .line 31
    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    iput-boolean v0, p0, Lcom/immomo/svgaplayer/SVGAImageView;->addCache:Z

    .line 36
    .line 37
    sget v0, Lcom/immomo/svgaplayer/R$styleable;->SVGAImageView_clearsAfterStop:I

    .line 38
    .line 39
    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    iput-boolean v0, p0, Lcom/immomo/svgaplayer/SVGAImageView;->clearsAfterStop:Z

    .line 44
    .line 45
    sget v0, Lcom/immomo/svgaplayer/R$styleable;->SVGAImageView_startFrame:I

    .line 46
    .line 47
    invoke-virtual {p1, v0, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    iput v0, p0, Lcom/immomo/svgaplayer/SVGAImageView;->mStartFrame:I

    .line 52
    .line 53
    sget v0, Lcom/immomo/svgaplayer/R$styleable;->SVGAImageView_endFrame:I

    .line 54
    .line 55
    invoke-virtual {p1, v0, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    iput v0, p0, Lcom/immomo/svgaplayer/SVGAImageView;->mEndFrame:I

    .line 60
    .line 61
    sget v0, Lcom/immomo/svgaplayer/R$styleable;->SVGAImageView_antiAlias:I

    .line 62
    .line 63
    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    iput-boolean v0, p0, Lcom/immomo/svgaplayer/SVGAImageView;->antiAlias:Z

    .line 68
    .line 69
    sget v0, Lcom/immomo/svgaplayer/R$styleable;->SVGAImageView_autoPlay:I

    .line 70
    .line 71
    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    iput-boolean v0, p0, Lcom/immomo/svgaplayer/SVGAImageView;->autoPlay:Z

    .line 76
    .line 77
    sget v0, Lcom/immomo/svgaplayer/R$styleable;->SVGAImageView_fillMode:I

    .line 78
    .line 79
    invoke-virtual {p1, v0}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    if-eqz v0, :cond_1

    .line 84
    .line 85
    const-string v1, "0"

    .line 86
    .line 87
    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result v1

    .line 91
    if-eqz v1, :cond_0

    .line 92
    .line 93
    sget-object v0, Lcom/immomo/svgaplayer/SVGAImageView$FillMode;->Backward:Lcom/immomo/svgaplayer/SVGAImageView$FillMode;

    .line 94
    .line 95
    iput-object v0, p0, Lcom/immomo/svgaplayer/SVGAImageView;->fillMode:Lcom/immomo/svgaplayer/SVGAImageView$FillMode;

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_0
    const-string v1, "1"

    .line 99
    .line 100
    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    if-eqz v0, :cond_1

    .line 105
    .line 106
    sget-object v0, Lcom/immomo/svgaplayer/SVGAImageView$FillMode;->Forward:Lcom/immomo/svgaplayer/SVGAImageView$FillMode;

    .line 107
    .line 108
    iput-object v0, p0, Lcom/immomo/svgaplayer/SVGAImageView;->fillMode:Lcom/immomo/svgaplayer/SVGAImageView$FillMode;

    .line 109
    .line 110
    :cond_1
    :goto_0
    sget v0, Lcom/immomo/svgaplayer/R$styleable;->SVGAImageView_source:I

    .line 111
    .line 112
    invoke-virtual {p1, v0}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    if-eqz v0, :cond_4

    .line 117
    .line 118
    new-instance v1, Lcom/immomo/svgaplayer/SVGAParser;

    .line 119
    .line 120
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 121
    .line 122
    .line 123
    move-result-object v3

    .line 124
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 125
    .line 126
    .line 127
    invoke-direct {v1, v3}, Lcom/immomo/svgaplayer/SVGAParser;-><init>(Landroid/content/Context;)V

    .line 128
    .line 129
    .line 130
    const-string v3, "http://"

    .line 131
    .line 132
    const/4 v4, 0x2

    .line 133
    const/4 v5, 0x0

    .line 134
    invoke-static {v0, v3, v2, v4, v5}, Lkotlin/text/d;->J(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    .line 135
    .line 136
    .line 137
    move-result v3

    .line 138
    if-nez v3, :cond_3

    .line 139
    .line 140
    const-string v3, "https://"

    .line 141
    .line 142
    invoke-static {v0, v3, v2, v4, v5}, Lkotlin/text/d;->J(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    .line 143
    .line 144
    .line 145
    move-result v2

    .line 146
    if-eqz v2, :cond_2

    .line 147
    .line 148
    goto :goto_1

    .line 149
    :cond_2
    invoke-virtual {v1, v0, p0}, Lcom/immomo/svgaplayer/SVGAParser;->parse(Ljava/lang/String;Lcom/immomo/svgaplayer/SVGAParser$ParseCompletion;)V

    .line 150
    .line 151
    .line 152
    goto :goto_2

    .line 153
    :cond_3
    :goto_1
    new-instance v2, Ljava/net/URL;

    .line 154
    .line 155
    invoke-direct {v2, v0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 156
    .line 157
    .line 158
    invoke-virtual {v1, v2, p0}, Lcom/immomo/svgaplayer/SVGAParser;->parse(Ljava/net/URL;Lcom/immomo/svgaplayer/SVGAParser$ParseCompletion;)V

    .line 159
    .line 160
    .line 161
    :cond_4
    :goto_2
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 162
    .line 163
    .line 164
    return-void
.end method

.method private final setAnimating(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/svgaplayer/SVGAImageView;->isAnimating:Z

    .line 2
    .line 3
    return-void
.end method

.method private final setSoftwareLayerType()V
    .locals 0

    return-void
.end method

.method public static bridge synthetic startAnimation$default(Lcom/immomo/svgaplayer/SVGAImageView;Lcom/immomo/svgaplayer/SVGARange;ZILjava/lang/Object;)V
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
    invoke-virtual {p0, p1, p2}, Lcom/immomo/svgaplayer/SVGAImageView;->startAnimation(Lcom/immomo/svgaplayer/SVGARange;Z)V

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


# virtual methods
.method public final getAddCache()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/immomo/svgaplayer/SVGAImageView;->addCache:Z

    .line 2
    .line 3
    return p0
.end method

.method public final getAntiAlias()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/immomo/svgaplayer/SVGAImageView;->antiAlias:Z

    .line 2
    .line 3
    return p0
.end method

.method public final getAutoPlay()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/immomo/svgaplayer/SVGAImageView;->autoPlay:Z

    .line 2
    .line 3
    return p0
.end method

.method public final getCallBack()Lcom/immomo/svgaplayer/SVGAAnimListenerAdapter;
    .locals 2
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/immomo/svgaplayer/SVGAImageView;->callback:Lcom/immomo/svgaplayer/listener/SVGACallback;

    .line 2
    .line 3
    instance-of v0, p0, Lcom/immomo/svgaplayer/SVGAAnimListenerAdapter;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    check-cast p0, Lcom/immomo/svgaplayer/SVGAAnimListenerAdapter;

    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_0
    const-string p0, "null cannot be cast to non-null type com.immomo.svgaplayer.SVGAAnimListenerAdapter"

    .line 14
    .line 15
    invoke-static {p0}, Lb;->a(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    :cond_1
    return-object v1
.end method

.method public final getClearsAfterStop()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/immomo/svgaplayer/SVGAImageView;->clearsAfterStop:Z

    .line 2
    .line 3
    return p0
.end method

.method public final getFillMode()Lcom/immomo/svgaplayer/SVGAImageView$FillMode;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/immomo/svgaplayer/SVGAImageView;->fillMode:Lcom/immomo/svgaplayer/SVGAImageView$FillMode;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getLoops()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/svgaplayer/SVGAImageView;->loops:I

    .line 2
    .line 3
    return p0
.end method

.method public final getMEndFrame()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/svgaplayer/SVGAImageView;->mEndFrame:I

    .line 2
    .line 3
    return p0
.end method

.method public final getMStartFrame()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/svgaplayer/SVGAImageView;->mStartFrame:I

    .line 2
    .line 3
    return p0
.end method

.method public final isAnimating()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/immomo/svgaplayer/SVGAImageView;->isAnimating:Z

    .line 2
    .line 3
    return p0
.end method

.method public onComplete(Lcom/immomo/svgaplayer/SVGAVideoEntity;)V
    .locals 2
    .param p1    # Lcom/immomo/svgaplayer/SVGAVideoEntity;
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
    new-instance v1, Lcom/immomo/svgaplayer/SVGAImageView$onComplete$1;

    .line 11
    .line 12
    invoke-direct {v1, p0, p1}, Lcom/immomo/svgaplayer/SVGAImageView$onComplete$1;-><init>(Lcom/immomo/svgaplayer/SVGAImageView;Lcom/immomo/svgaplayer/SVGAVideoEntity;)V

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
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/widget/ImageView;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer;->Companion:Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer$Companion;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer$Companion;->getMSVGAThreadAdapter()Lcom/immomo/svgaplayer/adapter/SVGAThreadAdapter;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-direct {p0}, Lcom/immomo/svgaplayer/SVGAImageView;->getTaskTag()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-interface {v0, v1}, Lcom/immomo/svgaplayer/adapter/SVGAThreadAdapter;->cancelTaskByTag(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Lcom/immomo/svgaplayer/SVGAImageView;->animator:Landroid/animation/ValueAnimator;

    .line 20
    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 24
    .line 25
    .line 26
    :cond_1
    iget-object v0, p0, Lcom/immomo/svgaplayer/SVGAImageView;->animator:Landroid/animation/ValueAnimator;

    .line 27
    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    invoke-virtual {v0}, Landroid/animation/Animator;->removeAllListeners()V

    .line 31
    .line 32
    .line 33
    :cond_2
    iget-object v0, p0, Lcom/immomo/svgaplayer/SVGAImageView;->animator:Landroid/animation/ValueAnimator;

    .line 34
    .line 35
    if-eqz v0, :cond_3

    .line 36
    .line 37
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->removeAllUpdateListeners()V

    .line 38
    .line 39
    .line 40
    :cond_3
    const/4 v0, 0x0

    .line 41
    iput-object v0, p0, Lcom/immomo/svgaplayer/SVGAImageView;->callback:Lcom/immomo/svgaplayer/listener/SVGACallback;

    .line 42
    .line 43
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
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/immomo/svgaplayer/SVGAImageView;->isPause:Z

    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-virtual {p0, v0}, Lcom/immomo/svgaplayer/SVGAImageView;->stopAnimation(Z)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/immomo/svgaplayer/SVGAImageView;->callback:Lcom/immomo/svgaplayer/listener/SVGACallback;

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    invoke-interface {p0}, Lcom/immomo/svgaplayer/listener/SVGACallback;->onPause()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public final setAddCache(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/svgaplayer/SVGAImageView;->addCache:Z

    .line 2
    .line 3
    return-void
.end method

.method public final setAntiAlias(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/svgaplayer/SVGAImageView;->antiAlias:Z

    .line 2
    .line 3
    return-void
.end method

.method public final setAutoPlay(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/svgaplayer/SVGAImageView;->autoPlay:Z

    .line 2
    .line 3
    return-void
.end method

.method public setCallback(Lcom/immomo/svgaplayer/SVGAAnimListenerAdapter;)V
    .locals 0
    .param p1    # Lcom/immomo/svgaplayer/SVGAAnimListenerAdapter;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 4
    iput-object p1, p0, Lcom/immomo/svgaplayer/SVGAImageView;->callback:Lcom/immomo/svgaplayer/listener/SVGACallback;

    return-void
.end method

.method public final setCallback(Lcom/immomo/svgaplayer/listener/SVGACallback;)V
    .locals 0
    .param p1    # Lcom/immomo/svgaplayer/listener/SVGACallback;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/immomo/svgaplayer/SVGAImageView;->callback:Lcom/immomo/svgaplayer/listener/SVGACallback;

    .line 2
    .line 3
    return-void
.end method

.method public final setClearsAfterStop(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/svgaplayer/SVGAImageView;->clearsAfterStop:Z

    .line 2
    .line 3
    return-void
.end method

.method public final setFillMode(Lcom/immomo/svgaplayer/SVGAImageView$FillMode;)V
    .locals 0
    .param p1    # Lcom/immomo/svgaplayer/SVGAImageView$FillMode;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/immomo/svgaplayer/SVGAImageView;->fillMode:Lcom/immomo/svgaplayer/SVGAImageView$FillMode;

    .line 5
    .line 6
    return-void
.end method

.method public final setLoops(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/svgaplayer/SVGAImageView;->loops:I

    .line 2
    .line 3
    iget-object p0, p0, Lcom/immomo/svgaplayer/SVGAImageView;->animator:Landroid/animation/ValueAnimator;

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
    iput p1, p0, Lcom/immomo/svgaplayer/SVGAImageView;->mEndFrame:I

    .line 2
    .line 3
    return-void
.end method

.method public final setMStartFrame(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/svgaplayer/SVGAImageView;->mStartFrame:I

    .line 2
    .line 3
    return-void
.end method

.method public final setVideoItem(Lcom/immomo/svgaplayer/SVGAVideoEntity;)V
    .locals 1
    .param p1    # Lcom/immomo/svgaplayer/SVGAVideoEntity;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 21
    new-instance v0, Lcom/immomo/svgaplayer/SVGADynamicEntity;

    invoke-direct {v0}, Lcom/immomo/svgaplayer/SVGADynamicEntity;-><init>()V

    invoke-virtual {p0, p1, v0}, Lcom/immomo/svgaplayer/SVGAImageView;->setVideoItem(Lcom/immomo/svgaplayer/SVGAVideoEntity;Lcom/immomo/svgaplayer/SVGADynamicEntity;)V

    return-void
.end method

.method public final setVideoItem(Lcom/immomo/svgaplayer/SVGAVideoEntity;Lcom/immomo/svgaplayer/SVGADynamicEntity;)V
    .locals 1
    .param p1    # Lcom/immomo/svgaplayer/SVGAVideoEntity;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/immomo/svgaplayer/SVGADynamicEntity;
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
    new-instance v0, Lcom/immomo/svgaplayer/SVGADrawable;

    .line 8
    .line 9
    invoke-direct {v0, p1, p2}, Lcom/immomo/svgaplayer/SVGADrawable;-><init>(Lcom/immomo/svgaplayer/SVGAVideoEntity;Lcom/immomo/svgaplayer/SVGADynamicEntity;)V

    .line 10
    .line 11
    .line 12
    iget-boolean p1, p0, Lcom/immomo/svgaplayer/SVGAImageView;->clearsAfterStop:Z

    .line 13
    .line 14
    invoke-virtual {v0, p1}, Lcom/immomo/svgaplayer/SVGADrawable;->setCleared$svgalibrary_release(Z)V

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

    .line 227
    invoke-virtual {p0, v0, v1}, Lcom/immomo/svgaplayer/SVGAImageView;->startAnimation(Lcom/immomo/svgaplayer/SVGARange;Z)V

    return-void
.end method

.method public final startAnimation(Lcom/immomo/svgaplayer/SVGARange;Z)V
    .locals 9
    .param p1    # Lcom/immomo/svgaplayer/SVGARange;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/immomo/svgaplayer/SVGAImageView;->stopAnimation(Z)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    instance-of v2, v1, Lcom/immomo/svgaplayer/SVGADrawable;

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
    check-cast v7, Lcom/immomo/svgaplayer/SVGADrawable;

    .line 16
    .line 17
    if-eqz v7, :cond_f

    .line 18
    .line 19
    invoke-virtual {v7, v0}, Lcom/immomo/svgaplayer/SVGADrawable;->setCleared$svgalibrary_release(Z)V

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
    invoke-virtual {v7, v1}, Lcom/immomo/svgaplayer/SVGADrawable;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v7}, Lcom/immomo/svgaplayer/SVGADrawable;->getVideoItem()Lcom/immomo/svgaplayer/SVGAVideoEntity;

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
    invoke-virtual {p1}, Lcom/immomo/svgaplayer/SVGARange;->getLocation()I

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
    invoke-virtual {v1}, Lcom/immomo/svgaplayer/SVGAVideoEntity;->getFrames()I

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
    invoke-virtual {p1}, Lcom/immomo/svgaplayer/SVGARange;->getLocation()I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    :cond_2
    if-eqz p1, :cond_3

    .line 73
    .line 74
    invoke-virtual {p1}, Lcom/immomo/svgaplayer/SVGARange;->getLength()I

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
    iget v2, p0, Lcom/immomo/svgaplayer/SVGAImageView;->mStartFrame:I

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
    iget v5, p0, Lcom/immomo/svgaplayer/SVGAImageView;->mEndFrame:I

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
    iget v0, v3, Lkotlin/jvm/internal/Ref$IntRef;->element:I

    .line 114
    .line 115
    iget v2, v4, Lkotlin/jvm/internal/Ref$IntRef;->element:I

    .line 116
    .line 117
    filled-new-array {v0, v2}, [I

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    iput-object v0, p0, Lcom/immomo/svgaplayer/SVGAImageView;->animator:Landroid/animation/ValueAnimator;

    .line 126
    .line 127
    if-eqz v0, :cond_8

    .line 128
    .line 129
    new-instance v2, Landroid/view/animation/LinearInterpolator;

    .line 130
    .line 131
    invoke-direct {v2}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 132
    .line 133
    .line 134
    invoke-virtual {v0, v2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 135
    .line 136
    .line 137
    :cond_8
    iget-object v0, p0, Lcom/immomo/svgaplayer/SVGAImageView;->animator:Landroid/animation/ValueAnimator;

    .line 138
    .line 139
    if-eqz v0, :cond_9

    .line 140
    .line 141
    iget v2, v4, Lkotlin/jvm/internal/Ref$IntRef;->element:I

    .line 142
    .line 143
    iget v5, v3, Lkotlin/jvm/internal/Ref$IntRef;->element:I

    .line 144
    .line 145
    sub-int/2addr v2, v5

    .line 146
    add-int/lit8 v2, v2, 0x1

    .line 147
    .line 148
    const/16 v5, 0x3e8

    .line 149
    .line 150
    invoke-virtual {v1}, Lcom/immomo/svgaplayer/SVGAVideoEntity;->getFPS()I

    .line 151
    .line 152
    .line 153
    move-result v1

    .line 154
    div-int/2addr v5, v1

    .line 155
    mul-int/2addr v2, v5

    .line 156
    int-to-double v1, v2

    .line 157
    const-wide/high16 v5, 0x3ff0000000000000L    # 1.0

    .line 158
    .line 159
    div-double/2addr v1, v5

    .line 160
    double-to-long v1, v1

    .line 161
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 162
    .line 163
    .line 164
    :cond_9
    iget-object v0, p0, Lcom/immomo/svgaplayer/SVGAImageView;->animator:Landroid/animation/ValueAnimator;

    .line 165
    .line 166
    if-eqz v0, :cond_b

    .line 167
    .line 168
    iget v1, p0, Lcom/immomo/svgaplayer/SVGAImageView;->loops:I

    .line 169
    .line 170
    if-gtz v1, :cond_a

    .line 171
    .line 172
    const v1, 0x1869f

    .line 173
    .line 174
    .line 175
    goto :goto_4

    .line 176
    :cond_a
    add-int/lit8 v1, v1, -0x1

    .line 177
    .line 178
    :goto_4
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 179
    .line 180
    .line 181
    :cond_b
    iget-object v0, p0, Lcom/immomo/svgaplayer/SVGAImageView;->animator:Landroid/animation/ValueAnimator;

    .line 182
    .line 183
    if-eqz v0, :cond_c

    .line 184
    .line 185
    new-instance v1, Lcom/immomo/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$1;

    .line 186
    .line 187
    invoke-direct {v1, p0, p1, v7, p2}, Lcom/immomo/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$1;-><init>(Lcom/immomo/svgaplayer/SVGAImageView;Lcom/immomo/svgaplayer/SVGARange;Lcom/immomo/svgaplayer/SVGADrawable;Z)V

    .line 188
    .line 189
    .line 190
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 191
    .line 192
    .line 193
    :cond_c
    iget-object v0, p0, Lcom/immomo/svgaplayer/SVGAImageView;->animator:Landroid/animation/ValueAnimator;

    .line 194
    .line 195
    if-eqz v0, :cond_d

    .line 196
    .line 197
    new-instance v2, Lcom/immomo/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$2;

    .line 198
    .line 199
    move-object v5, p0

    .line 200
    move-object v6, p1

    .line 201
    move v8, p2

    .line 202
    invoke-direct/range {v2 .. v8}, Lcom/immomo/svgaplayer/SVGAImageView$startAnimation$$inlined$let$lambda$2;-><init>(Lkotlin/jvm/internal/Ref$IntRef;Lkotlin/jvm/internal/Ref$IntRef;Lcom/immomo/svgaplayer/SVGAImageView;Lcom/immomo/svgaplayer/SVGARange;Lcom/immomo/svgaplayer/SVGADrawable;Z)V

    .line 203
    .line 204
    .line 205
    invoke-virtual {v0, v2}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 206
    .line 207
    .line 208
    goto :goto_5

    .line 209
    :cond_d
    move-object v5, p0

    .line 210
    move v8, p2

    .line 211
    :goto_5
    iget-object p0, v5, Lcom/immomo/svgaplayer/SVGAImageView;->animator:Landroid/animation/ValueAnimator;

    .line 212
    .line 213
    if-eqz v8, :cond_e

    .line 214
    .line 215
    if-eqz p0, :cond_f

    .line 216
    .line 217
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->reverse()V

    .line 218
    .line 219
    .line 220
    return-void

    .line 221
    :cond_e
    if-eqz p0, :cond_f

    .line 222
    .line 223
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 224
    .line 225
    .line 226
    :cond_f
    return-void
.end method

.method public final stepToFrame(IZ)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/immomo/svgaplayer/SVGAImageView;->pauseAnimation()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    instance-of v1, v0, Lcom/immomo/svgaplayer/SVGADrawable;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    :cond_0
    check-cast v0, Lcom/immomo/svgaplayer/SVGADrawable;

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {v0, p1}, Lcom/immomo/svgaplayer/SVGADrawable;->setCurrentFrame$svgalibrary_release(I)V

    .line 18
    .line 19
    .line 20
    if-eqz p2, :cond_1

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/immomo/svgaplayer/SVGAImageView;->startAnimation()V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Lcom/immomo/svgaplayer/SVGAImageView;->animator:Landroid/animation/ValueAnimator;

    .line 26
    .line 27
    if-eqz p0, :cond_1

    .line 28
    .line 29
    int-to-float p1, p1

    .line 30
    invoke-virtual {v0}, Lcom/immomo/svgaplayer/SVGADrawable;->getVideoItem()Lcom/immomo/svgaplayer/SVGAVideoEntity;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    invoke-virtual {p2}, Lcom/immomo/svgaplayer/SVGAVideoEntity;->getFrames()I

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
    instance-of v1, v0, Lcom/immomo/svgaplayer/SVGADrawable;

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    :cond_0
    check-cast v0, Lcom/immomo/svgaplayer/SVGADrawable;

    .line 11
    .line 12
    if-eqz v0, :cond_2

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/immomo/svgaplayer/SVGADrawable;->getVideoItem()Lcom/immomo/svgaplayer/SVGAVideoEntity;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v1}, Lcom/immomo/svgaplayer/SVGAVideoEntity;->getFrames()I

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
    invoke-virtual {v0}, Lcom/immomo/svgaplayer/SVGADrawable;->getVideoItem()Lcom/immomo/svgaplayer/SVGAVideoEntity;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    invoke-virtual {p2}, Lcom/immomo/svgaplayer/SVGAVideoEntity;->getFrames()I

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
    invoke-virtual {v0}, Lcom/immomo/svgaplayer/SVGADrawable;->getVideoItem()Lcom/immomo/svgaplayer/SVGAVideoEntity;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {p1}, Lcom/immomo/svgaplayer/SVGAVideoEntity;->getFrames()I

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    add-int/lit8 p1, p1, -0x1

    .line 46
    .line 47
    :cond_1
    invoke-virtual {p0, p1, p3}, Lcom/immomo/svgaplayer/SVGAImageView;->stepToFrame(IZ)V

    .line 48
    .line 49
    .line 50
    :cond_2
    return-void
.end method

.method public final stopAnimation()V
    .locals 1

    .line 54
    iget-boolean v0, p0, Lcom/immomo/svgaplayer/SVGAImageView;->clearsAfterStop:Z

    invoke-virtual {p0, v0}, Lcom/immomo/svgaplayer/SVGAImageView;->stopAnimation(Z)V

    return-void
.end method

.method public final stopAnimation(Z)V
    .locals 2

    .line 1
    sget-object v0, Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer;->Companion:Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer$Companion;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer$Companion;->getMSVGAThreadAdapter()Lcom/immomo/svgaplayer/adapter/SVGAThreadAdapter;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-direct {p0}, Lcom/immomo/svgaplayer/SVGAImageView;->getTaskTag()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-interface {v0, v1}, Lcom/immomo/svgaplayer/adapter/SVGAThreadAdapter;->cancelTaskByTag(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object v0, p0, Lcom/immomo/svgaplayer/SVGAImageView;->animator:Landroid/animation/ValueAnimator;

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 21
    .line 22
    .line 23
    :cond_1
    iget-object v0, p0, Lcom/immomo/svgaplayer/SVGAImageView;->animator:Landroid/animation/ValueAnimator;

    .line 24
    .line 25
    if-eqz v0, :cond_2

    .line 26
    .line 27
    invoke-virtual {v0}, Landroid/animation/Animator;->removeAllListeners()V

    .line 28
    .line 29
    .line 30
    :cond_2
    iget-object v0, p0, Lcom/immomo/svgaplayer/SVGAImageView;->animator:Landroid/animation/ValueAnimator;

    .line 31
    .line 32
    if-eqz v0, :cond_3

    .line 33
    .line 34
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->removeAllUpdateListeners()V

    .line 35
    .line 36
    .line 37
    :cond_3
    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    instance-of v0, p0, Lcom/immomo/svgaplayer/SVGADrawable;

    .line 42
    .line 43
    if-nez v0, :cond_4

    .line 44
    .line 45
    const/4 p0, 0x0

    .line 46
    :cond_4
    check-cast p0, Lcom/immomo/svgaplayer/SVGADrawable;

    .line 47
    .line 48
    if-eqz p0, :cond_5

    .line 49
    .line 50
    invoke-virtual {p0, p1}, Lcom/immomo/svgaplayer/SVGADrawable;->setCleared$svgalibrary_release(Z)V

    .line 51
    .line 52
    .line 53
    :cond_5
    return-void
.end method
