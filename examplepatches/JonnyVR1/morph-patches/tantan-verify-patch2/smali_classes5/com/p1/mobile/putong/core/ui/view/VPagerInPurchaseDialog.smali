.class public Lcom/p1/mobile/putong/core/ui/view/VPagerInPurchaseDialog;
.super Lv/VPagerNoPage;
.source "SourceFile"


# instance fields
.field public final M0:I

.field public final N0:I

.field public final O0:I

.field public P0:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VPagerNoPage;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/high16 p1, 0x437f0000    # 255.0f

    .line 5
    .line 6
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerInPurchaseDialog;->M0:I

    .line 11
    .line 12
    const/high16 p1, 0x43340000    # 180.0f

    .line 13
    .line 14
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerInPurchaseDialog;->N0:I

    .line 19
    .line 20
    const/high16 p1, 0x42f00000    # 120.0f

    .line 21
    .line 22
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerInPurchaseDialog;->O0:I

    .line 27
    .line 28
    const/4 p1, 0x0

    .line 29
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerInPurchaseDialog;->P0:Z

    .line 30
    .line 31
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 32
    invoke-direct {p0, p1, p2}, Lv/VPagerNoPage;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/high16 p1, 0x437f0000    # 255.0f

    .line 33
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerInPurchaseDialog;->M0:I

    const/high16 p1, 0x43340000    # 180.0f

    .line 34
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerInPurchaseDialog;->N0:I

    const/high16 p1, 0x42f00000    # 120.0f

    .line 35
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerInPurchaseDialog;->O0:I

    const/4 p1, 0x0

    .line 36
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerInPurchaseDialog;->P0:Z

    return-void
.end method


# virtual methods
.method public getComponentsHeight()I
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerInPurchaseDialog;->M0:I

    .line 2
    .line 3
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerInPurchaseDialog;->N0:I

    .line 4
    .line 5
    add-int/2addr v0, v1

    .line 6
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerInPurchaseDialog;->O0:I

    .line 7
    .line 8
    add-int/2addr v0, p0

    .line 9
    return v0
.end method

.method public onMeasure(II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroidx/viewpager/widget/ViewPager;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/view/VPagerInPurchaseDialog;->getComponentsHeight()I

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    if-le p1, p2, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/view/VPagerInPurchaseDialog;->getComponentsHeight()I

    .line 19
    .line 20
    .line 21
    move-result p2

    .line 22
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 23
    .line 24
    .line 25
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerInPurchaseDialog;->P0:Z

    .line 26
    .line 27
    if-nez p1, :cond_0

    .line 28
    .line 29
    const/4 p1, 0x1

    .line 30
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/view/VPagerInPurchaseDialog;->P0:Z

    .line 31
    .line 32
    sget p1, Ll/fdc0;->i0:I

    .line 33
    .line 34
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    check-cast p1, Landroid/widget/LinearLayout;

    .line 39
    .line 40
    if-eqz p1, :cond_0

    .line 41
    .line 42
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/view/VPagerInPurchaseDialog;->getComponentsHeight()I

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    invoke-virtual {p1, p0}, Landroid/view/View;->setMinimumHeight(I)V

    .line 47
    .line 48
    .line 49
    :cond_0
    return-void
.end method
