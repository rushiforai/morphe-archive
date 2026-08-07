.class public Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;
.super Landroidx/coordinatorlayout/widget/CoordinatorLayout$c;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior$SavedState;,
        Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior$b;,
        Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior$c;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Landroid/view/View;",
        ">",
        "Landroidx/coordinatorlayout/widget/CoordinatorLayout$c<",
        "TV;>;"
    }
.end annotation


# instance fields
.field public a:F

.field public b:I

.field public c:I

.field public d:I

.field public e:Z

.field public f:Z

.field public g:I

.field public h:Ll/ykl0;

.field public i:Z

.field public j:I

.field public k:Z

.field public l:I

.field public m:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "TV;>;"
        }
    .end annotation
.end field

.field public n:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public o:Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior$c;

.field public p:Landroid/view/VelocityTracker;

.field public q:I

.field public r:I

.field public s:Z

.field public final t:Ll/ykl0$c;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 63
    invoke-direct {p0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$c;-><init>()V

    const/4 v0, 0x4

    .line 64
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->g:I

    .line 65
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior$a;

    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior$a;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;)V

    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->t:Ll/ykl0$c;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1, p2}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$c;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x4

    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->g:I

    .line 6
    .line 7
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior$a;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior$a;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->t:Ll/ykl0$c;

    .line 13
    .line 14
    sget-object v0, Lcom/google/android/material/R$styleable;->BottomSheetBehavior_Layout:[I

    .line 15
    .line 16
    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    sget v0, Lcom/google/android/material/R$styleable;->BottomSheetBehavior_Layout_behavior_peekHeight:I

    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    invoke-virtual {p2, v0, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->setPeekHeight(I)V

    .line 28
    .line 29
    .line 30
    sget v0, Lcom/google/android/material/R$styleable;->BottomSheetBehavior_Layout_behavior_hideable:I

    .line 31
    .line 32
    invoke-virtual {p2, v0, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->setHideable(Z)V

    .line 37
    .line 38
    .line 39
    sget v0, Lcom/google/android/material/R$styleable;->BottomSheetBehavior_Layout_behavior_skipCollapsed:I

    .line 40
    .line 41
    invoke-virtual {p2, v0, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->setSkipCollapsed(Z)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    .line 49
    .line 50
    .line 51
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    int-to-float p1, p1

    .line 60
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->a:F

    .line 61
    .line 62
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->q:I

    return p0
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->e:Z

    return p0
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->d:I

    return p0
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->c:I

    return p0
.end method

.method private dispatchOnSlide(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->m:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/view/View;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_1

    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->o:Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior$c;

    .line 16
    .line 17
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->c:I

    .line 24
    .line 25
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->o:Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior$c;

    .line 26
    .line 27
    if-ge p1, v1, :cond_0

    .line 28
    .line 29
    sub-int/2addr p1, v1

    .line 30
    int-to-float p1, p1

    .line 31
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->b:I

    .line 32
    .line 33
    int-to-float p0, p0

    .line 34
    div-float/2addr p1, p0

    .line 35
    invoke-virtual {v2, v0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior$c;->a(Landroid/view/View;F)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_0
    sub-int/2addr p1, v1

    .line 40
    int-to-float p1, p1

    .line 41
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->d:I

    .line 42
    .line 43
    sub-int/2addr p0, v1

    .line 44
    int-to-float p0, p0

    .line 45
    div-float/2addr p1, p0

    .line 46
    invoke-virtual {v2, v0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior$c;->a(Landroid/view/View;F)V

    .line 47
    .line 48
    .line 49
    :cond_1
    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;)Ljava/lang/ref/WeakReference;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->n:Ljava/lang/ref/WeakReference;

    return-object p0
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->g:I

    return p0
.end method

.method private findScrollingChild(Landroid/view/View;)Landroid/view/View;
    .locals 4

    .line 1
    instance-of v0, p1, Ll/ai20;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-object p1

    .line 6
    :cond_0
    instance-of v0, p1, Landroid/view/ViewGroup;

    .line 7
    .line 8
    if-eqz v0, :cond_2

    .line 9
    .line 10
    check-cast p1, Landroid/view/ViewGroup;

    .line 11
    .line 12
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    const/4 v1, 0x0

    .line 17
    :goto_0
    if-ge v1, v0, :cond_2

    .line 18
    .line 19
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-direct {p0, v2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->findScrollingChild(Landroid/view/View;)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    if-eqz v3, :cond_1

    .line 32
    .line 33
    return-object v2

    .line 34
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_2
    const/4 p0, 0x0

    .line 38
    return-object p0
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->s:Z

    return p0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;)Ll/ykl0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->h:Ll/ykl0;

    return-object p0
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;)Ljava/lang/ref/WeakReference;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->m:Ljava/lang/ref/WeakReference;

    return-object p0
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->dispatchOnSlide(I)V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->setStateInternal(I)V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;Landroid/view/View;F)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->shouldHide(Landroid/view/View;F)Z

    move-result p0

    return p0
.end method

.method public static m(III)I
    .locals 0

    .line 1
    if-ge p0, p1, :cond_0

    return p1

    :cond_0
    if-le p0, p2, :cond_1

    return p2

    :cond_1
    return p0
.end method

.method public static n(Landroid/view/View;)Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Landroid/view/View;",
            ">(TV;)",
            "Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior<",
            "TV;>;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    instance-of v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    check-cast p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;

    .line 11
    .line 12
    invoke-virtual {p0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;->f()Landroidx/coordinatorlayout/widget/CoordinatorLayout$c;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    instance-of v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;

    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_0
    const-string p0, "The view is not associated with TopSheetBehavior"

    .line 24
    .line 25
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-object v1

    .line 29
    :cond_1
    const-string p0, "The view is not a child of CoordinatorLayout"

    .line 30
    .line 31
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    return-object v1
.end method

.method private setStateInternal(I)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->g:I

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->g:I

    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->m:Ljava/lang/ref/WeakReference;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Landroid/view/View;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->o:Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior$c;

    .line 23
    .line 24
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-eqz v1, :cond_1

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->o:Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior$c;

    .line 31
    .line 32
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior$c;->b(Landroid/view/View;I)V

    .line 33
    .line 34
    .line 35
    :cond_1
    :goto_0
    return-void
.end method

.method private shouldHide(Landroid/view/View;F)Z
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->c:I

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-le v0, v1, :cond_0

    .line 9
    .line 10
    return v2

    .line 11
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    int-to-float p1, p1

    .line 16
    const v0, 0x3dcccccd    # 0.1f

    .line 17
    .line 18
    .line 19
    mul-float/2addr p2, v0

    .line 20
    add-float/2addr p1, p2

    .line 21
    iget p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->c:I

    .line 22
    .line 23
    int-to-float p2, p2

    .line 24
    sub-float/2addr p1, p2

    .line 25
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->b:I

    .line 30
    .line 31
    int-to-float p0, p0

    .line 32
    div-float/2addr p1, p0

    .line 33
    const/high16 p0, 0x3f000000    # 0.5f

    .line 34
    .line 35
    cmpl-float p0, p1, p0

    .line 36
    .line 37
    if-lez p0, :cond_1

    .line 38
    .line 39
    const/4 p0, 0x1

    .line 40
    return p0

    .line 41
    :cond_1
    return v2
.end method


# virtual methods
.method public final getYVelocity()F
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->p:Landroid/view/VelocityTracker;

    .line 2
    .line 3
    const/16 v1, 0x3e8

    .line 4
    .line 5
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->a:F

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->p:Landroid/view/VelocityTracker;

    .line 11
    .line 12
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->q:I

    .line 13
    .line 14
    invoke-static {v0, p0}, Ll/w1l0;->f(Landroid/view/VelocityTracker;I)F

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public o(Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior$c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->o:Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior$c;

    .line 2
    .line 3
    return-void
.end method

.method public onInterceptTouchEvent(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/coordinatorlayout/widget/CoordinatorLayout;",
            "TV;",
            "Landroid/view/MotionEvent;",
            ")Z"
        }
    .end annotation

    .line 1
    invoke-virtual {p2}, Landroid/view/View;->isShown()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    invoke-static {p3}, Ll/u610;->c(Landroid/view/MotionEvent;)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->reset()V

    .line 16
    .line 17
    .line 18
    :cond_1
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->p:Landroid/view/VelocityTracker;

    .line 19
    .line 20
    if-nez v2, :cond_2

    .line 21
    .line 22
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->p:Landroid/view/VelocityTracker;

    .line 27
    .line 28
    :cond_2
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->p:Landroid/view/VelocityTracker;

    .line 29
    .line 30
    invoke-virtual {v2, p3}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 31
    .line 32
    .line 33
    const/4 v2, -0x1

    .line 34
    const/4 v3, 0x1

    .line 35
    if-eqz v0, :cond_4

    .line 36
    .line 37
    if-eq v0, v3, :cond_3

    .line 38
    .line 39
    const/4 p2, 0x3

    .line 40
    if-eq v0, p2, :cond_3

    .line 41
    .line 42
    goto :goto_1

    .line 43
    :cond_3
    iput-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->s:Z

    .line 44
    .line 45
    iput v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->q:I

    .line 46
    .line 47
    iget-boolean p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->i:Z

    .line 48
    .line 49
    if-eqz p2, :cond_7

    .line 50
    .line 51
    iput-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->i:Z

    .line 52
    .line 53
    return v1

    .line 54
    :cond_4
    invoke-virtual {p3}, Landroid/view/MotionEvent;->getX()F

    .line 55
    .line 56
    .line 57
    move-result v4

    .line 58
    float-to-int v4, v4

    .line 59
    invoke-virtual {p3}, Landroid/view/MotionEvent;->getY()F

    .line 60
    .line 61
    .line 62
    move-result v5

    .line 63
    float-to-int v5, v5

    .line 64
    iput v5, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->r:I

    .line 65
    .line 66
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->n:Ljava/lang/ref/WeakReference;

    .line 67
    .line 68
    invoke-virtual {v5}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v5

    .line 72
    check-cast v5, Landroid/view/View;

    .line 73
    .line 74
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result v6

    .line 78
    if-eqz v6, :cond_5

    .line 79
    .line 80
    iget v6, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->r:I

    .line 81
    .line 82
    invoke-virtual {p1, v5, v4, v6}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->isPointInChildBounds(Landroid/view/View;II)Z

    .line 83
    .line 84
    .line 85
    move-result v5

    .line 86
    if-eqz v5, :cond_5

    .line 87
    .line 88
    invoke-virtual {p3}, Landroid/view/MotionEvent;->getActionIndex()I

    .line 89
    .line 90
    .line 91
    move-result v5

    .line 92
    invoke-virtual {p3, v5}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 93
    .line 94
    .line 95
    move-result v5

    .line 96
    iput v5, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->q:I

    .line 97
    .line 98
    iput-boolean v3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->s:Z

    .line 99
    .line 100
    :cond_5
    iget v5, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->q:I

    .line 101
    .line 102
    if-ne v5, v2, :cond_6

    .line 103
    .line 104
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->r:I

    .line 105
    .line 106
    invoke-virtual {p1, p2, v4, v2}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->isPointInChildBounds(Landroid/view/View;II)Z

    .line 107
    .line 108
    .line 109
    move-result p2

    .line 110
    if-nez p2, :cond_6

    .line 111
    .line 112
    move p2, v3

    .line 113
    goto :goto_0

    .line 114
    :cond_6
    move p2, v1

    .line 115
    :goto_0
    iput-boolean p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->i:Z

    .line 116
    .line 117
    :cond_7
    :goto_1
    iget-boolean p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->i:Z

    .line 118
    .line 119
    if-nez p2, :cond_8

    .line 120
    .line 121
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->h:Ll/ykl0;

    .line 122
    .line 123
    invoke-virtual {p2, p3}, Ll/ykl0;->P(Landroid/view/MotionEvent;)Z

    .line 124
    .line 125
    .line 126
    move-result p2

    .line 127
    if-eqz p2, :cond_8

    .line 128
    .line 129
    return v3

    .line 130
    :cond_8
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->n:Ljava/lang/ref/WeakReference;

    .line 131
    .line 132
    invoke-virtual {p2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 133
    .line 134
    .line 135
    move-result-object p2

    .line 136
    check-cast p2, Landroid/view/View;

    .line 137
    .line 138
    const/4 v2, 0x2

    .line 139
    if-ne v0, v2, :cond_9

    .line 140
    .line 141
    if-eqz p2, :cond_9

    .line 142
    .line 143
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->i:Z

    .line 144
    .line 145
    if-nez v0, :cond_9

    .line 146
    .line 147
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->g:I

    .line 148
    .line 149
    if-eq v0, v3, :cond_9

    .line 150
    .line 151
    invoke-virtual {p3}, Landroid/view/MotionEvent;->getX()F

    .line 152
    .line 153
    .line 154
    move-result v0

    .line 155
    float-to-int v0, v0

    .line 156
    invoke-virtual {p3}, Landroid/view/MotionEvent;->getY()F

    .line 157
    .line 158
    .line 159
    move-result v2

    .line 160
    float-to-int v2, v2

    .line 161
    invoke-virtual {p1, p2, v0, v2}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->isPointInChildBounds(Landroid/view/View;II)Z

    .line 162
    .line 163
    .line 164
    move-result p1

    .line 165
    if-nez p1, :cond_9

    .line 166
    .line 167
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->r:I

    .line 168
    .line 169
    int-to-float p1, p1

    .line 170
    invoke-virtual {p3}, Landroid/view/MotionEvent;->getY()F

    .line 171
    .line 172
    .line 173
    move-result p2

    .line 174
    sub-float/2addr p1, p2

    .line 175
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 176
    .line 177
    .line 178
    move-result p1

    .line 179
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->h:Ll/ykl0;

    .line 180
    .line 181
    invoke-virtual {p0}, Ll/ykl0;->z()I

    .line 182
    .line 183
    .line 184
    move-result p0

    .line 185
    int-to-float p0, p0

    .line 186
    cmpl-float p0, p1, p0

    .line 187
    .line 188
    if-lez p0, :cond_9

    .line 189
    .line 190
    return v3

    .line 191
    :cond_9
    return v1
.end method

.method public onLayoutChild(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;I)Z
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/coordinatorlayout/widget/CoordinatorLayout;",
            "TV;I)Z"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/kkl0;->u(Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-static {p2}, Ll/kkl0;->u(Landroid/view/View;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    invoke-static {p2, v1}, Ll/kkl0;->r0(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    :cond_0
    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    invoke-virtual {p1, p2, p3}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->onLayoutChild(Landroid/view/View;I)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 25
    .line 26
    .line 27
    move-result p3

    .line 28
    iput p3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->l:I

    .line 29
    .line 30
    invoke-virtual {p2}, Landroid/view/View;->getHeight()I

    .line 31
    .line 32
    .line 33
    move-result p3

    .line 34
    neg-int p3, p3

    .line 35
    invoke-virtual {p2}, Landroid/view/View;->getHeight()I

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    iget v3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->b:I

    .line 40
    .line 41
    sub-int/2addr v2, v3

    .line 42
    neg-int v2, v2

    .line 43
    invoke-static {p3, v2}, Ljava/lang/Math;->max(II)I

    .line 44
    .line 45
    .line 46
    move-result p3

    .line 47
    iput p3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->c:I

    .line 48
    .line 49
    const/4 v2, 0x0

    .line 50
    iput v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->d:I

    .line 51
    .line 52
    iget v3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->g:I

    .line 53
    .line 54
    const/4 v4, 0x3

    .line 55
    if-ne v3, v4, :cond_1

    .line 56
    .line 57
    invoke-static {p2, v2}, Ll/kkl0;->V(Landroid/view/View;I)V

    .line 58
    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_1
    iget-boolean v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->e:Z

    .line 62
    .line 63
    if-eqz v2, :cond_2

    .line 64
    .line 65
    const/4 v2, 0x5

    .line 66
    if-ne v3, v2, :cond_2

    .line 67
    .line 68
    invoke-virtual {p2}, Landroid/view/View;->getHeight()I

    .line 69
    .line 70
    .line 71
    move-result p3

    .line 72
    neg-int p3, p3

    .line 73
    invoke-static {p2, p3}, Ll/kkl0;->V(Landroid/view/View;I)V

    .line 74
    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_2
    const/4 v2, 0x4

    .line 78
    if-ne v3, v2, :cond_3

    .line 79
    .line 80
    invoke-static {p2, p3}, Ll/kkl0;->V(Landroid/view/View;I)V

    .line 81
    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_3
    if-eq v3, v1, :cond_4

    .line 85
    .line 86
    const/4 p3, 0x2

    .line 87
    if-ne v3, p3, :cond_5

    .line 88
    .line 89
    :cond_4
    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    .line 90
    .line 91
    .line 92
    move-result p3

    .line 93
    sub-int/2addr v0, p3

    .line 94
    invoke-static {p2, v0}, Ll/kkl0;->V(Landroid/view/View;I)V

    .line 95
    .line 96
    .line 97
    :cond_5
    :goto_0
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->h:Ll/ykl0;

    .line 98
    .line 99
    if-nez p3, :cond_6

    .line 100
    .line 101
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->t:Ll/ykl0$c;

    .line 102
    .line 103
    invoke-static {p1, p3}, Ll/ykl0;->p(Landroid/view/ViewGroup;Ll/ykl0$c;)Ll/ykl0;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->h:Ll/ykl0;

    .line 108
    .line 109
    :cond_6
    new-instance p1, Ljava/lang/ref/WeakReference;

    .line 110
    .line 111
    invoke-direct {p1, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 112
    .line 113
    .line 114
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->m:Ljava/lang/ref/WeakReference;

    .line 115
    .line 116
    new-instance p1, Ljava/lang/ref/WeakReference;

    .line 117
    .line 118
    invoke-direct {p0, p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->findScrollingChild(Landroid/view/View;)Landroid/view/View;

    .line 119
    .line 120
    .line 121
    move-result-object p2

    .line 122
    invoke-direct {p1, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 123
    .line 124
    .line 125
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->n:Ljava/lang/ref/WeakReference;

    .line 126
    .line 127
    return v1
.end method

.method public onNestedPreFling(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;FF)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/coordinatorlayout/widget/CoordinatorLayout;",
            "TV;",
            "Landroid/view/View;",
            "FF)Z"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->n:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-ne p3, v0, :cond_1

    .line 8
    .line 9
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->g:I

    .line 10
    .line 11
    const/4 v1, 0x3

    .line 12
    if-ne v0, v1, :cond_0

    .line 13
    .line 14
    invoke-super/range {p0 .. p5}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$c;->onNestedPreFling(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;FF)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    if-eqz p0, :cond_1

    .line 19
    .line 20
    :cond_0
    const/4 p0, 0x1

    .line 21
    return p0

    .line 22
    :cond_1
    const/4 p0, 0x0

    .line 23
    return p0
.end method

.method public onNestedPreScroll(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;II[I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/coordinatorlayout/widget/CoordinatorLayout;",
            "TV;",
            "Landroid/view/View;",
            "II[I)V"
        }
    .end annotation

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->n:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Landroid/view/View;

    .line 8
    .line 9
    if-eq p3, p1, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    sub-int p4, p1, p5

    .line 17
    .line 18
    const/4 v0, 0x1

    .line 19
    if-lez p5, :cond_3

    .line 20
    .line 21
    invoke-static {p3, v0}, Ll/kkl0;->d(Landroid/view/View;I)Z

    .line 22
    .line 23
    .line 24
    move-result p3

    .line 25
    if-nez p3, :cond_5

    .line 26
    .line 27
    iget p3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->c:I

    .line 28
    .line 29
    if-ge p4, p3, :cond_2

    .line 30
    .line 31
    iget-boolean p4, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->e:Z

    .line 32
    .line 33
    if-eqz p4, :cond_1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    sub-int/2addr p1, p3

    .line 37
    aput p1, p6, v0

    .line 38
    .line 39
    neg-int p1, p1

    .line 40
    invoke-static {p2, p1}, Ll/kkl0;->V(Landroid/view/View;I)V

    .line 41
    .line 42
    .line 43
    const/4 p1, 0x4

    .line 44
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->setStateInternal(I)V

    .line 45
    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_2
    :goto_0
    aput p5, p6, v0

    .line 49
    .line 50
    neg-int p1, p5

    .line 51
    invoke-static {p2, p1}, Ll/kkl0;->V(Landroid/view/View;I)V

    .line 52
    .line 53
    .line 54
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->setStateInternal(I)V

    .line 55
    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_3
    if-gez p5, :cond_5

    .line 59
    .line 60
    iget p3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->d:I

    .line 61
    .line 62
    if-ge p4, p3, :cond_4

    .line 63
    .line 64
    aput p5, p6, v0

    .line 65
    .line 66
    neg-int p1, p5

    .line 67
    invoke-static {p2, p1}, Ll/kkl0;->V(Landroid/view/View;I)V

    .line 68
    .line 69
    .line 70
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->setStateInternal(I)V

    .line 71
    .line 72
    .line 73
    goto :goto_1

    .line 74
    :cond_4
    sub-int/2addr p1, p3

    .line 75
    aput p1, p6, v0

    .line 76
    .line 77
    neg-int p1, p1

    .line 78
    invoke-static {p2, p1}, Ll/kkl0;->V(Landroid/view/View;I)V

    .line 79
    .line 80
    .line 81
    const/4 p1, 0x3

    .line 82
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->setStateInternal(I)V

    .line 83
    .line 84
    .line 85
    :cond_5
    :goto_1
    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->dispatchOnSlide(I)V

    .line 90
    .line 91
    .line 92
    iput p5, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->j:I

    .line 93
    .line 94
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->k:Z

    .line 95
    .line 96
    return-void
.end method

.method public onRestoreInstanceState(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/os/Parcelable;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/coordinatorlayout/widget/CoordinatorLayout;",
            "TV;",
            "Landroid/os/Parcelable;",
            ")V"
        }
    .end annotation

    .line 1
    check-cast p3, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior$SavedState;

    .line 2
    .line 3
    invoke-virtual {p3}, Landroidx/customview/view/AbsSavedState;->getSuperState()Landroid/os/Parcelable;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-super {p0, p1, p2, v0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$c;->onRestoreInstanceState(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/os/Parcelable;)V

    .line 8
    .line 9
    .line 10
    iget p1, p3, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior$SavedState;->state:I

    .line 11
    .line 12
    const/4 p2, 0x1

    .line 13
    if-eq p1, p2, :cond_1

    .line 14
    .line 15
    const/4 p2, 0x2

    .line 16
    if-ne p1, p2, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->g:I

    .line 20
    .line 21
    return-void

    .line 22
    :cond_1
    :goto_0
    const/4 p1, 0x4

    .line 23
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->g:I

    .line 24
    .line 25
    return-void
.end method

.method public onSaveInstanceState(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;)Landroid/os/Parcelable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/coordinatorlayout/widget/CoordinatorLayout;",
            "TV;)",
            "Landroid/os/Parcelable;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior$SavedState;

    .line 2
    .line 3
    invoke-super {p0, p1, p2}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$c;->onSaveInstanceState(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;)Landroid/os/Parcelable;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->g:I

    .line 8
    .line 9
    invoke-direct {v0, p1, p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior$SavedState;-><init>(Landroid/os/Parcelable;I)V

    .line 10
    .line 11
    .line 12
    return-object v0
.end method

.method public onStartNestedScroll(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;Landroid/view/View;I)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/coordinatorlayout/widget/CoordinatorLayout;",
            "TV;",
            "Landroid/view/View;",
            "Landroid/view/View;",
            "I)Z"
        }
    .end annotation

    .line 1
    const/4 p1, 0x0

    .line 2
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->j:I

    .line 3
    .line 4
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->k:Z

    .line 5
    .line 6
    and-int/lit8 p0, p5, 0x2

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    return p0

    .line 12
    :cond_0
    return p1
.end method

.method public onStopNestedScroll(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/coordinatorlayout/widget/CoordinatorLayout;",
            "TV;",
            "Landroid/view/View;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->d:I

    .line 6
    .line 7
    const/4 v1, 0x3

    .line 8
    if-ne p1, v0, :cond_0

    .line 9
    .line 10
    invoke-direct {p0, v1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->setStateInternal(I)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->n:Ljava/lang/ref/WeakReference;

    .line 15
    .line 16
    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    if-ne p3, p1, :cond_7

    .line 21
    .line 22
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->k:Z

    .line 23
    .line 24
    if-nez p1, :cond_1

    .line 25
    .line 26
    goto :goto_3

    .line 27
    :cond_1
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->j:I

    .line 28
    .line 29
    if-gez p1, :cond_2

    .line 30
    .line 31
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->d:I

    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_2
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->e:Z

    .line 35
    .line 36
    if-eqz p1, :cond_3

    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->getYVelocity()F

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    invoke-direct {p0, p2, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->shouldHide(Landroid/view/View;F)Z

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    if-eqz p1, :cond_3

    .line 47
    .line 48
    invoke-virtual {p2}, Landroid/view/View;->getHeight()I

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    neg-int p1, p1

    .line 53
    const/4 v1, 0x5

    .line 54
    goto :goto_1

    .line 55
    :cond_3
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->j:I

    .line 56
    .line 57
    const/4 p3, 0x4

    .line 58
    if-nez p1, :cond_5

    .line 59
    .line 60
    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->c:I

    .line 65
    .line 66
    sub-int v0, p1, v0

    .line 67
    .line 68
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->d:I

    .line 73
    .line 74
    sub-int/2addr p1, v2

    .line 75
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    .line 76
    .line 77
    .line 78
    move-result p1

    .line 79
    if-le v0, p1, :cond_4

    .line 80
    .line 81
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->d:I

    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_4
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->c:I

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_5
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->c:I

    .line 88
    .line 89
    :goto_0
    move v1, p3

    .line 90
    :goto_1
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->h:Ll/ykl0;

    .line 91
    .line 92
    invoke-virtual {p2}, Landroid/view/View;->getLeft()I

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    invoke-virtual {p3, p2, v0, p1}, Ll/ykl0;->Q(Landroid/view/View;II)Z

    .line 97
    .line 98
    .line 99
    move-result p1

    .line 100
    if-eqz p1, :cond_6

    .line 101
    .line 102
    const/4 p1, 0x2

    .line 103
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->setStateInternal(I)V

    .line 104
    .line 105
    .line 106
    new-instance p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior$b;

    .line 107
    .line 108
    invoke-direct {p1, p0, p2, v1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior$b;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;Landroid/view/View;I)V

    .line 109
    .line 110
    .line 111
    invoke-static {p2, p1}, Ll/kkl0;->b0(Landroid/view/View;Ljava/lang/Runnable;)V

    .line 112
    .line 113
    .line 114
    goto :goto_2

    .line 115
    :cond_6
    invoke-direct {p0, v1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->setStateInternal(I)V

    .line 116
    .line 117
    .line 118
    :goto_2
    const/4 p1, 0x0

    .line 119
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->k:Z

    .line 120
    .line 121
    :cond_7
    :goto_3
    return-void
.end method

.method public onTouchEvent(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/coordinatorlayout/widget/CoordinatorLayout;",
            "TV;",
            "Landroid/view/MotionEvent;",
            ")Z"
        }
    .end annotation

    .line 1
    invoke-virtual {p2}, Landroid/view/View;->isShown()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    invoke-static {p3}, Ll/u610;->c(Landroid/view/MotionEvent;)I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->g:I

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    if-ne v0, v1, :cond_1

    .line 17
    .line 18
    if-nez p1, :cond_1

    .line 19
    .line 20
    return v1

    .line 21
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->h:Ll/ykl0;

    .line 22
    .line 23
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_2

    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->h:Ll/ykl0;

    .line 30
    .line 31
    invoke-virtual {v0, p3}, Ll/ykl0;->G(Landroid/view/MotionEvent;)V

    .line 32
    .line 33
    .line 34
    :cond_2
    if-nez p1, :cond_3

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->reset()V

    .line 37
    .line 38
    .line 39
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->p:Landroid/view/VelocityTracker;

    .line 40
    .line 41
    if-nez v0, :cond_4

    .line 42
    .line 43
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->p:Landroid/view/VelocityTracker;

    .line 48
    .line 49
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->p:Landroid/view/VelocityTracker;

    .line 50
    .line 51
    invoke-virtual {v0, p3}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 52
    .line 53
    .line 54
    const/4 v0, 0x2

    .line 55
    if-ne p1, v0, :cond_5

    .line 56
    .line 57
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->i:Z

    .line 58
    .line 59
    if-nez p1, :cond_5

    .line 60
    .line 61
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->r:I

    .line 62
    .line 63
    int-to-float p1, p1

    .line 64
    invoke-virtual {p3}, Landroid/view/MotionEvent;->getY()F

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    sub-float/2addr p1, v0

    .line 69
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->h:Ll/ykl0;

    .line 74
    .line 75
    invoke-virtual {v0}, Ll/ykl0;->z()I

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    int-to-float v0, v0

    .line 80
    cmpl-float p1, p1, v0

    .line 81
    .line 82
    if-lez p1, :cond_5

    .line 83
    .line 84
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->h:Ll/ykl0;

    .line 85
    .line 86
    invoke-virtual {p3}, Landroid/view/MotionEvent;->getActionIndex()I

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    invoke-virtual {p3, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 91
    .line 92
    .line 93
    move-result p3

    .line 94
    invoke-virtual {p1, p2, p3}, Ll/ykl0;->c(Landroid/view/View;I)V

    .line 95
    .line 96
    .line 97
    :cond_5
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->i:Z

    .line 98
    .line 99
    xor-int/2addr p0, v1

    .line 100
    return p0
.end method

.method public final reset()V
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->q:I

    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->p:Landroid/view/VelocityTracker;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->p:Landroid/view/VelocityTracker;

    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/view/VelocityTracker;->recycle()V

    .line 15
    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->p:Landroid/view/VelocityTracker;

    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public setHideable(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->e:Z

    .line 2
    .line 3
    return-void
.end method

.method public final setPeekHeight(I)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    .line 3
    .line 4
    .line 5
    move-result p1

    .line 6
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->b:I

    .line 7
    .line 8
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->m:Ljava/lang/ref/WeakReference;

    .line 9
    .line 10
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->m:Ljava/lang/ref/WeakReference;

    .line 17
    .line 18
    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-eqz p1, :cond_0

    .line 27
    .line 28
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->m:Ljava/lang/ref/WeakReference;

    .line 29
    .line 30
    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    check-cast p1, Landroid/view/View;

    .line 35
    .line 36
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    neg-int p1, p1

    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->m:Ljava/lang/ref/WeakReference;

    .line 42
    .line 43
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    check-cast v0, Landroid/view/View;

    .line 48
    .line 49
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->b:I

    .line 54
    .line 55
    sub-int/2addr v0, v1

    .line 56
    neg-int v0, v0

    .line 57
    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->c:I

    .line 62
    .line 63
    :cond_0
    return-void
.end method

.method public setSkipCollapsed(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/TopSheetBehavior;->f:Z

    .line 2
    .line 3
    return-void
.end method
