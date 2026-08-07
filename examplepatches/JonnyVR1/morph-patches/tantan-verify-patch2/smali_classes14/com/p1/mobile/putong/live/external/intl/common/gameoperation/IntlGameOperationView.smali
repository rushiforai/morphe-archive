.class public Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/RelativeLayout;",
        "Ll/iam<",
        "Ll/rkn;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VPager;

.field public b:Lv/VImage;

.field public c:Ll/rkn;

.field public final d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveGameOperationConfig;",
            ">;"
        }
    .end annotation
.end field

.field public e:Ll/lkn;

.field public f:I

.field public final g:Ljava/lang/Runnable;

.field public final h:Landroid/os/Handler;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->d:Ljava/util/List;

    .line 10
    .line 11
    new-instance p1, Ll/skn;

    .line 12
    .line 13
    invoke-direct {p1, p0}, Ll/skn;-><init>(Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;)V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->g:Ljava/lang/Runnable;

    .line 17
    .line 18
    new-instance p1, Landroid/os/Handler;

    .line 19
    .line 20
    invoke-direct {p1}, Landroid/os/Handler;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->h:Landroid/os/Handler;

    .line 24
    .line 25
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 26
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 27
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->d:Ljava/util/List;

    .line 28
    new-instance p1, Ll/skn;

    invoke-direct {p1, p0}, Ll/skn;-><init>(Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->g:Ljava/lang/Runnable;

    .line 29
    new-instance p1, Landroid/os/Handler;

    invoke-direct {p1}, Landroid/os/Handler;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->h:Landroid/os/Handler;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 30
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 31
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->d:Ljava/util/List;

    .line 32
    new-instance p1, Ll/skn;

    invoke-direct {p1, p0}, Ll/skn;-><init>(Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->g:Ljava/lang/Runnable;

    .line 33
    new-instance p1, Landroid/os/Handler;

    invoke-direct {p1}, Landroid/os/Handler;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->h:Landroid/os/Handler;

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;Lcom/p1/mobile/putong/live/base/data/BLiveGameOperationConfig;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->p(Lcom/p1/mobile/putong/live/base/data/BLiveGameOperationConfig;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->q(Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->n()V

    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->f:I

    return p0
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->d:Ljava/util/List;

    return-object p0
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->f:I

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->m()V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->s()V

    return-void
.end method

.method private synthetic n()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->a:Lv/VPager;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    add-int/lit8 v0, v0, 0x1

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private synthetic q(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_1

    .line 6
    .line 7
    const/4 p2, 0x1

    .line 8
    if-eq p1, p2, :cond_0

    .line 9
    .line 10
    const/4 p2, 0x2

    .line 11
    if-eq p1, p2, :cond_1

    .line 12
    .line 13
    const/4 p2, 0x3

    .line 14
    if-eq p1, p2, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->s()V

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->h:Landroid/os/Handler;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->g:Ljava/lang/Runnable;

    .line 24
    .line 25
    invoke-virtual {p1, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 26
    .line 27
    .line 28
    :goto_0
    const/4 p0, 0x0

    .line 29
    return p0
.end method

.method private s()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_2

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->d:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->a:Lv/VPager;

    .line 16
    .line 17
    invoke-virtual {v1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-gt v0, v1, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->d:Ljava/util/List;

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->a:Lv/VPager;

    .line 27
    .line 28
    invoke-virtual {v1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveGameOperationConfig;

    .line 37
    .line 38
    iget v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGameOperationConfig;->durTimeSec:I

    .line 39
    .line 40
    if-gtz v0, :cond_1

    .line 41
    .line 42
    const/16 v0, 0xa

    .line 43
    .line 44
    :cond_1
    mul-int/lit16 v0, v0, 0x3e8

    .line 45
    .line 46
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->h:Landroid/os/Handler;

    .line 47
    .line 48
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->g:Ljava/lang/Runnable;

    .line 49
    .line 50
    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 51
    .line 52
    .line 53
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->h:Landroid/os/Handler;

    .line 54
    .line 55
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->g:Ljava/lang/Runnable;

    .line 56
    .line 57
    int-to-long v2, v0

    .line 58
    invoke-virtual {v1, p0, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 59
    .line 60
    .line 61
    :cond_2
    :goto_0
    return-void
.end method

.method private setViewPager(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveGameOperationConfig;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->e:Ll/lkn;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/lkn;

    .line 6
    .line 7
    new-instance v1, Ll/tkn;

    .line 8
    .line 9
    invoke-direct {v1, p0}, Ll/tkn;-><init>(Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;)V

    .line 10
    .line 11
    .line 12
    invoke-direct {v0, v1}, Ll/lkn;-><init>(Ll/y20;)V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->e:Ll/lkn;

    .line 16
    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->a:Lv/VPager;

    .line 18
    .line 19
    invoke-virtual {v1, v0}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    const/4 v1, 0x1

    .line 27
    if-le v0, v1, :cond_1

    .line 28
    .line 29
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->v()V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->d:Ljava/util/List;

    .line 33
    .line 34
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->d:Ljava/util/List;

    .line 38
    .line 39
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    sub-int/2addr v2, v1

    .line 44
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    check-cast v2, Lcom/p1/mobile/putong/live/base/data/BLiveGameOperationConfig;

    .line 49
    .line 50
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->d:Ljava/util/List;

    .line 54
    .line 55
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->d:Ljava/util/List;

    .line 59
    .line 60
    const/4 v2, 0x0

    .line 61
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveGameOperationConfig;

    .line 66
    .line 67
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->h:Landroid/os/Handler;

    .line 72
    .line 73
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->g:Ljava/lang/Runnable;

    .line 74
    .line 75
    invoke-virtual {v0, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->a:Lv/VPager;

    .line 79
    .line 80
    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->i()V

    .line 81
    .line 82
    .line 83
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->a:Lv/VPager;

    .line 84
    .line 85
    const/4 v2, 0x0

    .line 86
    invoke-virtual {v0, v2}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 87
    .line 88
    .line 89
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->d:Ljava/util/List;

    .line 90
    .line 91
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 92
    .line 93
    .line 94
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->d:Ljava/util/List;

    .line 95
    .line 96
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 97
    .line 98
    .line 99
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->a:Lv/VPager;

    .line 100
    .line 101
    invoke-virtual {p1, v1}, Landroidx/viewpager/widget/ViewPager;->setOffscreenPageLimit(I)V

    .line 102
    .line 103
    .line 104
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->e:Ll/lkn;

    .line 105
    .line 106
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->d:Ljava/util/List;

    .line 107
    .line 108
    invoke-virtual {p1, p0}, Ll/lkn;->q(Ljava/util/List;)V

    .line 109
    .line 110
    .line 111
    return-void
.end method

.method private v()V
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ClickableViewAccessibility"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->a:Lv/VPager;

    .line 2
    .line 3
    new-instance v1, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView$a;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView$a;-><init>(Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->a:Lv/VPager;

    .line 12
    .line 13
    new-instance v1, Ll/ukn;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/ukn;-><init>(Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public destroy()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->h:Landroid/os/Handler;

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->g:Ljava/lang/Runnable;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->a:Lv/VPager;

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->a:Lv/VPager;

    .line 19
    .line 20
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->i()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/rkn;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->l(Ll/rkn;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public final k(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/vkn;->a(Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public l(Ll/rkn;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->c:Ll/rkn;

    .line 2
    .line 3
    return-void
.end method

.method public final m()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_3

    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->a:Lv/VPager;

    .line 11
    .line 12
    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->d:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-lt v0, v2, :cond_0

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->d:Ljava/util/List;

    .line 26
    .line 27
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->a:Lv/VPager;

    .line 28
    .line 29
    invoke-virtual {v2}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveGameOperationConfig;

    .line 38
    .line 39
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    if-eqz v2, :cond_2

    .line 44
    .line 45
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGameOperationConfig;->promptMethod:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    if-nez v2, :cond_2

    .line 52
    .line 53
    sget-object v2, Ll/itd0;->e:Ll/itd0;

    .line 54
    .line 55
    invoke-static {v2}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    check-cast v2, Ll/fm3;

    .line 60
    .line 61
    iget-object v2, v2, Ll/fm3;->j:Ll/zbp;

    .line 62
    .line 63
    invoke-virtual {v2}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    check-cast v2, Lcom/p1/mobile/putong/live/base/data/BLiveGameOperationRedDot;

    .line 68
    .line 69
    if-eqz v2, :cond_1

    .line 70
    .line 71
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveGameOperationRedDot;->data:Ljava/util/List;

    .line 72
    .line 73
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGameOperationConfig;->alias:Ljava/lang/String;

    .line 74
    .line 75
    invoke-interface {v2, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    if-eqz v0, :cond_1

    .line 80
    .line 81
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->b:Lv/VImage;

    .line 82
    .line 83
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->b:Lv/VImage;

    .line 88
    .line 89
    const/4 v0, 0x1

    .line 90
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 91
    .line 92
    .line 93
    return-void

    .line 94
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->b:Lv/VImage;

    .line 95
    .line 96
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 97
    .line 98
    .line 99
    return-void

    .line 100
    :cond_3
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->b:Lv/VImage;

    .line 101
    .line 102
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 103
    .line 104
    .line 105
    return-void
.end method

.method public onFinishInflate()V
    .locals 6

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->k(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->a:Lv/VPager;

    .line 8
    .line 9
    const/high16 p0, 0x41400000    # 12.0f

    .line 10
    .line 11
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v5

    .line 15
    const/4 v1, 0x0

    .line 16
    const/4 v2, 0x0

    .line 17
    const/4 v3, 0x0

    .line 18
    const/4 v4, 0x0

    .line 19
    invoke-static/range {v0 .. v5}, Ll/qnp0;->c1(Landroid/view/View;IIIII)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final synthetic p(Lcom/p1/mobile/putong/live/base/data/BLiveGameOperationConfig;)V
    .locals 4

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGameOperationConfig;->url:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_2

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->b:Lv/VImage;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGameOperationConfig;->promptMethod:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    sget-object v0, Ll/itd0;->e:Ll/itd0;

    .line 24
    .line 25
    invoke-static {v0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    check-cast v1, Ll/fm3;

    .line 30
    .line 31
    iget-object v1, v1, Ll/fm3;->j:Ll/zbp;

    .line 32
    .line 33
    invoke-virtual {v1}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveGameOperationRedDot;

    .line 38
    .line 39
    if-nez v1, :cond_0

    .line 40
    .line 41
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveGameOperationRedDot;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveGameOperationRedDot;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    :cond_0
    iget-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGameOperationRedDot;->data:Ljava/util/List;

    .line 46
    .line 47
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGameOperationConfig;->alias:Ljava/lang/String;

    .line 48
    .line 49
    invoke-interface {v2, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    if-nez v2, :cond_1

    .line 54
    .line 55
    iget-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGameOperationRedDot;->data:Ljava/util/List;

    .line 56
    .line 57
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGameOperationConfig;->alias:Ljava/lang/String;

    .line 58
    .line 59
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    invoke-static {v0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    check-cast v0, Ll/fm3;

    .line 67
    .line 68
    iget-object v0, v0, Ll/fm3;->j:Ll/zbp;

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Ll/dyd0;->put(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->c:Ll/rkn;

    .line 74
    .line 75
    invoke-virtual {p0, p1}, Ll/rkn;->Y2(Lcom/p1/mobile/putong/live/base/data/BLiveGameOperationConfig;)V

    .line 76
    .line 77
    .line 78
    :cond_2
    return-void
.end method

.method public u(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveGameOperationConfig;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->h:Landroid/os/Handler;

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->g:Ljava/lang/Runnable;

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->d:Ljava/util/List;

    .line 19
    .line 20
    if-eqz p0, :cond_0

    .line 21
    .line 22
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void

    .line 26
    :cond_1
    const/4 v0, 0x1

    .line 27
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 28
    .line 29
    .line 30
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->setViewPager(Ljava/util/List;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->w()V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->d:Ljava/util/List;

    .line 37
    .line 38
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->a:Lv/VPager;

    .line 43
    .line 44
    if-le p1, v0, :cond_2

    .line 45
    .line 46
    invoke-virtual {v2, v0}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_2
    invoke-virtual {v2, v1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 51
    .line 52
    .line 53
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->m()V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public final w()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/high16 v1, 0x428c0000    # 70.0f

    .line 6
    .line 7
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    iput v2, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 12
    .line 13
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method
