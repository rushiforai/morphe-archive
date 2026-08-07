.class public Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator;
.super Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;
.source "SourceFile"


# instance fields
.field public m:Landroidx/viewpager/widget/ViewPager;

.field public final n:Landroidx/viewpager/widget/ViewPager$j;

.field public final o:Landroid/database/DataSetObserver;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator$a;

    .line 5
    .line 6
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator$a;-><init>(Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator;->n:Landroidx/viewpager/widget/ViewPager$j;

    .line 10
    .line 11
    new-instance p1, Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator$b;

    .line 12
    .line 13
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator$b;-><init>(Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator;)V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator;->o:Landroid/database/DataSetObserver;

    .line 17
    .line 18
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 19
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 20
    new-instance p1, Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator$a;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator$a;-><init>(Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator;->n:Landroidx/viewpager/widget/ViewPager$j;

    .line 21
    new-instance p1, Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator$b;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator$b;-><init>(Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator;->o:Landroid/database/DataSetObserver;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 22
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 23
    new-instance p1, Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator$a;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator$a;-><init>(Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator;->n:Landroidx/viewpager/widget/ViewPager$j;

    .line 24
    new-instance p1, Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator$b;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator$b;-><init>(Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator;->o:Landroid/database/DataSetObserver;

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator;)Landroidx/viewpager/widget/ViewPager;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator;->m:Landroidx/viewpager/widget/ViewPager;

    return-object p0
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator;->n()V

    return-void
.end method

.method private n()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator;->m:Landroidx/viewpager/widget/ViewPager;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Ll/cf60;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    invoke-virtual {v0}, Ll/cf60;->getCount()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator;->m:Landroidx/viewpager/widget/ViewPager;

    .line 16
    .line 17
    invoke-virtual {v1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator;->g(II)V

    .line 22
    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public bridge synthetic b(I)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->b(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic g(II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->g(II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public getDataSetObserver()Landroid/database/DataSetObserver;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator;->o:Landroid/database/DataSetObserver;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic j(Ll/rv5;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->j(Ll/rv5;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic setIndicatorCreatedListener(Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator$a;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator$a;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->setIndicatorCreatedListener(Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator$a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setOnPageChangeListener(Landroidx/viewpager/widget/ViewPager$j;)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator;->m:Landroidx/viewpager/widget/ViewPager;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Landroidx/viewpager/widget/ViewPager;->P(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator;->m:Landroidx/viewpager/widget/ViewPager;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const-string p0, "can not find Viewpager , setViewPager first"

    .line 15
    .line 16
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public setViewPager(Landroidx/viewpager/widget/ViewPager;)V
    .locals 1
    .param p1    # Landroidx/viewpager/widget/ViewPager;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator;->m:Landroidx/viewpager/widget/ViewPager;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Ll/cf60;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    const/4 p1, -0x1

    .line 12
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->l:I

    .line 13
    .line 14
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator;->n()V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator;->m:Landroidx/viewpager/widget/ViewPager;

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator;->n:Landroidx/viewpager/widget/ViewPager$j;

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Landroidx/viewpager/widget/ViewPager;->P(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator;->m:Landroidx/viewpager/widget/ViewPager;

    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator;->n:Landroidx/viewpager/widget/ViewPager$j;

    .line 27
    .line 28
    invoke-virtual {p1, v0}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator;->n:Landroidx/viewpager/widget/ViewPager$j;

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator;->m:Landroidx/viewpager/widget/ViewPager;

    .line 34
    .line 35
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    invoke-interface {p1, p0}, Landroidx/viewpager/widget/ViewPager$j;->onPageSelected(I)V

    .line 40
    .line 41
    .line 42
    :cond_0
    return-void
.end method
