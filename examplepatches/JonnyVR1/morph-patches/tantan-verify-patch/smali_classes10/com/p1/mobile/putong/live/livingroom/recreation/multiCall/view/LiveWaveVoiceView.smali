.class public final Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;
.super Landroid/view/View;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView$a;,
        Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView$b;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000X\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0007\n\u0002\u0008\t\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0010\u000b\n\u0002\u0008\u0004\u0018\u0000 32\u00020\u0001:\u0002\u001f\u0018B\u0019\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u0017\u0010\u000b\u001a\u00020\n2\u0006\u0010\t\u001a\u00020\u0008H\u0014\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\u0015\u0010\u000f\u001a\u00020\n2\u0006\u0010\u000e\u001a\u00020\r\u00a2\u0006\u0004\u0008\u000f\u0010\u0010J\r\u0010\u0011\u001a\u00020\n\u00a2\u0006\u0004\u0008\u0011\u0010\u0012J!\u0010\u0013\u001a\u00020\n2\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u00042\u0006\u0010\u0003\u001a\u00020\u0002H\u0002\u00a2\u0006\u0004\u0008\u0013\u0010\u0014J\u000f\u0010\u0015\u001a\u00020\nH\u0002\u00a2\u0006\u0004\u0008\u0015\u0010\u0012J\u0017\u0010\u0016\u001a\u00020\n2\u0006\u0010\u000e\u001a\u00020\rH\u0002\u00a2\u0006\u0004\u0008\u0016\u0010\u0010R\u001b\u0010\u001c\u001a\u00020\u00178BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u0018\u0010\u0019\u001a\u0004\u0008\u001a\u0010\u001bR\u001a\u0010!\u001a\u0008\u0012\u0004\u0012\u00020\u001e0\u001d8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u001f\u0010 R\u0014\u0010%\u001a\u00020\"8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008#\u0010$R\u0016\u0010(\u001a\u00020\u001e8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008&\u0010\'R\u0014\u0010+\u001a\u00020)8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0013\u0010*R\u0016\u0010,\u001a\u00020\u001e8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0016\u0010\'R\u0016\u0010.\u001a\u00020\r8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0015\u0010-R\u0016\u0010/\u001a\u00020\r8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u000f\u0010-R\u0016\u00102\u001a\u0002008\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0011\u00101\u00a8\u00064"
    }
    d2 = {
        "Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;",
        "Landroid/view/View;",
        "Landroid/content/Context;",
        "context",
        "Landroid/util/AttributeSet;",
        "attrs",
        "<init>",
        "(Landroid/content/Context;Landroid/util/AttributeSet;)V",
        "Landroid/graphics/Canvas;",
        "canvas",
        "",
        "onDraw",
        "(Landroid/graphics/Canvas;)V",
        "",
        "volumeValue",
        "h",
        "(F)V",
        "i",
        "()V",
        "e",
        "(Landroid/util/AttributeSet;Landroid/content/Context;)V",
        "g",
        "f",
        "Ljava/lang/Runnable;",
        "a",
        "Lkotlin/Lazy;",
        "getWaveTask",
        "()Ljava/lang/Runnable;",
        "waveTask",
        "Ljava/util/LinkedList;",
        "",
        "b",
        "Ljava/util/LinkedList;",
        "mWaveList",
        "Landroid/graphics/Paint;",
        "c",
        "Landroid/graphics/Paint;",
        "paint",
        "d",
        "I",
        "waveCount",
        "Landroid/graphics/RectF;",
        "Landroid/graphics/RectF;",
        "rectLeft",
        "updateSpeed",
        "F",
        "lineWidth",
        "lineMinHeight",
        "",
        "Z",
        "isStart",
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

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# static fields
.field public static final Companion:Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView$b;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final j:F

.field public static final k:F

.field public static final l:[F
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public final a:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final b:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final c:Landroid/graphics/Paint;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public d:I

.field public final e:Landroid/graphics/RectF;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public f:I

.field public g:F

.field public h:F

.field public i:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView$b;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView$b;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;->Companion:Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView$b;

    .line 8
    .line 9
    const/high16 v0, 0x40c00000    # 6.0f

    .line 10
    .line 11
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    int-to-float v0, v0

    .line 16
    sput v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;->j:F

    .line 17
    .line 18
    const/high16 v0, 0x40800000    # 4.0f

    .line 19
    .line 20
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    int-to-float v0, v0

    .line 25
    sput v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;->k:F

    .line 26
    .line 27
    const/16 v0, 0x9

    .line 28
    .line 29
    new-array v0, v0, [F

    .line 30
    .line 31
    fill-array-data v0, :array_0

    .line 32
    .line 33
    .line 34
    sput-object v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;->l:[F

    .line 35
    .line 36
    return-void

    .line 37
    :array_0
    .array-data 4
        0x3f4ccccd    # 0.8f
        0x3f800000    # 1.0f
        0x3f75c28f    # 0.96f
        0x3f333333    # 0.7f
        0x3f0ccccd    # 0.55f
        0x3f400000    # 0.75f
        0x3f266666    # 0.65f
        0x3f666666    # 0.9f
        0x3f333333    # 0.7f
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-direct {p0, p1, p2, v0}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Lkotlin/LazyThreadSafetyMode;->NONE:Lkotlin/LazyThreadSafetyMode;

    .line 9
    .line 10
    new-instance v1, Ll/xdv;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Ll/xdv;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;)V

    .line 13
    .line 14
    .line 15
    invoke-static {v0, v1}, Lkotlin/LazyKt__LazyJVMKt;->a(Lkotlin/LazyThreadSafetyMode;Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;->a:Lkotlin/Lazy;

    .line 20
    .line 21
    new-instance v0, Ljava/util/LinkedList;

    .line 22
    .line 23
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;->b:Ljava/util/LinkedList;

    .line 27
    .line 28
    new-instance v0, Landroid/graphics/Paint;

    .line 29
    .line 30
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 31
    .line 32
    .line 33
    const/4 v1, 0x0

    .line 34
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 35
    .line 36
    .line 37
    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 40
    .line 41
    .line 42
    const/4 v1, 0x1

    .line 43
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 44
    .line 45
    .line 46
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;->c:Landroid/graphics/Paint;

    .line 47
    .line 48
    const/4 v0, 0x4

    .line 49
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;->d:I

    .line 50
    .line 51
    new-instance v0, Landroid/graphics/RectF;

    .line 52
    .line 53
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 54
    .line 55
    .line 56
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;->e:Landroid/graphics/RectF;

    .line 57
    .line 58
    const/16 v0, 0x64

    .line 59
    .line 60
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;->f:I

    .line 61
    .line 62
    sget v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;->j:F

    .line 63
    .line 64
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;->g:F

    .line 65
    .line 66
    const/high16 v0, -0x40800000    # -1.0f

    .line 67
    .line 68
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;->h:F

    .line 69
    .line 70
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;->e(Landroid/util/AttributeSet;Landroid/content/Context;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;->g()V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public static a(Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;)Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView$a;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static final synthetic b(Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;->f:I

    .line 2
    .line 3
    return p0
.end method

.method public static final synthetic c(Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;->i:Z

    .line 2
    .line 3
    return p0
.end method

.method public static final synthetic d(Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;F)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;->f(F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final getWaveTask()Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;->a:Lkotlin/Lazy;

    .line 2
    .line 3
    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Runnable;

    .line 8
    .line 9
    return-object p0
.end method


# virtual methods
.method public final e(Landroid/util/AttributeSet;Landroid/content/Context;)V
    .locals 1

    .line 1
    sget-object v0, Ll/vhc0;->D:[I

    .line 2
    .line 3
    invoke-virtual {p2, p1, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    sget p2, Ll/vhc0;->E:I

    .line 8
    .line 9
    sget v0, Ll/n9c0;->w1:I

    .line 10
    .line 11
    invoke-static {v0}, Ll/n3d0;->a(I)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;->c:Landroid/graphics/Paint;

    .line 20
    .line 21
    invoke-virtual {v0, p2}, Landroid/graphics/Paint;->setColor(I)V

    .line 22
    .line 23
    .line 24
    sget p2, Ll/vhc0;->G:I

    .line 25
    .line 26
    sget v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;->j:F

    .line 27
    .line 28
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 29
    .line 30
    .line 31
    move-result p2

    .line 32
    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;->g:F

    .line 33
    .line 34
    sget p2, Ll/vhc0;->H:I

    .line 35
    .line 36
    const/high16 v0, -0x40800000    # -1.0f

    .line 37
    .line 38
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 39
    .line 40
    .line 41
    move-result p2

    .line 42
    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;->h:F

    .line 43
    .line 44
    sget p2, Ll/vhc0;->F:I

    .line 45
    .line 46
    const/4 v0, 0x4

    .line 47
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getInteger(II)I

    .line 48
    .line 49
    .line 50
    move-result p2

    .line 51
    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;->d:I

    .line 52
    .line 53
    sget p2, Ll/vhc0;->I:I

    .line 54
    .line 55
    const/16 v0, 0x64

    .line 56
    .line 57
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 58
    .line 59
    .line 60
    move-result p2

    .line 61
    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;->f:I

    .line 62
    .line 63
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public final declared-synchronized f(F)V
    .locals 10

    .line 1
    monitor-enter p0

    .line 2
    const/4 v0, 0x0

    .line 3
    cmpl-float v1, p1, v0

    .line 4
    .line 5
    if-lez v1, :cond_4

    .line 6
    .line 7
    const/high16 v1, 0x40900000    # 4.5f

    .line 8
    .line 9
    mul-float/2addr p1, v1

    .line 10
    const/high16 v1, 0x3f800000    # 1.0f

    .line 11
    .line 12
    cmpl-float v2, p1, v1

    .line 13
    .line 14
    if-lez v2, :cond_0

    .line 15
    .line 16
    move p1, v1

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    float-to-double v1, p1

    .line 19
    const-wide v3, 0x3fe6666666666666L    # 0.7

    .line 20
    .line 21
    .line 22
    .line 23
    .line 24
    cmpg-double v1, v1, v3

    .line 25
    .line 26
    if-gez v1, :cond_1

    .line 27
    .line 28
    const p1, 0x3f333333    # 0.7f

    .line 29
    .line 30
    .line 31
    :cond_1
    :goto_0
    :try_start_0
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;->l:[F

    .line 32
    .line 33
    array-length v2, v1

    .line 34
    const/4 v3, 0x0

    .line 35
    move v4, v3

    .line 36
    :goto_1
    if-ge v3, v2, :cond_5

    .line 37
    .line 38
    aget v5, v1, v3

    .line 39
    .line 40
    add-int/lit8 v6, v4, 0x1

    .line 41
    .line 42
    mul-float/2addr v5, p1

    .line 43
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 44
    .line 45
    .line 46
    move-result v7

    .line 47
    int-to-float v7, v7

    .line 48
    mul-float/2addr v5, v7

    .line 49
    float-to-int v5, v5

    .line 50
    iget v7, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;->h:F
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 51
    .line 52
    cmpl-float v8, v7, v0

    .line 53
    .line 54
    iget-object v9, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;->b:Ljava/util/LinkedList;

    .line 55
    .line 56
    if-lez v8, :cond_3

    .line 57
    .line 58
    int-to-float v8, v5

    .line 59
    cmpl-float v8, v8, v7

    .line 60
    .line 61
    if-lez v8, :cond_2

    .line 62
    .line 63
    goto :goto_2

    .line 64
    :cond_2
    float-to-int v5, v7

    .line 65
    :goto_2
    :try_start_1
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 66
    .line 67
    .line 68
    move-result-object v5

    .line 69
    invoke-virtual {v9, v4, v5}, Ljava/util/LinkedList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    goto :goto_3

    .line 73
    :catchall_0
    move-exception p1

    .line 74
    goto :goto_4

    .line 75
    :cond_3
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 76
    .line 77
    .line 78
    move-result-object v5

    .line 79
    invoke-virtual {v9, v4, v5}, Ljava/util/LinkedList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    :goto_3
    add-int/lit8 v3, v3, 0x1

    .line 83
    .line 84
    move v4, v6

    .line 85
    goto :goto_1

    .line 86
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;->b:Ljava/util/LinkedList;

    .line 87
    .line 88
    invoke-virtual {p1}, Ljava/util/LinkedList;->pollFirst()Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    check-cast p1, Ljava/lang/Integer;

    .line 93
    .line 94
    if-eqz p1, :cond_5

    .line 95
    .line 96
    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    .line 97
    .line 98
    .line 99
    move-result p1

    .line 100
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;->b:Ljava/util/LinkedList;

    .line 101
    .line 102
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 107
    .line 108
    .line 109
    :cond_5
    monitor-exit p0

    .line 110
    return-void

    .line 111
    :goto_4
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 112
    throw p1
.end method

.method public final g()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;->b:Ljava/util/LinkedList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/LinkedList;->clear()V

    .line 4
    .line 5
    .line 6
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;->l:[F

    .line 7
    .line 8
    array-length v1, v0

    .line 9
    const/4 v2, 0x0

    .line 10
    :goto_0
    if-ge v2, v1, :cond_0

    .line 11
    .line 12
    aget v3, v0, v2

    .line 13
    .line 14
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;->b:Ljava/util/LinkedList;

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 17
    .line 18
    .line 19
    move-result v5

    .line 20
    int-to-float v5, v5

    .line 21
    mul-float/2addr v3, v5

    .line 22
    float-to-int v3, v3

    .line 23
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    invoke-virtual {v4, v3}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    add-int/lit8 v2, v2, 0x1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    return-void
.end method

.method public final declared-synchronized h(F)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;->i:Z

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;->i:Z

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;->f(F)V

    .line 10
    .line 11
    .line 12
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;->getWaveTask()Ljava/lang/Runnable;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception p1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;->f(F)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    .line 24
    .line 25
    :goto_0
    monitor-exit p0

    .line 26
    return-void

    .line 27
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 28
    throw p1
.end method

.method public final declared-synchronized i()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;->i:Z

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;->i:Z

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;->b:Ljava/util/LinkedList;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/util/LinkedList;->clear()V

    .line 12
    .line 13
    .line 14
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;->getWaveTask()Ljava/lang/Runnable;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0, v0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;->g()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :catchall_0
    move-exception v0

    .line 29
    goto :goto_1

    .line 30
    :cond_0
    :goto_0
    monitor-exit p0

    .line 31
    return-void

    .line 32
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 33
    throw v0
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 10
    .param p1    # Landroid/graphics/Canvas;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    div-int/lit8 v0, v0, 0x2

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    div-int/lit8 v1, v1, 0x2

    .line 18
    .line 19
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;->d:I

    .line 20
    .line 21
    div-int/lit8 v3, v2, 0x2

    .line 22
    .line 23
    const/4 v4, 0x0

    .line 24
    :goto_0
    if-ge v4, v2, :cond_2

    .line 25
    .line 26
    iget v5, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;->d:I

    .line 27
    .line 28
    rem-int/lit8 v5, v5, 0x2

    .line 29
    .line 30
    if-nez v5, :cond_1

    .line 31
    .line 32
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;->e:Landroid/graphics/RectF;

    .line 33
    .line 34
    const/high16 v6, 0x3f000000    # 0.5f

    .line 35
    .line 36
    if-ge v4, v3, :cond_0

    .line 37
    .line 38
    sub-int v7, v3, v4

    .line 39
    .line 40
    int-to-float v8, v0

    .line 41
    int-to-float v7, v7

    .line 42
    sget v9, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;->j:F

    .line 43
    .line 44
    mul-float/2addr v9, v7

    .line 45
    sub-float/2addr v8, v9

    .line 46
    sub-float/2addr v7, v6

    .line 47
    sget v6, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;->k:F

    .line 48
    .line 49
    mul-float/2addr v7, v6

    .line 50
    sub-float/2addr v8, v7

    .line 51
    iput v8, v5, Landroid/graphics/RectF;->left:F

    .line 52
    .line 53
    goto :goto_1

    .line 54
    :cond_0
    sub-int v7, v4, v3

    .line 55
    .line 56
    int-to-float v8, v0

    .line 57
    int-to-float v7, v7

    .line 58
    sget v9, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;->j:F

    .line 59
    .line 60
    mul-float/2addr v9, v7

    .line 61
    add-float/2addr v8, v9

    .line 62
    add-float/2addr v7, v6

    .line 63
    sget v6, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;->k:F

    .line 64
    .line 65
    mul-float/2addr v7, v6

    .line 66
    add-float/2addr v8, v7

    .line 67
    iput v8, v5, Landroid/graphics/RectF;->left:F

    .line 68
    .line 69
    :goto_1
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;->e:Landroid/graphics/RectF;

    .line 70
    .line 71
    int-to-float v6, v1

    .line 72
    iget-object v7, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;->b:Ljava/util/LinkedList;

    .line 73
    .line 74
    invoke-virtual {v7, v4}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v7

    .line 78
    check-cast v7, Ljava/lang/Number;

    .line 79
    .line 80
    invoke-virtual {v7}, Ljava/lang/Number;->floatValue()F

    .line 81
    .line 82
    .line 83
    move-result v7

    .line 84
    const/high16 v8, 0x40000000    # 2.0f

    .line 85
    .line 86
    div-float/2addr v7, v8

    .line 87
    sub-float v7, v6, v7

    .line 88
    .line 89
    iput v7, v5, Landroid/graphics/RectF;->top:F

    .line 90
    .line 91
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;->e:Landroid/graphics/RectF;

    .line 92
    .line 93
    iget v7, v5, Landroid/graphics/RectF;->left:F

    .line 94
    .line 95
    iget v9, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;->g:F

    .line 96
    .line 97
    add-float/2addr v7, v9

    .line 98
    iput v7, v5, Landroid/graphics/RectF;->right:F

    .line 99
    .line 100
    iget-object v7, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;->b:Ljava/util/LinkedList;

    .line 101
    .line 102
    invoke-virtual {v7, v4}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object v7

    .line 106
    check-cast v7, Ljava/lang/Number;

    .line 107
    .line 108
    invoke-virtual {v7}, Ljava/lang/Number;->floatValue()F

    .line 109
    .line 110
    .line 111
    move-result v7

    .line 112
    div-float/2addr v7, v8

    .line 113
    add-float/2addr v6, v7

    .line 114
    iput v6, v5, Landroid/graphics/RectF;->bottom:F

    .line 115
    .line 116
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;->e:Landroid/graphics/RectF;

    .line 117
    .line 118
    sget v6, Ll/qa00;->d:I

    .line 119
    .line 120
    int-to-float v7, v6

    .line 121
    int-to-float v6, v6

    .line 122
    iget-object v8, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;->c:Landroid/graphics/Paint;

    .line 123
    .line 124
    invoke-virtual {p1, v5, v7, v6, v8}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 125
    .line 126
    .line 127
    :cond_1
    add-int/lit8 v4, v4, 0x1

    .line 128
    .line 129
    goto :goto_0

    .line 130
    :cond_2
    return-void
.end method
