.class public Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftOuterPagerItemView;
.super Lv/VRelative;
.source "SourceFile"


# instance fields
.field public d:Lv/VPager;

.field public e:Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelBottomBar;

.field public f:Ll/htj;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VRelative;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VRelative;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VRelative;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public getAdapter()Ll/htj;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftOuterPagerItemView;->f:Ll/htj;

    .line 2
    .line 3
    return-object p0
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftOuterPagerItemView;->p(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final p(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/pvj;->a(Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftOuterPagerItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public q(Ll/bwj;I)V
    .locals 2

    .line 1
    new-instance v0, Ll/htj;

    .line 2
    .line 3
    const/4 v1, 0x4

    .line 4
    invoke-direct {v0, p1, v1, p2}, Ll/htj;-><init>(Ll/bwj;II)V

    .line 5
    .line 6
    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftOuterPagerItemView;->f:Ll/htj;

    .line 8
    .line 9
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftOuterPagerItemView;->d:Lv/VPager;

    .line 10
    .line 11
    invoke-virtual {p2, v0}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 12
    .line 13
    .line 14
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftOuterPagerItemView;->e:Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelBottomBar;

    .line 15
    .line 16
    invoke-virtual {p1}, Ll/ij2;->b()Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftOuterPagerItemView;->d:Lv/VPager;

    .line 21
    .line 22
    invoke-virtual {p1}, Ll/bwj;->t()Ll/qvj;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p2, v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelBottomBar;->u(Lcom/p1/mobile/android/app/Act;Landroidx/viewpager/widget/ViewPager;Ll/qvj;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public z(Lcom/p1/mobile/putong/core/businessdata/NewGiftInfoPanelWrapper;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftOuterPagerItemView;->e:Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelBottomBar;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/core/businessdata/NewGiftInfoPanelWrapper;->giftInfos:Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/16 v2, 0x8

    .line 10
    .line 11
    if-le v1, v2, :cond_0

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 v1, 0x0

    .line 16
    :goto_0
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelBottomBar;->setIndicatorVisibility(Z)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftOuterPagerItemView;->f:Ll/htj;

    .line 20
    .line 21
    iget-object p1, p1, Lcom/p1/mobile/putong/core/businessdata/NewGiftInfoPanelWrapper;->giftInfos:Ljava/util/ArrayList;

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Ll/htj;->q(Ljava/util/List;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method
