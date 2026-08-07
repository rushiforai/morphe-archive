.class public Lcom/p1/mobile/putong/core/ui/messages/ItemPrompt;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/widget/LinearLayout;

.field public b:Lv/VImage;

.field public c:Lv/VText;

.field public d:Lv/VText;

.field public e:Landroid/widget/FrameLayout;

.field public f:Lv/VLinear;

.field public g:Landroid/widget/FrameLayout;

.field public h:Lv/VText;

.field public i:Landroid/widget/FrameLayout;

.field public j:Lv/VText;

.field public k:Lv/VText;

.field public l:J


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/messages/ItemPrompt;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Conversation;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/messages/ItemPrompt;->j(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Conversation;Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic b(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/ui/messages/ItemPrompt;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/messages/ItemPrompt;->k(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/ui/messages/ItemPrompt;Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/messages/ItemPrompt;->l(Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Conversation;)Lrx/c;
    .locals 0

    .line 1
    const-string p4, "normal"

    .line 2
    .line 3
    invoke-static {p0, p4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 12
    .line 13
    iget-object p4, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {p0, p4, p2, p3, p1}, Lcom/p1/mobile/putong/core/api/g;->yh(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0

    .line 22
    :cond_0
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 23
    .line 24
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public static synthetic f(Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "wx"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    const-string v0, "code"

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public final g(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/bfq;->a(Lcom/p1/mobile/putong/core/ui/messages/ItemPrompt;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public h()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 6
    .line 7
    return-object p0
.end method

.method public i()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemPrompt;->h()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 6
    .line 7
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/clz;->Y3()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public final synthetic j(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Conversation;Ljava/lang/Boolean;)V
    .locals 7

    .line 1
    const-string v0, "normal"

    .line 2
    .line 3
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/4 v2, 0x0

    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    invoke-virtual {p4}, Ljava/lang/Boolean;->booleanValue()Z

    .line 11
    .line 12
    .line 13
    move-result p4

    .line 14
    if-nez p4, :cond_0

    .line 15
    .line 16
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    const/4 p4, 0x1

    .line 21
    invoke-static {p0, p4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemPrompt;->n(Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-wide v3, p3, Lcom/p1/mobile/putong/core/data/Conversation;->localBotheringTime:D

    .line 28
    .line 29
    const-wide/16 v5, 0x0

    .line 30
    .line 31
    cmpg-double p2, v3, v5

    .line 32
    .line 33
    if-gez p2, :cond_1

    .line 34
    .line 35
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result p2

    .line 39
    if-eqz p2, :cond_1

    .line 40
    .line 41
    :goto_0
    move v2, p4

    .line 42
    goto :goto_1

    .line 43
    :cond_1
    iget-wide v0, p3, Lcom/p1/mobile/putong/core/data/Conversation;->localBotherCodeTime:D

    .line 44
    .line 45
    cmpg-double p2, v0, v5

    .line 46
    .line 47
    if-gez p2, :cond_2

    .line 48
    .line 49
    const-string p2, "code"

    .line 50
    .line 51
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result p2

    .line 55
    if-eqz p2, :cond_2

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_2
    iget-wide p2, p3, Lcom/p1/mobile/putong/core/data/Conversation;->localBotherWxTime:D

    .line 59
    .line 60
    cmpg-double p2, p2, v5

    .line 61
    .line 62
    if-gez p2, :cond_3

    .line 63
    .line 64
    const-string p2, "wx"

    .line 65
    .line 66
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    if-eqz p1, :cond_3

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_3
    :goto_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPrompt;->f:Lv/VLinear;

    .line 74
    .line 75
    xor-int/lit8 p2, v2, 0x1

    .line 76
    .line 77
    invoke-static {p1, p2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 78
    .line 79
    .line 80
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPrompt;->k:Lv/VText;

    .line 81
    .line 82
    invoke-static {p0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public final synthetic k(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V
    .locals 6

    .line 1
    const-string p3, "wx"

    .line 2
    .line 3
    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p3

    .line 7
    if-eqz p3, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 12
    .line 13
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 14
    .line 15
    iget-wide p2, p2, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 16
    .line 17
    neg-double p2, p2

    .line 18
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/api/g;->sq(Ljava/lang/String;D)Lrx/c;

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    const-string p3, "code"

    .line 23
    .line 24
    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-eqz p1, :cond_1

    .line 29
    .line 30
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 33
    .line 34
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 35
    .line 36
    iget-wide p2, p2, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 37
    .line 38
    neg-double p2, p2

    .line 39
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/api/g;->rq(Ljava/lang/String;D)Lrx/c;

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 44
    .line 45
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 46
    .line 47
    iget-object p3, p2, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 48
    .line 49
    iget-wide v0, p2, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 50
    .line 51
    neg-double v0, v0

    .line 52
    invoke-virtual {p1, p3, v0, v1}, Lcom/p1/mobile/putong/core/api/g;->tq(Ljava/lang/String;D)Lrx/c;

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemPrompt;->h()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->pageId()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    const-string p1, "message_id"

    .line 64
    .line 65
    iget-object p3, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 66
    .line 67
    invoke-static {p1, p3}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    const-string p1, "message_send_status"

    .line 72
    .line 73
    const-string p3, "1"

    .line 74
    .line 75
    invoke-static {p1, p3}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    invoke-interface {p1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    const-string p3, "received_user_id"

    .line 88
    .line 89
    invoke-static {p3, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    sget-object p1, Ll/uqb0;->Z:Ll/a4j;

    .line 94
    .line 95
    iget-object p3, p2, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 96
    .line 97
    invoke-virtual {p1, p3}, Ll/a4j;->L(Ljava/lang/String;)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    const-string p3, "sensitiveword"

    .line 102
    .line 103
    invoke-static {p3, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 104
    .line 105
    .line 106
    move-result-object v3

    .line 107
    const-string p1, "sensitive_text"

    .line 108
    .line 109
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 110
    .line 111
    invoke-static {p1, p2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 112
    .line 113
    .line 114
    move-result-object v4

    .line 115
    const-string p1, "message_send_values"

    .line 116
    .line 117
    const-string p2, "nothing"

    .line 118
    .line 119
    invoke-static {p1, p2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 120
    .line 121
    .line 122
    move-result-object v5

    .line 123
    filled-new-array/range {v0 .. v5}, [Ll/sfj0$a;

    .line 124
    .line 125
    .line 126
    move-result-object p1

    .line 127
    const-string p2, "e_chat_view_spammer_alert_report"

    .line 128
    .line 129
    invoke-static {p2, p0, p1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 130
    .line 131
    .line 132
    return-void
.end method

.method public final synthetic l(Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;Landroid/view/View;)V
    .locals 6

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    invoke-virtual {p3}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemPrompt;->h()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object p3, p3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 16
    .line 17
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {p3, v2}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    iget-object v3, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 24
    .line 25
    new-instance v4, Ll/req;

    .line 26
    .line 27
    invoke-direct {v4, p2}, Ll/req;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemPrompt;->i()Z

    .line 31
    .line 32
    .line 33
    move-result v5

    .line 34
    invoke-interface/range {v0 .. v5}, Ll/r97;->x1(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ll/x20;Z)V

    .line 35
    .line 36
    .line 37
    const-string p3, "normal"

    .line 38
    .line 39
    if-ne p2, p3, :cond_0

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemPrompt;->h()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->pageId()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    const-string p2, "message_id"

    .line 50
    .line 51
    iget-object p3, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 52
    .line 53
    invoke-static {p2, p3}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    const-string p2, "message_send_status"

    .line 58
    .line 59
    const-string p3, "1"

    .line 60
    .line 61
    invoke-static {p2, p3}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 66
    .line 67
    .line 68
    move-result-object p2

    .line 69
    invoke-interface {p2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p2

    .line 73
    const-string p3, "received_user_id"

    .line 74
    .line 75
    invoke-static {p3, p2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    sget-object p2, Ll/uqb0;->Z:Ll/a4j;

    .line 80
    .line 81
    iget-object p3, p1, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 82
    .line 83
    invoke-virtual {p2, p3}, Ll/a4j;->L(Ljava/lang/String;)Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p2

    .line 87
    const-string p3, "sensitiveword"

    .line 88
    .line 89
    invoke-static {p3, p2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 90
    .line 91
    .line 92
    move-result-object v3

    .line 93
    const-string p2, "sensitive_text"

    .line 94
    .line 95
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 96
    .line 97
    invoke-static {p2, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 98
    .line 99
    .line 100
    move-result-object v4

    .line 101
    const-string p1, "message_send_values"

    .line 102
    .line 103
    const-string p2, "report"

    .line 104
    .line 105
    invoke-static {p1, p2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 106
    .line 107
    .line 108
    move-result-object v5

    .line 109
    filled-new-array/range {v0 .. v5}, [Ll/sfj0$a;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    const-string p2, "e_chat_view_spammer_alert_report"

    .line 114
    .line 115
    invoke-static {p2, p0, p1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 116
    .line 117
    .line 118
    :cond_0
    return-void
.end method

.method public m(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Conversation;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemPrompt;->h()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 8
    .line 9
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/api/g;->Ne(Ljava/lang/String;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    new-instance v2, Ll/meq;

    .line 16
    .line 17
    invoke-direct {v2, p3, p1, p4, p5}, Ll/meq;-><init>(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1, v2}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p4

    .line 24
    invoke-virtual {v0, p4}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p4

    .line 28
    new-instance p5, Ll/neq;

    .line 29
    .line 30
    invoke-direct {p5, p0, p3, p1, p2}, Ll/neq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemPrompt;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 31
    .line 32
    .line 33
    new-instance p0, Ll/oeq;

    .line 34
    .line 35
    invoke-direct {p0}, Ll/oeq;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-static {p5, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p4, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public final n(Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;)V
    .locals 8

    .line 1
    const-string v0, "wx"

    .line 2
    .line 3
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const-string v1, "\n\n\u6d3b\u52a8\u671f\u95f4\uff0c\u4e3e\u62a5\u6210\u529f\u4f1a\u83b7\u5f97\u5956\u52b1\u54e6"

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPrompt;->c:Lv/VText;

    .line 12
    .line 13
    const-string v2, "\u5bf9\u65b9\u662f\u5426\u6709\u4e0d\u826f\u884c\u4e3a\uff1f"

    .line 14
    .line 15
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPrompt;->d:Lv/VText;

    .line 19
    .line 20
    new-instance v2, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemPrompt;->h()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    sget v4, Lcom/p1/mobile/putong/core/message/R$string;->k3:I

    .line 30
    .line 31
    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_0
    const-string v0, "code"

    .line 50
    .line 51
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPrompt;->c:Lv/VText;

    .line 56
    .line 57
    if-eqz v0, :cond_1

    .line 58
    .line 59
    const-string v0, "\u8bf7\u8c28\u614e\u63d0\u4f9b\u9a8c\u8bc1\u7801\u4fe1\u606f"

    .line 60
    .line 61
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPrompt;->d:Lv/VText;

    .line 65
    .line 66
    new-instance v2, Ljava/lang/StringBuilder;

    .line 67
    .line 68
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemPrompt;->h()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 72
    .line 73
    .line 74
    move-result-object v3

    .line 75
    sget v4, Lcom/p1/mobile/putong/core/message/R$string;->l3:I

    .line 76
    .line 77
    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v3

    .line 81
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 92
    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_1
    sget v0, Lcom/p1/mobile/putong/core/message/R$string;->y4:I

    .line 96
    .line 97
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(I)V

    .line 98
    .line 99
    .line 100
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPrompt;->d:Lv/VText;

    .line 101
    .line 102
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->w4:I

    .line 103
    .line 104
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 105
    .line 106
    .line 107
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPrompt;->c:Lv/VText;

    .line 108
    .line 109
    invoke-virtual {v0}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 118
    .line 119
    .line 120
    const-string v0, "normal"

    .line 121
    .line 122
    if-ne p2, v0, :cond_2

    .line 123
    .line 124
    invoke-static {}, Ll/pzi0;->o()J

    .line 125
    .line 126
    .line 127
    move-result-wide v0

    .line 128
    iget-wide v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPrompt;->l:J

    .line 129
    .line 130
    sub-long/2addr v0, v2

    .line 131
    const-wide/16 v2, 0x3e8

    .line 132
    .line 133
    cmp-long v0, v0, v2

    .line 134
    .line 135
    if-ltz v0, :cond_2

    .line 136
    .line 137
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemPrompt;->h()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    new-instance v1, Ljava/lang/StringBuilder;

    .line 142
    .line 143
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 144
    .line 145
    .line 146
    iget-object v2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 147
    .line 148
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 149
    .line 150
    .line 151
    const-string v2, "e_chat_view_spammer_alert_report_show"

    .line 152
    .line 153
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object v1

    .line 160
    invoke-interface {v0, v1}, Ll/ucq;->L(Ljava/lang/String;)Z

    .line 161
    .line 162
    .line 163
    move-result v0

    .line 164
    if-nez v0, :cond_2

    .line 165
    .line 166
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemPrompt;->h()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 167
    .line 168
    .line 169
    move-result-object v0

    .line 170
    new-instance v1, Ljava/lang/StringBuilder;

    .line 171
    .line 172
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 173
    .line 174
    .line 175
    iget-object v3, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 176
    .line 177
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 178
    .line 179
    .line 180
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 181
    .line 182
    .line 183
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object v1

    .line 187
    invoke-interface {v0, v1}, Ll/ucq;->J(Ljava/lang/String;)V

    .line 188
    .line 189
    .line 190
    invoke-static {}, Ll/pzi0;->o()J

    .line 191
    .line 192
    .line 193
    move-result-wide v0

    .line 194
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPrompt;->l:J

    .line 195
    .line 196
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemPrompt;->h()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 197
    .line 198
    .line 199
    move-result-object v0

    .line 200
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->pageId()Ljava/lang/String;

    .line 201
    .line 202
    .line 203
    move-result-object v0

    .line 204
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 205
    .line 206
    .line 207
    move-result-object v1

    .line 208
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object v1

    .line 212
    const-string v3, "received_user_id"

    .line 213
    .line 214
    invoke-static {v3, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 215
    .line 216
    .line 217
    move-result-object v1

    .line 218
    sget-object v3, Ll/uqb0;->Z:Ll/a4j;

    .line 219
    .line 220
    iget-object v4, p1, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 221
    .line 222
    invoke-virtual {v3, v4}, Ll/a4j;->L(Ljava/lang/String;)Ljava/lang/String;

    .line 223
    .line 224
    .line 225
    move-result-object v3

    .line 226
    const-string v4, "sensitiveword"

    .line 227
    .line 228
    invoke-static {v4, v3}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 229
    .line 230
    .line 231
    move-result-object v3

    .line 232
    const-string v4, "sensitive_text"

    .line 233
    .line 234
    iget-object v5, p1, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 235
    .line 236
    invoke-static {v4, v5}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 237
    .line 238
    .line 239
    move-result-object v4

    .line 240
    const-string v5, "message_id"

    .line 241
    .line 242
    iget-object v6, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 243
    .line 244
    invoke-static {v5, v6}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 245
    .line 246
    .line 247
    move-result-object v5

    .line 248
    const-string v6, "message_send_status"

    .line 249
    .line 250
    const-string v7, "1"

    .line 251
    .line 252
    invoke-static {v6, v7}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 253
    .line 254
    .line 255
    move-result-object v6

    .line 256
    filled-new-array {v1, v3, v4, v5, v6}, [Ll/sfj0$a;

    .line 257
    .line 258
    .line 259
    move-result-object v1

    .line 260
    invoke-static {v2, v0, v1}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 261
    .line 262
    .line 263
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPrompt;->g:Landroid/widget/FrameLayout;

    .line 264
    .line 265
    new-instance v1, Ll/peq;

    .line 266
    .line 267
    invoke-direct {v1, p0, p2, p1}, Ll/peq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemPrompt;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 268
    .line 269
    .line 270
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 271
    .line 272
    .line 273
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPrompt;->i:Landroid/widget/FrameLayout;

    .line 274
    .line 275
    new-instance v1, Ll/qeq;

    .line 276
    .line 277
    invoke-direct {v1, p0, p1, p2}, Ll/qeq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemPrompt;Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;)V

    .line 278
    .line 279
    .line 280
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 281
    .line 282
    .line 283
    return-void
.end method

.method public onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemPrompt;->g(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPrompt;->b:Lv/VImage;

    .line 22
    .line 23
    sget v1, Ll/ibc0;->R5:I

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPrompt;->c:Lv/VText;

    .line 29
    .line 30
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    sget v2, Ll/g9c0;->g:I

    .line 35
    .line 36
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPrompt;->d:Lv/VText;

    .line 44
    .line 45
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    sget v2, Ll/g9c0;->i:I

    .line 50
    .line 51
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPrompt;->h:Lv/VText;

    .line 59
    .line 60
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    sget v2, Ll/g9c0;->g:I

    .line 65
    .line 66
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPrompt;->j:Lv/VText;

    .line 74
    .line 75
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    sget v2, Ll/g9c0;->g:I

    .line 80
    .line 81
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 86
    .line 87
    .line 88
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPrompt;->k:Lv/VText;

    .line 89
    .line 90
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    sget v1, Ll/g9c0;->i:I

    .line 95
    .line 96
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 97
    .line 98
    .line 99
    move-result p0

    .line 100
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 101
    .line 102
    .line 103
    :cond_0
    return-void
.end method
