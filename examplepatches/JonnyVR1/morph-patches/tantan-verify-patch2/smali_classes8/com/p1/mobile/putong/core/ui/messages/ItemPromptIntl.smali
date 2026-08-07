.class public Lcom/p1/mobile/putong/core/ui/messages/ItemPromptIntl;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/widget/LinearLayout;

.field public b:Landroid/widget/LinearLayout;

.field public c:Lv/VText;

.field public d:Lv/VText;

.field public e:Landroid/widget/LinearLayout;

.field public f:Lv/VText;

.field public g:Landroid/widget/LinearLayout;

.field public h:Landroid/widget/LinearLayout;

.field public i:Lv/VText;

.field public j:Lv/VText;

.field public k:Lv/VLinear;

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

.method public static synthetic a(Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V
    .locals 7

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 6
    .line 7
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 8
    .line 9
    neg-double v1, v1

    .line 10
    const/4 v3, 0x1

    .line 11
    invoke-virtual {p1, v0, v1, v2, v3}, Lcom/p1/mobile/putong/core/api/g;->uq(Ljava/lang/String;DI)Lrx/c;

    .line 12
    .line 13
    .line 14
    const-string p1, "message_id"

    .line 15
    .line 16
    iget-object v0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 17
    .line 18
    invoke-static {p1, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    const-string p1, "message_send_status"

    .line 23
    .line 24
    const-string v0, "1"

    .line 25
    .line 26
    invoke-static {p1, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-interface {p1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    const-string v0, "received_user_id"

    .line 39
    .line 40
    invoke-static {v0, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    sget-object p1, Ll/uqb0;->Z:Ll/a4j;

    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {p1, v0}, Ll/a4j;->L(Ljava/lang/String;)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    const-string v0, "sensitiveword"

    .line 53
    .line 54
    invoke-static {v0, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 55
    .line 56
    .line 57
    move-result-object v4

    .line 58
    const-string p1, "sensitive_text"

    .line 59
    .line 60
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 61
    .line 62
    invoke-static {p1, p0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 63
    .line 64
    .line 65
    move-result-object v5

    .line 66
    const-string p0, "message_send_values"

    .line 67
    .line 68
    const-string p1, "nothing"

    .line 69
    .line 70
    invoke-static {p0, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 71
    .line 72
    .line 73
    move-result-object v6

    .line 74
    filled-new-array/range {v1 .. v6}, [Ll/sfj0$a;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    const-string p1, "e_chat_view_spammer_alert_report"

    .line 79
    .line 80
    const-string v0, "p_chat_view"

    .line 81
    .line 82
    invoke-static {p1, v0, p0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public static synthetic b(Ll/uxj0;Ll/uxj0;)Ll/uxj0;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/ui/messages/ItemPromptIntl;Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemPromptIntl;->k(Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ll/uxj0;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 5
    .line 6
    .line 7
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 8
    .line 9
    new-instance p2, Ll/zeq;

    .line 10
    .line 11
    invoke-direct {p2, p1}, Ll/zeq;-><init>(Lcom/p1/mobile/putong/data/User;)V

    .line 12
    .line 13
    .line 14
    const-wide/16 v0, 0x12c

    .line 15
    .line 16
    invoke-static {p0, p2, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/ui/messages/ItemPromptIntl;Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemPromptIntl;->l(Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/ui/DialogAct;->P0(Landroid/content/Context;ILjava/io/Serializable;)Landroid/content/Intent;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V
    .locals 7

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 6
    .line 7
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 8
    .line 9
    neg-double v1, v1

    .line 10
    const/4 v3, 0x7

    .line 11
    invoke-virtual {p1, v0, v1, v2, v3}, Lcom/p1/mobile/putong/core/api/g;->uq(Ljava/lang/String;DI)Lrx/c;

    .line 12
    .line 13
    .line 14
    const-string p1, "message_id"

    .line 15
    .line 16
    iget-object v0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 17
    .line 18
    invoke-static {p1, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    const-string p1, "message_send_status"

    .line 23
    .line 24
    const-string v0, "1"

    .line 25
    .line 26
    invoke-static {p1, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-interface {p1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    const-string v0, "received_user_id"

    .line 39
    .line 40
    invoke-static {v0, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    sget-object p1, Ll/uqb0;->Z:Ll/a4j;

    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {p1, v0}, Ll/a4j;->L(Ljava/lang/String;)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    const-string v0, "sensitiveword"

    .line 53
    .line 54
    invoke-static {v0, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 55
    .line 56
    .line 57
    move-result-object v4

    .line 58
    const-string p1, "sensitive_text"

    .line 59
    .line 60
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 61
    .line 62
    invoke-static {p1, p0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 63
    .line 64
    .line 65
    move-result-object v5

    .line 66
    const-string p0, "message_send_values"

    .line 67
    .line 68
    const-string p1, "nothing"

    .line 69
    .line 70
    invoke-static {p0, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 71
    .line 72
    .line 73
    move-result-object v6

    .line 74
    filled-new-array/range {v1 .. v6}, [Ll/sfj0$a;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    const-string p1, "e_chat_view_spammer_alert_twice_report"

    .line 79
    .line 80
    const-string v0, "p_chat_view"

    .line 81
    .line 82
    invoke-static {p1, v0, p0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public static synthetic h(Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public final i(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/afq;->a(Lcom/p1/mobile/putong/core/ui/messages/ItemPromptIntl;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public j()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;
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

.method public final synthetic k(Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V
    .locals 13

    .line 1
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 6
    .line 7
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 8
    .line 9
    const/4 v3, 0x3

    .line 10
    invoke-virtual {p2, v0, v1, v2, v3}, Lcom/p1/mobile/putong/core/api/g;->uq(Ljava/lang/String;DI)Lrx/c;

    .line 11
    .line 12
    .line 13
    new-instance v4, Landroid/view/animation/ScaleAnimation;

    .line 14
    .line 15
    const/4 v11, 0x1

    .line 16
    const/high16 v12, 0x3f000000    # 0.5f

    .line 17
    .line 18
    const/4 v5, 0x0

    .line 19
    const/high16 v6, 0x3f800000    # 1.0f

    .line 20
    .line 21
    const/4 v7, 0x0

    .line 22
    const/high16 v8, 0x3f800000    # 1.0f

    .line 23
    .line 24
    const/4 v9, 0x1

    .line 25
    const/high16 v10, 0x3f000000    # 0.5f

    .line 26
    .line 27
    invoke-direct/range {v4 .. v12}, Landroid/view/animation/ScaleAnimation;-><init>(FFFFIFIF)V

    .line 28
    .line 29
    .line 30
    const-wide/16 v0, 0x1f4

    .line 31
    .line 32
    invoke-virtual {v4, v0, v1}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPromptIntl;->g:Landroid/widget/LinearLayout;

    .line 36
    .line 37
    invoke-virtual {p0, v4}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 38
    .line 39
    .line 40
    const-string p0, "message_id"

    .line 41
    .line 42
    iget-object p2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 43
    .line 44
    invoke-static {p0, p2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    const-string p0, "message_send_status"

    .line 49
    .line 50
    const-string p2, "1"

    .line 51
    .line 52
    invoke-static {p0, p2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    const-string p2, "received_user_id"

    .line 65
    .line 66
    invoke-static {p2, p0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    sget-object p0, Ll/uqb0;->Z:Ll/a4j;

    .line 71
    .line 72
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 73
    .line 74
    invoke-virtual {p0, p2}, Ll/a4j;->L(Ljava/lang/String;)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    const-string p2, "sensitiveword"

    .line 79
    .line 80
    invoke-static {p2, p0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 81
    .line 82
    .line 83
    move-result-object v3

    .line 84
    const-string p0, "sensitive_text"

    .line 85
    .line 86
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 87
    .line 88
    invoke-static {p0, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 89
    .line 90
    .line 91
    move-result-object v4

    .line 92
    const-string p0, "message_send_values"

    .line 93
    .line 94
    const-string p1, "report"

    .line 95
    .line 96
    invoke-static {p0, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 97
    .line 98
    .line 99
    move-result-object v5

    .line 100
    filled-new-array/range {v0 .. v5}, [Ll/sfj0$a;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    const-string p1, "e_chat_view_spammer_alert_report"

    .line 105
    .line 106
    const-string p2, "p_chat_view"

    .line 107
    .line 108
    invoke-static {p1, p2, p0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 109
    .line 110
    .line 111
    return-void
.end method

.method public final synthetic l(Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V
    .locals 7

    .line 1
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 6
    .line 7
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 8
    .line 9
    const/16 v3, 0xf

    .line 10
    .line 11
    invoke-virtual {p2, v0, v1, v2, v3}, Lcom/p1/mobile/putong/core/api/g;->uq(Ljava/lang/String;DI)Lrx/c;

    .line 12
    .line 13
    .line 14
    const-string p2, "message_id"

    .line 15
    .line 16
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 17
    .line 18
    invoke-static {p2, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    const-string p2, "message_send_status"

    .line 23
    .line 24
    const-string v0, "1"

    .line 25
    .line 26
    invoke-static {p2, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    invoke-interface {p2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    const-string v0, "received_user_id"

    .line 39
    .line 40
    invoke-static {v0, p2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    sget-object p2, Ll/uqb0;->Z:Ll/a4j;

    .line 45
    .line 46
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {p2, v0}, Ll/a4j;->L(Ljava/lang/String;)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p2

    .line 52
    const-string v0, "sensitiveword"

    .line 53
    .line 54
    invoke-static {v0, p2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 55
    .line 56
    .line 57
    move-result-object v4

    .line 58
    const-string p2, "sensitive_text"

    .line 59
    .line 60
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 61
    .line 62
    invoke-static {p2, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 63
    .line 64
    .line 65
    move-result-object v5

    .line 66
    const-string p2, "message_send_values"

    .line 67
    .line 68
    const-string v0, "report"

    .line 69
    .line 70
    invoke-static {p2, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 71
    .line 72
    .line 73
    move-result-object v6

    .line 74
    filled-new-array/range {v1 .. v6}, [Ll/sfj0$a;

    .line 75
    .line 76
    .line 77
    move-result-object p2

    .line 78
    const-string v0, "e_chat_view_spammer_alert_twice_report"

    .line 79
    .line 80
    const-string v1, "p_chat_view"

    .line 81
    .line 82
    invoke-static {v0, v1, p2}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemPromptIntl;->j()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 86
    .line 87
    .line 88
    move-result-object p2

    .line 89
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 90
    .line 91
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 92
    .line 93
    invoke-virtual {p0, p2, v0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemPromptIntl;->o(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method public m(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 13

    .line 1
    iget v0, p2, Lcom/p1/mobile/putong/core/data/Conversation;->localBotherStatus:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemPromptIntl;->n(I)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPromptIntl;->c:Lv/VText;

    .line 7
    .line 8
    new-instance v1, Ll/seq;

    .line 9
    .line 10
    invoke-direct {v1, p0, p1}, Ll/seq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemPromptIntl;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 11
    .line 12
    .line 13
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPromptIntl;->d:Lv/VText;

    .line 17
    .line 18
    new-instance v1, Ll/teq;

    .line 19
    .line 20
    invoke-direct {v1, p1}, Ll/teq;-><init>(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPromptIntl;->i:Lv/VText;

    .line 27
    .line 28
    new-instance v1, Ll/ueq;

    .line 29
    .line 30
    invoke-direct {v1, p0, p1}, Ll/ueq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemPromptIntl;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 31
    .line 32
    .line 33
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPromptIntl;->j:Lv/VText;

    .line 37
    .line 38
    new-instance v1, Ll/veq;

    .line 39
    .line 40
    invoke-direct {v1, p1}, Ll/veq;-><init>(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 41
    .line 42
    .line 43
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 44
    .line 45
    .line 46
    invoke-static {}, Ll/pzi0;->o()J

    .line 47
    .line 48
    .line 49
    move-result-wide v0

    .line 50
    iget-wide v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPromptIntl;->l:J

    .line 51
    .line 52
    sub-long/2addr v0, v2

    .line 53
    const-wide/16 v2, 0x3e8

    .line 54
    .line 55
    cmp-long v0, v0, v2

    .line 56
    .line 57
    if-ltz v0, :cond_1

    .line 58
    .line 59
    invoke-static {}, Ll/pzi0;->o()J

    .line 60
    .line 61
    .line 62
    move-result-wide v0

    .line 63
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPromptIntl;->l:J

    .line 64
    .line 65
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemPromptIntl;->j()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    new-instance v1, Ljava/lang/StringBuilder;

    .line 70
    .line 71
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 72
    .line 73
    .line 74
    iget-object v2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 75
    .line 76
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    const-string v2, "e_chat_view_spammer_alert_report_show"

    .line 80
    .line 81
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    invoke-interface {v0, v1}, Ll/ucq;->L(Ljava/lang/String;)Z

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    const-string v1, "1"

    .line 93
    .line 94
    const-string v3, "message_send_status"

    .line 95
    .line 96
    const-string v4, "message_id"

    .line 97
    .line 98
    const-string v5, "sensitive_text"

    .line 99
    .line 100
    const-string v6, "sensitiveword"

    .line 101
    .line 102
    const-string v7, "received_user_id"

    .line 103
    .line 104
    const-string v8, "p_chat_view"

    .line 105
    .line 106
    if-nez v0, :cond_0

    .line 107
    .line 108
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemPromptIntl;->j()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    new-instance v9, Ljava/lang/StringBuilder;

    .line 113
    .line 114
    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 115
    .line 116
    .line 117
    iget-object v10, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 118
    .line 119
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v9

    .line 129
    invoke-interface {v0, v9}, Ll/ucq;->J(Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    invoke-static {v7, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    sget-object v9, Ll/uqb0;->Z:Ll/a4j;

    .line 145
    .line 146
    iget-object v10, p1, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 147
    .line 148
    invoke-virtual {v9, v10}, Ll/a4j;->L(Ljava/lang/String;)Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object v9

    .line 152
    invoke-static {v6, v9}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 153
    .line 154
    .line 155
    move-result-object v9

    .line 156
    iget-object v10, p1, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 157
    .line 158
    invoke-static {v5, v10}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 159
    .line 160
    .line 161
    move-result-object v10

    .line 162
    iget-object v11, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 163
    .line 164
    invoke-static {v4, v11}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 165
    .line 166
    .line 167
    move-result-object v11

    .line 168
    invoke-static {v3, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 169
    .line 170
    .line 171
    move-result-object v12

    .line 172
    filled-new-array {v0, v9, v10, v11, v12}, [Ll/sfj0$a;

    .line 173
    .line 174
    .line 175
    move-result-object v0

    .line 176
    invoke-static {v2, v8, v0}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 177
    .line 178
    .line 179
    :cond_0
    iget p2, p2, Lcom/p1/mobile/putong/core/data/Conversation;->localBotherStatus:I

    .line 180
    .line 181
    const/4 v0, 0x3

    .line 182
    and-int/2addr p2, v0

    .line 183
    if-ne p2, v0, :cond_1

    .line 184
    .line 185
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemPromptIntl;->j()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 186
    .line 187
    .line 188
    move-result-object p2

    .line 189
    new-instance v0, Ljava/lang/StringBuilder;

    .line 190
    .line 191
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 192
    .line 193
    .line 194
    iget-object v2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 195
    .line 196
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 197
    .line 198
    .line 199
    const-string v2, "e_chat_view_spammer_alert_report_twice_show"

    .line 200
    .line 201
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 202
    .line 203
    .line 204
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 205
    .line 206
    .line 207
    move-result-object v0

    .line 208
    invoke-interface {p2, v0}, Ll/ucq;->L(Ljava/lang/String;)Z

    .line 209
    .line 210
    .line 211
    move-result p2

    .line 212
    if-nez p2, :cond_1

    .line 213
    .line 214
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemPromptIntl;->j()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 215
    .line 216
    .line 217
    move-result-object p0

    .line 218
    new-instance p2, Ljava/lang/StringBuilder;

    .line 219
    .line 220
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 221
    .line 222
    .line 223
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 224
    .line 225
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 226
    .line 227
    .line 228
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 229
    .line 230
    .line 231
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 232
    .line 233
    .line 234
    move-result-object p2

    .line 235
    invoke-interface {p0, p2}, Ll/ucq;->J(Ljava/lang/String;)V

    .line 236
    .line 237
    .line 238
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 239
    .line 240
    .line 241
    move-result-object p0

    .line 242
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 243
    .line 244
    .line 245
    move-result-object p0

    .line 246
    invoke-static {v7, p0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 247
    .line 248
    .line 249
    move-result-object p0

    .line 250
    sget-object p2, Ll/uqb0;->Z:Ll/a4j;

    .line 251
    .line 252
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 253
    .line 254
    invoke-virtual {p2, v0}, Ll/a4j;->L(Ljava/lang/String;)Ljava/lang/String;

    .line 255
    .line 256
    .line 257
    move-result-object p2

    .line 258
    invoke-static {v6, p2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 259
    .line 260
    .line 261
    move-result-object p2

    .line 262
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 263
    .line 264
    invoke-static {v5, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 265
    .line 266
    .line 267
    move-result-object v0

    .line 268
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 269
    .line 270
    invoke-static {v4, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 271
    .line 272
    .line 273
    move-result-object p1

    .line 274
    invoke-static {v3, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 275
    .line 276
    .line 277
    move-result-object v1

    .line 278
    filled-new-array {p0, p2, v0, p1, v1}, [Ll/sfj0$a;

    .line 279
    .line 280
    .line 281
    move-result-object p0

    .line 282
    invoke-static {v2, v8, p0}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 283
    .line 284
    .line 285
    :cond_1
    return-void
.end method

.method public final n(I)V
    .locals 4

    .line 1
    and-int/lit8 v0, p1, 0x1

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-ne v0, v2, :cond_2

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPromptIntl;->b:Landroid/widget/LinearLayout;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPromptIntl;->e:Landroid/widget/LinearLayout;

    .line 13
    .line 14
    invoke-static {v0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    and-int/lit8 v0, p1, 0x2

    .line 18
    .line 19
    const/4 v3, 0x2

    .line 20
    if-ne v0, v3, :cond_1

    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPromptIntl;->f:Lv/VText;

    .line 23
    .line 24
    sget v3, Lcom/p1/mobile/putong/core/message/R$string;->r:I

    .line 25
    .line 26
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(I)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPromptIntl;->g:Landroid/widget/LinearLayout;

    .line 30
    .line 31
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 32
    .line 33
    .line 34
    and-int/lit8 v0, p1, 0x4

    .line 35
    .line 36
    const/4 v3, 0x4

    .line 37
    if-ne v0, v3, :cond_0

    .line 38
    .line 39
    const/16 v0, 0x8

    .line 40
    .line 41
    and-int/2addr p1, v0

    .line 42
    if-eq p1, v0, :cond_0

    .line 43
    .line 44
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPromptIntl;->h:Landroid/widget/LinearLayout;

    .line 45
    .line 46
    invoke-static {p1, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPromptIntl;->k:Lv/VLinear;

    .line 50
    .line 51
    invoke-static {p0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPromptIntl;->h:Landroid/widget/LinearLayout;

    .line 56
    .line 57
    invoke-static {p1, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 58
    .line 59
    .line 60
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPromptIntl;->k:Lv/VLinear;

    .line 61
    .line 62
    invoke-static {p0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPromptIntl;->g:Landroid/widget/LinearLayout;

    .line 67
    .line 68
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 69
    .line 70
    .line 71
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPromptIntl;->f:Lv/VText;

    .line 72
    .line 73
    sget p1, Lcom/p1/mobile/putong/core/message/R$string;->q:I

    .line 74
    .line 75
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPromptIntl;->g:Landroid/widget/LinearLayout;

    .line 80
    .line 81
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 82
    .line 83
    .line 84
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPromptIntl;->b:Landroid/widget/LinearLayout;

    .line 85
    .line 86
    invoke-static {p1, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 87
    .line 88
    .line 89
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPromptIntl;->e:Landroid/widget/LinearLayout;

    .line 90
    .line 91
    invoke-static {p0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method public final o(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0, p2}, Ll/qhk0;->getUserById(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    if-eqz p2, :cond_1

    .line 14
    .line 15
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    if-nez p2, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    new-instance p2, Lcom/p1/mobile/putong/data/Report;

    .line 23
    .line 24
    invoke-direct {p2}, Lcom/p1/mobile/putong/data/Report;-><init>()V

    .line 25
    .line 26
    .line 27
    sget-object v0, Lcom/p1/mobile/putong/data/Report;->CATEGORY_DEFAULT:Ljava/lang/String;

    .line 28
    .line 29
    iput-object v0, p2, Lcom/p1/mobile/putong/data/Report;->category:Ljava/lang/String;

    .line 30
    .line 31
    sget v0, Lcom/p1/mobile/putong/core/message/R$string;->P5:I

    .line 32
    .line 33
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iput-object v0, p2, Lcom/p1/mobile/putong/data/Report;->value:Ljava/lang/String;

    .line 38
    .line 39
    new-instance v0, Ljava/util/ArrayList;

    .line 40
    .line 41
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-interface {v0, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    iput-object v0, p2, Lcom/p1/mobile/putong/data/Report;->chatMessages:Ljava/util/List;

    .line 48
    .line 49
    new-instance p3, Lcom/p1/mobile/putong/data/Relationship;

    .line 50
    .line 51
    invoke-direct {p3}, Lcom/p1/mobile/putong/data/Relationship;-><init>()V

    .line 52
    .line 53
    .line 54
    const-string v0, "blocked"

    .line 55
    .line 56
    invoke-static {v0}, Lcom/p1/mobile/putong/data/RelationshipStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    iput-object v0, p3, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 61
    .line 62
    sget p3, Lcom/p1/mobile/putong/core/message/R$string;->I2:I

    .line 63
    .line 64
    const/4 v0, 0x1

    .line 65
    invoke-virtual {p1, p3, v0}, Lcom/p1/mobile/android/app/Act;->progress(IZ)Landroid/app/Dialog;

    .line 66
    .line 67
    .line 68
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 69
    .line 70
    iget-object p3, p3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 71
    .line 72
    iget-object v0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 73
    .line 74
    invoke-virtual {p3, v0, p2}, Ll/dkb;->ha(Ljava/lang/String;Lcom/p1/mobile/putong/data/Report;)Lrx/c;

    .line 75
    .line 76
    .line 77
    move-result-object p2

    .line 78
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 79
    .line 80
    iget-object p3, p3, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 81
    .line 82
    iget-object v0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 83
    .line 84
    invoke-virtual {p3, v0, p1}, Lcom/p1/mobile/putong/core/api/g;->qe(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;)Lrx/c;

    .line 85
    .line 86
    .line 87
    move-result-object p3

    .line 88
    new-instance v0, Ll/weq;

    .line 89
    .line 90
    invoke-direct {v0}, Ll/weq;-><init>()V

    .line 91
    .line 92
    .line 93
    invoke-static {p2, p3, v0}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 94
    .line 95
    .line 96
    move-result-object p2

    .line 97
    new-instance p3, Ll/xeq;

    .line 98
    .line 99
    invoke-direct {p3, p1, p0}, Ll/xeq;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V

    .line 100
    .line 101
    .line 102
    new-instance p0, Ll/yeq;

    .line 103
    .line 104
    invoke-direct {p0, p1}, Ll/yeq;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 105
    .line 106
    .line 107
    invoke-static {p3, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 112
    .line 113
    .line 114
    :cond_1
    :goto_0
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemPromptIntl;->i(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
