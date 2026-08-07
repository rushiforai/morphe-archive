.class public final Lcom/p1/mobile/putong/floatview/view/FxManagerView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "ViewConstructor"
    }
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/floatview/view/FxManagerView$a;,
        Lcom/p1/mobile/putong/floatview/view/FxManagerView$b;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000j\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0010\u0007\n\u0002\u0008\u0007\n\u0002\u0010\u000b\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\u0011\n\u0002\u0018\u0002\n\u0002\u0008\u0015\n\u0002\u0010\t\n\u0002\u0008\u0019\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0006\u0008\u0007\u0018\u0000 n2\u00020\u0001:\u0002KGB\u001d\u0008\u0007\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\n\u0008\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u000f\u0010\t\u001a\u00020\u0008H\u0002\u00a2\u0006\u0004\u0008\t\u0010\nJ\u0011\u0010\u000c\u001a\u0004\u0018\u00010\u000bH\u0002\u00a2\u0006\u0004\u0008\u000c\u0010\rJ\u0011\u0010\u000e\u001a\u0004\u0018\u00010\u000bH\u0002\u00a2\u0006\u0004\u0008\u000e\u0010\rJ\u000f\u0010\u000f\u001a\u00020\u0008H\u0002\u00a2\u0006\u0004\u0008\u000f\u0010\nJ\u001b\u0010\u0012\u001a\u000e\u0012\u0004\u0012\u00020\u0011\u0012\u0004\u0012\u00020\u00110\u0010H\u0002\u00a2\u0006\u0004\u0008\u0012\u0010\u0013J\u0017\u0010\u0015\u001a\u00020\u00112\u0006\u0010\u0014\u001a\u00020\u0011H\u0002\u00a2\u0006\u0004\u0008\u0015\u0010\u0016J\u000f\u0010\u0017\u001a\u00020\u0008H\u0002\u00a2\u0006\u0004\u0008\u0017\u0010\nJ\u000f\u0010\u0018\u001a\u00020\u0008H\u0002\u00a2\u0006\u0004\u0008\u0018\u0010\nJ\u000f\u0010\u001a\u001a\u00020\u0019H\u0002\u00a2\u0006\u0004\u0008\u001a\u0010\u001bJ\u0017\u0010\u0014\u001a\u00020\u00082\u0006\u0010\u001c\u001a\u00020\u0019H\u0002\u00a2\u0006\u0004\u0008\u0014\u0010\u001dJ\u0017\u0010 \u001a\u00020\u00082\u0006\u0010\u001f\u001a\u00020\u001eH\u0002\u00a2\u0006\u0004\u0008 \u0010!J\u001f\u0010#\u001a\u00020\u00082\u0006\u0010#\u001a\u00020\"2\u0006\u0010\u0015\u001a\u00020\"H\u0002\u00a2\u0006\u0004\u0008#\u0010$J\u001f\u0010\'\u001a\u00020\u00082\u0006\u0010%\u001a\u00020\u001e2\u0006\u0010&\u001a\u00020\"H\u0002\u00a2\u0006\u0004\u0008\'\u0010(J\u000f\u0010)\u001a\u00020\u0019H\u0002\u00a2\u0006\u0004\u0008)\u0010\u001bJ\u001f\u0010,\u001a\u00020\u00192\u0006\u0010*\u001a\u00020\"2\u0006\u0010+\u001a\u00020\"H\u0002\u00a2\u0006\u0004\u0008,\u0010-J\u000f\u0010.\u001a\u00020\u0019H\u0002\u00a2\u0006\u0004\u0008.\u0010\u001bJ\u001f\u00101\u001a\u00020\u00082\u0006\u0010/\u001a\u00020\u00112\u0006\u00100\u001a\u00020\u0011H\u0002\u00a2\u0006\u0004\u00081\u00102J\u001f\u00103\u001a\u00020\u00082\u0006\u0010/\u001a\u00020\u00112\u0006\u00100\u001a\u00020\u0011H\u0002\u00a2\u0006\u0004\u00083\u00102J\u0017\u00106\u001a\u00020\u00002\u0006\u00105\u001a\u000204H\u0000\u00a2\u0006\u0004\u00086\u00107J)\u00109\u001a\u00020\u00082\u0006\u00103\u001a\u00020\u00112\u0006\u0010\u0014\u001a\u00020\u00112\u0008\u0008\u0002\u00108\u001a\u00020\u0019H\u0007\u00a2\u0006\u0004\u00089\u0010:J\u0017\u0010;\u001a\u00020\u00192\u0006\u0010\u001f\u001a\u00020\u001eH\u0016\u00a2\u0006\u0004\u0008;\u0010<J\u0017\u0010=\u001a\u00020\u00192\u0006\u0010%\u001a\u00020\u001eH\u0017\u00a2\u0006\u0004\u0008=\u0010<J\u000f\u0010>\u001a\u00020\u0008H\u0014\u00a2\u0006\u0004\u0008>\u0010\nJ\u000f\u0010?\u001a\u00020\u0008H\u0014\u00a2\u0006\u0004\u0008?\u0010\nJ\u0017\u0010A\u001a\u00020\u00082\u0006\u0010@\u001a\u00020\"H\u0014\u00a2\u0006\u0004\u0008A\u0010BJ#\u0010E\u001a\u00020\u00082\u0008\u0008\u0002\u0010C\u001a\u00020\u00192\u0008\u0008\u0002\u0010D\u001a\u00020\u0019H\u0000\u00a2\u0006\u0004\u0008E\u0010FR\u0016\u0010I\u001a\u0002048\u0002@\u0002X\u0082.\u00a2\u0006\u0006\n\u0004\u0008G\u0010HR\u0016\u0010M\u001a\u00020J8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008K\u0010LR\u0016\u0010P\u001a\u00020\u00118\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008N\u0010OR\u0016\u0010R\u001a\u00020\u00118\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008Q\u0010OR\u0016\u0010U\u001a\u00020\u00198\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008S\u0010TR\u0016\u0010W\u001a\u00020\u00118\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008V\u0010OR\u0016\u0010X\u001a\u00020\u00118\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0018\u0010OR\u0016\u0010Y\u001a\u00020\u00118\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0015\u0010OR\u0016\u0010Z\u001a\u00020\u00118\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0017\u0010OR\u0016\u0010\\\u001a\u00020\"8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u000e\u0010[R\u0016\u0010]\u001a\u00020\u00118\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u000c\u0010OR\u0016\u0010^\u001a\u00020\u00118\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u00086\u0010OR\u0016\u0010_\u001a\u00020\u00118\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0012\u0010OR\u0016\u0010`\u001a\u00020\u00118\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u000f\u0010OR\u0016\u0010a\u001a\u00020\u00198\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008 \u0010TR\u0016\u0010b\u001a\u00020\u00198\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\t\u0010TR\u0016\u0010c\u001a\u00020\"8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008.\u0010[R\u0016\u0010f\u001a\u00020d8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u001a\u0010eR\u0018\u0010h\u001a\u0004\u0018\u00010\u000b8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u00089\u0010gR\u001a\u0010k\u001a\u00060iR\u00020\u00008\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008E\u0010jR\u0013\u0010m\u001a\u0004\u0018\u00010\u000b8F\u00a2\u0006\u0006\u001a\u0004\u0008l\u0010\r\u00a8\u0006o"
    }
    d2 = {
        "Lcom/p1/mobile/putong/floatview/view/FxManagerView;",
        "Landroid/widget/FrameLayout;",
        "Landroid/content/Context;",
        "context",
        "Landroid/util/AttributeSet;",
        "attrs",
        "<init>",
        "(Landroid/content/Context;Landroid/util/AttributeSet;)V",
        "",
        "p",
        "()V",
        "Landroid/view/View;",
        "k",
        "()Landroid/view/View;",
        "j",
        "n",
        "Lkotlin/Pair;",
        "",
        "m",
        "()Lkotlin/Pair;",
        "y",
        "h",
        "(F)F",
        "i",
        "g",
        "",
        "r",
        "()Z",
        "isDownTouchInit",
        "(Z)V",
        "Landroid/view/MotionEvent;",
        "ev",
        "o",
        "(Landroid/view/MotionEvent;)V",
        "",
        "w",
        "(II)V",
        "event",
        "pointIndex",
        "z",
        "(Landroid/view/MotionEvent;I)V",
        "A",
        "parentW",
        "parentH",
        "B",
        "(II)Z",
        "q",
        "moveX",
        "moveY",
        "v",
        "(FF)V",
        "x",
        "Ll/vdj;",
        "config",
        "l",
        "(Ll/vdj;)Lcom/p1/mobile/putong/floatview/view/FxManagerView;",
        "useAnimation",
        "s",
        "(FFZ)V",
        "onInterceptTouchEvent",
        "(Landroid/view/MotionEvent;)Z",
        "onTouchEvent",
        "onAttachedToWindow",
        "onDetachedFromWindow",
        "visibility",
        "onWindowVisibilityChanged",
        "(I)V",
        "isLeft",
        "isUpdateBoundary",
        "t",
        "(ZZ)V",
        "a",
        "Ll/vdj;",
        "helper",
        "",
        "b",
        "J",
        "mLastTouchDownTime",
        "c",
        "F",
        "mParentWidth",
        "d",
        "mParentHeight",
        "e",
        "Z",
        "isNearestLeft",
        "f",
        "downTouchX",
        "downTouchY",
        "currentX",
        "currentY",
        "I",
        "touchDownId",
        "minHBoundary",
        "maxHBoundary",
        "minWBoundary",
        "maxWBoundary",
        "isClickEnable",
        "isMoveLoading",
        "scaledTouchSlop",
        "Landroid/view/View$OnLayoutChangeListener;",
        "Landroid/view/View$OnLayoutChangeListener;",
        "parentChangeListener",
        "Landroid/view/View;",
        "_childFxView",
        "Lcom/p1/mobile/putong/floatview/view/FxManagerView$b;",
        "Lcom/p1/mobile/putong/floatview/view/FxManagerView$b;",
        "mMoveAnimator",
        "getChildFxView",
        "childFxView",
        "Companion",
        "putong-common_intlGmsRelease"
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
.field public static final Companion:Lcom/p1/mobile/putong/floatview/view/FxManagerView$a;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final u:Landroid/os/Handler;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public a:Ll/vdj;

.field public b:J

.field public c:F

.field public d:F

.field public e:Z

.field public f:F

.field public g:F

.field public h:F

.field public i:F

.field public j:I

.field public k:F

.field public l:F

.field public m:F

.field public n:F

.field public o:Z

.field public p:Z

.field public q:I

.field public r:Landroid/view/View$OnLayoutChangeListener;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public s:Landroid/view/View;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public t:Lcom/p1/mobile/putong/floatview/view/FxManagerView$b;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/floatview/view/FxManagerView$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/floatview/view/FxManagerView$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->Companion:Lcom/p1/mobile/putong/floatview/view/FxManagerView$a;

    .line 8
    .line 9
    new-instance v0, Landroid/os/Handler;

    .line 10
    .line 11
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 16
    .line 17
    .line 18
    sput-object v0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->u:Landroid/os/Handler;

    .line 19
    .line 20
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .line 27
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v0, 0x0

    const/4 v1, 0x2

    invoke-direct {p0, p1, v0, v1, v0}, Lcom/p1/mobile/putong/floatview/view/FxManagerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
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
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 5
    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    iput-boolean p1, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->e:Z

    .line 9
    .line 10
    iput-boolean p1, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->o:Z

    .line 11
    .line 12
    new-instance p1, Ll/aej;

    .line 13
    .line 14
    invoke-direct {p1, p0}, Ll/aej;-><init>(Lcom/p1/mobile/putong/floatview/view/FxManagerView;)V

    .line 15
    .line 16
    .line 17
    iput-object p1, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->r:Landroid/view/View$OnLayoutChangeListener;

    .line 18
    .line 19
    new-instance p1, Lcom/p1/mobile/putong/floatview/view/FxManagerView$b;

    .line 20
    .line 21
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/floatview/view/FxManagerView$b;-><init>(Lcom/p1/mobile/putong/floatview/view/FxManagerView;)V

    .line 22
    .line 23
    .line 24
    iput-object p1, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->t:Lcom/p1/mobile/putong/floatview/view/FxManagerView$b;

    .line 25
    .line 26
    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    .line 28
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/floatview/view/FxManagerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public static a(Lcom/p1/mobile/putong/floatview/view/FxManagerView;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->o:Z

    .line 3
    .line 4
    return-void
.end method

.method public static b(Lcom/p1/mobile/putong/floatview/view/FxManagerView;Landroid/view/View;IIIIIIII)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->w(II)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static final synthetic c()Landroid/os/Handler;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->u:Landroid/os/Handler;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic d(Lcom/p1/mobile/putong/floatview/view/FxManagerView;F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->h:F

    .line 2
    .line 3
    return-void
.end method

.method public static final synthetic e(Lcom/p1/mobile/putong/floatview/view/FxManagerView;F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->i:F

    .line 2
    .line 3
    return-void
.end method

.method public static final synthetic f(Lcom/p1/mobile/putong/floatview/view/FxManagerView;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->p:Z

    .line 2
    .line 3
    return-void
.end method

.method public static synthetic u(Lcom/p1/mobile/putong/floatview/view/FxManagerView;ZZILjava/lang/Object;)V
    .locals 0

    .line 1
    and-int/lit8 p4, p3, 0x1

    .line 2
    .line 3
    if-eqz p4, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->q()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    :cond_0
    and-int/lit8 p3, p3, 0x2

    .line 10
    .line 11
    if-eqz p3, :cond_1

    .line 12
    .line 13
    const/4 p2, 0x1

    .line 14
    :cond_1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->t(ZZ)V

    .line 15
    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public final A()Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v1, v0, Landroid/view/ViewGroup;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    check-cast v0, Landroid/view/ViewGroup;

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 v0, 0x0

    .line 13
    :goto_0
    if-nez v0, :cond_1

    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    return p0

    .line 17
    :cond_1
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    invoke-virtual {p0, v1, v0}, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->B(II)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    return p0
.end method

.method public final B(II)Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    sub-int/2addr p1, v0

    .line 6
    int-to-float p1, p1

    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    sub-int/2addr p2, v0

    .line 12
    int-to-float p2, p2

    .line 13
    iget v0, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->d:F

    .line 14
    .line 15
    cmpg-float v0, v0, p2

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    iget v0, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->c:F

    .line 21
    .line 22
    cmpg-float v0, v0, p1

    .line 23
    .line 24
    if-nez v0, :cond_0

    .line 25
    .line 26
    return v1

    .line 27
    :cond_0
    iput p1, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->c:F

    .line 28
    .line 29
    iput p2, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->d:F

    .line 30
    .line 31
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->y(Z)V

    .line 32
    .line 33
    .line 34
    const/4 p0, 0x1

    .line 35
    return p0
.end method

.method public final g()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->a:Ll/vdj;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    const-string v0, "helper"

    .line 7
    .line 8
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    move-object v0, v1

    .line 12
    :cond_0
    iget-object v0, v0, Ll/vdj;->n:Ll/mul;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->getChildFxView()Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-interface {v0, v2}, Ll/mul;->c(Landroid/view/View;)V

    .line 21
    .line 22
    .line 23
    :cond_1
    const/4 v0, -0x1

    .line 24
    iput v0, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->j:I

    .line 25
    .line 26
    const/4 v0, 0x3

    .line 27
    const/4 v2, 0x0

    .line 28
    invoke-static {p0, v2, v2, v0, v1}, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->u(Lcom/p1/mobile/putong/floatview/view/FxManagerView;ZZILjava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final getChildFxView()Landroid/view/View;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->s:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public final h(F)F
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->a:Ll/vdj;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, "helper"

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    move-object v0, v1

    .line 12
    :cond_0
    iget-object v0, v0, Ll/vdj;->c:Lcom/p1/mobile/putong/floatview/assist/FxGravity;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/p1/mobile/putong/floatview/assist/FxGravity;->getScope()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    const/4 v3, 0x1

    .line 19
    if-eq v0, v3, :cond_3

    .line 20
    .line 21
    const/4 v3, 0x3

    .line 22
    if-eq v0, v3, :cond_1

    .line 23
    .line 24
    return p1

    .line 25
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->a:Ll/vdj;

    .line 26
    .line 27
    if-nez p0, :cond_2

    .line 28
    .line 29
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_2
    move-object v1, p0

    .line 34
    :goto_0
    iget p0, v1, Ll/vdj;->r:I

    .line 35
    .line 36
    int-to-float p0, p0

    .line 37
    sub-float/2addr p1, p0

    .line 38
    return p1

    .line 39
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->a:Ll/vdj;

    .line 40
    .line 41
    if-nez p0, :cond_4

    .line 42
    .line 43
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_4
    move-object v1, p0

    .line 48
    :goto_1
    iget p0, v1, Ll/vdj;->s:I

    .line 49
    .line 50
    int-to-float p0, p0

    .line 51
    add-float/2addr p1, p0

    .line 52
    return p1
.end method

.method public final i()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->a:Ll/vdj;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, "helper"

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    move-object v0, v1

    .line 12
    :cond_0
    iget-boolean v0, v0, Ll/vdj;->m:Z

    .line 13
    .line 14
    if-eqz v0, :cond_4

    .line 15
    .line 16
    iget-boolean v0, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->o:Z

    .line 17
    .line 18
    if-eqz v0, :cond_4

    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->a:Ll/vdj;

    .line 21
    .line 22
    if-nez v0, :cond_1

    .line 23
    .line 24
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    move-object v0, v1

    .line 28
    :cond_1
    iget-object v0, v0, Ll/vdj;->q:Landroid/view/View$OnClickListener;

    .line 29
    .line 30
    if-eqz v0, :cond_4

    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->r()Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_4

    .line 37
    .line 38
    const/4 v0, 0x0

    .line 39
    iput-boolean v0, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->o:Z

    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->a:Ll/vdj;

    .line 42
    .line 43
    if-nez v0, :cond_2

    .line 44
    .line 45
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    move-object v0, v1

    .line 49
    :cond_2
    iget-object v0, v0, Ll/vdj;->q:Landroid/view/View$OnClickListener;

    .line 50
    .line 51
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 52
    .line 53
    .line 54
    invoke-interface {v0, p0}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 55
    .line 56
    .line 57
    new-instance v0, Ll/zdj;

    .line 58
    .line 59
    invoke-direct {v0, p0}, Ll/zdj;-><init>(Lcom/p1/mobile/putong/floatview/view/FxManagerView;)V

    .line 60
    .line 61
    .line 62
    iget-object v3, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->a:Ll/vdj;

    .line 63
    .line 64
    if-nez v3, :cond_3

    .line 65
    .line 66
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_3
    move-object v1, v3

    .line 71
    :goto_0
    iget-wide v1, v1, Ll/vdj;->d:J

    .line 72
    .line 73
    invoke-virtual {p0, v0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 74
    .line 75
    .line 76
    :cond_4
    return-void
.end method

.method public final j()Landroid/view/View;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->a:Ll/vdj;

    .line 2
    .line 3
    const-string v1, "helper"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    move-object v0, v2

    .line 12
    :cond_0
    iget v0, v0, Ll/vdj;->a:I

    .line 13
    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    return-object v2

    .line 17
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object v3, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->a:Ll/vdj;

    .line 22
    .line 23
    if-nez v3, :cond_2

    .line 24
    .line 25
    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_2
    move-object v2, v3

    .line 30
    :goto_0
    iget v1, v2, Ll/vdj;->a:I

    .line 31
    .line 32
    invoke-static {v0, v1, p0}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0
.end method

.method public final k()Landroid/view/View;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->a:Ll/vdj;

    .line 2
    .line 3
    const-string v1, "helper"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    move-object v0, v2

    .line 12
    :cond_0
    iget-object v0, v0, Ll/vdj;->b:Landroid/view/View;

    .line 13
    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    return-object v2

    .line 17
    :cond_1
    iget-object v3, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->a:Ll/vdj;

    .line 18
    .line 19
    if-nez v3, :cond_2

    .line 20
    .line 21
    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_2
    move-object v2, v3

    .line 26
    :goto_0
    iget-object v1, v2, Ll/vdj;->e:Landroid/widget/FrameLayout$LayoutParams;

    .line 27
    .line 28
    if-nez v1, :cond_3

    .line 29
    .line 30
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 31
    .line 32
    const/4 v2, -0x2

    .line 33
    invoke-direct {v1, v2, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 34
    .line 35
    .line 36
    :cond_3
    invoke-virtual {p0, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 37
    .line 38
    .line 39
    return-object v0
.end method

.method public final synthetic l(Ll/vdj;)Lcom/p1/mobile/putong/floatview/view/FxManagerView;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->a:Ll/vdj;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->p()V

    .line 7
    .line 8
    .line 9
    return-object p0
.end method

.method public final m()Lkotlin/Pair;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlin/Pair<",
            "Ljava/lang/Float;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->a:Ll/vdj;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, "helper"

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    move-object v0, v1

    .line 12
    :cond_0
    iget v0, v0, Ll/vdj;->g:F

    .line 13
    .line 14
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v3, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->a:Ll/vdj;

    .line 19
    .line 20
    if-nez v3, :cond_1

    .line 21
    .line 22
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    move-object v1, v3

    .line 27
    :goto_0
    iget v1, v1, Ll/vdj;->f:F

    .line 28
    .line 29
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->h(F)F

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-static {v0, p0}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0
.end method

.method public final n()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->a:Ll/vdj;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, "helper"

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    move-object v0, v1

    .line 12
    :cond_0
    iget-object v0, v0, Ll/vdj;->p:Ll/kul;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    invoke-interface {v0}, Ll/kul;->hasConfig()Z

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    goto :goto_0

    .line 21
    :cond_1
    const/4 v3, 0x0

    .line 22
    :goto_0
    iget-object v4, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->a:Ll/vdj;

    .line 23
    .line 24
    if-nez v4, :cond_2

    .line 25
    .line 26
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    move-object v4, v1

    .line 30
    :cond_2
    iget-object v4, v4, Ll/vdj;->e:Landroid/widget/FrameLayout$LayoutParams;

    .line 31
    .line 32
    if-nez v4, :cond_3

    .line 33
    .line 34
    new-instance v4, Landroid/widget/FrameLayout$LayoutParams;

    .line 35
    .line 36
    const/4 v5, -0x2

    .line 37
    invoke-direct {v4, v5, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 38
    .line 39
    .line 40
    :cond_3
    if-nez v3, :cond_5

    .line 41
    .line 42
    iget-object v5, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->a:Ll/vdj;

    .line 43
    .line 44
    if-nez v5, :cond_4

    .line 45
    .line 46
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_4
    move-object v1, v5

    .line 51
    :goto_1
    iget-object v1, v1, Ll/vdj;->c:Lcom/p1/mobile/putong/floatview/assist/FxGravity;

    .line 52
    .line 53
    invoke-virtual {v1}, Lcom/p1/mobile/putong/floatview/assist/FxGravity;->getValue()I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    iput v1, v4, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 58
    .line 59
    :cond_5
    invoke-virtual {p0, v4}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 60
    .line 61
    .line 62
    if-eqz v3, :cond_6

    .line 63
    .line 64
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 65
    .line 66
    .line 67
    invoke-interface {v0}, Ll/kul;->getX()F

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-interface {v0}, Ll/kul;->getY()F

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-static {v1, v0}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    goto :goto_2

    .line 88
    :cond_6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->m()Lkotlin/Pair;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    :goto_2
    invoke-virtual {v0}, Lkotlin/Pair;->component1()Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    check-cast v1, Ljava/lang/Number;

    .line 97
    .line 98
    invoke-virtual {v1}, Ljava/lang/Number;->floatValue()F

    .line 99
    .line 100
    .line 101
    move-result v1

    .line 102
    invoke-virtual {v0}, Lkotlin/Pair;->component2()Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    check-cast v0, Ljava/lang/Number;

    .line 107
    .line 108
    invoke-virtual {v0}, Ljava/lang/Number;->floatValue()F

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    const/high16 v2, -0x40800000    # -1.0f

    .line 113
    .line 114
    cmpg-float v3, v1, v2

    .line 115
    .line 116
    if-nez v3, :cond_7

    .line 117
    .line 118
    goto :goto_3

    .line 119
    :cond_7
    invoke-virtual {p0, v1}, Landroid/view/View;->setX(F)V

    .line 120
    .line 121
    .line 122
    :goto_3
    cmpg-float v1, v0, v2

    .line 123
    .line 124
    if-nez v1, :cond_8

    .line 125
    .line 126
    return-void

    .line 127
    :cond_8
    invoke-virtual {p0, v0}, Landroid/view/View;->setY(F)V

    .line 128
    .line 129
    .line 130
    return-void
.end method

.method public final o(Landroid/view/MotionEvent;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->A()Z

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->y(Z)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    iput v0, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->j:I

    .line 17
    .line 18
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getX(I)F

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    iput v0, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->f:F

    .line 27
    .line 28
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getY(I)F

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    iput p1, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->g:F

    .line 37
    .line 38
    iget-object p1, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->t:Lcom/p1/mobile/putong/floatview/view/FxManagerView$b;

    .line 39
    .line 40
    invoke-virtual {p1}, Lcom/p1/mobile/putong/floatview/view/FxManagerView$b;->stop()V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->a:Ll/vdj;

    .line 44
    .line 45
    const/4 v0, 0x0

    .line 46
    const-string v1, "helper"

    .line 47
    .line 48
    if-nez p1, :cond_0

    .line 49
    .line 50
    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    move-object p1, v0

    .line 54
    :cond_0
    iget-object p1, p1, Ll/vdj;->n:Ll/mul;

    .line 55
    .line 56
    if-eqz p1, :cond_1

    .line 57
    .line 58
    invoke-virtual {p0}, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->getChildFxView()Landroid/view/View;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    invoke-interface {p1, v2}, Ll/mul;->b(Landroid/view/View;)V

    .line 63
    .line 64
    .line 65
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->a:Ll/vdj;

    .line 66
    .line 67
    if-nez p1, :cond_2

    .line 68
    .line 69
    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_2
    move-object v0, p1

    .line 74
    :goto_0
    iget-boolean p1, v0, Ll/vdj;->m:Z

    .line 75
    .line 76
    if-eqz p1, :cond_3

    .line 77
    .line 78
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 79
    .line 80
    .line 81
    move-result-wide v0

    .line 82
    iput-wide v0, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->b:J

    .line 83
    .line 84
    :cond_3
    return-void
.end method

.method public onAttachedToWindow()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->a:Ll/vdj;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const-string v0, "helper"

    .line 10
    .line 11
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    move-object v0, v1

    .line 15
    :cond_0
    iget-object v0, v0, Ll/vdj;->o:Ll/nul;

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    invoke-interface {v0}, Ll/nul;->d()V

    .line 20
    .line 21
    .line 22
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    instance-of v2, v0, Landroid/view/ViewGroup;

    .line 27
    .line 28
    if-eqz v2, :cond_2

    .line 29
    .line 30
    move-object v1, v0

    .line 31
    check-cast v1, Landroid/view/ViewGroup;

    .line 32
    .line 33
    :cond_2
    if-eqz v1, :cond_3

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->r:Landroid/view/View$OnLayoutChangeListener;

    .line 36
    .line 37
    invoke-virtual {v1, p0}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 38
    .line 39
    .line 40
    :cond_3
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->a:Ll/vdj;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const-string v0, "helper"

    .line 10
    .line 11
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    move-object v0, v1

    .line 15
    :cond_0
    iget-object v0, v0, Ll/vdj;->o:Ll/nul;

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    invoke-interface {v0}, Ll/nul;->f()V

    .line 20
    .line 21
    .line 22
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    instance-of v2, v0, Landroid/view/ViewGroup;

    .line 27
    .line 28
    if-eqz v2, :cond_2

    .line 29
    .line 30
    move-object v1, v0

    .line 31
    check-cast v1, Landroid/view/ViewGroup;

    .line 32
    .line 33
    :cond_2
    if-eqz v1, :cond_3

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->r:Landroid/view/View$OnLayoutChangeListener;

    .line 36
    .line 37
    invoke-virtual {v1, p0}, Landroid/view/View;->removeOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 38
    .line 39
    .line 40
    :cond_3
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3
    .param p1    # Landroid/view/MotionEvent;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, 0x0

    .line 9
    if-eqz v0, :cond_2

    .line 10
    .line 11
    const/4 v2, 0x2

    .line 12
    if-eq v0, v2, :cond_0

    .line 13
    .line 14
    return v1

    .line 15
    :cond_0
    iget v0, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->f:F

    .line 16
    .line 17
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    sub-float/2addr v0, p1

    .line 22
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    iget p0, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->q:I

    .line 27
    .line 28
    int-to-float p0, p0

    .line 29
    cmpl-float p0, p1, p0

    .line 30
    .line 31
    if-ltz p0, :cond_1

    .line 32
    .line 33
    const/4 p0, 0x1

    .line 34
    return p0

    .line 35
    :cond_1
    return v1

    .line 36
    :cond_2
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->o(Landroid/view/MotionEvent;)V

    .line 37
    .line 38
    .line 39
    return v1
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 5
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
    iget-object v0, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->a:Ll/vdj;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    const-string v2, "helper"

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    move-object v0, v1

    .line 15
    :cond_0
    iget-object v0, v0, Ll/vdj;->n:Ll/mul;

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    invoke-interface {v0, p1}, Ll/mul;->d(Landroid/view/MotionEvent;)V

    .line 20
    .line 21
    .line 22
    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    const/4 v3, 0x1

    .line 27
    if-eq v0, v3, :cond_8

    .line 28
    .line 29
    const/4 v3, 0x2

    .line 30
    const/4 v4, -0x1

    .line 31
    if-eq v0, v3, :cond_4

    .line 32
    .line 33
    const/4 v1, 0x3

    .line 34
    if-eq v0, v1, :cond_8

    .line 35
    .line 36
    const/4 v1, 0x5

    .line 37
    if-eq v0, v1, :cond_3

    .line 38
    .line 39
    const/4 v1, 0x6

    .line 40
    if-eq v0, v1, :cond_2

    .line 41
    .line 42
    goto/16 :goto_2

    .line 43
    .line 44
    :cond_2
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    iget v1, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->j:I

    .line 53
    .line 54
    if-ne v0, v1, :cond_9

    .line 55
    .line 56
    invoke-virtual {p0}, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->g()V

    .line 57
    .line 58
    .line 59
    goto :goto_2

    .line 60
    :cond_3
    iget v0, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->j:I

    .line 61
    .line 62
    if-ne v0, v4, :cond_9

    .line 63
    .line 64
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getX(I)F

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getY(I)F

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    const/4 v2, 0x0

    .line 81
    cmpl-float v3, v0, v2

    .line 82
    .line 83
    if-ltz v3, :cond_9

    .line 84
    .line 85
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 86
    .line 87
    .line 88
    move-result v3

    .line 89
    int-to-float v3, v3

    .line 90
    cmpg-float v0, v0, v3

    .line 91
    .line 92
    if-gtz v0, :cond_9

    .line 93
    .line 94
    cmpl-float v0, v1, v2

    .line 95
    .line 96
    if-ltz v0, :cond_9

    .line 97
    .line 98
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    int-to-float v0, v0

    .line 103
    cmpg-float v0, v1, v0

    .line 104
    .line 105
    if-gtz v0, :cond_9

    .line 106
    .line 107
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->o(Landroid/view/MotionEvent;)V

    .line 108
    .line 109
    .line 110
    goto :goto_2

    .line 111
    :cond_4
    iget v0, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->j:I

    .line 112
    .line 113
    if-eq v0, v4, :cond_7

    .line 114
    .line 115
    iget-object v0, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->a:Ll/vdj;

    .line 116
    .line 117
    if-nez v0, :cond_5

    .line 118
    .line 119
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    goto :goto_0

    .line 123
    :cond_5
    move-object v1, v0

    .line 124
    :goto_0
    iget-boolean v0, v1, Ll/vdj;->l:Z

    .line 125
    .line 126
    if-nez v0, :cond_6

    .line 127
    .line 128
    goto :goto_1

    .line 129
    :cond_6
    iget v0, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->j:I

    .line 130
    .line 131
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    .line 132
    .line 133
    .line 134
    move-result v0

    .line 135
    if-eq v0, v4, :cond_9

    .line 136
    .line 137
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->z(Landroid/view/MotionEvent;I)V

    .line 138
    .line 139
    .line 140
    goto :goto_2

    .line 141
    :cond_7
    :goto_1
    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 142
    .line 143
    .line 144
    move-result p0

    .line 145
    return p0

    .line 146
    :cond_8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->g()V

    .line 147
    .line 148
    .line 149
    invoke-virtual {p0}, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->i()V

    .line 150
    .line 151
    .line 152
    :cond_9
    :goto_2
    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 153
    .line 154
    .line 155
    move-result p0

    .line 156
    return p0
.end method

.method public onWindowVisibilityChanged(I)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onWindowVisibilityChanged(I)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->a:Ll/vdj;

    .line 5
    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    const-string p0, "helper"

    .line 9
    .line 10
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    :cond_0
    iget-object p0, p0, Ll/vdj;->o:Ll/nul;

    .line 15
    .line 16
    if-eqz p0, :cond_1

    .line 17
    .line 18
    invoke-interface {p0, p1}, Ll/nul;->c(I)V

    .line 19
    .line 20
    .line 21
    :cond_1
    return-void
.end method

.method public final p()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->k()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->j()Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    :cond_0
    iput-object v0, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->s:Landroid/view/View;

    .line 12
    .line 13
    if-eqz v0, :cond_3

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->n()V

    .line 16
    .line 17
    .line 18
    const/4 v0, 0x1

    .line 19
    invoke-virtual {p0, v0}, Landroid/view/View;->setClickable(Z)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {v0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    iput v0, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->q:I

    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->a:Ll/vdj;

    .line 37
    .line 38
    if-nez v0, :cond_1

    .line 39
    .line 40
    const-string v0, "helper"

    .line 41
    .line 42
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    const/4 v0, 0x0

    .line 46
    :cond_1
    iget-object v0, v0, Ll/vdj;->o:Ll/nul;

    .line 47
    .line 48
    if-eqz v0, :cond_2

    .line 49
    .line 50
    invoke-interface {v0, p0}, Ll/nul;->e(Landroid/view/View;)V

    .line 51
    .line 52
    .line 53
    :cond_2
    const/4 v0, 0x0

    .line 54
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_3
    const-string p0, "initFxView -> Error,check your layoutId or layoutView."

    .line 59
    .line 60
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public final q()Z
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->c:F

    .line 2
    .line 3
    const/high16 v1, 0x40000000    # 2.0f

    .line 4
    .line 5
    div-float/2addr v0, v1

    .line 6
    invoke-virtual {p0}, Landroid/view/View;->getX()F

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    cmpg-float v0, v1, v0

    .line 11
    .line 12
    if-gez v0, :cond_0

    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 v0, 0x0

    .line 17
    :goto_0
    iput-boolean v0, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->e:Z

    .line 18
    .line 19
    return v0
.end method

.method public final r()Z
    .locals 4

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->b:J

    .line 6
    .line 7
    sub-long/2addr v0, v2

    .line 8
    const-wide/16 v2, 0x96

    .line 9
    .line 10
    cmp-long p0, v0, v2

    .line 11
    .line 12
    if-gez p0, :cond_0

    .line 13
    .line 14
    const/4 p0, 0x1

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public final s(FFZ)V
    .locals 3
    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->m:F

    .line 2
    .line 3
    iget v1, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->n:F

    .line 4
    .line 5
    invoke-static {p1, v0, v1}, Ll/dej;->a(FFF)F

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget v1, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->k:F

    .line 10
    .line 11
    iget v2, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->l:F

    .line 12
    .line 13
    invoke-static {p2, v1, v2}, Ll/dej;->a(FFF)F

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz p3, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->v(FF)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    invoke-virtual {p0, p1}, Landroid/view/View;->setX(F)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, p2}, Landroid/view/View;->setY(F)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final synthetic t(ZZ)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->p:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    if-eqz p2, :cond_1

    .line 7
    .line 8
    const/4 p2, 0x0

    .line 9
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->y(Z)V

    .line 10
    .line 11
    .line 12
    :cond_1
    iget-object p2, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->a:Ll/vdj;

    .line 13
    .line 14
    if-nez p2, :cond_2

    .line 15
    .line 16
    const-string p2, "helper"

    .line 17
    .line 18
    invoke-static {p2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const/4 p2, 0x0

    .line 22
    :cond_2
    iget-boolean p2, p2, Ll/vdj;->k:Z

    .line 23
    .line 24
    if-eqz p2, :cond_4

    .line 25
    .line 26
    invoke-virtual {p0}, Landroid/view/View;->getY()F

    .line 27
    .line 28
    .line 29
    move-result p2

    .line 30
    iget v0, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->k:F

    .line 31
    .line 32
    iget v1, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->l:F

    .line 33
    .line 34
    invoke-static {p2, v0, v1}, Ll/dej;->a(FFF)F

    .line 35
    .line 36
    .line 37
    move-result p2

    .line 38
    if-eqz p1, :cond_3

    .line 39
    .line 40
    iget p1, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->m:F

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_3
    iget p1, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->n:F

    .line 44
    .line 45
    :goto_0
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->v(FF)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_4
    invoke-virtual {p0}, Landroid/view/View;->getX()F

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    iget p2, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->m:F

    .line 54
    .line 55
    iget v0, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->n:F

    .line 56
    .line 57
    invoke-static {p1, p2, v0}, Ll/dej;->a(FFF)F

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    invoke-virtual {p0}, Landroid/view/View;->getY()F

    .line 62
    .line 63
    .line 64
    move-result p2

    .line 65
    iget v0, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->k:F

    .line 66
    .line 67
    iget v1, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->l:F

    .line 68
    .line 69
    invoke-static {p2, v0, v1}, Ll/dej;->a(FFF)F

    .line 70
    .line 71
    .line 72
    move-result p2

    .line 73
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->v(FF)V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public final v(FF)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->p:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getX()F

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    cmpg-float v0, p1, v0

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/view/View;->getY()F

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    cmpg-float v0, p2, v0

    .line 17
    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    const/4 p1, 0x0

    .line 21
    iput-boolean p1, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->p:Z

    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->t:Lcom/p1/mobile/putong/floatview/view/FxManagerView$b;

    .line 25
    .line 26
    invoke-virtual {v0, p1, p2}, Lcom/p1/mobile/putong/floatview/view/FxManagerView$b;->a(FF)V

    .line 27
    .line 28
    .line 29
    iput p1, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->h:F

    .line 30
    .line 31
    iput p2, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->i:F

    .line 32
    .line 33
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->x(FF)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final w(II)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->B(II)Z

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
    const/4 p1, 0x1

    .line 9
    const/4 p2, 0x0

    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-static {p0, v0, v0, p1, p2}, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->u(Lcom/p1/mobile/putong/floatview/view/FxManagerView;ZZILjava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final x(FF)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->a:Ll/vdj;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, "helper"

    .line 6
    .line 7
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    :cond_0
    iget-object p0, p0, Ll/vdj;->p:Ll/kul;

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    invoke-interface {p0, p1, p2}, Ll/kul;->a(FF)V

    .line 16
    .line 17
    .line 18
    :cond_1
    return-void
.end method

.method public final y(Z)V
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x0

    .line 3
    const-string v2, "helper"

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    move v3, v0

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    iget-object v3, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->a:Ll/vdj;

    .line 10
    .line 11
    if-nez v3, :cond_1

    .line 12
    .line 13
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    move-object v3, v1

    .line 17
    :cond_1
    iget v3, v3, Ll/vdj;->h:F

    .line 18
    .line 19
    :goto_0
    if-eqz p1, :cond_2

    .line 20
    .line 21
    move v4, v0

    .line 22
    goto :goto_1

    .line 23
    :cond_2
    iget-object v4, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->a:Ll/vdj;

    .line 24
    .line 25
    if-nez v4, :cond_3

    .line 26
    .line 27
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    move-object v4, v1

    .line 31
    :cond_3
    iget-object v4, v4, Ll/vdj;->i:Ll/wdj;

    .line 32
    .line 33
    invoke-virtual {v4}, Ll/wdj;->d()F

    .line 34
    .line 35
    .line 36
    move-result v4

    .line 37
    add-float/2addr v4, v3

    .line 38
    :goto_1
    if-eqz p1, :cond_4

    .line 39
    .line 40
    move v5, v0

    .line 41
    goto :goto_2

    .line 42
    :cond_4
    iget-object v5, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->a:Ll/vdj;

    .line 43
    .line 44
    if-nez v5, :cond_5

    .line 45
    .line 46
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    move-object v5, v1

    .line 50
    :cond_5
    iget-object v5, v5, Ll/vdj;->i:Ll/wdj;

    .line 51
    .line 52
    invoke-virtual {v5}, Ll/wdj;->a()F

    .line 53
    .line 54
    .line 55
    move-result v5

    .line 56
    add-float/2addr v5, v3

    .line 57
    :goto_2
    if-eqz p1, :cond_6

    .line 58
    .line 59
    move v6, v0

    .line 60
    goto :goto_3

    .line 61
    :cond_6
    iget-object v6, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->a:Ll/vdj;

    .line 62
    .line 63
    if-nez v6, :cond_7

    .line 64
    .line 65
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    move-object v6, v1

    .line 69
    :cond_7
    iget-object v6, v6, Ll/vdj;->i:Ll/wdj;

    .line 70
    .line 71
    invoke-virtual {v6}, Ll/wdj;->b()F

    .line 72
    .line 73
    .line 74
    move-result v6

    .line 75
    add-float/2addr v6, v3

    .line 76
    :goto_3
    if-eqz p1, :cond_8

    .line 77
    .line 78
    goto :goto_4

    .line 79
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->a:Ll/vdj;

    .line 80
    .line 81
    if-nez p1, :cond_9

    .line 82
    .line 83
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    move-object p1, v1

    .line 87
    :cond_9
    iget-object p1, p1, Ll/vdj;->i:Ll/wdj;

    .line 88
    .line 89
    invoke-virtual {p1}, Ll/wdj;->c()F

    .line 90
    .line 91
    .line 92
    move-result p1

    .line 93
    add-float v0, p1, v3

    .line 94
    .line 95
    :goto_4
    iput v6, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->m:F

    .line 96
    .line 97
    iget p1, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->c:F

    .line 98
    .line 99
    sub-float/2addr p1, v0

    .line 100
    iput p1, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->n:F

    .line 101
    .line 102
    iget-object p1, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->a:Ll/vdj;

    .line 103
    .line 104
    if-nez p1, :cond_a

    .line 105
    .line 106
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    move-object p1, v1

    .line 110
    :cond_a
    iget p1, p1, Ll/vdj;->s:I

    .line 111
    .line 112
    int-to-float p1, p1

    .line 113
    add-float/2addr p1, v4

    .line 114
    iput p1, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->k:F

    .line 115
    .line 116
    iget p1, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->d:F

    .line 117
    .line 118
    iget-object v0, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->a:Ll/vdj;

    .line 119
    .line 120
    if-nez v0, :cond_b

    .line 121
    .line 122
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    goto :goto_5

    .line 126
    :cond_b
    move-object v1, v0

    .line 127
    :goto_5
    iget v0, v1, Ll/vdj;->r:I

    .line 128
    .line 129
    int-to-float v0, v0

    .line 130
    sub-float/2addr p1, v0

    .line 131
    sub-float/2addr p1, v5

    .line 132
    iput p1, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->l:F

    .line 133
    .line 134
    return-void
.end method

.method public final z(Landroid/view/MotionEvent;I)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getX()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1, p2}, Landroid/view/MotionEvent;->getX(I)F

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    add-float/2addr v0, v1

    .line 10
    iget v1, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->f:F

    .line 11
    .line 12
    sub-float/2addr v0, v1

    .line 13
    iget v1, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->m:F

    .line 14
    .line 15
    iget v2, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->n:F

    .line 16
    .line 17
    invoke-static {v0, v1, v2}, Ll/dej;->a(FFF)F

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    invoke-virtual {p0}, Landroid/view/View;->getY()F

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    invoke-virtual {p1, p2}, Landroid/view/MotionEvent;->getY(I)F

    .line 26
    .line 27
    .line 28
    move-result p2

    .line 29
    add-float/2addr v1, p2

    .line 30
    iget p2, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->g:F

    .line 31
    .line 32
    sub-float/2addr v1, p2

    .line 33
    iget p2, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->k:F

    .line 34
    .line 35
    iget v2, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->l:F

    .line 36
    .line 37
    invoke-static {v1, p2, v2}, Ll/dej;->a(FFF)F

    .line 38
    .line 39
    .line 40
    move-result p2

    .line 41
    invoke-virtual {p0, v0}, Landroid/view/View;->setX(F)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0, p2}, Landroid/view/View;->setY(F)V

    .line 45
    .line 46
    .line 47
    iget-object v1, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->a:Ll/vdj;

    .line 48
    .line 49
    if-nez v1, :cond_0

    .line 50
    .line 51
    const-string v1, "helper"

    .line 52
    .line 53
    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    const/4 v1, 0x0

    .line 57
    :cond_0
    iget-object v1, v1, Ll/vdj;->n:Ll/mul;

    .line 58
    .line 59
    if-eqz v1, :cond_1

    .line 60
    .line 61
    invoke-virtual {p0}, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->getChildFxView()Landroid/view/View;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-interface {v1, p0, p1, v0, p2}, Ll/mul;->a(Landroid/view/View;Landroid/view/MotionEvent;FF)V

    .line 66
    .line 67
    .line 68
    :cond_1
    return-void
.end method
