.class public Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansInvitationView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lv/VDraweeView;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Lv/VText;

.field public h:Landroid/os/Handler;

.field public i:I

.field public j:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansInvitationView$a;

    .line 5
    .line 6
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-direct {p1, p0, v0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansInvitationView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansInvitationView;Landroid/os/Looper;)V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansInvitationView;->h:Landroid/os/Handler;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 16
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 17
    new-instance p1, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansInvitationView$a;

    .line 18
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object p2

    invoke-direct {p1, p0, p2}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansInvitationView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansInvitationView;Landroid/os/Looper;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansInvitationView;->h:Landroid/os/Handler;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 19
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 20
    new-instance p1, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansInvitationView$a;

    .line 21
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object p2

    invoke-direct {p1, p0, p2}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansInvitationView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansInvitationView;Landroid/os/Looper;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansInvitationView;->h:Landroid/os/Handler;

    return-void
.end method

.method public static synthetic h0(Ll/lag;Lcom/p1/mobile/putong/live/base/data/BFansBaseRecall;Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p2}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "push"

    .line 20
    .line 21
    invoke-static {p2, v0, v1}, Ll/lig;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    new-instance p2, Ll/jxd0;

    .line 25
    .line 26
    new-instance v0, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    const-string v1, "live_fans_invitation"

    .line 29
    .line 30
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    sget-object v1, Ll/uqb0;->b0:Ll/sre0;

    .line 34
    .line 35
    iget-object v1, v1, Ll/sre0;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 36
    .line 37
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 49
    .line 50
    invoke-direct {p2, v0, v1}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    check-cast p2, Ljava/lang/Boolean;

    .line 58
    .line 59
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 60
    .line 61
    .line 62
    move-result p2

    .line 63
    if-nez p2, :cond_0

    .line 64
    .line 65
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->FansInvitationEvent:Lcom/tantan/live/eventbus/LiveEventBus$FansInvitationEvent;

    .line 70
    .line 71
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$FansInvitationEvent;->showInvitationDialog()Ll/v3f$d;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BFansBaseRecall;->inviteDetail:Lcom/p1/mobile/putong/live/base/data/BInviteDetail;

    .line 76
    .line 77
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BInviteDetail;->title:Ljava/lang/String;

    .line 78
    .line 79
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 80
    .line 81
    .line 82
    return-void

    .line 83
    :cond_0
    invoke-virtual {p0}, Ll/lag;->u4()V

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method public static bridge synthetic i0(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansInvitationView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansInvitationView;->i:I

    return p0
.end method

.method public static bridge synthetic j0(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansInvitationView;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansInvitationView;->i:I

    return-void
.end method

.method public static bridge synthetic k0(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansInvitationView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansInvitationView;->n0()V

    return-void
.end method


# virtual methods
.method public getTimeStr()Ljava/lang/String;
    .locals 1

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansInvitationView;->i:I

    .line 2
    .line 3
    div-int/lit8 v0, p0, 0x3c

    .line 4
    .line 5
    rem-int/lit8 p0, p0, 0x3c

    .line 6
    .line 7
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    filled-new-array {v0, p0}, [Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const-string v0, "%02d:%02d"

    .line 20
    .line 21
    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public final l0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/chg;->a(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansInvitationView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public m0(Ll/lag;Lcom/p1/mobile/putong/live/base/data/BFansBaseRecall;)V
    .locals 5

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BFansBaseRecall;->quickInvite:Lcom/p1/mobile/putong/live/base/data/BQuickInvite;

    .line 2
    .line 3
    iget v1, v0, Lcom/p1/mobile/putong/live/base/data/BQuickInvite;->countDown:I

    .line 4
    .line 5
    iput v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansInvitationView;->i:I

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BQuickInvite;->desc:Ljava/lang/String;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansInvitationView;->j:Ljava/lang/String;

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansInvitationView;->d:Lv/VDraweeView;

    .line 12
    .line 13
    sget-object v1, Ll/zft;->j:Ljava/lang/String;

    .line 14
    .line 15
    const/high16 v2, 0x42580000    # 54.0f

    .line 16
    .line 17
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    const-string v4, "context_livingAct"

    .line 26
    .line 27
    invoke-static {v4, v0, v1, v3, v2}, Ll/izs;->m(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansInvitationView;->e:Lv/VText;

    .line 31
    .line 32
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BFansBaseRecall;->quickInvite:Lcom/p1/mobile/putong/live/base/data/BQuickInvite;

    .line 33
    .line 34
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BQuickInvite;->title:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansInvitationView;->f:Lv/VText;

    .line 40
    .line 41
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BFansBaseRecall;->quickInvite:Lcom/p1/mobile/putong/live/base/data/BQuickInvite;

    .line 42
    .line 43
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BQuickInvite;->desc:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansInvitationView;->g:Lv/VText;

    .line 49
    .line 50
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BFansBaseRecall;->quickInvite:Lcom/p1/mobile/putong/live/base/data/BQuickInvite;

    .line 51
    .line 52
    iget-boolean v1, v1, Lcom/p1/mobile/putong/live/base/data/BQuickInvite;->enable:Z

    .line 53
    .line 54
    if-eqz v1, :cond_0

    .line 55
    .line 56
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansInvitationView;->i:I

    .line 57
    .line 58
    if-nez v1, :cond_0

    .line 59
    .line 60
    const/4 v1, 0x1

    .line 61
    goto :goto_0

    .line 62
    :cond_0
    const/4 v1, 0x0

    .line 63
    :goto_0
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansInvitationView;->g:Lv/VText;

    .line 67
    .line 68
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BFansBaseRecall;->quickInvite:Lcom/p1/mobile/putong/live/base/data/BQuickInvite;

    .line 69
    .line 70
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BQuickInvite;->buttonText:Ljava/lang/String;

    .line 71
    .line 72
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansInvitationView;->g:Lv/VText;

    .line 76
    .line 77
    new-instance v1, Ll/bhg;

    .line 78
    .line 79
    invoke-direct {v1, p1, p2}, Ll/bhg;-><init>(Ll/lag;Lcom/p1/mobile/putong/live/base/data/BFansBaseRecall;)V

    .line 80
    .line 81
    .line 82
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 83
    .line 84
    .line 85
    iget p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansInvitationView;->i:I

    .line 86
    .line 87
    if-eqz p1, :cond_1

    .line 88
    .line 89
    iget-object p1, p2, Lcom/p1/mobile/putong/live/base/data/BFansBaseRecall;->quickInvite:Lcom/p1/mobile/putong/live/base/data/BQuickInvite;

    .line 90
    .line 91
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BQuickInvite;->enable:Z

    .line 92
    .line 93
    if-nez p1, :cond_1

    .line 94
    .line 95
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansInvitationView;->n0()V

    .line 96
    .line 97
    .line 98
    :cond_1
    return-void
.end method

.method public final n0()V
    .locals 4

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansInvitationView;->i:I

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansInvitationView;->h:Landroid/os/Handler;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansInvitationView;->g:Lv/VText;

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansInvitationView;->f:Lv/VText;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansInvitationView;->j:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansInvitationView;->f:Lv/VText;

    .line 29
    .line 30
    new-instance v1, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    const-string v2, "<font color=\'#fe7e1d\'>"

    .line 33
    .line 34
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansInvitationView;->getTimeStr()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    const-string v2, "</font> "

    .line 45
    .line 46
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->s4:I

    .line 58
    .line 59
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    invoke-static {v1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 75
    .line 76
    .line 77
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansInvitationView;->h:Landroid/os/Handler;

    .line 78
    .line 79
    const/4 v0, 0x0

    .line 80
    const-wide/16 v1, 0x3e8

    .line 81
    .line 82
    invoke-virtual {p0, v0, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansInvitationView;->h:Landroid/os/Handler;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-virtual {p0, v0}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansInvitationView;->l0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
