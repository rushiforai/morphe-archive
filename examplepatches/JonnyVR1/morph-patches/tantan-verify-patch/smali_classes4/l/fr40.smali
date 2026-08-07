.class public Ll/fr40;
.super Ll/c4k0;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/c4k0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public c(Lcom/p1/mobile/putong/data/OMSAction;)Z
    .locals 2

    .line 1
    iget-object p1, p0, Ll/c4k0;->a:Lcom/p1/mobile/putong/oms/OmsBaseRender;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/oms/OmsBaseRender;->e:Lcom/p1/mobile/putong/oms/view/OmsViewPager;

    .line 4
    .line 5
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    const/4 v0, 0x1

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    iget-object p1, p0, Ll/c4k0;->a:Lcom/p1/mobile/putong/oms/OmsBaseRender;

    .line 13
    .line 14
    iget-object p1, p1, Lcom/p1/mobile/putong/oms/OmsBaseRender;->e:Lcom/p1/mobile/putong/oms/view/OmsViewPager;

    .line 15
    .line 16
    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Ll/cf60;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    iget-object p1, p0, Ll/c4k0;->a:Lcom/p1/mobile/putong/oms/OmsBaseRender;

    .line 27
    .line 28
    iget-object p1, p1, Lcom/p1/mobile/putong/oms/OmsBaseRender;->e:Lcom/p1/mobile/putong/oms/view/OmsViewPager;

    .line 29
    .line 30
    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    iget-object v1, p0, Ll/c4k0;->a:Lcom/p1/mobile/putong/oms/OmsBaseRender;

    .line 35
    .line 36
    iget-object v1, v1, Lcom/p1/mobile/putong/oms/OmsBaseRender;->e:Lcom/p1/mobile/putong/oms/view/OmsViewPager;

    .line 37
    .line 38
    invoke-virtual {v1}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Ll/cf60;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v1}, Ll/cf60;->getCount()I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    sub-int/2addr v1, v0

    .line 47
    if-ge p1, v1, :cond_0

    .line 48
    .line 49
    iget-object p0, p0, Ll/c4k0;->a:Lcom/p1/mobile/putong/oms/OmsBaseRender;

    .line 50
    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->e:Lcom/p1/mobile/putong/oms/view/OmsViewPager;

    .line 52
    .line 53
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    add-int/2addr p1, v0

    .line 58
    invoke-virtual {p0, p1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 59
    .line 60
    .line 61
    :cond_0
    return v0
.end method

.method public d()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "dialog/next"

    .line 2
    .line 3
    return-object p0
.end method
