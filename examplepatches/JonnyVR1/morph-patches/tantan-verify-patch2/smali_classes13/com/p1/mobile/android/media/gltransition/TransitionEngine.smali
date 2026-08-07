.class public abstract Lcom/p1/mobile/android/media/gltransition/TransitionEngine;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/lifecycle/DefaultLifecycleObserver;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/android/media/gltransition/TransitionEngine$a;,
        Lcom/p1/mobile/android/media/gltransition/TransitionEngine$b;,
        Lcom/p1/mobile/android/media/gltransition/TransitionEngine$c;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u009e\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\t\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0004\n\u0002\u0010\u0007\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0008\n\u0002\u0010\u000b\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0008\u0008&\u0018\u0000 O2\u00020\u0001:\u0003PQRB\t\u0008\u0000\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u001f\u0010\u0007\u001a\u00020\u00052\u000e\u0008\u0002\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u00020\u00050\u0004H&\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J?\u0010\u0011\u001a\u00020\u00052\u000e\u0010\u000b\u001a\n\u0012\u0004\u0012\u00020\n\u0018\u00010\t2\u0008\u0008\u0002\u0010\r\u001a\u00020\u000c2\u0014\u0008\u0002\u0010\u0010\u001a\u000e\u0012\u0004\u0012\u00020\u000f\u0012\u0004\u0012\u00020\u00050\u000eH&\u00a2\u0006\u0004\u0008\u0011\u0010\u0012J?\u0010\u0015\u001a\u00020\u00052\u000e\u0010\u0014\u001a\n\u0012\u0004\u0012\u00020\u0013\u0018\u00010\t2\u0008\u0008\u0002\u0010\r\u001a\u00020\u000c2\u0014\u0008\u0002\u0010\u0010\u001a\u000e\u0012\u0004\u0012\u00020\u000f\u0012\u0004\u0012\u00020\u00050\u000eH&\u00a2\u0006\u0004\u0008\u0015\u0010\u0012J\'\u0010\u001b\u001a\u00020\u00052\u0006\u0010\u0017\u001a\u00020\u00162\u0006\u0010\u0019\u001a\u00020\u00182\u0006\u0010\u001a\u001a\u00020\u0018H&\u00a2\u0006\u0004\u0008\u001b\u0010\u001cJ%\u0010\u001f\u001a\u00020\u00052\u0014\u0008\u0002\u0010\u001e\u001a\u000e\u0012\u0004\u0012\u00020\u001d\u0012\u0004\u0012\u00020\u00050\u000eH&\u00a2\u0006\u0004\u0008\u001f\u0010 J\u000f\u0010!\u001a\u00020\u0005H&\u00a2\u0006\u0004\u0008!\u0010\u0003J\u001f\u0010%\u001a\u00020\u00052\u0006\u0010\"\u001a\u00020\n2\u0006\u0010$\u001a\u00020#H&\u00a2\u0006\u0004\u0008%\u0010&J\u001f\u0010+\u001a\u00020\u00052\u0006\u0010(\u001a\u00020\'2\u0006\u0010*\u001a\u00020)H&\u00a2\u0006\u0004\u0008+\u0010,J\u001f\u00100\u001a\u00020\u00052\u0006\u0010-\u001a\u00020\u00182\u0006\u0010/\u001a\u00020.H&\u00a2\u0006\u0004\u00080\u00101J\u000f\u00102\u001a\u00020\u0005H&\u00a2\u0006\u0004\u00082\u0010\u0003J\u000f\u00103\u001a\u00020\u0005H&\u00a2\u0006\u0004\u00083\u0010\u0003J\u001f\u00106\u001a\u00020\u00052\u000e\u0008\u0002\u00104\u001a\u0008\u0012\u0004\u0012\u00020\u00050\u0004H \u00a2\u0006\u0004\u00085\u0010\u0008J5\u0010<\u001a\u00020\u00052\u0006\u00108\u001a\u0002072\u0006\u0010\u001e\u001a\u00020\u001d2\u0014\u0008\u0002\u00109\u001a\u000e\u0012\u0004\u0012\u00020\u0018\u0012\u0004\u0012\u00020\u00050\u000eH \u00a2\u0006\u0004\u0008:\u0010;J\'\u0010B\u001a\u00020?2\u0006\u0010>\u001a\u00020=2\u000e\u0008\u0002\u00104\u001a\u0008\u0012\u0004\u0012\u00020\u00050\u0004H \u00a2\u0006\u0004\u0008@\u0010AJ\u0017\u0010G\u001a\u00020\u00052\u0006\u0010D\u001a\u00020CH \u00a2\u0006\u0004\u0008E\u0010FJ\u001f\u0010G\u001a\u00020\u00052\u0006\u0010I\u001a\u00020H2\u0006\u00103\u001a\u000207H \u00a2\u0006\u0004\u0008E\u0010JJ\u000f\u0010N\u001a\u00020KH \u00a2\u0006\u0004\u0008L\u0010M\u00a8\u0006S"
    }
    d2 = {
        "Lcom/p1/mobile/android/media/gltransition/TransitionEngine;",
        "Landroidx/lifecycle/DefaultLifecycleObserver;",
        "<init>",
        "()V",
        "Lkotlin/Function0;",
        "",
        "log",
        "setLogger",
        "(Lkotlin/jvm/functions/Function0;)V",
        "",
        "",
        "images",
        "Ll/del0;",
        "format",
        "Lkotlin/Function1;",
        "",
        "onLoaded",
        "loadImageFromPath",
        "(Ljava/util/List;Ll/del0;Lkotlin/jvm/functions/Function1;)V",
        "Landroid/net/Uri;",
        "uris",
        "loadImageFromUri",
        "Landroid/view/TextureView;",
        "textureView",
        "",
        "previewWidth",
        "previewHeight",
        "setPreview",
        "(Landroid/view/TextureView;II)V",
        "",
        "progress",
        "play",
        "(Lkotlin/jvm/functions/Function1;)V",
        "pause",
        "output",
        "Lcom/p1/mobile/android/media/gltransition/TransitionEngine$c;",
        "exportListener",
        "exportVideo",
        "(Ljava/lang/String;Lcom/p1/mobile/android/media/gltransition/TransitionEngine$c;)V",
        "Ll/vdl0;",
        "videoEntry",
        "Lcom/p1/mobile/android/media/gltransition/TransitionEngine$b;",
        "assembleListener",
        "assembleVideo",
        "(Ll/vdl0;Lcom/p1/mobile/android/media/gltransition/TransitionEngine$b;)V",
        "index",
        "Ll/ahj0;",
        "transition",
        "setTransitionAt",
        "(ILl/ahj0;)V",
        "cancel",
        "release",
        "runnable",
        "render$android_release",
        "render",
        "",
        "renderToSurface",
        "onDraw",
        "processFrame$android_release",
        "(ZFLkotlin/jvm/functions/Function1;)V",
        "processFrame",
        "Lkotlinx/coroutines/CoroutineDispatcher;",
        "dispatcher",
        "Lkotlinx/coroutines/o;",
        "launch$android_release",
        "(Lkotlinx/coroutines/CoroutineDispatcher;Lkotlin/jvm/functions/Function0;)Lkotlinx/coroutines/o;",
        "launch",
        "Landroid/graphics/SurfaceTexture;",
        "texture",
        "createWindowSurface$android_release",
        "(Landroid/graphics/SurfaceTexture;)V",
        "createWindowSurface",
        "Landroid/view/Surface;",
        "surface",
        "(Landroid/view/Surface;Z)V",
        "Ll/gse;",
        "requireEglCore$android_release",
        "()Ll/gse;",
        "requireEglCore",
        "Companion",
        "a",
        "c",
        "b",
        "android_release"
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
.field public static final Companion:Lcom/p1/mobile/android/media/gltransition/TransitionEngine$a;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/p1/mobile/android/media/gltransition/TransitionEngine$a;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/p1/mobile/android/media/gltransition/TransitionEngine$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/p1/mobile/android/media/gltransition/TransitionEngine;->Companion:Lcom/p1/mobile/android/media/gltransition/TransitionEngine$a;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a()Lkotlin/Unit;
    .locals 1

    .line 1
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 2
    .line 3
    return-object v0
.end method

.method public static b()Lkotlin/Unit;
    .locals 1

    .line 1
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 2
    .line 3
    return-object v0
.end method

.method public static c()Lkotlin/Unit;
    .locals 1

    .line 1
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final create(Ll/ker;)Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;
    .locals 1
    .param p0    # Ll/ker;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/android/media/gltransition/TransitionEngine;->Companion:Lcom/p1/mobile/android/media/gltransition/TransitionEngine$a;

    invoke-virtual {v0, p0}, Lcom/p1/mobile/android/media/gltransition/TransitionEngine$a;->a(Ll/ker;)Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;

    move-result-object p0

    return-object p0
.end method

.method public static d(J)Lkotlin/Unit;
    .locals 0

    .line 1
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 2
    .line 3
    return-object p0
.end method

.method public static e(F)Lkotlin/Unit;
    .locals 0

    .line 1
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 2
    .line 3
    return-object p0
.end method

.method public static f(I)Lkotlin/Unit;
    .locals 0

    .line 1
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 2
    .line 3
    return-object p0
.end method

.method public static g(J)Lkotlin/Unit;
    .locals 0

    .line 1
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic launch$android_release$default(Lcom/p1/mobile/android/media/gltransition/TransitionEngine;Lkotlinx/coroutines/CoroutineDispatcher;Lkotlin/jvm/functions/Function0;ILjava/lang/Object;)Lkotlinx/coroutines/o;
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
    new-instance p2, Ll/hhj0;

    .line 8
    .line 9
    invoke-direct {p2}, Ll/hhj0;-><init>()V

    .line 10
    .line 11
    .line 12
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/android/media/gltransition/TransitionEngine;->launch$android_release(Lkotlinx/coroutines/CoroutineDispatcher;Lkotlin/jvm/functions/Function0;)Lkotlinx/coroutines/o;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0

    .line 17
    :cond_1
    const-string p0, "Super calls with default arguments not supported in this target, function: launch"

    .line 18
    .line 19
    invoke-static {p0}, Ll/pr3;->a(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    const/4 p0, 0x0

    .line 23
    return-object p0
.end method

.method public static synthetic loadImageFromPath$default(Lcom/p1/mobile/android/media/gltransition/TransitionEngine;Ljava/util/List;Ll/del0;Lkotlin/jvm/functions/Function1;ILjava/lang/Object;)V
    .locals 0

    .line 1
    if-nez p5, :cond_2

    .line 2
    .line 3
    and-int/lit8 p5, p4, 0x2

    .line 4
    .line 5
    if-eqz p5, :cond_0

    .line 6
    .line 7
    sget-object p2, Ll/del0;->Companion:Ll/del0$a;

    .line 8
    .line 9
    invoke-virtual {p2}, Ll/del0$a;->b()Ll/del0;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    :cond_0
    and-int/lit8 p4, p4, 0x4

    .line 14
    .line 15
    if-eqz p4, :cond_1

    .line 16
    .line 17
    new-instance p3, Ll/ehj0;

    .line 18
    .line 19
    invoke-direct {p3}, Ll/ehj0;-><init>()V

    .line 20
    .line 21
    .line 22
    :cond_1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/android/media/gltransition/TransitionEngine;->loadImageFromPath(Ljava/util/List;Ll/del0;Lkotlin/jvm/functions/Function1;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_2
    const-string p0, "Super calls with default arguments not supported in this target, function: loadImageFromPath"

    .line 27
    .line 28
    invoke-static {p0}, Ll/pr3;->a(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public static synthetic loadImageFromUri$default(Lcom/p1/mobile/android/media/gltransition/TransitionEngine;Ljava/util/List;Ll/del0;Lkotlin/jvm/functions/Function1;ILjava/lang/Object;)V
    .locals 0

    .line 1
    if-nez p5, :cond_2

    .line 2
    .line 3
    and-int/lit8 p5, p4, 0x2

    .line 4
    .line 5
    if-eqz p5, :cond_0

    .line 6
    .line 7
    sget-object p2, Ll/del0;->Companion:Ll/del0$a;

    .line 8
    .line 9
    invoke-virtual {p2}, Ll/del0$a;->b()Ll/del0;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    :cond_0
    and-int/lit8 p4, p4, 0x4

    .line 14
    .line 15
    if-eqz p4, :cond_1

    .line 16
    .line 17
    new-instance p3, Ll/bhj0;

    .line 18
    .line 19
    invoke-direct {p3}, Ll/bhj0;-><init>()V

    .line 20
    .line 21
    .line 22
    :cond_1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/android/media/gltransition/TransitionEngine;->loadImageFromUri(Ljava/util/List;Ll/del0;Lkotlin/jvm/functions/Function1;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_2
    const-string p0, "Super calls with default arguments not supported in this target, function: loadImageFromUri"

    .line 27
    .line 28
    invoke-static {p0}, Ll/pr3;->a(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public static synthetic play$default(Lcom/p1/mobile/android/media/gltransition/TransitionEngine;Lkotlin/jvm/functions/Function1;ILjava/lang/Object;)V
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
    new-instance p1, Ll/dhj0;

    .line 8
    .line 9
    invoke-direct {p1}, Ll/dhj0;-><init>()V

    .line 10
    .line 11
    .line 12
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/media/gltransition/TransitionEngine;->play(Lkotlin/jvm/functions/Function1;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_1
    const-string p0, "Super calls with default arguments not supported in this target, function: play"

    .line 17
    .line 18
    invoke-static {p0}, Ll/pr3;->a(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static synthetic processFrame$android_release$default(Lcom/p1/mobile/android/media/gltransition/TransitionEngine;ZFLkotlin/jvm/functions/Function1;ILjava/lang/Object;)V
    .locals 0

    .line 1
    if-nez p5, :cond_1

    .line 2
    .line 3
    and-int/lit8 p4, p4, 0x4

    .line 4
    .line 5
    if-eqz p4, :cond_0

    .line 6
    .line 7
    new-instance p3, Ll/chj0;

    .line 8
    .line 9
    invoke-direct {p3}, Ll/chj0;-><init>()V

    .line 10
    .line 11
    .line 12
    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/android/media/gltransition/TransitionEngine;->processFrame$android_release(ZFLkotlin/jvm/functions/Function1;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_1
    const-string p0, "Super calls with default arguments not supported in this target, function: processFrame"

    .line 17
    .line 18
    invoke-static {p0}, Ll/pr3;->a(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static synthetic render$android_release$default(Lcom/p1/mobile/android/media/gltransition/TransitionEngine;Lkotlin/jvm/functions/Function0;ILjava/lang/Object;)V
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
    new-instance p1, Ll/ghj0;

    .line 8
    .line 9
    invoke-direct {p1}, Ll/ghj0;-><init>()V

    .line 10
    .line 11
    .line 12
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/media/gltransition/TransitionEngine;->render$android_release(Lkotlin/jvm/functions/Function0;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_1
    const-string p0, "Super calls with default arguments not supported in this target, function: render"

    .line 17
    .line 18
    invoke-static {p0}, Ll/pr3;->a(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static synthetic setLogger$default(Lcom/p1/mobile/android/media/gltransition/TransitionEngine;Lkotlin/jvm/functions/Function0;ILjava/lang/Object;)V
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
    new-instance p1, Ll/fhj0;

    .line 8
    .line 9
    invoke-direct {p1}, Ll/fhj0;-><init>()V

    .line 10
    .line 11
    .line 12
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/media/gltransition/TransitionEngine;->setLogger(Lkotlin/jvm/functions/Function0;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_1
    const-string p0, "Super calls with default arguments not supported in this target, function: setLogger"

    .line 17
    .line 18
    invoke-static {p0}, Ll/pr3;->a(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public abstract assembleVideo(Ll/vdl0;Lcom/p1/mobile/android/media/gltransition/TransitionEngine$b;)V
    .param p1    # Ll/vdl0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/android/media/gltransition/TransitionEngine$b;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
.end method

.method public abstract cancel()V
.end method

.method public abstract createWindowSurface$android_release(Landroid/graphics/SurfaceTexture;)V
    .param p1    # Landroid/graphics/SurfaceTexture;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
.end method

.method public abstract createWindowSurface$android_release(Landroid/view/Surface;Z)V
    .param p1    # Landroid/view/Surface;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
.end method

.method public abstract exportVideo(Ljava/lang/String;Lcom/p1/mobile/android/media/gltransition/TransitionEngine$c;)V
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/android/media/gltransition/TransitionEngine$c;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
.end method

.method public abstract launch$android_release(Lkotlinx/coroutines/CoroutineDispatcher;Lkotlin/jvm/functions/Function0;)Lkotlinx/coroutines/o;
    .param p1    # Lkotlinx/coroutines/CoroutineDispatcher;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lkotlin/jvm/functions/Function0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlinx/coroutines/CoroutineDispatcher;",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;)",
            "Lkotlinx/coroutines/o;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end method

.method public abstract loadImageFromPath(Ljava/util/List;Ll/del0;Lkotlin/jvm/functions/Function1;)V
    .param p1    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Ll/del0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Lkotlin/jvm/functions/Function1;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ll/del0;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Ljava/lang/Long;",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract loadImageFromUri(Ljava/util/List;Ll/del0;Lkotlin/jvm/functions/Function1;)V
    .param p1    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Ll/del0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Lkotlin/jvm/functions/Function1;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Landroid/net/Uri;",
            ">;",
            "Ll/del0;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Ljava/lang/Long;",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation
.end method

.method public bridge onCreate(Ll/ker;)V
    .locals 0
    .param p1    # Ll/ker;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroidx/lifecycle/DefaultLifecycleObserver;->onCreate(Ll/ker;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge onDestroy(Ll/ker;)V
    .locals 0
    .param p1    # Ll/ker;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroidx/lifecycle/DefaultLifecycleObserver;->onDestroy(Ll/ker;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge onPause(Ll/ker;)V
    .locals 0
    .param p1    # Ll/ker;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroidx/lifecycle/DefaultLifecycleObserver;->onPause(Ll/ker;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge onResume(Ll/ker;)V
    .locals 0
    .param p1    # Ll/ker;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroidx/lifecycle/DefaultLifecycleObserver;->onResume(Ll/ker;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge onStart(Ll/ker;)V
    .locals 0
    .param p1    # Ll/ker;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroidx/lifecycle/DefaultLifecycleObserver;->onStart(Ll/ker;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge onStop(Ll/ker;)V
    .locals 0
    .param p1    # Ll/ker;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroidx/lifecycle/DefaultLifecycleObserver;->onStop(Ll/ker;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public abstract pause()V
.end method

.method public abstract play(Lkotlin/jvm/functions/Function1;)V
    .param p1    # Lkotlin/jvm/functions/Function1;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Ljava/lang/Float;",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract processFrame$android_release(ZFLkotlin/jvm/functions/Function1;)V
    .param p3    # Lkotlin/jvm/functions/Function1;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZF",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Ljava/lang/Integer;",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract release()V
.end method

.method public abstract render$android_release(Lkotlin/jvm/functions/Function0;)V
    .param p1    # Lkotlin/jvm/functions/Function0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract requireEglCore$android_release()Ll/gse;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end method

.method public abstract setLogger(Lkotlin/jvm/functions/Function0;)V
    .param p1    # Lkotlin/jvm/functions/Function0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract setPreview(Landroid/view/TextureView;II)V
    .param p1    # Landroid/view/TextureView;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
.end method

.method public abstract setTransitionAt(ILl/ahj0;)V
    .param p2    # Ll/ahj0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
.end method
