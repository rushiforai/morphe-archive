.class public final Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;
.super Landroid/view/View;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\\\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0005\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0007\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0013\n\u0002\u0018\u0002\n\u0002\u0008\u0010\u0018\u0000 J2\u00020\u0001:\u0001(B)\u0008\u0007\u0012\u0008\u0010\u0003\u001a\u0004\u0018\u00010\u0002\u0012\n\u0008\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0004\u0012\u0008\u0008\u0002\u0010\u0007\u001a\u00020\u0006\u00a2\u0006\u0004\u0008\u0008\u0010\tJ7\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u000b\u001a\u00020\n2\u0006\u0010\u000c\u001a\u00020\u00062\u0006\u0010\r\u001a\u00020\u00062\u0006\u0010\u000e\u001a\u00020\u00062\u0006\u0010\u000f\u001a\u00020\u0006H\u0014\u00a2\u0006\u0004\u0008\u0011\u0010\u0012J\u0017\u0010\u0015\u001a\u00020\u00102\u0006\u0010\u0014\u001a\u00020\u0013H\u0014\u00a2\u0006\u0004\u0008\u0015\u0010\u0016J\r\u0010\u0017\u001a\u00020\u0010\u00a2\u0006\u0004\u0008\u0017\u0010\u0018J\r\u0010\u0019\u001a\u00020\u0010\u00a2\u0006\u0004\u0008\u0019\u0010\u0018J\u000f\u0010\u001a\u001a\u00020\u0010H\u0014\u00a2\u0006\u0004\u0008\u001a\u0010\u0018J\u000f\u0010\u001c\u001a\u00020\u001bH\u0003\u00a2\u0006\u0004\u0008\u001c\u0010\u001dJ\u000f\u0010\u001e\u001a\u00020\u001bH\u0003\u00a2\u0006\u0004\u0008\u001e\u0010\u001dJ\u000f\u0010\u001f\u001a\u00020\u001bH\u0003\u00a2\u0006\u0004\u0008\u001f\u0010\u001dJ\u000f\u0010!\u001a\u00020 H\u0003\u00a2\u0006\u0004\u0008!\u0010\"J\u0017\u0010%\u001a\u00020\u00062\u0006\u0010$\u001a\u00020#H\u0002\u00a2\u0006\u0004\u0008%\u0010&R\u0014\u0010*\u001a\u00020\'8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008(\u0010)R\u0014\u0010,\u001a\u00020\'8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008+\u0010)R\u0016\u0010/\u001a\u00020\u00068\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008-\u0010.R\u0016\u00102\u001a\u00020#8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u00080\u00101R\u0016\u00104\u001a\u00020#8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u00083\u00101R\u0016\u00106\u001a\u00020\u00068\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u00085\u0010.R\u0016\u00108\u001a\u00020#8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u00087\u00101R\u0016\u0010:\u001a\u00020#8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u00089\u00101R\u001b\u0010@\u001a\u00020;8BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008<\u0010=\u001a\u0004\u0008>\u0010?R\u001b\u0010C\u001a\u00020;8BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008A\u0010=\u001a\u0004\u0008B\u0010?R\u0016\u0010E\u001a\u00020\u00068\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008D\u0010.R\u0016\u0010F\u001a\u00020\u00068\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u001c\u0010.R\u001b\u0010I\u001a\u00020 8BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008G\u0010=\u001a\u0004\u0008H\u0010\"\u00a8\u0006K"
    }
    d2 = {
        "Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;",
        "Landroid/view/View;",
        "Landroid/content/Context;",
        "context",
        "Landroid/util/AttributeSet;",
        "attrs",
        "",
        "defStyleRes",
        "<init>",
        "(Landroid/content/Context;Landroid/util/AttributeSet;I)V",
        "",
        "changed",
        "left",
        "top",
        "right",
        "bottom",
        "",
        "onLayout",
        "(ZIIII)V",
        "Landroid/graphics/Canvas;",
        "canvas",
        "onDraw",
        "(Landroid/graphics/Canvas;)V",
        "x",
        "()V",
        "y",
        "onDetachedFromWindow",
        "Landroid/animation/Animator;",
        "l",
        "()Landroid/animation/Animator;",
        "p",
        "t",
        "Landroid/animation/AnimatorSet;",
        "v",
        "()Landroid/animation/AnimatorSet;",
        "",
        "alphaFloat",
        "w",
        "(F)I",
        "Landroid/graphics/RectF;",
        "a",
        "Landroid/graphics/RectF;",
        "ring1Rect",
        "b",
        "ring2Rect",
        "c",
        "I",
        "ring1Radius",
        "d",
        "F",
        "ring1Alpha",
        "e",
        "ring1StrokeWidth",
        "f",
        "ring2Radius",
        "g",
        "ring2Alpha",
        "h",
        "ring2StrokeWidth",
        "Landroid/graphics/Paint;",
        "i",
        "Lkotlin/Lazy;",
        "getRing1Paint",
        "()Landroid/graphics/Paint;",
        "ring1Paint",
        "j",
        "getRing2Paint",
        "ring2Paint",
        "k",
        "centerX",
        "centerY",
        "m",
        "getWaveAnim",
        "waveAnim",
        "Companion",
        "livingroom_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final Companion:Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView$a;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public final a:Landroid/graphics/RectF;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final b:Landroid/graphics/RectF;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public c:I

.field public d:F

.field public e:F

.field public f:I

.field public g:F

.field public h:F

.field public final i:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final j:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public k:I

.field public l:I

.field public final m:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView$a;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;->Companion:Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView$a;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 6
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .line 92
    const/4 v4, 0x6

    const/4 v5, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;IILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 6
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .line 91
    const/4 v4, 0x4

    const/4 v5, 0x0

    const/4 v3, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    invoke-direct/range {v0 .. v5}, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;IILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Landroid/graphics/RectF;

    .line 5
    .line 6
    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;->a:Landroid/graphics/RectF;

    .line 10
    .line 11
    new-instance p1, Landroid/graphics/RectF;

    .line 12
    .line 13
    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;->b:Landroid/graphics/RectF;

    .line 17
    .line 18
    const/high16 p1, 0x41700000    # 15.0f

    .line 19
    .line 20
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 21
    .line 22
    .line 23
    move-result p2

    .line 24
    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;->c:I

    .line 25
    .line 26
    const p2, 0x3e4ccccd    # 0.2f

    .line 27
    .line 28
    .line 29
    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;->d:F

    .line 30
    .line 31
    const/high16 p3, 0x40000000    # 2.0f

    .line 32
    .line 33
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    int-to-float v0, v0

    .line 38
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;->e:F

    .line 39
    .line 40
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;->f:I

    .line 45
    .line 46
    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;->g:F

    .line 47
    .line 48
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    int-to-float p1, p1

    .line 53
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;->h:F

    .line 54
    .line 55
    sget-object p1, Lkotlin/LazyThreadSafetyMode;->NONE:Lkotlin/LazyThreadSafetyMode;

    .line 56
    .line 57
    new-instance p2, Ll/hem0;

    .line 58
    .line 59
    invoke-direct {p2}, Ll/hem0;-><init>()V

    .line 60
    .line 61
    .line 62
    invoke-static {p1, p2}, Lkotlin/LazyKt__LazyJVMKt;->a(Lkotlin/LazyThreadSafetyMode;Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 63
    .line 64
    .line 65
    move-result-object p2

    .line 66
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;->i:Lkotlin/Lazy;

    .line 67
    .line 68
    new-instance p2, Ll/iem0;

    .line 69
    .line 70
    invoke-direct {p2}, Ll/iem0;-><init>()V

    .line 71
    .line 72
    .line 73
    invoke-static {p1, p2}, Lkotlin/LazyKt__LazyJVMKt;->a(Lkotlin/LazyThreadSafetyMode;Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 74
    .line 75
    .line 76
    move-result-object p2

    .line 77
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;->j:Lkotlin/Lazy;

    .line 78
    .line 79
    new-instance p2, Ll/jem0;

    .line 80
    .line 81
    invoke-direct {p2, p0}, Ll/jem0;-><init>(Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;)V

    .line 82
    .line 83
    .line 84
    invoke-static {p1, p2}, Lkotlin/LazyKt__LazyJVMKt;->a(Lkotlin/LazyThreadSafetyMode;Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;->m:Lkotlin/Lazy;

    .line 89
    .line 90
    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;IILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    and-int/lit8 p5, p4, 0x2

    if-eqz p5, :cond_0

    const/4 p2, 0x0

    :cond_0
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_1

    const/4 p3, 0x0

    .line 93
    :cond_1
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;->q(Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;->r(Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;->o(Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;->n(Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;->s(Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static f()Landroid/graphics/Paint;
    .locals 2

    .line 1
    new-instance v0, Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 8
    .line 9
    .line 10
    const/4 v1, -0x1

    .line 11
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 12
    .line 13
    .line 14
    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 17
    .line 18
    .line 19
    return-object v0
.end method

.method public static g(Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;)Landroid/animation/AnimatorSet;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;->v()Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private final getRing1Paint()Landroid/graphics/Paint;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;->i:Lkotlin/Lazy;

    .line 2
    .line 3
    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/graphics/Paint;

    .line 8
    .line 9
    return-object p0
.end method

.method private final getRing2Paint()Landroid/graphics/Paint;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;->j:Lkotlin/Lazy;

    .line 2
    .line 3
    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/graphics/Paint;

    .line 8
    .line 9
    return-object p0
.end method

.method private final getWaveAnim()Landroid/animation/AnimatorSet;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;->m:Lkotlin/Lazy;

    .line 2
    .line 3
    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/animation/AnimatorSet;

    .line 8
    .line 9
    return-object p0
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;->u(Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;->m(Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static j()Landroid/graphics/Paint;
    .locals 2

    .line 1
    new-instance v0, Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 8
    .line 9
    .line 10
    const/4 v1, -0x1

    .line 11
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 12
    .line 13
    .line 14
    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 17
    .line 18
    .line 19
    return-object v0
.end method

.method public static k(Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;->x()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final m(Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    check-cast p1, Ljava/lang/Integer;

    .line 12
    .line 13
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;->c:I

    .line 18
    .line 19
    return-void
.end method

.method public static final n(Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    check-cast p1, Ljava/lang/Float;

    .line 12
    .line 13
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;->d:F

    .line 18
    .line 19
    return-void
.end method

.method public static final o(Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    check-cast p1, Ljava/lang/Float;

    .line 12
    .line 13
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;->e:F

    .line 18
    .line 19
    return-void
.end method

.method public static final q(Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    check-cast p1, Ljava/lang/Integer;

    .line 12
    .line 13
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;->f:I

    .line 18
    .line 19
    return-void
.end method

.method public static final r(Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    check-cast p1, Ljava/lang/Float;

    .line 12
    .line 13
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;->g:F

    .line 18
    .line 19
    return-void
.end method

.method public static final s(Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    check-cast p1, Ljava/lang/Float;

    .line 12
    .line 13
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;->h:F

    .line 18
    .line 19
    return-void
.end method

.method public static final u(Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public final l()Landroid/animation/Animator;
    .locals 9
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "Recycle"
        }
    .end annotation

    .line 1
    const/high16 v0, 0x41700000    # 15.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/high16 v1, 0x41d80000    # 27.0f

    .line 8
    .line 9
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    filled-new-array {v0, v1}, [I

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-wide/16 v1, 0x578

    .line 22
    .line 23
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 24
    .line 25
    .line 26
    const/4 v3, 0x0

    .line 27
    invoke-virtual {v0, v3}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 28
    .line 29
    .line 30
    new-instance v4, Ll/lem0;

    .line 31
    .line 32
    invoke-direct {v4, p0}, Ll/lem0;-><init>(Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v4}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 36
    .line 37
    .line 38
    const/4 v4, 0x2

    .line 39
    new-array v5, v4, [F

    .line 40
    .line 41
    fill-array-data v5, :array_0

    .line 42
    .line 43
    .line 44
    invoke-static {v5}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 45
    .line 46
    .line 47
    move-result-object v5

    .line 48
    invoke-virtual {v5, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v5, v3}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 52
    .line 53
    .line 54
    new-instance v6, Ll/mem0;

    .line 55
    .line 56
    invoke-direct {v6, p0}, Ll/mem0;-><init>(Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v5, v6}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 60
    .line 61
    .line 62
    const/high16 v6, 0x40400000    # 3.0f

    .line 63
    .line 64
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 65
    .line 66
    .line 67
    move-result v6

    .line 68
    int-to-float v6, v6

    .line 69
    const/high16 v7, 0x3f800000    # 1.0f

    .line 70
    .line 71
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 72
    .line 73
    .line 74
    move-result v7

    .line 75
    int-to-float v7, v7

    .line 76
    new-array v4, v4, [F

    .line 77
    .line 78
    const/4 v8, 0x0

    .line 79
    aput v6, v4, v8

    .line 80
    .line 81
    const/4 v6, 0x1

    .line 82
    aput v7, v4, v6

    .line 83
    .line 84
    invoke-static {v4}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 85
    .line 86
    .line 87
    move-result-object v4

    .line 88
    invoke-virtual {v4, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 89
    .line 90
    .line 91
    invoke-virtual {v4, v3}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 92
    .line 93
    .line 94
    new-instance v1, Ll/nem0;

    .line 95
    .line 96
    invoke-direct {v1, p0}, Ll/nem0;-><init>(Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v4, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 100
    .line 101
    .line 102
    const/16 p0, 0x258

    .line 103
    .line 104
    invoke-static {p0}, Ll/gt0;->j(I)Landroid/animation/Animator;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    new-instance v1, Landroid/animation/AnimatorSet;

    .line 109
    .line 110
    invoke-direct {v1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 111
    .line 112
    .line 113
    invoke-virtual {v1, v0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    invoke-virtual {v0, v5}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    invoke-virtual {v0, v4}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    invoke-virtual {v0, p0}, Landroid/animation/AnimatorSet$Builder;->before(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 126
    .line 127
    .line 128
    return-object v1

    .line 129
    :array_0
    .array-data 4
        0x3e4ccccd    # 0.2f
        0x0
    .end array-data
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;->y()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 13
    .param p1    # Landroid/graphics/Canvas;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-super/range {p0 .. p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 5
    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;->a:Landroid/graphics/RectF;

    .line 8
    .line 9
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;->k:I

    .line 10
    .line 11
    iget v3, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;->c:I

    .line 12
    .line 13
    sub-int v4, v2, v3

    .line 14
    .line 15
    int-to-float v4, v4

    .line 16
    iget v5, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;->e:F

    .line 17
    .line 18
    const/high16 v6, 0x40000000    # 2.0f

    .line 19
    .line 20
    div-float v7, v5, v6

    .line 21
    .line 22
    sub-float/2addr v4, v7

    .line 23
    iput v4, v1, Landroid/graphics/RectF;->left:F

    .line 24
    .line 25
    iget v4, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;->l:I

    .line 26
    .line 27
    sub-int v7, v4, v3

    .line 28
    .line 29
    int-to-float v7, v7

    .line 30
    div-float v8, v5, v6

    .line 31
    .line 32
    sub-float/2addr v7, v8

    .line 33
    iput v7, v1, Landroid/graphics/RectF;->top:F

    .line 34
    .line 35
    add-int/2addr v2, v3

    .line 36
    int-to-float v2, v2

    .line 37
    div-float v7, v5, v6

    .line 38
    .line 39
    add-float/2addr v2, v7

    .line 40
    iput v2, v1, Landroid/graphics/RectF;->right:F

    .line 41
    .line 42
    add-int/2addr v4, v3

    .line 43
    int-to-float v2, v4

    .line 44
    div-float/2addr v5, v6

    .line 45
    add-float/2addr v2, v5

    .line 46
    iput v2, v1, Landroid/graphics/RectF;->bottom:F

    .line 47
    .line 48
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;->getRing1Paint()Landroid/graphics/Paint;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;->d:F

    .line 53
    .line 54
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;->w(F)I

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 59
    .line 60
    .line 61
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;->getRing1Paint()Landroid/graphics/Paint;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;->e:F

    .line 66
    .line 67
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 68
    .line 69
    .line 70
    iget-object v8, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;->a:Landroid/graphics/RectF;

    .line 71
    .line 72
    const/4 v11, 0x0

    .line 73
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;->getRing1Paint()Landroid/graphics/Paint;

    .line 74
    .line 75
    .line 76
    move-result-object v12

    .line 77
    const/4 v9, 0x0

    .line 78
    const/high16 v10, 0x43b40000    # 360.0f

    .line 79
    .line 80
    move-object v7, p1

    .line 81
    invoke-virtual/range {v7 .. v12}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 82
    .line 83
    .line 84
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;->b:Landroid/graphics/RectF;

    .line 85
    .line 86
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;->k:I

    .line 87
    .line 88
    iget v3, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;->f:I

    .line 89
    .line 90
    sub-int v4, v2, v3

    .line 91
    .line 92
    int-to-float v4, v4

    .line 93
    iget v5, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;->h:F

    .line 94
    .line 95
    div-float v7, v5, v6

    .line 96
    .line 97
    sub-float/2addr v4, v7

    .line 98
    iput v4, v1, Landroid/graphics/RectF;->left:F

    .line 99
    .line 100
    iget v4, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;->l:I

    .line 101
    .line 102
    sub-int v7, v4, v3

    .line 103
    .line 104
    int-to-float v7, v7

    .line 105
    div-float v8, v5, v6

    .line 106
    .line 107
    sub-float/2addr v7, v8

    .line 108
    iput v7, v1, Landroid/graphics/RectF;->top:F

    .line 109
    .line 110
    add-int/2addr v2, v3

    .line 111
    int-to-float v2, v2

    .line 112
    div-float v7, v5, v6

    .line 113
    .line 114
    add-float/2addr v2, v7

    .line 115
    iput v2, v1, Landroid/graphics/RectF;->right:F

    .line 116
    .line 117
    add-int/2addr v4, v3

    .line 118
    int-to-float v2, v4

    .line 119
    div-float/2addr v5, v6

    .line 120
    add-float/2addr v2, v5

    .line 121
    iput v2, v1, Landroid/graphics/RectF;->bottom:F

    .line 122
    .line 123
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;->getRing2Paint()Landroid/graphics/Paint;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;->g:F

    .line 128
    .line 129
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;->w(F)I

    .line 130
    .line 131
    .line 132
    move-result v2

    .line 133
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 134
    .line 135
    .line 136
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;->getRing2Paint()Landroid/graphics/Paint;

    .line 137
    .line 138
    .line 139
    move-result-object v1

    .line 140
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;->h:F

    .line 141
    .line 142
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 143
    .line 144
    .line 145
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;->b:Landroid/graphics/RectF;

    .line 146
    .line 147
    const/4 v4, 0x0

    .line 148
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;->getRing2Paint()Landroid/graphics/Paint;

    .line 149
    .line 150
    .line 151
    move-result-object v5

    .line 152
    const/4 v2, 0x0

    .line 153
    const/high16 v3, 0x43b40000    # 360.0f

    .line 154
    .line 155
    move-object v0, p1

    .line 156
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 157
    .line 158
    .line 159
    return-void
.end method

.method public onLayout(ZIIII)V
    .locals 0

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/view/View;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    div-int/lit8 p1, p1, 0x2

    .line 13
    .line 14
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;->k:I

    .line 15
    .line 16
    div-int/lit8 p2, p2, 0x2

    .line 17
    .line 18
    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;->l:I

    .line 19
    .line 20
    return-void
.end method

.method public final p()Landroid/animation/Animator;
    .locals 10
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "Recycle"
        }
    .end annotation

    .line 1
    const/16 v0, 0x2dd

    .line 2
    .line 3
    invoke-static {v0}, Ll/gt0;->j(I)Landroid/animation/Animator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/high16 v1, 0x41700000    # 15.0f

    .line 8
    .line 9
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/high16 v2, 0x41d80000    # 27.0f

    .line 14
    .line 15
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    filled-new-array {v1, v2}, [I

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    const-wide/16 v2, 0x4f3

    .line 28
    .line 29
    invoke-virtual {v1, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 30
    .line 31
    .line 32
    const/4 v4, 0x0

    .line 33
    invoke-virtual {v1, v4}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 34
    .line 35
    .line 36
    new-instance v5, Ll/oem0;

    .line 37
    .line 38
    invoke-direct {v5, p0}, Ll/oem0;-><init>(Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v1, v5}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 42
    .line 43
    .line 44
    const/4 v5, 0x2

    .line 45
    new-array v6, v5, [F

    .line 46
    .line 47
    fill-array-data v6, :array_0

    .line 48
    .line 49
    .line 50
    invoke-static {v6}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 51
    .line 52
    .line 53
    move-result-object v6

    .line 54
    invoke-virtual {v6, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v6, v4}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 58
    .line 59
    .line 60
    new-instance v7, Ll/pem0;

    .line 61
    .line 62
    invoke-direct {v7, p0}, Ll/pem0;-><init>(Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v6, v7}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 66
    .line 67
    .line 68
    const/high16 v7, 0x40400000    # 3.0f

    .line 69
    .line 70
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 71
    .line 72
    .line 73
    move-result v7

    .line 74
    int-to-float v7, v7

    .line 75
    const/high16 v8, 0x3f800000    # 1.0f

    .line 76
    .line 77
    invoke-static {v8}, Ll/qa00;->d(F)I

    .line 78
    .line 79
    .line 80
    move-result v8

    .line 81
    int-to-float v8, v8

    .line 82
    new-array v5, v5, [F

    .line 83
    .line 84
    const/4 v9, 0x0

    .line 85
    aput v7, v5, v9

    .line 86
    .line 87
    const/4 v7, 0x1

    .line 88
    aput v8, v5, v7

    .line 89
    .line 90
    invoke-static {v5}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 91
    .line 92
    .line 93
    move-result-object v5

    .line 94
    invoke-virtual {v5, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 95
    .line 96
    .line 97
    invoke-virtual {v5, v4}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 98
    .line 99
    .line 100
    new-instance v2, Ll/gem0;

    .line 101
    .line 102
    invoke-direct {v2, p0}, Ll/gem0;-><init>(Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {v5, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 106
    .line 107
    .line 108
    new-instance p0, Landroid/animation/AnimatorSet;

    .line 109
    .line 110
    invoke-direct {p0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 111
    .line 112
    .line 113
    invoke-virtual {p0, v1}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    invoke-virtual {v1, v6}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    invoke-virtual {v1, v5}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 122
    .line 123
    .line 124
    move-result-object v1

    .line 125
    invoke-virtual {v1, v0}, Landroid/animation/AnimatorSet$Builder;->after(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 126
    .line 127
    .line 128
    return-object p0

    .line 129
    :array_0
    .array-data 4
        0x3e4ccccd    # 0.2f
        0x0
    .end array-data
.end method

.method public final t()Landroid/animation/Animator;
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "Recycle"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    filled-new-array {v0, v0}, [I

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const-wide/16 v1, 0x7d0

    .line 11
    .line 12
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 13
    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 17
    .line 18
    .line 19
    new-instance v1, Ll/kem0;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/kem0;-><init>(Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 25
    .line 26
    .line 27
    return-object v0
.end method

.method public final v()Landroid/animation/AnimatorSet;
    .locals 5
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "Recycle"
        }
    .end annotation

    .line 1
    const/16 v0, 0x1388

    .line 2
    .line 3
    invoke-static {v0}, Ll/gt0;->j(I)Landroid/animation/Animator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;->l()Landroid/animation/Animator;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;->p()Landroid/animation/Animator;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;->t()Landroid/animation/Animator;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    new-instance v3, Landroid/animation/AnimatorSet;

    .line 20
    .line 21
    invoke-direct {v3}, Landroid/animation/AnimatorSet;-><init>()V

    .line 22
    .line 23
    .line 24
    filled-new-array {v1, v2, p0}, [Landroid/animation/Animator;

    .line 25
    .line 26
    .line 27
    move-result-object v4

    .line 28
    invoke-virtual {v3, v4}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 29
    .line 30
    .line 31
    new-instance v4, Landroid/animation/AnimatorSet;

    .line 32
    .line 33
    invoke-direct {v4}, Landroid/animation/AnimatorSet;-><init>()V

    .line 34
    .line 35
    .line 36
    filled-new-array {v1, v2, p0}, [Landroid/animation/Animator;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {v4, p0}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 41
    .line 42
    .line 43
    new-instance p0, Landroid/animation/AnimatorSet;

    .line 44
    .line 45
    invoke-direct {p0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 46
    .line 47
    .line 48
    const/4 v1, 0x3

    .line 49
    new-array v1, v1, [Landroid/animation/Animator;

    .line 50
    .line 51
    const/4 v2, 0x0

    .line 52
    aput-object v3, v1, v2

    .line 53
    .line 54
    const/4 v2, 0x1

    .line 55
    aput-object v4, v1, v2

    .line 56
    .line 57
    const/4 v2, 0x2

    .line 58
    aput-object v0, v1, v2

    .line 59
    .line 60
    invoke-virtual {p0, v1}, Landroid/animation/AnimatorSet;->playSequentially([Landroid/animation/Animator;)V

    .line 61
    .line 62
    .line 63
    return-object p0
.end method

.method public final w(F)I
    .locals 0

    .line 1
    const/high16 p0, 0x437f0000    # 255.0f

    mul-float/2addr p0, p1

    float-to-int p0, p0

    return p0
.end method

.method public final x()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;->getWaveAnim()Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/animation/Animator;->removeAllListeners()V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;->getWaveAnim()Landroid/animation/AnimatorSet;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v1, Ll/fem0;

    .line 13
    .line 14
    invoke-direct {v1, p0}, Ll/fem0;-><init>(Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;)V

    .line 15
    .line 16
    .line 17
    invoke-static {v0, v1}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 18
    .line 19
    .line 20
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;->getWaveAnim()Landroid/animation/AnimatorSet;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final y()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualWaveView;->getWaveAnim()Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/it0;->A(Landroid/animation/Animator;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
