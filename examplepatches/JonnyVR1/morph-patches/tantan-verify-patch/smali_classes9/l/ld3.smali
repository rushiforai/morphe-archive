.class public Ll/ld3;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Landroid/view/View;

.field public b:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public c:Lv/VText;

.field public d:Lv/VImage;

.field public e:Lv/VDraweeView;

.field public f:Lv/VButton;

.field public g:Lv/VText;

.field public h:Lv/VText;

.field public i:Lv/VText;

.field public j:Lv/VRadioButton;

.field public k:Ll/kcg0;

.field public final l:Ll/une0;

.field public final m:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;


# direct methods
.method public constructor <init>(Ll/une0;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ld3;->l:Ll/une0;

    .line 5
    .line 6
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 7
    .line 8
    sget v1, Ll/yec0;->w:I

    .line 9
    .line 10
    const/4 v2, 0x1

    .line 11
    invoke-static {v2}, Ll/qag0;->e(Z)Ll/rq2;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-direct {v0, p1, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;-><init>(Ll/xzs;ILl/rq2;)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Ll/ld3;->m:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 19
    .line 20
    new-instance p1, Ll/fd3;

    .line 21
    .line 22
    invoke-direct {p1, p0}, Ll/fd3;-><init>(Ll/ld3;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->h0(Ll/y20;)V

    .line 26
    .line 27
    .line 28
    new-instance p1, Ll/gd3;

    .line 29
    .line 30
    invoke-direct {p1, p0}, Ll/gd3;-><init>(Ll/ld3;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public static synthetic a(Ll/ld3;Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/ld3;->o(Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;Ll/x20;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/ld3;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ld3;->q(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic c(Ll/ld3;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ld3;->k(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic d(Ll/ld3;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ld3;->l(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Ll/ld3;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ld3;->i(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f(Ll/ld3;Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ld3;->p(Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic g(Ll/ld3;Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ld3;->m(Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic h(Ll/ld3;Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ld3;->n(Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final i(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/md3;->a(Ll/ld3;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final j()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ld3;->l:Ll/une0;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/ld3;->l:Ll/une0;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/une0;->u4()V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Ll/ld3;->m:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    iget-object p0, p0, Ll/ld3;->m:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 27
    .line 28
    .line 29
    :cond_1
    return-void
.end method

.method public final synthetic k(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ld3;->k:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic l(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ld3;->j:Lv/VRadioButton;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->isSelected()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    xor-int/lit8 p1, p1, 0x1

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Landroid/view/View;->setSelected(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic m(Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->blackClose:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ld3;->j()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final synthetic n(Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ld3;->j()V

    .line 2
    .line 3
    .line 4
    iget-object p2, p0, Ll/ld3;->l:Ll/une0;

    .line 5
    .line 6
    iget-object p0, p0, Ll/ld3;->j:Lv/VRadioButton;

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/View;->isSelected()Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->type:Ljava/lang/String;

    .line 13
    .line 14
    const-string v0, "close"

    .line 15
    .line 16
    invoke-virtual {p2, p0, p1, v0}, Ll/une0;->s4(ZLjava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic o(Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;Ll/x20;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ld3;->j()V

    .line 2
    .line 3
    .line 4
    iget-object p3, p0, Ll/ld3;->l:Ll/une0;

    .line 5
    .line 6
    iget-object p0, p0, Ll/ld3;->j:Lv/VRadioButton;

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/View;->isSelected()Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->type:Ljava/lang/String;

    .line 13
    .line 14
    const-string v0, ""

    .line 15
    .line 16
    invoke-virtual {p3, p0, p1, v0}, Ll/une0;->s4(ZLjava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-interface {p2}, Ll/x20;->call()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final synthetic p(Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ld3;->j:Lv/VRadioButton;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->isSelected()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Ll/htd0;->f:Ll/htd0;

    .line 10
    .line 11
    invoke-static {p0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    check-cast p2, Ll/civ;

    .line 16
    .line 17
    iget-object p2, p2, Ll/civ;->p:Ll/xyd0;

    .line 18
    .line 19
    invoke-virtual {p2}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    check-cast p2, Ljava/util/HashSet;

    .line 24
    .line 25
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->type:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {p2, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    invoke-static {p0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    check-cast p0, Ll/civ;

    .line 35
    .line 36
    iget-object p0, p0, Ll/civ;->p:Ll/xyd0;

    .line 37
    .line 38
    invoke-virtual {p0, p2}, Ll/dyd0;->put(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    :cond_0
    return-void
.end method

.method public final synthetic q(Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ld3;->j()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final r(Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;)V
    .locals 2

    .line 1
    new-instance v0, Lcom/facebook/drawee/generic/RoundingParams;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->isCircle:Z

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/facebook/drawee/generic/RoundingParams;->v(Z)Lcom/facebook/drawee/generic/RoundingParams;

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Ll/ld3;->e:Lv/VDraweeView;

    .line 12
    .line 13
    invoke-virtual {v1}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Ll/wlj;

    .line 18
    .line 19
    invoke-virtual {v1, v0}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->iconUrl:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    iget-object v1, p0, Ll/ld3;->e:Lv/VDraweeView;

    .line 29
    .line 30
    if-nez v0, :cond_0

    .line 31
    .line 32
    const/4 v0, 0x1

    .line 33
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Ll/ld3;->e:Lv/VDraweeView;

    .line 37
    .line 38
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->iconUrl:Ljava/lang/String;

    .line 39
    .line 40
    const-string v0, "context_single_room"

    .line 41
    .line 42
    invoke-static {v0, p0, p1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_0
    const/4 p0, 0x0

    .line 47
    invoke-static {v1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public final s(Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ld3;->j:Lv/VRadioButton;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->remind:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubblePopupRemind;

    .line 4
    .line 5
    iget-boolean v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubblePopupRemind;->show:Z

    .line 6
    .line 7
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->remind:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubblePopupRemind;

    .line 11
    .line 12
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubblePopupRemind;->textColor:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    iget-object v0, p0, Ll/ld3;->j:Lv/VRadioButton;

    .line 21
    .line 22
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->remind:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubblePopupRemind;

    .line 23
    .line 24
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubblePopupRemind;->textColor:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {v1}, Ll/gc2;->d(Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 31
    .line 32
    .line 33
    :cond_0
    iget-object v0, p0, Ll/ld3;->j:Lv/VRadioButton;

    .line 34
    .line 35
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->remind:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubblePopupRemind;

    .line 36
    .line 37
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubblePopupRemind;->click:Z

    .line 38
    .line 39
    invoke-virtual {v0, p1}, Landroid/view/View;->setSelected(Z)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Ll/ld3;->j:Lv/VRadioButton;

    .line 43
    .line 44
    new-instance v0, Ll/kd3;

    .line 45
    .line 46
    invoke-direct {v0, p0}, Ll/kd3;-><init>(Ll/ld3;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public final t(Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ld3;->a:Landroid/view/View;

    .line 2
    .line 3
    new-instance v1, Ll/hd3;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/hd3;-><init>(Ll/ld3;Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/ld3;->d:Lv/VImage;

    .line 12
    .line 13
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->showClose:Z

    .line 14
    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->isTitlePositionMiddle()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-nez v1, :cond_0

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->isTitlePositionCenter()Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    :cond_0
    const/4 v1, 0x1

    .line 30
    goto :goto_0

    .line 31
    :cond_1
    const/4 v1, 0x0

    .line 32
    :goto_0
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Ll/ld3;->d:Lv/VImage;

    .line 36
    .line 37
    new-instance v1, Ll/id3;

    .line 38
    .line 39
    invoke-direct {v1, p0, p1}, Ll/id3;-><init>(Ll/ld3;Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public final u(Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;)V
    .locals 8

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->backgroundColor:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/ld3;->b:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 10
    .line 11
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->backgroundColor:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v1}, Ll/gc2;->d(Ljava/lang/String;)I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 18
    .line 19
    .line 20
    iget-object v2, p0, Ll/ld3;->b:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 21
    .line 22
    const/high16 v0, 0x41c00000    # 24.0f

    .line 23
    .line 24
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    neg-int v6, v1

    .line 29
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 30
    .line 31
    .line 32
    move-result v7

    .line 33
    const/4 v3, 0x0

    .line 34
    const/4 v4, 0x0

    .line 35
    const/4 v5, 0x0

    .line 36
    invoke-static/range {v2 .. v7}, Ll/qnp0;->c1(Landroid/view/View;IIIII)V

    .line 37
    .line 38
    .line 39
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->contentColor:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-nez v0, :cond_1

    .line 46
    .line 47
    iget-object v0, p0, Ll/ld3;->h:Lv/VText;

    .line 48
    .line 49
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->contentColor:Ljava/lang/String;

    .line 50
    .line 51
    invoke-static {v1}, Ll/gc2;->d(Ljava/lang/String;)I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 56
    .line 57
    .line 58
    :cond_1
    iget-object p0, p0, Ll/ld3;->h:Lv/VText;

    .line 59
    .line 60
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->content:Ljava/lang/String;

    .line 61
    .line 62
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public final v(Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;Ll/x20;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ld3;->f:Lv/VButton;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->bubbleText:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x1

    .line 10
    xor-int/2addr v1, v2

    .line 11
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->button:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubblePopupButton;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubblePopupButton;->textColor:Ljava/lang/String;

    .line 17
    .line 18
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_0

    .line 23
    .line 24
    iget-object v0, p0, Ll/ld3;->f:Lv/VButton;

    .line 25
    .line 26
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->button:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubblePopupButton;

    .line 27
    .line 28
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubblePopupButton;->textColor:Ljava/lang/String;

    .line 29
    .line 30
    invoke-static {v1}, Ll/gc2;->d(Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 35
    .line 36
    .line 37
    :cond_0
    iget-object v0, p0, Ll/ld3;->f:Lv/VButton;

    .line 38
    .line 39
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->bubbleText:Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Ll/ld3;->f:Lv/VButton;

    .line 45
    .line 46
    new-instance v1, Ll/jd3;

    .line 47
    .line 48
    invoke-direct {v1, p0, p1, p2}, Ll/jd3;-><init>(Ll/ld3;Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;Ll/x20;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 52
    .line 53
    .line 54
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->button:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubblePopupButton;

    .line 55
    .line 56
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubblePopupButton;->startColor:Ljava/lang/String;

    .line 57
    .line 58
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 59
    .line 60
    .line 61
    move-result p2

    .line 62
    if-nez p2, :cond_1

    .line 63
    .line 64
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->button:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubblePopupButton;

    .line 65
    .line 66
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubblePopupButton;->endColor:Ljava/lang/String;

    .line 67
    .line 68
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 69
    .line 70
    .line 71
    move-result p2

    .line 72
    if-nez p2, :cond_1

    .line 73
    .line 74
    const/high16 p2, 0x41600000    # 14.0f

    .line 75
    .line 76
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 77
    .line 78
    .line 79
    move-result p2

    .line 80
    int-to-float p2, p2

    .line 81
    const/16 v0, 0x8

    .line 82
    .line 83
    new-array v0, v0, [F

    .line 84
    .line 85
    const/4 v1, 0x0

    .line 86
    aput p2, v0, v1

    .line 87
    .line 88
    aput p2, v0, v2

    .line 89
    .line 90
    const/4 v1, 0x2

    .line 91
    aput p2, v0, v1

    .line 92
    .line 93
    const/4 v1, 0x3

    .line 94
    aput p2, v0, v1

    .line 95
    .line 96
    const/4 v1, 0x4

    .line 97
    aput p2, v0, v1

    .line 98
    .line 99
    const/4 v1, 0x5

    .line 100
    aput p2, v0, v1

    .line 101
    .line 102
    const/4 v1, 0x6

    .line 103
    aput p2, v0, v1

    .line 104
    .line 105
    const/4 v1, 0x7

    .line 106
    aput p2, v0, v1

    .line 107
    .line 108
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->button:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubblePopupButton;

    .line 109
    .line 110
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubblePopupButton;->startColor:Ljava/lang/String;

    .line 111
    .line 112
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubblePopupButton;->endColor:Ljava/lang/String;

    .line 113
    .line 114
    invoke-static {p2, p1, v0}, Ll/n0k;->b(Ljava/lang/String;Ljava/lang/String;[F)Landroid/graphics/drawable/GradientDrawable;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    iget-object p0, p0, Ll/ld3;->f:Lv/VButton;

    .line 119
    .line 120
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 121
    .line 122
    .line 123
    :cond_1
    return-void
.end method

.method public final w(Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->isTitlePositionMiddle()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    const/4 v2, 0x0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/ld3;->c:Lv/VText;

    .line 10
    .line 11
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/ld3;->g:Lv/VText;

    .line 15
    .line 16
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/ld3;->i:Lv/VText;

    .line 20
    .line 21
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/ld3;->h:Lv/VText;

    .line 25
    .line 26
    const/4 v1, -0x1

    .line 27
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/ld3;->c:Lv/VText;

    .line 31
    .line 32
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->title:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->header:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleHeader;

    .line 38
    .line 39
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleHeader;->textColor:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-nez v0, :cond_3

    .line 46
    .line 47
    iget-object p0, p0, Ll/ld3;->c:Lv/VText;

    .line 48
    .line 49
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->header:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleHeader;

    .line 50
    .line 51
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleHeader;->textColor:Ljava/lang/String;

    .line 52
    .line 53
    invoke-static {p1}, Ll/gc2;->d(Ljava/lang/String;)I

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->isTitlePositionCenter()Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    iget-object v3, p0, Ll/ld3;->c:Lv/VText;

    .line 66
    .line 67
    if-eqz v0, :cond_2

    .line 68
    .line 69
    invoke-static {v3, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Ll/ld3;->c:Lv/VText;

    .line 73
    .line 74
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->title:Ljava/lang/String;

    .line 75
    .line 76
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 77
    .line 78
    .line 79
    iget-object v0, p0, Ll/ld3;->i:Lv/VText;

    .line 80
    .line 81
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->contentDesc:Ljava/lang/String;

    .line 82
    .line 83
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 88
    .line 89
    .line 90
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->contentDesc:Ljava/lang/String;

    .line 91
    .line 92
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    iget-object v1, p0, Ll/ld3;->g:Lv/VText;

    .line 97
    .line 98
    const-string v2, ""

    .line 99
    .line 100
    if-eqz v0, :cond_1

    .line 101
    .line 102
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 103
    .line 104
    .line 105
    iget-object v0, p0, Ll/ld3;->h:Lv/VText;

    .line 106
    .line 107
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 108
    .line 109
    .line 110
    iget-object v0, p0, Ll/ld3;->i:Lv/VText;

    .line 111
    .line 112
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->content:Ljava/lang/String;

    .line 113
    .line 114
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 115
    .line 116
    .line 117
    goto :goto_0

    .line 118
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->content:Ljava/lang/String;

    .line 119
    .line 120
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 121
    .line 122
    .line 123
    iget-object v0, p0, Ll/ld3;->h:Lv/VText;

    .line 124
    .line 125
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->contentDesc:Ljava/lang/String;

    .line 126
    .line 127
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 128
    .line 129
    .line 130
    iget-object v0, p0, Ll/ld3;->i:Lv/VText;

    .line 131
    .line 132
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 133
    .line 134
    .line 135
    :goto_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->header:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleHeader;

    .line 136
    .line 137
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleHeader;->textColor:Ljava/lang/String;

    .line 138
    .line 139
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    if-nez v0, :cond_3

    .line 144
    .line 145
    iget-object p0, p0, Ll/ld3;->c:Lv/VText;

    .line 146
    .line 147
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->header:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleHeader;

    .line 148
    .line 149
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleHeader;->textColor:Ljava/lang/String;

    .line 150
    .line 151
    invoke-static {p1}, Ll/gc2;->d(Ljava/lang/String;)I

    .line 152
    .line 153
    .line 154
    move-result p1

    .line 155
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 156
    .line 157
    .line 158
    return-void

    .line 159
    :cond_2
    invoke-static {v3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 160
    .line 161
    .line 162
    iget-object v0, p0, Ll/ld3;->g:Lv/VText;

    .line 163
    .line 164
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 165
    .line 166
    .line 167
    iget-object v0, p0, Ll/ld3;->i:Lv/VText;

    .line 168
    .line 169
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 170
    .line 171
    .line 172
    iget-object v0, p0, Ll/ld3;->h:Lv/VText;

    .line 173
    .line 174
    sget v1, Ll/n9c0;->n1:I

    .line 175
    .line 176
    invoke-static {v1}, Ll/n3d0;->a(I)I

    .line 177
    .line 178
    .line 179
    move-result v1

    .line 180
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 181
    .line 182
    .line 183
    iget-object v0, p0, Ll/ld3;->g:Lv/VText;

    .line 184
    .line 185
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->title:Ljava/lang/String;

    .line 186
    .line 187
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 188
    .line 189
    .line 190
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->header:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleHeader;

    .line 191
    .line 192
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleHeader;->textColor:Ljava/lang/String;

    .line 193
    .line 194
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 195
    .line 196
    .line 197
    move-result v0

    .line 198
    if-nez v0, :cond_3

    .line 199
    .line 200
    iget-object p0, p0, Ll/ld3;->g:Lv/VText;

    .line 201
    .line 202
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->header:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleHeader;

    .line 203
    .line 204
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleHeader;->textColor:Ljava/lang/String;

    .line 205
    .line 206
    invoke-static {p1}, Ll/gc2;->d(Ljava/lang/String;)I

    .line 207
    .line 208
    .line 209
    move-result p1

    .line 210
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 211
    .line 212
    .line 213
    :cond_3
    return-void
.end method

.method public x(Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;Ll/x20;)Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetTextI18n"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ld3;->m:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->show()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/ld3;->m:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 7
    .line 8
    new-instance v1, Ll/dd3;

    .line 9
    .line 10
    invoke-direct {v1, p0, p1}, Ll/dd3;-><init>(Ll/ld3;Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p1}, Ll/ld3;->u(Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ll/ld3;->t(Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, p1}, Ll/ld3;->w(Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, p1, p2}, Ll/ld3;->v(Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;Ll/x20;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, p1}, Ll/ld3;->s(Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, p1}, Ll/ld3;->r(Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;)V

    .line 32
    .line 33
    .line 34
    iget-object p2, p0, Ll/ld3;->l:Ll/une0;

    .line 35
    .line 36
    iget-object v0, p0, Ll/ld3;->j:Lv/VRadioButton;

    .line 37
    .line 38
    invoke-virtual {v0}, Landroid/view/View;->isSelected()Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->type:Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {p2, v0, v1}, Ll/une0;->t4(ZLjava/lang/String;)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->displayRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleRule;

    .line 48
    .line 49
    iget-wide p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleRule;->displayDuration:J

    .line 50
    .line 51
    const-wide/16 v0, 0x0

    .line 52
    .line 53
    cmp-long v0, p1, v0

    .line 54
    .line 55
    if-lez v0, :cond_0

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_0
    const-wide/16 p1, 0xa

    .line 59
    .line 60
    :goto_0
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 61
    .line 62
    invoke-static {p1, p2, v0}, Lrx/c;->timer(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-virtual {p1}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 71
    .line 72
    .line 73
    move-result-object p2

    .line 74
    invoke-virtual {p1, p2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    new-instance p2, Ll/ed3;

    .line 79
    .line 80
    invoke-direct {p2, p0}, Ll/ed3;-><init>(Ll/ld3;)V

    .line 81
    .line 82
    .line 83
    invoke-static {p2}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 84
    .line 85
    .line 86
    move-result-object p2

    .line 87
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    iput-object p1, p0, Ll/ld3;->k:Ll/kcg0;

    .line 92
    .line 93
    iget-object p0, p0, Ll/ld3;->m:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 94
    .line 95
    return-object p0
.end method
