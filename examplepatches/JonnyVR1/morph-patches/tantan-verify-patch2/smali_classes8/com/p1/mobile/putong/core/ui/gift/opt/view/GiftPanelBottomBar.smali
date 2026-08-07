.class public Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelBottomBar;
.super Lv/VFrame;
.source "SourceFile"


# instance fields
.field public a:Lv/VPagerCircleIndicator;

.field public b:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelBottomBar;Ll/qvj;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelBottomBar;->v(Ll/qvj;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelBottomBar;->s(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final s(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/svj;->a(Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelBottomBar;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final setIndicatorVisibility(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelBottomBar;->a:Lv/VPagerCircleIndicator;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final u(Lcom/p1/mobile/android/app/Act;Landroidx/viewpager/widget/ViewPager;Ll/qvj;)V
    .locals 1
    .param p3    # Ll/qvj;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelBottomBar;->a:Lv/VPagerCircleIndicator;

    .line 2
    .line 3
    invoke-virtual {v0, p2}, Lv/VPagerCircleIndicator;->setViewPager(Landroidx/viewpager/widget/ViewPager;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p3}, Ll/qvj;->G()Lcom/p1/mobile/putong/data/CoreGiftPanelName;

    .line 7
    .line 8
    .line 9
    const-string p2, "note"

    .line 10
    .line 11
    invoke-static {p2}, Lcom/p1/mobile/putong/data/CoreGiftPanelName;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/CoreGiftPanelName;

    .line 12
    .line 13
    .line 14
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelBottomBar;->b:Lv/VText;

    .line 15
    .line 16
    new-instance v0, Ll/rvj;

    .line 17
    .line 18
    invoke-direct {v0, p0, p3, p1}, Ll/rvj;-><init>(Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelBottomBar;Ll/qvj;Lcom/p1/mobile/android/app/Act;)V

    .line 19
    .line 20
    .line 21
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final synthetic v(Ll/qvj;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    const-string p3, "e_chat_gift_bar_recharge"

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/qvj;->L()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p3, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const-string p1, "p_chat,gift_recharge"

    .line 11
    .line 12
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelBottomBar;->w(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final w(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0, p1, p2}, Ll/r97;->n4(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method
