.class public Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubEventView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubEventView;

.field public b:Landroid/view/View;

.field public c:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;

.field public d:Lv/VPagerNoPage;

.field public e:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansRecallSelectView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

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
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Ljava/util/List;Ll/pf60;)V
    .locals 0

    .line 1
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p1, Ljava/lang/String;

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final b(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/n9g;->a(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubEventView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public c()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubEventView;->e:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansRecallSelectView;

    .line 2
    .line 3
    const/16 v0, 0x8

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public d(Ljava/util/List;Ll/y8s;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Landroid/view/View;",
            ">;>;",
            "Ll/y8s;",
            ")V"
        }
    .end annotation

    .line 1
    new-instance p2, Ll/obg;

    .line 2
    .line 3
    invoke-direct {p2, p1}, Ll/obg;-><init>(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    new-instance v1, Ll/m9g;

    .line 12
    .line 13
    invoke-direct {v1, v0}, Ll/m9g;-><init>(Ljava/util/List;)V

    .line 14
    .line 15
    .line 16
    invoke-static {p1, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubEventView;->d:Lv/VPagerNoPage;

    .line 20
    .line 21
    invoke-virtual {p1, p2}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubEventView;->c:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;

    .line 25
    .line 26
    const/high16 p2, 0x41c00000    # 24.0f

    .line 27
    .line 28
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 29
    .line 30
    .line 31
    move-result p2

    .line 32
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->r(I)Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    new-instance p2, Ll/sl5;

    .line 37
    .line 38
    invoke-direct {p2}, Ll/sl5;-><init>()V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->s(Ll/z0m;)Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    new-instance p2, Ll/lm5;

    .line 46
    .line 47
    invoke-direct {p2}, Ll/lm5;-><init>()V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->u(Ll/r5m;)Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->q(Ljava/util/List;)Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubEventView;->d:Lv/VPagerNoPage;

    .line 59
    .line 60
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->f(Landroidx/viewpager/widget/ViewPager;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public e(Ll/acg;Ll/yhg;Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansBottomSelectView;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubEventView;->c:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->setPresenter(Ll/acg;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubEventView;->e:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansRecallSelectView;

    .line 7
    .line 8
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansRecallSelectView;->Q(Ll/acg;Ll/yhg;Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansBottomSelectView;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubEventView;->b(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
