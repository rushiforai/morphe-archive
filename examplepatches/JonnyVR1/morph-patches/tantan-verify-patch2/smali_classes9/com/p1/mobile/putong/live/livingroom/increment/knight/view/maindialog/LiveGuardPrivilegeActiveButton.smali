.class public Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeActiveButton;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeActiveButton;

.field public d:Lv/VLinear;

.field public e:Landroid/widget/TextView;

.field public f:Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;

.field public g:Ljava/lang/Runnable;

.field public h:Ljava/lang/Runnable;

.field public i:Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;

.field public final j:I

.field public final k:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VLinear;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/16 p1, 0x7d0

    .line 5
    .line 6
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeActiveButton;->j:I

    .line 7
    .line 8
    const/16 p1, 0x190

    .line 9
    .line 10
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeActiveButton;->k:I

    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1, p2}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/16 p1, 0x7d0

    .line 14
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeActiveButton;->j:I

    const/16 p1, 0x190

    .line 15
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeActiveButton;->k:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 16
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/16 p1, 0x7d0

    .line 17
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeActiveButton;->j:I

    const/16 p1, 0x190

    .line 18
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeActiveButton;->k:I

    return-void
.end method

.method public static synthetic P(Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeActiveButton;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeActiveButton;->V()V

    return-void
.end method

.method public static synthetic Q(Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeActiveButton;Ll/lsw$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeActiveButton;->W(Ll/lsw$a;)V

    return-void
.end method

.method public static synthetic R(Ll/ats;Ll/lsw$a;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p2, p1, Ll/lsw$a;->a:Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;

    .line 2
    .line 3
    iget-object p1, p1, Ll/lsw$a;->u:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, p2, p1}, Ll/ats;->I(Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic S(Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeActiveButton;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeActiveButton;->X()V

    return-void
.end method


# virtual methods
.method public final T(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/pts;->a(Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeActiveButton;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic V()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeActiveButton;->g:Ljava/lang/Runnable;

    .line 6
    .line 7
    const-wide/16 v1, 0x7d0

    .line 8
    .line 9
    invoke-static {v0, p0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic W(Ll/lsw$a;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeActiveButton;->f:Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;

    .line 2
    .line 3
    const-wide/16 v1, 0x190

    .line 4
    .line 5
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveRollView;->setNextAnim(J)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeActiveButton;->f:Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;

    .line 9
    .line 10
    iget-object p1, p1, Ll/lsw$a;->s:Ljava/lang/String;

    .line 11
    .line 12
    new-instance v1, Ll/ots;

    .line 13
    .line 14
    invoke-direct {v1, p0}, Ll/ots;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeActiveButton;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, p1, v1}, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;->G(Ljava/lang/String;Ljava/lang/Runnable;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final synthetic X()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeActiveButton;->f:Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;

    .line 2
    .line 3
    const/16 v0, 0x190

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;->H(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public Y(Ll/ats;Ll/lsw$a;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeActiveButton;->c:Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeActiveButton;

    .line 2
    .line 3
    new-instance v1, Ll/lts;

    .line 4
    .line 5
    invoke-direct {v1, p1, p2}, Ll/lts;-><init>(Ll/ats;Ll/lsw$a;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeActiveButton;->c:Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeActiveButton;

    .line 12
    .line 13
    iget v0, p2, Ll/lsw$a;->i:I

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeActiveButton;->d:Lv/VLinear;

    .line 19
    .line 20
    iget v0, p2, Ll/lsw$a;->h:I

    .line 21
    .line 22
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeActiveButton;->e:Landroid/widget/TextView;

    .line 26
    .line 27
    iget-object p1, p2, Ll/lsw$a;->t:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public Z(Ljava/lang/String;Ll/lsw$a;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeActiveButton;->i:Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeActiveButton;->f:Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/widget/ViewAnimator;->getCurrentView()Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeActiveButton;->i:Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeActiveButton;->f:Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;

    .line 16
    .line 17
    const/16 v1, 0x11

    .line 18
    .line 19
    const/4 v2, 0x1

    .line 20
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;->E(IZ)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeActiveButton;->b0(Ll/lsw$a;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeActiveButton;->i:Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->setMarqueeText(Ljava/lang/CharSequence;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public a0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeActiveButton;->h:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeActiveButton;->g:Ljava/lang/Runnable;

    .line 7
    .line 8
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeActiveButton;->f:Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveRollView;->reset()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final b0(Ll/lsw$a;)V
    .locals 3

    .line 1
    iget-object v0, p1, Ll/lsw$a;->s:Ljava/lang/String;

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
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Ll/vwt;->nb()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeActiveButton;->f:Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;

    .line 20
    .line 21
    iget-object v1, p1, Ll/lsw$a;->s:Ljava/lang/String;

    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;->C(Ljava/lang/String;Z)V

    .line 25
    .line 26
    .line 27
    new-instance v0, Ll/mts;

    .line 28
    .line 29
    invoke-direct {v0, p0, p1}, Ll/mts;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeActiveButton;Ll/lsw$a;)V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeActiveButton;->h:Ljava/lang/Runnable;

    .line 33
    .line 34
    new-instance p1, Ll/nts;

    .line 35
    .line 36
    invoke-direct {p1, p0}, Ll/nts;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeActiveButton;)V

    .line 37
    .line 38
    .line 39
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeActiveButton;->g:Ljava/lang/Runnable;

    .line 40
    .line 41
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeActiveButton;->h:Ljava/lang/Runnable;

    .line 46
    .line 47
    const-wide/16 v0, 0x7d0

    .line 48
    .line 49
    invoke-static {p1, p0, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 50
    .line 51
    .line 52
    :cond_0
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeActiveButton;->T(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
