.class public Lcom/p1/mobile/putong/core/ui/quickaudio/view/TouchPullViewLayout;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/quickaudio/view/TouchPullViewLayout$b;
    }
.end annotation


# static fields
.field public static final g:I

.field public static final h:I


# instance fields
.field public d:Landroid/view/GestureDetector;

.field public e:Lcom/p1/mobile/putong/core/ui/quickaudio/view/TouchPullViewLayout$b;

.field public f:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget v0, Ll/qa00;->i:I

    .line 2
    .line 3
    sput v0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/TouchPullViewLayout;->g:I

    .line 4
    .line 5
    sput v0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/TouchPullViewLayout;->h:I

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/TouchPullViewLayout;->f:Z

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/quickaudio/view/TouchPullViewLayout;->init()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 11
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x1

    .line 12
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/TouchPullViewLayout;->f:Z

    .line 13
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/quickaudio/view/TouchPullViewLayout;->init()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 14
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x1

    .line 15
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/TouchPullViewLayout;->f:Z

    .line 16
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/quickaudio/view/TouchPullViewLayout;->init()V

    return-void
.end method

.method public static bridge synthetic h0(Lcom/p1/mobile/putong/core/ui/quickaudio/view/TouchPullViewLayout;)Lcom/p1/mobile/putong/core/ui/quickaudio/view/TouchPullViewLayout$b;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/TouchPullViewLayout;->e:Lcom/p1/mobile/putong/core/ui/quickaudio/view/TouchPullViewLayout$b;

    return-object p0
.end method

.method public static bridge synthetic i0()I
    .locals 1

    .line 1
    sget v0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/TouchPullViewLayout;->g:I

    return v0
.end method

.method private init()V
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/TouchPullViewLayout$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/ui/quickaudio/view/TouchPullViewLayout$a;-><init>(Lcom/p1/mobile/putong/core/ui/quickaudio/view/TouchPullViewLayout;)V

    .line 4
    .line 5
    .line 6
    new-instance v1, Landroid/view/GestureDetector;

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-direct {v1, v2, v0}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    .line 13
    .line 14
    .line 15
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/TouchPullViewLayout;->d:Landroid/view/GestureDetector;

    .line 16
    .line 17
    return-void
.end method

.method public static bridge synthetic j0()I
    .locals 1

    .line 1
    sget v0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/TouchPullViewLayout;->h:I

    return v0
.end method


# virtual methods
.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/TouchPullViewLayout;->f:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-super {p0, p1}, Landroid/view/View;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/TouchPullViewLayout;->d:Landroid/view/GestureDetector;

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const/4 v1, 0x1

    .line 20
    if-ne v0, v1, :cond_1

    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/TouchPullViewLayout;->e:Lcom/p1/mobile/putong/core/ui/quickaudio/view/TouchPullViewLayout$b;

    .line 23
    .line 24
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/TouchPullViewLayout;->e:Lcom/p1/mobile/putong/core/ui/quickaudio/view/TouchPullViewLayout$b;

    .line 31
    .line 32
    invoke-interface {v0, p1}, Lcom/p1/mobile/putong/core/ui/quickaudio/view/TouchPullViewLayout$b;->b(Landroid/view/MotionEvent;)V

    .line 33
    .line 34
    .line 35
    :cond_1
    invoke-super {p0, p1}, Landroid/view/View;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 36
    .line 37
    .line 38
    return v1
.end method

.method public setEnable(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/TouchPullViewLayout;->f:Z

    .line 2
    .line 3
    return-void
.end method

.method public setOnFlingListener(Lcom/p1/mobile/putong/core/ui/quickaudio/view/TouchPullViewLayout$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/TouchPullViewLayout;->e:Lcom/p1/mobile/putong/core/ui/quickaudio/view/TouchPullViewLayout$b;

    .line 2
    .line 3
    return-void
.end method
