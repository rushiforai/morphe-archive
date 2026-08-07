.class public Lcom/p1/mobile/putong/live/base/vap/AnimView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Ll/xol;
.implements Landroid/view/TextureView$SurfaceTextureListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/base/vap/AnimView$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u00b3\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\t\n\u0002\u0010\u000b\n\u0002\u0008\u000b\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u000e\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\t\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0008\t\n\u0002\u0018\u0002\n\u0002\u0008\u0005*\u0001o\u0008\u0016\u0018\u0000 |2\u00020\u00012\u00020\u00022\u00020\u0003:\u0001\u0013B\'\u0008\u0007\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\n\u0008\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0006\u0012\u0008\u0008\u0002\u0010\t\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\n\u0010\u000bJ\u000f\u0010\r\u001a\u00020\u000cH\u0002\u00a2\u0006\u0004\u0008\r\u0010\u000eJ\u001d\u0010\u0011\u001a\u00020\u000c2\u000c\u0010\u0010\u001a\u0008\u0012\u0004\u0012\u00020\u000c0\u000fH\u0002\u00a2\u0006\u0004\u0008\u0011\u0010\u0012J\u000f\u0010\u0013\u001a\u00020\u000cH\u0016\u00a2\u0006\u0004\u0008\u0013\u0010\u000eJ\u0011\u0010\u0015\u001a\u0004\u0018\u00010\u0014H\u0016\u00a2\u0006\u0004\u0008\u0015\u0010\u0016J\'\u0010\u001a\u001a\u00020\u000c2\u0006\u0010\u0017\u001a\u00020\u00142\u0006\u0010\u0018\u001a\u00020\u00082\u0006\u0010\u0019\u001a\u00020\u0008H\u0016\u00a2\u0006\u0004\u0008\u001a\u0010\u001bJ\u0017\u0010\u001c\u001a\u00020\u000c2\u0006\u0010\u0017\u001a\u00020\u0014H\u0016\u00a2\u0006\u0004\u0008\u001c\u0010\u001dJ\u0017\u0010\u001f\u001a\u00020\u001e2\u0006\u0010\u0017\u001a\u00020\u0014H\u0016\u00a2\u0006\u0004\u0008\u001f\u0010 J\'\u0010!\u001a\u00020\u000c2\u0006\u0010\u0017\u001a\u00020\u00142\u0006\u0010\u0018\u001a\u00020\u00082\u0006\u0010\u0019\u001a\u00020\u0008H\u0016\u00a2\u0006\u0004\u0008!\u0010\u001bJ/\u0010&\u001a\u00020\u000c2\u0006\u0010\"\u001a\u00020\u00082\u0006\u0010#\u001a\u00020\u00082\u0006\u0010$\u001a\u00020\u00082\u0006\u0010%\u001a\u00020\u0008H\u0014\u00a2\u0006\u0004\u0008&\u0010\'J\u000f\u0010(\u001a\u00020\u000cH\u0014\u00a2\u0006\u0004\u0008(\u0010\u000eJ\u000f\u0010)\u001a\u00020\u000cH\u0014\u00a2\u0006\u0004\u0008)\u0010\u000eJ\u0019\u0010,\u001a\u00020\u000c2\u0008\u0010+\u001a\u0004\u0018\u00010*H\u0016\u00a2\u0006\u0004\u0008,\u0010-J\u0019\u00100\u001a\u00020\u000c2\u0008\u0010/\u001a\u0004\u0018\u00010.H\u0016\u00a2\u0006\u0004\u00080\u00101J\u0019\u00104\u001a\u00020\u000c2\u0008\u00103\u001a\u0004\u0018\u000102H\u0016\u00a2\u0006\u0004\u00084\u00105J\u0017\u00107\u001a\u00020\u000c2\u0006\u00106\u001a\u00020\u001eH\u0016\u00a2\u0006\u0004\u00087\u00108J\u0017\u0010:\u001a\u00020\u000c2\u0006\u00109\u001a\u00020\u0008H\u0016\u00a2\u0006\u0004\u0008:\u0010;J\u0017\u0010<\u001a\u00020\u000c2\u0006\u00106\u001a\u00020\u001eH\u0007\u00a2\u0006\u0004\u0008<\u00108J\u0017\u0010>\u001a\u00020\u000c2\u0006\u0010=\u001a\u00020\u0008H\u0007\u00a2\u0006\u0004\u0008>\u0010;J\u0017\u0010@\u001a\u00020\u000c2\u0006\u0010?\u001a\u00020\u0008H\u0016\u00a2\u0006\u0004\u0008@\u0010;J\u0017\u0010C\u001a\u00020\u000c2\u0006\u0010B\u001a\u00020AH\u0016\u00a2\u0006\u0004\u0008C\u0010DJ\u0017\u0010C\u001a\u00020\u000c2\u0006\u0010F\u001a\u00020EH\u0016\u00a2\u0006\u0004\u0008C\u0010GJ\u0017\u0010I\u001a\u00020\u000c2\u0006\u0010H\u001a\u00020\u001eH\u0016\u00a2\u0006\u0004\u0008I\u00108J\u0017\u0010L\u001a\u00020\u000c2\u0006\u0010K\u001a\u00020JH\u0016\u00a2\u0006\u0004\u0008L\u0010MJ\u0017\u0010P\u001a\u00020\u000c2\u0006\u0010O\u001a\u00020NH\u0016\u00a2\u0006\u0004\u0008P\u0010QJ\u000f\u0010R\u001a\u00020\u000cH\u0016\u00a2\u0006\u0004\u0008R\u0010\u000eJ\u000f\u0010S\u001a\u00020\u001eH\u0016\u00a2\u0006\u0004\u0008S\u0010TJ\u001b\u0010V\u001a\u000e\u0012\u0004\u0012\u00020\u0008\u0012\u0004\u0012\u00020\u00080UH\u0016\u00a2\u0006\u0004\u0008V\u0010WR\u0016\u0010Z\u001a\u00020X8\u0002@\u0002X\u0082.\u00a2\u0006\u0006\n\u0004\u0008\u0013\u0010YR\u001b\u0010`\u001a\u00020[8BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\\\u0010]\u001a\u0004\u0008^\u0010_R\u0018\u0010\u0017\u001a\u0004\u0018\u00010\u00148\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008a\u0010bR\u0018\u0010+\u001a\u0004\u0018\u00010*8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008c\u0010dR\u0018\u0010h\u001a\u0004\u0018\u00010e8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008f\u0010gR\u0018\u0010j\u001a\u0004\u0018\u00010N8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0010\u0010iR\u0014\u0010n\u001a\u00020k8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008l\u0010mR\u001b\u0010r\u001a\u00020o8BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008#\u0010]\u001a\u0004\u0008p\u0010qR\u0016\u0010u\u001a\u00020\u001e8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008s\u0010tR\u0016\u0010w\u001a\u00020\u001e8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008v\u0010tR\u0014\u0010{\u001a\u00020x8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008y\u0010z\u00a8\u0006}"
    }
    d2 = {
        "Lcom/p1/mobile/putong/live/base/vap/AnimView;",
        "Ll/xol;",
        "Landroid/widget/FrameLayout;",
        "Landroid/view/TextureView$SurfaceTextureListener;",
        "Landroid/content/Context;",
        "context",
        "Landroid/util/AttributeSet;",
        "attrs",
        "",
        "defStyleAttr",
        "<init>",
        "(Landroid/content/Context;Landroid/util/AttributeSet;I)V",
        "",
        "n",
        "()V",
        "Lkotlin/Function0;",
        "f",
        "s",
        "(Lkotlin/jvm/functions/Function0;)V",
        "a",
        "Landroid/graphics/SurfaceTexture;",
        "getSurfaceTexture",
        "()Landroid/graphics/SurfaceTexture;",
        "surface",
        "width",
        "height",
        "onSurfaceTextureSizeChanged",
        "(Landroid/graphics/SurfaceTexture;II)V",
        "onSurfaceTextureUpdated",
        "(Landroid/graphics/SurfaceTexture;)V",
        "",
        "onSurfaceTextureDestroyed",
        "(Landroid/graphics/SurfaceTexture;)Z",
        "onSurfaceTextureAvailable",
        "w",
        "h",
        "oldw",
        "oldh",
        "onSizeChanged",
        "(IIII)V",
        "onAttachedToWindow",
        "onDetachedFromWindow",
        "Ll/vol;",
        "animListener",
        "setAnimListener",
        "(Ll/vol;)V",
        "Ll/vtl;",
        "fetchResource",
        "setFetchResource",
        "(Ll/vtl;)V",
        "Ll/ln50;",
        "resourceClickListener",
        "setOnResourceClickListener",
        "(Ll/ln50;)V",
        "enable",
        "l",
        "(Z)V",
        "playLoop",
        "setLoop",
        "(I)V",
        "m",
        "mode",
        "setVideoMode",
        "fps",
        "setFps",
        "Lcom/p1/mobile/putong/live/base/vap/util/ScaleType;",
        "type",
        "setScaleType",
        "(Lcom/p1/mobile/putong/live/base/vap/util/ScaleType;)V",
        "Ll/k5m;",
        "scaleType",
        "(Ll/k5m;)V",
        "isMute",
        "setMute",
        "Ljava/io/File;",
        "file",
        "p",
        "(Ljava/io/File;)V",
        "Ll/wtl;",
        "fileContainer",
        "q",
        "(Ll/wtl;)V",
        "r",
        "o",
        "()Z",
        "Lkotlin/Pair;",
        "getRealSize",
        "()Lkotlin/Pair;",
        "Ll/ap0;",
        "Ll/ap0;",
        "player",
        "Landroid/os/Handler;",
        "b",
        "Lkotlin/Lazy;",
        "getUiHandler",
        "()Landroid/os/Handler;",
        "uiHandler",
        "c",
        "Landroid/graphics/SurfaceTexture;",
        "d",
        "Ll/vol;",
        "Lcom/p1/mobile/putong/live/base/vap/textureview/InnerTextureView;",
        "e",
        "Lcom/p1/mobile/putong/live/base/vap/textureview/InnerTextureView;",
        "innerTextureView",
        "Ll/wtl;",
        "lastFile",
        "Ll/d1e0;",
        "g",
        "Ll/d1e0;",
        "scaleTypeUtil",
        "com/p1/mobile/putong/live/base/vap/AnimView$b",
        "getAnimProxyListener",
        "()Lcom/p1/mobile/putong/live/base/vap/AnimView$b;",
        "animProxyListener",
        "i",
        "Z",
        "onSizeChangedCalled",
        "j",
        "needPrepareTextureView",
        "Ljava/lang/Runnable;",
        "k",
        "Ljava/lang/Runnable;",
        "prepareTextureViewRunnable",
        "Companion",
        "base_intlGmsRelease"
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
.field public static final Companion:Lcom/p1/mobile/putong/live/base/vap/AnimView$a;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public a:Ll/ap0;

.field public final b:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public c:Landroid/graphics/SurfaceTexture;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public d:Ll/vol;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public e:Lcom/p1/mobile/putong/live/base/vap/textureview/InnerTextureView;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public f:Ll/wtl;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public final g:Ll/d1e0;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final h:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public i:Z

.field public j:Z

.field public final k:Ljava/lang/Runnable;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/p1/mobile/putong/live/base/vap/AnimView$a;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/live/base/vap/AnimView$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/p1/mobile/putong/live/base/vap/AnimView;->Companion:Lcom/p1/mobile/putong/live/base/vap/AnimView$a;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 6
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .line 62
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v4, 0x6

    const/4 v5, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lcom/p1/mobile/putong/live/base/vap/AnimView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;IILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 6
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

    .line 61
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v4, 0x4

    const/4 v5, 0x0

    const/4 v3, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    invoke-direct/range {v0 .. v5}, Lcom/p1/mobile/putong/live/base/vap/AnimView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;IILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
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
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 5
    .line 6
    .line 7
    new-instance p2, Ll/lp0;

    .line 8
    .line 9
    invoke-direct {p2}, Ll/lp0;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-static {p2}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    iput-object p2, p0, Lcom/p1/mobile/putong/live/base/vap/AnimView;->b:Lkotlin/Lazy;

    .line 17
    .line 18
    new-instance p2, Ll/d1e0;

    .line 19
    .line 20
    invoke-direct {p2}, Ll/d1e0;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object p2, p0, Lcom/p1/mobile/putong/live/base/vap/AnimView;->g:Ll/d1e0;

    .line 24
    .line 25
    new-instance p2, Ll/mp0;

    .line 26
    .line 27
    invoke-direct {p2, p0}, Ll/mp0;-><init>(Lcom/p1/mobile/putong/live/base/vap/AnimView;)V

    .line 28
    .line 29
    .line 30
    invoke-static {p2}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    iput-object p2, p0, Lcom/p1/mobile/putong/live/base/vap/AnimView;->h:Lkotlin/Lazy;

    .line 35
    .line 36
    new-instance p2, Ll/np0;

    .line 37
    .line 38
    invoke-direct {p2, p0, p1}, Ll/np0;-><init>(Lcom/p1/mobile/putong/live/base/vap/AnimView;Landroid/content/Context;)V

    .line 39
    .line 40
    .line 41
    iput-object p2, p0, Lcom/p1/mobile/putong/live/base/vap/AnimView;->k:Ljava/lang/Runnable;

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/vap/AnimView;->n()V

    .line 44
    .line 45
    .line 46
    new-instance p1, Ll/ap0;

    .line 47
    .line 48
    invoke-direct {p1, p0}, Ll/ap0;-><init>(Ll/xol;)V

    .line 49
    .line 50
    .line 51
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/vap/AnimView;->a:Ll/ap0;

    .line 52
    .line 53
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/vap/AnimView;->getAnimProxyListener()Lcom/p1/mobile/putong/live/base/vap/AnimView$b;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {p1, p0}, Ll/ap0;->t(Ll/vol;)V

    .line 58
    .line 59
    .line 60
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

    .line 63
    :cond_1
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/base/vap/AnimView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static b()Landroid/os/Handler;
    .locals 2

    .line 1
    new-instance v0, Landroid/os/Handler;

    .line 2
    .line 3
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public static c(Lcom/p1/mobile/putong/live/base/vap/AnimView;Landroid/content/Context;)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/p1/mobile/putong/live/base/vap/textureview/InnerTextureView;

    .line 5
    .line 6
    const/4 v4, 0x6

    .line 7
    const/4 v5, 0x0

    .line 8
    const/4 v2, 0x0

    .line 9
    const/4 v3, 0x0

    .line 10
    move-object v1, p1

    .line 11
    invoke-direct/range {v0 .. v5}, Lcom/p1/mobile/putong/live/base/vap/textureview/InnerTextureView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;IILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/vap/AnimView;->a:Ll/ap0;

    .line 15
    .line 16
    if-nez p1, :cond_0

    .line 17
    .line 18
    const-string p1, "player"

    .line 19
    .line 20
    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    const/4 p1, 0x0

    .line 24
    :cond_0
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/base/vap/textureview/InnerTextureView;->setPlayer(Ll/ap0;)V

    .line 25
    .line 26
    .line 27
    const/4 p1, 0x0

    .line 28
    invoke-virtual {v0, p1}, Landroid/view/TextureView;->setOpaque(Z)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, p0}, Landroid/view/TextureView;->setSurfaceTextureListener(Landroid/view/TextureView$SurfaceTextureListener;)V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/vap/AnimView;->g:Ll/d1e0;

    .line 35
    .line 36
    invoke-virtual {p1, v0}, Ll/d1e0;->f(Landroid/view/View;)Landroid/widget/FrameLayout$LayoutParams;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {v0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 41
    .line 42
    .line 43
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/vap/AnimView;->e:Lcom/p1/mobile/putong/live/base/vap/textureview/InnerTextureView;

    .line 44
    .line 45
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public static d(Lcom/p1/mobile/putong/live/base/vap/AnimView;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 2
    .line 3
    .line 4
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 5
    .line 6
    return-object p0
.end method

.method public static e(Lkotlin/jvm/functions/Function0;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static f(Lcom/p1/mobile/putong/live/base/vap/AnimView;)Lcom/p1/mobile/putong/live/base/vap/AnimView$b;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/vap/AnimView$b;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/live/base/vap/AnimView$b;-><init>(Lcom/p1/mobile/putong/live/base/vap/AnimView;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static g(Lcom/p1/mobile/putong/live/base/vap/AnimView;Ll/wtl;)Lkotlin/Unit;
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "AnimPlayer.AnimView"

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget-object p0, Ll/z0;->INSTANCE:Ll/z0;

    .line 10
    .line 11
    const-string p1, "AnimView is GONE, can\'t play"

    .line 12
    .line 13
    invoke-virtual {p0, v1, p1}, Ll/z0;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/vap/AnimView;->a:Ll/ap0;

    .line 20
    .line 21
    const/4 v2, 0x0

    .line 22
    const-string v3, "player"

    .line 23
    .line 24
    if-nez v0, :cond_1

    .line 25
    .line 26
    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    move-object v0, v2

    .line 30
    :cond_1
    invoke-virtual {v0}, Ll/ap0;->o()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-nez v0, :cond_3

    .line 35
    .line 36
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/vap/AnimView;->f:Ll/wtl;

    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/vap/AnimView;->a:Ll/ap0;

    .line 39
    .line 40
    if-nez p0, :cond_2

    .line 41
    .line 42
    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_2
    move-object v2, p0

    .line 47
    :goto_0
    invoke-virtual {v2, p1}, Ll/ap0;->B(Ll/wtl;)V

    .line 48
    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_3
    sget-object p0, Ll/z0;->INSTANCE:Ll/z0;

    .line 52
    .line 53
    const-string p1, "is running can not start"

    .line 54
    .line 55
    invoke-virtual {p0, v1, p1}, Ll/z0;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    :goto_1
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 59
    .line 60
    return-object p0
.end method

.method private final getAnimProxyListener()Lcom/p1/mobile/putong/live/base/vap/AnimView$b;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/vap/AnimView;->h:Lkotlin/Lazy;

    .line 2
    .line 3
    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/live/base/vap/AnimView$b;

    .line 8
    .line 9
    return-object p0
.end method

.method private final getUiHandler()Landroid/os/Handler;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/vap/AnimView;->b:Lkotlin/Lazy;

    .line 2
    .line 3
    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/os/Handler;

    .line 8
    .line 9
    return-object p0
.end method

.method public static h(Lcom/p1/mobile/putong/live/base/vap/AnimView;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/vap/AnimView;->e:Lcom/p1/mobile/putong/live/base/vap/textureview/InnerTextureView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0, v1}, Landroid/view/TextureView;->setSurfaceTextureListener(Landroid/view/TextureView$SurfaceTextureListener;)V

    .line 7
    .line 8
    .line 9
    :cond_0
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/vap/AnimView;->e:Lcom/p1/mobile/putong/live/base/vap/textureview/InnerTextureView;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static final synthetic i(Lcom/p1/mobile/putong/live/base/vap/AnimView;)Ll/vol;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/vap/AnimView;->d:Ll/vol;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic j(Lcom/p1/mobile/putong/live/base/vap/AnimView;)Ll/d1e0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/vap/AnimView;->g:Ll/d1e0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic k(Lcom/p1/mobile/putong/live/base/vap/AnimView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/vap/AnimView;->n()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/base/vap/AnimView;->i:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/vap/AnimView;->getUiHandler()Landroid/os/Handler;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/vap/AnimView;->k:Ljava/lang/Runnable;

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    sget-object v0, Ll/z0;->INSTANCE:Ll/z0;

    .line 16
    .line 17
    const-string v1, "AnimPlayer.AnimView"

    .line 18
    .line 19
    const-string v2, "onSizeChanged not called"

    .line 20
    .line 21
    invoke-virtual {v0, v1, v2}, Ll/z0;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    const/4 v0, 0x1

    .line 25
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/base/vap/AnimView;->j:Z

    .line 26
    .line 27
    return-void
.end method

.method public getRealSize()Lkotlin/Pair;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlin/Pair<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/vap/AnimView;->g:Ll/d1e0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/d1e0;->g()Lkotlin/Pair;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getSurfaceTexture()Landroid/graphics/SurfaceTexture;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/vap/AnimView;->e:Lcom/p1/mobile/putong/live/base/vap/textureview/InnerTextureView;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/TextureView;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    return-object v0

    .line 13
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/vap/AnimView;->c:Landroid/graphics/SurfaceTexture;

    .line 14
    .line 15
    return-object p0
.end method

.method public l(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/vap/AnimView;->a:Ll/ap0;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, "player"

    .line 6
    .line 7
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    :cond_0
    invoke-virtual {p0}, Ll/ap0;->j()Ll/bp0;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/bp0;->a()Lcom/p1/mobile/putong/live/base/vap/mix/a;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/vap/mix/a;->A(Z)V

    .line 22
    .line 23
    .line 24
    :cond_1
    return-void
.end method

.method public final m(Z)V
    .locals 0
    .annotation runtime Lkotlin/Deprecated;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/vap/AnimView;->a:Ll/ap0;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, "player"

    .line 6
    .line 7
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    :cond_0
    invoke-virtual {p0, p1}, Ll/ap0;->w(Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final n()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/vap/AnimView;->f:Ll/wtl;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ll/wtl;->close()V

    .line 6
    .line 7
    .line 8
    :cond_0
    new-instance v0, Ll/pp0;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Ll/pp0;-><init>(Lcom/p1/mobile/putong/live/base/vap/AnimView;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/vap/AnimView;->s(Lkotlin/jvm/functions/Function0;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public o()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/vap/AnimView;->a:Ll/ap0;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, "player"

    .line 6
    .line 7
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    :cond_0
    invoke-virtual {p0}, Ll/ap0;->o()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public onAttachedToWindow()V
    .locals 4

    .line 1
    sget-object v0, Ll/z0;->INSTANCE:Ll/z0;

    .line 2
    .line 3
    const-string v1, "AnimPlayer.AnimView"

    .line 4
    .line 5
    const-string v2, "onAttachedToWindow"

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2}, Ll/z0;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/vap/AnimView;->a:Ll/ap0;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    const-string v2, "player"

    .line 17
    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    move-object v0, v1

    .line 24
    :cond_0
    const/4 v3, 0x0

    .line 25
    invoke-virtual {v0, v3}, Ll/ap0;->v(Z)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/vap/AnimView;->a:Ll/ap0;

    .line 29
    .line 30
    if-nez v0, :cond_1

    .line 31
    .line 32
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    move-object v1, v0

    .line 37
    :goto_0
    invoke-virtual {v1}, Ll/ap0;->i()I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-lez v0, :cond_2

    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/vap/AnimView;->f:Ll/wtl;

    .line 44
    .line 45
    if-eqz v0, :cond_2

    .line 46
    .line 47
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/vap/AnimView;->q(Ll/wtl;)V

    .line 48
    .line 49
    .line 50
    :cond_2
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 4

    .line 1
    sget-object v0, Ll/z0;->INSTANCE:Ll/z0;

    .line 2
    .line 3
    const-string v1, "AnimPlayer.AnimView"

    .line 4
    .line 5
    const-string v2, "onDetachedFromWindow"

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2}, Ll/z0;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/vap/AnimView;->a:Ll/ap0;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    const-string v2, "player"

    .line 17
    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    move-object v0, v1

    .line 24
    :cond_0
    const/4 v3, 0x1

    .line 25
    invoke-virtual {v0, v3}, Ll/ap0;->v(Z)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/vap/AnimView;->a:Ll/ap0;

    .line 29
    .line 30
    if-nez p0, :cond_1

    .line 31
    .line 32
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    move-object v1, p0

    .line 37
    :goto_0
    invoke-virtual {v1}, Ll/ap0;->q()V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public onSizeChanged(IIII)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    .line 2
    .line 3
    .line 4
    sget-object p3, Ll/z0;->INSTANCE:Ll/z0;

    .line 5
    .line 6
    new-instance p4, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v0, "onSizeChanged w="

    .line 9
    .line 10
    invoke-direct {p4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v0, ", h="

    .line 17
    .line 18
    invoke-virtual {p4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p4

    .line 28
    const-string v0, "AnimPlayer.AnimView"

    .line 29
    .line 30
    invoke-virtual {p3, v0, p4}, Ll/z0;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iget-object p3, p0, Lcom/p1/mobile/putong/live/base/vap/AnimView;->g:Ll/d1e0;

    .line 34
    .line 35
    invoke-virtual {p3, p1, p2}, Ll/d1e0;->l(II)V

    .line 36
    .line 37
    .line 38
    const/4 p1, 0x1

    .line 39
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/base/vap/AnimView;->i:Z

    .line 40
    .line 41
    iget-boolean p1, p0, Lcom/p1/mobile/putong/live/base/vap/AnimView;->j:Z

    .line 42
    .line 43
    if-eqz p1, :cond_0

    .line 44
    .line 45
    const/4 p1, 0x0

    .line 46
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/base/vap/AnimView;->j:Z

    .line 47
    .line 48
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/vap/AnimView;->a()V

    .line 49
    .line 50
    .line 51
    :cond_0
    return-void
.end method

.method public onSurfaceTextureAvailable(Landroid/graphics/SurfaceTexture;II)V
    .locals 3
    .param p1    # Landroid/graphics/SurfaceTexture;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/z0;->INSTANCE:Ll/z0;

    .line 5
    .line 6
    new-instance v1, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v2, "onSurfaceTextureAvailable width="

    .line 9
    .line 10
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v2, " height="

    .line 17
    .line 18
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    const-string v2, "AnimPlayer.AnimView"

    .line 29
    .line 30
    invoke-virtual {v0, v2, v1}, Ll/z0;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/vap/AnimView;->c:Landroid/graphics/SurfaceTexture;

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/vap/AnimView;->a:Ll/ap0;

    .line 36
    .line 37
    if-nez p0, :cond_0

    .line 38
    .line 39
    const-string p0, "player"

    .line 40
    .line 41
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    const/4 p0, 0x0

    .line 45
    :cond_0
    invoke-virtual {p0, p2, p3}, Ll/ap0;->p(II)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public onSurfaceTextureDestroyed(Landroid/graphics/SurfaceTexture;)Z
    .locals 2
    .param p1    # Landroid/graphics/SurfaceTexture;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-object p1, Ll/z0;->INSTANCE:Ll/z0;

    .line 5
    .line 6
    const-string v0, "AnimPlayer.AnimView"

    .line 7
    .line 8
    const-string v1, "onSurfaceTextureDestroyed"

    .line 9
    .line 10
    invoke-virtual {p1, v0, v1}, Ll/z0;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/vap/AnimView;->c:Landroid/graphics/SurfaceTexture;

    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/vap/AnimView;->a:Ll/ap0;

    .line 17
    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    const-string v0, "player"

    .line 21
    .line 22
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    move-object p1, v0

    .line 27
    :goto_0
    invoke-virtual {p1}, Ll/ap0;->q()V

    .line 28
    .line 29
    .line 30
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/vap/AnimView;->getUiHandler()Landroid/os/Handler;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    new-instance v0, Ll/jp0;

    .line 35
    .line 36
    invoke-direct {v0, p0}, Ll/jp0;-><init>(Lcom/p1/mobile/putong/live/base/vap/AnimView;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 40
    .line 41
    .line 42
    const/4 p0, 0x1

    .line 43
    return p0
.end method

.method public onSurfaceTextureSizeChanged(Landroid/graphics/SurfaceTexture;II)V
    .locals 2
    .param p1    # Landroid/graphics/SurfaceTexture;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-object p1, Ll/z0;->INSTANCE:Ll/z0;

    .line 5
    .line 6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v1, "onSurfaceTextureSizeChanged "

    .line 9
    .line 10
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v1, " x "

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const-string v1, "AnimPlayer.AnimView"

    .line 29
    .line 30
    invoke-virtual {p1, v1, v0}, Ll/z0;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/vap/AnimView;->a:Ll/ap0;

    .line 34
    .line 35
    if-nez p0, :cond_0

    .line 36
    .line 37
    const-string p0, "player"

    .line 38
    .line 39
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    const/4 p0, 0x0

    .line 43
    :cond_0
    invoke-virtual {p0, p2, p3}, Ll/ap0;->r(II)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public onSurfaceTextureUpdated(Landroid/graphics/SurfaceTexture;)V
    .locals 0
    .param p1    # Landroid/graphics/SurfaceTexture;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method

.method public p(Ljava/io/File;)V
    .locals 2
    .param p1    # Ljava/io/File;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    :try_start_0
    new-instance v0, Ll/oii;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Ll/oii;-><init>(Ljava/io/File;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/vap/AnimView;->q(Ll/wtl;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :catchall_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/vap/AnimView;->getAnimProxyListener()Lcom/p1/mobile/putong/live/base/vap/AnimView$b;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    const/16 v0, 0x2717

    .line 18
    .line 19
    const-string v1, "0x7 file can\'t read"

    .line 20
    .line 21
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/live/base/vap/AnimView$b;->a(ILjava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/vap/AnimView;->getAnimProxyListener()Lcom/p1/mobile/putong/live/base/vap/AnimView$b;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/vap/AnimView$b;->f()V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public q(Ll/wtl;)V
    .locals 1
    .param p1    # Ll/wtl;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/kp0;

    .line 5
    .line 6
    invoke-direct {v0, p0, p1}, Ll/kp0;-><init>(Lcom/p1/mobile/putong/live/base/vap/AnimView;Ll/wtl;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/vap/AnimView;->s(Lkotlin/jvm/functions/Function0;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public r()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/vap/AnimView;->a:Ll/ap0;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, "player"

    .line 6
    .line 7
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    :cond_0
    invoke-virtual {p0}, Ll/ap0;->C()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final s(Lkotlin/jvm/functions/Function0;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-interface {p1}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/vap/AnimView;->getUiHandler()Landroid/os/Handler;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    new-instance v0, Ll/op0;

    .line 24
    .line 25
    invoke-direct {v0, p1}, Ll/op0;-><init>(Lkotlin/jvm/functions/Function0;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public setAnimListener(Ll/vol;)V
    .locals 0
    .param p1    # Ll/vol;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/vap/AnimView;->d:Ll/vol;

    .line 2
    .line 3
    return-void
.end method

.method public setFetchResource(Ll/vtl;)V
    .locals 0
    .param p1    # Ll/vtl;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/vap/AnimView;->a:Ll/ap0;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, "player"

    .line 6
    .line 7
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    :cond_0
    invoke-virtual {p0}, Ll/ap0;->j()Ll/bp0;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/bp0;->a()Lcom/p1/mobile/putong/live/base/vap/mix/a;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/vap/mix/a;->C(Ll/vtl;)V

    .line 22
    .line 23
    .line 24
    :cond_1
    return-void
.end method

.method public setFps(I)V
    .locals 3

    .line 1
    sget-object v0, Ll/z0;->INSTANCE:Ll/z0;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "setFps="

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const-string v2, "AnimPlayer.AnimView"

    .line 18
    .line 19
    invoke-virtual {v0, v2, v1}, Ll/z0;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/vap/AnimView;->a:Ll/ap0;

    .line 23
    .line 24
    if-nez p0, :cond_0

    .line 25
    .line 26
    const-string p0, "player"

    .line 27
    .line 28
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    const/4 p0, 0x0

    .line 32
    :cond_0
    invoke-virtual {p0, p1}, Ll/ap0;->u(I)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public setLoop(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/vap/AnimView;->a:Ll/ap0;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, "player"

    .line 6
    .line 7
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    :cond_0
    invoke-virtual {p0, p1}, Ll/ap0;->z(I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public setMute(Z)V
    .locals 3

    .line 1
    sget-object v0, Ll/z0;->INSTANCE:Ll/z0;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "set mute="

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const-string v2, "AnimPlayer.AnimView"

    .line 18
    .line 19
    invoke-virtual {v0, v2, v1}, Ll/z0;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/vap/AnimView;->a:Ll/ap0;

    .line 23
    .line 24
    if-nez p0, :cond_0

    .line 25
    .line 26
    const-string p0, "player"

    .line 27
    .line 28
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    const/4 p0, 0x0

    .line 32
    :cond_0
    invoke-virtual {p0, p1}, Ll/ap0;->y(Z)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public setOnResourceClickListener(Ll/ln50;)V
    .locals 0
    .param p1    # Ll/ln50;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/vap/AnimView;->a:Ll/ap0;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, "player"

    .line 6
    .line 7
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    :cond_0
    invoke-virtual {p0}, Ll/ap0;->j()Ll/bp0;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/bp0;->a()Lcom/p1/mobile/putong/live/base/vap/mix/a;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/vap/mix/a;->B(Ll/ln50;)V

    .line 22
    .line 23
    .line 24
    :cond_1
    return-void
.end method

.method public setScaleType(Lcom/p1/mobile/putong/live/base/vap/util/ScaleType;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/live/base/vap/util/ScaleType;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/vap/AnimView;->g:Ll/d1e0;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/d1e0;->k(Lcom/p1/mobile/putong/live/base/vap/util/ScaleType;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setScaleType(Ll/k5m;)V
    .locals 0
    .param p1    # Ll/k5m;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/vap/AnimView;->g:Ll/d1e0;

    invoke-virtual {p0, p1}, Ll/d1e0;->m(Ll/k5m;)V

    return-void
.end method

.method public final setVideoMode(I)V
    .locals 0
    .annotation runtime Lkotlin/Deprecated;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/vap/AnimView;->a:Ll/ap0;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, "player"

    .line 6
    .line 7
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    :cond_0
    invoke-virtual {p0, p1}, Ll/ap0;->A(I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
