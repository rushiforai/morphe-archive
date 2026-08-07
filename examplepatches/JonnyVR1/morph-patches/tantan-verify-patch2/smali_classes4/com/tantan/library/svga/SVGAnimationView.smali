.class public Lcom/tantan/library/svga/SVGAnimationView;
.super Landroid/widget/ImageView;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;
.implements Landroid/animation/Animator$AnimatorListener;
.implements Landroid/animation/Animator$AnimatorPauseListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tantan/library/svga/SVGAnimationView$FrameMode;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0098\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u000b\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\r\n\u0002\u0018\u0002\n\u0002\u0008\u000b\n\u0002\u0010\u0007\n\u0002\u0008\u0005\u0008\u0016\u0018\u00002\u00020\u00012\u00020\u00022\u00020\u00032\u00020\u0004:\u0001hB/\u0008\u0007\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u0012\n\u0008\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0008\u0012\u0008\u0008\u0002\u0010\t\u001a\u00020\n\u0012\u0008\u0008\u0002\u0010\u000b\u001a\u00020\n\u00a2\u0006\u0002\u0010\u000cJ\u0006\u0010:\u001a\u00020;J\u0017\u0010<\u001a\u00020;2\u0008\u0008\u0002\u0010=\u001a\u00020\u0014H\u0000\u00a2\u0006\u0002\u0008>J\u0008\u0010?\u001a\u00020;H\u0002J\u0008\u0010@\u001a\u00020;H\u0002J\n\u0010A\u001a\u0004\u0018\u00010BH\u0002J\u0018\u0010C\u001a\u00020;2\u0006\u0010D\u001a\u00020\n2\u0006\u0010E\u001a\u00020\nH\u0002J\u0006\u0010F\u001a\u00020\u0014J\u0006\u0010G\u001a\u00020\u0014J\u0012\u0010H\u001a\u00020;2\u0008\u0010I\u001a\u0004\u0018\u00010JH\u0016J\u0012\u0010K\u001a\u00020;2\u0008\u0010I\u001a\u0004\u0018\u00010JH\u0016J\u0012\u0010L\u001a\u00020;2\u0008\u0010I\u001a\u0004\u0018\u00010JH\u0016J\u0012\u0010M\u001a\u00020;2\u0008\u0010I\u001a\u0004\u0018\u00010JH\u0016J\u0012\u0010N\u001a\u00020;2\u0008\u0010I\u001a\u0004\u0018\u00010JH\u0016J\u0012\u0010O\u001a\u00020;2\u0008\u0010I\u001a\u0004\u0018\u00010JH\u0016J\u0012\u0010P\u001a\u00020;2\u0008\u0010I\u001a\u0004\u0018\u00010\u001aH\u0016J\u0008\u0010Q\u001a\u00020;H\u0014J\u0008\u0010R\u001a\u00020;H\u0014J\u0018\u0010S\u001a\u00020;2\u0006\u0010T\u001a\u00020\n2\u0006\u0010U\u001a\u00020\nH\u0014J\u0010\u0010V\u001a\u00020\u00142\u0006\u0010W\u001a\u00020XH\u0017J\u0006\u0010Y\u001a\u00020;J\u0008\u0010Z\u001a\u00020;H\u0007J\u000e\u0010[\u001a\u00020;2\u0006\u0010\\\u001a\u00020(J\'\u0010]\u001a\u00020;2\u000e\u0010^\u001a\n\u0012\u0004\u0012\u000201\u0018\u0001002\u0008\u0010_\u001a\u0004\u0018\u00010 H\u0000\u00a2\u0006\u0002\u0008`J\u0006\u0010a\u001a\u00020;J\u0016\u0010b\u001a\u00020;2\u0006\u0010c\u001a\u00020d2\u0006\u0010e\u001a\u00020\u0014J\u0010\u0010f\u001a\u00020;2\u0008\u0008\u0002\u0010g\u001a\u00020\u0014R\u001c\u0010\r\u001a\u0004\u0018\u00010\u000eX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u000f\u0010\u0010\"\u0004\u0008\u0011\u0010\u0012R\u001a\u0010\u0013\u001a\u00020\u0014X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0015\u0010\u0016\"\u0004\u0008\u0017\u0010\u0018R\u0016\u0010\u0019\u001a\n \u001b*\u0004\u0018\u00010\u001a0\u001aX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001a\u0010\u001c\u001a\u00020\u0014X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u001d\u0010\u0016\"\u0004\u0008\u001e\u0010\u0018R\u0010\u0010\u001f\u001a\u0004\u0018\u00010 X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u001a\u0010!\u001a\u00020\"X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008#\u0010$\"\u0004\u0008%\u0010&R\u0010\u0010\'\u001a\u0004\u0018\u00010(X\u0082\u000e\u00a2\u0006\u0002\n\u0000R$\u0010*\u001a\u00020\n2\u0006\u0010)\u001a\u00020\n@@X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008+\u0010,\"\u0004\u0008-\u0010.R\u0016\u0010/\u001a\n\u0012\u0004\u0012\u000201\u0018\u000100X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u00102\u001a\u0004\u0018\u000103X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u001c\u00104\u001a\u0004\u0018\u000105X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u00086\u00107\"\u0004\u00088\u00109\u00a8\u0006i"
    }
    d2 = {
        "Lcom/tantan/library/svga/SVGAnimationView;",
        "Landroid/widget/ImageView;",
        "Landroid/animation/ValueAnimator$AnimatorUpdateListener;",
        "Landroid/animation/Animator$AnimatorListener;",
        "Landroid/animation/Animator$AnimatorPauseListener;",
        "context",
        "Landroid/content/Context;",
        "attrs",
        "Landroid/util/AttributeSet;",
        "defStyleAttr",
        "",
        "defStyleRes",
        "(Landroid/content/Context;Landroid/util/AttributeSet;II)V",
        "animListener",
        "Lcom/tantan/library/svga/AnimListener;",
        "getAnimListener",
        "()Lcom/tantan/library/svga/AnimListener;",
        "setAnimListener",
        "(Lcom/tantan/library/svga/AnimListener;)V",
        "audioEnable",
        "",
        "getAudioEnable$svga_lib_release",
        "()Z",
        "setAudioEnable$svga_lib_release",
        "(Z)V",
        "mAnimator",
        "Landroid/animation/ValueAnimator;",
        "kotlin.jvm.PlatformType",
        "mAutoPlay",
        "getMAutoPlay$svga_lib_release",
        "setMAutoPlay$svga_lib_release",
        "mDynamic",
        "Lcom/tantan/library/svga/compose/SVGADynamicEntity;",
        "mFillMode",
        "Lcom/tantan/library/svga/SVGAnimationView$FrameMode;",
        "getMFillMode$svga_lib_release",
        "()Lcom/tantan/library/svga/SVGAnimationView$FrameMode;",
        "setMFillMode$svga_lib_release",
        "(Lcom/tantan/library/svga/SVGAnimationView$FrameMode;)V",
        "mItemClickAreaListener",
        "Lcom/tantan/library/svga/SVGAClickAreaListener;",
        "value",
        "mLoops",
        "getMLoops$svga_lib_release",
        "()I",
        "setMLoops$svga_lib_release",
        "(I)V",
        "mResource",
        "Lcom/tantan/library/svga/data/cache/Resource;",
        "Lcom/tantan/library/svga/compose/SVGAVideoEntity;",
        "mResourceKey",
        "Lcom/tantan/library/svga/ResourceKey;",
        "requestCallback",
        "Lcom/tantan/library/svga/data/request/RequestCallback;",
        "getRequestCallback",
        "()Lcom/tantan/library/svga/data/request/RequestCallback;",
        "setRequestCallback",
        "(Lcom/tantan/library/svga/data/request/RequestCallback;)V",
        "clearDynamicData",
        "",
        "clearHistory",
        "keepResource",
        "clearHistory$svga_lib_release",
        "drawLastFrame",
        "fillData",
        "getSVGADrawable",
        "Lcom/tantan/library/svga/drawer/SVGADrawable;",
        "initAnimation",
        "fps",
        "frames",
        "isAnimating",
        "isPaused",
        "onAnimationCancel",
        "animation",
        "Landroid/animation/Animator;",
        "onAnimationEnd",
        "onAnimationPause",
        "onAnimationRepeat",
        "onAnimationResume",
        "onAnimationStart",
        "onAnimationUpdate",
        "onAttachedToWindow",
        "onDetachedFromWindow",
        "onMeasure",
        "widthMeasureSpec",
        "heightMeasureSpec",
        "onTouchEvent",
        "event",
        "Landroid/view/MotionEvent;",
        "pauseAnimation",
        "resumeAnimation",
        "setOnClickListener",
        "clickListener",
        "setResource",
        "resource",
        "dynamic",
        "setResource$svga_lib_release",
        "startAnimation",
        "stepToFrame",
        "percent",
        "",
        "andPlay",
        "stopAnimation",
        "clear",
        "FrameMode",
        "svga_lib_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# instance fields
.field private animListener:Lcom/tantan/library/svga/AnimListener;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private audioEnable:Z

.field private final mAnimator:Landroid/animation/ValueAnimator;

.field private mAutoPlay:Z

.field private mDynamic:Lcom/tantan/library/svga/compose/SVGADynamicEntity;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private mFillMode:Lcom/tantan/library/svga/SVGAnimationView$FrameMode;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private mItemClickAreaListener:Lcom/tantan/library/svga/SVGAClickAreaListener;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private mLoops:I

.field private mResource:Lcom/tantan/library/svga/data/cache/Resource;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantan/library/svga/data/cache/Resource<",
            "Lcom/tantan/library/svga/compose/SVGAVideoEntity;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private mResourceKey:Lcom/tantan/library/svga/ResourceKey;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private requestCallback:Lcom/tantan/library/svga/data/request/RequestCallback;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 7
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .line 29
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/16 v5, 0xe

    const/4 v6, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v6}, Lcom/tantan/library/svga/SVGAnimationView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;IIILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 7
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .line 26
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/16 v5, 0xc

    const/4 v6, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    invoke-direct/range {v0 .. v6}, Lcom/tantan/library/svga/SVGAnimationView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;IIILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 7
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .line 27
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/16 v5, 0x8

    const/4 v6, 0x0

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    invoke-direct/range {v0 .. v6}, Lcom/tantan/library/svga/SVGAnimationView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;IIILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 5
    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    iput-boolean p1, p0, Lcom/tantan/library/svga/SVGAnimationView;->mAutoPlay:Z

    .line 9
    .line 10
    sget-object p2, Lcom/tantan/library/svga/SVGAnimationView$FrameMode;->BEFORE:Lcom/tantan/library/svga/SVGAnimationView$FrameMode;

    .line 11
    .line 12
    iput-object p2, p0, Lcom/tantan/library/svga/SVGAnimationView;->mFillMode:Lcom/tantan/library/svga/SVGAnimationView$FrameMode;

    .line 13
    .line 14
    const/4 p2, 0x0

    .line 15
    filled-new-array {p2, p1}, [I

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    iput-object p1, p0, Lcom/tantan/library/svga/SVGAnimationView;->mAnimator:Landroid/animation/ValueAnimator;

    .line 24
    .line 25
    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;IIILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 1

    and-int/lit8 p6, p5, 0x2

    if-eqz p6, :cond_0

    const/4 p2, 0x0

    :cond_0
    and-int/lit8 p6, p5, 0x4

    const/4 v0, 0x0

    if-eqz p6, :cond_1

    move p3, v0

    :cond_1
    and-int/lit8 p5, p5, 0x8

    if-eqz p5, :cond_2

    move p4, v0

    .line 28
    :cond_2
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/tantan/library/svga/SVGAnimationView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public static final synthetic access$drawLastFrame(Lcom/tantan/library/svga/SVGAnimationView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tantan/library/svga/SVGAnimationView;->drawLastFrame()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic clearHistory$svga_lib_release$default(Lcom/tantan/library/svga/SVGAnimationView;ZILjava/lang/Object;)V
    .locals 0

    .line 1
    if-nez p3, :cond_1

    .line 2
    .line 3
    and-int/lit8 p2, p2, 0x1

    .line 4
    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    :cond_0
    invoke-virtual {p0, p1}, Lcom/tantan/library/svga/SVGAnimationView;->clearHistory$svga_lib_release(Z)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_1
    const-string p0, "Super calls with default arguments not supported in this target, function: clearHistory"

    .line 13
    .line 14
    invoke-static {p0}, Ll/pr3;->a(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static d(Lcom/tantan/library/svga/SVGAnimationView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/tantan/library/svga/SVGAnimationView;->mAnimator:Landroid/animation/ValueAnimator;

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private final drawLastFrame()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/tantan/library/svga/SVGAnimationView;->mAnimator:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/tantan/library/svga/SVGAnimationView;->mFillMode:Lcom/tantan/library/svga/SVGAnimationView$FrameMode;

    .line 4
    .line 5
    sget-object v1, Lcom/tantan/library/svga/SVGAnimationView$FrameMode;->AFTER:Lcom/tantan/library/svga/SVGAnimationView$FrameMode;

    .line 6
    .line 7
    if-ne p0, v1, :cond_0

    .line 8
    .line 9
    const-wide/16 v1, 0x0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->getDuration()J

    .line 13
    .line 14
    .line 15
    move-result-wide v1

    .line 16
    :goto_0
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setCurrentPlayTime(J)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method private final fillData()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/tantan/library/svga/SVGAnimationView;->mResource:Lcom/tantan/library/svga/data/cache/Resource;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/tantan/library/svga/data/cache/Resource;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lcom/tantan/library/svga/compose/SVGAVideoEntity;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    new-instance v1, Lcom/tantan/library/svga/drawer/SVGADrawable;

    .line 14
    .line 15
    iget-object v2, p0, Lcom/tantan/library/svga/SVGAnimationView;->mDynamic:Lcom/tantan/library/svga/compose/SVGADynamicEntity;

    .line 16
    .line 17
    invoke-direct {v1, p0, v0, v2}, Lcom/tantan/library/svga/drawer/SVGADrawable;-><init>(Landroid/widget/ImageView;Lcom/tantan/library/svga/compose/SVGAVideoEntity;Lcom/tantan/library/svga/compose/SVGADynamicEntity;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/tantan/library/svga/compose/SVGAVideoEntity;->getFps()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    invoke-virtual {v0}, Lcom/tantan/library/svga/compose/SVGAVideoEntity;->getFrames()I

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    invoke-direct {p0, v1, v2}, Lcom/tantan/library/svga/SVGAnimationView;->initAnimation(II)V

    .line 32
    .line 33
    .line 34
    iget-boolean v1, p0, Lcom/tantan/library/svga/SVGAnimationView;->audioEnable:Z

    .line 35
    .line 36
    new-instance v2, Lcom/tantan/library/svga/SVGAnimationView$fillData$1$1;

    .line 37
    .line 38
    invoke-direct {v2, p0}, Lcom/tantan/library/svga/SVGAnimationView$fillData$1$1;-><init>(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, v1, v2}, Lcom/tantan/library/svga/compose/SVGAVideoEntity;->checkAndParserAudio(ZLkotlin/jvm/functions/Function0;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_0
    const/4 v0, 0x0

    .line 49
    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method private final getSVGADrawable()Lcom/tantan/library/svga/drawer/SVGADrawable;
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    instance-of v0, p0, Lcom/tantan/library/svga/drawer/SVGADrawable;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    check-cast p0, Lcom/tantan/library/svga/drawer/SVGADrawable;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return-object p0
.end method

.method private final initAnimation(II)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/tantan/library/svga/SVGAnimationView;->mAnimator:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    add-int/lit8 v1, p2, -0x1

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    filled-new-array {v2, v1}, [I

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setIntValues([I)V

    .line 11
    .line 12
    .line 13
    new-instance v1, Landroid/view/animation/LinearInterpolator;

    .line 14
    .line 15
    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 19
    .line 20
    .line 21
    const-wide/16 v1, 0x3e8

    .line 22
    .line 23
    int-to-long v3, p2

    .line 24
    mul-long/2addr v3, v1

    .line 25
    int-to-long p1, p1

    .line 26
    div-long/2addr v3, p1

    .line 27
    invoke-virtual {v0, v3, v4}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 28
    .line 29
    .line 30
    iget p0, p0, Lcom/tantan/library/svga/SVGAnimationView;->mLoops:I

    .line 31
    .line 32
    const/4 p1, 0x1

    .line 33
    if-lez p0, :cond_0

    .line 34
    .line 35
    sub-int/2addr p0, p1

    .line 36
    goto :goto_0

    .line 37
    :cond_0
    const/4 p0, -0x1

    .line 38
    :goto_0
    invoke-virtual {v0, p0}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, p1}, Landroid/animation/ValueAnimator;->setRepeatMode(I)V

    .line 42
    .line 43
    .line 44
    const-wide/16 p0, 0x0

    .line 45
    .line 46
    invoke-virtual {v0, p0, p1}, Landroid/animation/ValueAnimator;->setCurrentPlayTime(J)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public static synthetic stopAnimation$default(Lcom/tantan/library/svga/SVGAnimationView;ZILjava/lang/Object;)V
    .locals 0

    .line 1
    if-nez p3, :cond_1

    .line 2
    .line 3
    and-int/lit8 p2, p2, 0x1

    .line 4
    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    :cond_0
    invoke-virtual {p0, p1}, Lcom/tantan/library/svga/SVGAnimationView;->stopAnimation(Z)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_1
    const-string p0, "Super calls with default arguments not supported in this target, function: stopAnimation"

    .line 13
    .line 14
    invoke-static {p0}, Ll/pr3;->a(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public final clearDynamicData()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantan/library/svga/SVGAnimationView;->mDynamic:Lcom/tantan/library/svga/compose/SVGADynamicEntity;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/tantan/library/svga/compose/SVGADynamicEntity;->clearDynamicObjects()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final clearHistory$svga_lib_release(Z)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_1

    .line 3
    .line 4
    iget-object p1, p0, Lcom/tantan/library/svga/SVGAnimationView;->mResource:Lcom/tantan/library/svga/data/cache/Resource;

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    invoke-interface {p1}, Lcom/tantan/library/svga/data/cache/Resource;->release()V

    .line 9
    .line 10
    .line 11
    :cond_0
    iput-object v0, p0, Lcom/tantan/library/svga/SVGAnimationView;->mResource:Lcom/tantan/library/svga/data/cache/Resource;

    .line 12
    .line 13
    :cond_1
    iput-object v0, p0, Lcom/tantan/library/svga/SVGAnimationView;->mDynamic:Lcom/tantan/library/svga/compose/SVGADynamicEntity;

    .line 14
    .line 15
    iput-object v0, p0, Lcom/tantan/library/svga/SVGAnimationView;->mResourceKey:Lcom/tantan/library/svga/ResourceKey;

    .line 16
    .line 17
    return-void
.end method

.method public final getAnimListener()Lcom/tantan/library/svga/AnimListener;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/library/svga/SVGAnimationView;->animListener:Lcom/tantan/library/svga/AnimListener;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getAudioEnable$svga_lib_release()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tantan/library/svga/SVGAnimationView;->audioEnable:Z

    .line 2
    .line 3
    return p0
.end method

.method public final getMAutoPlay$svga_lib_release()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tantan/library/svga/SVGAnimationView;->mAutoPlay:Z

    .line 2
    .line 3
    return p0
.end method

.method public final getMFillMode$svga_lib_release()Lcom/tantan/library/svga/SVGAnimationView$FrameMode;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/library/svga/SVGAnimationView;->mFillMode:Lcom/tantan/library/svga/SVGAnimationView$FrameMode;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getMLoops$svga_lib_release()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tantan/library/svga/SVGAnimationView;->mLoops:I

    .line 2
    .line 3
    return p0
.end method

.method public final getRequestCallback()Lcom/tantan/library/svga/data/request/RequestCallback;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/library/svga/SVGAnimationView;->requestCallback:Lcom/tantan/library/svga/data/request/RequestCallback;

    .line 2
    .line 3
    return-object p0
.end method

.method public final isAnimating()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/tantan/library/svga/SVGAnimationView;->isPaused()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/tantan/library/svga/SVGAnimationView;->mAnimator:Landroid/animation/ValueAnimator;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public final isPaused()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantan/library/svga/SVGAnimationView;->mAnimator:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/animation/Animator;->isPaused()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0
    .param p1    # Landroid/animation/Animator;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 0
    .param p1    # Landroid/animation/Animator;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Lcom/tantan/library/svga/SVGAnimationView;->drawLastFrame()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/tantan/library/svga/SVGAnimationView;->animListener:Lcom/tantan/library/svga/AnimListener;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/tantan/library/svga/AnimListener;->onFinished()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public onAnimationPause(Landroid/animation/Animator;)V
    .locals 0
    .param p1    # Landroid/animation/Animator;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Lcom/tantan/library/svga/SVGAnimationView;->getSVGADrawable()Lcom/tantan/library/svga/drawer/SVGADrawable;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/library/svga/drawer/SVGADrawable;->pause$svga_lib_release()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0
    .param p1    # Landroid/animation/Animator;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Lcom/tantan/library/svga/SVGAnimationView;->animListener:Lcom/tantan/library/svga/AnimListener;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/tantan/library/svga/AnimListener;->onRepeat()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public onAnimationResume(Landroid/animation/Animator;)V
    .locals 0
    .param p1    # Landroid/animation/Animator;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Lcom/tantan/library/svga/SVGAnimationView;->getSVGADrawable()Lcom/tantan/library/svga/drawer/SVGADrawable;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/library/svga/drawer/SVGADrawable;->resume$svga_lib_release()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0
    .param p1    # Landroid/animation/Animator;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Lcom/tantan/library/svga/SVGAnimationView;->animListener:Lcom/tantan/library/svga/AnimListener;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/tantan/library/svga/AnimListener;->onStart()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 1
    .param p1    # Landroid/animation/ValueAnimator;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Lcom/tantan/library/svga/SVGAnimationView;->getSVGADrawable()Lcom/tantan/library/svga/drawer/SVGADrawable;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p1, 0x0

    .line 15
    :goto_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 16
    .line 17
    .line 18
    check-cast p1, Ljava/lang/Integer;

    .line 19
    .line 20
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    invoke-virtual {v0, p1}, Lcom/tantan/library/svga/drawer/SVGADrawable;->setCurrentFrame$svga_lib_release(I)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/tantan/library/svga/SVGAnimationView;->animListener:Lcom/tantan/library/svga/AnimListener;

    .line 28
    .line 29
    if-eqz p0, :cond_1

    .line 30
    .line 31
    invoke-virtual {v0}, Lcom/tantan/library/svga/drawer/SVGADrawable;->getCurrentFrame()I

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    invoke-virtual {p0, p1}, Lcom/tantan/library/svga/AnimListener;->onStep(I)V

    .line 36
    .line 37
    .line 38
    :cond_1
    return-void
.end method

.method public onAttachedToWindow()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/tantan/library/svga/SVGAnimationView;->mAnimator:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p0}, Landroid/animation/Animator;->addPauseListener(Landroid/animation/Animator$AnimatorPauseListener;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {v0, p0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 10
    .line 11
    .line 12
    invoke-super {p0}, Landroid/widget/ImageView;->onAttachedToWindow()V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/tantan/library/svga/SVGAnimationView;->mResourceKey:Lcom/tantan/library/svga/ResourceKey;

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    iget-object v1, p0, Lcom/tantan/library/svga/SVGAnimationView;->mResource:Lcom/tantan/library/svga/data/cache/Resource;

    .line 20
    .line 21
    if-nez v1, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 v0, 0x0

    .line 25
    :goto_0
    if-eqz v0, :cond_1

    .line 26
    .line 27
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 32
    .line 33
    .line 34
    invoke-static {v1}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    iget-object v2, p0, Lcom/tantan/library/svga/SVGAnimationView;->mDynamic:Lcom/tantan/library/svga/compose/SVGADynamicEntity;

    .line 39
    .line 40
    invoke-virtual {v1, p0, v0, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->startRequest$svga_lib_release(Lcom/tantan/library/svga/SVGAnimationView;Lcom/tantan/library/svga/ResourceKey;Lcom/tantan/library/svga/compose/SVGADynamicEntity;)V

    .line 41
    .line 42
    .line 43
    :cond_1
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/tantan/library/svga/SVGAnimationView;->mAnimator:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/animation/Animator;->removeAllListeners()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->removeAllUpdateListeners()V

    .line 7
    .line 8
    .line 9
    sget-object v0, Lcom/tantan/library/svga/SVGALoader;->INSTANCE:Lcom/tantan/library/svga/SVGALoader;

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Lcom/tantan/library/svga/SVGALoader;->removeView(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 12
    .line 13
    .line 14
    invoke-super {p0}, Landroid/widget/ImageView;->onDetachedFromWindow()V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/tantan/library/svga/SVGAnimationView;->mResource:Lcom/tantan/library/svga/data/cache/Resource;

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/tantan/library/svga/SVGAnimationView;->isAnimating()Z

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    iput-boolean v2, p0, Lcom/tantan/library/svga/SVGAnimationView;->mAutoPlay:Z

    .line 27
    .line 28
    iput-object v1, p0, Lcom/tantan/library/svga/SVGAnimationView;->mResource:Lcom/tantan/library/svga/data/cache/Resource;

    .line 29
    .line 30
    invoke-interface {v0}, Lcom/tantan/library/svga/data/cache/Resource;->get()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    check-cast v2, Lcom/tantan/library/svga/compose/SVGAVideoEntity;

    .line 35
    .line 36
    invoke-virtual {v2}, Lcom/tantan/library/svga/compose/SVGAVideoEntity;->getKey()Lcom/tantan/library/svga/ResourceKey;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    iput-object v2, p0, Lcom/tantan/library/svga/SVGAnimationView;->mResourceKey:Lcom/tantan/library/svga/ResourceKey;

    .line 41
    .line 42
    invoke-interface {v0}, Lcom/tantan/library/svga/data/cache/Resource;->release()V

    .line 43
    .line 44
    .line 45
    :cond_0
    iget-object v0, p0, Lcom/tantan/library/svga/SVGAnimationView;->mAnimator:Landroid/animation/ValueAnimator;

    .line 46
    .line 47
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public onMeasure(II)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/tantan/library/svga/SVGAnimationView;->mResource:Lcom/tantan/library/svga/data/cache/Resource;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/tantan/library/svga/data/cache/Resource;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lcom/tantan/library/svga/compose/SVGAVideoEntity;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/tantan/library/svga/compose/SVGAVideoEntity;->getVideoSize()Landroid/graphics/Rect;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    invoke-virtual {v0}, Lcom/tantan/library/svga/compose/SVGAVideoEntity;->getVideoSize()Landroid/graphics/Rect;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 34
    .line 35
    .line 36
    move-result v4

    .line 37
    add-int/2addr v3, v4

    .line 38
    add-int/2addr v1, v3

    .line 39
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 44
    .line 45
    .line 46
    move-result v4

    .line 47
    add-int/2addr v3, v4

    .line 48
    add-int/2addr v2, v3

    .line 49
    invoke-virtual {p0}, Landroid/view/View;->getSuggestedMinimumWidth()I

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    invoke-static {v1, v3}, Lkotlin/ranges/a;->b(II)I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    invoke-virtual {p0}, Landroid/view/View;->getSuggestedMinimumHeight()I

    .line 58
    .line 59
    .line 60
    move-result v3

    .line 61
    invoke-static {v2, v3}, Lkotlin/ranges/a;->b(II)I

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    const/4 v3, 0x0

    .line 66
    invoke-static {v1, p1, v3}, Landroid/view/View;->resolveSizeAndState(III)I

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    invoke-static {v2, p2, v3}, Landroid/view/View;->resolveSizeAndState(III)I

    .line 71
    .line 72
    .line 73
    move-result p2

    .line 74
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    sub-int/2addr p1, v1

    .line 82
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    sub-int/2addr p1, v1

    .line 87
    invoke-static {p1, v3}, Lkotlin/ranges/a;->b(II)I

    .line 88
    .line 89
    .line 90
    move-result p1

    .line 91
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 92
    .line 93
    .line 94
    move-result v1

    .line 95
    sub-int/2addr p2, v1

    .line 96
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 97
    .line 98
    .line 99
    move-result p0

    .line 100
    sub-int/2addr p2, p0

    .line 101
    invoke-static {p2, v3}, Lkotlin/ranges/a;->b(II)I

    .line 102
    .line 103
    .line 104
    move-result p0

    .line 105
    invoke-virtual {v0, p1, p0}, Lcom/tantan/library/svga/compose/SVGAVideoEntity;->resizeBitmap(II)V

    .line 106
    .line 107
    .line 108
    return-void

    .line 109
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/widget/ImageView;->onMeasure(II)V

    .line 110
    .line 111
    .line 112
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 6
    .param p1    # Landroid/view/MotionEvent;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ClickableViewAccessibility"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0

    .line 15
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    int-to-float v1, v1

    .line 24
    sub-float/2addr v0, v1

    .line 25
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    int-to-float v2, v2

    .line 34
    sub-float/2addr v1, v2

    .line 35
    iget-object v2, p0, Lcom/tantan/library/svga/SVGAnimationView;->mDynamic:Lcom/tantan/library/svga/compose/SVGADynamicEntity;

    .line 36
    .line 37
    if-eqz v2, :cond_2

    .line 38
    .line 39
    invoke-virtual {v2}, Lcom/tantan/library/svga/compose/SVGADynamicEntity;->getMClickMap$svga_lib_release()Ljava/util/HashMap;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    :cond_1
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 52
    .line 53
    .line 54
    move-result v3

    .line 55
    if-eqz v3, :cond_2

    .line 56
    .line 57
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    check-cast v3, Ljava/util/Map$Entry;

    .line 62
    .line 63
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v4

    .line 67
    check-cast v4, Ljava/lang/String;

    .line 68
    .line 69
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    check-cast v3, [I

    .line 74
    .line 75
    const/4 v5, 0x0

    .line 76
    aget v5, v3, v5

    .line 77
    .line 78
    int-to-float v5, v5

    .line 79
    cmpl-float v5, v0, v5

    .line 80
    .line 81
    if-ltz v5, :cond_1

    .line 82
    .line 83
    const/4 v5, 0x2

    .line 84
    aget v5, v3, v5

    .line 85
    .line 86
    int-to-float v5, v5

    .line 87
    cmpg-float v5, v0, v5

    .line 88
    .line 89
    if-gtz v5, :cond_1

    .line 90
    .line 91
    const/4 v5, 0x1

    .line 92
    aget v5, v3, v5

    .line 93
    .line 94
    int-to-float v5, v5

    .line 95
    cmpl-float v5, v1, v5

    .line 96
    .line 97
    if-ltz v5, :cond_1

    .line 98
    .line 99
    const/4 v5, 0x3

    .line 100
    aget v3, v3, v5

    .line 101
    .line 102
    int-to-float v3, v3

    .line 103
    cmpg-float v3, v1, v3

    .line 104
    .line 105
    if-gtz v3, :cond_1

    .line 106
    .line 107
    iget-object v3, p0, Lcom/tantan/library/svga/SVGAnimationView;->mItemClickAreaListener:Lcom/tantan/library/svga/SVGAClickAreaListener;

    .line 108
    .line 109
    if-eqz v3, :cond_1

    .line 110
    .line 111
    invoke-interface {v3, v4}, Lcom/tantan/library/svga/SVGAClickAreaListener;->onClick(Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    goto :goto_0

    .line 115
    :cond_2
    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 116
    .line 117
    .line 118
    move-result p0

    .line 119
    return p0
.end method

.method public final pauseAnimation()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tantan/library/svga/SVGAnimationView;->mAnimator:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->pause()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/tantan/library/svga/SVGAnimationView;->animListener:Lcom/tantan/library/svga/AnimListener;

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/tantan/library/svga/AnimListener;->onPause()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public final resumeAnimation()V
    .locals 1
    .annotation runtime Lkotlin/Deprecated;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/tantan/library/svga/SVGAnimationView;->mAnimator:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->resume()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/tantan/library/svga/SVGAnimationView;->animListener:Lcom/tantan/library/svga/AnimListener;

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/tantan/library/svga/AnimListener;->onStart()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public final setAnimListener(Lcom/tantan/library/svga/AnimListener;)V
    .locals 0
    .param p1    # Lcom/tantan/library/svga/AnimListener;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/tantan/library/svga/SVGAnimationView;->animListener:Lcom/tantan/library/svga/AnimListener;

    .line 2
    .line 3
    return-void
.end method

.method public final setAudioEnable$svga_lib_release(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tantan/library/svga/SVGAnimationView;->audioEnable:Z

    .line 2
    .line 3
    return-void
.end method

.method public final setMAutoPlay$svga_lib_release(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tantan/library/svga/SVGAnimationView;->mAutoPlay:Z

    .line 2
    .line 3
    return-void
.end method

.method public final setMFillMode$svga_lib_release(Lcom/tantan/library/svga/SVGAnimationView$FrameMode;)V
    .locals 0
    .param p1    # Lcom/tantan/library/svga/SVGAnimationView$FrameMode;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/tantan/library/svga/SVGAnimationView;->mFillMode:Lcom/tantan/library/svga/SVGAnimationView$FrameMode;

    .line 5
    .line 6
    return-void
.end method

.method public final setMLoops$svga_lib_release(I)V
    .locals 0

    .line 1
    if-gez p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    :cond_0
    iput p1, p0, Lcom/tantan/library/svga/SVGAnimationView;->mLoops:I

    .line 5
    .line 6
    return-void
.end method

.method public final setOnClickListener(Lcom/tantan/library/svga/SVGAClickAreaListener;)V
    .locals 0
    .param p1    # Lcom/tantan/library/svga/SVGAClickAreaListener;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/tantan/library/svga/SVGAnimationView;->mItemClickAreaListener:Lcom/tantan/library/svga/SVGAClickAreaListener;

    .line 5
    .line 6
    return-void
.end method

.method public final setRequestCallback(Lcom/tantan/library/svga/data/request/RequestCallback;)V
    .locals 0
    .param p1    # Lcom/tantan/library/svga/data/request/RequestCallback;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/tantan/library/svga/SVGAnimationView;->requestCallback:Lcom/tantan/library/svga/data/request/RequestCallback;

    .line 2
    .line 3
    return-void
.end method

.method public final setResource$svga_lib_release(Lcom/tantan/library/svga/data/cache/Resource;Lcom/tantan/library/svga/compose/SVGADynamicEntity;)V
    .locals 2
    .param p1    # Lcom/tantan/library/svga/data/cache/Resource;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Lcom/tantan/library/svga/compose/SVGADynamicEntity;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantan/library/svga/data/cache/Resource<",
            "Lcom/tantan/library/svga/compose/SVGAVideoEntity;",
            ">;",
            "Lcom/tantan/library/svga/compose/SVGADynamicEntity;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/tantan/library/svga/SVGAnimationView;->mResource:Lcom/tantan/library/svga/data/cache/Resource;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tantan/library/svga/SVGAnimationView;->mDynamic:Lcom/tantan/library/svga/compose/SVGADynamicEntity;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/View;->isAttachedToWindow()Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    iput-object p1, p0, Lcom/tantan/library/svga/SVGAnimationView;->mResource:Lcom/tantan/library/svga/data/cache/Resource;

    .line 12
    .line 13
    invoke-direct {p0}, Lcom/tantan/library/svga/SVGAnimationView;->fillData()V

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 p2, 0x0

    .line 18
    iput-object p2, p0, Lcom/tantan/library/svga/SVGAnimationView;->mResource:Lcom/tantan/library/svga/data/cache/Resource;

    .line 19
    .line 20
    if-eqz p1, :cond_1

    .line 21
    .line 22
    invoke-interface {p1}, Lcom/tantan/library/svga/data/cache/Resource;->release()V

    .line 23
    .line 24
    .line 25
    :cond_1
    if-eqz p1, :cond_2

    .line 26
    .line 27
    invoke-interface {p1}, Lcom/tantan/library/svga/data/cache/Resource;->get()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    check-cast v1, Lcom/tantan/library/svga/compose/SVGAVideoEntity;

    .line 32
    .line 33
    if-eqz v1, :cond_2

    .line 34
    .line 35
    invoke-virtual {v1}, Lcom/tantan/library/svga/compose/SVGAVideoEntity;->getKey()Lcom/tantan/library/svga/ResourceKey;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    :cond_2
    iput-object p2, p0, Lcom/tantan/library/svga/SVGAnimationView;->mResourceKey:Lcom/tantan/library/svga/ResourceKey;

    .line 40
    .line 41
    :goto_0
    if-eqz v0, :cond_3

    .line 42
    .line 43
    if-eq v0, p1, :cond_3

    .line 44
    .line 45
    invoke-interface {v0}, Lcom/tantan/library/svga/data/cache/Resource;->release()V

    .line 46
    .line 47
    .line 48
    :cond_3
    return-void
.end method

.method public final startAnimation()V
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/tantan/library/svga/SVGAnimationView;->mAutoPlay:Z

    .line 3
    .line 4
    iget-object v1, p0, Lcom/tantan/library/svga/SVGAnimationView;->mAnimator:Landroid/animation/ValueAnimator;

    .line 5
    .line 6
    invoke-virtual {v1}, Landroid/animation/Animator;->isPaused()Z

    .line 7
    .line 8
    .line 9
    move-result v2

    .line 10
    if-eqz v2, :cond_0

    .line 11
    .line 12
    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->resume()V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-nez v2, :cond_2

    .line 21
    .line 22
    iget p0, p0, Lcom/tantan/library/svga/SVGAnimationView;->mLoops:I

    .line 23
    .line 24
    if-lez p0, :cond_1

    .line 25
    .line 26
    sub-int/2addr p0, v0

    .line 27
    goto :goto_0

    .line 28
    :cond_1
    const/4 p0, -0x1

    .line 29
    :goto_0
    invoke-virtual {v1, p0}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 30
    .line 31
    .line 32
    const-wide/16 v2, 0x0

    .line 33
    .line 34
    invoke-virtual {v1, v2, v3}, Landroid/animation/ValueAnimator;->setCurrentPlayTime(J)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->start()V

    .line 38
    .line 39
    .line 40
    :cond_2
    return-void
.end method

.method public final stepToFrame(FZ)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/tantan/library/svga/SVGAnimationView;->isAnimating()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    if-nez p2, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/tantan/library/svga/SVGAnimationView;->pauseAnimation()V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lcom/tantan/library/svga/SVGAnimationView;->mAnimator:Landroid/animation/ValueAnimator;

    .line 13
    .line 14
    const/high16 v1, 0x3f800000    # 1.0f

    .line 15
    .line 16
    invoke-static {v1, p1}, Lkotlin/ranges/a;->d(FF)F

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    const/4 v1, 0x0

    .line 21
    invoke-static {v1, p1}, Lkotlin/ranges/a;->a(FF)F

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->getDuration()J

    .line 26
    .line 27
    .line 28
    move-result-wide v1

    .line 29
    long-to-float v1, v1

    .line 30
    mul-float/2addr p1, v1

    .line 31
    float-to-long v1, p1

    .line 32
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setCurrentPlayTime(J)V

    .line 33
    .line 34
    .line 35
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 36
    .line 37
    if-eqz p2, :cond_1

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/tantan/library/svga/SVGAnimationView;->isAnimating()Z

    .line 40
    .line 41
    .line 42
    move-result p2

    .line 43
    if-nez p2, :cond_1

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    const/4 p1, 0x0

    .line 47
    :goto_0
    if-eqz p1, :cond_2

    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/tantan/library/svga/SVGAnimationView;->startAnimation()V

    .line 50
    .line 51
    .line 52
    :cond_2
    return-void
.end method

.method public final stopAnimation(Z)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/tantan/library/svga/SVGAnimationView;->isAnimating()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    sget-object p1, Lcom/tantan/library/svga/utils/SVGAExecutors;->Companion:Lcom/tantan/library/svga/utils/SVGAExecutors$Companion;

    .line 9
    .line 10
    new-instance v0, Ll/ttd0;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Ll/ttd0;-><init>(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1, v0}, Lcom/tantan/library/svga/utils/SVGAExecutors$Companion;->postOnUiThread$svga_lib_release(Ljava/lang/Runnable;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
