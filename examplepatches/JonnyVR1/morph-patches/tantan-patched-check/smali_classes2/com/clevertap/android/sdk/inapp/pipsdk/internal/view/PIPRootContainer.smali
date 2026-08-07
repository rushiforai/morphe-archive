.class public final Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000|\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0010\u000b\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\t\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u001e\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0008\u0000\u0018\u0000 [2\u00020\u0001:\u00014B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J%\u0010\u000c\u001a\u00020\u000b2\u0006\u0010\u0007\u001a\u00020\u00062\u000c\u0010\n\u001a\u0008\u0012\u0004\u0012\u00020\t0\u0008H\u0002\u00a2\u0006\u0004\u0008\u000c\u0010\rJ-\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u000f\u001a\u00020\u000e2\u000c\u0010\n\u001a\u0008\u0012\u0004\u0012\u00020\t0\u0008H\u0002\u00a2\u0006\u0004\u0008\u0011\u0010\u0012J\u000f\u0010\u0013\u001a\u00020\tH\u0002\u00a2\u0006\u0004\u0008\u0013\u0010\u0014J\u000f\u0010\u0015\u001a\u00020\tH\u0002\u00a2\u0006\u0004\u0008\u0015\u0010\u0014J\'\u0010\u0019\u001a\u00020\t2\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0016\u001a\u00020\u00102\u0006\u0010\u0018\u001a\u00020\u0017H\u0002\u00a2\u0006\u0004\u0008\u0019\u0010\u001aJ\u000f\u0010\u001b\u001a\u00020\tH\u0002\u00a2\u0006\u0004\u0008\u001b\u0010\u0014J\u0017\u0010\u001d\u001a\u00020\u001c2\u0006\u0010\u0007\u001a\u00020\u0006H\u0002\u00a2\u0006\u0004\u0008\u001d\u0010\u001eJ\u000f\u0010\u001f\u001a\u00020\tH\u0014\u00a2\u0006\u0004\u0008\u001f\u0010\u0014J7\u0010$\u001a\u00020\t2\u0006\u0010\u0007\u001a\u00020\u00062\u0008\u0008\u0002\u0010\u0018\u001a\u00020\u00172\n\u0008\u0002\u0010!\u001a\u0004\u0018\u00010 2\n\u0008\u0002\u0010#\u001a\u0004\u0018\u00010\"\u00a2\u0006\u0004\u0008$\u0010%J\u001b\u0010\'\u001a\u00020\t2\u000c\u0010&\u001a\u0008\u0012\u0004\u0012\u00020\t0\u0008\u00a2\u0006\u0004\u0008\'\u0010(J\u0017\u0010*\u001a\u00020\t2\u0008\u0008\u0002\u0010)\u001a\u00020\u0017\u00a2\u0006\u0004\u0008*\u0010+J\u0015\u0010.\u001a\u00020\t2\u0006\u0010-\u001a\u00020,\u00a2\u0006\u0004\u0008.\u0010/J\u0017\u00102\u001a\u00020\u00172\u0006\u00101\u001a\u000200H\u0016\u00a2\u0006\u0004\u00082\u00103R*\u00109\u001a\n\u0012\u0004\u0012\u00020\t\u0018\u00010\u00088\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u00084\u00105\u001a\u0004\u00086\u00107\"\u0004\u00088\u0010(R*\u0010=\u001a\n\u0012\u0004\u0012\u00020\t\u0018\u00010\u00088\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008:\u00105\u001a\u0004\u0008;\u00107\"\u0004\u0008<\u0010(R$\u0010A\u001a\u00020\u00172\u0006\u0010>\u001a\u00020\u00178\u0006@BX\u0086\u000e\u00a2\u0006\u000c\n\u0004\u0008?\u0010@\u001a\u0004\u0008A\u0010BR\u0018\u0010E\u001a\u0004\u0018\u00010\u00068\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008C\u0010DR\u0018\u0010H\u001a\u0004\u0018\u00010\u00108\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008F\u0010GR\u0018\u0010K\u001a\u0004\u0018\u00010\u000b8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008I\u0010JR\u0018\u0010N\u001a\u0004\u0018\u00010\u000e8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008L\u0010MR\u0018\u0010R\u001a\u0004\u0018\u00010O8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008P\u0010QR\u0018\u0010V\u001a\u0004\u0018\u00010S8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008T\u0010UR\u0016\u0010Z\u001a\u00020W8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008X\u0010Y\u00a8\u0006\\"
    }
    d2 = {
        "Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;",
        "Landroid/widget/FrameLayout;",
        "Landroid/content/Context;",
        "context",
        "<init>",
        "(Landroid/content/Context;)V",
        "Ll/dc60;",
        "s",
        "Lkotlin/Function0;",
        "",
        "actionHandler",
        "Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;",
        "y",
        "(Ll/dc60;Lkotlin/jvm/functions/Function0;)Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;",
        "Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;",
        "mv",
        "Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;",
        "x",
        "(Ll/dc60;Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;Lkotlin/jvm/functions/Function0;)Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;",
        "D",
        "()V",
        "w",
        "cv",
        "",
        "isReattach",
        "E",
        "(Ll/dc60;Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;Z)V",
        "F",
        "Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig;",
        "C",
        "(Ll/dc60;)Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig;",
        "onAttachedToWindow",
        "Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider;",
        "resourceProvider",
        "Ljava/util/concurrent/ExecutorService;",
        "mediaExecutor",
        "v",
        "(Ll/dc60;ZLcom/clevertap/android/sdk/inapp/images/FileResourceProvider;Ljava/util/concurrent/ExecutorService;)V",
        "onDone",
        "B",
        "(Lkotlin/jvm/functions/Function0;)V",
        "releaseMedia",
        "z",
        "(Z)V",
        "Landroid/app/Activity;",
        "activity",
        "setupBackPressCallback",
        "(Landroid/app/Activity;)V",
        "Landroid/view/MotionEvent;",
        "ev",
        "onInterceptTouchEvent",
        "(Landroid/view/MotionEvent;)Z",
        "a",
        "Lkotlin/jvm/functions/Function0;",
        "getOnDismissRequested",
        "()Lkotlin/jvm/functions/Function0;",
        "setOnDismissRequested",
        "onDismissRequested",
        "b",
        "getOnShowFailed",
        "setOnShowFailed",
        "onShowFailed",
        "value",
        "c",
        "Z",
        "isExpanded",
        "()Z",
        "d",
        "Ll/dc60;",
        "session",
        "e",
        "Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;",
        "compactView",
        "f",
        "Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;",
        "expandedView",
        "g",
        "Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;",
        "mediaView",
        "Ll/jl50;",
        "h",
        "Ll/jl50;",
        "backCallback",
        "Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;",
        "i",
        "Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;",
        "layoutListener",
        "Ll/svm;",
        "j",
        "Ll/svm;",
        "safeInsets",
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
.field private static final Companion:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer$a;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field private a:Lkotlin/jvm/functions/Function0;
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

.field private b:Lkotlin/jvm/functions/Function0;
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

.field private c:Z

.field private d:Ll/dc60;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private e:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private f:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private g:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private h:Ll/jl50;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private i:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private j:Ll/svm;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer$a;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;->Companion:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer$a;

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
    sget-object p1, Ll/svm;->e:Ll/svm;

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;->j:Ll/svm;

    .line 13
    .line 14
    new-instance p1, Ll/tb60;

    .line 15
    .line 16
    invoke-direct {p1, p0}, Ll/tb60;-><init>(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;)V

    .line 17
    .line 18
    .line 19
    invoke-static {p0, p1}, Ll/kkl0;->y0(Landroid/view/View;Ll/il50;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static synthetic A(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;ZILjava/lang/Object;)V
    .locals 0

    .line 1
    and-int/lit8 p2, p2, 0x1

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    :cond_0
    invoke-virtual {p0, p1}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;->z(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private final C(Ll/dc60;)Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig;
    .locals 8

    .line 1
    invoke-virtual {p1}, Ll/dc60;->b()Lcom/clevertap/android/sdk/inapp/pipsdk/a;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->b()Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;->g:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;->n()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    const/4 p1, 0x1

    .line 18
    if-ne p0, p1, :cond_0

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig;->g()Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimation;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    sget-object p1, Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimation;->DISSOLVE:Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimation;

    .line 25
    .line 26
    if-ne p0, p1, :cond_0

    .line 27
    .line 28
    sget-object v1, Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimation;->INSTANT:Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimation;

    .line 29
    .line 30
    const/16 v6, 0xe

    .line 31
    .line 32
    const/4 v7, 0x0

    .line 33
    const-wide/16 v2, 0x0

    .line 34
    .line 35
    const/4 v4, 0x0

    .line 36
    const/4 v5, 0x0

    .line 37
    invoke-static/range {v0 .. v7}, Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig;->c(Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig;Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimation;JLandroid/animation/TimeInterpolator;Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig$MoveInDirection;ILjava/lang/Object;)Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0

    .line 42
    :cond_0
    return-object v0
.end method

.method private final D()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;->d:Ll/dc60;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;->e:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;

    .line 7
    .line 8
    if-nez v1, :cond_1

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_1
    iget-object v2, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;->f:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;

    .line 12
    .line 13
    if-nez v2, :cond_2

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_2
    iget-object v3, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;->g:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;

    .line 17
    .line 18
    if-nez v3, :cond_3

    .line 19
    .line 20
    :goto_0
    return-void

    .line 21
    :cond_3
    const/4 v4, 0x1

    .line 22
    iput-boolean v4, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;->c:Z

    .line 23
    .line 24
    invoke-virtual {v0, v4}, Ll/dc60;->n(Z)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;->h:Ll/jl50;

    .line 28
    .line 29
    if-eqz p0, :cond_4

    .line 30
    .line 31
    invoke-virtual {p0, v4}, Ll/jl50;->setEnabled(Z)V

    .line 32
    .line 33
    .line 34
    :cond_4
    const/4 p0, 0x4

    .line 35
    invoke-virtual {v1, p0}, Landroid/view/View;->setVisibility(I)V

    .line 36
    .line 37
    .line 38
    const/4 p0, 0x0

    .line 39
    invoke-virtual {v2, p0}, Landroid/view/View;->setAlpha(F)V

    .line 40
    .line 41
    .line 42
    const/4 p0, 0x0

    .line 43
    invoke-virtual {v2, p0}, Landroid/view/View;->setVisibility(I)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 47
    .line 48
    .line 49
    new-instance p0, Ll/rb60;

    .line 50
    .line 51
    invoke-direct {p0, v3, v2, v0}, Ll/rb60;-><init>(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;Ll/dc60;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v2, v3, v0, p0}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;->j(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;Ll/dc60;Lkotlin/jvm/functions/Function0;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method private final E(Ll/dc60;Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;Z)V
    .locals 17

    .line 1
    move-object/from16 v2, p0

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-virtual/range {p1 .. p1}, Ll/dc60;->b()Lcom/clevertap/android/sdk/inapp/pipsdk/a;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    invoke-virtual {v3}, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->v()I

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    mul-int/2addr v0, v3

    .line 18
    int-to-float v0, v0

    .line 19
    const/high16 v3, 0x42c80000    # 100.0f

    .line 20
    .line 21
    div-float/2addr v0, v3

    .line 22
    float-to-int v0, v0

    .line 23
    const/4 v4, 0x1

    .line 24
    invoke-static {v0, v4}, Lkotlin/ranges/a;->b(II)I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    int-to-double v5, v0

    .line 29
    invoke-virtual/range {p1 .. p1}, Ll/dc60;->b()Lcom/clevertap/android/sdk/inapp/pipsdk/a;

    .line 30
    .line 31
    .line 32
    move-result-object v7

    .line 33
    invoke-virtual {v7}, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->c()D

    .line 34
    .line 35
    .line 36
    move-result-wide v7

    .line 37
    mul-double/2addr v5, v7

    .line 38
    invoke-virtual/range {p1 .. p1}, Ll/dc60;->b()Lcom/clevertap/android/sdk/inapp/pipsdk/a;

    .line 39
    .line 40
    .line 41
    move-result-object v7

    .line 42
    invoke-virtual {v7}, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->d()D

    .line 43
    .line 44
    .line 45
    move-result-wide v7

    .line 46
    div-double/2addr v5, v7

    .line 47
    double-to-int v5, v5

    .line 48
    invoke-static {v5, v4}, Lkotlin/ranges/a;->b(II)I

    .line 49
    .line 50
    .line 51
    move-result v5

    .line 52
    invoke-virtual/range {p1 .. p1}, Ll/dc60;->b()Lcom/clevertap/android/sdk/inapp/pipsdk/a;

    .line 53
    .line 54
    .line 55
    move-result-object v6

    .line 56
    invoke-virtual {v6}, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->l()I

    .line 57
    .line 58
    .line 59
    move-result v6

    .line 60
    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    .line 61
    .line 62
    .line 63
    move-result v7

    .line 64
    invoke-static {v6, v7}, Ll/xqf;->b(II)I

    .line 65
    .line 66
    .line 67
    move-result v13

    .line 68
    invoke-virtual/range {p1 .. p1}, Ll/dc60;->b()Lcom/clevertap/android/sdk/inapp/pipsdk/a;

    .line 69
    .line 70
    .line 71
    move-result-object v6

    .line 72
    invoke-virtual {v6}, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->u()I

    .line 73
    .line 74
    .line 75
    move-result v6

    .line 76
    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    .line 77
    .line 78
    .line 79
    move-result v7

    .line 80
    invoke-static {v6, v7}, Ll/xqf;->b(II)I

    .line 81
    .line 82
    .line 83
    move-result v14

    .line 84
    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 85
    .line 86
    .line 87
    move-result-object v6

    .line 88
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 89
    .line 90
    .line 91
    const/16 v7, 0x50

    .line 92
    .line 93
    invoke-static {v7, v6}, Ll/xqf;->a(ILandroid/content/Context;)I

    .line 94
    .line 95
    .line 96
    move-result v16

    .line 97
    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    .line 98
    .line 99
    .line 100
    move-result v6

    .line 101
    mul-int/lit8 v6, v6, 0x28

    .line 102
    .line 103
    int-to-float v6, v6

    .line 104
    div-float/2addr v6, v3

    .line 105
    float-to-int v3, v6

    .line 106
    if-le v5, v3, :cond_0

    .line 107
    .line 108
    invoke-static {v3, v4}, Lkotlin/ranges/a;->b(II)I

    .line 109
    .line 110
    .line 111
    move-result v5

    .line 112
    int-to-double v6, v5

    .line 113
    invoke-virtual/range {p1 .. p1}, Ll/dc60;->b()Lcom/clevertap/android/sdk/inapp/pipsdk/a;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->d()D

    .line 118
    .line 119
    .line 120
    move-result-wide v8

    .line 121
    mul-double/2addr v6, v8

    .line 122
    invoke-virtual/range {p1 .. p1}, Ll/dc60;->b()Lcom/clevertap/android/sdk/inapp/pipsdk/a;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->c()D

    .line 127
    .line 128
    .line 129
    move-result-wide v8

    .line 130
    div-double/2addr v6, v8

    .line 131
    double-to-int v0, v6

    .line 132
    invoke-static {v0, v4}, Lkotlin/ranges/a;->b(II)I

    .line 133
    .line 134
    .line 135
    move-result v0

    .line 136
    :cond_0
    invoke-virtual/range {p1 .. p1}, Ll/dc60;->b()Lcom/clevertap/android/sdk/inapp/pipsdk/a;

    .line 137
    .line 138
    .line 139
    move-result-object v3

    .line 140
    invoke-virtual {v3}, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->f()Z

    .line 141
    .line 142
    .line 143
    move-result v3

    .line 144
    const/4 v4, 0x0

    .line 145
    if-eqz v3, :cond_1

    .line 146
    .line 147
    invoke-virtual/range {p1 .. p1}, Ll/dc60;->b()Lcom/clevertap/android/sdk/inapp/pipsdk/a;

    .line 148
    .line 149
    .line 150
    move-result-object v3

    .line 151
    invoke-virtual {v3}, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->g()I

    .line 152
    .line 153
    .line 154
    move-result v3

    .line 155
    if-lez v3, :cond_1

    .line 156
    .line 157
    invoke-virtual/range {p1 .. p1}, Ll/dc60;->b()Lcom/clevertap/android/sdk/inapp/pipsdk/a;

    .line 158
    .line 159
    .line 160
    move-result-object v3

    .line 161
    invoke-virtual {v3}, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->o()Lcom/clevertap/android/sdk/inapp/pipsdk/PIPMediaType;

    .line 162
    .line 163
    .line 164
    move-result-object v3

    .line 165
    sget-object v6, Lcom/clevertap/android/sdk/inapp/pipsdk/PIPMediaType;->VIDEO:Lcom/clevertap/android/sdk/inapp/pipsdk/PIPMediaType;

    .line 166
    .line 167
    if-eq v3, v6, :cond_1

    .line 168
    .line 169
    invoke-virtual/range {p1 .. p1}, Ll/dc60;->b()Lcom/clevertap/android/sdk/inapp/pipsdk/a;

    .line 170
    .line 171
    .line 172
    move-result-object v3

    .line 173
    invoke-virtual {v3}, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->g()I

    .line 174
    .line 175
    .line 176
    move-result v3

    .line 177
    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 178
    .line 179
    .line 180
    move-result-object v6

    .line 181
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 182
    .line 183
    .line 184
    invoke-static {v3, v6}, Ll/xqf;->a(ILandroid/content/Context;)I

    .line 185
    .line 186
    .line 187
    move-result v3

    .line 188
    goto :goto_0

    .line 189
    :cond_1
    move v3, v4

    .line 190
    :goto_0
    if-lez v3, :cond_2

    .line 191
    .line 192
    mul-int/lit8 v3, v3, 0x2

    .line 193
    .line 194
    add-int/2addr v0, v3

    .line 195
    add-int/2addr v5, v3

    .line 196
    :cond_2
    move v11, v0

    .line 197
    move v12, v5

    .line 198
    invoke-virtual {v1, v11}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;->t(I)V

    .line 199
    .line 200
    .line 201
    if-eqz p3, :cond_4

    .line 202
    .line 203
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 204
    .line 205
    invoke-direct {v0, v11, v12}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 206
    .line 207
    .line 208
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 209
    .line 210
    .line 211
    sget-object v8, Ll/kb60;->INSTANCE:Ll/kb60;

    .line 212
    .line 213
    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    .line 214
    .line 215
    .line 216
    move-result v9

    .line 217
    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    .line 218
    .line 219
    .line 220
    move-result v10

    .line 221
    iget-object v15, v2, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;->j:Ll/svm;

    .line 222
    .line 223
    invoke-virtual/range {v8 .. v16}, Ll/kb60;->b(IIIIIILl/svm;I)Ljava/util/Map;

    .line 224
    .line 225
    .line 226
    move-result-object v0

    .line 227
    invoke-virtual/range {p1 .. p1}, Ll/dc60;->c()Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;

    .line 228
    .line 229
    .line 230
    move-result-object v2

    .line 231
    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 232
    .line 233
    .line 234
    move-result-object v0

    .line 235
    check-cast v0, Landroid/graphics/PointF;

    .line 236
    .line 237
    if-nez v0, :cond_3

    .line 238
    .line 239
    return-void

    .line 240
    :cond_3
    iget v2, v0, Landroid/graphics/PointF;->x:F

    .line 241
    .line 242
    invoke-virtual {v1, v2}, Landroid/view/View;->setX(F)V

    .line 243
    .line 244
    .line 245
    iget v0, v0, Landroid/graphics/PointF;->y:F

    .line 246
    .line 247
    invoke-virtual {v1, v0}, Landroid/view/View;->setY(F)V

    .line 248
    .line 249
    .line 250
    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    .line 251
    .line 252
    .line 253
    return-void

    .line 254
    :cond_4
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 255
    .line 256
    invoke-direct {v0, v11, v12}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 257
    .line 258
    .line 259
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 260
    .line 261
    .line 262
    new-instance v0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer$b;

    .line 263
    .line 264
    move-object/from16 v6, p1

    .line 265
    .line 266
    move v3, v13

    .line 267
    move v4, v14

    .line 268
    move/from16 v5, v16

    .line 269
    .line 270
    invoke-direct/range {v0 .. v6}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer$b;-><init>(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;IIILl/dc60;)V

    .line 271
    .line 272
    .line 273
    iput-object v0, v2, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;->i:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 274
    .line 275
    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 276
    .line 277
    .line 278
    move-result-object v1

    .line 279
    invoke-virtual {v1, v0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 280
    .line 281
    .line 282
    return-void
.end method

.method private final F()V
    .locals 13

    .line 1
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;->d:Ll/dc60;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto/16 :goto_0

    .line 6
    .line 7
    :cond_0
    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;->e:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;

    .line 8
    .line 9
    if-nez v1, :cond_1

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_1
    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    if-eqz v2, :cond_2

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_2
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-eqz v2, :cond_5

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-nez v2, :cond_3

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_3
    invoke-virtual {v0}, Ll/dc60;->b()Lcom/clevertap/android/sdk/inapp/pipsdk/a;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-virtual {v2}, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->l()I

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 41
    .line 42
    .line 43
    move-result v3

    .line 44
    invoke-static {v2, v3}, Ll/xqf;->b(II)I

    .line 45
    .line 46
    .line 47
    move-result v9

    .line 48
    invoke-virtual {v0}, Ll/dc60;->b()Lcom/clevertap/android/sdk/inapp/pipsdk/a;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-virtual {v2}, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->u()I

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 57
    .line 58
    .line 59
    move-result v3

    .line 60
    invoke-static {v2, v3}, Ll/xqf;->b(II)I

    .line 61
    .line 62
    .line 63
    move-result v10

    .line 64
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 69
    .line 70
    .line 71
    const/16 v3, 0x50

    .line 72
    .line 73
    invoke-static {v3, v2}, Ll/xqf;->a(ILandroid/content/Context;)I

    .line 74
    .line 75
    .line 76
    move-result v12

    .line 77
    sget-object v4, Ll/kb60;->INSTANCE:Ll/kb60;

    .line 78
    .line 79
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 80
    .line 81
    .line 82
    move-result v5

    .line 83
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 84
    .line 85
    .line 86
    move-result v6

    .line 87
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    .line 88
    .line 89
    .line 90
    move-result v7

    .line 91
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    .line 92
    .line 93
    .line 94
    move-result v8

    .line 95
    iget-object v11, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;->j:Ll/svm;

    .line 96
    .line 97
    invoke-virtual/range {v4 .. v12}, Ll/kb60;->b(IIIIIILl/svm;I)Ljava/util/Map;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    invoke-virtual {v0}, Ll/dc60;->c()Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    check-cast p0, Landroid/graphics/PointF;

    .line 110
    .line 111
    if-nez p0, :cond_4

    .line 112
    .line 113
    goto :goto_0

    .line 114
    :cond_4
    iget v0, p0, Landroid/graphics/PointF;->x:F

    .line 115
    .line 116
    invoke-virtual {v1, v0}, Landroid/view/View;->setX(F)V

    .line 117
    .line 118
    .line 119
    iget p0, p0, Landroid/graphics/PointF;->y:F

    .line 120
    .line 121
    invoke-virtual {v1, p0}, Landroid/view/View;->setY(F)V

    .line 122
    .line 123
    .line 124
    :cond_5
    :goto_0
    return-void
.end method

.method public static a(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;Z)Lkotlin/Unit;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/zb60;

    .line 5
    .line 6
    invoke-direct {v0, p1, p0}, Ll/zb60;-><init>(ZLcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 10
    .line 11
    .line 12
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 13
    .line 14
    return-object p0
.end method

.method public static b(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;Z)Lkotlin/Unit;
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
    invoke-virtual {p0, p2}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;->s(Z)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1, p2}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;->m(Z)V

    .line 11
    .line 12
    .line 13
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 14
    .line 15
    return-object p0
.end method

.method public static c(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;Landroid/view/View;Ll/dgq0;)Ll/dgq0;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-static {}, Ll/dgq0$l;->f()I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    invoke-static {}, Ll/dgq0$l;->a()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    or-int/2addr p1, v0

    .line 19
    invoke-virtual {p2, p1}, Ll/dgq0;->f(I)Ll/svm;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;->j:Ll/svm;

    .line 27
    .line 28
    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-nez v0, :cond_0

    .line 33
    .line 34
    iput-object p1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;->j:Ll/svm;

    .line 35
    .line 36
    invoke-direct {p0}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;->F()V

    .line 37
    .line 38
    .line 39
    :cond_0
    return-object p2
.end method

.method public static d(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;->D()V

    .line 5
    .line 6
    .line 7
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 8
    .line 9
    return-object p0
.end method

.method public static e(ZLcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    iget-object p0, p1, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;->a:Lkotlin/jvm/functions/Function0;

    .line 7
    .line 8
    if-eqz p0, :cond_1

    .line 9
    .line 10
    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object p0, p1, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;->b:Lkotlin/jvm/functions/Function0;

    .line 15
    .line 16
    if-eqz p0, :cond_1

    .line 17
    .line 18
    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    :cond_1
    return-void
.end method

.method public static f(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;Ll/dc60;)Lkotlin/Unit;
    .locals 2

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;->getMediaContainer$clevertap_core_release()Landroid/widget/FrameLayout;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 18
    .line 19
    .line 20
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 21
    .line 22
    const/4 v1, -0x1

    .line 23
    invoke-direct {v0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 24
    .line 25
    .line 26
    const/4 v1, 0x0

    .line 27
    invoke-virtual {p2, p1, v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;->o()Lkotlin/Unit;

    .line 31
    .line 32
    .line 33
    const/16 v0, 0x8

    .line 34
    .line 35
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p2, v1}, Landroid/view/View;->setVisibility(I)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;->l()Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    invoke-virtual {p2, p0}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;->r(Z)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;->m()Z

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    invoke-virtual {p2, p0}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;->s(Z)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p3}, Ll/dc60;->b()Lcom/clevertap/android/sdk/inapp/pipsdk/a;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->h()Ll/m960;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    if-eqz p0, :cond_0

    .line 64
    .line 65
    invoke-interface {p0}, Ll/m960;->a()V

    .line 66
    .line 67
    .line 68
    :cond_0
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 69
    .line 70
    return-object p0
.end method

.method public static g(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;ZLl/dc60;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_2

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    invoke-virtual {p1, p2}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;->n(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;)V

    .line 27
    .line 28
    .line 29
    if-eqz p3, :cond_1

    .line 30
    .line 31
    invoke-virtual {p4}, Ll/dc60;->i()Z

    .line 32
    .line 33
    .line 34
    move-result p2

    .line 35
    if-eqz p2, :cond_1

    .line 36
    .line 37
    const/4 p2, 0x1

    .line 38
    invoke-direct {p0, p4, p1, p2}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;->E(Ll/dc60;Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;Z)V

    .line 39
    .line 40
    .line 41
    invoke-direct {p0}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;->D()V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_1
    invoke-direct {p0, p4, p1, p3}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;->E(Ll/dc60;Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;Z)V

    .line 46
    .line 47
    .line 48
    :cond_2
    :goto_0
    return-void
.end method

.method public static h(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;->a:Lkotlin/jvm/functions/Function0;

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

.method public static i(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;Ll/dc60;)Lkotlin/Unit;
    .locals 2

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;->o()Lkotlin/Unit;

    .line 11
    .line 12
    .line 13
    sget-object p0, Ll/l960;->INSTANCE:Ll/l960;

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;->getMediaContainer$clevertap_core_release()Landroid/widget/FrameLayout;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/sb60;

    .line 20
    .line 21
    invoke-direct {v1, p2}, Ll/sb60;-><init>(Ll/dc60;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, p1, v0, v1}, Ll/l960;->i(Landroid/view/View;Landroid/view/View;Lkotlin/jvm/functions/Function0;)V

    .line 25
    .line 26
    .line 27
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 28
    .line 29
    return-object p0
.end method

.method public static j(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;->w()V

    .line 5
    .line 6
    .line 7
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 8
    .line 9
    return-object p0
.end method

.method public static k(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;)Ll/svm;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;->j:Ll/svm;

    .line 5
    .line 6
    return-object p0
.end method

.method public static l(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;ZLl/dc60;)Lkotlin/Unit;
    .locals 6

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    new-instance v0, Ll/ob60;

    .line 14
    .line 15
    move-object v1, p0

    .line 16
    move-object v2, p1

    .line 17
    move-object v3, p2

    .line 18
    move v4, p3

    .line 19
    move-object v5, p4

    .line 20
    invoke-direct/range {v0 .. v5}, Ll/ob60;-><init>(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;ZLl/dc60;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 24
    .line 25
    .line 26
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 27
    .line 28
    return-object p0
.end method

.method public static m(Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 5
    .line 6
    return-object p0
.end method

.method public static n(Ll/dc60;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/dc60;->b()Lcom/clevertap/android/sdk/inapp/pipsdk/a;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->h()Ll/m960;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    invoke-interface {p0}, Ll/m960;->e()V

    .line 15
    .line 16
    .line 17
    :cond_0
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 18
    .line 19
    return-object p0
.end method

.method public static o(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;)Lkotlin/Unit;
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
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;->p()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;->l()V

    .line 11
    .line 12
    .line 13
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 14
    .line 15
    return-object p0
.end method

.method public static p(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;->a:Lkotlin/jvm/functions/Function0;

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

.method public static q(Ll/dc60;Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;)Lkotlin/Unit;
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
    invoke-virtual {p0}, Ll/dc60;->b()Lcom/clevertap/android/sdk/inapp/pipsdk/a;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->h()Ll/m960;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    invoke-interface {p0}, Ll/m960;->h()V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object p0, p1, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;->a:Lkotlin/jvm/functions/Function0;

    .line 21
    .line 22
    if-eqz p0, :cond_1

    .line 23
    .line 24
    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    :cond_1
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 28
    .line 29
    return-object p0
.end method

.method public static final synthetic r(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;->w()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic s(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;Ll/dc60;)Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;->C(Ll/dc60;)Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static final synthetic t(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;)Ll/svm;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;->j:Ll/svm;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic u(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;->i:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 2
    .line 3
    return-void
.end method

.method private final w()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;->d:Ll/dc60;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;->e:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;

    .line 7
    .line 8
    if-nez v1, :cond_1

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_1
    iget-object v2, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;->f:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;

    .line 12
    .line 13
    if-nez v2, :cond_2

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_2
    iget-object v3, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;->g:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;

    .line 17
    .line 18
    if-nez v3, :cond_3

    .line 19
    .line 20
    :goto_0
    return-void

    .line 21
    :cond_3
    const/4 v4, 0x0

    .line 22
    iput-boolean v4, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;->c:Z

    .line 23
    .line 24
    invoke-virtual {v0, v4}, Ll/dc60;->n(Z)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;->h:Ll/jl50;

    .line 28
    .line 29
    if-eqz p0, :cond_4

    .line 30
    .line 31
    invoke-virtual {p0, v4}, Ll/jl50;->setEnabled(Z)V

    .line 32
    .line 33
    .line 34
    :cond_4
    sget-object p0, Ll/l960;->INSTANCE:Ll/l960;

    .line 35
    .line 36
    new-instance v4, Ll/lb60;

    .line 37
    .line 38
    invoke-direct {v4, v2, v3, v1, v0}, Ll/lb60;-><init>(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;Ll/dc60;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0, v2, v4}, Ll/l960;->h(Landroid/view/View;Lkotlin/jvm/functions/Function0;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method private final x(Ll/dc60;Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;Lkotlin/jvm/functions/Function0;)Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dc60;",
            "Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;)",
            "Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    new-instance v4, Ll/ac60;

    .line 11
    .line 12
    invoke-direct {v4, p0}, Ll/ac60;-><init>(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;)V

    .line 13
    .line 14
    .line 15
    new-instance v5, Ll/bc60;

    .line 16
    .line 17
    invoke-direct {v5, p0}, Ll/bc60;-><init>(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;)V

    .line 18
    .line 19
    .line 20
    new-instance v7, Ll/mb60;

    .line 21
    .line 22
    invoke-direct {v7}, Ll/mb60;-><init>()V

    .line 23
    .line 24
    .line 25
    move-object v3, p1

    .line 26
    move-object v2, p2

    .line 27
    move-object v6, p3

    .line 28
    invoke-direct/range {v0 .. v7}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;-><init>(Landroid/content/Context;Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;Ll/dc60;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function1;)V

    .line 29
    .line 30
    .line 31
    new-instance p1, Ll/nb60;

    .line 32
    .line 33
    invoke-direct {p1, p0}, Ll/nb60;-><init>(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, p1}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;->setGetSafeInsets(Lkotlin/jvm/functions/Function0;)V

    .line 37
    .line 38
    .line 39
    iput-object v0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;->e:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;

    .line 40
    .line 41
    const/4 p1, 0x4

    .line 42
    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 46
    .line 47
    .line 48
    return-object v0
.end method

.method private final y(Ll/dc60;Lkotlin/jvm/functions/Function0;)Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dc60;",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;)",
            "Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1}, Ll/dc60;->b()Lcom/clevertap/android/sdk/inapp/pipsdk/a;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-virtual {v2}, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->q()Z

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    invoke-virtual {p1}, Ll/dc60;->b()Lcom/clevertap/android/sdk/inapp/pipsdk/a;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    invoke-virtual {v3}, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->a()Lcom/clevertap/android/sdk/inapp/CTInAppAction;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    if-eqz v3, :cond_0

    .line 27
    .line 28
    const/4 v3, 0x1

    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const/4 v3, 0x0

    .line 31
    :goto_0
    invoke-virtual {p1}, Ll/dc60;->b()Lcom/clevertap/android/sdk/inapp/pipsdk/a;

    .line 32
    .line 33
    .line 34
    move-result-object v4

    .line 35
    invoke-virtual {v4}, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->r()Z

    .line 36
    .line 37
    .line 38
    move-result v4

    .line 39
    invoke-virtual {p1}, Ll/dc60;->b()Lcom/clevertap/android/sdk/inapp/pipsdk/a;

    .line 40
    .line 41
    .line 42
    move-result-object v5

    .line 43
    invoke-virtual {v5}, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->t()Z

    .line 44
    .line 45
    .line 46
    move-result v5

    .line 47
    invoke-virtual {p1}, Ll/dc60;->b()Lcom/clevertap/android/sdk/inapp/pipsdk/a;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->s()Z

    .line 52
    .line 53
    .line 54
    move-result v6

    .line 55
    new-instance v7, Ll/pb60;

    .line 56
    .line 57
    invoke-direct {v7, p0}, Ll/pb60;-><init>(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;)V

    .line 58
    .line 59
    .line 60
    new-instance v8, Ll/qb60;

    .line 61
    .line 62
    invoke-direct {v8, p0}, Ll/qb60;-><init>(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;)V

    .line 63
    .line 64
    .line 65
    move-object v9, p2

    .line 66
    invoke-direct/range {v0 .. v9}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;-><init>(Landroid/content/Context;ZZZZZLkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;)V

    .line 67
    .line 68
    .line 69
    iput-object v0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;->f:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;

    .line 70
    .line 71
    const/16 p1, 0x8

    .line 72
    .line 73
    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 74
    .line 75
    .line 76
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 77
    .line 78
    const/4 p2, -0x1

    .line 79
    invoke-direct {p1, p2, p2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0, v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 83
    .line 84
    .line 85
    return-object v0
.end method


# virtual methods
.method public final B(Lkotlin/jvm/functions/Function0;)V
    .locals 3
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

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;->d:Ll/dc60;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-interface {p1}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-boolean v1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;->c:Z

    .line 13
    .line 14
    if-eqz v1, :cond_2

    .line 15
    .line 16
    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;->f:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;

    .line 17
    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    move-object v1, p0

    .line 22
    goto :goto_0

    .line 23
    :cond_2
    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;->e:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;

    .line 24
    .line 25
    if-eqz v1, :cond_1

    .line 26
    .line 27
    :goto_0
    sget-object v2, Ll/l960;->INSTANCE:Ll/l960;

    .line 28
    .line 29
    invoke-direct {p0, v0}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;->C(Ll/dc60;)Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {v2, v1, p0, p1}, Ll/l960;->k(Landroid/view/View;Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig;Lkotlin/jvm/functions/Function0;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final getOnDismissRequested()Lkotlin/jvm/functions/Function0;
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
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;->a:Lkotlin/jvm/functions/Function0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getOnShowFailed()Lkotlin/jvm/functions/Function0;
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
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;->b:Lkotlin/jvm/functions/Function0;

    .line 2
    .line 3
    return-object p0
.end method

.method public onAttachedToWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    invoke-static {p0}, Ll/kkl0;->g0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 0
    .param p1    # Landroid/view/MotionEvent;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 p0, 0x0

    return p0
.end method

.method public final setOnDismissRequested(Lkotlin/jvm/functions/Function0;)V
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
    iput-object p1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;->a:Lkotlin/jvm/functions/Function0;

    .line 2
    .line 3
    return-void
.end method

.method public final setOnShowFailed(Lkotlin/jvm/functions/Function0;)V
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
    iput-object p1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;->b:Lkotlin/jvm/functions/Function0;

    .line 2
    .line 3
    return-void
.end method

.method public final setupBackPressCallback(Landroid/app/Activity;)V
    .locals 1
    .param p1    # Landroid/app/Activity;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    instance-of v0, p1, Landroidx/activity/ComponentActivity;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    check-cast p1, Landroidx/activity/ComponentActivity;

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 p1, 0x0

    .line 12
    :goto_0
    if-nez p1, :cond_1

    .line 13
    .line 14
    return-void

    .line 15
    :cond_1
    new-instance v0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer$c;

    .line 16
    .line 17
    invoke-direct {v0, p0}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer$c;-><init>(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;->h:Ll/jl50;

    .line 21
    .line 22
    invoke-virtual {p1}, Landroidx/activity/ComponentActivity;->getOnBackPressedDispatcher()Landroidx/activity/OnBackPressedDispatcher;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0, v0}, Landroidx/activity/OnBackPressedDispatcher;->b(Ll/jl50;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final v(Ll/dc60;ZLcom/clevertap/android/sdk/inapp/images/FileResourceProvider;Ljava/util/concurrent/ExecutorService;)V
    .locals 8
    .param p1    # Ll/dc60;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p4    # Ljava/util/concurrent/ExecutorService;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;->d:Ll/dc60;

    .line 5
    .line 6
    new-instance v0, Ll/ub60;

    .line 7
    .line 8
    invoke-direct {v0, p1, p0}, Ll/ub60;-><init>(Ll/dc60;Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0, p1, v0}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;->y(Ll/dc60;Lkotlin/jvm/functions/Function0;)Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    new-instance v5, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 22
    .line 23
    .line 24
    invoke-direct {v5, v2}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;-><init>(Landroid/content/Context;)V

    .line 25
    .line 26
    .line 27
    iput-object v5, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;->g:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;

    .line 28
    .line 29
    invoke-direct {p0, p1, v5, v0}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;->x(Ll/dc60;Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;Lkotlin/jvm/functions/Function0;)Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;

    .line 30
    .line 31
    .line 32
    move-result-object v4

    .line 33
    new-instance v0, Ll/vb60;

    .line 34
    .line 35
    invoke-direct {v0, v4, v1}, Ll/vb60;-><init>(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v5, v0}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;->setOnVideoFallback(Lkotlin/jvm/functions/Function0;)V

    .line 39
    .line 40
    .line 41
    new-instance v0, Ll/wb60;

    .line 42
    .line 43
    invoke-direct {v0, v4, v1}, Ll/wb60;-><init>(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v5, v0}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;->setOnPlayStateChanged(Lkotlin/jvm/functions/Function1;)V

    .line 47
    .line 48
    .line 49
    new-instance v2, Ll/xb60;

    .line 50
    .line 51
    move-object v3, p0

    .line 52
    move-object v7, p1

    .line 53
    move v6, p2

    .line 54
    invoke-direct/range {v2 .. v7}, Ll/xb60;-><init>(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;ZLl/dc60;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v5, v2}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;->setOnMediaReady(Lkotlin/jvm/functions/Function0;)V

    .line 58
    .line 59
    .line 60
    new-instance p0, Ll/yb60;

    .line 61
    .line 62
    invoke-direct {p0, v3, v6}, Ll/yb60;-><init>(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;Z)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v5, p0}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;->setOnAllMediaFailed(Lkotlin/jvm/functions/Function0;)V

    .line 66
    .line 67
    .line 68
    if-eqz v6, :cond_0

    .line 69
    .line 70
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 71
    .line 72
    .line 73
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 74
    .line 75
    .line 76
    invoke-virtual {v5, v7, p3, p4}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;->p(Ll/dc60;Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider;Ljava/util/concurrent/ExecutorService;)V

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    :cond_0
    invoke-virtual {v7}, Ll/dc60;->b()Lcom/clevertap/android/sdk/inapp/pipsdk/a;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 85
    .line 86
    .line 87
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 88
    .line 89
    .line 90
    invoke-virtual {v5, p0, v7, p3, p4}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;->k(Lcom/clevertap/android/sdk/inapp/pipsdk/a;Ll/dc60;Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider;Ljava/util/concurrent/ExecutorService;)V

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method public final z(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;->i:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;->e:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {v1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-virtual {v1, v0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    const/4 v0, 0x0

    .line 19
    iput-object v0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;->i:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 20
    .line 21
    :cond_1
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;->e:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;

    .line 22
    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;->o()V

    .line 26
    .line 27
    .line 28
    :cond_2
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;->f:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;

    .line 29
    .line 30
    if-eqz v0, :cond_3

    .line 31
    .line 32
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPExpandedView;->k()V

    .line 33
    .line 34
    .line 35
    :cond_3
    if-eqz p1, :cond_4

    .line 36
    .line 37
    iget-object p1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;->g:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;

    .line 38
    .line 39
    if-eqz p1, :cond_4

    .line 40
    .line 41
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;->q()Lkotlin/Unit;

    .line 42
    .line 43
    .line 44
    :cond_4
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPRootContainer;->h:Ll/jl50;

    .line 45
    .line 46
    if-eqz p0, :cond_5

    .line 47
    .line 48
    invoke-virtual {p0}, Ll/jl50;->remove()V

    .line 49
    .line 50
    .line 51
    :cond_5
    return-void
.end method
