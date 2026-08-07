.class public Ll/owj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/bwj;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VRelative;

.field public b:Landroid/widget/FrameLayout;

.field public c:Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;

.field public d:Lv/VText;

.field public e:Landroid/widget/FrameLayout;

.field public f:Landroid/view/View;

.field public g:Lv/VProgressBar;

.field public h:Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelTopBar;

.field public i:Lv/VPager;

.field public j:Ll/bwj;

.field public final k:Lcom/p1/mobile/android/app/Act;

.field public l:Ljava/lang/Runnable;

.field public m:Ljava/lang/Runnable;

.field public n:I

.field public o:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Ll/owj;->n:I

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Ll/owj;->o:Z

    .line 9
    .line 10
    iput-object p1, p0, Ll/owj;->k:Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    return-void
.end method

.method public static synthetic a(Ll/owj;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/owj;->n(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/owj;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/owj;->u()V

    return-void
.end method

.method public static synthetic c(Ll/owj;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/owj;->p()V

    return-void
.end method

.method public static synthetic d(Ll/owj;Ljava/util/List;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/owj;->s(Ljava/util/List;Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic e(Ll/owj;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/owj;->q(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V

    return-void
.end method

.method public static bridge synthetic f(Ll/owj;)Ll/bwj;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/owj;->j:Ll/bwj;

    return-object p0
.end method

.method public static bridge synthetic i(Ll/owj;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/owj;->k()V

    return-void
.end method

.method private synthetic n(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/owj;->c:Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->o()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Ll/owj;->c:Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->F()V

    .line 12
    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    invoke-virtual {p0, p1}, Ll/owj;->x(Z)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    iget-object p0, p0, Ll/owj;->j:Ll/bwj;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/bwj;->t()Ll/qvj;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Landroid/app/Dialog;->cancel()V

    .line 26
    .line 27
    .line 28
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/owj;->k:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/bwj;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/owj;->l(Ll/bwj;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/owj;->j(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public j(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/pwj;->b(Ll/owj;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final k()V
    .locals 3

    .line 1
    iget v0, p0, Ll/owj;->n:I

    .line 2
    .line 3
    iget-object v1, p0, Ll/owj;->a:Lv/VRelative;

    .line 4
    .line 5
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/owj;->c:Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 18
    .line 19
    iget-object v1, p0, Ll/owj;->j:Ll/bwj;

    .line 20
    .line 21
    invoke-virtual {v1}, Ll/bwj;->t()Ll/qvj;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    iget v1, v1, Ll/qvj;->t:I

    .line 26
    .line 27
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 28
    .line 29
    iget-object v1, p0, Ll/owj;->j:Ll/bwj;

    .line 30
    .line 31
    invoke-virtual {v1}, Ll/bwj;->t()Ll/qvj;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    iget v1, v1, Ll/qvj;->t:I

    .line 36
    .line 37
    iget v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 38
    .line 39
    add-int/2addr v1, v2

    .line 40
    iget-object v2, p0, Ll/owj;->a:Lv/VRelative;

    .line 41
    .line 42
    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    sub-int/2addr v1, v2

    .line 47
    neg-int v1, v1

    .line 48
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 49
    .line 50
    iget-object v1, p0, Ll/owj;->c:Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;

    .line 51
    .line 52
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 53
    .line 54
    .line 55
    :cond_0
    iget-object v0, p0, Ll/owj;->a:Lv/VRelative;

    .line 56
    .line 57
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    iput v0, p0, Ll/owj;->n:I

    .line 62
    .line 63
    return-void
.end method

.method public l(Ll/bwj;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/owj;->j:Ll/bwj;

    .line 2
    .line 3
    return-void
.end method

.method public final m(Ljava/util/List;)I
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/businessdata/NewGiftInfoPanelWrapper;",
            ">;)I"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_1

    .line 6
    .line 7
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_1

    .line 16
    .line 17
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    check-cast p1, Lcom/p1/mobile/putong/core/businessdata/NewGiftInfoPanelWrapper;

    .line 22
    .line 23
    iget-object v0, p1, Lcom/p1/mobile/putong/core/businessdata/NewGiftInfoPanelWrapper;->giftInfos:Ljava/util/ArrayList;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    iget-object p1, p1, Lcom/p1/mobile/putong/core/businessdata/NewGiftInfoPanelWrapper;->giftInfos:Ljava/util/ArrayList;

    .line 32
    .line 33
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    const/4 v0, 0x4

    .line 38
    if-le p1, v0, :cond_0

    .line 39
    .line 40
    const/4 p0, 0x2

    .line 41
    return p0

    .line 42
    :cond_1
    const/4 p0, 0x1

    .line 43
    return p0
.end method

.method public final synthetic p()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Ll/owj;->x(Z)V

    .line 3
    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-object v0, p0, Ll/owj;->l:Ljava/lang/Runnable;

    .line 7
    .line 8
    return-void
.end method

.method public final synthetic q(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V
    .locals 2

    .line 1
    const-string v0, "BUBBLE_BUSINESS_GIFT_USE_GUIDE"

    .line 2
    .line 3
    invoke-static {v0}, Ll/tvj;->a(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/owj;->k()V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    invoke-virtual {p0, v0}, Ll/owj;->x(Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/owj;->c:Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;

    .line 14
    .line 15
    new-instance v1, Ll/lwj;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ll/lwj;-><init>(Ll/owj;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, p1, v1}, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->w(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;Ll/x20;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->extra:Lcom/p1/mobile/putong/core/data/GiftInfoExtra;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/GiftInfoExtra;->shopGuide:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    iget-object p0, p0, Ll/owj;->d:Lv/VText;

    .line 32
    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    const-string p1, "\u8fd9\u4e2a\u793c\u7269\u5f88\u53d7\u6b22\u8fce\u54e6"

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->extra:Lcom/p1/mobile/putong/core/data/GiftInfoExtra;

    .line 42
    .line 43
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/GiftInfoExtra;->shopGuide:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public r()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/owj;->g:Lv/VProgressBar;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/owj;->c:Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->setEnableFrameCheck(Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/owj;->i:Lv/VPager;

    .line 13
    .line 14
    iget-object v1, p0, Ll/owj;->j:Ll/bwj;

    .line 15
    .line 16
    invoke-virtual {v1}, Ll/bwj;->t()Ll/qvj;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v1}, Ll/qvj;->H()Ll/ovj;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/owj;->i:Lv/VPager;

    .line 28
    .line 29
    new-instance v1, Ll/owj$a;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/owj$a;-><init>(Ll/owj;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Ll/owj;->i:Lv/VPager;

    .line 38
    .line 39
    const/4 v1, 0x0

    .line 40
    invoke-virtual {v0, v1}, Lv/VPager;->setScrollble(Z)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Ll/owj;->b:Landroid/widget/FrameLayout;

    .line 44
    .line 45
    new-instance v1, Ll/mwj;

    .line 46
    .line 47
    invoke-direct {v1, p0}, Ll/mwj;-><init>(Ll/owj;)V

    .line 48
    .line 49
    .line 50
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Ll/owj;->i:Lv/VPager;

    .line 54
    .line 55
    const/16 v1, 0xa

    .line 56
    .line 57
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setOffscreenPageLimit(I)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Ll/owj;->a:Lv/VRelative;

    .line 61
    .line 62
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    new-instance v1, Ll/owj$b;

    .line 67
    .line 68
    invoke-direct {v1, p0}, Ll/owj$b;-><init>(Ll/owj;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public final synthetic s(Ljava/util/List;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/owj;->j:Ll/bwj;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/bwj;->t()Ll/qvj;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ll/qvj;->L()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    check-cast p1, Lcom/p1/mobile/putong/core/businessdata/NewGiftInfoPanelWrapper;

    .line 20
    .line 21
    iget-object p1, p1, Lcom/p1/mobile/putong/core/businessdata/NewGiftInfoPanelWrapper;->panel:Lcom/p1/mobile/putong/core/data/CoreGiftPanel;

    .line 22
    .line 23
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreGiftPanel;->name:Ljava/lang/String;

    .line 24
    .line 25
    const-string p2, "gift_tab_type"

    .line 26
    .line 27
    invoke-static {p2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    filled-new-array {p1}, [Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    const-string p2, "e_chat_gift_bar_tab"

    .line 36
    .line 37
    invoke-static {p2, p0, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final synthetic u()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Ll/owj;->x(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public v(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ll/r97;->f()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 16
    .line 17
    const-string v1, "o_diamond_gift_id"

    .line 18
    .line 19
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    iget-object v0, p0, Ll/owj;->m:Ljava/lang/Runnable;

    .line 27
    .line 28
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    iget-object v0, p0, Ll/owj;->m:Ljava/lang/Runnable;

    .line 35
    .line 36
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 37
    .line 38
    .line 39
    const/4 v0, 0x0

    .line 40
    iput-object v0, p0, Ll/owj;->m:Ljava/lang/Runnable;

    .line 41
    .line 42
    :cond_1
    iget-object v0, p0, Ll/owj;->l:Ljava/lang/Runnable;

    .line 43
    .line 44
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-eqz v0, :cond_2

    .line 49
    .line 50
    iget-object v0, p0, Ll/owj;->l:Ljava/lang/Runnable;

    .line 51
    .line 52
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 53
    .line 54
    .line 55
    :cond_2
    iget-object v0, p0, Ll/owj;->k:Lcom/p1/mobile/android/app/Act;

    .line 56
    .line 57
    new-instance v1, Ll/jwj;

    .line 58
    .line 59
    invoke-direct {v1, p0, p1}, Ll/jwj;-><init>(Ll/owj;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V

    .line 60
    .line 61
    .line 62
    iput-object v1, p0, Ll/owj;->l:Ljava/lang/Runnable;

    .line 63
    .line 64
    const-wide/16 p0, 0x96

    .line 65
    .line 66
    invoke-static {v0, v1, p0, p1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public w(Ljava/util/List;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/businessdata/NewGiftInfoPanelWrapper;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object p2, p0, Ll/owj;->g:Lv/VProgressBar;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p2, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/owj;->m(Ljava/util/List;)I

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    iget-object v0, p0, Ll/owj;->i:Lv/VPager;

    .line 12
    .line 13
    mul-int/lit8 v1, p2, 0x6f

    .line 14
    .line 15
    add-int/lit8 v1, v1, 0x32

    .line 16
    .line 17
    int-to-float v1, v1

    .line 18
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    invoke-static {v0, v1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 23
    .line 24
    .line 25
    const/4 v0, 0x1

    .line 26
    iput-boolean v0, p0, Ll/owj;->o:Z

    .line 27
    .line 28
    iget-object v0, p0, Ll/owj;->j:Ll/bwj;

    .line 29
    .line 30
    invoke-virtual {v0}, Ll/bwj;->t()Ll/qvj;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0}, Ll/qvj;->H()Ll/ovj;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v0, p1, p2}, Ll/ovj;->q(Ljava/util/List;I)V

    .line 39
    .line 40
    .line 41
    iget-object p2, p0, Ll/owj;->h:Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelTopBar;

    .line 42
    .line 43
    iget-object v0, p0, Ll/owj;->j:Ll/bwj;

    .line 44
    .line 45
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelTopBar;->G(Ll/bwj;)V

    .line 46
    .line 47
    .line 48
    iget-object p2, p0, Ll/owj;->j:Ll/bwj;

    .line 49
    .line 50
    invoke-virtual {p2}, Ll/bwj;->m()Z

    .line 51
    .line 52
    .line 53
    move-result p2

    .line 54
    iget-object v0, p0, Ll/owj;->h:Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelTopBar;

    .line 55
    .line 56
    if-eqz p2, :cond_0

    .line 57
    .line 58
    const-string p0, "\u9001\u4e2a\u5c0f\u793c\u7269\u8868\u8fbe\u8bda\u610f\u5427"

    .line 59
    .line 60
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelTopBar;->setTips(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :cond_0
    iget-object p2, p0, Ll/owj;->i:Lv/VPager;

    .line 65
    .line 66
    new-instance v1, Ll/kwj;

    .line 67
    .line 68
    invoke-direct {v1, p0, p1}, Ll/kwj;-><init>(Ll/owj;Ljava/util/List;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {v0, p2, v1}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelTopBar;->C(Lv/VPager;Ll/y20;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public final x(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/owj;->c:Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/owj;->d:Lv/VText;

    .line 7
    .line 8
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public y(Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/owj;->d:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/owj;->d:Lv/VText;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Ll/owj;->m:Ljava/lang/Runnable;

    .line 13
    .line 14
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    iget-object p1, p0, Ll/owj;->m:Ljava/lang/Runnable;

    .line 21
    .line 22
    invoke-static {p1}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    iget-object p1, p0, Ll/owj;->k:Lcom/p1/mobile/android/app/Act;

    .line 26
    .line 27
    new-instance v0, Ll/nwj;

    .line 28
    .line 29
    invoke-direct {v0, p0}, Ll/nwj;-><init>(Ll/owj;)V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Ll/owj;->m:Ljava/lang/Runnable;

    .line 33
    .line 34
    const-wide/16 v1, 0x5dc

    .line 35
    .line 36
    invoke-static {p1, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public z()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/owj;->c:Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->E()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-virtual {p0, v0}, Ll/owj;->x(Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
