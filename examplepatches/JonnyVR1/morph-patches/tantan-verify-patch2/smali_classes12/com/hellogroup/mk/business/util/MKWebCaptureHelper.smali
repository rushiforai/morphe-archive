.class public final Lcom/hellogroup/mk/business/util/MKWebCaptureHelper;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00008\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0018\u0000 \u001c2\u00020\u0001:\u0001\u001cB\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u000f\u0010\u0005\u001a\u00020\u0004H\u0002\u00a2\u0006\u0004\u0008\u0005\u0010\u0003J!\u0010\n\u001a\u00020\u00042\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u00062\u0008\u0010\t\u001a\u0004\u0018\u00010\u0008\u00a2\u0006\u0004\u0008\n\u0010\u000bJ\u0017\u0010\u000c\u001a\u00020\u00042\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u0006\u00a2\u0006\u0004\u0008\u000c\u0010\rR\u0016\u0010\u0011\u001a\u00020\u000e8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u000f\u0010\u0010R\u0016\u0010\u0013\u001a\u00020\u000e8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0012\u0010\u0010R\u0016\u0010\u0017\u001a\u00020\u00148\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0015\u0010\u0016R\u0014\u0010\u001b\u001a\u00020\u00188BX\u0082\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0019\u0010\u001a\u00a8\u0006\u001d"
    }
    d2 = {
        "Lcom/hellogroup/mk/business/util/MKWebCaptureHelper;",
        "",
        "<init>",
        "()V",
        "",
        "k",
        "Lcom/hellogroup/mk/business/base/ui/MKWebView;",
        "mkWebView",
        "",
        "url",
        "g",
        "(Lcom/hellogroup/mk/business/base/ui/MKWebView;Ljava/lang/String;)V",
        "j",
        "(Lcom/hellogroup/mk/business/base/ui/MKWebView;)V",
        "Ljava/util/concurrent/atomic/AtomicBoolean;",
        "a",
        "Ljava/util/concurrent/atomic/AtomicBoolean;",
        "isReleasedCaptureTask",
        "b",
        "isLoadedCaptureTask",
        "Ll/po5;",
        "c",
        "Ll/po5;",
        "curCaptureJob",
        "Lkotlin/coroutines/CoroutineContext;",
        "h",
        "()Lkotlin/coroutines/CoroutineContext;",
        "captureCoroutineContext",
        "Companion",
        "MKBusiness_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation


# static fields
.field public static final Companion:Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$Companion;

.field private static d:Z

.field private static e:J

.field private static f:J

.field private static g:I

.field private static final h:Ll/po5;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field private a:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private b:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private c:Ll/po5;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$Companion;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper;->Companion:Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$Companion;

    .line 8
    .line 9
    const-wide v2, 0x9a7ec800L

    .line 10
    .line 11
    .line 12
    .line 13
    .line 14
    sput-wide v2, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper;->e:J

    .line 15
    .line 16
    const-wide/32 v2, 0x1f400000

    .line 17
    .line 18
    .line 19
    sput-wide v2, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper;->f:J

    .line 20
    .line 21
    const/16 v0, 0x32

    .line 22
    .line 23
    sput v0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper;->g:I

    .line 24
    .line 25
    const/4 v0, 0x1

    .line 26
    invoke-static {v1, v0, v1}, Ll/fpq;->b(Lkotlinx/coroutines/o;ILjava/lang/Object;)Ll/po5;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    sput-object v0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper;->h:Ll/po5;

    .line 31
    .line 32
    invoke-static {}, Ll/yfi;->z()Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    sput-boolean v0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper;->d:Z

    .line 37
    .line 38
    invoke-static {}, Ll/yfi;->A()I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    sput v0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper;->g:I

    .line 43
    .line 44
    invoke-static {}, Ll/yfi;->B()I

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    mul-int/lit16 v0, v0, 0x400

    .line 49
    .line 50
    int-to-long v0, v0

    .line 51
    const-wide/16 v2, 0x400

    .line 52
    .line 53
    mul-long/2addr v0, v2

    .line 54
    sput-wide v0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper;->f:J

    .line 55
    .line 56
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper;->a:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 11
    .line 12
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 13
    .line 14
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper;->b:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    const/4 v1, 0x1

    .line 21
    invoke-static {v0, v1, v0}, Ll/fpq;->b(Lkotlinx/coroutines/o;ILjava/lang/Object;)Ll/po5;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iput-object v0, p0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper;->c:Ll/po5;

    .line 26
    .line 27
    return-void
.end method

.method public static final synthetic a()J
    .locals 2

    .line 1
    sget-wide v0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper;->f:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static final synthetic b()J
    .locals 2

    .line 1
    sget-wide v0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper;->e:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static final synthetic c()Ll/po5;
    .locals 1

    .line 1
    sget-object v0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper;->h:Ll/po5;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic d()I
    .locals 1

    .line 1
    sget v0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper;->g:I

    .line 2
    .line 3
    return v0
.end method

.method public static final synthetic e(Lcom/hellogroup/mk/business/util/MKWebCaptureHelper;)Ljava/util/concurrent/atomic/AtomicBoolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper;->a:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic f()Z
    .locals 1

    .line 1
    sget-boolean v0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper;->d:Z

    .line 2
    .line 3
    return v0
.end method

.method private final h()Lkotlin/coroutines/CoroutineContext;
    .locals 1

    .line 1
    sget-object v0, Lcom/hellogroup/common/thread/MMDispatchers;->INSTANCE:Lcom/hellogroup/common/thread/MMDispatchers;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/hellogroup/common/thread/MMDispatchers;->b()Lkotlinx/coroutines/CoroutineDispatcher;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper;->c:Ll/po5;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lkotlin/coroutines/AbstractCoroutineContextElement;->plus(Lkotlin/coroutines/CoroutineContext;)Lkotlin/coroutines/CoroutineContext;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static final i()Z
    .locals 1

    .line 1
    sget-boolean v0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper;->d:Z

    return v0
.end method

.method private final k()V
    .locals 3

    .line 1
    const-string v0, "MKWebCaptureHelper"

    .line 2
    .line 3
    :try_start_0
    iget-object v1, p0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper;->b:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper;->c:Ll/po5;

    .line 12
    .line 13
    invoke-interface {p0}, Lkotlinx/coroutines/o;->isCancelled()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-nez v1, :cond_0

    .line 18
    .line 19
    const/4 v1, 0x1

    .line 20
    const/4 v2, 0x0

    .line 21
    invoke-static {p0, v2, v1, v2}, Lkotlinx/coroutines/o$a;->a(Lkotlinx/coroutines/o;Ljava/util/concurrent/CancellationException;ILjava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    const-string p0, "\u91ca\u653ereleaseCaptureTask"

    .line 25
    .line 26
    invoke-static {v0, p0}, Ll/jzv;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :catchall_0
    move-exception p0

    .line 31
    goto :goto_0

    .line 32
    :cond_0
    return-void

    .line 33
    :goto_0
    const-string v1, ""

    .line 34
    .line 35
    invoke-static {v0, v1, p0}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method


# virtual methods
.method public final g(Lcom/hellogroup/mk/business/base/ui/MKWebView;Ljava/lang/String;)V
    .locals 12
    .param p1    # Lcom/hellogroup/mk/business/base/ui/MKWebView;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    const-string v1, "MKWebCaptureHelper"

    .line 2
    .line 3
    if-eqz p1, :cond_1

    .line 4
    .line 5
    if-eqz p2, :cond_1

    .line 6
    .line 7
    :try_start_0
    sget-boolean v0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper;->d:Z

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper;->b:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper;->a:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_1

    .line 26
    .line 27
    const-string v0, "http"

    .line 28
    .line 29
    const/4 v2, 0x0

    .line 30
    const/4 v3, 0x2

    .line 31
    const/4 v4, 0x0

    .line 32
    invoke-static {p2, v0, v4, v3, v2}, Lkotlin/text/d;->J(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    const-string v0, "_capture"

    .line 39
    .line 40
    invoke-static {p2, v0, v4, v3, v2}, Lkotlin/text/StringsKt;->P(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZILjava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_1

    .line 45
    .line 46
    invoke-static {v1, p2}, Ll/jzv;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    new-instance v5, Ljava/lang/ref/WeakReference;

    .line 50
    .line 51
    invoke-direct {v5, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper;->c:Ll/po5;

    .line 55
    .line 56
    invoke-interface {v0}, Lkotlinx/coroutines/o;->isCancelled()Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-eqz v0, :cond_0

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_0
    iget-object v0, p0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper;->b:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 64
    .line 65
    const/4 v2, 0x1

    .line 66
    invoke-virtual {v0, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 67
    .line 68
    .line 69
    invoke-direct {p0}, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper;->h()Lkotlin/coroutines/CoroutineContext;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-static {v0}, Lkotlinx/coroutines/f;->a(Lkotlin/coroutines/CoroutineContext;)Ll/drb;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    new-instance v2, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$checkLoad$1;

    .line 78
    .line 79
    const/4 v7, 0x0

    .line 80
    move-object v3, p0

    .line 81
    move-object v6, p1

    .line 82
    move-object v4, p2

    .line 83
    invoke-direct/range {v2 .. v7}, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$checkLoad$1;-><init>(Lcom/hellogroup/mk/business/util/MKWebCaptureHelper;Ljava/lang/String;Ljava/lang/ref/WeakReference;Lcom/hellogroup/mk/business/base/ui/MKWebView;Lkotlin/coroutines/Continuation;)V

    .line 84
    .line 85
    .line 86
    const/4 v10, 0x3

    .line 87
    const/4 v11, 0x0

    .line 88
    const/4 v7, 0x0

    .line 89
    const/4 v8, 0x0

    .line 90
    move-object v6, v0

    .line 91
    move-object v9, v2

    .line 92
    invoke-static/range {v6 .. v11}, Ll/vh3;->d(Ll/drb;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/o;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 93
    .line 94
    .line 95
    return-void

    .line 96
    :catchall_0
    move-exception v0

    .line 97
    move-object p0, v0

    .line 98
    const-string p1, ""

    .line 99
    .line 100
    invoke-static {v1, p1, p0}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 101
    .line 102
    .line 103
    :cond_1
    :goto_0
    return-void
.end method

.method public final j(Lcom/hellogroup/mk/business/base/ui/MKWebView;)V
    .locals 6
    .param p1    # Lcom/hellogroup/mk/business/base/ui/MKWebView;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    sget-boolean v0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper;->d:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    if-eqz p1, :cond_2

    .line 7
    .line 8
    iget-object v0, p0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper;->a:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->O0()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    invoke-direct {p0}, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper;->k()V

    .line 21
    .line 22
    .line 23
    :cond_1
    invoke-virtual {p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->O0()Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-eqz p0, :cond_2

    .line 28
    .line 29
    const/4 p0, 0x0

    .line 30
    invoke-virtual {p1, p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->setLoadedCapture(Z)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1}, Landroid/view/View;->getForeground()Landroid/graphics/drawable/Drawable;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    if-eqz p0, :cond_2

    .line 38
    .line 39
    sget-object p0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper;->Companion:Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$Companion;

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$Companion;->h()Lkotlin/coroutines/CoroutineContext;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-static {p0}, Lkotlinx/coroutines/f;->a(Lkotlin/coroutines/CoroutineContext;)Ll/drb;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    sget-object p0, Lcom/hellogroup/common/thread/MMDispatchers;->INSTANCE:Lcom/hellogroup/common/thread/MMDispatchers;

    .line 50
    .line 51
    invoke-virtual {p0}, Lcom/hellogroup/common/thread/MMDispatchers;->a()Lkotlinx/coroutines/CoroutineDispatcher;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    new-instance v3, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$onRelease$1;

    .line 56
    .line 57
    const/4 p0, 0x0

    .line 58
    invoke-direct {v3, p1, p0}, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$onRelease$1;-><init>(Lcom/hellogroup/mk/business/base/ui/MKWebView;Lkotlin/coroutines/Continuation;)V

    .line 59
    .line 60
    .line 61
    const/4 v4, 0x2

    .line 62
    const/4 v5, 0x0

    .line 63
    const/4 v2, 0x0

    .line 64
    invoke-static/range {v0 .. v5}, Ll/vh3;->d(Ll/drb;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/o;

    .line 65
    .line 66
    .line 67
    :cond_2
    :goto_0
    return-void
.end method
