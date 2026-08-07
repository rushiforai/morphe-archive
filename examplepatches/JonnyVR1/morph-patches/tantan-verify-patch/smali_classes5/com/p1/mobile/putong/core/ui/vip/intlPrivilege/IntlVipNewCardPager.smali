.class public Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewCardPager;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Landroidx/viewpager/widget/ViewPager$j;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewCardPager$a;,
        Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewCardPager$b;
    }
.end annotation


# instance fields
.field public a:Lv/VFrame;

.field public b:Landroidx/viewpager/widget/ViewPager;

.field public c:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            ">;"
        }
    .end annotation
.end field

.field public d:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewCardPager$a;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewCardPager;->c:Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewCardPager;->d()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 15
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 16
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewCardPager;->c:Ljava/util/ArrayList;

    .line 17
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewCardPager;->d()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 18
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 19
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewCardPager;->c:Ljava/util/ArrayList;

    .line 20
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewCardPager;->d()V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewCardPager;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewCardPager;->e(Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method

.method private c()V
    .locals 3

    .line 1
    invoke-static {}, Ll/bnl0;->w0()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/16 v1, 0x500

    .line 6
    .line 7
    if-gt v0, v1, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewCardPager;->b:Landroidx/viewpager/widget/ViewPager;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const/high16 v1, 0x42c80000    # 100.0f

    .line 16
    .line 17
    invoke-static {}, Ll/vnb;->m1()F

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    mul-float/2addr v2, v1

    .line 22
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 27
    .line 28
    const/high16 v1, 0x43aa0000    # 340.0f

    .line 29
    .line 30
    invoke-static {}, Ll/vnb;->m1()F

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    mul-float/2addr v2, v1

    .line 35
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewCardPager;->b:Landroidx/viewpager/widget/ViewPager;

    .line 42
    .line 43
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 44
    .line 45
    .line 46
    :cond_0
    return-void
.end method

.method private d()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0, p0}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewCardPager;->b(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewCardPager;->b:Landroidx/viewpager/widget/ViewPager;

    .line 17
    .line 18
    const/4 v1, 0x3

    .line 19
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setOffscreenPageLimit(I)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewCardPager;->b:Landroidx/viewpager/widget/ViewPager;

    .line 23
    .line 24
    const/high16 v1, 0x40400000    # 3.0f

    .line 25
    .line 26
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setPageMargin(I)V

    .line 31
    .line 32
    .line 33
    new-instance v0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewCardPager$a;

    .line 34
    .line 35
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewCardPager$a;-><init>()V

    .line 36
    .line 37
    .line 38
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewCardPager;->d:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewCardPager$a;

    .line 39
    .line 40
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewCardPager;->b:Landroidx/viewpager/widget/ViewPager;

    .line 41
    .line 42
    invoke-virtual {v1, v0}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewCardPager;->b:Landroidx/viewpager/widget/ViewPager;

    .line 46
    .line 47
    invoke-virtual {v0, p0}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 48
    .line 49
    .line 50
    new-instance v0, Ll/ump;

    .line 51
    .line 52
    invoke-direct {v0, p0}, Ll/ump;-><init>(Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewCardPager;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0, v0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 56
    .line 57
    .line 58
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewCardPager;->c()V

    .line 59
    .line 60
    .line 61
    return-void
.end method


# virtual methods
.method public b(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/vmp;->b(Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewCardPager;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic e(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewCardPager;->b:Landroidx/viewpager/widget/ViewPager;

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Landroid/view/View;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getAdapter()Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewCardPager$a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewCardPager;->d:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewCardPager$a;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPosition()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewCardPager;->d:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewCardPager$a;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewCardPager;->b:Landroidx/viewpager/widget/ViewPager;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewCardPager$a;->q(I)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public onPageScrollStateChanged(I)V
    .locals 0

    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewCardPager;->a:Lv/VFrame;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onPageSelected(I)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewCardPager;->d:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewCardPager$a;

    .line 7
    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewCardPager$a;->r(I)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewCardPager$a;->q(I)I

    .line 15
    .line 16
    .line 17
    throw v0
.end method

.method public setCurrentItem(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewCardPager;->b:Landroidx/viewpager/widget/ViewPager;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewCardPager;->c:Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    mul-int/lit8 p0, p0, 0x32

    .line 10
    .line 11
    add-int/2addr p0, p1

    .line 12
    invoke-virtual {v0, p0}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public setOnPageChangeListener(Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewCardPager$b;)V
    .locals 0

    return-void
.end method
