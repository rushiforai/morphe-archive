.class public Lcom/p1/mobile/putong/core/newui/messages/ConversationWeakenView;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Lv/VLinear;

.field public d:Landroid/widget/ImageView;

.field public e:Landroid/widget/TextView;

.field public f:Landroid/widget/TextView;

.field public g:Landroid/widget/ImageView;

.field public h:Ll/kcg0;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic P(Lcom/p1/mobile/putong/core/newui/messages/ConversationWeakenView;Ll/u46;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationWeakenView;->Y(Ll/u46;Ll/pf60;)V

    return-void
.end method

.method public static synthetic Q(Lcom/p1/mobile/putong/core/newui/messages/ConversationWeakenView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationWeakenView;->b0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic R(Lcom/p1/mobile/putong/core/newui/messages/ConversationWeakenView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationWeakenView;->c0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic S(Landroid/view/View;)V
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

.method public static synthetic T(Lcom/p1/mobile/putong/core/newui/messages/ConversationWeakenView;Ll/u46;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationWeakenView;->Z(Ll/u46;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic V(Lcom/p1/mobile/putong/core/newui/messages/ConversationWeakenView;Ll/u46;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationWeakenView;->a0(Ll/u46;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic W(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final X(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/cn6;->a(Lcom/p1/mobile/putong/core/newui/messages/ConversationWeakenView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic Y(Ll/u46;Ll/pf60;)V
    .locals 6

    .line 1
    invoke-static {}, Ll/gra;->l()Lcom/p1/mobile/putong/core/data/CollapsibleConversationConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/data/CollapsibleConversationConfig;->enabled:Z

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    iget-object p2, p2, Ll/pf60;->a:Ljava/lang/Object;

    .line 11
    .line 12
    if-nez p2, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationWeakenView;->c:Lv/VLinear;

    .line 15
    .line 16
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationWeakenView;->e0(Ll/u46;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_1
    iget-object v0, p2, Ll/pf60;->a:Ljava/lang/Object;

    .line 25
    .line 26
    if-eqz v0, :cond_3

    .line 27
    .line 28
    iget-object p2, p2, Ll/pf60;->b:Ljava/lang/Object;

    .line 29
    .line 30
    if-eqz p2, :cond_2

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 33
    .line 34
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 35
    .line 36
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/api/g;->Ag()D

    .line 37
    .line 38
    .line 39
    move-result-wide v2

    .line 40
    double-to-long v2, v2

    .line 41
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 42
    .line 43
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 44
    .line 45
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/api/g;->hg()D

    .line 46
    .line 47
    .line 48
    move-result-wide v4

    .line 49
    double-to-long v4, v4

    .line 50
    invoke-static {v2, v3, v4, v5}, Ll/pzi0;->C(JJ)Z

    .line 51
    .line 52
    .line 53
    move-result p2

    .line 54
    if-eqz p2, :cond_2

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_2
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationWeakenView;->e0(Ll/u46;)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_3
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationWeakenView;->c:Lv/VLinear;

    .line 62
    .line 63
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public final synthetic Z(Ll/u46;Landroid/view/View;)V
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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationWeakenView;->c:Lv/VLinear;

    .line 26
    .line 27
    const/4 p2, 0x0

    .line 28
    invoke-static {p0, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    invoke-interface {p1}, Ll/u46;->q()V

    .line 32
    .line 33
    .line 34
    new-instance p0, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-static {}, Ll/gra;->k()Lcom/p1/mobile/putong/core/data/CollapsibleConversationConfig;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    iget p1, p1, Lcom/p1/mobile/putong/core/data/CollapsibleConversationConfig;->ignore_msg_days:I

    .line 44
    .line 45
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    const-string p1, "\u65e5\u524d\u672a\u8bfb\u6d88\u606f\u5df2\u5f31\u5316\u63d0\u9192\uff0c\u53ef\u5728\u8bbe\u7f6e\u4e2d\u66f4\u6539\u3002"

    .line 49
    .line 50
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 61
    .line 62
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 63
    .line 64
    sget-object p1, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 65
    .line 66
    invoke-virtual {p1}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 67
    .line 68
    .line 69
    move-result-wide p1

    .line 70
    long-to-double p1, p1

    .line 71
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/api/g;->dq(D)V

    .line 72
    .line 73
    .line 74
    const-string p0, "e_confirm"

    .line 75
    .line 76
    const-string p1, "p_weaken_tips_pop"

    .line 77
    .line 78
    invoke-static {p0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public final synthetic a0(Ll/u46;Landroid/view/View;)V
    .locals 2

    .line 1
    const-string p2, "p_weaken_tips_pop"

    .line 2
    .line 3
    const-string v0, "weakenDlg"

    .line 4
    .line 5
    invoke-static {p2, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-static {p2}, Ll/w1e;->f(Ll/l4g0;)V

    .line 10
    .line 11
    .line 12
    new-instance v0, Ll/th0$a;

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-direct {v0, v1}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 19
    .line 20
    .line 21
    const-string v1, "\u5f31\u5316\u672a\u8bfb\u6d88\u606f"

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ll/th0$a;->s(Ljava/lang/String;)Ll/th0$a;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const/4 v1, 0x1

    .line 28
    invoke-virtual {v0, v1}, Ll/th0$a;->g(Z)Ll/th0$a;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0, v1}, Ll/th0$a;->b(Z)Ll/th0$a;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    const-string v1, "\u786e\u8ba4"

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    new-instance v1, Ll/zm6;

    .line 43
    .line 44
    invoke-direct {v1, p0, p1}, Ll/zm6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationWeakenView;Ll/u46;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, v1}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    new-instance p1, Ljava/lang/StringBuilder;

    .line 52
    .line 53
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 54
    .line 55
    .line 56
    invoke-static {}, Ll/gra;->k()Lcom/p1/mobile/putong/core/data/CollapsibleConversationConfig;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    iget v0, v0, Lcom/p1/mobile/putong/core/data/CollapsibleConversationConfig;->ignore_msg_days:I

    .line 61
    .line 62
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    const-string v0, "\u65e5\u524d\u672a\u8bfb\u6d88\u606f\u5c06\u5f31\u5316\u5c55\u793a\u4e0d\u518d\u8bb0\u6570\u3002\u53ef\u5728\u8bbe\u7f6e-\u9690\u79c1\u548c\u901a\u77e5\u4fee\u6539"

    .line 66
    .line 67
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    invoke-virtual {p0, p1}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    const-string p1, "\u53d6\u6d88"

    .line 79
    .line 80
    invoke-virtual {p0, p1}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    new-instance p1, Ll/an6;

    .line 85
    .line 86
    invoke-direct {p1}, Ll/an6;-><init>()V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p0, p1}, Ll/th0$a;->c(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    new-instance p1, Ll/bn6;

    .line 94
    .line 95
    invoke-direct {p1, p2}, Ll/bn6;-><init>(Ll/l4g0;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {p0, p1}, Ll/th0$a;->m(Landroid/content/DialogInterface$OnDismissListener;)Ll/th0$a;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 107
    .line 108
    .line 109
    const-string p0, "tips_show_position"

    .line 110
    .line 111
    const-string p1, "down"

    .line 112
    .line 113
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    const-string p1, "weaken_click_type"

    .line 118
    .line 119
    const-string p2, "weaken"

    .line 120
    .line 121
    invoke-static {p1, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    filled-new-array {p0, p1}, [Ll/pf60;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    const-string p1, "e_old_messagesweaken_tips"

    .line 130
    .line 131
    const-string p2, "p_messages_view"

    .line 132
    .line 133
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 134
    .line 135
    .line 136
    return-void
.end method

.method public final synthetic b0(Landroid/view/View;)V
    .locals 2

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/g;->u0:Ll/byd0;

    .line 6
    .line 7
    invoke-static {}, Ll/pzi0;->o()J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p1, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationWeakenView;->c:Lv/VLinear;

    .line 19
    .line 20
    const/4 p1, 0x0

    .line 21
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    const-string p0, "tips_show_position"

    .line 25
    .line 26
    const-string p1, "down"

    .line 27
    .line 28
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    const-string p1, "weaken_click_type"

    .line 33
    .line 34
    const-string v0, "off"

    .line 35
    .line 36
    invoke-static {p1, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    filled-new-array {p0, p1}, [Ll/pf60;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    const-string p1, "e_old_messagesweaken_tips"

    .line 45
    .line 46
    const-string v0, "p_messages_view"

    .line 47
    .line 48
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public final synthetic c0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationWeakenView;->c:Lv/VLinear;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/g;->pp()V

    .line 12
    .line 13
    .line 14
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/g;->s0:Ll/jxd0;

    .line 19
    .line 20
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    const-string p0, "e_old_messages_weakened_tips"

    .line 26
    .line 27
    const-string p1, "p_messages_view"

    .line 28
    .line 29
    invoke-static {p0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public d0(Lcom/p1/mobile/android/app/Act;Ll/u46;)V
    .locals 3

    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/view/View;->setMinimumHeight(I)V

    invoke-virtual {p0, v0}, Landroid/view/View;->setMinimumWidth(I)V

    return-void

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationWeakenView;->c:Lv/VLinear;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationWeakenView;->h:Ll/kcg0;

    .line 8
    .line 9
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 10
    .line 11
    .line 12
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 15
    .line 16
    const-string v1, "fake_conversation_weaken_conversation"

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/g;->Ue(Ljava/lang/String;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 23
    .line 24
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 25
    .line 26
    const-string v2, "fake_conversation_fold_conversation"

    .line 27
    .line 28
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/api/g;->Ue(Ljava/lang/String;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    new-instance v2, Ll/um6;

    .line 33
    .line 34
    invoke-direct {v2}, Ll/um6;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-static {v0, v1, v2}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-interface {p2, p1, v0}, Ll/pol;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    new-instance v0, Ll/vm6;

    .line 46
    .line 47
    invoke-direct {v0, p0, p2}, Ll/vm6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationWeakenView;Ll/u46;)V

    .line 48
    .line 49
    .line 50
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationWeakenView;->h:Ll/kcg0;

    .line 59
    .line 60
    return-void
.end method

.method public e0(Ll/u46;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/g;->cg()Ll/jxd0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Ljava/lang/Boolean;

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationWeakenView;->f0(Ll/u46;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationWeakenView;->g0()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public f0(Ll/u46;)V
    .locals 5

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 8
    .line 9
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/g;->u0:Ll/byd0;

    .line 10
    .line 11
    invoke-virtual {v2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    check-cast v2, Ljava/lang/Long;

    .line 16
    .line 17
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    .line 18
    .line 19
    .line 20
    move-result-wide v2

    .line 21
    sub-long/2addr v0, v2

    .line 22
    const-wide/32 v2, 0x240c8400

    .line 23
    .line 24
    .line 25
    cmp-long v0, v0, v2

    .line 26
    .line 27
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationWeakenView;->c:Lv/VLinear;

    .line 28
    .line 29
    if-gez v0, :cond_0

    .line 30
    .line 31
    const/4 p0, 0x0

    .line 32
    invoke-static {v1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    const/4 v0, 0x1

    .line 37
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 38
    .line 39
    .line 40
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationWeakenView;->f:Landroid/widget/TextView;

    .line 41
    .line 42
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 43
    .line 44
    .line 45
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationWeakenView;->e:Landroid/widget/TextView;

    .line 46
    .line 47
    sget-object v2, Ljava/util/Locale;->CHINESE:Ljava/util/Locale;

    .line 48
    .line 49
    invoke-static {}, Ll/gra;->k()Lcom/p1/mobile/putong/core/data/CollapsibleConversationConfig;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    iget v3, v3, Lcom/p1/mobile/putong/core/data/CollapsibleConversationConfig;->ignore_msg_days:I

    .line 54
    .line 55
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    const-string v4, "\u5f31\u5316\u8d85\u8fc7%d\u65e5\u7684\u672a\u8bfb\u6d88\u606f\u63d0\u9192\uff0c"

    .line 64
    .line 65
    invoke-static {v2, v4, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 70
    .line 71
    .line 72
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationWeakenView;->e:Landroid/widget/TextView;

    .line 73
    .line 74
    const/4 v2, 0x3

    .line 75
    invoke-static {v2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 76
    .line 77
    .line 78
    move-result-object v3

    .line 79
    invoke-virtual {v1, v3, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 80
    .line 81
    .line 82
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationWeakenView;->f:Landroid/widget/TextView;

    .line 83
    .line 84
    invoke-static {v2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    invoke-virtual {v1, v2, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 89
    .line 90
    .line 91
    sget-boolean v1, Ll/xpp0;->b:Z

    .line 92
    .line 93
    if-nez v1, :cond_1

    .line 94
    .line 95
    sput-boolean v0, Ll/xpp0;->b:Z

    .line 96
    .line 97
    const-string v0, "tips_show_position"

    .line 98
    .line 99
    const-string v1, "down"

    .line 100
    .line 101
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    filled-new-array {v0}, [Ll/pf60;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    const-string v1, "e_old_messagesweaken_tips"

    .line 110
    .line 111
    const-string v2, "p_messages_view"

    .line 112
    .line 113
    invoke-static {v1, v2, v0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 114
    .line 115
    .line 116
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationWeakenView;->f:Landroid/widget/TextView;

    .line 117
    .line 118
    new-instance v1, Ll/wm6;

    .line 119
    .line 120
    invoke-direct {v1, p0, p1}, Ll/wm6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationWeakenView;Ll/u46;)V

    .line 121
    .line 122
    .line 123
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 124
    .line 125
    .line 126
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationWeakenView;->g:Landroid/widget/ImageView;

    .line 127
    .line 128
    new-instance v0, Ll/xm6;

    .line 129
    .line 130
    invoke-direct {v0, p0}, Ll/xm6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationWeakenView;)V

    .line 131
    .line 132
    .line 133
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 134
    .line 135
    .line 136
    return-void
.end method

.method public g0()V
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/g;->s0:Ll/jxd0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v1, 0x0

    .line 18
    if-eqz v0, :cond_3

    .line 19
    .line 20
    invoke-static {}, Ll/gra;->k()Lcom/p1/mobile/putong/core/data/CollapsibleConversationConfig;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/data/CollapsibleConversationConfig;->ignore_old_unread_msg:Z

    .line 25
    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    goto :goto_1

    .line 29
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationWeakenView;->c:Lv/VLinear;

    .line 30
    .line 31
    const/4 v2, 0x1

    .line 32
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationWeakenView;->f:Landroid/widget/TextView;

    .line 36
    .line 37
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 38
    .line 39
    .line 40
    sget-boolean v0, Ll/xpp0;->a:Z

    .line 41
    .line 42
    if-nez v0, :cond_1

    .line 43
    .line 44
    sput-boolean v2, Ll/xpp0;->a:Z

    .line 45
    .line 46
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 47
    .line 48
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 49
    .line 50
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/g;->t0:Ll/vxd0;

    .line 51
    .line 52
    invoke-virtual {v0, v2}, Ll/vxd0;->a(I)V

    .line 53
    .line 54
    .line 55
    const-string v0, "e_old_messages_weakened_tips"

    .line 56
    .line 57
    const-string v1, "p_messages_view"

    .line 58
    .line 59
    invoke-static {v0, v1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    :cond_1
    invoke-static {}, Ll/gra;->l()Lcom/p1/mobile/putong/core/data/CollapsibleConversationConfig;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/data/CollapsibleConversationConfig;->enabled:Z

    .line 67
    .line 68
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationWeakenView;->e:Landroid/widget/TextView;

    .line 69
    .line 70
    if-eqz v0, :cond_2

    .line 71
    .line 72
    const-string v0, "\u5df2\u4e3a\u4f60\u5f31\u5316\u66f4\u591a\u65e9\u671f\u672a\u8bfb\u6d88\u606f\u63d0\u9192"

    .line 73
    .line 74
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 75
    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_2
    sget-object v0, Ljava/util/Locale;->CHINESE:Ljava/util/Locale;

    .line 79
    .line 80
    invoke-static {}, Ll/gra;->k()Lcom/p1/mobile/putong/core/data/CollapsibleConversationConfig;

    .line 81
    .line 82
    .line 83
    move-result-object v3

    .line 84
    iget v3, v3, Lcom/p1/mobile/putong/core/data/CollapsibleConversationConfig;->ignore_msg_days:I

    .line 85
    .line 86
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object v3

    .line 94
    const-string v4, "\u8d85\u8fc7%d\u5929\u7684\u672a\u8bfb\u6d88\u606f\u5df2\u4e3a\u4f60\u5f31\u5316\u63d0\u9192"

    .line 95
    .line 96
    invoke-static {v0, v4, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 101
    .line 102
    .line 103
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationWeakenView;->e:Landroid/widget/TextView;

    .line 104
    .line 105
    const/4 v1, 0x3

    .line 106
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    invoke-virtual {v0, v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 111
    .line 112
    .line 113
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationWeakenView;->g:Landroid/widget/ImageView;

    .line 114
    .line 115
    new-instance v1, Ll/ym6;

    .line 116
    .line 117
    invoke-direct {v1, p0}, Ll/ym6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationWeakenView;)V

    .line 118
    .line 119
    .line 120
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 121
    .line 122
    .line 123
    return-void

    .line 124
    :cond_3
    :goto_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationWeakenView;->c:Lv/VLinear;

    .line 125
    .line 126
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 127
    .line 128
    .line 129
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationWeakenView;->X(Landroid/view/View;)V

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationWeakenView;->g:Landroid/widget/ImageView;

    .line 14
    .line 15
    sget v1, Ll/dbc0;->tg:I

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationWeakenView;->d:Landroid/widget/ImageView;

    .line 21
    .line 22
    sget v0, Ll/dbc0;->ni:I

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method
