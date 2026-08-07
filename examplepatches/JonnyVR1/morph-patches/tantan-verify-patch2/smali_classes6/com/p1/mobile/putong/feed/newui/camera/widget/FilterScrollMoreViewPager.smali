.class public Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager;
.super Landroidx/viewpager/widget/ViewPager;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager$b;,
        Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager$c;
    }
.end annotation


# instance fields
.field public M0:Lcom/p1/mobile/putong/feed/newui/camera/widget/g;

.field public N0:Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager$b;

.field public O0:Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager$c;

.field public P0:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 8
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Landroidx/viewpager/widget/ViewPager;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager;->c0(Landroid/content/Context;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static bridge synthetic b0(Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager;)Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager$c;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager;->O0:Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager$c;

    return-object p0
.end method

.method private c0(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager;->P0:I

    .line 10
    .line 11
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/camera/widget/g;

    .line 12
    .line 13
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/g;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager;->M0:Lcom/p1/mobile/putong/feed/newui/camera/widget/g;

    .line 17
    .line 18
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager;->P0:I

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/g;->g(I)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager;->M0:Lcom/p1/mobile/putong/feed/newui/camera/widget/g;

    .line 24
    .line 25
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager;->P0:I

    .line 26
    .line 27
    mul-int/lit8 v1, v1, 0x3

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/g;->e(I)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager;->M0:Lcom/p1/mobile/putong/feed/newui/camera/widget/g;

    .line 33
    .line 34
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    iget p1, p1, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 43
    .line 44
    div-int/lit8 p1, p1, 0xa

    .line 45
    .line 46
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/g;->f(I)V

    .line 47
    .line 48
    .line 49
    return-void
.end method


# virtual methods
.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager;->M0:Lcom/p1/mobile/putong/feed/newui/camera/widget/g;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/g;->c(Landroid/view/MotionEvent;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager;->N0:Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager$b;

    .line 8
    .line 9
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/4 v2, 0x1

    .line 14
    const/4 v3, 0x0

    .line 15
    if-eqz v1, :cond_2

    .line 16
    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager;->N0:Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager$b;

    .line 18
    .line 19
    invoke-interface {v1, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager$b;->a(Landroid/view/MotionEvent;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-nez v1, :cond_1

    .line 24
    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    move v0, v3

    .line 29
    goto :goto_1

    .line 30
    :cond_1
    :goto_0
    move v0, v2

    .line 31
    :cond_2
    :goto_1
    invoke-super {p0, p1}, Landroidx/viewpager/widget/ViewPager;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-nez p0, :cond_4

    .line 36
    .line 37
    if-eqz v0, :cond_3

    .line 38
    .line 39
    goto :goto_2

    .line 40
    :cond_3
    return v3

    .line 41
    :cond_4
    :goto_2
    return v2
.end method

.method public setBeforeCheckEnableTouchListener(Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager;->N0:Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager$b;

    .line 2
    .line 3
    return-void
.end method

.method public setOnVerticalFlingListener(Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager$c;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager;->O0:Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager$c;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager;->O0:Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager$c;

    .line 6
    .line 7
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager;->M0:Lcom/p1/mobile/putong/feed/newui/camera/widget/g;

    .line 8
    .line 9
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager$a;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager$a;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/g;->d(Lcom/p1/mobile/putong/feed/newui/camera/widget/g$a;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager;->M0:Lcom/p1/mobile/putong/feed/newui/camera/widget/g;

    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/g;->d(Lcom/p1/mobile/putong/feed/newui/camera/widget/g$a;)V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager;->O0:Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager$c;

    .line 25
    .line 26
    return-void
.end method
