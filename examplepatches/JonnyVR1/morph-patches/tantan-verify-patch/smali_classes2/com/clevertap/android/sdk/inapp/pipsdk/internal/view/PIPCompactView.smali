.class public final Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000r\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0005\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u000c\n\u0002\u0018\u0002\n\u0002\u0008\u0012\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\n\n\u0002\u0018\u0002\n\u0002\u0008\u0007\u0008\u0000\u0018\u0000 W2\u00020\u0001:\u00010B]\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\u000c\u0010\n\u001a\u0008\u0012\u0004\u0012\u00020\t0\u0008\u0012\u000c\u0010\u000b\u001a\u0008\u0012\u0004\u0012\u00020\t0\u0008\u0012\u000c\u0010\u000c\u001a\u0008\u0012\u0004\u0012\u00020\t0\u0008\u0012\u0012\u0010\u000f\u001a\u000e\u0012\u0004\u0012\u00020\u000e\u0012\u0004\u0012\u00020\t0\r\u00a2\u0006\u0004\u0008\u0010\u0010\u0011J\u0017\u0010\u0014\u001a\u00020\t2\u0006\u0010\u0013\u001a\u00020\u0012H\u0002\u00a2\u0006\u0004\u0008\u0014\u0010\u0015J\u0017\u0010\u0017\u001a\u00020\t2\u0006\u0010\u0016\u001a\u00020\u0012H\u0002\u00a2\u0006\u0004\u0008\u0017\u0010\u0015J\u0017\u0010\u001a\u001a\u00020\u00182\u0006\u0010\u0019\u001a\u00020\u0018H\u0002\u00a2\u0006\u0004\u0008\u001a\u0010\u001bJ\u0017\u0010\u001e\u001a\u00020\t2\u0006\u0010\u001d\u001a\u00020\u001cH\u0002\u00a2\u0006\u0004\u0008\u001e\u0010\u001fJ\u0015\u0010!\u001a\u00020\t2\u0006\u0010 \u001a\u00020\u0004\u00a2\u0006\u0004\u0008!\u0010\"J\r\u0010#\u001a\u00020\t\u00a2\u0006\u0004\u0008#\u0010$J\u0015\u0010%\u001a\u00020\t2\u0006\u0010\u0013\u001a\u00020\u0012\u00a2\u0006\u0004\u0008%\u0010\u0015J\u0015\u0010&\u001a\u00020\t2\u0006\u0010\u0016\u001a\u00020\u0012\u00a2\u0006\u0004\u0008&\u0010\u0015J\u0015\u0010\'\u001a\u00020\t2\u0006\u0010\u0019\u001a\u00020\u0018\u00a2\u0006\u0004\u0008\'\u0010(J\u0017\u0010+\u001a\u00020\u00122\u0006\u0010*\u001a\u00020)H\u0016\u00a2\u0006\u0004\u0008+\u0010,J\u0017\u0010.\u001a\u00020\u00122\u0006\u0010-\u001a\u00020)H\u0016\u00a2\u0006\u0004\u0008.\u0010,J\r\u0010/\u001a\u00020\t\u00a2\u0006\u0004\u0008/\u0010$R\u0017\u0010\u0005\u001a\u00020\u00048\u0006\u00a2\u0006\u000c\n\u0004\u00080\u00101\u001a\u0004\u00082\u00103R\u0014\u0010\u0007\u001a\u00020\u00068\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u00084\u00105R\u001a\u0010\n\u001a\u0008\u0012\u0004\u0012\u00020\t0\u00088\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u00086\u00107R\u001a\u0010\u000b\u001a\u0008\u0012\u0004\u0012\u00020\t0\u00088\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u00088\u00107R\u001a\u0010\u000c\u001a\u0008\u0012\u0004\u0012\u00020\t0\u00088\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u00089\u00107R \u0010\u000f\u001a\u000e\u0012\u0004\u0012\u00020\u000e\u0012\u0004\u0012\u00020\t0\r8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008:\u0010;R\u001a\u0010A\u001a\u00020<8\u0000X\u0080\u0004\u00a2\u0006\u000c\n\u0004\u0008=\u0010>\u001a\u0004\u0008?\u0010@R\u0014\u0010E\u001a\u00020B8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008C\u0010DR\u0018\u0010I\u001a\u0004\u0018\u00010F8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008G\u0010HR\u0018\u0010K\u001a\u0004\u0018\u00010F8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008J\u0010HR\u0018\u0010M\u001a\u0004\u0018\u00010F8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008L\u0010HR\u0018\u0010O\u001a\u0004\u0018\u00010F8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008N\u0010HR\u0018\u0010P\u001a\u0004\u0018\u00010F8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u001e\u0010HR(\u0010V\u001a\u0008\u0012\u0004\u0012\u00020Q0\u00088\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008!\u00107\u001a\u0004\u0008R\u0010S\"\u0004\u0008T\u0010U\u00a8\u0006X"
    }
    d2 = {
        "Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;",
        "Landroid/widget/FrameLayout;",
        "Landroid/content/Context;",
        "context",
        "Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;",
        "mediaView",
        "Ll/dc60;",
        "session",
        "Lkotlin/Function0;",
        "",
        "onExpand",
        "onClose",
        "onAction",
        "Lkotlin/Function1;",
        "Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;",
        "onSnap",
        "<init>",
        "(Landroid/content/Context;Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;Ll/dc60;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function1;)V",
        "",
        "playing",
        "v",
        "(Z)V",
        "muted",
        "u",
        "",
        "pipWidthPx",
        "q",
        "(I)I",
        "Lcom/clevertap/android/sdk/inapp/pipsdk/a;",
        "cfg",
        "m",
        "(Lcom/clevertap/android/sdk/inapp/pipsdk/a;)V",
        "mv",
        "n",
        "(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;)V",
        "p",
        "()V",
        "s",
        "r",
        "t",
        "(I)V",
        "Landroid/view/MotionEvent;",
        "ev",
        "onInterceptTouchEvent",
        "(Landroid/view/MotionEvent;)Z",
        "event",
        "onTouchEvent",
        "o",
        "a",
        "Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;",
        "getMediaView",
        "()Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;",
        "b",
        "Ll/dc60;",
        "c",
        "Lkotlin/jvm/functions/Function0;",
        "d",
        "e",
        "f",
        "Lkotlin/jvm/functions/Function1;",
        "Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPControlsOverlay;",
        "g",
        "Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPControlsOverlay;",
        "getControlsOverlay$clevertap_core_release",
        "()Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPControlsOverlay;",
        "controlsOverlay",
        "Ll/ca60;",
        "h",
        "Ll/ca60;",
        "dragHandler",
        "Landroid/widget/ImageView;",
        "i",
        "Landroid/widget/ImageView;",
        "closeBtn",
        "j",
        "playPauseBtn",
        "k",
        "deeplinkBtn",
        "l",
        "muteBtn",
        "expandBtn",
        "Ll/svm;",
        "getGetSafeInsets",
        "()Lkotlin/jvm/functions/Function0;",
        "setGetSafeInsets",
        "(Lkotlin/jvm/functions/Function0;)V",
        "getSafeInsets",
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
.field private static final Companion:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView$a;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field private final a:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final b:Ll/dc60;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final c:Lkotlin/jvm/functions/Function0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final d:Lkotlin/jvm/functions/Function0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final e:Lkotlin/jvm/functions/Function0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final f:Lkotlin/jvm/functions/Function1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function1<",
            "Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final g:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPControlsOverlay;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final h:Ll/ca60;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private i:Landroid/widget/ImageView;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private j:Landroid/widget/ImageView;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private k:Landroid/widget/ImageView;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private l:Landroid/widget/ImageView;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private m:Landroid/widget/ImageView;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private n:Lkotlin/jvm/functions/Function0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function0<",
            "Ll/svm;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView$a;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;->Companion:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView$a;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;Ll/dc60;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function1;)V
    .locals 16
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ll/dc60;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p4    # Lkotlin/jvm/functions/Function0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p5    # Lkotlin/jvm/functions/Function0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p6    # Lkotlin/jvm/functions/Function0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p7    # Lkotlin/jvm/functions/Function1;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;",
            "Ll/dc60;",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v0, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    invoke-virtual/range {p3 .. p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    invoke-virtual/range {p4 .. p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    .line 18
    .line 19
    invoke-virtual/range {p5 .. p5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    .line 21
    .line 22
    invoke-virtual/range {p6 .. p6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 23
    .line 24
    .line 25
    invoke-virtual/range {p7 .. p7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 26
    .line 27
    .line 28
    invoke-direct/range {p0 .. p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 29
    .line 30
    .line 31
    iput-object v2, v1, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;->a:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;

    .line 32
    .line 33
    move-object/from16 v3, p3

    .line 34
    .line 35
    iput-object v3, v1, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;->b:Ll/dc60;

    .line 36
    .line 37
    move-object/from16 v4, p4

    .line 38
    .line 39
    iput-object v4, v1, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;->c:Lkotlin/jvm/functions/Function0;

    .line 40
    .line 41
    move-object/from16 v4, p5

    .line 42
    .line 43
    iput-object v4, v1, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;->d:Lkotlin/jvm/functions/Function0;

    .line 44
    .line 45
    move-object/from16 v4, p6

    .line 46
    .line 47
    iput-object v4, v1, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;->e:Lkotlin/jvm/functions/Function0;

    .line 48
    .line 49
    move-object/from16 v4, p7

    .line 50
    .line 51
    iput-object v4, v1, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;->f:Lkotlin/jvm/functions/Function1;

    .line 52
    .line 53
    new-instance v4, Ll/n960;

    .line 54
    .line 55
    invoke-direct {v4}, Ll/n960;-><init>()V

    .line 56
    .line 57
    .line 58
    iput-object v4, v1, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;->n:Lkotlin/jvm/functions/Function0;

    .line 59
    .line 60
    invoke-virtual {v3}, Ll/dc60;->b()Lcom/clevertap/android/sdk/inapp/pipsdk/a;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    const/4 v4, 0x6

    .line 65
    invoke-static {v4, v0}, Ll/xqf;->a(ILandroid/content/Context;)I

    .line 66
    .line 67
    .line 68
    move-result v4

    .line 69
    int-to-float v4, v4

    .line 70
    invoke-virtual {v1, v4}, Landroid/view/View;->setElevation(F)V

    .line 71
    .line 72
    .line 73
    invoke-direct {v1, v3}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;->m(Lcom/clevertap/android/sdk/inapp/pipsdk/a;)V

    .line 74
    .line 75
    .line 76
    new-instance v4, Landroid/widget/FrameLayout$LayoutParams;

    .line 77
    .line 78
    const/4 v5, -0x1

    .line 79
    invoke-direct {v4, v5, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {v1, v2, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 83
    .line 84
    .line 85
    new-instance v2, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPControlsOverlay;

    .line 86
    .line 87
    invoke-direct {v2, v0}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPControlsOverlay;-><init>(Landroid/content/Context;)V

    .line 88
    .line 89
    .line 90
    iput-object v2, v1, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;->g:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPControlsOverlay;

    .line 91
    .line 92
    const/4 v4, 0x0

    .line 93
    invoke-virtual {v2, v4}, Landroid/view/View;->setAlpha(F)V

    .line 94
    .line 95
    .line 96
    const/16 v4, 0x18

    .line 97
    .line 98
    invoke-static {v4, v0}, Ll/xqf;->a(ILandroid/content/Context;)I

    .line 99
    .line 100
    .line 101
    move-result v4

    .line 102
    int-to-float v6, v4

    .line 103
    const/high16 v7, 0x3f800000    # 1.0f

    .line 104
    .line 105
    mul-float/2addr v6, v7

    .line 106
    float-to-int v6, v6

    .line 107
    const/16 v7, 0x8

    .line 108
    .line 109
    invoke-static {v7, v0}, Ll/xqf;->a(ILandroid/content/Context;)I

    .line 110
    .line 111
    .line 112
    move-result v8

    .line 113
    const/4 v9, 0x4

    .line 114
    invoke-static {v9, v0}, Ll/xqf;->a(ILandroid/content/Context;)I

    .line 115
    .line 116
    .line 117
    move-result v9

    .line 118
    new-instance v10, Landroid/widget/ImageView;

    .line 119
    .line 120
    invoke-direct {v10, v0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 121
    .line 122
    .line 123
    sget v11, Ll/wbc0;->c:I

    .line 124
    .line 125
    invoke-virtual {v10, v11}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 126
    .line 127
    .line 128
    sget v11, Lcom/clevertap/android/sdk/R$string;->c:I

    .line 129
    .line 130
    invoke-virtual {v0, v11}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v11

    .line 134
    invoke-virtual {v10, v11}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 135
    .line 136
    .line 137
    sget-object v11, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    .line 138
    .line 139
    invoke-virtual {v10, v11}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 140
    .line 141
    .line 142
    invoke-virtual {v3}, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->q()Z

    .line 143
    .line 144
    .line 145
    move-result v12

    .line 146
    const/4 v13, 0x0

    .line 147
    if-eqz v12, :cond_0

    .line 148
    .line 149
    move v12, v13

    .line 150
    goto :goto_0

    .line 151
    :cond_0
    move v12, v7

    .line 152
    :goto_0
    invoke-virtual {v10, v12}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 153
    .line 154
    .line 155
    new-instance v12, Ll/q960;

    .line 156
    .line 157
    invoke-direct {v12, v1}, Ll/q960;-><init>(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;)V

    .line 158
    .line 159
    .line 160
    invoke-virtual {v10, v12}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 161
    .line 162
    .line 163
    iput-object v10, v1, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;->i:Landroid/widget/ImageView;

    .line 164
    .line 165
    new-instance v12, Landroid/widget/FrameLayout$LayoutParams;

    .line 166
    .line 167
    const v14, 0x800035

    .line 168
    .line 169
    .line 170
    invoke-direct {v12, v4, v4, v14}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    .line 171
    .line 172
    .line 173
    invoke-virtual {v12, v9, v9, v9, v9}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 174
    .line 175
    .line 176
    sget-object v14, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 177
    .line 178
    invoke-virtual {v2, v10, v12}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 179
    .line 180
    .line 181
    new-instance v10, Landroid/widget/ImageView;

    .line 182
    .line 183
    invoke-direct {v10, v0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 184
    .line 185
    .line 186
    sget-object v12, Ll/ma60;->INSTANCE:Ll/ma60;

    .line 187
    .line 188
    const/4 v14, 0x1

    .line 189
    invoke-virtual {v12, v14}, Ll/ma60;->d(Z)I

    .line 190
    .line 191
    .line 192
    move-result v15

    .line 193
    invoke-virtual {v10, v15}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 194
    .line 195
    .line 196
    invoke-virtual {v12, v14}, Ll/ma60;->c(Z)I

    .line 197
    .line 198
    .line 199
    move-result v15

    .line 200
    invoke-virtual {v0, v15}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 201
    .line 202
    .line 203
    move-result-object v15

    .line 204
    invoke-virtual {v10, v15}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 205
    .line 206
    .line 207
    invoke-virtual {v10, v11}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 208
    .line 209
    .line 210
    invoke-virtual {v10, v7}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 211
    .line 212
    .line 213
    iput-object v10, v1, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;->j:Landroid/widget/ImageView;

    .line 214
    .line 215
    new-instance v15, Landroid/widget/FrameLayout$LayoutParams;

    .line 216
    .line 217
    const/16 v5, 0x11

    .line 218
    .line 219
    invoke-direct {v15, v6, v6, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    .line 220
    .line 221
    .line 222
    invoke-virtual {v2, v10, v15}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 223
    .line 224
    .line 225
    new-instance v5, Landroid/widget/LinearLayout;

    .line 226
    .line 227
    invoke-direct {v5, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 228
    .line 229
    .line 230
    invoke-virtual {v5, v13}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 231
    .line 232
    .line 233
    const/16 v6, 0x10

    .line 234
    .line 235
    invoke-virtual {v5, v6}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 236
    .line 237
    .line 238
    new-instance v6, Landroid/widget/ImageView;

    .line 239
    .line 240
    invoke-direct {v6, v0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 241
    .line 242
    .line 243
    sget v10, Ll/wbc0;->e:I

    .line 244
    .line 245
    invoke-virtual {v6, v10}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 246
    .line 247
    .line 248
    sget v10, Lcom/clevertap/android/sdk/R$string;->a:I

    .line 249
    .line 250
    invoke-virtual {v0, v10}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 251
    .line 252
    .line 253
    move-result-object v10

    .line 254
    invoke-virtual {v6, v10}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 255
    .line 256
    .line 257
    invoke-virtual {v6, v11}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 258
    .line 259
    .line 260
    invoke-virtual {v3}, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->a()Lcom/clevertap/android/sdk/inapp/CTInAppAction;

    .line 261
    .line 262
    .line 263
    move-result-object v10

    .line 264
    if-eqz v10, :cond_1

    .line 265
    .line 266
    move v10, v13

    .line 267
    goto :goto_1

    .line 268
    :cond_1
    move v10, v7

    .line 269
    :goto_1
    invoke-virtual {v6, v10}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 270
    .line 271
    .line 272
    new-instance v10, Ll/r960;

    .line 273
    .line 274
    invoke-direct {v10, v1}, Ll/r960;-><init>(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;)V

    .line 275
    .line 276
    .line 277
    invoke-virtual {v6, v10}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 278
    .line 279
    .line 280
    iput-object v6, v1, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;->k:Landroid/widget/ImageView;

    .line 281
    .line 282
    new-instance v10, Landroid/widget/LinearLayout$LayoutParams;

    .line 283
    .line 284
    invoke-direct {v10, v4, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 285
    .line 286
    .line 287
    invoke-virtual {v5, v6, v10}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 288
    .line 289
    .line 290
    new-instance v6, Landroid/widget/ImageView;

    .line 291
    .line 292
    invoke-direct {v6, v0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 293
    .line 294
    .line 295
    invoke-virtual {v12, v14}, Ll/ma60;->b(Z)I

    .line 296
    .line 297
    .line 298
    move-result v10

    .line 299
    invoke-virtual {v6, v10}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 300
    .line 301
    .line 302
    invoke-virtual {v12, v14}, Ll/ma60;->a(Z)I

    .line 303
    .line 304
    .line 305
    move-result v10

    .line 306
    invoke-virtual {v0, v10}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 307
    .line 308
    .line 309
    move-result-object v10

    .line 310
    invoke-virtual {v6, v10}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 311
    .line 312
    .line 313
    invoke-virtual {v6, v11}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 314
    .line 315
    .line 316
    invoke-virtual {v6, v7}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 317
    .line 318
    .line 319
    iput-object v6, v1, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;->l:Landroid/widget/ImageView;

    .line 320
    .line 321
    new-instance v10, Landroid/widget/LinearLayout$LayoutParams;

    .line 322
    .line 323
    invoke-direct {v10, v4, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 324
    .line 325
    .line 326
    invoke-virtual {v10, v8}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V

    .line 327
    .line 328
    .line 329
    invoke-virtual {v5, v6, v10}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 330
    .line 331
    .line 332
    new-instance v6, Landroid/widget/ImageView;

    .line 333
    .line 334
    invoke-direct {v6, v0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 335
    .line 336
    .line 337
    sget v10, Ll/wbc0;->f:I

    .line 338
    .line 339
    invoke-virtual {v6, v10}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 340
    .line 341
    .line 342
    sget v10, Lcom/clevertap/android/sdk/R$string;->i:I

    .line 343
    .line 344
    invoke-virtual {v0, v10}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 345
    .line 346
    .line 347
    move-result-object v10

    .line 348
    invoke-virtual {v6, v10}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 349
    .line 350
    .line 351
    invoke-virtual {v6, v11}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 352
    .line 353
    .line 354
    invoke-virtual {v3}, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->r()Z

    .line 355
    .line 356
    .line 357
    move-result v10

    .line 358
    if-eqz v10, :cond_2

    .line 359
    .line 360
    move v7, v13

    .line 361
    :cond_2
    invoke-virtual {v6, v7}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 362
    .line 363
    .line 364
    new-instance v7, Ll/s960;

    .line 365
    .line 366
    invoke-direct {v7, v1}, Ll/s960;-><init>(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;)V

    .line 367
    .line 368
    .line 369
    invoke-virtual {v6, v7}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 370
    .line 371
    .line 372
    iput-object v6, v1, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;->m:Landroid/widget/ImageView;

    .line 373
    .line 374
    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    .line 375
    .line 376
    invoke-direct {v7, v4, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 377
    .line 378
    .line 379
    invoke-virtual {v7, v8}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V

    .line 380
    .line 381
    .line 382
    invoke-virtual {v5, v6, v7}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 383
    .line 384
    .line 385
    new-instance v4, Landroid/widget/FrameLayout$LayoutParams;

    .line 386
    .line 387
    const v6, 0x800055

    .line 388
    .line 389
    .line 390
    const/4 v7, -0x2

    .line 391
    invoke-direct {v4, v7, v7, v6}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    .line 392
    .line 393
    .line 394
    invoke-virtual {v4, v9, v9, v9, v9}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 395
    .line 396
    .line 397
    invoke-virtual {v2, v5, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 398
    .line 399
    .line 400
    new-instance v4, Landroid/widget/FrameLayout$LayoutParams;

    .line 401
    .line 402
    const/4 v5, -0x1

    .line 403
    invoke-direct {v4, v5, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 404
    .line 405
    .line 406
    invoke-virtual {v1, v2, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 407
    .line 408
    .line 409
    const/16 v2, 0x50

    .line 410
    .line 411
    invoke-static {v2, v0}, Ll/xqf;->a(ILandroid/content/Context;)I

    .line 412
    .line 413
    .line 414
    move-result v0

    .line 415
    new-instance v2, Ll/ca60;

    .line 416
    .line 417
    invoke-virtual {v3}, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->j()Z

    .line 418
    .line 419
    .line 420
    move-result v3

    .line 421
    move-object v4, v2

    .line 422
    move v2, v3

    .line 423
    new-instance v3, Ll/t960;

    .line 424
    .line 425
    invoke-direct {v3, v1}, Ll/t960;-><init>(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;)V

    .line 426
    .line 427
    .line 428
    move-object v5, v4

    .line 429
    new-instance v4, Ll/u960;

    .line 430
    .line 431
    invoke-direct {v4, v1}, Ll/u960;-><init>(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;)V

    .line 432
    .line 433
    .line 434
    move-object v6, v5

    .line 435
    new-instance v5, Ll/v960;

    .line 436
    .line 437
    invoke-direct {v5, v1}, Ll/v960;-><init>(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;)V

    .line 438
    .line 439
    .line 440
    move-object v7, v6

    .line 441
    new-instance v6, Ll/w960;

    .line 442
    .line 443
    invoke-direct {v6, v0}, Ll/w960;-><init>(I)V

    .line 444
    .line 445
    .line 446
    move-object v0, v7

    .line 447
    new-instance v7, Ll/x960;

    .line 448
    .line 449
    invoke-direct {v7, v1}, Ll/x960;-><init>(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;)V

    .line 450
    .line 451
    .line 452
    new-instance v8, Ll/y960;

    .line 453
    .line 454
    invoke-direct {v8, v1}, Ll/y960;-><init>(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;)V

    .line 455
    .line 456
    .line 457
    invoke-direct/range {v0 .. v8}, Ll/ca60;-><init>(Landroid/view/View;ZLkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function0;)V

    .line 458
    .line 459
    .line 460
    iput-object v0, v1, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;->h:Ll/ca60;

    .line 461
    .line 462
    return-void
.end method

.method public static a(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;->d:Lkotlin/jvm/functions/Function0;

    .line 5
    .line 6
    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static b(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;Landroid/view/View;)V
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
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;->t()Lkotlin/Unit;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;->m()Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    invoke-direct {p1, p0}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;->v(Z)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p1, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;->g:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPControlsOverlay;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPControlsOverlay;->e()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static c(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;->c:Lkotlin/jvm/functions/Function0;

    .line 5
    .line 6
    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static d()Ll/svm;
    .locals 1

    .line 1
    sget-object v0, Ll/svm;->e:Ll/svm;

    .line 2
    .line 3
    return-object v0
.end method

.method public static e(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;)I
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;->b:Ll/dc60;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/dc60;->b()Lcom/clevertap/android/sdk/inapp/pipsdk/a;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->l()I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method

.method public static f(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;Landroid/view/View;)V
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
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;->s()Lkotlin/Unit;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;->l()Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    invoke-direct {p1, p0}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;->u(Z)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p1, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;->g:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPControlsOverlay;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPControlsOverlay;->e()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static g(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;->e:Lkotlin/jvm/functions/Function0;

    .line 5
    .line 6
    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static h(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;)Ll/svm;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;->n:Lkotlin/jvm/functions/Function0;

    .line 5
    .line 6
    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Ll/svm;

    .line 11
    .line 12
    return-object p0
.end method

.method public static i(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;)I
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;->b:Ll/dc60;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/dc60;->b()Lcom/clevertap/android/sdk/inapp/pipsdk/a;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->u()I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method

.method public static j(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;)Lkotlin/Unit;
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
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;->b:Ll/dc60;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Ll/dc60;->m(Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;->f:Lkotlin/jvm/functions/Function1;

    .line 13
    .line 14
    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 18
    .line 19
    return-object p0
.end method

.method public static k(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;)Lkotlin/Unit;
    .locals 3

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;->g:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPControlsOverlay;

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    const/4 v1, 0x0

    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-static {p0, v2, v0, v1}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPControlsOverlay;->g(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPControlsOverlay;ZILjava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 13
    .line 14
    return-object p0
.end method

.method public static l(I)I
    .locals 0

    .line 1
    return p0
.end method

.method private final m(Lcom/clevertap/android/sdk/inapp/pipsdk/a;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->o()Lcom/clevertap/android/sdk/inapp/pipsdk/PIPMediaType;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/clevertap/android/sdk/inapp/pipsdk/PIPMediaType;->VIDEO:Lcom/clevertap/android/sdk/inapp/pipsdk/PIPMediaType;

    .line 6
    .line 7
    const/high16 v2, -0x1000000

    .line 8
    .line 9
    if-eq v0, v1, :cond_5

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->i()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-gtz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->f()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_5

    .line 22
    .line 23
    :cond_0
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->i()I

    .line 24
    .line 25
    .line 26
    move-result v0

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
    invoke-static {v0, v1}, Ll/xqf;->a(ILandroid/content/Context;)I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    int-to-float v0, v0

    .line 39
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->f()Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-eqz v1, :cond_1

    .line 44
    .line 45
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->g()I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    if-lez v1, :cond_1

    .line 50
    .line 51
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->g()I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 60
    .line 61
    .line 62
    invoke-static {v1, v3}, Ll/xqf;->a(ILandroid/content/Context;)I

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    goto :goto_0

    .line 67
    :cond_1
    const/4 v1, 0x0

    .line 68
    :goto_0
    new-instance v3, Landroid/graphics/drawable/GradientDrawable;

    .line 69
    .line 70
    invoke-direct {v3}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v3, v2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v3, v0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 77
    .line 78
    .line 79
    if-lez v1, :cond_2

    .line 80
    .line 81
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->e()I

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    invoke-virtual {v3, v1, p1}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 86
    .line 87
    .line 88
    :cond_2
    invoke-virtual {p0, v3}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 89
    .line 90
    .line 91
    if-lez v1, :cond_3

    .line 92
    .line 93
    invoke-virtual {p0, v1, v1, v1, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 94
    .line 95
    .line 96
    :cond_3
    const/4 p1, 0x0

    .line 97
    cmpl-float p1, v0, p1

    .line 98
    .line 99
    if-lez p1, :cond_4

    .line 100
    .line 101
    const/4 p1, 0x1

    .line 102
    invoke-virtual {p0, p1}, Landroid/view/View;->setClipToOutline(Z)V

    .line 103
    .line 104
    .line 105
    new-instance p1, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView$b;

    .line 106
    .line 107
    invoke-direct {p1, v0}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView$b;-><init>(F)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {p0, p1}, Landroid/view/View;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 111
    .line 112
    .line 113
    :cond_4
    return-void

    .line 114
    :cond_5
    sget-object p1, Landroid/view/ViewOutlineProvider;->BOUNDS:Landroid/view/ViewOutlineProvider;

    .line 115
    .line 116
    invoke-virtual {p0, p1}, Landroid/view/View;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {p0, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 120
    .line 121
    .line 122
    return-void
.end method

.method private final q(I)I
    .locals 2

    .line 1
    int-to-float p1, p1

    .line 2
    const v0, 0x3e3851ec    # 0.18f

    .line 3
    .line 4
    .line 5
    mul-float/2addr p1, v0

    .line 6
    float-to-int p1, p1

    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    const/16 v1, 0x18

    .line 15
    .line 16
    invoke-static {v1, v0}, Ll/xqf;->a(ILandroid/content/Context;)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 25
    .line 26
    .line 27
    const/16 v1, 0x28

    .line 28
    .line 29
    invoke-static {v1, p0}, Ll/xqf;->a(ILandroid/content/Context;)I

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    invoke-static {p1, v0, p0}, Lkotlin/ranges/a;->h(III)I

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    return p0
.end method

.method private final u(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;->l:Landroid/widget/ImageView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget-object v1, Ll/ma60;->INSTANCE:Ll/ma60;

    .line 6
    .line 7
    invoke-virtual {v1, p1}, Ll/ma60;->b(Z)I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;->l:Landroid/widget/ImageView;

    .line 15
    .line 16
    if-eqz p0, :cond_2

    .line 17
    .line 18
    if-eqz p0, :cond_1

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    sget-object v1, Ll/ma60;->INSTANCE:Ll/ma60;

    .line 27
    .line 28
    invoke-virtual {v1, p1}, Ll/ma60;->a(Z)I

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    goto :goto_0

    .line 37
    :cond_1
    const/4 p1, 0x0

    .line 38
    :goto_0
    invoke-virtual {p0, p1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 39
    .line 40
    .line 41
    :cond_2
    return-void
.end method

.method private final v(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;->j:Landroid/widget/ImageView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget-object v1, Ll/ma60;->INSTANCE:Ll/ma60;

    .line 6
    .line 7
    invoke-virtual {v1, p1}, Ll/ma60;->d(Z)I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;->j:Landroid/widget/ImageView;

    .line 15
    .line 16
    if-eqz p0, :cond_2

    .line 17
    .line 18
    if-eqz p0, :cond_1

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    sget-object v1, Ll/ma60;->INSTANCE:Ll/ma60;

    .line 27
    .line 28
    invoke-virtual {v1, p1}, Ll/ma60;->c(Z)I

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    goto :goto_0

    .line 37
    :cond_1
    const/4 p1, 0x0

    .line 38
    :goto_0
    invoke-virtual {p0, p1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 39
    .line 40
    .line 41
    :cond_2
    return-void
.end method


# virtual methods
.method public final getControlsOverlay$clevertap_core_release()Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPControlsOverlay;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;->g:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPControlsOverlay;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getGetSafeInsets()Lkotlin/jvm/functions/Function0;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlin/jvm/functions/Function0<",
            "Ll/svm;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;->n:Lkotlin/jvm/functions/Function0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getMediaView()Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;->a:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;

    .line 2
    .line 3
    return-object p0
.end method

.method public final n(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;)V
    .locals 4
    .param p1    # Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;->n()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;->j:Landroid/widget/ImageView;

    .line 12
    .line 13
    const/16 v1, 0x8

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    if-eqz v0, :cond_2

    .line 17
    .line 18
    iget-object v3, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;->b:Ll/dc60;

    .line 19
    .line 20
    invoke-virtual {v3}, Ll/dc60;->b()Lcom/clevertap/android/sdk/inapp/pipsdk/a;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    invoke-virtual {v3}, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->t()Z

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    if-eqz v3, :cond_1

    .line 29
    .line 30
    move v3, v2

    .line 31
    goto :goto_0

    .line 32
    :cond_1
    move v3, v1

    .line 33
    :goto_0
    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 34
    .line 35
    .line 36
    new-instance v3, Ll/o960;

    .line 37
    .line 38
    invoke-direct {v3, p1, p0}, Ll/o960;-><init>(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 42
    .line 43
    .line 44
    :cond_2
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;->m()Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    invoke-direct {p0, v0}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;->v(Z)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;->l:Landroid/widget/ImageView;

    .line 52
    .line 53
    if-eqz v0, :cond_4

    .line 54
    .line 55
    iget-object v3, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;->b:Ll/dc60;

    .line 56
    .line 57
    invoke-virtual {v3}, Ll/dc60;->b()Lcom/clevertap/android/sdk/inapp/pipsdk/a;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    invoke-virtual {v3}, Lcom/clevertap/android/sdk/inapp/pipsdk/a;->s()Z

    .line 62
    .line 63
    .line 64
    move-result v3

    .line 65
    if-eqz v3, :cond_3

    .line 66
    .line 67
    move v1, v2

    .line 68
    :cond_3
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 69
    .line 70
    .line 71
    new-instance v1, Ll/p960;

    .line 72
    .line 73
    invoke-direct {v1, p1, p0}, Ll/p960;-><init>(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 77
    .line 78
    .line 79
    :cond_4
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPMediaView;->l()Z

    .line 80
    .line 81
    .line 82
    move-result p1

    .line 83
    invoke-direct {p0, p1}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;->u(Z)V

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method public final o()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;->g:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPControlsOverlay;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPControlsOverlay;->c()V

    .line 4
    .line 5
    .line 6
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
    if-eqz v0, :cond_1

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
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;->h:Ll/ca60;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Ll/ca60;->d(Landroid/view/MotionEvent;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0

    .line 22
    :cond_1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;->h:Ll/ca60;

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Ll/ca60;->b(Landroid/view/MotionEvent;)V

    .line 25
    .line 26
    .line 27
    return v1
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
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
    if-nez v0, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    return p0

    .line 12
    :cond_0
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;->h:Ll/ca60;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ll/ca60;->c(Landroid/view/MotionEvent;)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public final p()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;->j:Landroid/widget/ImageView;

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;->j:Landroid/widget/ImageView;

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 16
    .line 17
    .line 18
    :cond_1
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;->l:Landroid/widget/ImageView;

    .line 19
    .line 20
    if-eqz v0, :cond_2

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 23
    .line 24
    .line 25
    :cond_2
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;->l:Landroid/widget/ImageView;

    .line 26
    .line 27
    if-eqz p0, :cond_3

    .line 28
    .line 29
    invoke-virtual {p0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 30
    .line 31
    .line 32
    :cond_3
    return-void
.end method

.method public final r(Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;->u(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final s(Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;->v(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final setGetSafeInsets(Lkotlin/jvm/functions/Function0;)V
    .locals 0
    .param p1    # Lkotlin/jvm/functions/Function0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/jvm/functions/Function0<",
            "Ll/svm;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;->n:Lkotlin/jvm/functions/Function0;

    .line 5
    .line 6
    return-void
.end method

.method public final t(I)V
    .locals 4

    .line 1
    invoke-direct {p0, p1}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;->q(I)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;->k:Landroid/widget/ImageView;

    .line 6
    .line 7
    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;->i:Landroid/widget/ImageView;

    .line 8
    .line 9
    iget-object v2, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;->l:Landroid/widget/ImageView;

    .line 10
    .line 11
    iget-object v3, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;->m:Landroid/widget/ImageView;

    .line 12
    .line 13
    filled-new-array {v0, v1, v2, v3}, [Landroid/widget/ImageView;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->listOfNotNull([Ljava/lang/Object;)Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Ljava/lang/Iterable;

    .line 22
    .line 23
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-eqz v1, :cond_0

    .line 32
    .line 33
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    check-cast v1, Landroid/widget/ImageView;

    .line 38
    .line 39
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    iput p1, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 44
    .line 45
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    iput p1, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_0
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;->j:Landroid/widget/ImageView;

    .line 53
    .line 54
    if-eqz p0, :cond_1

    .line 55
    .line 56
    int-to-float p1, p1

    .line 57
    const/high16 v0, 0x3f800000    # 1.0f

    .line 58
    .line 59
    mul-float/2addr p1, v0

    .line 60
    float-to-int p1, p1

    .line 61
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 66
    .line 67
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    iput p1, p0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 72
    .line 73
    :cond_1
    return-void
.end method
