.class public final Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView$a;,
        Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView$b;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000b\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0012\n\u0002\u0018\u0002\n\u0002\u0008\u000f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0011\u0008\u0000\u0018\u0000 M2\u00020\u0001:\u0001$B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\'\u0010\r\u001a\u00020\u000c2\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\t\u001a\u00020\u00082\u0006\u0010\u000b\u001a\u00020\nH\u0002\u00a2\u0006\u0004\u0008\r\u0010\u000eJ\u0019\u0010\u0012\u001a\u00020\u00112\u0008\u0010\u0010\u001a\u0004\u0018\u00010\u000fH\u0002\u00a2\u0006\u0004\u0008\u0012\u0010\u0013J/\u0010\u0017\u001a\u00020\u00162\u0006\u0010\u0015\u001a\u00020\u00142\u0006\u0010\t\u001a\u00020\u00082\u0006\u0010\u000b\u001a\u00020\n2\u0006\u0010\u0007\u001a\u00020\u0006H\u0002\u00a2\u0006\u0004\u0008\u0017\u0010\u0018J-\u0010\u001b\u001a\u00020\u00112\u0006\u0010\u001a\u001a\u00020\u00192\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\t\u001a\u00020\u00082\u0006\u0010\u000b\u001a\u00020\n\u00a2\u0006\u0004\u0008\u001b\u0010\u001cJ%\u0010\u001d\u001a\u00020\u00112\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\t\u001a\u00020\u00082\u0006\u0010\u000b\u001a\u00020\n\u00a2\u0006\u0004\u0008\u001d\u0010\u001eJ\u000f\u0010\u001f\u001a\u0004\u0018\u00010\u0011\u00a2\u0006\u0004\u0008\u001f\u0010 J\u000f\u0010!\u001a\u0004\u0018\u00010\u0011\u00a2\u0006\u0004\u0008!\u0010 J\u000f\u0010\"\u001a\u0004\u0018\u00010\u0011\u00a2\u0006\u0004\u0008\"\u0010 J\u000f\u0010#\u001a\u0004\u0018\u00010\u0011\u00a2\u0006\u0004\u0008#\u0010 R\u0018\u0010&\u001a\u0004\u0018\u00010\u00168\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008$\u0010%R\u0018\u0010\u0007\u001a\u0004\u0018\u00010\u00068\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\'\u0010(R\u0016\u0010+\u001a\u00020\u000c8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008)\u0010*R*\u00103\u001a\n\u0012\u0004\u0012\u00020\u0011\u0018\u00010,8\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008-\u0010.\u001a\u0004\u0008/\u00100\"\u0004\u00081\u00102R*\u00107\u001a\n\u0012\u0004\u0012\u00020\u0011\u0018\u00010,8\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u00084\u0010.\u001a\u0004\u00085\u00100\"\u0004\u00086\u00102R*\u0010;\u001a\n\u0012\u0004\u0012\u00020\u0011\u0018\u00010,8\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u00088\u0010.\u001a\u0004\u00089\u00100\"\u0004\u0008:\u00102R?\u0010F\u001a\u001f\u0012\u0013\u0012\u00110\u000c\u00a2\u0006\u000c\u0008=\u0012\u0008\u0008>\u0012\u0004\u0008\u0008(?\u0012\u0004\u0012\u00020\u0011\u0018\u00010<8\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008@\u0010A\u001a\u0004\u0008B\u0010C\"\u0004\u0008D\u0010ER\u0011\u0010I\u001a\u00020\u000c8F\u00a2\u0006\u0006\u001a\u0004\u0008G\u0010HR\u0011\u0010?\u001a\u00020\u000c8F\u00a2\u0006\u0006\u001a\u0004\u0008J\u0010HR\u0011\u0010L\u001a\u00020\u000c8F\u00a2\u0006\u0006\u001a\u0004\u0008K\u0010H\u00a8\u0006N"
    }
    d2 = {
        "Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;",
        "Landroid/widget/FrameLayout;",
        "Landroid/content/Context;",
        "context",
        "<init>",
        "(Landroid/content/Context;)V",
        "Ll/dc60;",
        "session",
        "Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider;",
        "resourceProvider",
        "Ljava/util/concurrent/ExecutorService;",
        "mediaExecutor",
        "",
        "r",
        "(Ll/dc60;Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider;Ljava/util/concurrent/ExecutorService;)Z",
        "Ll/fc60;",
        "wrapper",
        "",
        "i",
        "(Ll/fc60;)V",
        "Lcom/clevertap/android/sdk/inapp/pipsdk/PIPMediaType;",
        "mediaType",
        "Ll/i3y;",
        "j",
        "(Lcom/clevertap/android/sdk/inapp/pipsdk/PIPMediaType;Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider;Ljava/util/concurrent/ExecutorService;Ll/dc60;)Ll/i3y;",
        "Lcom/clevertap/android/sdk/inapp/pipsdk/a;",
        "config",
        "k",
        "(Lcom/clevertap/android/sdk/inapp/pipsdk/a;Ll/dc60;Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider;Ljava/util/concurrent/ExecutorService;)V",
        "p",
        "(Ll/dc60;Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider;Ljava/util/concurrent/ExecutorService;)V",
        "q",
        "()Lkotlin/Unit;",
        "o",
        "t",
        "s",
        "a",
        "Ll/i3y;",
        "renderer",
        "b",
        "Ll/dc60;",
        "c",
        "Z",
        "fellBackToImage",
        "Lkotlin/Function0;",
        "d",
        "Lkotlin/jvm/functions/Function0;",
        "getOnVideoFallback",
        "()Lkotlin/jvm/functions/Function0;",
        "setOnVideoFallback",
        "(Lkotlin/jvm/functions/Function0;)V",
        "onVideoFallback",
        "e",
        "getOnMediaReady",
        "setOnMediaReady",
        "onMediaReady",
        "f",
        "getOnAllMediaFailed",
        "setOnAllMediaFailed",
        "onAllMediaFailed",
        "Lkotlin/Function1;",
        "Lkotlin/ParameterName;",
        "name",
        "isPlaying",
        "g",
        "Lkotlin/jvm/functions/Function1;",
        "getOnPlayStateChanged",
        "()Lkotlin/jvm/functions/Function1;",
        "setOnPlayStateChanged",
        "(Lkotlin/jvm/functions/Function1;)V",
        "onPlayStateChanged",
        "n",
        "()Z",
        "isVideoType",
        "m",
        "l",
        "isMuted",
        "Companion",
        "clevertap-core_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# static fields
.field private static final Companion:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView$a;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field private a:Ll/i3y;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private b:Ll/dc60;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private c:Z

.field private d:Lkotlin/jvm/functions/Function0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private e:Lkotlin/jvm/functions/Function0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private f:Lkotlin/jvm/functions/Function0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private g:Lkotlin/jvm/functions/Function1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Ljava/lang/Boolean;",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView$a;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;->Companion:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView$a;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static a(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static b(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;->e:Lkotlin/jvm/functions/Function0;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    :cond_0
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 12
    .line 13
    return-object p0
.end method

.method public static c(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;->e:Lkotlin/jvm/functions/Function0;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    :cond_0
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 12
    .line 13
    return-object p0
.end method

.method public static d(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;->f:Lkotlin/jvm/functions/Function0;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    :cond_0
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 12
    .line 13
    return-object p0
.end method

.method public static e(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;Ljava/lang/Runnable;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, p1}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 8
    .line 9
    .line 10
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 11
    .line 12
    .line 13
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 14
    .line 15
    return-object p0
.end method

.method public static f(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;)Lkotlin/Unit;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;->c:Z

    .line 6
    .line 7
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;->d:Lkotlin/jvm/functions/Function0;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    :cond_0
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 15
    .line 16
    return-object p0
.end method

.method public static g(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;->f:Lkotlin/jvm/functions/Function0;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    :cond_0
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 12
    .line 13
    return-object p0
.end method

.method public static h()Z
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    return v0
.end method

.method private final i(Ll/fc60;)V
    .locals 4

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    new-instance v0, Landroid/view/View;

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-direct {v0, v1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 11
    .line 12
    .line 13
    const/high16 v1, -0x1000000

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 16
    .line 17
    .line 18
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 19
    .line 20
    const/4 v2, -0x1

    .line 21
    invoke-direct {v1, v2, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 25
    .line 26
    .line 27
    new-instance v1, Ll/ib60;

    .line 28
    .line 29
    invoke-direct {v1, p0, v0}, Ll/ib60;-><init>(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;Landroid/view/View;)V

    .line 30
    .line 31
    .line 32
    new-instance v0, Ll/jb60;

    .line 33
    .line 34
    invoke-direct {v0, p0, v1}, Ll/jb60;-><init>(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;Ljava/lang/Runnable;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1, v0}, Ll/fc60;->h(Lkotlin/jvm/functions/Function0;)V

    .line 38
    .line 39
    .line 40
    const-wide/16 v2, 0xbb8

    .line 41
    .line 42
    invoke-virtual {p0, v1, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method private final j(Lcom/clevertap/android/sdk/inapp/pipsdk/PIPMediaType;Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider;Ljava/util/concurrent/ExecutorService;Ll/dc60;)Ll/i3y;
    .locals 1

    .line 1
    sget-object v0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView$b;->a:[I

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    aget p1, v0, p1

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    if-eq p1, v0, :cond_2

    .line 11
    .line 12
    const/4 v0, 0x2

    .line 13
    if-eq p1, v0, :cond_1

    .line 14
    .line 15
    const/4 v0, 0x3

    .line 16
    if-ne p1, v0, :cond_0

    .line 17
    .line 18
    new-instance p1, Ll/ljl0;

    .line 19
    .line 20
    invoke-direct {p1, p2, p3}, Ll/ljl0;-><init>(Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider;Ljava/util/concurrent/ExecutorService;)V

    .line 21
    .line 22
    .line 23
    new-instance p2, Ll/cb60;

    .line 24
    .line 25
    invoke-direct {p2, p0}, Ll/cb60;-><init>(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1, p2}, Ll/ljl0;->u(Lkotlin/jvm/functions/Function0;)V

    .line 29
    .line 30
    .line 31
    new-instance p2, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView$c;

    .line 32
    .line 33
    invoke-direct {p2, p4, p0}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView$c;-><init>(Ll/dc60;Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1, p2}, Ll/ljl0;->v(Ll/kzc0;)V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    invoke-static {}, Ll/nbr;->a()V

    .line 41
    .line 42
    .line 43
    const/4 p0, 0x0

    .line 44
    return-object p0

    .line 45
    :cond_1
    new-instance p1, Ll/snj;

    .line 46
    .line 47
    invoke-direct {p1, p2, p3}, Ll/snj;-><init>(Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider;Ljava/util/concurrent/ExecutorService;)V

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_2
    new-instance p1, Ll/jkm;

    .line 52
    .line 53
    invoke-direct {p1, p2, p3}, Ll/jkm;-><init>(Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider;Ljava/util/concurrent/ExecutorService;)V

    .line 54
    .line 55
    .line 56
    :goto_0
    new-instance p2, Ll/db60;

    .line 57
    .line 58
    invoke-direct {p2, p0}, Ll/db60;-><init>(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;)V

    .line 59
    .line 60
    .line 61
    invoke-interface {p1, p2}, Ll/i3y;->d(Lkotlin/jvm/functions/Function0;)V

    .line 62
    .line 63
    .line 64
    new-instance p2, Ll/eb60;

    .line 65
    .line 66
    invoke-direct {p2, p0}, Ll/eb60;-><init>(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;)V

    .line 67
    .line 68
    .line 69
    invoke-interface {p1, p2}, Ll/i3y;->e(Lkotlin/jvm/functions/Function0;)V

    .line 70
    .line 71
    .line 72
    return-object p1
.end method

.method private final r(Ll/dc60;Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider;Ljava/util/concurrent/ExecutorService;)Z
    .locals 15

    .line 1
    invoke-virtual/range {p1 .. p1}, Ll/dc60;->b()Lcom/clevertap/android/sdk/inapp/pipsdk/a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->o()Lcom/clevertap/android/sdk/inapp/pipsdk/PIPMediaType;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget-object v1, Lcom/clevertap/android/sdk/inapp/pipsdk/PIPMediaType;->VIDEO:Lcom/clevertap/android/sdk/inapp/pipsdk/PIPMediaType;

    .line 10
    .line 11
    if-ne v0, v1, :cond_0

    .line 12
    .line 13
    invoke-virtual/range {p1 .. p1}, Ll/dc60;->h()Ll/fc60;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    sget-object v0, Ll/k5g;->INSTANCE:Ll/k5g;

    .line 20
    .line 21
    new-instance v1, Ll/l5g;

    .line 22
    .line 23
    invoke-virtual/range {p1 .. p1}, Ll/dc60;->b()Lcom/clevertap/android/sdk/inapp/pipsdk/a;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {v2}, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->k()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    invoke-virtual/range {p1 .. p1}, Ll/dc60;->b()Lcom/clevertap/android/sdk/inapp/pipsdk/a;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-virtual {v2}, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->p()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    new-instance v7, Ll/fb60;

    .line 40
    .line 41
    invoke-direct {v7}, Ll/fb60;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-virtual/range {p1 .. p1}, Ll/dc60;->b()Lcom/clevertap/android/sdk/inapp/pipsdk/a;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-virtual {v2}, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->h()Ll/m960;

    .line 49
    .line 50
    .line 51
    move-result-object v8

    .line 52
    new-instance v11, Ll/gb60;

    .line 53
    .line 54
    invoke-direct {v11, p0}, Ll/gb60;-><init>(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;)V

    .line 55
    .line 56
    .line 57
    new-instance v12, Ll/hb60;

    .line 58
    .line 59
    invoke-direct {v12, p0}, Ll/hb60;-><init>(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;)V

    .line 60
    .line 61
    .line 62
    const/16 v13, 0x100

    .line 63
    .line 64
    const/4 v14, 0x0

    .line 65
    const-string v9, "Fallback reload after rotation"

    .line 66
    .line 67
    const/4 v10, 0x0

    .line 68
    move-object v2, p0

    .line 69
    move-object/from16 v5, p2

    .line 70
    .line 71
    move-object/from16 v6, p3

    .line 72
    .line 73
    invoke-direct/range {v1 .. v14}, Ll/l5g;-><init>(Landroid/view/ViewGroup;Ljava/lang/String;Ljava/lang/String;Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider;Ljava/util/concurrent/ExecutorService;Lkotlin/jvm/functions/Function0;Ll/m960;Ljava/lang/String;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v0, v1}, Ll/k5g;->d(Ll/l5g;)V

    .line 77
    .line 78
    .line 79
    const/4 p0, 0x1

    .line 80
    return p0

    .line 81
    :cond_0
    const/4 p0, 0x0

    .line 82
    return p0
.end method


# virtual methods
.method public final getOnAllMediaFailed()Lkotlin/jvm/functions/Function0;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;->f:Lkotlin/jvm/functions/Function0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getOnMediaReady()Lkotlin/jvm/functions/Function0;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;->e:Lkotlin/jvm/functions/Function0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getOnPlayStateChanged()Lkotlin/jvm/functions/Function1;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlin/jvm/functions/Function1<",
            "Ljava/lang/Boolean;",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;->g:Lkotlin/jvm/functions/Function1;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getOnVideoFallback()Lkotlin/jvm/functions/Function0;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;->d:Lkotlin/jvm/functions/Function0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final k(Lcom/clevertap/android/sdk/inapp/pipsdk/a;Ll/dc60;Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider;Ljava/util/concurrent/ExecutorService;)V
    .locals 1
    .param p1    # Lcom/clevertap/android/sdk/inapp/pipsdk/a;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ll/dc60;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p4    # Ljava/util/concurrent/ExecutorService;
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
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 14
    .line 15
    .line 16
    iput-object p2, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;->b:Ll/dc60;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput-boolean v0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;->c:Z

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->o()Lcom/clevertap/android/sdk/inapp/pipsdk/PIPMediaType;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-direct {p0, v0, p3, p4, p2}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;->j(Lcom/clevertap/android/sdk/inapp/pipsdk/PIPMediaType;Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider;Ljava/util/concurrent/ExecutorService;Ll/dc60;)Ll/i3y;

    .line 26
    .line 27
    .line 28
    move-result-object p3

    .line 29
    iput-object p3, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;->a:Ll/i3y;

    .line 30
    .line 31
    if-eqz p3, :cond_0

    .line 32
    .line 33
    invoke-interface {p3, p0, p1, p2}, Ll/i3y;->g(Landroid/view/ViewGroup;Lcom/clevertap/android/sdk/inapp/pipsdk/a;Ll/dc60;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->n()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    invoke-static {p2}, Lkotlin/text/StringsKt;->e0(Ljava/lang/CharSequence;)Z

    .line 41
    .line 42
    .line 43
    move-result p2

    .line 44
    if-nez p2, :cond_1

    .line 45
    .line 46
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->n()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {p0, p1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 51
    .line 52
    .line 53
    :cond_1
    return-void
.end method

.method public final l()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;->a:Ll/i3y;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/i3y;->b()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public final m()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;->a:Ll/i3y;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/i3y;->isPlaying()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public final n()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;->a:Ll/i3y;

    .line 2
    .line 3
    instance-of v0, v0, Ll/ljl0;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-boolean p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;->c:Z

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public final o()Lkotlin/Unit;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;->a:Ll/i3y;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/i3y;->h()V

    .line 6
    .line 7
    .line 8
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 9
    .line 10
    return-object p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final p(Ll/dc60;Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider;Ljava/util/concurrent/ExecutorService;)V
    .locals 1
    .param p1    # Ll/dc60;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ljava/util/concurrent/ExecutorService;
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
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;->b:Ll/dc60;

    .line 14
    .line 15
    invoke-direct {p0, p1, p2, p3}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;->r(Ll/dc60;Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider;Ljava/util/concurrent/ExecutorService;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;->a:Ll/i3y;

    .line 23
    .line 24
    if-nez v0, :cond_1

    .line 25
    .line 26
    invoke-virtual {p1}, Ll/dc60;->b()Lcom/clevertap/android/sdk/inapp/pipsdk/a;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->o()Lcom/clevertap/android/sdk/inapp/pipsdk/PIPMediaType;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-direct {p0, v0, p2, p3, p1}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;->j(Lcom/clevertap/android/sdk/inapp/pipsdk/PIPMediaType;Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider;Ljava/util/concurrent/ExecutorService;Ll/dc60;)Ll/i3y;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    iput-object p2, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;->a:Ll/i3y;

    .line 39
    .line 40
    :cond_1
    iget-object p2, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;->a:Ll/i3y;

    .line 41
    .line 42
    if-eqz p2, :cond_2

    .line 43
    .line 44
    invoke-interface {p2, p0, p1}, Ll/i3y;->a(Landroid/view/ViewGroup;Ll/dc60;)V

    .line 45
    .line 46
    .line 47
    :cond_2
    invoke-virtual {p1}, Ll/dc60;->h()Ll/fc60;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-direct {p0, p1}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;->i(Ll/fc60;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public final q()Lkotlin/Unit;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;->a:Ll/i3y;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/i3y;->release()V

    .line 6
    .line 7
    .line 8
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 9
    .line 10
    return-object p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final s()Lkotlin/Unit;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;->a:Ll/i3y;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/i3y;->c()V

    .line 6
    .line 7
    .line 8
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 9
    .line 10
    return-object p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final setOnAllMediaFailed(Lkotlin/jvm/functions/Function0;)V
    .locals 0
    .param p1    # Lkotlin/jvm/functions/Function0;
        .annotation build Lorg/jetbrains/annotations/Nullable;
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

    .line 1
    iput-object p1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;->f:Lkotlin/jvm/functions/Function0;

    .line 2
    .line 3
    return-void
.end method

.method public final setOnMediaReady(Lkotlin/jvm/functions/Function0;)V
    .locals 0
    .param p1    # Lkotlin/jvm/functions/Function0;
        .annotation build Lorg/jetbrains/annotations/Nullable;
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

    .line 1
    iput-object p1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;->e:Lkotlin/jvm/functions/Function0;

    .line 2
    .line 3
    return-void
.end method

.method public final setOnPlayStateChanged(Lkotlin/jvm/functions/Function1;)V
    .locals 0
    .param p1    # Lkotlin/jvm/functions/Function1;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Ljava/lang/Boolean;",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;->g:Lkotlin/jvm/functions/Function1;

    .line 2
    .line 3
    return-void
.end method

.method public final setOnVideoFallback(Lkotlin/jvm/functions/Function0;)V
    .locals 0
    .param p1    # Lkotlin/jvm/functions/Function0;
        .annotation build Lorg/jetbrains/annotations/Nullable;
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

    .line 1
    iput-object p1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;->d:Lkotlin/jvm/functions/Function0;

    .line 2
    .line 3
    return-void
.end method

.method public final t()Lkotlin/Unit;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;->a:Ll/i3y;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/i3y;->f()V

    .line 6
    .line 7
    .line 8
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 9
    .line 10
    return-object p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method
