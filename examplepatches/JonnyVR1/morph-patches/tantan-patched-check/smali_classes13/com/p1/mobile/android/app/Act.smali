.class public abstract Lcom/p1/mobile/android/app/Act;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "SourceFile"

# interfaces
.implements Ll/ner;
.implements Ll/r1e;
.implements Ll/e3m;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/android/app/Act$v;,
        Lcom/p1/mobile/android/app/Act$r;,
        Lcom/p1/mobile/android/app/Act$w;,
        Lcom/p1/mobile/android/app/Act$t;,
        Lcom/p1/mobile/android/app/Act$PickMediaError;,
        Lcom/p1/mobile/android/app/Act$u;,
        Lcom/p1/mobile/android/app/Act$s;
    }
.end annotation


# static fields
.field public static ACTION0_NOTHING:Ll/x20; = null

.field public static final CROP_IMAGE:I = 0x6000

.field public static final DEBUG_LIFECYCLE:Z = false

.field public static EMPTY_ON_ERROR:Ll/y20; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation
.end field

.field public static final FRAGMENTS_TAG:Ljava/lang/String; = "android:fragments"

.field protected static final PICK_IMAGE:I = 0x2000

.field protected static final PICK_IMAGES:I = 0x1000

.field static final PICK_VIDEO:I = 0x3000

.field static final RECORD_VIDEO:I = 0x5000

.field private static final STAT_GLOBAL_STATE:Ljava/lang/String; = ".global_state"

.field public static final STOP_CHECK_DELAY:J = 0x3e8L

.field public static final STUB_SAVED_INSTANCE_STATE:Ljava/lang/String; = "tanker_savedInstanceState"

.field public static final SUPPORT_FRAGMENTS_TAG:Ljava/lang/String; = "android:support:fragments"

.field protected static final SWIPE_BACK_SUPPORTED:Z = true

.field private static final TAG:Ljava/lang/String; = "Act"

.field public static final TAKE_PICTURE:I = 0x4000

.field public static TOOLBAR_MENU_VIEW_FILED:Ljava/lang/reflect/Field; = null

.field public static TOOLBAR_NAV_BUTTON_VIEW_FIELD:Ljava/lang/reflect/Field; = null

.field public static TOOLBAR_TITLE_VIEW_FILED:Ljava/lang/reflect/Field; = null

.field private static activityCount:I = 0x0

.field private static acts:Ljava/util/HashMap; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/android/app/Act$r;",
            ">;>;"
        }
    .end annotation
.end field

.field private static backgroundCheckHandler:Landroid/os/Handler; = null

.field public static debugShowMenu:Z = false

.field private static foreground:Lcom/p1/mobile/android/app/Act$r; = null

.field private static foregroundStatusUpdated:Z = false

.field private static frontBs:Lrx/subjects/b; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private static globalLifecycleSubject:Lrx/subjects/a; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public static isActResumed:Z = false

.field public static isFromBackStack:Z = false

.field public static isFromBackground:Z = false

.field public static isFromDestoryed:Z = false

.field public static isInit:Z = true

.field private static lmdResult:Z

.field private static mediaCaptureBs:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static savedKeyboardHeight:Ll/vxd0;

.field private static sensorManager:Landroid/hardware/SensorManager;

.field private static sensors:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/android/app/Act$u;",
            ">;"
        }
    .end annotation
.end field

.field private static sessionCount:I

.field private static startTime:J

.field private static stopTime:J

.field public static tempFileName:Ljava/lang/String;

.field static tempQueue:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Lcom/p1/mobile/android/app/Act$v;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public act:Lcom/p1/mobile/android/app/Act;

.field actionBarColor:I

.field private actionMenuView:Landroidx/appcompat/widget/ActionMenuView;

.field private activityReslutManager:Lcom/p1/mobile/android/app/a;

.field public callOnRestoreInstanceState:Z

.field public centralFilter:Landroid/widget/TextView;

.field public centralLayout:Landroid/widget/LinearLayout;

.field public centralTitle:Landroid/widget/TextView;

.field currentTransAnim:Landroid/animation/Animator;

.field finishingByAnimation:Z

.field public hackCenterTitle:Z

.field hasBlockOnCreate:Z

.field hasBlockOnResume:Z

.field hasBlockOnStart:Z

.field private isSetUpKeyboardDetectorLayout:Z

.field private lastItemSelectedTime:J

.field private final lifecycleSubject:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/android/app/c;",
            ">;"
        }
    .end annotation
.end field

.field public originalTitle:Landroid/widget/TextView;

.field partTransition:Ll/s20$a;

.field private final popLifeSub:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/vk80;",
            ">;"
        }
    .end annotation
.end field

.field protected progressDialog:Landroid/app/Dialog;

.field public res:Landroid/content/res/Resources;

.field public savedInstanceStateCache:Landroid/os/Bundle;

.field public screenHeight:I

.field public screenWidth:I

.field private showingDialogList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/ref/WeakReference<",
            "Landroid/app/Dialog;",
            ">;>;"
        }
    .end annotation
.end field

.field public specialFilter:Landroid/widget/TextView;

.field public specialLayout:Landroid/widget/LinearLayout;

.field public specialTitle:Landroid/widget/TextView;

.field private swipeBack:Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

