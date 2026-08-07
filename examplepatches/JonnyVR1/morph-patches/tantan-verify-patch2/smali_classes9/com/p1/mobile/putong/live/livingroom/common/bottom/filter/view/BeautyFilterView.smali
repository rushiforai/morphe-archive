.class public Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/OnFlingFrameLayout;

.field public b:Lv/VText;

.field public c:Landroid/widget/RelativeLayout;

.field public d:Lv/VText;

.field public e:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/TextSeekBar;

.field public f:Landroid/widget/RelativeLayout;

.field public g:Lv/VText;

.field public h:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/TextSeekBar;

.field public i:Landroid/widget/FrameLayout;

.field public j:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView;

.field public k:Lcom/google/android/material/tabs/TabLayout;

.field public l:Lv/VLinear;

.field public m:Lv/VPagerNoPage;

.field public n:Ll/bf60;

.field public o:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;",
            ">;"
        }
    .end annotation
.end field

.field public p:Ll/x20;

.field public final q:Ll/jxd0;

.field public final r:Ll/jxd0;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/jxd0;

    .line 5
    .line 6
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {v0}, Ll/uyr;->j(Ljava/lang/String;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 17
    .line 18
    invoke-direct {p1, v0, v1}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 19
    .line 20
    .line 21
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->q:Ll/jxd0;

    .line 22
    .line 23
    new-instance p1, Ll/jxd0;

    .line 24
    .line 25
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 26
    .line 27
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-static {v0}, Ll/uyr;->f(Ljava/lang/String;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-direct {p1, v0, v1}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 36
    .line 37
    .line 38
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->r:Ll/jxd0;

    .line 39
    .line 40
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 41
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 42
    new-instance p1, Ll/jxd0;

    sget-object p2, Ll/zrv;->a:Ll/wrv;

    .line 43
    invoke-virtual {p2}, Ll/wrv;->D0()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Ll/uyr;->j(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 44
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-direct {p1, p2, v0}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->q:Ll/jxd0;

    .line 45
    new-instance p1, Ll/jxd0;

    sget-object p2, Ll/zrv;->a:Ll/wrv;

    .line 46
    invoke-virtual {p2}, Ll/wrv;->D0()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Ll/uyr;->f(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2, v0}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->r:Ll/jxd0;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 47
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 48
    new-instance p1, Ll/jxd0;

    sget-object p2, Ll/zrv;->a:Ll/wrv;

    .line 49
    invoke-virtual {p2}, Ll/wrv;->D0()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Ll/uyr;->j(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 50
    sget-object p3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-direct {p1, p2, p3}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->q:Ll/jxd0;

    .line 51
    new-instance p1, Ll/jxd0;

    sget-object p2, Ll/zrv;->a:Ll/wrv;

    .line 52
    invoke-virtual {p2}, Ll/wrv;->D0()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Ll/uyr;->f(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2, p3}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->r:Ll/jxd0;

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->f(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;)Ll/jxd0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->r:Ll/jxd0;

    return-object p0
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;)Ll/jxd0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->q:Ll/jxd0;

    return-object p0
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;)Ll/y20;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->o:Ll/y20;

    return-object p0
.end method


# virtual methods
.method public final e(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/pv2;->a(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic f(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->p:Ll/x20;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->p:Ll/x20;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/x20;->call()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public g(ZLjava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->b:Lv/VText;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->b:Lv/VText;

    .line 7
    .line 8
    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public getBeautyView()Lv/VRecyclerView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->n:Ll/bf60;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/bf60;->q()Lv/VRecyclerView;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getCurrentItem()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->m:Lv/VPagerNoPage;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getFilterView()Lv/VRecyclerView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->n:Ll/bf60;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/bf60;->r()Lv/VRecyclerView;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getMakeUpStyleView()Lv/VRecyclerView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->n:Ll/bf60;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/bf60;->s()Lv/VRecyclerView;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public h(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->g:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public i(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->m:Lv/VPagerNoPage;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;->getIndex()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-ne v0, p1, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->h:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/TextSeekBar;

    .line 14
    .line 15
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/TextSeekBar;->setProgress(I)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public j(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->m:Lv/VPagerNoPage;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;->getIndex()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-ne v0, p1, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->e:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/TextSeekBar;

    .line 14
    .line 15
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/TextSeekBar;->setProgress(I)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public k(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->j:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public l(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->c:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public m(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->f:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public n(ZLjava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->b:Lv/VText;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->b:Lv/VText;

    .line 7
    .line 8
    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onFinishInflate()V
    .locals 7

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->e(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    new-instance v0, Ll/bf60;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-direct {v0, v1}, Ll/bf60;-><init>(Landroid/content/Context;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->n:Ll/bf60;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->m:Lv/VPagerNoPage;

    .line 19
    .line 20
    invoke-virtual {v1, v0}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->m:Lv/VPagerNoPage;

    .line 24
    .line 25
    new-instance v1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView$a;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->h:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/TextSeekBar;

    .line 34
    .line 35
    const/16 v1, 0x64

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/TextSeekBar;->setMax(I)V

    .line 38
    .line 39
    .line 40
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;->BEAUTY:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;

    .line 41
    .line 42
    const/16 v1, 0x32

    .line 43
    .line 44
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->i(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;I)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->l:Lv/VLinear;

    .line 48
    .line 49
    new-instance v1, Ll/ov2;

    .line 50
    .line 51
    invoke-direct {v1, p0}, Ll/ov2;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;)V

    .line 52
    .line 53
    .line 54
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->k:Lcom/google/android/material/tabs/TabLayout;

    .line 58
    .line 59
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->m:Lv/VPagerNoPage;

    .line 60
    .line 61
    invoke-virtual {v0, v1}, Lcom/google/android/material/tabs/TabLayout;->setupWithViewPager(Landroidx/viewpager/widget/ViewPager;)V

    .line 62
    .line 63
    .line 64
    const/4 v0, 0x0

    .line 65
    move v1, v0

    .line 66
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->k:Lcom/google/android/material/tabs/TabLayout;

    .line 67
    .line 68
    invoke-virtual {v2}, Lcom/google/android/material/tabs/TabLayout;->getTabCount()I

    .line 69
    .line 70
    .line 71
    move-result v2

    .line 72
    if-ge v1, v2, :cond_3

    .line 73
    .line 74
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->k:Lcom/google/android/material/tabs/TabLayout;

    .line 75
    .line 76
    invoke-virtual {v2, v1}, Lcom/google/android/material/tabs/TabLayout;->getTabAt(I)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 81
    .line 82
    .line 83
    move-result-object v3

    .line 84
    sget v4, Ll/yec0;->c:I

    .line 85
    .line 86
    const/4 v5, 0x0

    .line 87
    invoke-static {v3, v4, v5}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 88
    .line 89
    .line 90
    move-result-object v3

    .line 91
    sget v4, Ll/mdc0;->w7:I

    .line 92
    .line 93
    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 94
    .line 95
    .line 96
    move-result-object v4

    .line 97
    check-cast v4, Lv/VText;

    .line 98
    .line 99
    const/4 v5, 0x1

    .line 100
    if-ne v1, v5, :cond_1

    .line 101
    .line 102
    iget-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->q:Ll/jxd0;

    .line 103
    .line 104
    invoke-virtual {v6}, Ll/azd0;->get()Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object v6

    .line 108
    check-cast v6, Ljava/lang/Boolean;

    .line 109
    .line 110
    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    .line 111
    .line 112
    .line 113
    move-result v6

    .line 114
    if-nez v6, :cond_0

    .line 115
    .line 116
    goto :goto_1

    .line 117
    :cond_0
    move v5, v0

    .line 118
    goto :goto_1

    .line 119
    :cond_1
    const/4 v6, 0x2

    .line 120
    if-ne v1, v6, :cond_0

    .line 121
    .line 122
    iget-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->r:Ll/jxd0;

    .line 123
    .line 124
    invoke-virtual {v6}, Ll/azd0;->get()Ljava/lang/Object;

    .line 125
    .line 126
    .line 127
    move-result-object v6

    .line 128
    check-cast v6, Ljava/lang/Boolean;

    .line 129
    .line 130
    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    .line 131
    .line 132
    .line 133
    move-result v6

    .line 134
    if-nez v6, :cond_0

    .line 135
    .line 136
    :goto_1
    sget v6, Ll/mdc0;->Z4:I

    .line 137
    .line 138
    invoke-virtual {v3, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 139
    .line 140
    .line 141
    move-result-object v6

    .line 142
    invoke-static {v6, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 143
    .line 144
    .line 145
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->n:Ll/bf60;

    .line 146
    .line 147
    invoke-virtual {v5, v1}, Ll/bf60;->getPageTitle(I)Ljava/lang/CharSequence;

    .line 148
    .line 149
    .line 150
    move-result-object v5

    .line 151
    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 152
    .line 153
    .line 154
    if-eqz v2, :cond_2

    .line 155
    .line 156
    invoke-virtual {v2, v3}, Lcom/google/android/material/tabs/TabLayout$Tab;->setCustomView(Landroid/view/View;)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 157
    .line 158
    .line 159
    :cond_2
    add-int/lit8 v1, v1, 0x1

    .line 160
    .line 161
    goto :goto_0

    .line 162
    :cond_3
    return-void
.end method

.method public setOnContrastListener(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView$b;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->j:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView;->setOnContrastListener(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/ContrastView$b;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setOnEmptyFlingListener(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/OnFlingFrameLayout$b;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->a:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/OnFlingFrameLayout;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/OnFlingFrameLayout;->setOnFlingListener(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/OnFlingFrameLayout$b;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setOnPageChangeAction(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->o:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public setOnResetAction(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->p:Ll/x20;

    .line 2
    .line 3
    return-void
.end method

.method public setOnSecondSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->e:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/TextSeekBar;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/TextSeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->h:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/TextSeekBar;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/TextSeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
