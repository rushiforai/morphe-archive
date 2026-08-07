.class public final Lcom/immomo/molive/apm/fps/FpsTracer;
.super Ll/cs2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/immomo/molive/apm/fps/FpsTracer$a;,
        Lcom/immomo/molive/apm/fps/FpsTracer$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/cs2<",
        "Ll/g4j;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000R\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\t\n\u0002\u0010\u000b\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0012\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001:\u000267B\u000f\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u0017\u0010\n\u001a\u00020\t2\u0006\u0010\u0008\u001a\u00020\u0007H\u0002\u00a2\u0006\u0004\u0008\n\u0010\u000bJ\u0017\u0010\u000e\u001a\u00020\t2\u0006\u0010\r\u001a\u00020\u000cH\u0002\u00a2\u0006\u0004\u0008\u000e\u0010\u000fJ\u0017\u0010\u0011\u001a\u00020\u00102\u0006\u0010\r\u001a\u00020\u000cH\u0002\u00a2\u0006\u0004\u0008\u0011\u0010\u0012J\u000f\u0010\u0013\u001a\u00020\tH\u0002\u00a2\u0006\u0004\u0008\u0013\u0010\u0014J\u0017\u0010\u0015\u001a\u00020\t2\u0008\u0010\r\u001a\u0004\u0018\u00010\u000c\u00a2\u0006\u0004\u0008\u0015\u0010\u000fJ\u000f\u0010\u0016\u001a\u00020\tH\u0016\u00a2\u0006\u0004\u0008\u0016\u0010\u0014J\u000f\u0010\u0017\u001a\u00020\tH\u0016\u00a2\u0006\u0004\u0008\u0017\u0010\u0014J\u000f\u0010\u0018\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u0018\u0010\u0019J\u000f\u0010\u001b\u001a\u00020\u001aH\u0016\u00a2\u0006\u0004\u0008\u001b\u0010\u001cR\u0014\u0010\u001f\u001a\u00020\u00108\u0002X\u0082D\u00a2\u0006\u0006\n\u0004\u0008\u001d\u0010\u001eR\u0018\u0010\"\u001a\u0004\u0018\u00010 8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0016\u0010!R\u001c\u0010%\u001a\u0008\u0018\u00010#R\u00020\u00008\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0017\u0010$R\u001c\u0010)\u001a\u0008\u0018\u00010&R\u00020\u00008\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\'\u0010(R\u0016\u0010+\u001a\u00020\u00108\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008*\u0010\u001eR\u0016\u0010-\u001a\u00020\u00108\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008,\u0010\u001eR\u0016\u00100\u001a\u00020\u001a8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008.\u0010/R\u001b\u00102\u001a\u00020\u00028BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u0011\u00101\u001a\u0004\u0008.\u0010\u0019R\u0017\u0010\u0004\u001a\u00020\u00038\u0006\u00a2\u0006\u000c\n\u0004\u0008\u001b\u00103\u001a\u0004\u00084\u00105\u00a8\u00068"
    }
    d2 = {
        "Lcom/immomo/molive/apm/fps/FpsTracer;",
        "Ll/cs2;",
        "Ll/g4j;",
        "Ll/ci2;",
        "fpsConfig",
        "<init>",
        "(Ll/ci2;)V",
        "Landroid/app/Activity;",
        "activity",
        "",
        "q",
        "(Landroid/app/Activity;)V",
        "Landroid/content/Context;",
        "context",
        "r",
        "(Landroid/content/Context;)V",
        "",
        "l",
        "(Landroid/content/Context;)I",
        "o",
        "()V",
        "p",
        "f",
        "g",
        "n",
        "()Ll/g4j;",
        "",
        "m",
        "()Z",
        "e",
        "I",
        "DEFAULT_RATE",
        "Ll/plq;",
        "Ll/plq;",
        "currentActivityJankStats",
        "Lcom/immomo/molive/apm/fps/FpsTracer$a;",
        "Lcom/immomo/molive/apm/fps/FpsTracer$a;",
        "frameJankCalculateListener",
        "Lcom/immomo/molive/apm/fps/FpsTracer$b;",
        "h",
        "Lcom/immomo/molive/apm/fps/FpsTracer$b;",
        "frameCallback",
        "i",
        "currentWindowRefreshRate",
        "j",
        "sampleIntervalSecond",
        "k",
        "Z",
        "fpsTracerEnable",
        "Lkotlin/Lazy;",
        "fps",
        "Ll/ci2;",
        "getFpsConfig",
        "()Ll/ci2;",
        "a",
        "b",
        "apm-tracer_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation


# instance fields
.field private final e:I

.field private f:Ll/plq;

.field private g:Lcom/immomo/molive/apm/fps/FpsTracer$a;

.field private h:Lcom/immomo/molive/apm/fps/FpsTracer$b;

.field private i:I

.field private j:I

.field private k:Z

.field private final l:Lkotlin/Lazy;

.field private final m:Ll/ci2;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/ci2;)V
    .locals 4
    .param p1    # Ll/ci2;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Ll/cs2;-><init>(Ll/ci2;)V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Lcom/immomo/molive/apm/fps/FpsTracer;->m:Ll/ci2;

    .line 8
    .line 9
    const/16 v0, 0x3c

    .line 10
    .line 11
    iput v0, p0, Lcom/immomo/molive/apm/fps/FpsTracer;->e:I

    .line 12
    .line 13
    iput v0, p0, Lcom/immomo/molive/apm/fps/FpsTracer;->i:I

    .line 14
    .line 15
    invoke-virtual {p1}, Ll/ci2;->a()J

    .line 16
    .line 17
    .line 18
    move-result-wide v0

    .line 19
    const-wide/16 v2, 0x3e8

    .line 20
    .line 21
    div-long/2addr v0, v2

    .line 22
    long-to-int p1, v0

    .line 23
    const/4 v0, 0x1

    .line 24
    invoke-static {v0, p1}, Ljava/lang/Math;->min(II)I

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    iput p1, p0, Lcom/immomo/molive/apm/fps/FpsTracer;->j:I

    .line 29
    .line 30
    iput-boolean v0, p0, Lcom/immomo/molive/apm/fps/FpsTracer;->k:Z

    .line 31
    .line 32
    new-instance p1, Lcom/immomo/molive/apm/fps/FpsTracer$fps$2;

    .line 33
    .line 34
    invoke-direct {p1, p0}, Lcom/immomo/molive/apm/fps/FpsTracer$fps$2;-><init>(Lcom/immomo/molive/apm/fps/FpsTracer;)V

    .line 35
    .line 36
    .line 37
    invoke-static {p1}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iput-object p1, p0, Lcom/immomo/molive/apm/fps/FpsTracer;->l:Lkotlin/Lazy;

    .line 42
    .line 43
    return-void
