.class public Lcom/p1/mobile/putong/core/newui/view/WeakenedTipsView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lcom/p1/mobile/putong/core/newui/view/WeakenedTipsView;

.field public e:Lv/VImage;

.field public f:Lcom/p1/mobile/putong/core/ui/VText_Bold;

.field public g:Lv/VImage;

.field public h:Lcom/p1/mobile/putong/core/ui/VText_Bold;

.field public i:Lcom/p1/mobile/putong/core/ui/VText_Bold;

.field public j:Ll/kcg0;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/view/WeakenedTipsView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 6
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/newui/view/WeakenedTipsView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 7
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic h0(Lcom/p1/mobile/putong/core/newui/view/WeakenedTipsView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/view/WeakenedTipsView;->o0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i0(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic j0(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p0, "e_cancel"

    .line 2
    .line 3
    const-string v0, "p_weaken_tips_pop"

    .line 4
    .line 5
    invoke-static {p0, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic k0(Lcom/p1/mobile/putong/core/newui/view/WeakenedTipsView;Ll/u46;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/view/WeakenedTipsView;->q0(Ll/u46;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic l0(Lcom/p1/mobile/putong/core/newui/view/WeakenedTipsView;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/view/WeakenedTipsView;->r0(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic m0(Lcom/p1/mobile/putong/core/newui/view/WeakenedTipsView;Ll/u46;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/view/WeakenedTipsView;->p0(Ll/u46;Landroid/view/View;)V

    return-void
.end method

.method private synthetic o0(Landroid/view/View;)V
    .locals 4

    .line 1
    const-string p1, "tips_show_position"

    .line 2
    .line 3
    const-string v0, "up"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const-string v0, "weaken_click_type"

    .line 10
    .line 11
    const-string v1, "off"

    .line 12
    .line 13
    invoke-static {v0, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    filled-new-array {p1, v0}, [Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    const-string v0, "e_old_messagesweaken_tips"

    .line 22
    .line 23
    const-string v1, "p_messages_view"

    .line 24
    .line 25
    invoke-static {v0, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 26
    .line 27
    .line 28
    const/4 p1, 0x0

    .line 29
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 30
    .line 31
    .line 32
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 35
    .line 36
    iget-object p0, p0, Ll/dkb;->E5:Ll/vxd0;

    .line 37
    .line 38
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    check-cast p0, Ljava/lang/Integer;

    .line 43
    .line 44
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    const/4 p1, 0x1

    .line 49
    if-ne p0, p1, :cond_0

    .line 50
    .line 51
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 52
    .line 53
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 54
    .line 55
    iget-object p0, p0, Ll/dkb;->F5:Ll/byd0;

    .line 56
    .line 57
    invoke-static {}, Ll/pzi0;->o()J

    .line 58
    .line 59
    .line 60
    move-result-wide v0

    .line 61
    const-wide v2, 0x9a7ec800L

    .line 62
    .line 63
    .line 64
    .line 65
    .line 66
    add-long/2addr v0, v2

    .line 67
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-virtual {p0, p1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 75
    .line 76
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 77
    .line 78
    iget-object p0, p0, Ll/dkb;->E5:Ll/vxd0;

    .line 79
    .line 80
    invoke-virtual {p0}, Ll/vxd0;->clear()Z

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 85
    .line 86
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 87
    .line 88
    iget-object p0, p0, Ll/dkb;->E5:Ll/vxd0;

    .line 89
    .line 90
    invoke-virtual {p0, p1}, Ll/vxd0;->a(I)V

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method private r()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/view/WeakenedTipsView;->g:Lv/VImage;

    .line 2
    .line 3
    new-instance v1, Ll/ypp0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/ypp0;-><init>(Lcom/p1/mobile/putong/core/newui/view/WeakenedTipsView;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Ll/gra;->z()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/view/WeakenedTipsView;->e:Lv/VImage;

    .line 18
    .line 19
    sget v1, Ll/dbc0;->ni:I

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/view/WeakenedTipsView;->g:Lv/VImage;

    .line 25
    .line 26
    sget v0, Ll/dbc0;->tg:I

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method


# virtual methods
.method public final n0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/eqp0;->a(Lcom/p1/mobile/putong/core/newui/view/WeakenedTipsView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/view/WeakenedTipsView;->n0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ll/gra;->z()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/view/WeakenedTipsView;->f:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 14
    .line 15
    const/high16 v1, -0x1000000

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/view/WeakenedTipsView;->h:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 21
    .line 22
    const-string v1, "#66000000"

    .line 23
    .line 24
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/view/WeakenedTipsView;->g:Lv/VImage;

    .line 32
    .line 33
    sget v1, Ll/dbc0;->tg:I

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 36
    .line 37
    .line 38
    :cond_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/view/WeakenedTipsView;->r()V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final synthetic p0(Ll/u46;Landroid/view/View;)V
    .locals 1

    .line 1
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/api/g;->cg()Ll/jxd0;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 10
    .line 11
    invoke-virtual {p2, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 15
    .line 16
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 17
    .line 18
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/g;->g0:Lrx/subjects/b;

    .line 19
    .line 20
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 21
    .line 22
    invoke-virtual {p2, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    const/4 p2, 0x0

    .line 26
    invoke-static {p0, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    invoke-interface {p1}, Ll/u46;->q()V

    .line 30
    .line 31
    .line 32
    new-instance p0, Ljava/lang/StringBuilder;

    .line 33
    .line 34
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-static {}, Ll/gra;->k()Lcom/p1/mobile/putong/core/data/CollapsibleConversationConfig;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iget p1, p1, Lcom/p1/mobile/putong/core/data/CollapsibleConversationConfig;->ignore_msg_days:I

    .line 42
    .line 43
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    const-string p1, "\u65e5\u524d\u672a\u8bfb\u6d88\u606f\u5df2\u5f31\u5316\u63d0\u9192\uff0c\u53ef\u5728\u8bbe\u7f6e\u4e2d\u66f4\u6539\u3002"

    .line 47
    .line 48
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 59
    .line 60
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 61
    .line 62
    sget-object p1, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 63
    .line 64
    invoke-virtual {p1}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 65
    .line 66
    .line 67
    move-result-wide p1

    .line 68
    long-to-double p1, p1

    .line 69
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/api/g;->dq(D)V

    .line 70
    .line 71
    .line 72
    const-string p0, "e_confirm"

    .line 73
    .line 74
    const-string p1, "p_weaken_tips_pop"

    .line 75
    .line 76
    invoke-static {p0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public final synthetic q0(Ll/u46;Landroid/view/View;)V
    .locals 2

    .line 1
    const-string p2, "tips_show_position"

    .line 2
    .line 3
    const-string v0, "up"

    .line 4
    .line 5
    invoke-static {p2, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    const-string v0, "weaken_click_type"

    .line 10
    .line 11
    const-string v1, "weaken"

    .line 12
    .line 13
    invoke-static {v0, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    filled-new-array {p2, v0}, [Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    const-string v0, "e_old_messagesweaken_tips"

    .line 22
    .line 23
    const-string v1, "p_messages_view"

    .line 24
    .line 25
    invoke-static {v0, v1, p2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 26
    .line 27
    .line 28
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 29
    .line 30
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 31
    .line 32
    iget-object p2, p2, Ll/dkb;->E5:Ll/vxd0;

    .line 33
    .line 34
    invoke-virtual {p2}, Ll/vxd0;->clear()Z

    .line 35
    .line 36
    .line 37
    const-string p2, "p_weaken_tips_pop"

    .line 38
    .line 39
    const-string v0, "weakenDlg"

    .line 40
    .line 41
    invoke-static {p2, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    invoke-static {p2}, Ll/w1e;->f(Ll/l4g0;)V

    .line 46
    .line 47
    .line 48
    new-instance v0, Ll/th0$a;

    .line 49
    .line 50
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-direct {v0, v1}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 55
    .line 56
    .line 57
    const-string v1, "\u5f31\u5316\u672a\u8bfb\u6d88\u606f"

    .line 58
    .line 59
    invoke-virtual {v0, v1}, Ll/th0$a;->s(Ljava/lang/String;)Ll/th0$a;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    const/4 v1, 0x1

    .line 64
    invoke-virtual {v0, v1}, Ll/th0$a;->g(Z)Ll/th0$a;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {v0, v1}, Ll/th0$a;->b(Z)Ll/th0$a;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    const-string v1, "\u786e\u8ba4"

    .line 73
    .line 74
    invoke-virtual {v0, v1}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    new-instance v1, Ll/bqp0;

    .line 79
    .line 80
    invoke-direct {v1, p0, p1}, Ll/bqp0;-><init>(Lcom/p1/mobile/putong/core/newui/view/WeakenedTipsView;Ll/u46;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v0, v1}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    new-instance p1, Ljava/lang/StringBuilder;

    .line 88
    .line 89
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 90
    .line 91
    .line 92
    invoke-static {}, Ll/gra;->k()Lcom/p1/mobile/putong/core/data/CollapsibleConversationConfig;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    iget v0, v0, Lcom/p1/mobile/putong/core/data/CollapsibleConversationConfig;->ignore_msg_days:I

    .line 97
    .line 98
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    const-string v0, "\u65e5\u524d\u672a\u8bfb\u6d88\u606f\u5c06\u5f31\u5316\u5c55\u793a\u4e0d\u518d\u8bb0\u6570\u3002\u53ef\u5728\u8bbe\u7f6e-\u9690\u79c1\u548c\u901a\u77e5\u4fee\u6539"

    .line 102
    .line 103
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    invoke-virtual {p0, p1}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    const-string p1, "\u53d6\u6d88"

    .line 115
    .line 116
    invoke-virtual {p0, p1}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    new-instance p1, Ll/cqp0;

    .line 121
    .line 122
    invoke-direct {p1}, Ll/cqp0;-><init>()V

    .line 123
    .line 124
    .line 125
    invoke-virtual {p0, p1}, Ll/th0$a;->c(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    new-instance p1, Ll/dqp0;

    .line 130
    .line 131
    invoke-direct {p1, p2}, Ll/dqp0;-><init>(Ll/l4g0;)V

    .line 132
    .line 133
    .line 134
    invoke-virtual {p0, p1}, Ll/th0$a;->m(Landroid/content/DialogInterface$OnDismissListener;)Ll/th0$a;

    .line 135
    .line 136
    .line 137
    move-result-object p0

    .line 138
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 143
    .line 144
    .line 145
    return-void
.end method

.method public final synthetic r0(Ll/uxj0;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public s0(Ll/u46;I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/view/WeakenedTipsView;->h:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 2
    .line 3
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-static {}, Ll/gra;->k()Lcom/p1/mobile/putong/core/data/CollapsibleConversationConfig;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iget v1, v1, Lcom/p1/mobile/putong/core/data/CollapsibleConversationConfig;->ignore_msg_days:I

    .line 12
    .line 13
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    filled-new-array {p2, v1}, [Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    const-string v1, "\u4f60\u6709%s\u6761%s\u65e5\u524d\u672a\u8bfb\u6d88\u606f\uff0c\u662f\u5426\u9700\u8981\u5f31\u5316\u5c55\u793a\uff1f"

    .line 22
    .line 23
    invoke-static {v1, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 28
    .line 29
    .line 30
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/view/WeakenedTipsView;->i:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 31
    .line 32
    new-instance v0, Ll/zpp0;

    .line 33
    .line 34
    invoke-direct {v0, p0, p1}, Ll/zpp0;-><init>(Lcom/p1/mobile/putong/core/newui/view/WeakenedTipsView;Ll/u46;)V

    .line 35
    .line 36
    .line 37
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/view/WeakenedTipsView;->j:Ll/kcg0;

    .line 41
    .line 42
    invoke-static {p1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 43
    .line 44
    .line 45
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 46
    .line 47
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 48
    .line 49
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/g;->g0:Lrx/subjects/b;

    .line 50
    .line 51
    new-instance p2, Ll/aqp0;

    .line 52
    .line 53
    invoke-direct {p2, p0}, Ll/aqp0;-><init>(Lcom/p1/mobile/putong/core/newui/view/WeakenedTipsView;)V

    .line 54
    .line 55
    .line 56
    invoke-static {p2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/view/WeakenedTipsView;->j:Ll/kcg0;

    .line 65
    .line 66
    return-void
.end method