.field trans:Lcom/p1/mobile/android/app/Act$v;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    new-instance v0, Ll/e10;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/e10;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/android/app/Act;->EMPTY_ON_ERROR:Ll/y20;

    .line 7
    .line 8
    new-instance v0, Ll/p10;

    .line 9
    .line 10
    invoke-direct {v0}, Ll/p10;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/android/app/Act;->ACTION0_NOTHING:Ll/x20;

    .line 14
    .line 15
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sput-object v0, Lcom/p1/mobile/android/app/Act;->frontBs:Lrx/subjects/b;

    .line 20
    .line 21
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    sput-object v0, Lcom/p1/mobile/android/app/Act;->mediaCaptureBs:Lrx/subjects/b;

    .line 26
    .line 27
    const/4 v0, 0x0

    .line 28
    sput v0, Lcom/p1/mobile/android/app/Act;->activityCount:I

    .line 29
    .line 30
    sput-boolean v0, Lcom/p1/mobile/android/app/Act;->foregroundStatusUpdated:Z

    .line 31
    .line 32
    const/4 v1, 0x0

    .line 33
    sput-object v1, Lcom/p1/mobile/android/app/Act;->foreground:Lcom/p1/mobile/android/app/Act$r;

    .line 34
    .line 35
    new-instance v2, Ljava/util/HashMap;

    .line 36
    .line 37
    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 38
    .line 39
    .line 40
    sput-object v2, Lcom/p1/mobile/android/app/Act;->acts:Ljava/util/HashMap;

    .line 41
    .line 42
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    sput-object v2, Lcom/p1/mobile/android/app/Act;->globalLifecycleSubject:Lrx/subjects/a;

    .line 47
    .line 48
    sput v0, Lcom/p1/mobile/android/app/Act;->sessionCount:I

    .line 49
    .line 50
    new-instance v2, Lcom/p1/mobile/android/app/Act$i;

    .line 51
    .line 52
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    invoke-direct {v2, v3}, Lcom/p1/mobile/android/app/Act$i;-><init>(Landroid/os/Looper;)V

    .line 57
    .line 58
    .line 59
    sput-object v2, Lcom/p1/mobile/android/app/Act;->backgroundCheckHandler:Landroid/os/Handler;

    .line 60
    .line 61
    const-class v2, Landroidx/appcompat/widget/Toolbar;

    .line 62
    .line 63
    invoke-static {v2}, Lorg/joor/Reflect;->on(Ljava/lang/Class;)Lorg/joor/Reflect;

    .line 64
    .line 65
    .line 66
    move-result-object v3

    .line 67
    const-string v4, "mNavButtonView"

    .line 68
    .line 69
    invoke-virtual {v3, v4}, Lorg/joor/Reflect;->field0(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    sput-object v3, Lcom/p1/mobile/android/app/Act;->TOOLBAR_NAV_BUTTON_VIEW_FIELD:Ljava/lang/reflect/Field;

    .line 74
    .line 75
    invoke-static {v2}, Lorg/joor/Reflect;->on(Ljava/lang/Class;)Lorg/joor/Reflect;

    .line 76
    .line 77
    .line 78
    move-result-object v3

    .line 79
    const-string v4, "mTitleTextView"

    .line 80
    .line 81
    invoke-virtual {v3, v4}, Lorg/joor/Reflect;->field0(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 82
    .line 83
    .line 84
    move-result-object v3

    .line 85
    sput-object v3, Lcom/p1/mobile/android/app/Act;->TOOLBAR_TITLE_VIEW_FILED:Ljava/lang/reflect/Field;

    .line 86
    .line 87
    invoke-static {v2}, Lorg/joor/Reflect;->on(Ljava/lang/Class;)Lorg/joor/Reflect;

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    const-string v3, "mMenuView"

    .line 92
    .line 93
    invoke-virtual {v2, v3}, Lorg/joor/Reflect;->field0(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    sput-object v2, Lcom/p1/mobile/android/app/Act;->TOOLBAR_MENU_VIEW_FILED:Ljava/lang/reflect/Field;

    .line 98
    .line 99
    new-instance v2, Ll/vxd0;

    .line 100
    .line 101
    const/high16 v3, 0x435c0000    # 220.0f

    .line 102
    .line 103
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 104
    .line 105
    .line 106
    move-result v3

    .line 107
    const-string v4, "keyboard_height"

    .line 108
    .line 109
    invoke-direct {v2, v4, v3}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 110
    .line 111
    .line 112
    sput-object v2, Lcom/p1/mobile/android/app/Act;->savedKeyboardHeight:Ll/vxd0;

    .line 113
    .line 114
    sput-object v1, Lcom/p1/mobile/android/app/Act;->tempFileName:Ljava/lang/String;

    .line 115
    .line 116
    new-instance v1, Ljava/util/LinkedList;

    .line 117
    .line 118
    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    .line 119
    .line 120
    .line 121
    sput-object v1, Lcom/p1/mobile/android/app/Act;->tempQueue:Ljava/util/LinkedList;

    .line 122
    .line 123
    sput-boolean v0, Lcom/p1/mobile/android/app/Act;->lmdResult:Z

    .line 124
    .line 125
    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/p1/mobile/android/app/Act;->lifecycleSubject:Lrx/subjects/a;

    .line 9
    .line 10
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lcom/p1/mobile/android/app/Act;->popLifeSub:Lrx/subjects/a;

    .line 15
    .line 16
    iput-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    invoke-static {}, Ll/af60;->e()Ll/af60;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0, p0}, Ll/af60;->b(Landroid/app/Activity;)V

    .line 23
    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    iput-boolean v0, p0, Lcom/p1/mobile/android/app/Act;->hackCenterTitle:Z

    .line 27
    .line 28
    const/4 v1, 0x0

    .line 29
    iput-object v1, p0, Lcom/p1/mobile/android/app/Act;->centralTitle:Landroid/widget/TextView;

    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/android/app/Act;->originalTitle:Landroid/widget/TextView;

    .line 32
    .line 33
    iput-object v1, p0, Lcom/p1/mobile/android/app/Act;->specialTitle:Landroid/widget/TextView;

    .line 34
    .line 35
    iput-object v1, p0, Lcom/p1/mobile/android/app/Act;->centralLayout:Landroid/widget/LinearLayout;

    .line 36
    .line 37
    iput-object v1, p0, Lcom/p1/mobile/android/app/Act;->specialLayout:Landroid/widget/LinearLayout;

    .line 38
    .line 39
    iput-object v1, p0, Lcom/p1/mobile/android/app/Act;->centralFilter:Landroid/widget/TextView;

    .line 40
    .line 41
    iput-object v1, p0, Lcom/p1/mobile/android/app/Act;->specialFilter:Landroid/widget/TextView;

    .line 42
    .line 43
    new-instance v2, Lcom/p1/mobile/android/app/a;

    .line 44
    .line 45
    invoke-direct {v2}, Lcom/p1/mobile/android/app/a;-><init>()V

    .line 46
    .line 47
    .line 48
    iput-object v2, p0, Lcom/p1/mobile/android/app/Act;->activityReslutManager:Lcom/p1/mobile/android/app/a;

    .line 49
    .line 50
    iput v0, p0, Lcom/p1/mobile/android/app/Act;->actionBarColor:I

    .line 51
    .line 52
    iput-object v1, p0, Lcom/p1/mobile/android/app/Act;->trans:Lcom/p1/mobile/android/app/Act$v;

    .line 53
    .line 54
    iput-object v1, p0, Lcom/p1/mobile/android/app/Act;->currentTransAnim:Landroid/animation/Animator;

    .line 55
    .line 56
    iput-boolean v0, p0, Lcom/p1/mobile/android/app/Act;->finishingByAnimation:Z

    .line 57
    .line 58
    return-void
.end method

.method public static bridge synthetic B1()V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->changeGlobalLifecycleStates()V

    return-void
.end method

.method public static bridge synthetic C1()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->lmdResultMoved()Z

    move-result v0

    return v0
.end method

.method public static synthetic H0(Landroid/app/Dialog;Ljava/lang/ref/WeakReference;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-ne p1, p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public static synthetic I0(Landroid/view/View;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    instance-of p0, p0, Landroidx/appcompat/view/menu/ActionMenuItemView;

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic J0(Lrx/c;)Lrx/c;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic K0([Z[IZLandroid/view/ViewGroup$LayoutParams;Landroid/widget/FrameLayout;Landroid/view/View;Landroid/view/View;Ll/dgq0;)Ll/dgq0;
    .locals 4

    .line 1
    invoke-static {}, Ll/dgq0$l;->b()I

    .line 2
    .line 3
    .line 4
    move-result p6

    .line 5
    invoke-virtual {p7, p6}, Ll/dgq0;->p(I)Z

    .line 6
    .line 7
    .line 8
    move-result p6

    .line 9
    invoke-static {}, Ll/dgq0$l;->b()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    invoke-virtual {p7, v0}, Ll/dgq0;->f(I)Ll/svm;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget v0, v0, Ll/svm;->d:I

    .line 18
    .line 19
    invoke-static {}, Ll/dgq0$l;->d()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    invoke-virtual {p7, v1}, Ll/dgq0;->f(I)Ll/svm;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    iget v1, v1, Ll/svm;->d:I

    .line 28
    .line 29
    const/4 v2, 0x0

    .line 30
    aget-boolean v3, p0, v2

    .line 31
    .line 32
    if-ne p6, v3, :cond_1

    .line 33
    .line 34
    aget v3, p1, v2

    .line 35
    .line 36
    if-eq v3, v0, :cond_0

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    return-object p7

    .line 40
    :cond_1
    :goto_0
    aput v0, p1, v2

    .line 41
    .line 42
    aput-boolean p6, p0, v2

    .line 43
    .line 44
    if-eqz p2, :cond_2

    .line 45
    .line 46
    move p0, v2

    .line 47
    goto :goto_1

    .line 48
    :cond_2
    invoke-static {}, Ll/dgq0$l;->e()I

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    invoke-virtual {p7, p0}, Ll/dgq0;->f(I)Ll/svm;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    iget p0, p0, Ll/svm;->b:I

    .line 57
    .line 58
    :goto_1
    if-eqz p6, :cond_3

    .line 59
    .line 60
    invoke-virtual {p4}, Landroid/view/View;->getMeasuredHeight()I

    .line 61
    .line 62
    .line 63
    move-result p2

    .line 64
    aget p1, p1, v2

    .line 65
    .line 66
    sub-int/2addr p2, p1

    .line 67
    sub-int/2addr p2, p0

    .line 68
    iput p2, p3, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 69
    .line 70
    goto :goto_2

    .line 71
    :cond_3
    invoke-virtual {p4}, Landroid/view/View;->getMeasuredHeight()I

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    sub-int/2addr p1, p0

    .line 76
    sub-int/2addr p1, v1

    .line 77
    iput p1, p3, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 78
    .line 79
    :goto_2
    invoke-virtual {p5, p3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 80
    .line 81
    .line 82
    return-object p7
.end method

.method public static synthetic L0(Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic N0(Ll/z20;Ljava/lang/Boolean;Ljava/lang/Integer;Ljava/lang/Boolean;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1, p2}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic O0(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/android/app/Act;->lambda$debugItems$19()V

    return-void
.end method

.method public static synthetic P0(Lcom/p1/mobile/android/app/Act;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/android/app/Act;->lambda$pendChangeActionButtonTypeface$13()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic Q0(Ll/y20;Ll/x20;Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    instance-of v0, p2, Lcom/p1/mobile/android/app/c$a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p2, Lcom/p1/mobile/android/app/c$a;

    .line 6
    .line 7
    iget-object p1, p2, Lcom/p1/mobile/android/app/c$c;->p:Landroid/os/Bundle;

    .line 8
    .line 9
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    sget-object p0, Lcom/p1/mobile/android/app/c;->m:Lcom/p1/mobile/android/app/c;

    .line 14
    .line 15
    if-ne p2, p0, :cond_1

    .line 16
    .line 17
    invoke-interface {p1}, Ll/x20;->call()V

    .line 18
    .line 19
    .line 20
    :cond_1
    return-void
.end method

.method public static synthetic R0(Landroid/view/View;Ll/gcg0;)V
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/android/app/Act$a;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/p1/mobile/android/app/Act$a;-><init>(Landroid/view/View;Ll/gcg0;)V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/y10;

    .line 7
    .line 8
    invoke-direct {v1, p0, v0}, Ll/y10;-><init>(Landroid/view/View;Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 9
    .line 10
    .line 11
    invoke-static {v1}, Ll/pcg0;->a(Ll/x20;)Ll/kcg0;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {p1, v1}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0, v0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static synthetic S0(Ll/pf60;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Ljava/lang/String;

    .line 4
    .line 5
    return-object p0
.end method

.method public static synthetic T0(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/android/app/Act;->lambda$finish$29()V

    return-void
.end method

.method public static synthetic U0(Lrx/c;)Lrx/c;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic V0()V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->lmdEnd()Z

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic W0(Landroid/view/View;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic X0(Ll/x20;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic Y0()V
    .locals 0

    .line 1
    invoke-static {}, Ljava/lang/System;->gc()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a1(Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 0

    .line 1
    new-instance p0, Ll/vxd0;

    .line 2
    .line 3
    invoke-interface {p3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const/4 p2, 0x0

    .line 8
    invoke-direct {p0, p1, p2}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/vxd0;->clear()Z

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private actualFinish()V
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/Act;->acts:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/4 v1, 0x0

    .line 12
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    if-eqz v2, :cond_2

    .line 17
    .line 18
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    check-cast v2, Ljava/util/ArrayList;

    .line 23
    .line 24
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    :cond_1
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    if-eqz v3, :cond_0

    .line 33
    .line 34
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    check-cast v3, Lcom/p1/mobile/android/app/Act$r;

    .line 39
    .line 40
    iget-object v4, v3, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 41
    .line 42
    invoke-virtual {v4}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v4

    .line 46
    if-ne v4, p0, :cond_1

    .line 47
    .line 48
    const/4 v1, 0x1

    .line 49
    iput-boolean v1, v3, Lcom/p1/mobile/android/app/Act$r;->d:Z

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_2
    invoke-super {p0}, Landroid/app/Activity;->isFinishing()Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-nez v0, :cond_3

    .line 57
    .line 58
    invoke-super {p0}, Landroid/app/Activity;->finish()V

    .line 59
    .line 60
    .line 61
    :cond_3
    if-eqz v1, :cond_4

    .line 62
    .line 63
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->changeGlobalLifecycleStates()V

    .line 64
    .line 65
    .line 66
    :cond_4
    sget-boolean v0, Lcom/p1/mobile/android/app/Act;->SWIPE_BACK_SUPPORTED:Z

    .line 67
    .line 68
    if-eqz v0, :cond_5

    .line 69
    .line 70
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->swipeBack:Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 71
    .line 72
    if-eqz p0, :cond_5

    .line 73
    .line 74
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->x()V

    .line 75
    .line 76
    .line 77
    :cond_5
    return-void
.end method

.method private canResolveTargetPackage(Landroid/content/Intent;)Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, p1, v0}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    if-lez p0, :cond_0

    .line 17
    .line 18
    const/4 p0, 0x1

    .line 19
    return p0

    .line 20
    :cond_0
    return v0
.end method

.method private static changeGlobalLifecycleStates()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    sput-boolean v0, Lcom/p1/mobile/android/app/Act;->foregroundStatusUpdated:Z

    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/android/app/Act;->foreground:Lcom/p1/mobile/android/app/Act$r;

    .line 5
    .line 6
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->tryUpdateForegroundStatus()V

    .line 7
    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    sget-object v1, Lcom/p1/mobile/android/app/Act;->foreground:Lcom/p1/mobile/android/app/Act$r;

    .line 12
    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    if-eqz v0, :cond_1

    .line 17
    .line 18
    sget-object v1, Lcom/p1/mobile/android/app/Act;->foreground:Lcom/p1/mobile/android/app/Act$r;

    .line 19
    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    sget-object v1, Lcom/p1/mobile/android/app/Act;->foreground:Lcom/p1/mobile/android/app/Act$r;

    .line 29
    .line 30
    iget-object v1, v1, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 31
    .line 32
    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    if-ne v0, v1, :cond_1

    .line 37
    .line 38
    :goto_0
    return-void

    .line 39
    :cond_1
    sget-object v0, Lcom/p1/mobile/android/app/Act;->globalLifecycleSubject:Lrx/subjects/a;

    .line 40
    .line 41
    sget-object v1, Ll/uxj0;->a:Ll/uxj0;

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public static synthetic d1(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p0, "e_debug_tool_search"

    .line 2
    .line 3
    const-string v0, "p_debug_tool_dialog_view"

    .line 4
    .line 5
    invoke-static {p0, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private debugColorAllViews()V
    .locals 2

    const v0, 0x1020002

    .line 62
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x0

    .line 63
    invoke-direct {p0, v0, v1}, Lcom/p1/mobile/android/app/Act;->debugColorAllViews(Landroid/view/View;I)V

    return-void
.end method

.method private debugColorAllViews(Landroid/view/View;I)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Ll/gkc0;->a:Ljava/util/Random;

    .line 8
    .line 9
    const/16 v1, 0xff

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/util/Random;->nextInt(I)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    sget-object v2, Ll/gkc0;->a:Ljava/util/Random;

    .line 16
    .line 17
    invoke-virtual {v2, v1}, Ljava/util/Random;->nextInt(I)I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    sget-object v3, Ll/gkc0;->a:Ljava/util/Random;

    .line 22
    .line 23
    invoke-virtual {v3, v1}, Ljava/util/Random;->nextInt(I)I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    const/16 v3, 0x14

    .line 28
    .line 29
    invoke-static {v3, v0, v2, v1}, Landroid/graphics/Color;->argb(IIII)I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 34
    .line 35
    .line 36
    :cond_0
    instance-of v0, p1, Landroid/view/ViewGroup;

    .line 37
    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    check-cast p1, Landroid/view/ViewGroup;

    .line 41
    .line 42
    const/4 v0, 0x0

    .line 43
    :goto_0
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-ge v0, v1, :cond_1

    .line 48
    .line 49
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    add-int/lit8 v2, p2, 0x1

    .line 54
    .line 55
    invoke-direct {p0, v1, v2}, Lcom/p1/mobile/android/app/Act;->debugColorAllViews(Landroid/view/View;I)V

    .line 56
    .line 57
    .line 58
    add-int/lit8 v0, v0, 0x1

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_1
    return-void
.end method

.method public static defaultOnHomePressed(Landroid/app/Activity;)V
    .locals 3

    .line 1
    :try_start_0
    invoke-static {p0}, Ll/cf20;->e(Landroid/app/Activity;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    .line 4
    return-void

    .line 5
    :catch_0
    :try_start_1
    invoke-virtual {p0}, Landroid/app/Activity;->onBackPressed()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 6
    .line 7
    .line 8
    goto :goto_0

    .line 9
    :catch_1
    move-exception p0

    .line 10
    new-instance v0, Ljava/lang/Exception;

    .line 11
    .line 12
    new-instance v1, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    const-string v2, "defaultOnHomePressed:"

    .line 15
    .line 16
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-direct {v0, v1, p0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 31
    .line 32
    .line 33
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 34
    .line 35
    .line 36
    :goto_0
    return-void
.end method

.method public static synthetic f1(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/android/app/Act;->lambda$finish$30()V

    return-void
.end method

.method private fixOrientation()Z
    .locals 2

    .line 1
    :try_start_0
    const-string v0, "android.app.Activity"

    .line 2
    .line 3
    invoke-static {v0}, Lorg/joor/Reflect;->on(Ljava/lang/String;)Lorg/joor/Reflect;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "mActivityInfo"

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lorg/joor/Reflect;->field0(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Landroid/content/pm/ActivityInfo;

    .line 18
    .line 19
    const/4 v0, -0x1

    .line 20
    iput v0, p0, Landroid/content/pm/ActivityInfo;->screenOrientation:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 21
    .line 22
    const/4 p0, 0x1

    .line 23
    return p0

    .line 24
    :catch_0
    move-exception p0

    .line 25
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 26
    .line 27
    .line 28
    const/4 p0, 0x0

    .line 29
    return p0
.end method

.method private fixSavedInstanceState(Landroid/os/Bundle;)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_1

    .line 4
    :cond_0
    :try_start_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 5
    .line 6
    const/16 v1, 0x1d

    .line 7
    .line 8
    if-eq v0, v1, :cond_1

    .line 9
    .line 10
    const/16 v1, 0x1e

    .line 11
    .line 12
    if-ne v0, v1, :cond_3

    .line 13
    .line 14
    :cond_1
    invoke-virtual {p0}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->setClassLoader(Ljava/lang/ClassLoader;)V

    .line 19
    .line 20
    .line 21
    const-string v0, "androidx.lifecycle.BundlableSavedStateRegistry.key"

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    if-eqz p1, :cond_3

    .line 28
    .line 29
    invoke-virtual {p1}, Landroid/os/BaseBundle;->keySet()Ljava/util/Set;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    :cond_2
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_3

    .line 42
    .line 43
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    check-cast v1, Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {p1, v1}, Landroid/os/BaseBundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    instance-of v2, v1, Landroid/os/Bundle;

    .line 54
    .line 55
    if-eqz v2, :cond_2

    .line 56
    .line 57
    check-cast v1, Landroid/os/Bundle;

    .line 58
    .line 59
    invoke-virtual {p0}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    invoke-virtual {v1, v2}, Landroid/os/Bundle;->setClassLoader(Ljava/lang/ClassLoader;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 64
    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_3
    :goto_1
    return-void

    .line 68
    :catchall_0
    move-exception p0

    .line 69
    new-instance p1, Ljava/lang/RuntimeException;

    .line 70
    .line 71
    const-string v0, "try fix SavedInstanceState"

    .line 72
    .line 73
    invoke-direct {p1, v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 74
    .line 75
    .line 76
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public static foreground()Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/android/app/Act$r;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/Act;->globalLifecycleSubject:Lrx/subjects/a;

    .line 2
    .line 3
    new-instance v1, Ll/z10;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/z10;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v1, Ll/b20;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/b20;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1}, Lrx/c;->distinctUntilChanged(Ll/qcj;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    return-object v0
.end method

.method public static foreground_()Lcom/p1/mobile/android/app/Act$r;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/Act;->foreground:Lcom/p1/mobile/android/app/Act$r;

    .line 2
    .line 3
    return-object v0
.end method

.method public static front()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/Act;->frontBs:Lrx/subjects/b;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lrx/c;->asObservable()Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    return-object v0
.end method

.method public static globalLifeCycle_()Ljava/util/HashMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/android/app/Act$r;",
            ">;>;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/Act;->acts:Ljava/util/HashMap;

    .line 2
    .line 3
    return-object v0
.end method

.method public static globalLifecycle()Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/android/app/Act$r;",
            ">;>;>;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/Act;->globalLifecycleSubject:Lrx/subjects/a;

    .line 2
    .line 3
    new-instance v1, Ll/g20;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/g20;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    return-object v0
.end method

.method public static synthetic h1(Lcom/p1/mobile/android/app/Act$r;)Landroid/app/Activity;
    .locals 0

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Landroid/app/Activity;

    .line 12
    .line 13
    return-object p0
.end method

.method private hideInput(I)V
    .locals 2

    .line 1
    :try_start_0
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p1}, Landroid/view/Window;->getCurrentFocus()Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    const/4 v0, 0x0

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    invoke-direct {p0}, Lcom/p1/mobile/android/app/Act;->imm()Landroid/view/inputmethod/InputMethodManager;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v1}, Landroid/view/Window;->getCurrentFocus()Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v1}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {p1, v1, v0}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :catch_0
    move-exception p1

    .line 40
    goto :goto_0

    .line 41
    :cond_0
    invoke-direct {p0}, Lcom/p1/mobile/android/app/Act;->imm()Landroid/view/inputmethod/InputMethodManager;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-virtual {v1}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {p1, v1, v0}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :goto_0
    new-instance v0, Ljava/lang/Exception;

    .line 62
    .line 63
    new-instance v1, Ljava/lang/StringBuilder;

    .line 64
    .line 65
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    const-string p0, " hideInput "

    .line 80
    .line 81
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-direct {v0, p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 96
    .line 97
    .line 98
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 99
    .line 100
    .line 101
    return-void
.end method

.method private imm()Landroid/view/inputmethod/InputMethodManager;
    .locals 1

    .line 1
    const-string v0, "input_method"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/view/inputmethod/InputMethodManager;

    .line 8
    .line 9
    return-object p0
.end method

.method public static isAppVisible()Z
    .locals 4

    .line 1
    sget-wide v0, Lcom/p1/mobile/android/app/Act;->startTime:J

    .line 2
    .line 3
    sget-wide v2, Lcom/p1/mobile/android/app/Act;->stopTime:J

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    return v0

    .line 11
    :cond_0
    const/4 v0, 0x0

    .line 12
    return v0
.end method

.method private isSpecificRecordVideo()Z
    .locals 4

    .line 1
    sget-object p0, Landroid/os/Build;->BRAND:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "Xiaomi"

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    const-string v1, "MI 8 SE"

    .line 12
    .line 13
    sget-object v2, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-nez v1, :cond_3

    .line 20
    .line 21
    :cond_0
    const-string v1, "vivo"

    .line 22
    .line 23
    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-eqz v2, :cond_1

    .line 28
    .line 29
    const-string v2, "vivo NEX S"

    .line 30
    .line 31
    sget-object v3, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    if-nez v2, :cond_3

    .line 38
    .line 39
    :cond_1
    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-eqz v1, :cond_2

    .line 44
    .line 45
    const-string v1, "V1809A"

    .line 46
    .line 47
    sget-object v2, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-nez v1, :cond_3

    .line 54
    .line 55
    :cond_2
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    if-eqz p0, :cond_4

    .line 60
    .line 61
    const-string p0, "MI 8"

    .line 62
    .line 63
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 64
    .line 65
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    if-eqz p0, :cond_4

    .line 70
    .line 71
    :cond_3
    const/4 p0, 0x1

    .line 72
    return p0

    .line 73
    :cond_4
    const/4 p0, 0x0

    .line 74
    return p0
.end method

.method private isTranslucentOrFloating()Z
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    const-string v1, "com.android.internal.R$styleable"

    .line 3
    .line 4
    invoke-static {v1}, Lorg/joor/Reflect;->on(Ljava/lang/String;)Lorg/joor/Reflect;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    const-string v2, "Window"

    .line 9
    .line 10
    invoke-virtual {v1, v2}, Lorg/joor/Reflect;->field0(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    const/4 v2, 0x0

    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, [I

    .line 20
    .line 21
    invoke-virtual {p0, v1}, Landroid/content/Context;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const-string v1, "android.content.pm.ActivityInfo"

    .line 26
    .line 27
    invoke-static {v1}, Lorg/joor/Reflect;->on(Ljava/lang/String;)Lorg/joor/Reflect;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    const-string v2, "isTranslucentOrFloating"

    .line 32
    .line 33
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    invoke-virtual {v1, v2, v3}, Lorg/joor/Reflect;->call(Ljava/lang/String;[Ljava/lang/Object;)Lorg/joor/Reflect;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v1}, Lorg/joor/Reflect;->get()Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    check-cast v1, Ljava/lang/Boolean;

    .line 46
    .line 47
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    invoke-virtual {p0}, Landroid/content/res/TypedArray;->recycle()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 52
    .line 53
    .line 54
    return v0

    .line 55
    :catch_0
    move-exception p0

    .line 56
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 57
    .line 58
    .line 59
    return v0
.end method

.method private isUnspecifiedState()Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    invoke-virtual {p0}, Landroid/app/Activity;->getComponentName()Landroid/content/ComponentName;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const/16 v2, 0x80

    .line 11
    .line 12
    invoke-virtual {v1, p0, v2}, Landroid/content/pm/PackageManager;->getActivityInfo(Landroid/content/ComponentName;I)Landroid/content/pm/ActivityInfo;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    iget p0, p0, Landroid/content/pm/ActivityInfo;->softInputMode:I
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    .line 18
    and-int/lit16 p0, p0, 0xf0

    .line 19
    .line 20
    if-nez p0, :cond_0

    .line 21
    .line 22
    const/4 p0, 0x1

    .line 23
    return p0

    .line 24
    :catch_0
    :cond_0
    return v0
.end method

.method public static synthetic j1(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/android/app/Act;->lambda$initDataOnCreate$14(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic k1(Ll/uxj0;)Lcom/p1/mobile/android/app/Act$r;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/android/app/Act;->foreground:Lcom/p1/mobile/android/app/Act$r;

    .line 2
    .line 3
    return-object p0
.end method

.method public static keyboardListenerObservable(Landroid/view/View;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            ")",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/l20;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/l20;-><init>(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static synthetic l1(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/android/app/Act;->lambda$onCreate$15(Landroid/view/View;)Z

    move-result p0

    return p0
.end method

.method private synthetic lambda$animateStatusAndActionBar$27(IIIILl/c30;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p6}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 2
    .line 3
    .line 4
    move-result p6

    .line 5
    invoke-static {p1, p2, p6}, Ll/ye5;->a(IIF)I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->setStatusBarColor(I)V

    .line 10
    .line 11
    .line 12
    invoke-static {p3, p4, p6}, Ll/ye5;->a(IIF)I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    new-instance p2, Landroid/graphics/drawable/ColorDrawable;

    .line 17
    .line 18
    invoke-direct {p2, p1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 19
    .line 20
    .line 21
    if-eqz p5, :cond_0

    .line 22
    .line 23
    invoke-virtual {p5, p2}, Ll/c30;->u(Landroid/graphics/drawable/Drawable;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    iput p3, p0, Lcom/p1/mobile/android/app/Act;->actionBarColor:I

    .line 27
    .line 28
    return-void
.end method

.method private synthetic lambda$debugItems$19()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic lambda$debugItems$21()V
    .locals 2

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    sget-object v1, Ll/hxd0;->debugNames:Ljava/util/HashSet;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Dialog$e;->e0(Ljava/util/List;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    new-instance v0, Ll/n10;

    .line 20
    .line 21
    invoke-direct {v0}, Ll/n10;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Dialog$e;->g0(Lcom/p1/mobile/android/app/Dialog$g;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method private synthetic lambda$finish$29()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/android/app/Act;->currentTransAnim:Landroid/animation/Animator;

    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finishStartWithAnim()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private synthetic lambda$finish$30()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/android/app/Act;->currentTransAnim:Landroid/animation/Animator;

    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finishPartStartWithAnim()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private synthetic lambda$initDataOnCreate$14(Lcom/p1/mobile/android/app/c;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne p1, v0, :cond_0

    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/android/app/Act;->popLifeSub:Lrx/subjects/a;

    .line 7
    .line 8
    sget-object v0, Lcom/p1/mobile/android/ui/poplevel/PopLifecycleEvent;->ACTIVE:Lcom/p1/mobile/android/ui/poplevel/PopLifecycleEvent;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->getPopLifeName()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-static {v0, v1, p0}, Ll/vk80;->a(Lcom/p1/mobile/android/ui/poplevel/PopLifecycleEvent;ZLjava/lang/String;)Ll/vk80;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p1, p0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    sget-object v0, Lcom/p1/mobile/android/app/c;->o:Lcom/p1/mobile/android/app/c;

    .line 23
    .line 24
    if-eq p1, v0, :cond_4

    .line 25
    .line 26
    sget-object v0, Lcom/p1/mobile/android/app/c;->m:Lcom/p1/mobile/android/app/c;

    .line 27
    .line 28
    if-ne p1, v0, :cond_1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    sget-object v0, Lcom/p1/mobile/android/app/c;->k:Lcom/p1/mobile/android/app/c;

    .line 32
    .line 33
    iget-object v2, p0, Lcom/p1/mobile/android/app/Act;->popLifeSub:Lrx/subjects/a;

    .line 34
    .line 35
    if-ne p1, v0, :cond_2

    .line 36
    .line 37
    sget-object p1, Lcom/p1/mobile/android/ui/poplevel/PopLifecycleEvent;->STOP:Lcom/p1/mobile/android/ui/poplevel/PopLifecycleEvent;

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->getPopLifeName()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-static {p1, v1, p0}, Ll/vk80;->a(Lcom/p1/mobile/android/ui/poplevel/PopLifecycleEvent;ZLjava/lang/String;)Ll/vk80;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {v2, p0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_2
    invoke-virtual {v2}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    if-nez p1, :cond_3

    .line 56
    .line 57
    iget-object p1, p0, Lcom/p1/mobile/android/app/Act;->popLifeSub:Lrx/subjects/a;

    .line 58
    .line 59
    sget-object v0, Lcom/p1/mobile/android/ui/poplevel/PopLifecycleEvent;->PENDING:Lcom/p1/mobile/android/ui/poplevel/PopLifecycleEvent;

    .line 60
    .line 61
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->getPopLifeName()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-static {v0, v1, p0}, Ll/vk80;->a(Lcom/p1/mobile/android/ui/poplevel/PopLifecycleEvent;ZLjava/lang/String;)Ll/vk80;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {p1, p0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 70
    .line 71
    .line 72
    :cond_3
    return-void

    .line 73
    :cond_4
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/android/app/Act;->popLifeSub:Lrx/subjects/a;

    .line 74
    .line 75
    sget-object v0, Lcom/p1/mobile/android/ui/poplevel/PopLifecycleEvent;->DESTROY:Lcom/p1/mobile/android/ui/poplevel/PopLifecycleEvent;

    .line 76
    .line 77
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->getPopLifeName()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    invoke-static {v0, v1, p0}, Ll/vk80;->a(Lcom/p1/mobile/android/ui/poplevel/PopLifecycleEvent;ZLjava/lang/String;)Ll/vk80;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    invoke-virtual {p1, p0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method private synthetic lambda$initPartTransitionPostCreate$32(Ljava/util/concurrent/atomic/AtomicBoolean;)Ljava/lang/Boolean;
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p1, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    .line 3
    .line 4
    .line 5
    move-result p1

    .line 6
    if-nez p1, :cond_5

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-nez p1, :cond_4

    .line 13
    .line 14
    iget-object p1, p0, Lcom/p1/mobile/android/app/Act;->partTransition:Ll/s20$a;

    .line 15
    .line 16
    if-nez p1, :cond_0

    .line 17
    .line 18
    goto :goto_1

    .line 19
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Ll/s20$a;->c(Lcom/p1/mobile/android/app/Act;)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    const/4 v0, 0x0

    .line 26
    if-nez p1, :cond_1

    .line 27
    .line 28
    move-object v1, v0

    .line 29
    goto :goto_0

    .line 30
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    :goto_0
    if-eqz p1, :cond_2

    .line 35
    .line 36
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 37
    .line 38
    .line 39
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->partTransition:Ll/s20$a;

    .line 40
    .line 41
    iget-object v2, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 42
    .line 43
    invoke-virtual {v0, v2}, Ll/s20$a;->f(Lcom/p1/mobile/android/app/Act;)Landroid/animation/Animator;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    if-eqz v0, :cond_3

    .line 48
    .line 49
    new-instance v2, Lcom/p1/mobile/android/app/Act$e;

    .line 50
    .line 51
    invoke-direct {v2, p0, p1, v1}, Lcom/p1/mobile/android/app/Act$e;-><init>(Lcom/p1/mobile/android/app/Act;Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0, v2}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 58
    .line 59
    .line 60
    iput-object v0, p0, Lcom/p1/mobile/android/app/Act;->currentTransAnim:Landroid/animation/Animator;

    .line 61
    .line 62
    goto :goto_2

    .line 63
    :cond_3
    if-eqz p1, :cond_5

    .line 64
    .line 65
    invoke-virtual {p1, v1}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 66
    .line 67
    .line 68
    goto :goto_2

    .line 69
    :cond_4
    :goto_1
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 70
    .line 71
    return-object p0

    .line 72
    :cond_5
    :goto_2
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 73
    .line 74
    return-object p0
.end method

.method private synthetic lambda$initTransitionPostCreate$33(Ljava/util/concurrent/atomic/AtomicBoolean;Lcom/p1/mobile/android/app/Act;)Ljava/lang/Boolean;
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p1, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    .line 3
    .line 4
    .line 5
    move-result p1

    .line 6
    if-nez p1, :cond_5

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-nez p1, :cond_4

    .line 13
    .line 14
    iget-object p1, p0, Lcom/p1/mobile/android/app/Act;->trans:Lcom/p1/mobile/android/app/Act$v;

    .line 15
    .line 16
    if-nez p1, :cond_0

    .line 17
    .line 18
    goto :goto_1

    .line 19
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/android/app/Act$v;->b:Lcom/p1/mobile/android/app/Act$w;

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act$w;->a(Ljava/lang/Object;)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    const/4 v0, 0x0

    .line 28
    if-nez p1, :cond_1

    .line 29
    .line 30
    move-object v1, v0

    .line 31
    goto :goto_0

    .line 32
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    :goto_0
    if-eqz p1, :cond_2

    .line 37
    .line 38
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 39
    .line 40
    .line 41
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->trans:Lcom/p1/mobile/android/app/Act$v;

    .line 42
    .line 43
    iget-object v0, v0, Lcom/p1/mobile/android/app/Act$v;->b:Lcom/p1/mobile/android/app/Act$w;

    .line 44
    .line 45
    iget-object v2, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 46
    .line 47
    invoke-virtual {v0, p2, v2}, Lcom/p1/mobile/android/app/Act$w;->c(Ljava/lang/Object;Ljava/lang/Object;)Landroid/animation/Animator;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    if-eqz v0, :cond_3

    .line 52
    .line 53
    new-instance v2, Lcom/p1/mobile/android/app/Act$f;

    .line 54
    .line 55
    invoke-direct {v2, p0, p2, p1, v1}, Lcom/p1/mobile/android/app/Act$f;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/android/app/Act;Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0, v2}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 62
    .line 63
    .line 64
    iput-object v0, p0, Lcom/p1/mobile/android/app/Act;->currentTransAnim:Landroid/animation/Animator;

    .line 65
    .line 66
    goto :goto_2

    .line 67
    :cond_3
    if-eqz p1, :cond_5

    .line 68
    .line 69
    invoke-virtual {p1, v1}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 70
    .line 71
    .line 72
    goto :goto_2

    .line 73
    :cond_4
    :goto_1
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 74
    .line 75
    return-object p0

    .line 76
    :cond_5
    :goto_2
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 77
    .line 78
    return-object p0
.end method

.method private synthetic lambda$new$4(Lcom/p1/mobile/android/app/c;)V
    .locals 0

    return-void
.end method

.method private static synthetic lambda$new$5(Lcom/p1/mobile/android/app/Act$r;)V
    .locals 0

    return-void
.end method

.method private synthetic lambda$onCreate$15(Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->showDebugMenu()V

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x1

    .line 5
    return p0
.end method

.method private synthetic lambda$onCreate$16(Lcom/p1/mobile/android/app/c;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    sget-boolean v0, Lcom/p1/mobile/android/app/Act;->SWIPE_BACK_SUPPORTED:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->swipeBack:Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->s()V

    .line 14
    .line 15
    .line 16
    :cond_0
    instance-of v0, p1, Lcom/p1/mobile/android/app/c$a;

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    move-object v0, p1

    .line 22
    check-cast v0, Lcom/p1/mobile/android/app/c$a;

    .line 23
    .line 24
    iget-object v0, v0, Lcom/p1/mobile/android/app/c$c;->p:Landroid/os/Bundle;

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    move-object v0, v1

    .line 28
    :goto_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    iget-object p1, p1, Lcom/p1/mobile/android/app/c;->c:Ljava/lang/String;

    .line 33
    .line 34
    if-nez v0, :cond_2

    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_2
    invoke-virtual {v0}, Landroid/os/Bundle;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    :goto_1
    const-string v0, "[common][lifecycle]"

    .line 42
    .line 43
    invoke-static {v0, p0, p1, v1}, Ll/tu2;->b(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method private synthetic lambda$pendChangeActionButtonTypeface$13()Ljava/lang/Boolean;
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->toolbar()Landroidx/appcompat/widget/Toolbar;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    invoke-static {p0}, Ll/bnl0;->s(Landroid/view/ViewGroup;)Ljava/util/List;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    new-instance v0, Ll/o10;

    .line 15
    .line 16
    invoke-direct {v0}, Ll/o10;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-static {p0, v0}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    :cond_1
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Landroid/view/View;

    .line 38
    .line 39
    check-cast v0, Landroid/widget/TextView;

    .line 40
    .line 41
    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    if-nez v1, :cond_1

    .line 50
    .line 51
    const/4 v1, 0x3

    .line 52
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 57
    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_2
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 61
    .line 62
    return-object p0
.end method

.method private synthetic lambda$progress$28(Landroid/app/Dialog;ZFLandroid/view/WindowManager$LayoutParams;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->progressDialog:Landroid/app/Dialog;

    .line 2
    .line 3
    if-ne p0, p1, :cond_1

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p5}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 14
    .line 15
    .line 16
    move-result p5

    .line 17
    iput p5, p0, Landroid/view/WindowManager$LayoutParams;->alpha:F

    .line 18
    .line 19
    if-eqz p2, :cond_0

    .line 20
    .line 21
    iput p3, p0, Landroid/view/WindowManager$LayoutParams;->dimAmount:F

    .line 22
    .line 23
    :cond_0
    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0, p4}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 28
    .line 29
    .line 30
    :cond_1
    return-void
.end method

.method private static lmdCreate(Ljava/lang/String;Landroid/hardware/Sensor;)Lcom/p1/mobile/android/app/Act$u;
    .locals 3

    .line 1
    const/4 p0, 0x0

    .line 2
    if-eqz p1, :cond_0

    .line 3
    .line 4
    new-instance v0, Lcom/p1/mobile/android/app/Act$u;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Lcom/p1/mobile/android/app/Act$u;-><init>(Ll/p20;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, v0, Lcom/p1/mobile/android/app/Act$u;->a:Landroid/hardware/Sensor;

    .line 10
    .line 11
    new-instance p0, Lcom/p1/mobile/android/app/Act$h;

    .line 12
    .line 13
    invoke-direct {p0, v0}, Lcom/p1/mobile/android/app/Act$h;-><init>(Lcom/p1/mobile/android/app/Act$u;)V

    .line 14
    .line 15
    .line 16
    iput-object p0, v0, Lcom/p1/mobile/android/app/Act$u;->b:Landroid/hardware/SensorEventListener;

    .line 17
    .line 18
    sget-object p1, Lcom/p1/mobile/android/app/Act;->sensorManager:Landroid/hardware/SensorManager;

    .line 19
    .line 20
    iget-object v1, v0, Lcom/p1/mobile/android/app/Act$u;->a:Landroid/hardware/Sensor;

    .line 21
    .line 22
    const/4 v2, 0x3

    .line 23
    invoke-virtual {p1, p0, v1, v2}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    .line 24
    .line 25
    .line 26
    return-object v0

    .line 27
    :cond_0
    return-object p0
.end method

.method public static lmdEnd()Z
    .locals 5

    .line 1
    :try_start_0
    sget-object v0, Lcom/p1/mobile/android/app/Act;->sensorManager:Landroid/hardware/SensorManager;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    sput-object v1, Lcom/p1/mobile/android/app/Act;->sensorManager:Landroid/hardware/SensorManager;

    .line 7
    .line 8
    sget-object v2, Lcom/p1/mobile/android/app/Act;->sensors:Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result v3

    .line 18
    if-eqz v3, :cond_1

    .line 19
    .line 20
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    check-cast v3, Lcom/p1/mobile/android/app/Act$u;

    .line 25
    .line 26
    if-eqz v3, :cond_0

    .line 27
    .line 28
    iget-object v4, v3, Lcom/p1/mobile/android/app/Act$u;->b:Landroid/hardware/SensorEventListener;

    .line 29
    .line 30
    iget-object v3, v3, Lcom/p1/mobile/android/app/Act$u;->a:Landroid/hardware/Sensor;

    .line 31
    .line 32
    invoke-virtual {v0, v4, v3}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;)V

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->lmdResultMoved()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    sput-boolean v0, Lcom/p1/mobile/android/app/Act;->lmdResult:Z

    .line 41
    .line 42
    sget-object v0, Lcom/p1/mobile/android/app/Act;->sensors:Ljava/util/ArrayList;

    .line 43
    .line 44
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 45
    .line 46
    .line 47
    sput-object v1, Lcom/p1/mobile/android/app/Act;->sensors:Ljava/util/ArrayList;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 48
    .line 49
    goto :goto_1

    .line 50
    :catch_0
    move-exception v0

    .line 51
    new-instance v1, Ljava/lang/Exception;

    .line 52
    .line 53
    new-instance v2, Ljava/lang/StringBuilder;

    .line 54
    .line 55
    const-string v3, "Act lmdEnd:"

    .line 56
    .line 57
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    invoke-direct {v1, v2, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 72
    .line 73
    .line 74
    invoke-static {v1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 75
    .line 76
    .line 77
    :cond_2
    :goto_1
    sget-boolean v0, Lcom/p1/mobile/android/app/Act;->lmdResult:Z

    .line 78
    .line 79
    return v0
.end method

.method private static lmdResultMoved()Z
    .locals 9

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/Act;->sensors:Ljava/util/ArrayList;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_3

    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    if-eqz v2, :cond_3

    .line 15
    .line 16
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    check-cast v2, Lcom/p1/mobile/android/app/Act$u;

    .line 21
    .line 22
    if-eqz v2, :cond_0

    .line 23
    .line 24
    iget v3, v2, Lcom/p1/mobile/android/app/Act$u;->d:I

    .line 25
    .line 26
    const/16 v4, 0xa

    .line 27
    .line 28
    if-lt v3, v4, :cond_0

    .line 29
    .line 30
    iget-object v3, v2, Lcom/p1/mobile/android/app/Act$u;->c:[[F

    .line 31
    .line 32
    const/4 v5, 0x5

    .line 33
    aget-object v3, v3, v5

    .line 34
    .line 35
    aget v3, v3, v1

    .line 36
    .line 37
    move v6, v1

    .line 38
    move v7, v6

    .line 39
    :goto_0
    if-ge v6, v4, :cond_0

    .line 40
    .line 41
    iget-object v8, v2, Lcom/p1/mobile/android/app/Act$u;->c:[[F

    .line 42
    .line 43
    aget-object v8, v8, v6

    .line 44
    .line 45
    aget v8, v8, v1

    .line 46
    .line 47
    cmpl-float v8, v8, v3

    .line 48
    .line 49
    if-eqz v8, :cond_1

    .line 50
    .line 51
    add-int/lit8 v7, v7, 0x1

    .line 52
    .line 53
    :cond_1
    if-lt v7, v5, :cond_2

    .line 54
    .line 55
    const/4 v0, 0x1

    .line 56
    return v0

    .line 57
    :cond_2
    add-int/lit8 v6, v6, 0x1

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_3
    return v1
.end method

.method public static synthetic m1(Landroid/view/View;Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/view/ViewTreeObserver;->isAlive()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-virtual {p0, p1}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static mediaCapture()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 203
    sget-object v0, Lcom/p1/mobile/android/app/Act;->mediaCaptureBs:Lrx/subjects/b;

    invoke-virtual {v0}, Lrx/c;->onBackpressureLatest()Lrx/c;

    move-result-object v0

    invoke-virtual {v0}, Lrx/c;->asObservable()Lrx/c;

    move-result-object v0

    return-object v0
.end method

.method public static synthetic n1(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/android/app/Act;->lambda$debugItems$21()V

    return-void
.end method

.method private needAwardFilePermission()Z
    .locals 2

    .line 1
    sget-object p0, Landroid/os/Build;->BRAND:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "HONOR"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_2

    .line 20
    .line 21
    :cond_0
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_1

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v1, "NUBIA"

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-nez v0, :cond_2

    .line 38
    .line 39
    :cond_1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-nez v0, :cond_3

    .line 44
    .line 45
    invoke-virtual {p0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    const-string v0, "HUAWEI"

    .line 50
    .line 51
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    if-eqz p0, :cond_3

    .line 56
    .line 57
    :cond_2
    const/4 p0, 0x1

    .line 58
    return p0

    .line 59
    :cond_3
    const/4 p0, 0x0

    .line 60
    return p0
.end method

.method public static synthetic o1(Lcom/p1/mobile/android/app/Act;Ljava/util/concurrent/atomic/AtomicBoolean;Lcom/p1/mobile/android/app/Act;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/android/app/Act;->lambda$initTransitionPostCreate$33(Ljava/util/concurrent/atomic/AtomicBoolean;Lcom/p1/mobile/android/app/Act;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic p1()V
    .locals 0

    .line 1
    return-void
.end method

.method public static progress(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)Landroid/app/Dialog;
    .locals 4

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sget v3, Ll/gec0;->F:I

    .line 20
    .line 21
    invoke-virtual {v0, v3, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    sget v3, Ll/gec0;->E:I

    .line 31
    .line 32
    invoke-virtual {v0, v3, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    sget v1, Ll/vcc0;->j0:I

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    check-cast v1, Landroid/widget/TextView;

    .line 43
    .line 44
    sget v3, Ll/vcc0;->D:I

    .line 45
    .line 46
    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    check-cast v3, Landroid/widget/TextView;

    .line 51
    .line 52
    if-eqz v1, :cond_1

    .line 53
    .line 54
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 55
    .line 56
    .line 57
    :cond_1
    if-eqz v3, :cond_3

    .line 58
    .line 59
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    if-eqz v1, :cond_2

    .line 64
    .line 65
    const/16 v1, 0x8

    .line 66
    .line 67
    invoke-virtual {v3, v1}, Landroid/view/View;->setVisibility(I)V

    .line 68
    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_2
    invoke-virtual {v3, v2}, Landroid/view/View;->setVisibility(I)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v3, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 75
    .line 76
    .line 77
    :cond_3
    :goto_0
    new-instance v1, Landroidx/appcompat/app/a$a;

    .line 78
    .line 79
    invoke-direct {v1, p0}, Landroidx/appcompat/app/a$a;-><init>(Landroid/content/Context;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {v1, v0}, Landroidx/appcompat/app/a$a;->setView(Landroid/view/View;)Landroidx/appcompat/app/a$a;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-virtual {p0, v2}, Landroidx/appcompat/app/a$a;->setCancelable(Z)Landroidx/appcompat/app/a$a;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-virtual {p0}, Landroidx/appcompat/app/a$a;->create()Landroidx/appcompat/app/a;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 95
    .line 96
    .line 97
    move-result p1

    .line 98
    if-eqz p1, :cond_4

    .line 99
    .line 100
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 101
    .line 102
    .line 103
    move-result p1

    .line 104
    if-eqz p1, :cond_4

    .line 105
    .line 106
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    if-eqz p1, :cond_4

    .line 111
    .line 112
    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    invoke-virtual {p1, v2, v2, v2, v2}, Landroid/view/View;->setPadding(IIII)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    invoke-virtual {p1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    .line 124
    .line 125
    .line 126
    move-result-object p1

    .line 127
    const/16 p2, 0x11

    .line 128
    .line 129
    iput p2, p1, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 130
    .line 131
    const/high16 p2, 0x429c0000    # 78.0f

    .line 132
    .line 133
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    iput v0, p1, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 138
    .line 139
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 140
    .line 141
    .line 142
    move-result p2

    .line 143
    iput p2, p1, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 144
    .line 145
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 146
    .line 147
    .line 148
    move-result-object p2

    .line 149
    invoke-virtual {p2, p1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 150
    .line 151
    .line 152
    :cond_4
    invoke-virtual {p0, v2}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 153
    .line 154
    .line 155
    return-object p0
.end method

.method public static synthetic q1(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/android/app/Act;->lambda$onCreate$16(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic r1(Lcom/p1/mobile/android/app/Act;Landroid/app/Dialog;ZFLandroid/view/WindowManager$LayoutParams;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p5}, Lcom/p1/mobile/android/app/Act;->lambda$progress$28(Landroid/app/Dialog;ZFLandroid/view/WindowManager$LayoutParams;Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method private reportPickMediaError(Lcom/p1/mobile/android/app/Act$PickMediaError;)V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/android/app/Act$PickMediaError;->NOT_RESOLVABLE:Lcom/p1/mobile/android/app/Act$PickMediaError;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-ne p1, p0, :cond_0

    .line 5
    .line 6
    sget p0, Lcom/p1/mobile/android/R$string;->h7:I

    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/o1j0;->i(IZ)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    sget-object p0, Lcom/p1/mobile/android/app/Act$PickMediaError;->FILE_NOT_FOUND:Lcom/p1/mobile/android/app/Act$PickMediaError;

    .line 13
    .line 14
    if-ne p1, p0, :cond_1

    .line 15
    .line 16
    sget p0, Lcom/p1/mobile/android/R$string;->h7:I

    .line 17
    .line 18
    invoke-static {p0, v0}, Ll/o1j0;->i(IZ)V

    .line 19
    .line 20
    .line 21
    :cond_1
    return-void
.end method

.method public static synthetic s1(Ll/uxj0;)Ljava/util/HashMap;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/android/app/Act;->acts:Ljava/util/HashMap;

    .line 2
    .line 3
    return-object p0
.end method

.method public static sessionCount()I
    .locals 1

    .line 1
    sget v0, Lcom/p1/mobile/android/app/Act;->sessionCount:I

    .line 2
    .line 3
    return v0
.end method

.method private setWindowContentOverlayCompat()V
    .locals 0

    return-void
.end method

.method public static synthetic t1(Lcom/p1/mobile/android/app/Act;IIIILl/c30;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p6}, Lcom/p1/mobile/android/app/Act;->lambda$animateStatusAndActionBar$27(IIIILl/c30;Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static tryUpdateForegroundStatus()V
    .locals 12

    .line 1
    sget-boolean v0, Lcom/p1/mobile/android/app/Act;->foregroundStatusUpdated:Z

    .line 2
    .line 3
    if-nez v0, :cond_7

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/android/app/Act;->acts:Ljava/util/HashMap;

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const/4 v1, 0x0

    .line 16
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    const/4 v3, 0x1

    .line 21
    if-eqz v2, :cond_6

    .line 22
    .line 23
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    check-cast v2, Ljava/util/ArrayList;

    .line 28
    .line 29
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 30
    .line 31
    .line 32
    move-result v4

    .line 33
    sub-int/2addr v4, v3

    .line 34
    :goto_0
    if-ltz v4, :cond_0

    .line 35
    .line 36
    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v5

    .line 40
    check-cast v5, Lcom/p1/mobile/android/app/Act$r;

    .line 41
    .line 42
    iget-object v6, v5, Lcom/p1/mobile/android/app/Act$r;->b:Lcom/p1/mobile/android/app/c;

    .line 43
    .line 44
    sget-object v7, Lcom/p1/mobile/android/app/c;->h:Lcom/p1/mobile/android/app/c;

    .line 45
    .line 46
    if-eq v6, v7, :cond_5

    .line 47
    .line 48
    sget-object v7, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 49
    .line 50
    if-ne v6, v7, :cond_1

    .line 51
    .line 52
    goto :goto_1

    .line 53
    :cond_1
    sget-object v7, Lcom/p1/mobile/android/app/c;->k:Lcom/p1/mobile/android/app/c;

    .line 54
    .line 55
    if-eq v6, v7, :cond_2

    .line 56
    .line 57
    sget-object v7, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 58
    .line 59
    if-ne v6, v7, :cond_4

    .line 60
    .line 61
    :cond_2
    iget-wide v6, v5, Lcom/p1/mobile/android/app/Act$r;->c:J

    .line 62
    .line 63
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 64
    .line 65
    .line 66
    move-result-wide v8

    .line 67
    const-wide/16 v10, 0x3e8

    .line 68
    .line 69
    sub-long/2addr v8, v10

    .line 70
    cmp-long v6, v6, v8

    .line 71
    .line 72
    if-lez v6, :cond_4

    .line 73
    .line 74
    if-eqz v1, :cond_3

    .line 75
    .line 76
    iget-wide v6, v1, Lcom/p1/mobile/android/app/Act$r;->c:J

    .line 77
    .line 78
    iget-wide v8, v5, Lcom/p1/mobile/android/app/Act$r;->c:J

    .line 79
    .line 80
    cmp-long v6, v6, v8

    .line 81
    .line 82
    if-gtz v6, :cond_4

    .line 83
    .line 84
    :cond_3
    move-object v1, v5

    .line 85
    :cond_4
    add-int/lit8 v4, v4, -0x1

    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_5
    :goto_1
    sput-boolean v3, Lcom/p1/mobile/android/app/Act;->foregroundStatusUpdated:Z

    .line 89
    .line 90
    sput-object v5, Lcom/p1/mobile/android/app/Act;->foreground:Lcom/p1/mobile/android/app/Act$r;

    .line 91
    .line 92
    return-void

    .line 93
    :cond_6
    sput-boolean v3, Lcom/p1/mobile/android/app/Act;->foregroundStatusUpdated:Z

    .line 94
    .line 95
    sput-object v1, Lcom/p1/mobile/android/app/Act;->foreground:Lcom/p1/mobile/android/app/Act$r;

    .line 96
    .line 97
    :cond_7
    return-void
.end method

.method public static synthetic u1(Lcom/p1/mobile/android/app/Act;Ljava/util/concurrent/atomic/AtomicBoolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/android/app/Act;->lambda$initPartTransitionPostCreate$32(Ljava/util/concurrent/atomic/AtomicBoolean;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic v1(Lcom/p1/mobile/android/app/Act;)Lcom/p1/mobile/android/app/a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->activityReslutManager:Lcom/p1/mobile/android/app/a;

    return-object p0
.end method

.method public static bridge synthetic w1(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/android/app/Act;->actualFinish()V

    return-void
.end method

.method public static bridge synthetic y1()I
    .locals 1

    .line 1
    sget v0, Lcom/p1/mobile/android/app/Act;->sessionCount:I

    return v0
.end method

.method public static bridge synthetic z1(I)V
    .locals 0

    .line 1
    sput p0, Lcom/p1/mobile/android/app/Act;->sessionCount:I

    return-void
.end method


# virtual methods
.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    return-object p0
.end method

.method public actionItemPadding(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public adapterChangeLog(Ljava/util/ArrayList;)Ll/a;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ljava/lang/CharSequence;",
            ">;>;)",
            "Ll/a<",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ljava/lang/CharSequence;",
            ">;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/android/app/Act$g;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/p1/mobile/android/app/Act$g;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public addSwipeBackListener(Ll/ujh0;)V
    .locals 1

    .line 1
    sget-boolean v0, Lcom/p1/mobile/android/app/Act;->SWIPE_BACK_SUPPORTED:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->swipeBack:Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->q(Ll/ujh0;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public afterDestroyLivecycle()V
    .locals 0
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    return-void
.end method

.method public alwaysHideInput()V
    .locals 1

    .line 1
    const/4 v0, 0x3

    .line 2
    invoke-direct {p0, v0}, Lcom/p1/mobile/android/app/Act;->hideInput(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public animateStatusAndActionBar(II)V
    .locals 8

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->statusBarColor()I

    .line 2
    .line 3
    .line 4
    move-result v2

    .line 5
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 6
    .line 7
    .line 8
    move-result-object v6

    .line 9
    iget v4, p0, Lcom/p1/mobile/android/app/Act;->actionBarColor:I

    .line 10
    .line 11
    const/4 v0, 0x2

    .line 12
    new-array v0, v0, [F

    .line 13
    .line 14
    fill-array-data v0, :array_0

    .line 15
    .line 16
    .line 17
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 18
    .line 19
    .line 20
    move-result-object v7

    .line 21
    new-instance v0, Ll/j20;

    .line 22
    .line 23
    move-object v1, p0

    .line 24
    move v3, p1

    .line 25
    move v5, p2

    .line 26
    invoke-direct/range {v0 .. v6}, Ll/j20;-><init>(Lcom/p1/mobile/android/app/Act;IIIILl/c30;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v7, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 30
    .line 31
    .line 32
    const-wide/16 p0, 0x12c

    .line 33
    .line 34
    invoke-virtual {v7, p0, p1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    nop

    .line 43
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public changeAppLocale(Ljava/lang/String;)V
    .locals 3

    .line 1
    new-instance v0, Ljava/util/Locale;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ljava/util/Locale;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {p1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v2, v0}, Landroid/content/res/Configuration;->setLocale(Ljava/util/Locale;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1, v2, v1}, Landroid/content/res/Resources;->updateConfiguration(Landroid/content/res/Configuration;Landroid/util/DisplayMetrics;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public checkOptionsItemSelectSpeedOk()Z
    .locals 4

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Lcom/p1/mobile/android/app/Act;->lastItemSelectedTime:J

    .line 6
    .line 7
    sub-long/2addr v0, v2

    .line 8
    const-wide/16 v2, 0x12c

    .line 9
    .line 10
    cmp-long v0, v0, v2

    .line 11
    .line 12
    if-lez v0, :cond_0

    .line 13
    .line 14
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 15
    .line 16
    .line 17
    move-result-wide v0

    .line 18
    iput-wide v0, p0, Lcom/p1/mobile/android/app/Act;->lastItemSelectedTime:J

    .line 19
    .line 20
    const/4 p0, 0x1

    .line 21
    return p0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return p0
.end method

.method public checkPickMediaError(Ljava/lang/String;)Lcom/p1/mobile/android/app/Act$PickMediaError;
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    :try_start_0
    sget-object p0, Lcom/p1/mobile/android/app/Act$PickMediaError;->NOT_RESOLVABLE:Lcom/p1/mobile/android/app/Act$PickMediaError;

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    new-instance p0, Ljava/io/File;

    .line 7
    .line 8
    invoke-direct {p0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_1

    .line 16
    .line 17
    sget-object p0, Lcom/p1/mobile/android/app/Act$PickMediaError;->FILE_NOT_FOUND:Lcom/p1/mobile/android/app/Act$PickMediaError;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    .line 19
    return-object p0

    .line 20
    :cond_1
    const/4 p0, 0x0

    .line 21
    return-object p0

    .line 22
    :catch_0
    move-exception p0

    .line 23
    new-instance p1, Ljava/lang/Exception;

    .line 24
    .line 25
    new-instance v0, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    const-string v1, "checkPickMediaError:"

    .line 28
    .line 29
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-direct {p1, v0, p0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 44
    .line 45
    .line 46
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 47
    .line 48
    .line 49
    sget-object p0, Lcom/p1/mobile/android/app/Act$PickMediaError;->NOT_RESOLVABLE:Lcom/p1/mobile/android/app/Act$PickMediaError;

    .line 50
    .line 51
    return-object p0
.end method

.method public checkSavedInstanceStateAndCache(Landroid/os/Bundle;)V
    .locals 0

    return-void
.end method

.method public clearUpKeyboardListenerAndResizeChildOfContent()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/android/app/Act;->isSetUpKeyboardDetectorLayout:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->possiblyResizeChildOfContent()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public color(I)I
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getColor(I)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public creates(Ll/y20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Landroid/os/Bundle;",
            ">;)V"
        }
    .end annotation

    .line 19
    sget-object v0, Lcom/p1/mobile/android/app/Act;->ACTION0_NOTHING:Ll/x20;

    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/android/app/Act;->creates(Ll/y20;Ll/x20;)V

    return-void
.end method

.method public creates(Ll/y20;Ll/x20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Landroid/os/Bundle;",
            ">;",
            "Ll/x20;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/u11;->c()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->lifecycleSubject:Lrx/subjects/a;

    .line 5
    .line 6
    new-instance v0, Ll/h20;

    .line 7
    .line 8
    invoke-direct {v0, p1, p2}, Ll/h20;-><init>(Ll/y20;Ll/x20;)V

    .line 9
    .line 10
    .line 11
    sget-object p1, Lcom/p1/mobile/android/app/Act;->EMPTY_ON_ERROR:Ll/y20;

    .line 12
    .line 13
    sget-object p2, Lcom/p1/mobile/android/app/Act;->ACTION0_NOTHING:Ll/x20;

    .line 14
    .line 15
    invoke-virtual {p0, v0, p1, p2}, Lrx/c;->subscribe(Ll/y20;Ll/y20;Ll/x20;)Ll/kcg0;

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public cropImage(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p0, p1}, Lcom/p1/mobile/android/ui/cropiwa/CropperAct;->F1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const/16 v0, 0x6000

    .line 6
    .line 7
    invoke-virtual {p0, p1, v0}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public debugItems()Ljava/util/ArrayList;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ll/x20;",
            ">;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/pf60;

    .line 7
    .line 8
    new-instance v2, Ll/u10;

    .line 9
    .line 10
    invoke-direct {v2, p0}, Ll/u10;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 11
    .line 12
    .line 13
    const-string v3, "finish the activity"

    .line 14
    .line 15
    invoke-direct {v1, v3, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    new-instance v1, Ll/pf60;

    .line 22
    .line 23
    new-instance v2, Ll/v10;

    .line 24
    .line 25
    invoke-direct {v2, p0}, Ll/v10;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 26
    .line 27
    .line 28
    const-string p0, "clear SavedValue"

    .line 29
    .line 30
    invoke-direct {v1, p0, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    return-object v0
.end method

.method public decorOrSwipingDecorView()Landroid/view/View;
    .locals 1

    .line 1
    sget-boolean v0, Lcom/p1/mobile/android/app/Act;->SWIPE_BACK_SUPPORTED:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->swipeBack:Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->t()Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public dialog()Lcom/p1/mobile/android/app/Dialog$e;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/android/app/Dialog$e;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/android/app/Dialog$e;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public dimStatusBar(Z)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0, p1}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public drawable(I)Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/tu0;->b(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public duringCreated(Ll/pcj;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/pcj<",
            "Lrx/c<",
            "TT;>;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    const/4 v0, 0x1

    .line 19
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Ll/pcj;Z)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public duringCreated(Ll/pcj;Z)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/pcj<",
            "Lrx/c<",
            "TT;>;>;Z)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {}, Ll/psd0;->E()Lrx/c$d;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p1, p0, p2}, Ll/psd0;->D(Ll/pcj;Lrx/c;Z)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public duringCreated(Lrx/c;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 20
    new-instance v0, Ll/k20;

    invoke-direct {v0, p1}, Ll/k20;-><init>(Lrx/c;)V

    const/4 p1, 0x1

    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Ll/pcj;Z)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public duringCreated(Lrx/c;Z)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "TT;>;Z)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 18
    new-instance v0, Ll/a20;

    invoke-direct {v0, p1}, Ll/a20;-><init>(Lrx/c;)V

    invoke-virtual {p0, v0, p2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Ll/pcj;Z)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public enterAnimation()Landroid/animation/Animator;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public exitAnimation()Landroid/animation/Animator;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public finish()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->lifecycleSubject:Lrx/subjects/a;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/android/app/c;->o:Lcom/p1/mobile/android/app/c;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->trans:Lcom/p1/mobile/android/app/Act$v;

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    iget-boolean v2, p0, Lcom/p1/mobile/android/app/Act;->finishingByAnimation:Z

    .line 14
    .line 15
    if-nez v2, :cond_3

    .line 16
    .line 17
    iput-boolean v1, p0, Lcom/p1/mobile/android/app/Act;->finishingByAnimation:Z

    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/android/app/Act;->currentTransAnim:Landroid/animation/Animator;

    .line 20
    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/android/app/Act$v;->b:Lcom/p1/mobile/android/app/Act$w;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act$w;->b()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_0

    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->currentTransAnim:Landroid/animation/Animator;

    .line 32
    .line 33
    new-instance v1, Ll/g10;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/g10;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v0, v1}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finishStartWithAnim()V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->partTransition:Ll/s20$a;

    .line 47
    .line 48
    if-eqz v0, :cond_4

    .line 49
    .line 50
    iget-boolean v2, p0, Lcom/p1/mobile/android/app/Act;->finishingByAnimation:Z

    .line 51
    .line 52
    if-nez v2, :cond_3

    .line 53
    .line 54
    iput-boolean v1, p0, Lcom/p1/mobile/android/app/Act;->finishingByAnimation:Z

    .line 55
    .line 56
    iget-object v1, p0, Lcom/p1/mobile/android/app/Act;->currentTransAnim:Landroid/animation/Animator;

    .line 57
    .line 58
    if-eqz v1, :cond_2

    .line 59
    .line 60
    invoke-virtual {v0}, Ll/s20$a;->d()Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    if-nez v0, :cond_2

    .line 65
    .line 66
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->currentTransAnim:Landroid/animation/Animator;

    .line 67
    .line 68
    new-instance v1, Ll/h10;

    .line 69
    .line 70
    invoke-direct {v1, p0}, Ll/h10;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 71
    .line 72
    .line 73
    invoke-static {v0, v1}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finishPartStartWithAnim()V

    .line 78
    .line 79
    .line 80
    :cond_3
    return-void

    .line 81
    :cond_4
    invoke-direct {p0}, Lcom/p1/mobile/android/app/Act;->actualFinish()V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method public finishPartStartWithAnim()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->partTransition:Ll/s20$a;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/s20$a;->c(Lcom/p1/mobile/android/app/Act;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->partTransition:Ll/s20$a;

    .line 16
    .line 17
    iget-object v2, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    invoke-virtual {v0, v2}, Ll/s20$a;->h(Lcom/p1/mobile/android/app/Act;)Landroid/animation/Animator;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    new-instance v1, Lcom/p1/mobile/android/app/Act$c;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Lcom/p1/mobile/android/app/Act$c;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_1
    iput-object v1, p0, Lcom/p1/mobile/android/app/Act;->partTransition:Ll/s20$a;

    .line 38
    .line 39
    invoke-direct {p0}, Lcom/p1/mobile/android/app/Act;->actualFinish()V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public finishStartWithAnim()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->trans:Lcom/p1/mobile/android/app/Act$v;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/android/app/Act$v;->a:Ljava/lang/ref/WeakReference;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    if-eqz v0, :cond_4

    .line 13
    .line 14
    iget-object v2, p0, Lcom/p1/mobile/android/app/Act;->trans:Lcom/p1/mobile/android/app/Act$v;

    .line 15
    .line 16
    iget-object v2, v2, Lcom/p1/mobile/android/app/Act$v;->b:Lcom/p1/mobile/android/app/Act$w;

    .line 17
    .line 18
    invoke-virtual {v2, p0}, Lcom/p1/mobile/android/app/Act$w;->a(Ljava/lang/Object;)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    if-eqz v2, :cond_0

    .line 23
    .line 24
    invoke-virtual {v2, v1}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-virtual {v2}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    instance-of v3, v2, Landroid/view/ViewGroup;

    .line 36
    .line 37
    const/4 v4, 0x0

    .line 38
    if-eqz v3, :cond_1

    .line 39
    .line 40
    check-cast v2, Landroid/view/ViewGroup;

    .line 41
    .line 42
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    :cond_1
    if-eqz v2, :cond_2

    .line 47
    .line 48
    invoke-virtual {v2, v4}, Landroid/view/View;->setVisibility(I)V

    .line 49
    .line 50
    .line 51
    new-instance v3, Ll/r10;

    .line 52
    .line 53
    invoke-direct {v3, v2}, Ll/r10;-><init>(Landroid/view/View;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0, v3}, Lcom/p1/mobile/android/app/Act;->post(Ljava/lang/Runnable;)V

    .line 57
    .line 58
    .line 59
    :cond_2
    iget-object v2, p0, Lcom/p1/mobile/android/app/Act;->trans:Lcom/p1/mobile/android/app/Act$v;

    .line 60
    .line 61
    iget-object v2, v2, Lcom/p1/mobile/android/app/Act$v;->b:Lcom/p1/mobile/android/app/Act$w;

    .line 62
    .line 63
    invoke-virtual {v2, v0, p0}, Lcom/p1/mobile/android/app/Act$w;->d(Ljava/lang/Object;Ljava/lang/Object;)Landroid/animation/Animator;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    if-eqz v0, :cond_3

    .line 68
    .line 69
    new-instance v1, Lcom/p1/mobile/android/app/Act$d;

    .line 70
    .line 71
    invoke-direct {v1, p0}, Lcom/p1/mobile/android/app/Act$d;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :cond_3
    iput-object v1, p0, Lcom/p1/mobile/android/app/Act;->trans:Lcom/p1/mobile/android/app/Act$v;

    .line 82
    .line 83
    invoke-direct {p0}, Lcom/p1/mobile/android/app/Act;->actualFinish()V

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :cond_4
    iput-object v1, p0, Lcom/p1/mobile/android/app/Act;->trans:Lcom/p1/mobile/android/app/Act$v;

    .line 88
    .line 89
    invoke-direct {p0}, Lcom/p1/mobile/android/app/Act;->actualFinish()V

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public finishWithoutCustomAnimation()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->lifecycleSubject:Lrx/subjects/a;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/android/app/c;->o:Lcom/p1/mobile/android/app/c;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Lcom/p1/mobile/android/app/Act;->actualFinish()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public flow()Ll/q1e;
    .locals 0

    .line 1
    new-instance p0, Ll/q1e;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/q1e;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public fragmentManager()Landroidx/fragment/app/FragmentManager;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public abstract getAppTheme()Ll/ux0;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end method

.method public getCentralTitle(Ljava/lang/CharSequence;)Landroid/widget/TextView;
    .locals 3

    .line 1
    new-instance v0, Lv/VText;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lv/VText;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    sget v1, Ll/qa00;->j:I

    .line 7
    .line 8
    sget v2, Ll/qa00;->e:I

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2, v1, v2}, Landroid/view/View;->setPadding(IIII)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/widget/TextView;->setSingleLine()V

    .line 14
    .line 15
    .line 16
    sget-object v1, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 19
    .line 20
    .line 21
    const/4 v1, 0x3

    .line 22
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Lcom/p1/mobile/android/app/Act;->originalTitle:Landroid/widget/TextView;

    .line 33
    .line 34
    invoke-virtual {p1}, Landroid/widget/TextView;->getTextColors()Landroid/content/res/ColorStateList;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->originalTitle:Landroid/widget/TextView;

    .line 42
    .line 43
    invoke-virtual {p0}, Landroid/widget/TextView;->getTextSize()F

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    const/4 p1, 0x0

    .line 48
    invoke-virtual {v0, p1, p0}, Landroidx/appcompat/widget/AppCompatTextView;->setTextSize(IF)V

    .line 49
    .line 50
    .line 51
    return-object v0
.end method

.method public getPopLifeName()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v1, "_"

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0
.end method

.method public getShowingDialog()Landroid/app/Dialog;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->showingDialogList:Ljava/util/List;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_2

    .line 5
    .line 6
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-gtz v0, :cond_0

    .line 11
    .line 12
    goto :goto_1

    .line 13
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->showingDialogList:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    add-int/lit8 v0, v0, -0x1

    .line 20
    .line 21
    :goto_0
    if-ltz v0, :cond_2

    .line 22
    .line 23
    iget-object v2, p0, Lcom/p1/mobile/android/app/Act;->showingDialogList:Ljava/util/List;

    .line 24
    .line 25
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    check-cast v2, Ljava/lang/ref/WeakReference;

    .line 30
    .line 31
    invoke-virtual {v2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    if-eqz v2, :cond_1

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->showingDialogList:Ljava/util/List;

    .line 38
    .line 39
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    check-cast p0, Ljava/lang/ref/WeakReference;

    .line 44
    .line 45
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    check-cast p0, Landroid/app/Dialog;

    .line 50
    .line 51
    return-object p0

    .line 52
    :cond_1
    add-int/lit8 v0, v0, -0x1

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_2
    :goto_1
    return-object v1
.end method

.method public hasCustomTransition()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->trans:Lcom/p1/mobile/android/app/Act$v;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public hideInput()V
    .locals 1

    const/4 v0, 0x2

    .line 102
    invoke-direct {p0, v0}, Lcom/p1/mobile/android/app/Act;->hideInput(I)V

    return-void
.end method

.method public hideInput(Landroid/view/View;)Z
    .locals 2

    .line 103
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 104
    invoke-direct {p0}, Lcom/p1/mobile/android/app/Act;->imm()Landroid/view/inputmethod/InputMethodManager;

    move-result-object p0

    invoke-virtual {p1}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    move-result p0

    return p0
.end method

.method public hideSystemUi(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const/16 p1, 0xf06

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const/16 p1, 0x700

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public inflater()Landroid/view/LayoutInflater;
    .locals 0

    .line 1
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public initAnimationState()V
    .locals 0

    return-void
.end method

.method public initDataOnCreate()V
    .locals 2
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .line 1
    invoke-static {}, Ll/srf;->a()Ll/srf;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/android/app/ExtraActLifecycle;->onInitDataOnCreate:Lcom/p1/mobile/android/app/ExtraActLifecycle;

    .line 6
    .line 7
    invoke-virtual {v0, v1, p0}, Ll/srf;->c(Lcom/p1/mobile/android/app/ExtraActLifecycle;Lcom/p1/mobile/android/app/Act;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Ll/i10;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/i10;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/y20;)Ll/kcg0;

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public initPartTransitionCreate()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "unique_transition_key"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    invoke-static {v0}, Ll/s20;->b(Ljava/lang/String;)Ll/s20$a;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iput-object v0, p0, Lcom/p1/mobile/android/app/Act;->partTransition:Ll/s20$a;

    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public initPartTransitionPostCreate()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->partTransition:Ll/s20$a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/s20$a;->o(Lcom/p1/mobile/android/app/Act;)V

    .line 8
    .line 9
    .line 10
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    new-instance v2, Ll/q10;

    .line 25
    .line 26
    invoke-direct {v2, p0, v0}, Ll/q10;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/util/concurrent/atomic/AtomicBoolean;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1, v2}, Ll/bnl0;->b0(Landroid/view/View;Ll/pcj;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public initSubscription()V
    .locals 2
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .line 1
    invoke-static {}, Ll/srf;->a()Ll/srf;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/android/app/ExtraActLifecycle;->onInitSubscription:Lcom/p1/mobile/android/app/ExtraActLifecycle;

    .line 6
    .line 7
    invoke-virtual {v0, v1, p0}, Ll/srf;->c(Lcom/p1/mobile/android/app/ExtraActLifecycle;Lcom/p1/mobile/android/app/Act;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public initTransitionCreate()V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/Act;->tempQueue:Ljava/util/LinkedList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/LinkedList;->poll()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/android/app/Act$v;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {v0}, Lcom/p1/mobile/android/app/Act$v;->a(Lcom/p1/mobile/android/app/Act$v;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    iget-object v1, v0, Lcom/p1/mobile/android/app/Act$v;->a:Ljava/lang/ref/WeakReference;

    .line 30
    .line 31
    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    check-cast v1, Lcom/p1/mobile/android/app/Act;

    .line 36
    .line 37
    if-eqz v1, :cond_0

    .line 38
    .line 39
    new-instance v2, Lcom/p1/mobile/android/app/Act$v;

    .line 40
    .line 41
    new-instance v3, Ljava/lang/ref/WeakReference;

    .line 42
    .line 43
    invoke-direct {v3, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    iget-object v1, v0, Lcom/p1/mobile/android/app/Act$v;->b:Lcom/p1/mobile/android/app/Act$w;

    .line 47
    .line 48
    invoke-static {v0}, Lcom/p1/mobile/android/app/Act$v;->a(Lcom/p1/mobile/android/app/Act$v;)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-direct {v2, v3, v1, v0}, Lcom/p1/mobile/android/app/Act$v;-><init>(Ljava/lang/ref/WeakReference;Lcom/p1/mobile/android/app/Act$w;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    iput-object v2, p0, Lcom/p1/mobile/android/app/Act;->trans:Lcom/p1/mobile/android/app/Act$v;

    .line 56
    .line 57
    :cond_0
    return-void
.end method

.method public initTransitionPostCreate()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->trans:Lcom/p1/mobile/android/app/Act$v;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/android/app/Act$v;->a:Ljava/lang/ref/WeakReference;

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/android/app/Act;->trans:Lcom/p1/mobile/android/app/Act$v;

    .line 16
    .line 17
    iget-object v1, v1, Lcom/p1/mobile/android/app/Act$v;->b:Lcom/p1/mobile/android/app/Act$w;

    .line 18
    .line 19
    iget-object v2, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    invoke-virtual {v1, v0, v2}, Lcom/p1/mobile/android/app/Act$w;->h(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    new-instance v1, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 25
    .line 26
    const/4 v2, 0x0

    .line 27
    invoke-direct {v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-virtual {v2}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    new-instance v3, Ll/c20;

    .line 39
    .line 40
    invoke-direct {v3, p0, v1, v0}, Ll/c20;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/util/concurrent/atomic/AtomicBoolean;Lcom/p1/mobile/android/app/Act;)V

    .line 41
    .line 42
    .line 43
    invoke-static {v2, v3}, Ll/bnl0;->b0(Landroid/view/View;Ll/pcj;)V

    .line 44
    .line 45
    .line 46
    :cond_0
    return-void
.end method

.method public isAdjustResizeEnabled()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->isAdjustResizeInAttributes()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->isAdjustResizeInManifest()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method public isAdjustResizeInAttributes()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget p0, p0, Landroid/view/WindowManager$LayoutParams;->softInputMode:I

    .line 10
    .line 11
    and-int/lit16 p0, p0, 0xf0

    .line 12
    .line 13
    const/16 v0, 0x10

    .line 14
    .line 15
    if-ne p0, v0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public isAdjustResizeInManifest()Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    invoke-virtual {p0}, Landroid/app/Activity;->getComponentName()Landroid/content/ComponentName;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const/16 v2, 0x80

    .line 11
    .line 12
    invoke-virtual {v1, p0, v2}, Landroid/content/pm/PackageManager;->getActivityInfo(Landroid/content/ComponentName;I)Landroid/content/pm/ActivityInfo;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    iget p0, p0, Landroid/content/pm/ActivityInfo;->softInputMode:I
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    .line 18
    and-int/lit16 p0, p0, 0xf0

    .line 19
    .line 20
    const/16 v1, 0x10

    .line 21
    .line 22
    if-ne p0, v1, :cond_0

    .line 23
    .line 24
    const/4 p0, 0x1

    .line 25
    return p0

    .line 26
    :catch_0
    :cond_0
    return v0
.end method

.method public isCancelable()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->getShowingDialog()Landroid/app/Dialog;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    instance-of v0, p0, Lcom/p1/mobile/android/app/Dialog;

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    check-cast p0, Lcom/p1/mobile/android/app/Dialog;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 12
    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    return p0

    .line 17
    :cond_0
    iget-boolean p0, p0, Lcom/p1/mobile/android/app/Dialog$e;->F:Z

    .line 18
    .line 19
    return p0

    .line 20
    :cond_1
    const/4 p0, 0x1

    .line 21
    return p0
.end method

.method public isDialogShowing()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->showingDialogList:Ljava/util/List;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-lez v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->showingDialogList:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Ljava/lang/ref/WeakReference;

    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->showingDialogList:Ljava/util/List;

    .line 27
    .line 28
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    check-cast p0, Ljava/lang/ref/WeakReference;

    .line 33
    .line 34
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    check-cast p0, Landroid/app/Dialog;

    .line 39
    .line 40
    invoke-virtual {p0}, Landroid/app/Dialog;->isShowing()Z

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    if-eqz p0, :cond_0

    .line 45
    .line 46
    const/4 p0, 0x1

    .line 47
    return p0

    .line 48
    :cond_0
    return v1
.end method

.method public isFinishing()Z
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/app/Activity;->isFinishing()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    iget-boolean p0, p0, Lcom/p1/mobile/android/app/Act;->finishingByAnimation:Z

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0

    .line 14
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 15
    return p0
.end method

.method public lifecycle()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/android/app/c;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->lifecycleSubject:Lrx/subjects/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public lifecycle_()Lcom/p1/mobile/android/app/c;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->lifecycleSubject:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/android/app/c;

    .line 8
    .line 9
    return-object p0
.end method

.method public lmdStart(I)V
    .locals 4

    .line 1
    :try_start_0
    sget-object v0, Lcom/p1/mobile/android/app/Act;->sensorManager:Landroid/hardware/SensorManager;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 6
    .line 7
    new-instance v1, Ll/i20;

    .line 8
    .line 9
    invoke-direct {v1}, Ll/i20;-><init>()V

    .line 10
    .line 11
    .line 12
    int-to-long v2, p1

    .line 13
    invoke-static {v0, v1, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 14
    .line 15
    .line 16
    const/4 p1, 0x0

    .line 17
    sput-boolean p1, Lcom/p1/mobile/android/app/Act;->lmdResult:Z

    .line 18
    .line 19
    const-string p1, "sensor"

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    check-cast p0, Landroid/hardware/SensorManager;

    .line 26
    .line 27
    sput-object p0, Lcom/p1/mobile/android/app/Act;->sensorManager:Landroid/hardware/SensorManager;

    .line 28
    .line 29
    new-instance p0, Ljava/util/ArrayList;

    .line 30
    .line 31
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 32
    .line 33
    .line 34
    sput-object p0, Lcom/p1/mobile/android/app/Act;->sensors:Ljava/util/ArrayList;

    .line 35
    .line 36
    const-string p1, "0"

    .line 37
    .line 38
    sget-object v0, Lcom/p1/mobile/android/app/Act;->sensorManager:Landroid/hardware/SensorManager;

    .line 39
    .line 40
    const/4 v1, 0x1

    .line 41
    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-static {p1, v0}, Lcom/p1/mobile/android/app/Act;->lmdCreate(Ljava/lang/String;Landroid/hardware/Sensor;)Lcom/p1/mobile/android/app/Act$u;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    sget-object p0, Lcom/p1/mobile/android/app/Act;->sensors:Ljava/util/ArrayList;

    .line 53
    .line 54
    const-string p1, "1"

    .line 55
    .line 56
    sget-object v0, Lcom/p1/mobile/android/app/Act;->sensorManager:Landroid/hardware/SensorManager;

    .line 57
    .line 58
    const/4 v1, 0x4

    .line 59
    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-static {p1, v0}, Lcom/p1/mobile/android/app/Act;->lmdCreate(Ljava/lang/String;Landroid/hardware/Sensor;)Lcom/p1/mobile/android/app/Act$u;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 68
    .line 69
    .line 70
    :cond_0
    return-void

    .line 71
    :catch_0
    move-exception p0

    .line 72
    new-instance p1, Ljava/lang/Exception;

    .line 73
    .line 74
    new-instance v0, Ljava/lang/StringBuilder;

    .line 75
    .line 76
    const-string v1, "Act lmdStart exception:"

    .line 77
    .line 78
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-direct {p1, v0, p0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 93
    .line 94
    .line 95
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 96
    .line 97
    .line 98
    return-void
.end method

.method public mediaCapture(Z)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 v0, 0x0

    .line 202
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/android/app/Act;->mediaCapture(ZZ)V

    return-void
.end method

.method public mediaCapture(ZZ)V
    .locals 5
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const-string v1, "android.media.action.IMAGE_CAPTURE"

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const-string v1, "android.media.action.VIDEO_CAPTURE"

    .line 9
    .line 10
    :goto_0
    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    if-eqz p1, :cond_1

    .line 14
    .line 15
    const-string v1, "com.android.camera"

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    invoke-direct {p0, v0}, Lcom/p1/mobile/android/app/Act;->canResolveTargetPackage(Landroid/content/Intent;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-nez v1, :cond_1

    .line 25
    .line 26
    const/4 v1, 0x0

    .line 27
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 28
    .line 29
    .line 30
    :cond_1
    if-nez p1, :cond_2

    .line 31
    .line 32
    invoke-direct {p0}, Lcom/p1/mobile/android/app/Act;->isSpecificRecordVideo()Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-nez v1, :cond_4

    .line 37
    .line 38
    :cond_2
    const-string v1, "cache"

    .line 39
    .line 40
    invoke-static {v1}, Ll/ecj;->O(Ljava/lang/String;)Ljava/io/File;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    sput-object v2, Lcom/p1/mobile/android/app/Act;->tempFileName:Ljava/lang/String;

    .line 49
    .line 50
    new-instance v2, Ljava/lang/StringBuilder;

    .line 51
    .line 52
    const-string v3, "files."

    .line 53
    .line 54
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    invoke-static {p0, v2, v1}, Landroidx/core/content/FileProvider;->getUriForFile(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;)Landroid/net/Uri;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    if-nez p1, :cond_3

    .line 73
    .line 74
    invoke-direct {p0}, Lcom/p1/mobile/android/app/Act;->needAwardFilePermission()Z

    .line 75
    .line 76
    .line 77
    move-result v2

    .line 78
    if-eqz v2, :cond_3

    .line 79
    .line 80
    :try_start_0
    new-instance v2, Landroid/content/Intent;

    .line 81
    .line 82
    const-string v3, "android.intent.action.VIEW"

    .line 83
    .line 84
    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    const-string v3, "video/*"

    .line 88
    .line 89
    invoke-virtual {v2, v1, v3}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    .line 90
    .line 91
    .line 92
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 93
    .line 94
    .line 95
    move-result-object v3

    .line 96
    const/high16 v4, 0x10000

    .line 97
    .line 98
    invoke-virtual {v3, v2, v4}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    .line 99
    .line 100
    .line 101
    move-result-object v2

    .line 102
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 103
    .line 104
    .line 105
    move-result v3

    .line 106
    if-nez v3, :cond_3

    .line 107
    .line 108
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 109
    .line 110
    .line 111
    move-result-object v2

    .line 112
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 113
    .line 114
    .line 115
    move-result v3

    .line 116
    if-eqz v3, :cond_3

    .line 117
    .line 118
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    move-result-object v3

    .line 122
    check-cast v3, Landroid/content/pm/ResolveInfo;

    .line 123
    .line 124
    iget-object v3, v3, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    .line 125
    .line 126
    iget-object v3, v3, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    .line 127
    .line 128
    const/4 v4, 0x3

    .line 129
    invoke-virtual {p0, v3, v1, v4}, Landroid/content/Context;->grantUriPermission(Ljava/lang/String;Landroid/net/Uri;I)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 130
    .line 131
    .line 132
    goto :goto_1

    .line 133
    :catch_0
    move-exception v2

    .line 134
    invoke-static {v2}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 135
    .line 136
    .line 137
    :cond_3
    const-string v2, "output"

    .line 138
    .line 139
    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 140
    .line 141
    .line 142
    :cond_4
    const-string v1, "return-data"

    .line 143
    .line 144
    const/4 v2, 0x1

    .line 145
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 146
    .line 147
    .line 148
    if-eqz p2, :cond_5

    .line 149
    .line 150
    const-string p2, "android.intent.extras.LENS_FACING_FRONT"

    .line 151
    .line 152
    invoke-virtual {v0, p2, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 153
    .line 154
    .line 155
    const-string p2, "android.intent.extras.CAMERA_FACING"

    .line 156
    .line 157
    invoke-virtual {v0, p2, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 158
    .line 159
    .line 160
    const-string p2, "android.intent.extra.USE_FRONT_CAMERA"

    .line 161
    .line 162
    invoke-virtual {v0, p2, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 163
    .line 164
    .line 165
    :cond_5
    :try_start_1
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 166
    .line 167
    if-eqz p1, :cond_6

    .line 168
    .line 169
    const/16 p2, 0x4000

    .line 170
    .line 171
    goto :goto_2

    .line 172
    :cond_6
    const/16 p2, 0x5000

    .line 173
    .line 174
    :goto_2
    invoke-virtual {p0, v0, p2}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 175
    .line 176
    .line 177
    sget-object p0, Lcom/p1/mobile/android/app/Act;->mediaCaptureBs:Lrx/subjects/b;

    .line 178
    .line 179
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 180
    .line 181
    .line 182
    move-result-object p1

    .line 183
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V
    :try_end_1
    .catch Landroid/content/ActivityNotFoundException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_1} :catch_1

    .line 184
    .line 185
    .line 186
    goto :goto_3

    .line 187
    :catch_1
    move-exception p0

    .line 188
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 189
    .line 190
    .line 191
    goto :goto_3

    .line 192
    :catch_2
    move-exception p0

    .line 193
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 194
    .line 195
    .line 196
    sget p0, Lcom/p1/mobile/android/R$string;->g7:I

    .line 197
    .line 198
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 199
    .line 200
    .line 201
    :goto_3
    return-void
.end method

.method public monitorInflateViewCost(J)V
    .locals 0

    return-void
.end method

.method public needMarkResume()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public needXmlMonitor()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public newDialog()Ll/jl80$a;
    .locals 1

    .line 1
    new-instance v0, Ll/jl80$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 9
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->activityReslutManager:Lcom/p1/mobile/android/app/a;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2, p3}, Lcom/p1/mobile/android/app/a;->b(IILandroid/content/Intent;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_3

    .line 10
    .line 11
    :cond_0
    const/4 v0, -0x1

    .line 12
    if-ne p2, v0, :cond_11

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    const/16 v1, 0x1000

    .line 16
    .line 17
    const/4 v2, 0x0

    .line 18
    if-ne p1, v1, :cond_5

    .line 19
    .line 20
    invoke-virtual {p3}, Landroid/content/Intent;->getClipData()Landroid/content/ClipData;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    if-eqz v3, :cond_5

    .line 25
    .line 26
    new-instance p1, Ljava/util/ArrayList;

    .line 27
    .line 28
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 29
    .line 30
    .line 31
    :goto_0
    invoke-virtual {p3}, Landroid/content/Intent;->getClipData()Landroid/content/ClipData;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    invoke-virtual {p2}, Landroid/content/ClipData;->getItemCount()I

    .line 36
    .line 37
    .line 38
    move-result p2

    .line 39
    if-ge v0, p2, :cond_3

    .line 40
    .line 41
    invoke-virtual {p3}, Landroid/content/Intent;->getClipData()Landroid/content/ClipData;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    invoke-virtual {p2, v0}, Landroid/content/ClipData;->getItemAt(I)Landroid/content/ClipData$Item;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    invoke-virtual {p2}, Landroid/content/ClipData$Item;->getUri()Landroid/net/Uri;

    .line 50
    .line 51
    .line 52
    move-result-object p2

    .line 53
    invoke-static {p2}, Ll/h26;->g(Landroid/net/Uri;)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    invoke-virtual {p0, p2}, Lcom/p1/mobile/android/app/Act;->checkPickMediaError(Ljava/lang/String;)Lcom/p1/mobile/android/app/Act$PickMediaError;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    if-nez v1, :cond_1

    .line 62
    .line 63
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    goto :goto_1

    .line 67
    :cond_1
    if-nez v2, :cond_2

    .line 68
    .line 69
    move-object v2, v1

    .line 70
    :cond_2
    :goto_1
    add-int/lit8 v0, v0, 0x1

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_3
    if-eqz v2, :cond_4

    .line 74
    .line 75
    invoke-direct {p0, v2}, Lcom/p1/mobile/android/app/Act;->reportPickMediaError(Lcom/p1/mobile/android/app/Act$PickMediaError;)V

    .line 76
    .line 77
    .line 78
    :cond_4
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 79
    .line 80
    .line 81
    move-result p2

    .line 82
    if-lez p2, :cond_f

    .line 83
    .line 84
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->onPickImagesSystemResult(Ljava/util/List;)V

    .line 85
    .line 86
    .line 87
    return-void

    .line 88
    :cond_5
    const/16 v3, 0x2000

    .line 89
    .line 90
    if-eq p1, v3, :cond_6

    .line 91
    .line 92
    if-ne p1, v1, :cond_8

    .line 93
    .line 94
    :cond_6
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    if-eqz v1, :cond_8

    .line 99
    .line 100
    new-instance p1, Ljava/util/ArrayList;

    .line 101
    .line 102
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 103
    .line 104
    .line 105
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    .line 106
    .line 107
    .line 108
    move-result-object p2

    .line 109
    invoke-static {p2}, Ll/h26;->g(Landroid/net/Uri;)Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object p2

    .line 113
    invoke-virtual {p0, p2}, Lcom/p1/mobile/android/app/Act;->checkPickMediaError(Ljava/lang/String;)Lcom/p1/mobile/android/app/Act$PickMediaError;

    .line 114
    .line 115
    .line 116
    move-result-object p3

    .line 117
    if-nez p3, :cond_7

    .line 118
    .line 119
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->onPickImagesSystemResult(Ljava/util/List;)V

    .line 123
    .line 124
    .line 125
    return-void

    .line 126
    :cond_7
    invoke-direct {p0, p3}, Lcom/p1/mobile/android/app/Act;->reportPickMediaError(Lcom/p1/mobile/android/app/Act$PickMediaError;)V

    .line 127
    .line 128
    .line 129
    return-void

    .line 130
    :cond_8
    const/16 v1, 0x3000

    .line 131
    .line 132
    if-ne p1, v1, :cond_a

    .line 133
    .line 134
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    .line 135
    .line 136
    .line 137
    move-result-object p1

    .line 138
    invoke-static {p1}, Ll/h26;->g(Landroid/net/Uri;)Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->checkPickMediaError(Ljava/lang/String;)Lcom/p1/mobile/android/app/Act$PickMediaError;

    .line 143
    .line 144
    .line 145
    move-result-object p2

    .line 146
    if-nez p2, :cond_9

    .line 147
    .line 148
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->onPickVideoSystemResult(Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    return-void

    .line 152
    :cond_9
    invoke-direct {p0, p2}, Lcom/p1/mobile/android/app/Act;->reportPickMediaError(Lcom/p1/mobile/android/app/Act$PickMediaError;)V

    .line 153
    .line 154
    .line 155
    return-void

    .line 156
    :cond_a
    const/16 v1, 0x5000

    .line 157
    .line 158
    if-ne p1, v1, :cond_d

    .line 159
    .line 160
    invoke-direct {p0}, Lcom/p1/mobile/android/app/Act;->isSpecificRecordVideo()Z

    .line 161
    .line 162
    .line 163
    move-result p1

    .line 164
    if-eqz p1, :cond_c

    .line 165
    .line 166
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    .line 167
    .line 168
    .line 169
    move-result-object p1

    .line 170
    if-eqz p1, :cond_c

    .line 171
    .line 172
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    .line 173
    .line 174
    .line 175
    move-result-object p1

    .line 176
    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object p1

    .line 180
    const-string p2, "content"

    .line 181
    .line 182
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 183
    .line 184
    .line 185
    move-result p1

    .line 186
    if-eqz p1, :cond_c

    .line 187
    .line 188
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 189
    .line 190
    .line 191
    move-result-object v3

    .line 192
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    .line 193
    .line 194
    .line 195
    move-result-object v4

    .line 196
    const-string p1, "_data"

    .line 197
    .line 198
    filled-new-array {p1}, [Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object v5

    .line 202
    const/4 v7, 0x0

    .line 203
    const/4 v8, 0x0

    .line 204
    const/4 v6, 0x0

    .line 205
    invoke-virtual/range {v3 .. v8}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    .line 206
    .line 207
    .line 208
    move-result-object p1

    .line 209
    if-eqz p1, :cond_b

    .line 210
    .line 211
    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    .line 212
    .line 213
    .line 214
    move-result p2

    .line 215
    if-eqz p2, :cond_b

    .line 216
    .line 217
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 218
    .line 219
    .line 220
    move-result-object p2

    .line 221
    goto :goto_2

    .line 222
    :cond_b
    move-object p2, v2

    .line 223
    :goto_2
    sput-object p2, Lcom/p1/mobile/android/app/Act;->tempFileName:Ljava/lang/String;

    .line 224
    .line 225
    if-eqz p1, :cond_c

    .line 226
    .line 227
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    .line 228
    .line 229
    .line 230
    :cond_c
    sget-object p1, Lcom/p1/mobile/android/app/Act;->tempFileName:Ljava/lang/String;

    .line 231
    .line 232
    if-eqz p1, :cond_f

    .line 233
    .line 234
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->onRecordVideoResult(Ljava/lang/String;)V

    .line 235
    .line 236
    .line 237
    sput-object v2, Lcom/p1/mobile/android/app/Act;->tempFileName:Ljava/lang/String;

    .line 238
    .line 239
    return-void

    .line 240
    :cond_d
    const/16 v0, 0x4000

    .line 241
    .line 242
    if-ne p1, v0, :cond_e

    .line 243
    .line 244
    sget-object p1, Lcom/p1/mobile/android/app/Act;->tempFileName:Ljava/lang/String;

    .line 245
    .line 246
    if-eqz p1, :cond_f

    .line 247
    .line 248
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->onTakePictureResult(Ljava/lang/String;)V

    .line 249
    .line 250
    .line 251
    sput-object v2, Lcom/p1/mobile/android/app/Act;->tempFileName:Ljava/lang/String;

    .line 252
    .line 253
    return-void

    .line 254
    :cond_e
    const/16 v0, 0x6000

    .line 255
    .line 256
    if-ne p1, v0, :cond_10

    .line 257
    .line 258
    const-string p1, "path"

    .line 259
    .line 260
    invoke-virtual {p3, p1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 261
    .line 262
    .line 263
    move-result-object p1

    .line 264
    if-eqz p1, :cond_f

    .line 265
    .line 266
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->onCropImageResult(Ljava/lang/String;)V

    .line 267
    .line 268
    .line 269
    new-instance p1, Ll/w10;

    .line 270
    .line 271
    invoke-direct {p1}, Ll/w10;-><init>()V

    .line 272
    .line 273
    .line 274
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->post(Ljava/lang/Runnable;)V

    .line 275
    .line 276
    .line 277
    :cond_f
    :goto_3
    return-void

    .line 278
    :cond_10
    invoke-super {p0, p1, p2, p3}, Landroidx/fragment/app/FragmentActivity;->onActivityResult(IILandroid/content/Intent;)V

    .line 279
    .line 280
    .line 281
    return-void

    .line 282
    :cond_11
    :try_start_0
    invoke-super {p0, p1, p2, p3}, Landroidx/fragment/app/FragmentActivity;->onActivityResult(IILandroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 283
    .line 284
    .line 285
    return-void

    .line 286
    :catch_0
    move-exception v0

    .line 287
    move-object p0, v0

    .line 288
    const-string p1, "Task is already complete"

    .line 289
    .line 290
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 291
    .line 292
    .line 293
    move-result-object p2

    .line 294
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 295
    .line 296
    .line 297
    move-result p1

    .line 298
    if-eqz p1, :cond_12

    .line 299
    .line 300
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 301
    .line 302
    .line 303
    return-void

    .line 304
    :cond_12
    throw p0
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    invoke-static {p1}, Ll/bnl0;->G0(Z)I

    .line 6
    .line 7
    .line 8
    invoke-static {p0}, Ll/bnl0;->x0(Landroid/content/Context;)I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    iput p1, p0, Lcom/p1/mobile/android/app/Act;->screenHeight:I

    .line 13
    .line 14
    invoke-static {p0}, Ll/bnl0;->z0(Landroid/content/Context;)I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    iput p1, p0, Lcom/p1/mobile/android/app/Act;->screenWidth:I

    .line 19
    .line 20
    invoke-static {p1}, Ll/lo5;->d(I)Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    const/16 p1, 0x168

    .line 27
    .line 28
    invoke-static {p0, p1}, Ll/lo5;->c(Landroid/content/Context;I)V

    .line 29
    .line 30
    .line 31
    sget-object p0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 32
    .line 33
    invoke-static {p0, p1}, Ll/lo5;->c(Landroid/content/Context;I)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    invoke-static {p0}, Ll/lo5;->b(Landroid/content/Context;)V

    .line 38
    .line 39
    .line 40
    sget-object p0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 41
    .line 42
    invoke-static {p0}, Ll/lo5;->b(Landroid/content/Context;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public final onCreate(Landroid/os/Bundle;)V
    .locals 6
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/android/app/Act;->fixSavedInstanceState(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    const/4 v1, 0x0

    .line 6
    :try_start_0
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 7
    .line 8
    .line 9
    move-result-object v2

    .line 10
    const-string v3, "tanker_savedInstanceState"

    .line 11
    .line 12
    invoke-virtual {v2, v3}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    check-cast v2, Landroid/os/Bundle;

    .line 17
    .line 18
    iput-object v2, p0, Lcom/p1/mobile/android/app/Act;->savedInstanceStateCache:Landroid/os/Bundle;

    .line 19
    .line 20
    invoke-direct {p0, v2}, Lcom/p1/mobile/android/app/Act;->fixSavedInstanceState(Landroid/os/Bundle;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->checkSavedInstanceStateAndCache(Landroid/os/Bundle;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 24
    .line 25
    .line 26
    move v2, v1

    .line 27
    goto :goto_0

    .line 28
    :catch_0
    move-exception v2

    .line 29
    new-instance v3, Ljava/lang/IllegalArgumentException;

    .line 30
    .line 31
    new-instance v4, Ljava/lang/StringBuilder;

    .line 32
    .line 33
    const-string v5, "Act getParcelableExtra error \uff0cact = "

    .line 34
    .line 35
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v4

    .line 45
    invoke-direct {v3, v4, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 46
    .line 47
    .line 48
    const/16 v2, 0x3e8

    .line 49
    .line 50
    invoke-static {v3, v2}, Lcom/tantanapp/common/utils/CrashHelper;->d(Ljava/lang/Throwable;I)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->onReadIntentError()V

    .line 54
    .line 55
    .line 56
    move v2, v0

    .line 57
    :goto_0
    if-nez p1, :cond_0

    .line 58
    .line 59
    iget-object v3, p0, Lcom/p1/mobile/android/app/Act;->savedInstanceStateCache:Landroid/os/Bundle;

    .line 60
    .line 61
    if-eqz v3, :cond_0

    .line 62
    .line 63
    iput-boolean v0, p0, Lcom/p1/mobile/android/app/Act;->callOnRestoreInstanceState:Z

    .line 64
    .line 65
    move-object p1, v3

    .line 66
    :cond_0
    sput-boolean v1, Lcom/p1/mobile/android/app/Act;->isActResumed:Z

    .line 67
    .line 68
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 69
    .line 70
    const/16 v4, 0x1a

    .line 71
    .line 72
    if-ne v3, v4, :cond_1

    .line 73
    .line 74
    invoke-direct {p0}, Lcom/p1/mobile/android/app/Act;->isTranslucentOrFloating()Z

    .line 75
    .line 76
    .line 77
    move-result v3

    .line 78
    if-eqz v3, :cond_1

    .line 79
    .line 80
    invoke-direct {p0}, Lcom/p1/mobile/android/app/Act;->fixOrientation()Z

    .line 81
    .line 82
    .line 83
    :cond_1
    if-nez v2, :cond_3

    .line 84
    .line 85
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->shouldBlockOnCreate(Landroid/os/Bundle;)Z

    .line 86
    .line 87
    .line 88
    move-result v2

    .line 89
    if-eqz v2, :cond_2

    .line 90
    .line 91
    goto :goto_1

    .line 92
    :cond_2
    move v2, v1

    .line 93
    goto :goto_2

    .line 94
    :cond_3
    :goto_1
    move v2, v0

    .line 95
    :goto_2
    iput-boolean v2, p0, Lcom/p1/mobile/android/app/Act;->hasBlockOnCreate:Z

    .line 96
    .line 97
    const/4 v3, 0x0

    .line 98
    if-eqz v2, :cond_5

    .line 99
    .line 100
    if-eqz p1, :cond_4

    .line 101
    .line 102
    const-string v0, "android:fragments"

    .line 103
    .line 104
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    const-string v0, "android:support:fragments"

    .line 108
    .line 109
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    iput-boolean v1, p0, Lcom/p1/mobile/android/app/Act;->callOnRestoreInstanceState:Z

    .line 113
    .line 114
    iput-object v3, p0, Lcom/p1/mobile/android/app/Act;->savedInstanceStateCache:Landroid/os/Bundle;

    .line 115
    .line 116
    :cond_4
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 117
    .line 118
    .line 119
    invoke-direct {p0}, Lcom/p1/mobile/android/app/Act;->actualFinish()V

    .line 120
    .line 121
    .line 122
    return-void

    .line 123
    :cond_5
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 124
    .line 125
    .line 126
    move-result-object v2

    .line 127
    invoke-virtual {v2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    .line 128
    .line 129
    .line 130
    move-result-object v2

    .line 131
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 132
    .line 133
    .line 134
    move-result-object v4

    .line 135
    invoke-virtual {v4}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v4

    .line 139
    const-string v5, ",onCreate getIntent"

    .line 140
    .line 141
    invoke-virtual {v4, v5}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object v4

    .line 145
    invoke-static {v2, v4}, Ll/vi3;->a(Landroid/os/Bundle;Ljava/lang/String;)V

    .line 146
    .line 147
    .line 148
    if-eqz p1, :cond_6

    .line 149
    .line 150
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 151
    .line 152
    .line 153
    move-result-object v2

    .line 154
    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object v2

    .line 158
    const-string v4, ",onCreate sis"

    .line 159
    .line 160
    invoke-virtual {v2, v4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object v2

    .line 164
    invoke-static {p1, v2}, Ll/vi3;->a(Landroid/os/Bundle;Ljava/lang/String;)V

    .line 165
    .line 166
    .line 167
    const-string v2, ".global_state"

    .line 168
    .line 169
    invoke-virtual {p1, v2}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    .line 170
    .line 171
    .line 172
    move-result-object v2

    .line 173
    if-eqz v2, :cond_6

    .line 174
    .line 175
    invoke-virtual {p0, v2}, Lcom/p1/mobile/android/app/Act;->onRestoreGlobalState(Landroid/os/Bundle;)V

    .line 176
    .line 177
    .line 178
    :cond_6
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->initDataOnCreate()V

    .line 179
    .line 180
    .line 181
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->initSubscription()V

    .line 182
    .line 183
    .line 184
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->setTheme()V

    .line 185
    .line 186
    .line 187
    sget-boolean v2, Lcom/p1/mobile/android/app/Act;->SWIPE_BACK_SUPPORTED:Z

    .line 188
    .line 189
    if-eqz v2, :cond_7

    .line 190
    .line 191
    invoke-static {p0}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->w(Lcom/p1/mobile/android/app/Act;)Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 192
    .line 193
    .line 194
    move-result-object v2

    .line 195
    iput-object v2, p0, Lcom/p1/mobile/android/app/Act;->swipeBack:Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 196
    .line 197
    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    .line 198
    .line 199
    .line 200
    move-result-object v2

    .line 201
    const v4, 0x1010451

    .line 202
    .line 203
    .line 204
    filled-new-array {v4}, [I

    .line 205
    .line 206
    .line 207
    move-result-object v4

    .line 208
    invoke-virtual {v2, v4}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    .line 209
    .line 210
    .line 211
    move-result-object v2

    .line 212
    invoke-virtual {v2, v1, v1}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 213
    .line 214
    .line 215
    move-result v4

    .line 216
    invoke-virtual {v2}, Landroid/content/res/TypedArray;->recycle()V

    .line 217
    .line 218
    .line 219
    iget-object v2, p0, Lcom/p1/mobile/android/app/Act;->swipeBack:Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 220
    .line 221
    invoke-virtual {v2, v4}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->B(I)Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 222
    .line 223
    .line 224
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 225
    .line 226
    .line 227
    move-result-object v2

    .line 228
    invoke-virtual {v2, v1}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 229
    .line 230
    .line 231
    :cond_7
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 232
    .line 233
    .line 234
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 235
    .line 236
    .line 237
    move-result-object v2

    .line 238
    iput-object v2, p0, Lcom/p1/mobile/android/app/Act;->res:Landroid/content/res/Resources;

    .line 239
    .line 240
    invoke-static {p0}, Ll/bnl0;->x0(Landroid/content/Context;)I

    .line 241
    .line 242
    .line 243
    move-result v2

    .line 244
    iput v2, p0, Lcom/p1/mobile/android/app/Act;->screenHeight:I

    .line 245
    .line 246
    invoke-static {p0}, Ll/bnl0;->z0(Landroid/content/Context;)I

    .line 247
    .line 248
    .line 249
    move-result v2

    .line 250
    iput v2, p0, Lcom/p1/mobile/android/app/Act;->screenWidth:I

    .line 251
    .line 252
    invoke-static {v2}, Ll/lo5;->d(I)Z

    .line 253
    .line 254
    .line 255
    move-result v2

    .line 256
    if-eqz v2, :cond_8

    .line 257
    .line 258
    const/16 v2, 0x168

    .line 259
    .line 260
    invoke-static {p0, v2}, Ll/lo5;->c(Landroid/content/Context;I)V

    .line 261
    .line 262
    .line 263
    sget-object v4, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 264
    .line 265
    invoke-static {v4, v2}, Ll/lo5;->c(Landroid/content/Context;I)V

    .line 266
    .line 267
    .line 268
    goto :goto_3

    .line 269
    :cond_8
    invoke-static {p0}, Ll/lo5;->b(Landroid/content/Context;)V

    .line 270
    .line 271
    .line 272
    sget-object v2, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 273
    .line 274
    invoke-static {v2}, Ll/lo5;->b(Landroid/content/Context;)V

    .line 275
    .line 276
    .line 277
    :goto_3
    sget-boolean v2, Lcom/p1/mobile/android/app/b;->a:Z

    .line 278
    .line 279
    if-eqz v2, :cond_9

    .line 280
    .line 281
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 282
    .line 283
    .line 284
    move-result-object v2

    .line 285
    invoke-virtual {v2}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 286
    .line 287
    .line 288
    move-result-object v2

    .line 289
    invoke-virtual {v2}, Landroid/view/View;->getRootView()Landroid/view/View;

    .line 290
    .line 291
    .line 292
    move-result-object v2

    .line 293
    invoke-virtual {v2}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 294
    .line 295
    .line 296
    move-result-object v2

    .line 297
    new-instance v4, Lcom/p1/mobile/android/app/b$a;

    .line 298
    .line 299
    invoke-direct {v4}, Lcom/p1/mobile/android/app/b$a;-><init>()V

    .line 300
    .line 301
    .line 302
    invoke-virtual {v2, v4}, Landroid/view/ViewTreeObserver;->addOnGlobalFocusChangeListener(Landroid/view/ViewTreeObserver$OnGlobalFocusChangeListener;)V

    .line 303
    .line 304
    .line 305
    :cond_9
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->initTransitionCreate()V

    .line 306
    .line 307
    .line 308
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->initPartTransitionCreate()V

    .line 309
    .line 310
    .line 311
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->preCreateView(Landroid/os/Bundle;)V

    .line 312
    .line 313
    .line 314
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 315
    .line 316
    .line 317
    move-result v2

    .line 318
    if-eqz v2, :cond_a

    .line 319
    .line 320
    return-void

    .line 321
    :cond_a
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 322
    .line 323
    .line 324
    move-result-object v2

    .line 325
    if-eqz v2, :cond_d

    .line 326
    .line 327
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 328
    .line 329
    .line 330
    move-result-object v2

    .line 331
    invoke-virtual {v2, v0}, Ll/c30;->w(Z)V

    .line 332
    .line 333
    .line 334
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 335
    .line 336
    .line 337
    move-result-object v2

    .line 338
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 339
    .line 340
    .line 341
    move-result-object v4

    .line 342
    invoke-virtual {v4}, Ll/c30;->j()F

    .line 343
    .line 344
    .line 345
    move-result v4

    .line 346
    const/high16 v5, 0x40000000    # 2.0f

    .line 347
    .line 348
    div-float/2addr v4, v5

    .line 349
    invoke-virtual {v2, v4}, Ll/c30;->A(F)V

    .line 350
    .line 351
    .line 352
    :try_start_1
    sget-object v2, Lcom/p1/mobile/android/app/Act;->TOOLBAR_NAV_BUTTON_VIEW_FIELD:Ljava/lang/reflect/Field;

    .line 353
    .line 354
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->toolbar()Landroidx/appcompat/widget/Toolbar;

    .line 355
    .line 356
    .line 357
    move-result-object v4

    .line 358
    invoke-virtual {v2, v4}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 359
    .line 360
    .line 361
    move-result-object v2

    .line 362
    check-cast v2, Landroid/view/View;

    .line 363
    .line 364
    if-eqz v2, :cond_b

    .line 365
    .line 366
    invoke-virtual {v2, v1}, Landroid/view/View;->setFocusable(Z)V

    .line 367
    .line 368
    .line 369
    goto :goto_4

    .line 370
    :catch_1
    move-exception v2

    .line 371
    goto :goto_5

    .line 372
    :cond_b
    :goto_4
    sget-object v4, Lcom/p1/mobile/android/app/Act;->TOOLBAR_TITLE_VIEW_FILED:Ljava/lang/reflect/Field;

    .line 373
    .line 374
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->toolbar()Landroidx/appcompat/widget/Toolbar;

    .line 375
    .line 376
    .line 377
    move-result-object v5

    .line 378
    invoke-virtual {v4, v5}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 379
    .line 380
    .line 381
    move-result-object v4

    .line 382
    check-cast v4, Landroid/widget/TextView;

    .line 383
    .line 384
    if-eqz v4, :cond_c

    .line 385
    .line 386
    const/4 v5, 0x3

    .line 387
    invoke-static {v5}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 388
    .line 389
    .line 390
    move-result-object v5

    .line 391
    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 392
    .line 393
    .line 394
    :cond_c
    const/high16 v4, 0x42600000    # 56.0f

    .line 395
    .line 396
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 397
    .line 398
    .line 399
    move-result v4

    .line 400
    invoke-virtual {v2, v4}, Landroid/view/View;->setMinimumWidth(I)V

    .line 401
    .line 402
    .line 403
    sget-boolean v4, Lcom/p1/mobile/android/app/Act;->debugShowMenu:Z

    .line 404
    .line 405
    if-eqz v4, :cond_d

    .line 406
    .line 407
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 408
    .line 409
    .line 410
    move-result-object v4

    .line 411
    if-eqz v4, :cond_d

    .line 412
    .line 413
    new-instance v4, Ll/j10;

    .line 414
    .line 415
    invoke-direct {v4, p0}, Ll/j10;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 416
    .line 417
    .line 418
    invoke-virtual {v2, v4}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V
    :try_end_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_1

    .line 419
    .line 420
    .line 421
    goto :goto_6

    .line 422
    :goto_5
    invoke-static {v2}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 423
    .line 424
    .line 425
    :cond_d
    :goto_6
    sget-boolean v2, Lcom/p1/mobile/android/app/App;->b:Z

    .line 426
    .line 427
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 428
    .line 429
    .line 430
    move-result-wide v4

    .line 431
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 432
    .line 433
    .line 434
    move-result-object v2

    .line 435
    invoke-virtual {p0, v2, v3}, Lcom/p1/mobile/android/app/Act;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 436
    .line 437
    .line 438
    move-result-object v2

    .line 439
    invoke-virtual {p0, v4, v5}, Lcom/p1/mobile/android/app/Act;->monitorInflateViewCost(J)V

    .line 440
    .line 441
    .line 442
    invoke-direct {p0}, Lcom/p1/mobile/android/app/Act;->setWindowContentOverlayCompat()V

    .line 443
    .line 444
    .line 445
    if-eqz v2, :cond_e

    .line 446
    .line 447
    invoke-virtual {p0, v2}, Landroidx/appcompat/app/AppCompatActivity;->setContentView(Landroid/view/View;)V

    .line 448
    .line 449
    .line 450
    :cond_e
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 451
    .line 452
    .line 453
    move-result-object v3

    .line 454
    new-instance v4, Ll/k10;

    .line 455
    .line 456
    invoke-direct {v4, p0}, Ll/k10;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 457
    .line 458
    .line 459
    invoke-virtual {v3, v4}, Lrx/c;->subscribe(Ll/y20;)Ll/kcg0;

    .line 460
    .line 461
    .line 462
    iget-object v3, p0, Lcom/p1/mobile/android/app/Act;->lifecycleSubject:Lrx/subjects/a;

    .line 463
    .line 464
    new-instance v4, Lcom/p1/mobile/android/app/c$a;

    .line 465
    .line 466
    invoke-direct {v4, p1}, Lcom/p1/mobile/android/app/c$a;-><init>(Landroid/os/Bundle;)V

    .line 467
    .line 468
    .line 469
    invoke-virtual {v3, v4}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 470
    .line 471
    .line 472
    iget-object p1, p0, Lcom/p1/mobile/android/app/Act;->lifecycleSubject:Lrx/subjects/a;

    .line 473
    .line 474
    sget-object v3, Lcom/p1/mobile/android/app/c;->f:Lcom/p1/mobile/android/app/c;

    .line 475
    .line 476
    invoke-virtual {p1, v3}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 477
    .line 478
    .line 479
    if-eqz v2, :cond_f

    .line 480
    .line 481
    new-instance p1, Lcom/p1/mobile/android/app/Act$j;

    .line 482
    .line 483
    invoke-direct {p1, p0}, Lcom/p1/mobile/android/app/Act$j;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 484
    .line 485
    .line 486
    invoke-virtual {v2, p1}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 487
    .line 488
    .line 489
    invoke-static {v2}, Ll/kkl0;->O(Landroid/view/View;)Z

    .line 490
    .line 491
    .line 492
    move-result p1

    .line 493
    if-eqz p1, :cond_f

    .line 494
    .line 495
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->possiblyResizeChildOfContent()V

    .line 496
    .line 497
    .line 498
    :cond_f
    invoke-virtual {p0}, Landroid/app/Activity;->getTaskId()I

    .line 499
    .line 500
    .line 501
    move-result p1

    .line 502
    sget-object v2, Lcom/p1/mobile/android/app/Act;->acts:Ljava/util/HashMap;

    .line 503
    .line 504
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 505
    .line 506
    .line 507
    move-result-object v3

    .line 508
    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 509
    .line 510
    .line 511
    move-result-object v2

    .line 512
    check-cast v2, Ljava/util/ArrayList;

    .line 513
    .line 514
    if-nez v2, :cond_10

    .line 515
    .line 516
    new-instance v2, Ljava/util/ArrayList;

    .line 517
    .line 518
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 519
    .line 520
    .line 521
    sget-object v3, Lcom/p1/mobile/android/app/Act;->acts:Ljava/util/HashMap;

    .line 522
    .line 523
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 524
    .line 525
    .line 526
    move-result-object p1

    .line 527
    invoke-virtual {v3, p1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 528
    .line 529
    .line 530
    :cond_10
    new-instance p1, Lcom/p1/mobile/android/app/Act$r;

    .line 531
    .line 532
    invoke-direct {p1}, Lcom/p1/mobile/android/app/Act$r;-><init>()V

    .line 533
    .line 534
    .line 535
    new-instance v3, Ljava/lang/ref/WeakReference;

    .line 536
    .line 537
    invoke-direct {v3, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 538
    .line 539
    .line 540
    iput-object v3, p1, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 541
    .line 542
    sget-object v3, Lcom/p1/mobile/android/app/c;->f:Lcom/p1/mobile/android/app/c;

    .line 543
    .line 544
    iput-object v3, p1, Lcom/p1/mobile/android/app/Act$r;->b:Lcom/p1/mobile/android/app/c;

    .line 545
    .line 546
    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 547
    .line 548
    .line 549
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->changeGlobalLifecycleStates()V

    .line 550
    .line 551
    .line 552
    new-instance p1, Lcom/p1/mobile/android/statistic/AutoSpeedCustomView;

    .line 553
    .line 554
    invoke-direct {p1, p0}, Lcom/p1/mobile/android/statistic/AutoSpeedCustomView;-><init>(Landroid/content/Context;)V

    .line 555
    .line 556
    .line 557
    new-instance v2, Landroid/view/ViewGroup$LayoutParams;

    .line 558
    .line 559
    invoke-direct {v2, v0, v0}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 560
    .line 561
    .line 562
    invoke-virtual {p1, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 563
    .line 564
    .line 565
    invoke-virtual {p1, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 566
    .line 567
    .line 568
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 569
    .line 570
    .line 571
    move-result-object p0

    .line 572
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 573
    .line 574
    .line 575
    move-result-object p0

    .line 576
    check-cast p0, Landroid/view/ViewGroup;

    .line 577
    .line 578
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 579
    .line 580
    .line 581
    return-void
.end method

.method public onCropImageResult(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public final onDestroy()V
    .locals 4
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/android/app/Act;->hasBlockOnCreate:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onDestroy()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->lifecycleSubject:Lrx/subjects/a;

    .line 10
    .line 11
    sget-object v1, Lcom/p1/mobile/android/app/c;->m:Lcom/p1/mobile/android/app/c;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->lifecycleSubject:Lrx/subjects/a;

    .line 17
    .line 18
    invoke-virtual {v0}, Lrx/subjects/a;->onCompleted()V

    .line 19
    .line 20
    .line 21
    sget-object v0, Lcom/p1/mobile/android/app/Act;->acts:Ljava/util/HashMap;

    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const/4 v1, 0x0

    .line 32
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    if-eqz v2, :cond_3

    .line 37
    .line 38
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    check-cast v2, Ljava/util/ArrayList;

    .line 43
    .line 44
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    :cond_2
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 49
    .line 50
    .line 51
    move-result v3

    .line 52
    if-eqz v3, :cond_1

    .line 53
    .line 54
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    check-cast v3, Lcom/p1/mobile/android/app/Act$r;

    .line 59
    .line 60
    iget-object v3, v3, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 61
    .line 62
    invoke-virtual {v3}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    if-ne v3, p0, :cond_2

    .line 67
    .line 68
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    .line 69
    .line 70
    .line 71
    const/4 v1, 0x1

    .line 72
    goto :goto_0

    .line 73
    :cond_3
    if-eqz v1, :cond_4

    .line 74
    .line 75
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->changeGlobalLifecycleStates()V

    .line 76
    .line 77
    .line 78
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->progressDialog:Landroid/app/Dialog;

    .line 79
    .line 80
    if-eqz v0, :cond_5

    .line 81
    .line 82
    :try_start_0
    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 83
    .line 84
    .line 85
    goto :goto_1

    .line 86
    :catch_0
    move-exception v0

    .line 87
    new-instance v1, Ljava/lang/Exception;

    .line 88
    .line 89
    new-instance v2, Ljava/lang/StringBuilder;

    .line 90
    .line 91
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 92
    .line 93
    .line 94
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 95
    .line 96
    .line 97
    move-result-object v3

    .line 98
    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v3

    .line 102
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    const-string v3, " onDestroy: "

    .line 106
    .line 107
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v3

    .line 114
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v2

    .line 121
    invoke-direct {v1, v2, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 122
    .line 123
    .line 124
    invoke-static {v1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 125
    .line 126
    .line 127
    :cond_5
    :goto_1
    sget-boolean v0, Lcom/p1/mobile/android/app/Act;->SWIPE_BACK_SUPPORTED:Z

    .line 128
    .line 129
    if-eqz v0, :cond_6

    .line 130
    .line 131
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->swipeBack:Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 132
    .line 133
    if-eqz v0, :cond_6

    .line 134
    .line 135
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->x()V

    .line 136
    .line 137
    .line 138
    :cond_6
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->onDestroyLifecycle()V

    .line 139
    .line 140
    .line 141
    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onDestroy()V

    .line 142
    .line 143
    .line 144
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->afterDestroyLivecycle()V

    .line 145
    .line 146
    .line 147
    return-void
.end method

.method public onDestroyLifecycle()V
    .locals 2
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .line 1
    sget-boolean v0, Lcom/p1/mobile/android/app/Act;->isFromBackStack:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 6
    .line 7
    invoke-static {v0}, Ll/l51;->A(Landroid/content/Context;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    sput-boolean v0, Lcom/p1/mobile/android/app/Act;->isFromDestoryed:Z

    .line 15
    .line 16
    invoke-static {}, Ll/srf;->a()Ll/srf;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sget-object v1, Lcom/p1/mobile/android/app/ExtraActLifecycle;->onDestroyToBackground:Lcom/p1/mobile/android/app/ExtraActLifecycle;

    .line 21
    .line 22
    invoke-virtual {v0, v1, p0}, Ll/srf;->c(Lcom/p1/mobile/android/app/ExtraActLifecycle;Lcom/p1/mobile/android/app/Act;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public onDialogAttachToWindow(Landroid/app/Dialog;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->showingDialogList:Ljava/util/List;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/android/app/Act;->showingDialogList:Ljava/util/List;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->showingDialogList:Ljava/util/List;

    .line 13
    .line 14
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 15
    .line 16
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public onDialogDetachFromWindow(Landroid/app/Dialog;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->showingDialogList:Ljava/util/List;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v1, Ll/f10;

    .line 6
    .line 7
    invoke-direct {v1, p1}, Ll/f10;-><init>(Landroid/app/Dialog;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    check-cast p1, Ljava/lang/ref/WeakReference;

    .line 15
    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->showingDialogList:Ljava/util/List;

    .line 19
    .line 20
    invoke-interface {p0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public onDialogDismissExtra(Ll/x20;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->isDialogShowing()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->showingDialogList:Ljava/util/List;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Ljava/lang/ref/WeakReference;

    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Landroid/app/Dialog;

    .line 21
    .line 22
    instance-of v0, v0, Lcom/p1/mobile/android/app/Dialog;

    .line 23
    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->showingDialogList:Ljava/util/List;

    .line 27
    .line 28
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    check-cast p0, Ljava/lang/ref/WeakReference;

    .line 33
    .line 34
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    check-cast p0, Lcom/p1/mobile/android/app/Dialog;

    .line 39
    .line 40
    iget-object p0, p0, Ll/g1e;->i:Lrx/subjects/b;

    .line 41
    .line 42
    new-instance v0, Ll/d20;

    .line 43
    .line 44
    invoke-direct {v0}, Ll/d20;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    const/4 v0, 0x1

    .line 52
    invoke-virtual {p0, v0}, Lrx/c;->take(I)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    new-instance v0, Ll/e20;

    .line 57
    .line 58
    invoke-direct {v0, p1}, Ll/e20;-><init>(Ll/x20;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/y20;)Ll/kcg0;

    .line 62
    .line 63
    .line 64
    :cond_0
    return-void
.end method

.method public onHomePressed()V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/android/app/Act;->defaultOnHomePressed(Landroid/app/Activity;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onNewIntent(Landroid/content/Intent;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroidx/fragment/app/FragmentActivity;->onNewIntent(Landroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/srf;->a()Ll/srf;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    sget-object v0, Lcom/p1/mobile/android/app/ExtraActLifecycle;->onNewIntent:Lcom/p1/mobile/android/app/ExtraActLifecycle;

    .line 9
    .line 10
    invoke-virtual {p1, v0, p0}, Ll/srf;->c(Lcom/p1/mobile/android/app/ExtraActLifecycle;Lcom/p1/mobile/android/app/Act;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2

    .line 1
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const v1, 0x102002c

    .line 6
    .line 7
    .line 8
    if-ne v0, v1, :cond_0

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->onHomePressed()V

    .line 13
    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    invoke-super {p0, p1}, Landroid/app/Activity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method

.method public final onPause()V
    .locals 6
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/android/app/Act;->hasBlockOnResume:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-super {p0}, Landroidx/fragment/app/FragmentActivity;->onPause()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->lifecycleSubject:Lrx/subjects/a;

    .line 10
    .line 11
    sget-object v1, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    sget-object v0, Lcom/p1/mobile/android/app/Act;->acts:Ljava/util/HashMap;

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const/4 v1, 0x0

    .line 27
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-eqz v2, :cond_3

    .line 32
    .line 33
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    check-cast v2, Ljava/util/ArrayList;

    .line 38
    .line 39
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    :cond_2
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    if-eqz v3, :cond_1

    .line 48
    .line 49
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    check-cast v3, Lcom/p1/mobile/android/app/Act$r;

    .line 54
    .line 55
    iget-object v4, v3, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 56
    .line 57
    invoke-virtual {v4}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v4

    .line 61
    if-ne v4, p0, :cond_2

    .line 62
    .line 63
    sget-object v1, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 64
    .line 65
    iput-object v1, v3, Lcom/p1/mobile/android/app/Act$r;->b:Lcom/p1/mobile/android/app/c;

    .line 66
    .line 67
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 68
    .line 69
    .line 70
    move-result-wide v4

    .line 71
    iput-wide v4, v3, Lcom/p1/mobile/android/app/Act$r;->c:J

    .line 72
    .line 73
    const/4 v1, 0x1

    .line 74
    goto :goto_0

    .line 75
    :cond_3
    if-eqz v1, :cond_4

    .line 76
    .line 77
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->changeGlobalLifecycleStates()V

    .line 78
    .line 79
    .line 80
    :cond_4
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->onPauseLifecycle()V

    .line 81
    .line 82
    .line 83
    invoke-super {p0}, Landroidx/fragment/app/FragmentActivity;->onPause()V

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method public onPauseLifecycle()V
    .locals 0
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    return-void
.end method

.method public onPickImagesSystemResult(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    return-void
.end method

.method public onPickVideoSystemResult(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public onPostCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/android/app/Act;->callOnRestoreInstanceState:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Lcom/p1/mobile/android/app/Act;->savedInstanceStateCache:Landroid/os/Bundle;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Landroid/app/Activity;->onRestoreInstanceState(Landroid/os/Bundle;)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Lcom/p1/mobile/android/app/Act;->savedInstanceStateCache:Landroid/os/Bundle;

    .line 11
    .line 12
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onPostCreate(Landroid/os/Bundle;)V

    .line 13
    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    iput-boolean p1, p0, Lcom/p1/mobile/android/app/Act;->callOnRestoreInstanceState:Z

    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    iput-object p1, p0, Lcom/p1/mobile/android/app/Act;->savedInstanceStateCache:Landroid/os/Bundle;

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onPostCreate(Landroid/os/Bundle;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    sget-boolean p1, Lcom/p1/mobile/android/app/Act;->SWIPE_BACK_SUPPORTED:Z

    .line 26
    .line 27
    if-eqz p1, :cond_1

    .line 28
    .line 29
    iget-object p1, p0, Lcom/p1/mobile/android/app/Act;->swipeBack:Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 30
    .line 31
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->r()V

    .line 32
    .line 33
    .line 34
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->initTransitionPostCreate()V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->initPartTransitionPostCreate()V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)Z
    .locals 8

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->actionMenuView:Landroidx/appcompat/widget/ActionMenuView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/android/app/Act;->TOOLBAR_MENU_VIEW_FILED:Ljava/lang/reflect/Field;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->toolbar()Landroidx/appcompat/widget/Toolbar;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Landroidx/appcompat/widget/ActionMenuView;

    .line 16
    .line 17
    iput-object v0, p0, Lcom/p1/mobile/android/app/Act;->actionMenuView:Landroidx/appcompat/widget/ActionMenuView;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catch_0
    move-exception v0

    .line 21
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->actionMenuView:Landroidx/appcompat/widget/ActionMenuView;

    .line 25
    .line 26
    if-eqz v0, :cond_9

    .line 27
    .line 28
    const/high16 v0, 0x41000000    # 8.0f

    .line 29
    .line 30
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz p1, :cond_1

    .line 35
    .line 36
    move-object v1, p1

    .line 37
    check-cast v1, Landroidx/appcompat/view/menu/MenuBuilder;

    .line 38
    .line 39
    invoke-virtual {v1}, Landroidx/appcompat/view/menu/MenuBuilder;->getNonActionItems()Ljava/util/ArrayList;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    goto :goto_1

    .line 44
    :cond_1
    const/4 v1, 0x0

    .line 45
    :goto_1
    const/4 v2, 0x1

    .line 46
    const/4 v3, 0x0

    .line 47
    if-eqz v1, :cond_3

    .line 48
    .line 49
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 50
    .line 51
    .line 52
    move-result v4

    .line 53
    if-ne v4, v2, :cond_2

    .line 54
    .line 55
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    check-cast v1, Landroidx/appcompat/view/menu/MenuItemImpl;

    .line 60
    .line 61
    invoke-virtual {v1}, Landroidx/appcompat/view/menu/MenuItemImpl;->isActionViewExpanded()Z

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    xor-int/2addr v1, v2

    .line 66
    goto :goto_2

    .line 67
    :cond_2
    if-lez v4, :cond_3

    .line 68
    .line 69
    move v1, v2

    .line 70
    goto :goto_2

    .line 71
    :cond_3
    move v1, v3

    .line 72
    :goto_2
    if-nez v1, :cond_8

    .line 73
    .line 74
    invoke-interface {p1}, Landroid/view/Menu;->size()I

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    move v4, v3

    .line 79
    move v5, v4

    .line 80
    :goto_3
    if-ge v4, v1, :cond_6

    .line 81
    .line 82
    invoke-interface {p1, v4}, Landroid/view/Menu;->getItem(I)Landroid/view/MenuItem;

    .line 83
    .line 84
    .line 85
    move-result-object v6

    .line 86
    invoke-interface {v6}, Landroid/view/MenuItem;->isVisible()Z

    .line 87
    .line 88
    .line 89
    move-result v7

    .line 90
    if-eqz v7, :cond_5

    .line 91
    .line 92
    invoke-interface {v6}, Landroid/view/MenuItem;->getIcon()Landroid/graphics/drawable/Drawable;

    .line 93
    .line 94
    .line 95
    move-result-object v7

    .line 96
    if-nez v7, :cond_4

    .line 97
    .line 98
    invoke-interface {v6}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    .line 99
    .line 100
    .line 101
    move-result-object v6

    .line 102
    if-eqz v6, :cond_5

    .line 103
    .line 104
    :cond_4
    move v5, v2

    .line 105
    :cond_5
    add-int/lit8 v4, v4, 0x1

    .line 106
    .line 107
    goto :goto_3

    .line 108
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/android/app/Act;->actionMenuView:Landroidx/appcompat/widget/ActionMenuView;

    .line 109
    .line 110
    if-nez v5, :cond_7

    .line 111
    .line 112
    invoke-virtual {v1, v3, v3, v0, v3}, Landroid/view/View;->setPadding(IIII)V

    .line 113
    .line 114
    .line 115
    goto :goto_4

    .line 116
    :cond_7
    invoke-virtual {v1, v3, v3, v3, v3}, Landroid/view/View;->setPadding(IIII)V

    .line 117
    .line 118
    .line 119
    goto :goto_4

    .line 120
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->actionMenuView:Landroidx/appcompat/widget/ActionMenuView;

    .line 121
    .line 122
    invoke-virtual {v0, v3, v3, v3, v3}, Landroid/view/View;->setPadding(IIII)V

    .line 123
    .line 124
    .line 125
    :cond_9
    :goto_4
    invoke-super {p0, p1}, Landroid/app/Activity;->onPrepareOptionsMenu(Landroid/view/Menu;)Z

    .line 126
    .line 127
    .line 128
    move-result p0

    .line 129
    return p0
.end method

.method public onReadIntentError()V
    .locals 0

    return-void
.end method

.method public onRecordVideoResult(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public onRestoreGlobalState(Landroid/os/Bundle;)V
    .locals 0
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    return-void
.end method

.method public final onResume()V
    .locals 6
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->shouldBlockOnResume()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/android/app/Act;->hasBlockOnResume:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-super {p0}, Landroidx/fragment/app/FragmentActivity;->onResume()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->trans:Lcom/p1/mobile/android/app/Act$v;

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    iget-object v0, v0, Lcom/p1/mobile/android/app/Act$v;->a:Ljava/lang/ref/WeakReference;

    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 27
    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->trans:Lcom/p1/mobile/android/app/Act$v;

    .line 31
    .line 32
    iget-object v0, v0, Lcom/p1/mobile/android/app/Act$v;->b:Lcom/p1/mobile/android/app/Act$w;

    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act$w;->f(Lcom/p1/mobile/android/app/Act;)V

    .line 37
    .line 38
    .line 39
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->partTransition:Ll/s20$a;

    .line 40
    .line 41
    if-eqz v0, :cond_2

    .line 42
    .line 43
    iget-object v1, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ll/s20$a;->l(Lcom/p1/mobile/android/app/Act;)V

    .line 46
    .line 47
    .line 48
    :cond_2
    invoke-super {p0}, Landroidx/fragment/app/FragmentActivity;->onResume()V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->lifecycleSubject:Lrx/subjects/a;

    .line 52
    .line 53
    sget-object v1, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 56
    .line 57
    .line 58
    sget-object v0, Lcom/p1/mobile/android/app/Act;->acts:Ljava/util/HashMap;

    .line 59
    .line 60
    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    const/4 v1, 0x0

    .line 69
    :cond_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 70
    .line 71
    .line 72
    move-result v2

    .line 73
    const/4 v3, 0x1

    .line 74
    if-eqz v2, :cond_5

    .line 75
    .line 76
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    check-cast v2, Ljava/util/ArrayList;

    .line 81
    .line 82
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    :cond_4
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 87
    .line 88
    .line 89
    move-result v4

    .line 90
    if-eqz v4, :cond_3

    .line 91
    .line 92
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object v4

    .line 96
    check-cast v4, Lcom/p1/mobile/android/app/Act$r;

    .line 97
    .line 98
    iget-object v5, v4, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 99
    .line 100
    invoke-virtual {v5}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object v5

    .line 104
    if-ne v5, p0, :cond_4

    .line 105
    .line 106
    sget-object v1, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 107
    .line 108
    iput-object v1, v4, Lcom/p1/mobile/android/app/Act$r;->b:Lcom/p1/mobile/android/app/c;

    .line 109
    .line 110
    move v1, v3

    .line 111
    goto :goto_0

    .line 112
    :cond_5
    if-eqz v1, :cond_6

    .line 113
    .line 114
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->changeGlobalLifecycleStates()V

    .line 115
    .line 116
    .line 117
    :cond_6
    sget-object v0, Lcom/p1/mobile/android/app/Act;->backgroundCheckHandler:Landroid/os/Handler;

    .line 118
    .line 119
    const/4 v1, 0x0

    .line 120
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->onResumeLifecycle()V

    .line 124
    .line 125
    .line 126
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->needMarkResume()Z

    .line 127
    .line 128
    .line 129
    move-result p0

    .line 130
    if-eqz p0, :cond_7

    .line 131
    .line 132
    sput-boolean v3, Lcom/p1/mobile/android/app/Act;->isActResumed:Z

    .line 133
    .line 134
    :cond_7
    return-void
.end method

.method public onResumeLifecycle()V
    .locals 2
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .line 1
    sget-boolean v0, Lcom/p1/mobile/android/app/Act;->isInit:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    sget-boolean v0, Lcom/p1/mobile/android/app/Act;->isFromBackStack:Z

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    sget-boolean v0, Lcom/p1/mobile/android/app/Act;->isFromDestoryed:Z

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    sget-boolean v0, Lcom/p1/mobile/android/app/Act;->isFromBackground:Z

    .line 15
    .line 16
    if-eqz v0, :cond_2

    .line 17
    .line 18
    invoke-static {}, Ll/srf;->a()Ll/srf;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    sget-object v1, Lcom/p1/mobile/android/app/ExtraActLifecycle;->onResumeFromBackground:Lcom/p1/mobile/android/app/ExtraActLifecycle;

    .line 23
    .line 24
    invoke-virtual {v0, v1, p0}, Ll/srf;->c(Lcom/p1/mobile/android/app/ExtraActLifecycle;Lcom/p1/mobile/android/app/Act;)V

    .line 25
    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_1
    :goto_0
    invoke-static {}, Ll/srf;->a()Ll/srf;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    sget-object v1, Lcom/p1/mobile/android/app/ExtraActLifecycle;->onResumeFromAppStart:Lcom/p1/mobile/android/app/ExtraActLifecycle;

    .line 33
    .line 34
    invoke-virtual {v0, v1, p0}, Ll/srf;->c(Lcom/p1/mobile/android/app/ExtraActLifecycle;Lcom/p1/mobile/android/app/Act;)V

    .line 35
    .line 36
    .line 37
    :cond_2
    :goto_1
    sget-boolean v0, Lcom/p1/mobile/android/app/Act;->isInit:Z

    .line 38
    .line 39
    if-nez v0, :cond_3

    .line 40
    .line 41
    sget-boolean v0, Lcom/p1/mobile/android/app/Act;->isFromBackStack:Z

    .line 42
    .line 43
    if-nez v0, :cond_3

    .line 44
    .line 45
    sget-boolean v0, Lcom/p1/mobile/android/app/Act;->isFromDestoryed:Z

    .line 46
    .line 47
    if-nez v0, :cond_3

    .line 48
    .line 49
    sget-boolean v0, Lcom/p1/mobile/android/app/Act;->isFromBackground:Z

    .line 50
    .line 51
    if-eqz v0, :cond_4

    .line 52
    .line 53
    :cond_3
    invoke-static {}, Ll/srf;->a()Ll/srf;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    sget-object v1, Lcom/p1/mobile/android/app/ExtraActLifecycle;->onResumeFromAppStartOrBackground:Lcom/p1/mobile/android/app/ExtraActLifecycle;

    .line 58
    .line 59
    invoke-virtual {v0, v1, p0}, Ll/srf;->c(Lcom/p1/mobile/android/app/ExtraActLifecycle;Lcom/p1/mobile/android/app/Act;)V

    .line 60
    .line 61
    .line 62
    :cond_4
    const/4 p0, 0x0

    .line 63
    sput-boolean p0, Lcom/p1/mobile/android/app/Act;->isInit:Z

    .line 64
    .line 65
    sput-boolean p0, Lcom/p1/mobile/android/app/Act;->isFromBackStack:Z

    .line 66
    .line 67
    sput-boolean p0, Lcom/p1/mobile/android/app/Act;->isFromDestoryed:Z

    .line 68
    .line 69
    sput-boolean p0, Lcom/p1/mobile/android/app/Act;->isFromBackground:Z

    .line 70
    .line 71
    return-void
.end method

.method public onSaveGlobalState(Landroid/os/Bundle;)V
    .locals 0
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/os/Bundle;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->onSaveGlobalState(Landroid/os/Bundle;)V

    .line 10
    .line 11
    .line 12
    const-string v1, ".global_state"

    .line 13
    .line 14
    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const-string v0, ",onSaveInstanceState"

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {p1, p0}, Ll/vi3;->a(Landroid/os/Bundle;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final onStart()V
    .locals 6
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->shouldBlockOnStart()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/android/app/Act;->hasBlockOnStart:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onStart()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onStart()V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->lifecycleSubject:Lrx/subjects/a;

    .line 20
    .line 21
    sget-object v1, Lcom/p1/mobile/android/app/c;->h:Lcom/p1/mobile/android/app/c;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    sget-object v0, Lcom/p1/mobile/android/app/Act;->acts:Ljava/util/HashMap;

    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    const/4 v1, 0x0

    .line 37
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    const/4 v3, 0x1

    .line 42
    if-eqz v2, :cond_3

    .line 43
    .line 44
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    check-cast v2, Ljava/util/ArrayList;

    .line 49
    .line 50
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    :cond_2
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 55
    .line 56
    .line 57
    move-result v4

    .line 58
    if-eqz v4, :cond_1

    .line 59
    .line 60
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v4

    .line 64
    check-cast v4, Lcom/p1/mobile/android/app/Act$r;

    .line 65
    .line 66
    iget-object v5, v4, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 67
    .line 68
    invoke-virtual {v5}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v5

    .line 72
    if-ne v5, p0, :cond_2

    .line 73
    .line 74
    sget-object v1, Lcom/p1/mobile/android/app/c;->h:Lcom/p1/mobile/android/app/c;

    .line 75
    .line 76
    iput-object v1, v4, Lcom/p1/mobile/android/app/Act$r;->b:Lcom/p1/mobile/android/app/c;

    .line 77
    .line 78
    move v1, v3

    .line 79
    goto :goto_0

    .line 80
    :cond_3
    if-eqz v1, :cond_4

    .line 81
    .line 82
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->changeGlobalLifecycleStates()V

    .line 83
    .line 84
    .line 85
    :cond_4
    sget v0, Lcom/p1/mobile/android/app/Act;->activityCount:I

    .line 86
    .line 87
    add-int/2addr v0, v3

    .line 88
    sput v0, Lcom/p1/mobile/android/app/Act;->activityCount:I

    .line 89
    .line 90
    if-ne v0, v3, :cond_5

    .line 91
    .line 92
    sget-object v0, Lcom/p1/mobile/android/app/Act;->frontBs:Lrx/subjects/b;

    .line 93
    .line 94
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 95
    .line 96
    invoke-virtual {v0, v1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 97
    .line 98
    .line 99
    :cond_5
    sget-wide v0, Lcom/p1/mobile/android/app/Act;->startTime:J

    .line 100
    .line 101
    const-wide/16 v2, 0x1

    .line 102
    .line 103
    add-long/2addr v0, v2

    .line 104
    sput-wide v0, Lcom/p1/mobile/android/app/Act;->startTime:J

    .line 105
    .line 106
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->onStartLifecycle()V

    .line 107
    .line 108
    .line 109
    return-void
.end method

.method public onStartLifecycle()V
    .locals 0
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    return-void
.end method

.method public final onStop()V
    .locals 5
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/android/app/Act;->hasBlockOnStart:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onStop()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->lifecycleSubject:Lrx/subjects/a;

    .line 10
    .line 11
    sget-object v1, Lcom/p1/mobile/android/app/c;->k:Lcom/p1/mobile/android/app/c;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    sget-object v0, Lcom/p1/mobile/android/app/Act;->acts:Ljava/util/HashMap;

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-eqz v1, :cond_3

    .line 31
    .line 32
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    check-cast v1, Ljava/util/ArrayList;

    .line 37
    .line 38
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    :cond_2
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    if-eqz v2, :cond_1

    .line 47
    .line 48
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    check-cast v2, Lcom/p1/mobile/android/app/Act$r;

    .line 53
    .line 54
    iget-object v3, v2, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 55
    .line 56
    invoke-virtual {v3}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    if-ne v3, p0, :cond_2

    .line 61
    .line 62
    sget-object v3, Lcom/p1/mobile/android/app/c;->k:Lcom/p1/mobile/android/app/c;

    .line 63
    .line 64
    iput-object v3, v2, Lcom/p1/mobile/android/app/Act$r;->b:Lcom/p1/mobile/android/app/c;

    .line 65
    .line 66
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 67
    .line 68
    .line 69
    move-result-wide v3

    .line 70
    iput-wide v3, v2, Lcom/p1/mobile/android/app/Act$r;->c:J

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_3
    sget-object v0, Lcom/p1/mobile/android/app/Act;->backgroundCheckHandler:Landroid/os/Handler;

    .line 74
    .line 75
    invoke-virtual {v0}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    const-wide/16 v2, 0x3f2

    .line 80
    .line 81
    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 82
    .line 83
    .line 84
    sget-wide v0, Lcom/p1/mobile/android/app/Act;->stopTime:J

    .line 85
    .line 86
    const-wide/16 v2, 0x1

    .line 87
    .line 88
    add-long/2addr v0, v2

    .line 89
    sput-wide v0, Lcom/p1/mobile/android/app/Act;->stopTime:J

    .line 90
    .line 91
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->onStopLifecycle()V

    .line 92
    .line 93
    .line 94
    sget v0, Lcom/p1/mobile/android/app/Act;->activityCount:I

    .line 95
    .line 96
    add-int/lit8 v0, v0, -0x1

    .line 97
    .line 98
    sput v0, Lcom/p1/mobile/android/app/Act;->activityCount:I

    .line 99
    .line 100
    if-nez v0, :cond_4

    .line 101
    .line 102
    sget-object v0, Lcom/p1/mobile/android/app/Act;->frontBs:Lrx/subjects/b;

    .line 103
    .line 104
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 105
    .line 106
    invoke-virtual {v0, v1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 107
    .line 108
    .line 109
    :cond_4
    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onStop()V

    .line 110
    .line 111
    .line 112
    return-void
.end method

.method public onStopLifecycle()V
    .locals 2
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .line 1
    sget-boolean v0, Lcom/p1/mobile/android/app/Act;->isFromBackStack:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 6
    .line 7
    invoke-static {v0}, Ll/l51;->A(Landroid/content/Context;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    sput-boolean v0, Lcom/p1/mobile/android/app/Act;->isFromBackground:Z

    .line 15
    .line 16
    invoke-static {}, Ll/srf;->a()Ll/srf;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sget-object v1, Lcom/p1/mobile/android/app/ExtraActLifecycle;->onStopToBackground:Lcom/p1/mobile/android/app/ExtraActLifecycle;

    .line 21
    .line 22
    invoke-virtual {v0, v1, p0}, Ll/srf;->c(Lcom/p1/mobile/android/app/ExtraActLifecycle;Lcom/p1/mobile/android/app/Act;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public onTakePictureResult(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public pendChangeActionButtonTypeface()V
    .locals 2

    .line 1
    const v0, 0x1020002

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    new-instance v1, Ll/s10;

    .line 9
    .line 10
    invoke-direct {v1, p0}, Ll/s10;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 11
    .line 12
    .line 13
    invoke-static {v0, v1}, Ll/bnl0;->b0(Landroid/view/View;Ll/pcj;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public pickImageSystem()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->pickImagesSystem(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public pickImagesSystem(Z)V
    .locals 3

    .line 1
    const-string v0, "android.intent.action.GET_CONTENT"

    .line 2
    .line 3
    const-string v1, "image/*"

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    new-instance p1, Landroid/content/Intent;

    .line 8
    .line 9
    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 13
    .line 14
    .line 15
    const-string v0, "android.intent.extra.ALLOW_MULTIPLE"

    .line 16
    .line 17
    const/4 v1, 0x1

    .line 18
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 19
    .line 20
    .line 21
    const-string v0, "android.intent.extra.LOCAL_ONLY"

    .line 22
    .line 23
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 24
    .line 25
    .line 26
    const/16 v0, 0x1000

    .line 27
    .line 28
    :try_start_0
    invoke-virtual {p0, p1, v0}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :catch_0
    move-exception p1

    .line 33
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 34
    .line 35
    .line 36
    const/4 p1, 0x0

    .line 37
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->pickImagesSystem(Z)V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    new-instance p1, Landroid/content/Intent;

    .line 42
    .line 43
    const-string v2, "android.intent.action.PICK"

    .line 44
    .line 45
    invoke-direct {p1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 49
    .line 50
    .line 51
    const/16 v2, 0x2000

    .line 52
    .line 53
    :try_start_1
    invoke-virtual {p0, p1, v2}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_1
    .catch Landroid/content/ActivityNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :catch_1
    move-exception p1

    .line 58
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 59
    .line 60
    .line 61
    new-instance p1, Landroid/content/Intent;

    .line 62
    .line 63
    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p1, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 67
    .line 68
    .line 69
    :try_start_2
    invoke-virtual {p0, p1, v2}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_2
    .catch Landroid/content/ActivityNotFoundException; {:try_start_2 .. :try_end_2} :catch_2

    .line 70
    .line 71
    .line 72
    goto :goto_0

    .line 73
    :catch_2
    move-exception p0

    .line 74
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 75
    .line 76
    .line 77
    :goto_0
    return-void
.end method

.method public pickVideoSystem()V
    .locals 5

    .line 1
    const-string v0, "android.intent.action.GET_CONTENT"

    .line 2
    .line 3
    new-instance v1, Landroid/content/Intent;

    .line 4
    .line 5
    const-string v2, "android.intent.action.PICK"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const-string v2, "video/*"

    .line 11
    .line 12
    invoke-virtual {v1, v2}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 13
    .line 14
    .line 15
    const/16 v3, 0x3000

    .line 16
    .line 17
    :try_start_0
    invoke-virtual {p0, v1, v3}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :catch_0
    :try_start_1
    new-instance v4, Landroid/content/Intent;

    .line 22
    .line 23
    invoke-direct {v4, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1, v2}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, v4, v3}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_1
    .catch Landroid/content/ActivityNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :catch_1
    :try_start_2
    new-instance v1, Landroid/content/Intent;

    .line 34
    .line 35
    invoke-direct {v1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v1, v2}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 39
    .line 40
    .line 41
    const-string v0, ""

    .line 42
    .line 43
    invoke-static {v1, v0}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {p0, v0, v3}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_2
    .catch Landroid/content/ActivityNotFoundException; {:try_start_2 .. :try_end_2} :catch_2

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :catch_2
    move-exception p0

    .line 52
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 53
    .line 54
    .line 55
    :goto_0
    return-void
.end method

.method public popLifeObs()Lrx/subjects/a;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/a<",
            "Ll/vk80;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->popLifeSub:Lrx/subjects/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public possiblyResizeChildOfContent()V
    .locals 12

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/android/app/Act;->isSetUpKeyboardDetectorLayout:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 7
    .line 8
    const/16 v1, 0x22

    .line 9
    .line 10
    if-gt v0, v1, :cond_1

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->isAdjustResizeEnabled()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    :goto_0
    return-void

    .line 20
    :cond_2
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0}, Landroid/view/View;->getSystemUiVisibility()I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    const/16 v2, 0x400

    .line 33
    .line 34
    and-int/2addr v1, v2

    .line 35
    const/4 v3, 0x1

    .line 36
    const/4 v4, 0x0

    .line 37
    if-ne v1, v2, :cond_3

    .line 38
    .line 39
    move v8, v3

    .line 40
    goto :goto_1

    .line 41
    :cond_3
    move v8, v4

    .line 42
    :goto_1
    const v1, 0x1020002

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0, v1}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    move-object v10, p0

    .line 50
    check-cast v10, Landroid/widget/FrameLayout;

    .line 51
    .line 52
    invoke-virtual {v10, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 53
    .line 54
    .line 55
    move-result-object v11

    .line 56
    invoke-virtual {v11}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 57
    .line 58
    .line 59
    move-result-object v9

    .line 60
    filled-new-array {v4}, [I

    .line 61
    .line 62
    .line 63
    move-result-object v7

    .line 64
    new-array v6, v3, [Z

    .line 65
    .line 66
    aput-boolean v4, v6, v4

    .line 67
    .line 68
    new-instance v5, Ll/t10;

    .line 69
    .line 70
    invoke-direct/range {v5 .. v11}, Ll/t10;-><init>([Z[IZLandroid/view/ViewGroup$LayoutParams;Landroid/widget/FrameLayout;Landroid/view/View;)V

    .line 71
    .line 72
    .line 73
    invoke-static {v0, v5}, Ll/kkl0;->y0(Landroid/view/View;Ll/il50;)V

    .line 74
    .line 75
    .line 76
    invoke-static {v0}, Ll/kkl0;->g0(Landroid/view/View;)V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public post(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public postDelayed(Ljava/lang/Runnable;J)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 0

    return-void
.end method

.method public progress(I)Landroid/app/Dialog;
    .locals 1

    const/4 v0, 0x0

    .line 175
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/android/app/Act;->progress(IZ)Landroid/app/Dialog;

    move-result-object p0

    return-object p0
.end method

.method public progress(IZ)Landroid/app/Dialog;
    .locals 0

    .line 156
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/android/app/Act;->progress(Ljava/lang/String;Z)Landroid/app/Dialog;

    move-result-object p0

    return-object p0
.end method

.method public progress(Ljava/lang/String;)Landroid/app/Dialog;
    .locals 1

    const/4 v0, 0x0

    .line 157
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/android/app/Act;->progress(Ljava/lang/String;Z)Landroid/app/Dialog;

    move-result-object p0

    return-object p0
.end method

.method public progress(Ljava/lang/String;Ljava/lang/String;ZZ)Landroid/app/Dialog;
    .locals 7

    .line 159
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->progressDialog:Landroid/app/Dialog;

    if-nez v0, :cond_2

    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_2

    .line 160
    invoke-static {p0, p1, p2}, Lcom/p1/mobile/android/app/Act;->progress(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)Landroid/app/Dialog;

    move-result-object v3

    .line 161
    invoke-virtual {v3}, Landroid/app/Dialog;->show()V

    .line 162
    iput-object v3, p0, Lcom/p1/mobile/android/app/Act;->progressDialog:Landroid/app/Dialog;

    if-eqz p3, :cond_1

    const/4 p1, 0x2

    .line 163
    new-array p1, p1, [F

    fill-array-data p1, :array_0

    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object p1

    .line 164
    invoke-virtual {v3}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object p2

    invoke-virtual {p2}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v6

    const/4 p2, 0x0

    .line 165
    iput p2, v6, Landroid/view/WindowManager$LayoutParams;->alpha:F

    .line 166
    iget v5, v6, Landroid/view/WindowManager$LayoutParams;->dimAmount:F

    if-eqz p4, :cond_0

    .line 167
    iput p2, v6, Landroid/view/WindowManager$LayoutParams;->dimAmount:F

    .line 168
    :cond_0
    invoke-virtual {v3}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object p2

    invoke-virtual {p2, v6}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 169
    new-instance v1, Ll/f20;

    move-object v2, p0

    move v4, p4

    invoke-direct/range {v1 .. v6}, Ll/f20;-><init>(Lcom/p1/mobile/android/app/Act;Landroid/app/Dialog;ZFLandroid/view/WindowManager$LayoutParams;)V

    invoke-virtual {p1, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    const-wide/16 p2, 0x190

    .line 170
    invoke-virtual {p1, p2, p3}, Landroid/animation/ValueAnimator;->setStartDelay(J)V

    const-wide/16 p2, 0x96

    .line 171
    invoke-virtual {p1, p2, p3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 172
    new-instance p0, Landroid/view/animation/DecelerateInterpolator;

    const/high16 p2, 0x3fc00000    # 1.5f

    invoke-direct {p0, p2}, Landroid/view/animation/DecelerateInterpolator;-><init>(F)V

    invoke-virtual {p1, p0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 173
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    :cond_1
    return-object v3

    :cond_2
    move-object v2, p0

    .line 174
    iget-object p0, v2, Lcom/p1/mobile/android/app/Act;->progressDialog:Landroid/app/Dialog;

    return-object p0

    nop

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public progress(Ljava/lang/String;Z)Landroid/app/Dialog;
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 158
    invoke-virtual {p0, p1, v0, p2, v1}, Lcom/p1/mobile/android/app/Act;->progress(Ljava/lang/String;Ljava/lang/String;ZZ)Landroid/app/Dialog;

    move-result-object p0

    return-object p0
.end method

.method public progressDismiss()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->progressDialog:Landroid/app/Dialog;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    :try_start_0
    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    goto :goto_0

    .line 9
    :catch_0
    move-exception v0

    .line 10
    new-instance v1, Ljava/lang/Exception;

    .line 11
    .line 12
    new-instance v2, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    const-string v3, " progressDismiss: "

    .line 29
    .line 30
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-direct {v1, v2, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 45
    .line 46
    .line 47
    invoke-static {v1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 48
    .line 49
    .line 50
    :goto_0
    const/4 v0, 0x0

    .line 51
    iput-object v0, p0, Lcom/p1/mobile/android/app/Act;->progressDialog:Landroid/app/Dialog;

    .line 52
    .line 53
    :cond_0
    return-void
.end method

.method public realFinishAfterFinishingAnimation()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->trans:Lcom/p1/mobile/android/app/Act$v;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    move-object v0, v1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v0, v0, Lcom/p1/mobile/android/app/Act$v;->b:Lcom/p1/mobile/android/app/Act$w;

    .line 9
    .line 10
    :goto_0
    iput-object v1, p0, Lcom/p1/mobile/android/app/Act;->trans:Lcom/p1/mobile/android/app/Act$v;

    .line 11
    .line 12
    invoke-direct {p0}, Lcom/p1/mobile/android/app/Act;->actualFinish()V

    .line 13
    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Lcom/p1/mobile/android/app/Act$w;->g(Lcom/p1/mobile/android/app/Act;)V

    .line 18
    .line 19
    .line 20
    :cond_1
    return-void
.end method

.method public recordVideo()V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->mediaCapture(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public registerOnActivityResultListener(Lcom/p1/mobile/android/app/a$a;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->activityReslutManager:Lcom/p1/mobile/android/app/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/a;->c(Lcom/p1/mobile/android/app/a$a;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public removeCallbacks(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public removeKeyboardListener(Landroid/view/View;Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p2}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setActionBarColor(I)V
    .locals 1

    .line 1
    iput p1, p0, Lcom/p1/mobile/android/app/Act;->actionBarColor:I

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    .line 10
    .line 11
    invoke-direct {v0, p1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Ll/c30;->u(Landroid/graphics/drawable/Drawable;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public setConvertActivityFromTranslucentEnable(Z)V
    .locals 1

    .line 1
    sget-boolean v0, Lcom/p1/mobile/android/app/Act;->SWIPE_BACK_SUPPORTED:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->swipeBack:Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->setEnableConvertActivityFromTranslucent(Z)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public setFullSlide(Z)V
    .locals 1

    .line 1
    sget-boolean v0, Lcom/p1/mobile/android/app/Act;->SWIPE_BACK_SUPPORTED:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->swipeBack:Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->setFullSlide(Z)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public setGradientStatusBar()V
    .locals 1

    .line 1
    sget-boolean v0, Lcom/p1/mobile/android/app/Act;->SWIPE_BACK_SUPPORTED:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->swipeBack:Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->z()Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public setKeyboardListener(Landroid/view/View;Ll/y20;)Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;)",
            "Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-direct {v0, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    new-instance p2, Lcom/p1/mobile/android/app/Act$q;

    .line 7
    .line 8
    invoke-direct {p2, p0, p1, v0}, Lcom/p1/mobile/android/app/Act$q;-><init>(Lcom/p1/mobile/android/app/Act;Landroid/view/View;Ljava/lang/ref/WeakReference;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0, p2}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 16
    .line 17
    .line 18
    return-object p2
.end method

.method public setNavigationBarColor(I)V
    .locals 2

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x22

    .line 4
    .line 5
    if-gt v0, v1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0, p1}, Landroid/view/Window;->setNavigationBarColor(I)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    sget-boolean v0, Lcom/p1/mobile/android/app/Act;->SWIPE_BACK_SUPPORTED:Z

    .line 18
    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->swipeBack:Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->A(I)Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 24
    .line 25
    .line 26
    :cond_1
    return-void
.end method

.method public setPaddingToNavigationBar(I)V
    .locals 4

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x22

    .line 4
    .line 5
    if-le v0, v1, :cond_2

    .line 6
    .line 7
    sget-boolean v0, Lcom/p1/mobile/android/app/Act;->SWIPE_BACK_SUPPORTED:Z

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const v0, 0x1020002

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sget v1, Ll/vcc0;->f:I

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    if-eqz v1, :cond_1

    .line 26
    .line 27
    sget v1, Ll/vcc0;->f:I

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-nez v1, :cond_2

    .line 42
    .line 43
    :cond_1
    invoke-virtual {v0}, Landroid/view/View;->getPaddingLeft()I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    invoke-virtual {v0}, Landroid/view/View;->getPaddingTop()I

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    invoke-virtual {v0}, Landroid/view/View;->getPaddingRight()I

    .line 52
    .line 53
    .line 54
    move-result v3

    .line 55
    invoke-virtual {v0, v1, v2, v3, p1}, Landroid/view/View;->setPadding(IIII)V

    .line 56
    .line 57
    .line 58
    sget v1, Ll/vcc0;->f:I

    .line 59
    .line 60
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-virtual {v0, v1, p1}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 65
    .line 66
    .line 67
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->swipeBack:Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 68
    .line 69
    const/4 p1, 0x1

    .line 70
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->D(Z)Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 71
    .line 72
    .line 73
    :cond_2
    :goto_0
    return-void
.end method

.method public setRequestedOrientation(I)V
    .locals 2

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x1a

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/android/app/Act;->isTranslucentOrFloating()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-super {p0, p1}, Landroid/app/Activity;->setRequestedOrientation(I)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public setStatusBarColor(I)V
    .locals 1

    .line 1
    sget-boolean v0, Lcom/p1/mobile/android/app/Act;->SWIPE_BACK_SUPPORTED:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->swipeBack:Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->B(I)Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public setSwipeBackEnable(Z)V
    .locals 1

    .line 1
    sget-boolean v0, Lcom/p1/mobile/android/app/Act;->SWIPE_BACK_SUPPORTED:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->swipeBack:Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->setEnableGesture(Z)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public setTheme()V
    .locals 0

    return-void
.end method

.method public setTitle(I)V
    .locals 0

    .line 205
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->setTitle(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public setTitle(Ljava/lang/CharSequence;)V
    .locals 4

    .line 184
    invoke-super {p0, p1}, Landroid/app/Activity;->setTitle(Ljava/lang/CharSequence;)V

    .line 185
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->originalTitle:Landroid/widget/TextView;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 186
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 187
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->centralLayout:Landroid/widget/LinearLayout;

    const/16 v2, 0x8

    if-eqz v0, :cond_1

    .line 188
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    .line 189
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->centralTitle:Landroid/widget/TextView;

    if-eqz v0, :cond_2

    .line 190
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 191
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->specialLayout:Landroid/widget/LinearLayout;

    if-eqz v0, :cond_3

    .line 192
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    goto :goto_1

    .line 193
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->specialTitle:Landroid/widget/TextView;

    if-eqz v0, :cond_4

    .line 194
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 195
    :cond_4
    :goto_1
    iget-boolean v0, p0, Lcom/p1/mobile/android/app/Act;->hackCenterTitle:Z

    if-eqz v0, :cond_5

    .line 196
    :try_start_0
    sget-object v0, Lcom/p1/mobile/android/app/Act;->TOOLBAR_TITLE_VIEW_FILED:Ljava/lang/reflect/Field;

    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->toolbar()Landroidx/appcompat/widget/Toolbar;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/p1/mobile/android/app/Act;->originalTitle:Landroid/widget/TextView;

    .line 197
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v0

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v0

    .line 198
    invoke-static {}, Ll/bnl0;->y0()I

    move-result v2

    const/high16 v3, 0x42e40000    # 114.0f

    invoke-static {v3}, Ll/qa00;->d(F)I

    move-result v3

    sub-int/2addr v2, v3

    int-to-float v2, v2

    .line 199
    iget-object v3, p0, Lcom/p1/mobile/android/app/Act;->originalTitle:Landroid/widget/TextView;

    sub-float/2addr v2, v0

    float-to-int v0, v2

    div-int/lit8 v0, v0, 0x2

    const/high16 v2, 0x41400000    # 12.0f

    .line 200
    invoke-static {v2}, Ll/qa00;->d(F)I

    move-result v2

    sub-int/2addr v0, v2

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 201
    invoke-static {v3, v0}, Ll/bnl0;->d0(Landroid/view/View;I)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_4

    :catch_0
    move-exception v0

    goto :goto_2

    :catch_1
    move-exception v0

    goto :goto_3

    .line 202
    :goto_2
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    goto :goto_4

    .line 203
    :goto_3
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 204
    :goto_4
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->toolbar()Landroidx/appcompat/widget/Toolbar;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/Toolbar;->setTitle(Ljava/lang/CharSequence;)V

    :cond_5
    return-void
.end method

.method public setTitle(Ljava/lang/String;Z)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    const/16 v1, 0x8

    .line 3
    .line 4
    if-eqz p2, :cond_7

    .line 5
    .line 6
    iget-object p2, p0, Lcom/p1/mobile/android/app/Act;->centralTitle:Landroid/widget/TextView;

    .line 7
    .line 8
    if-eqz p2, :cond_3

    .line 9
    .line 10
    iget-object v2, p0, Lcom/p1/mobile/android/app/Act;->originalTitle:Landroid/widget/TextView;

    .line 11
    .line 12
    if-eqz v2, :cond_3

    .line 13
    .line 14
    invoke-virtual {p2, v0}, Landroid/view/View;->setVisibility(I)V

    .line 15
    .line 16
    .line 17
    iget-object p2, p0, Lcom/p1/mobile/android/app/Act;->centralTitle:Landroid/widget/TextView;

    .line 18
    .line 19
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Lcom/p1/mobile/android/app/Act;->originalTitle:Landroid/widget/TextView;

    .line 23
    .line 24
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Lcom/p1/mobile/android/app/Act;->centralLayout:Landroid/widget/LinearLayout;

    .line 28
    .line 29
    if-eqz p1, :cond_0

    .line 30
    .line 31
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 32
    .line 33
    .line 34
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/android/app/Act;->centralFilter:Landroid/widget/TextView;

    .line 35
    .line 36
    if-eqz p1, :cond_1

    .line 37
    .line 38
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 39
    .line 40
    .line 41
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/android/app/Act;->specialLayout:Landroid/widget/LinearLayout;

    .line 42
    .line 43
    if-eqz p1, :cond_2

    .line 44
    .line 45
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->specialTitle:Landroid/widget/TextView;

    .line 50
    .line 51
    if-eqz p0, :cond_c

    .line 52
    .line 53
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_3
    :try_start_0
    sget-object p2, Lcom/p1/mobile/android/app/Act;->TOOLBAR_TITLE_VIEW_FILED:Ljava/lang/reflect/Field;

    .line 58
    .line 59
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->toolbar()Landroidx/appcompat/widget/Toolbar;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {p2, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object p2

    .line 67
    check-cast p2, Landroid/widget/TextView;

    .line 68
    .line 69
    iput-object p2, p0, Lcom/p1/mobile/android/app/Act;->originalTitle:Landroid/widget/TextView;

    .line 70
    .line 71
    if-eqz p2, :cond_4

    .line 72
    .line 73
    invoke-virtual {p2, v1}, Landroid/view/View;->setVisibility(I)V

    .line 74
    .line 75
    .line 76
    goto :goto_0

    .line 77
    :catch_0
    move-exception p2

    .line 78
    goto :goto_1

    .line 79
    :catch_1
    move-exception p2

    .line 80
    goto :goto_2

    .line 81
    :cond_4
    :goto_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->getCentralTitle(Ljava/lang/CharSequence;)Landroid/widget/TextView;

    .line 82
    .line 83
    .line 84
    move-result-object p2

    .line 85
    iput-object p2, p0, Lcom/p1/mobile/android/app/Act;->centralTitle:Landroid/widget/TextView;

    .line 86
    .line 87
    new-instance p2, Landroidx/appcompat/widget/Toolbar$e;

    .line 88
    .line 89
    const/4 v0, -0x2

    .line 90
    invoke-direct {p2, v0, v0}, Landroidx/appcompat/widget/Toolbar$e;-><init>(II)V

    .line 91
    .line 92
    .line 93
    const/16 v0, 0x11

    .line 94
    .line 95
    iput v0, p2, Ll/c30$a;->a:I

    .line 96
    .line 97
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->toolbar()Landroidx/appcompat/widget/Toolbar;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    iget-object v2, p0, Lcom/p1/mobile/android/app/Act;->centralTitle:Landroid/widget/TextView;

    .line 102
    .line 103
    invoke-virtual {v0, v2, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 104
    .line 105
    .line 106
    iget-object p2, p0, Lcom/p1/mobile/android/app/Act;->centralFilter:Landroid/widget/TextView;

    .line 107
    .line 108
    if-eqz p2, :cond_5

    .line 109
    .line 110
    invoke-virtual {p2, v1}, Landroid/view/View;->setVisibility(I)V

    .line 111
    .line 112
    .line 113
    :cond_5
    iget-object p2, p0, Lcom/p1/mobile/android/app/Act;->specialLayout:Landroid/widget/LinearLayout;

    .line 114
    .line 115
    if-eqz p2, :cond_6

    .line 116
    .line 117
    invoke-virtual {p2, v1}, Landroid/view/View;->setVisibility(I)V

    .line 118
    .line 119
    .line 120
    return-void

    .line 121
    :cond_6
    iget-object p2, p0, Lcom/p1/mobile/android/app/Act;->specialTitle:Landroid/widget/TextView;

    .line 122
    .line 123
    if-eqz p2, :cond_c

    .line 124
    .line 125
    invoke-virtual {p2, v1}, Landroid/view/View;->setVisibility(I)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 126
    .line 127
    .line 128
    return-void

    .line 129
    :goto_1
    invoke-static {p2}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->setTitle(Ljava/lang/CharSequence;)V

    .line 133
    .line 134
    .line 135
    goto :goto_4

    .line 136
    :goto_2
    invoke-static {p2}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->setTitle(Ljava/lang/CharSequence;)V

    .line 140
    .line 141
    .line 142
    goto :goto_4

    .line 143
    :cond_7
    invoke-super {p0, p1}, Landroid/app/Activity;->setTitle(Ljava/lang/CharSequence;)V

    .line 144
    .line 145
    .line 146
    iget-object p1, p0, Lcom/p1/mobile/android/app/Act;->originalTitle:Landroid/widget/TextView;

    .line 147
    .line 148
    if-eqz p1, :cond_8

    .line 149
    .line 150
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 151
    .line 152
    .line 153
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/android/app/Act;->centralLayout:Landroid/widget/LinearLayout;

    .line 154
    .line 155
    if-eqz p1, :cond_9

    .line 156
    .line 157
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 158
    .line 159
    .line 160
    goto :goto_3

    .line 161
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/android/app/Act;->centralTitle:Landroid/widget/TextView;

    .line 162
    .line 163
    if-eqz p1, :cond_a

    .line 164
    .line 165
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 166
    .line 167
    .line 168
    :cond_a
    :goto_3
    iget-object p1, p0, Lcom/p1/mobile/android/app/Act;->specialLayout:Landroid/widget/LinearLayout;

    .line 169
    .line 170
    if-eqz p1, :cond_b

    .line 171
    .line 172
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 173
    .line 174
    .line 175
    return-void

    .line 176
    :cond_b
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->specialTitle:Landroid/widget/TextView;

    .line 177
    .line 178
    if-eqz p0, :cond_c

    .line 179
    .line 180
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 181
    .line 182
    .line 183
    :cond_c
    :goto_4
    return-void
.end method

.method public setTopViewLayout(Landroid/view/View;)Landroid/view/View;
    .locals 2

    .line 1
    new-instance v0, Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {p0, p1, v0, v1}, Lcom/p1/mobile/android/app/Act;->setUpKeyboardDetectorLayout(Landroid/view/View;Landroid/view/View;Ll/b30;)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public setUpKeyboardDetectorLayout(Landroid/view/View;Landroid/view/View;Ll/b30;)Landroid/view/View;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Landroid/view/View;",
            "Ll/b30<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Integer;",
            ">;)",
            "Landroid/view/View;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/android/app/Act;->isSetUpKeyboardDetectorLayout:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    move-object v6, v0

    .line 13
    check-cast v6, Landroid/view/ViewGroup;

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const/16 v1, 0x9

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/view/Window;->hasFeature(I)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    const/4 v2, 0x0

    .line 30
    if-eqz v1, :cond_1

    .line 31
    .line 32
    if-eqz v0, :cond_0

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    const/high16 v0, 0x42600000    # 56.0f

    .line 36
    .line 37
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    goto :goto_1

    .line 42
    :cond_1
    :goto_0
    move v0, v2

    .line 43
    :goto_1
    invoke-static {}, Ll/bnl0;->F0()I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    add-int/2addr v0, v1

    .line 48
    invoke-virtual {p1, v2, v0, v2, v2}, Landroid/view/View;->setPadding(IIII)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v6, p1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    .line 52
    .line 53
    .line 54
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 55
    .line 56
    const/16 v1, 0x22

    .line 57
    .line 58
    if-le v0, v1, :cond_2

    .line 59
    .line 60
    new-instance v0, Lcom/p1/mobile/android/app/Act$o;

    .line 61
    .line 62
    invoke-direct {v0, p0, p1, p3}, Lcom/p1/mobile/android/app/Act$o;-><init>(Lcom/p1/mobile/android/app/Act;Landroid/view/View;Ll/b30;)V

    .line 63
    .line 64
    .line 65
    invoke-static {v6, v0}, Ll/kkl0;->y0(Landroid/view/View;Ll/il50;)V

    .line 66
    .line 67
    .line 68
    invoke-static {v6}, Ll/kkl0;->g0(Landroid/view/View;)V

    .line 69
    .line 70
    .line 71
    return-object p2

    .line 72
    :cond_2
    new-instance v1, Lcom/p1/mobile/android/app/Act$t;

    .line 73
    .line 74
    move-object v2, p0

    .line 75
    move-object v3, p1

    .line 76
    move-object v4, p2

    .line 77
    move-object v5, p3

    .line 78
    invoke-direct/range {v1 .. v6}, Lcom/p1/mobile/android/app/Act$t;-><init>(Lcom/p1/mobile/android/app/Act;Landroid/view/View;Landroid/view/View;Ll/b30;Landroid/view/ViewGroup;)V

    .line 79
    .line 80
    .line 81
    new-instance p0, Lcom/p1/mobile/android/app/Act$p;

    .line 82
    .line 83
    invoke-direct {p0, v2, v1}, Lcom/p1/mobile/android/app/Act$p;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/android/app/Act$t;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v4, p0}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 87
    .line 88
    .line 89
    return-object v4
.end method

.method public setUpKeyboardDetectorLayout(Landroid/view/View;Landroid/view/View;Ll/z20;)Landroid/view/View;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Landroid/view/View;",
            "Ll/z20<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Integer;",
            ">;)",
            "Landroid/view/View;"
        }
    .end annotation

    .line 90
    new-instance v0, Ll/x10;

    invoke-direct {v0, p3}, Ll/x10;-><init>(Ll/z20;)V

    invoke-virtual {p0, p1, p2, v0}, Lcom/p1/mobile/android/app/Act;->setUpKeyboardDetectorLayout(Landroid/view/View;Landroid/view/View;Ll/b30;)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method public shouldBlockOnCreate(Landroid/os/Bundle;)Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public shouldBlockOnResume()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public shouldBlockOnStart()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public showDebugMenu()V
    .locals 1

    .line 207
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->debugItems()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->showDebugMenu(Ljava/util/ArrayList;)V

    return-void
.end method

.method public showDebugMenu(Ljava/util/ArrayList;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ll/x20;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/l10;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/l10;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, v0}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {v0}, Ll/s9c;->c(Ljava/util/List;)V

    .line 11
    .line 12
    .line 13
    new-instance v1, Landroid/widget/LinearLayout;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 16
    .line 17
    .line 18
    const/4 v2, 0x1

    .line 19
    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 20
    .line 21
    .line 22
    const/high16 v3, 0x40a00000    # 5.0f

    .line 23
    .line 24
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    const/4 v4, 0x0

    .line 29
    invoke-virtual {v1, v4, v3, v4, v4}, Landroid/view/View;->setPadding(IIII)V

    .line 30
    .line 31
    .line 32
    new-instance v3, Landroidx/appcompat/widget/AppCompatEditText;

    .line 33
    .line 34
    invoke-direct {v3, p0}, Landroidx/appcompat/widget/AppCompatEditText;-><init>(Landroid/content/Context;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v3, v4}, Landroid/view/View;->setBackgroundColor(I)V

    .line 38
    .line 39
    .line 40
    const v5, 0x104000c

    .line 41
    .line 42
    .line 43
    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setHint(I)V

    .line 44
    .line 45
    .line 46
    const/high16 v5, 0x41800000    # 16.0f

    .line 47
    .line 48
    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setTextSize(F)V

    .line 49
    .line 50
    .line 51
    const/16 v6, 0x13

    .line 52
    .line 53
    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setGravity(I)V

    .line 54
    .line 55
    .line 56
    const/high16 v6, 0x41c00000    # 24.0f

    .line 57
    .line 58
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 59
    .line 60
    .line 61
    move-result v6

    .line 62
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 63
    .line 64
    .line 65
    move-result v7

    .line 66
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 67
    .line 68
    .line 69
    move-result v5

    .line 70
    invoke-virtual {v3, v6, v7, v6, v5}, Landroid/view/View;->setPadding(IIII)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v3}, Landroid/widget/TextView;->setSingleLine()V

    .line 77
    .line 78
    .line 79
    const/4 v5, 0x3

    .line 80
    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setImeOptions(I)V

    .line 81
    .line 82
    .line 83
    new-instance v5, Lcom/p1/mobile/android/app/Act$k;

    .line 84
    .line 85
    sget v6, Ll/gec0;->B:I

    .line 86
    .line 87
    invoke-direct {v5, p0, p0, v6}, Lcom/p1/mobile/android/app/Act$k;-><init>(Lcom/p1/mobile/android/app/Act;Landroid/content/Context;I)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {v5, v0}, Landroid/widget/ArrayAdapter;->addAll(Ljava/util/Collection;)V

    .line 91
    .line 92
    .line 93
    new-instance v6, Lcom/p1/mobile/android/app/Act$l;

    .line 94
    .line 95
    invoke-direct {v6, p0, v5, v0}, Lcom/p1/mobile/android/app/Act$l;-><init>(Lcom/p1/mobile/android/app/Act;Landroid/widget/ArrayAdapter;Ljava/util/List;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v3, v6}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 99
    .line 100
    .line 101
    new-instance v0, Ll/m10;

    .line 102
    .line 103
    invoke-direct {v0}, Ll/m10;-><init>()V

    .line 104
    .line 105
    .line 106
    invoke-virtual {v3, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 107
    .line 108
    .line 109
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 110
    .line 111
    const/4 v6, -0x2

    .line 112
    const/4 v7, -0x1

    .line 113
    invoke-direct {v0, v7, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {v1, v3, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 117
    .line 118
    .line 119
    new-instance v0, Lv/VList;

    .line 120
    .line 121
    invoke-direct {v0, p0}, Lv/VList;-><init>(Landroid/content/Context;)V

    .line 122
    .line 123
    .line 124
    const/4 v3, 0x0

    .line 125
    invoke-virtual {v0, v3}, Landroid/widget/ListView;->setDivider(Landroid/graphics/drawable/Drawable;)V

    .line 126
    .line 127
    .line 128
    invoke-virtual {v0, v5}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 129
    .line 130
    .line 131
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    .line 132
    .line 133
    const/high16 v6, 0x3f800000    # 1.0f

    .line 134
    .line 135
    invoke-direct {v3, v7, v4, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 136
    .line 137
    .line 138
    invoke-virtual {v1, v0, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 139
    .line 140
    .line 141
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 142
    .line 143
    .line 144
    move-result-object v3

    .line 145
    invoke-virtual {v3, v1, v4}, Lcom/p1/mobile/android/app/Dialog$e;->P(Landroid/view/View;Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 146
    .line 147
    .line 148
    move-result-object v3

    .line 149
    invoke-virtual {v3}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 150
    .line 151
    .line 152
    move-result-object v3

    .line 153
    invoke-virtual {v3}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 154
    .line 155
    .line 156
    move-result-object v4

    .line 157
    const/16 v6, 0x10

    .line 158
    .line 159
    invoke-virtual {v4, v6}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 160
    .line 161
    .line 162
    invoke-virtual {v3}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 163
    .line 164
    .line 165
    new-instance v4, Lcom/p1/mobile/android/app/Act$m;

    .line 166
    .line 167
    invoke-direct {v4, p0, v5, p1, v3}, Lcom/p1/mobile/android/app/Act$m;-><init>(Lcom/p1/mobile/android/app/Act;Landroid/widget/ArrayAdapter;Ljava/util/ArrayList;Lcom/p1/mobile/android/app/Dialog;)V

    .line 168
    .line 169
    .line 170
    invoke-virtual {v0, v4}, Landroid/widget/AdapterView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 171
    .line 172
    .line 173
    new-instance p1, Ll/l4g0;

    .line 174
    .line 175
    const-class v0, Lcom/p1/mobile/android/app/Dialog;

    .line 176
    .line 177
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object v0

    .line 181
    const-string v4, "p_debug_tool_dialog_view"

    .line 182
    .line 183
    invoke-direct {p1, v4, v0}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 184
    .line 185
    .line 186
    invoke-virtual {p1}, Ll/l4g0;->i()V

    .line 187
    .line 188
    .line 189
    invoke-virtual {p1}, Ll/l4g0;->l()V

    .line 190
    .line 191
    .line 192
    new-instance v0, Lcom/p1/mobile/android/app/Act$n;

    .line 193
    .line 194
    invoke-direct {v0, p0, p1}, Lcom/p1/mobile/android/app/Act$n;-><init>(Lcom/p1/mobile/android/app/Act;Ll/l4g0;)V

    .line 195
    .line 196
    .line 197
    invoke-virtual {v3, v0}, Ll/g1e;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 198
    .line 199
    .line 200
    invoke-virtual {v1, v2}, Landroid/view/View;->setFocusableInTouchMode(Z)V

    .line 201
    .line 202
    .line 203
    invoke-virtual {v1}, Landroid/view/View;->requestFocus()Z

    .line 204
    .line 205
    .line 206
    return-void
.end method

.method public showInput(Landroid/view/View;I)Z
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/android/app/Act;->imm()Landroid/view/inputmethod/InputMethodManager;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1, p2}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public startActivityForResult(ILandroid/content/Intent;Lcom/p1/mobile/android/app/a$a;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->activityReslutManager:Lcom/p1/mobile/android/app/a;

    .line 2
    .line 3
    invoke-virtual {v0, p3}, Lcom/p1/mobile/android/app/a;->a(Lcom/p1/mobile/android/app/a$a;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->activityReslutManager:Lcom/p1/mobile/android/app/a;

    .line 10
    .line 11
    new-instance v1, Lcom/p1/mobile/android/app/Act$b;

    .line 12
    .line 13
    invoke-direct {v1, p0, p1, p3}, Lcom/p1/mobile/android/app/Act$b;-><init>(Lcom/p1/mobile/android/app/Act;ILcom/p1/mobile/android/app/a$a;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/a;->c(Lcom/p1/mobile/android/app/a$a;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    invoke-virtual {p0, p2, p1}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public startActivityForResult(Landroid/content/Intent;Lcom/p1/mobile/android/app/a$a;)V
    .locals 1

    const/16 v0, 0x3e9

    .line 23
    invoke-virtual {p0, v0, p1, p2}, Lcom/p1/mobile/android/app/Act;->startActivityForResult(ILandroid/content/Intent;Lcom/p1/mobile/android/app/a$a;)V

    return-void
.end method

.method public startActivityForResultFromFragmentWithCustomTransition(Lcom/p1/mobile/android/app/Frag;Landroid/content/Intent;ILcom/p1/mobile/android/app/Act$w;)V
    .locals 3

    .line 1
    if-eqz p4, :cond_0

    .line 2
    .line 3
    new-instance v0, Lcom/p1/mobile/android/app/Act$v;

    .line 4
    .line 5
    new-instance v1, Ljava/lang/ref/WeakReference;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p2}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-virtual {v2}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-direct {v0, v1, p4, v2}, Lcom/p1/mobile/android/app/Act$v;-><init>(Ljava/lang/ref/WeakReference;Lcom/p1/mobile/android/app/Act$w;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    sget-object p4, Lcom/p1/mobile/android/app/Act;->tempQueue:Ljava/util/LinkedList;

    .line 22
    .line 23
    invoke-virtual {p4, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Landroidx/fragment/app/FragmentActivity;->startActivityFromFragment(Landroidx/fragment/app/Fragment;Landroid/content/Intent;I)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public startActivityForResultWithCustomTransition(Landroid/content/Intent;ILcom/p1/mobile/android/app/Act$w;)V
    .locals 3

    .line 1
    if-eqz p3, :cond_0

    .line 2
    .line 3
    new-instance v0, Lcom/p1/mobile/android/app/Act$v;

    .line 4
    .line 5
    new-instance v1, Ljava/lang/ref/WeakReference;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-virtual {v2}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-direct {v0, v1, p3, v2}, Lcom/p1/mobile/android/app/Act$v;-><init>(Ljava/lang/ref/WeakReference;Lcom/p1/mobile/android/app/Act$w;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    sget-object p3, Lcom/p1/mobile/android/app/Act;->tempQueue:Ljava/util/LinkedList;

    .line 22
    .line 23
    invoke-virtual {p3, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    :cond_0
    invoke-virtual {p0, p1, p2}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public startActivityForResultWithCustomTransition(Landroid/content/Intent;ILcom/p1/mobile/android/app/Act$w;Lcom/p1/mobile/android/app/a$a;)V
    .locals 3

    if-eqz p3, :cond_0

    .line 30
    new-instance v0, Lcom/p1/mobile/android/app/Act$v;

    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 31
    invoke-virtual {p1}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, p3, v2}, Lcom/p1/mobile/android/app/Act$v;-><init>(Ljava/lang/ref/WeakReference;Lcom/p1/mobile/android/app/Act$w;Ljava/lang/String;)V

    .line 32
    sget-object p3, Lcom/p1/mobile/android/app/Act;->tempQueue:Ljava/util/LinkedList;

    invoke-virtual {p3, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 33
    :cond_0
    invoke-virtual {p0, p2, p1, p4}, Lcom/p1/mobile/android/app/Act;->startActivityForResult(ILandroid/content/Intent;Lcom/p1/mobile/android/app/a$a;)V

    return-void
.end method

.method public startActivityFromFragmentWithCustomTransition(Lcom/p1/mobile/android/app/Frag;Landroid/content/Intent;Lcom/p1/mobile/android/app/Act$w;)V
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    invoke-virtual {p0, p1, p2, v0, p3}, Lcom/p1/mobile/android/app/Act;->startActivityForResultFromFragmentWithCustomTransition(Lcom/p1/mobile/android/app/Frag;Landroid/content/Intent;ILcom/p1/mobile/android/app/Act$w;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public startActivityWithCustomTransition(Landroid/content/Intent;Lcom/p1/mobile/android/app/Act$w;)V
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    invoke-virtual {p0, p1, v0, p2}, Lcom/p1/mobile/android/app/Act;->startActivityForResultWithCustomTransition(Landroid/content/Intent;ILcom/p1/mobile/android/app/Act$w;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public statusBarColor()I
    .locals 1

    .line 1
    sget-boolean v0, Lcom/p1/mobile/android/app/Act;->SWIPE_BACK_SUPPORTED:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->swipeBack:Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->C()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    const/high16 p0, -0x1000000

    .line 13
    .line 14
    return p0
.end method

.method public string(I)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public takePicture()V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->mediaCapture(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public toolbar()Landroidx/appcompat/widget/Toolbar;
    .locals 1

    .line 1
    sget v0, Ll/vcc0;->a:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroidx/appcompat/widget/Toolbar;

    .line 8
    .line 9
    return-object p0
.end method

.method public unregisterOnActivityResultListener(Lcom/p1/mobile/android/app/a$a;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->activityReslutManager:Lcom/p1/mobile/android/app/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/a;->d(Lcom/p1/mobile/android/app/a$a;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