.end method

.method public static final synthetic h(Lcom/immomo/molive/apm/fps/FpsTracer;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/molive/apm/fps/FpsTracer;->e:I

    .line 2
    .line 3
    return p0
.end method

.method public static final synthetic i(Lcom/immomo/molive/apm/fps/FpsTracer;)Ll/g4j;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/molive/apm/fps/FpsTracer;->k()Ll/g4j;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static final synthetic j(Lcom/immomo/molive/apm/fps/FpsTracer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/molive/apm/fps/FpsTracer;->o()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final k()Ll/g4j;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/molive/apm/fps/FpsTracer;->l:Lkotlin/Lazy;

    .line 2
    .line 3
    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/g4j;

    .line 8
    .line 9
    return-object p0
.end method

.method private final l(Landroid/content/Context;)I
    .locals 1

    .line 1
    :try_start_0
    instance-of v0, p1, Landroid/app/Activity;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p1

    .line 6
    check-cast v0, Landroid/app/Activity;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    check-cast p1, Landroid/app/Activity;

    .line 15
    .line 16
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1}, Landroid/view/Window;->getWindowManager()Landroid/view/WindowManager;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 28
    .line 29
    .line 30
    invoke-interface {p1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1}, Landroid/view/Display;->getRefreshRate()F

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    :goto_0
    float-to-int p1, p1

    .line 42
    goto :goto_1

    .line 43
    :cond_0
    const-string v0, "window"

    .line 44
    .line 45
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    if-eqz p1, :cond_1

    .line 50
    .line 51
    check-cast p1, Landroid/view/WindowManager;

    .line 52
    .line 53
    invoke-interface {p1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 58
    .line 59
    .line 60
    invoke-virtual {p1}, Landroid/view/Display;->getRefreshRate()F

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    goto :goto_0

    .line 65
    :goto_1
    int-to-float p1, p1

    .line 66
    const/high16 v0, 0x41200000    # 10.0f

    .line 67
    .line 68
    div-float/2addr p1, v0

    .line 69
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    mul-int/lit8 p1, p1, 0xa

    .line 74
    .line 75
    iget v0, p0, Lcom/immomo/molive/apm/fps/FpsTracer;->e:I

    .line 76
    .line 77
    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    .line 78
    .line 79
    .line 80
    move-result p0

    .line 81
    return p0

    .line 82
    :cond_1
    new-instance p1, Lkotlin/TypeCastException;

    .line 83
    .line 84
    const-string v0, "null cannot be cast to non-null type android.view.WindowManager"

    .line 85
    .line 86
    invoke-direct {p1, v0}, Lkotlin/TypeCastException;-><init>(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    throw p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 90
    :catch_0
    iget p0, p0, Lcom/immomo/molive/apm/fps/FpsTracer;->e:I

    .line 91
    .line 92
    return p0
.end method

.method private final o()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/immomo/molive/apm/fps/FpsTracer;->h:Lcom/immomo/molive/apm/fps/FpsTracer$b;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/immomo/molive/apm/fps/FpsTracer$b;->b()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0, p0}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method private final q(Landroid/app/Activity;)V
    .locals 9

    .line 1
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    invoke-direct {p0, p1}, Lcom/immomo/molive/apm/fps/FpsTracer;->l(Landroid/content/Context;)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iput v0, p0, Lcom/immomo/molive/apm/fps/FpsTracer;->i:I

    .line 12
    .line 13
    invoke-direct {p0}, Lcom/immomo/molive/apm/fps/FpsTracer;->k()Ll/g4j;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Ll/g4j;->h(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-direct {p0}, Lcom/immomo/molive/apm/fps/FpsTracer;->k()Ll/g4j;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iget v1, p0, Lcom/immomo/molive/apm/fps/FpsTracer;->i:I

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Ll/g4j;->j(I)V

    .line 35
    .line 36
    .line 37
    new-instance v2, Lcom/immomo/molive/apm/fps/FpsTracer$a;

    .line 38
    .line 39
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v4

    .line 47
    iget v5, p0, Lcom/immomo/molive/apm/fps/FpsTracer;->i:I

    .line 48
    .line 49
    const/4 v7, 0x4

    .line 50
    const/4 v8, 0x0

    .line 51
    const/4 v6, 0x0

    .line 52
    move-object v3, p0

    .line 53
    invoke-direct/range {v2 .. v8}, Lcom/immomo/molive/apm/fps/FpsTracer$a;-><init>(Lcom/immomo/molive/apm/fps/FpsTracer;Ljava/lang/String;IIILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 54
    .line 55
    .line 56
    iput-object v2, v3, Lcom/immomo/molive/apm/fps/FpsTracer;->g:Lcom/immomo/molive/apm/fps/FpsTracer$a;

    .line 57
    .line 58
    sget-object p0, Ll/plq;->Companion:Ll/plq$a;

    .line 59
    .line 60
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 65
    .line 66
    .line 67
    iget-object v0, v3, Lcom/immomo/molive/apm/fps/FpsTracer;->g:Lcom/immomo/molive/apm/fps/FpsTracer$a;

    .line 68
    .line 69
    if-nez v0, :cond_0

    .line 70
    .line 71
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 72
    .line 73
    .line 74
    :cond_0
    const/4 v1, 0x1

    .line 75
    invoke-virtual {p0, p1, v0, v1}, Ll/plq$a;->a(Landroid/view/Window;Ll/plq$b;Z)Ll/plq;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    iput-object p0, v3, Lcom/immomo/molive/apm/fps/FpsTracer;->f:Ll/plq;

    .line 80
    .line 81
    if-eqz p0, :cond_1

    .line 82
    .line 83
    invoke-virtual {p0, v1}, Ll/plq;->e(Z)V

    .line 84
    .line 85
    .line 86
    :cond_1
    invoke-virtual {v3}, Lcom/immomo/molive/apm/fps/FpsTracer;->f()V

    .line 87
    .line 88
    .line 89
    return-void

    .line 90
    :cond_2
    move-object v3, p0

    .line 91
    const/4 p0, 0x0

    .line 92
    iput-boolean p0, v3, Lcom/immomo/molive/apm/fps/FpsTracer;->k:Z

    .line 93
    .line 94
    return-void
.end method

.method private final r(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/molive/apm/fps/FpsTracer;->l(Landroid/content/Context;)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iput p1, p0, Lcom/immomo/molive/apm/fps/FpsTracer;->i:I

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/immomo/molive/apm/fps/FpsTracer;->k()Ll/g4j;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iget v0, p0, Lcom/immomo/molive/apm/fps/FpsTracer;->i:I

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Ll/g4j;->j(I)V

    .line 14
    .line 15
    .line 16
    new-instance p1, Lcom/immomo/molive/apm/fps/FpsTracer$b;

    .line 17
    .line 18
    iget v0, p0, Lcom/immomo/molive/apm/fps/FpsTracer;->i:I

    .line 19
    .line 20
    invoke-direct {p1, p0, v0}, Lcom/immomo/molive/apm/fps/FpsTracer$b;-><init>(Lcom/immomo/molive/apm/fps/FpsTracer;I)V

    .line 21
    .line 22
    .line 23
    iput-object p1, p0, Lcom/immomo/molive/apm/fps/FpsTracer;->h:Lcom/immomo/molive/apm/fps/FpsTracer$b;

    .line 24
    .line 25
    invoke-direct {p0}, Lcom/immomo/molive/apm/fps/FpsTracer;->o()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/immomo/molive/apm/fps/FpsTracer;->f()V

    .line 29
    .line 30
    .line 31
    return-void
.end method


# virtual methods
.method public bridge synthetic c()Ll/erl;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/immomo/molive/apm/fps/FpsTracer;->n()Ll/g4j;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public f()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/immomo/molive/apm/fps/FpsTracer;->g:Lcom/immomo/molive/apm/fps/FpsTracer$a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/immomo/molive/apm/fps/FpsTracer;->f:Ll/plq;

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/immomo/molive/apm/fps/FpsTracer;->h:Lcom/immomo/molive/apm/fps/FpsTracer$b;

    .line 10
    .line 11
    if-eqz v0, :cond_2

    .line 12
    .line 13
    :cond_1
    invoke-super {p0}, Ll/cs2;->f()V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_2
    const/4 v0, 0x0

    .line 18
    iput-boolean v0, p0, Lcom/immomo/molive/apm/fps/FpsTracer;->k:Z

    .line 19
    .line 20
    return-void
.end method

.method public g()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/cs2;->g()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/immomo/molive/apm/fps/FpsTracer;->h:Lcom/immomo/molive/apm/fps/FpsTracer$b;

    .line 5
    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/immomo/molive/apm/fps/FpsTracer$b;->c()V

    .line 11
    .line 12
    .line 13
    :cond_0
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v1, p0, Lcom/immomo/molive/apm/fps/FpsTracer;->h:Lcom/immomo/molive/apm/fps/FpsTracer$b;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/view/Choreographer;->removeFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 20
    .line 21
    .line 22
    :cond_1
    const/4 v0, 0x0

    .line 23
    iput-object v0, p0, Lcom/immomo/molive/apm/fps/FpsTracer;->g:Lcom/immomo/molive/apm/fps/FpsTracer$a;

    .line 24
    .line 25
    iget-object v1, p0, Lcom/immomo/molive/apm/fps/FpsTracer;->f:Ll/plq;

    .line 26
    .line 27
    const/4 v2, 0x0

    .line 28
    if-eqz v1, :cond_2

    .line 29
    .line 30
    invoke-virtual {v1, v2}, Ll/plq;->e(Z)V

    .line 31
    .line 32
    .line 33
    :cond_2
    iput-object v0, p0, Lcom/immomo/molive/apm/fps/FpsTracer;->f:Ll/plq;

    .line 34
    .line 35
    iput v2, p0, Lcom/immomo/molive/apm/fps/FpsTracer;->i:I

    .line 36
    .line 37
    const/4 v0, 0x1

    .line 38
    iput-boolean v0, p0, Lcom/immomo/molive/apm/fps/FpsTracer;->k:Z

    .line 39
    .line 40
    return-void
.end method

.method public m()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/immomo/molive/apm/fps/FpsTracer;->k:Z

    .line 2
    .line 3
    return p0
.end method

.method public n()Ll/g4j;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/immomo/molive/apm/fps/FpsTracer;->g:Lcom/immomo/molive/apm/fps/FpsTracer$a;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-virtual {v0}, Lcom/immomo/molive/apm/fps/FpsTracer$a;->c()Ll/g4j;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0

    .line 15
    :cond_1
    iget-object v0, p0, Lcom/immomo/molive/apm/fps/FpsTracer;->h:Lcom/immomo/molive/apm/fps/FpsTracer$b;

    .line 16
    .line 17
    if-eqz v0, :cond_3

    .line 18
    .line 19
    if-nez v0, :cond_2

    .line 20
    .line 21
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 22
    .line 23
    .line 24
    :cond_2
    invoke-virtual {v0}, Lcom/immomo/molive/apm/fps/FpsTracer$b;->a()Ll/g4j;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0

    .line 29
    :cond_3
    invoke-direct {p0}, Lcom/immomo/molive/apm/fps/FpsTracer;->k()Ll/g4j;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0
.end method

.method public final p(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    instance-of v0, p1, Landroid/app/Activity;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p1, Landroid/app/Activity;

    .line 8
    .line 9
    invoke-direct {p0, p1}, Lcom/immomo/molive/apm/fps/FpsTracer;->q(Landroid/app/Activity;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-direct {p0, p1}, Lcom/immomo/molive/apm/fps/FpsTracer;->r(Landroid/content/Context;)V

    .line 14
    .line 15
    .line 16
    :cond_1
    return-void
.end method
