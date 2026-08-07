.class public Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;
.super Ll/fqe0;
.source "SourceFile"


# instance fields
.field public i:Lcom/p1/mobile/android/app/Act;

.field public j:Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatAudioBaseHeaderUserView;

.field public k:Ll/afj0;

.field public l:Ljava/lang/String;

.field public m:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;

.field public n:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

.field public o:Ll/kcg0;

.field public p:Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatAudioHeaderView$HeaderState;

.field public q:Landroid/widget/PopupWindow;

.field public r:Lcom/p1/mobile/putong/newui/main/base/TabName;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/fqe0;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->o:Ll/kcg0;

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Msg:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->r:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 10
    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->i:Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    new-instance p1, Ll/afj0;

    .line 14
    .line 15
    invoke-direct {p1}, Ll/afj0;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->k:Ll/afj0;

    .line 19
    .line 20
    return-void
.end method

.method public static synthetic B(Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;Ljava/lang/Boolean;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->R(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic C(Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->P(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic F(Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/main/base/TabName;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->O(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/main/base/TabName;)V

    return-void
.end method

.method public static synthetic H()V
    .locals 1

    .line 1
    invoke-static {}, Ll/cl80;->e()Ll/cl80;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/cl80;->s()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic I(Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->S(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic J(Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->Q()V

    return-void
.end method

.method private K(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    sget-object p0, Ll/h1c0;->INSTANCE:Ll/h1c0;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->fitReason:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/h1c0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    const-string p0, "default"

    .line 17
    .line 18
    return-object p0
.end method

.method private synthetic P(Ljava/lang/Long;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/c;->f()Lcom/p1/mobile/putong/core/ui/onlinematch/c;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/c;->h()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_1

    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->o:Ll/kcg0;

    .line 12
    .line 13
    invoke-static {p1}, Ll/bsj0;->U(Ll/kcg0;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->X()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->L()V

    .line 20
    .line 21
    .line 22
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/c;->f()Lcom/p1/mobile/putong/core/ui/onlinematch/c;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/c;->d()Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->k:Ll/afj0;

    .line 31
    .line 32
    if-nez p1, :cond_0

    .line 33
    .line 34
    invoke-virtual {v0}, Ll/afj0;->m()V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->j:Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatAudioBaseHeaderUserView;

    .line 38
    .line 39
    const-wide/16 v0, -0x1

    .line 40
    .line 41
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatAudioBaseHeaderUserView;->setBroadcastTextTimerValue(J)V

    .line 42
    .line 43
    .line 44
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/c;->f()Lcom/p1/mobile/putong/core/ui/onlinematch/c;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    const-wide/16 v0, 0x0

    .line 49
    .line 50
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/onlinematch/c;->i(J)V

    .line 51
    .line 52
    .line 53
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 54
    .line 55
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->D0:Lcom/p1/mobile/putong/core/api/v;

    .line 56
    .line 57
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/c;->f()Lcom/p1/mobile/putong/core/ui/onlinematch/c;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/c;->g()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/v;->L4(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;)Lrx/c;

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :cond_0
    invoke-virtual {v0}, Ll/afj0;->f()V

    .line 70
    .line 71
    .line 72
    :cond_1
    return-void
.end method

.method private synthetic Q()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->X()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->L()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private synthetic R(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;Ljava/lang/Boolean;Ljava/lang/String;)V
    .locals 9

    .line 1
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->X()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->L()V

    .line 11
    .line 12
    .line 13
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->k:Ll/afj0;

    .line 14
    .line 15
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result p3

    .line 19
    xor-int/lit8 p3, p3, 0x1

    .line 20
    .line 21
    invoke-virtual {p2, p3}, Ll/afj0;->e(Z)V

    .line 22
    .line 23
    .line 24
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result p2

    .line 28
    if-eqz p2, :cond_2

    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->i:Lcom/p1/mobile/android/app/Act;

    .line 31
    .line 32
    iget-object v1, p1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;->userId:Ljava/lang/String;

    .line 33
    .line 34
    const/4 v6, 0x0

    .line 35
    const/4 v7, 0x7

    .line 36
    const/4 v2, 0x0

    .line 37
    const/4 v3, 0x0

    .line 38
    const/4 v4, 0x0

    .line 39
    const/4 v5, 0x0

    .line 40
    move-object v8, p4

    .line 41
    invoke-static/range {v0 .. v8}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->q2(Landroid/content/Context;Ljava/lang/String;ZZZZLandroid/content/Intent;ILjava/lang/String;)Landroid/content/Intent;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_0
    move-object v8, p4

    .line 50
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->k:Ll/afj0;

    .line 51
    .line 52
    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 53
    .line 54
    .line 55
    move-result p3

    .line 56
    xor-int/lit8 p3, p3, 0x1

    .line 57
    .line 58
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result p4

    .line 62
    if-eqz p4, :cond_1

    .line 63
    .line 64
    iget-boolean p4, p2, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->isMaleQuickChatRing:Z

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_1
    const/4 p4, 0x0

    .line 68
    :goto_0
    invoke-direct {p0, p2}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->K(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    const-string v1, "message"

    .line 73
    .line 74
    invoke-virtual {p1, p3, p4, v0, v1}, Ll/afj0;->a(ZZLjava/lang/String;Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    if-eqz p1, :cond_2

    .line 82
    .line 83
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->z()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->i:Lcom/p1/mobile/android/app/Act;

    .line 88
    .line 89
    new-instance p4, Ll/g1c0;

    .line 90
    .line 91
    invoke-direct {p4, p0}, Ll/g1c0;-><init>(Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {p1, p3, p2, p4, v8}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->r0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;Ll/x20;Ljava/lang/String;)Z

    .line 95
    .line 96
    .line 97
    :cond_2
    return-void
.end method

.method private synthetic S(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;Ljava/lang/Boolean;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->X()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->L()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->k:Ll/afj0;

    .line 12
    .line 13
    if-nez p2, :cond_1

    .line 14
    .line 15
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    if-eqz p2, :cond_0

    .line 20
    .line 21
    iget-boolean p2, p1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->isMaleQuickChatRing:Z

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 p2, 0x0

    .line 25
    :goto_0
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->K(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    const-string v2, "message"

    .line 30
    .line 31
    invoke-virtual {v0, p2, v1, v2}, Ll/afj0;->h(ZLjava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 35
    .line 36
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->D0:Lcom/p1/mobile/putong/core/api/v;

    .line 37
    .line 38
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/core/api/v;->L4(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;)Lrx/c;

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->j:Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatAudioBaseHeaderUserView;

    .line 42
    .line 43
    const-wide/16 v0, -0x1

    .line 44
    .line 45
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatAudioBaseHeaderUserView;->setBroadcastTextTimerValue(J)V

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->k:Ll/afj0;

    .line 49
    .line 50
    invoke-virtual {p0}, Ll/afj0;->m()V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_1
    invoke-virtual {v0}, Ll/afj0;->f()V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method private T()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->i:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    const v1, 0x1020002

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, v1}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->i:Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-nez v1, :cond_0

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->i:Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    invoke-virtual {v1}, Landroid/app/Activity;->isDestroyed()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-nez v1, :cond_0

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->q:Landroid/widget/PopupWindow;

    .line 27
    .line 28
    invoke-virtual {v1}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-nez v1, :cond_0

    .line 33
    .line 34
    invoke-virtual {v0}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-eqz v1, :cond_0

    .line 43
    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->q:Landroid/widget/PopupWindow;

    .line 45
    .line 46
    sget v1, Ll/qa00;->q:I

    .line 47
    .line 48
    neg-int v1, v1

    .line 49
    const/16 v2, 0x31

    .line 50
    .line 51
    const/4 v3, 0x0

    .line 52
    invoke-virtual {p0, v0, v2, v3, v1}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    .line 53
    .line 54
    .line 55
    :cond_0
    return-void
.end method

.method private d0(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;ZLcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->j:Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatAudioBaseHeaderUserView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->j:Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatAudioBaseHeaderUserView;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatAudioBaseHeaderUserView;->init()V

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->j:Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatAudioBaseHeaderUserView;

    .line 13
    .line 14
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->i:Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    new-instance v6, Ll/e1c0;

    .line 17
    .line 18
    invoke-direct {v6, p0, p3, p1}, Ll/e1c0;-><init>(Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;)V

    .line 19
    .line 20
    .line 21
    new-instance v7, Ll/f1c0;

    .line 22
    .line 23
    invoke-direct {v7, p0, p1}, Ll/f1c0;-><init>(Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;)V

    .line 24
    .line 25
    .line 26
    move-object v3, p1

    .line 27
    move v4, p2

    .line 28
    move-object v5, p3

    .line 29
    invoke-virtual/range {v1 .. v7}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatAudioBaseHeaderUserView;->j0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;ZLcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;Ll/z20;Ll/y20;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method


# virtual methods
.method public A()I
    .locals 6

    .line 1
    iget-object v0, p0, Ll/fqe0;->d:Ll/pcj;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-interface {v0}, Ll/pcj;->call()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Ljava/lang/Boolean;

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_5

    .line 17
    .line 18
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->i:Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    if-eqz v0, :cond_5

    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    goto/16 :goto_1

    .line 29
    .line 30
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->N()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_2

    .line 35
    .line 36
    return v1

    .line 37
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->i:Lcom/p1/mobile/android/app/Act;

    .line 38
    .line 39
    invoke-static {v0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    sget v2, Ll/kec0;->qb:I

    .line 44
    .line 45
    const/4 v3, 0x0

    .line 46
    invoke-virtual {v0, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    sget v2, Ll/adc0;->P4:I

    .line 51
    .line 52
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    check-cast v2, Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatAudioBaseHeaderUserView;

    .line 57
    .line 58
    iput-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->j:Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatAudioBaseHeaderUserView;

    .line 59
    .line 60
    const-string v2, "match_success"

    .line 61
    .line 62
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->l:Ljava/lang/String;

    .line 63
    .line 64
    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result v2

    .line 68
    const/4 v4, 0x1

    .line 69
    if-eqz v2, :cond_3

    .line 70
    .line 71
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->k:Ll/afj0;

    .line 72
    .line 73
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->m:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;

    .line 74
    .line 75
    invoke-virtual {v2, v5}, Ll/afj0;->g(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;)V

    .line 76
    .line 77
    .line 78
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/c;->f()Lcom/p1/mobile/putong/core/ui/onlinematch/c;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/onlinematch/c;->j()V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->a0()V

    .line 86
    .line 87
    .line 88
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->m:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;

    .line 89
    .line 90
    invoke-direct {p0, v3, v4, v2}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->d0(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;ZLcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;)V

    .line 91
    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_3
    const-string v2, "tickets_broadcast"

    .line 95
    .line 96
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->l:Ljava/lang/String;

    .line 97
    .line 98
    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    move-result v2

    .line 102
    if-eqz v2, :cond_4

    .line 103
    .line 104
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->k:Ll/afj0;

    .line 105
    .line 106
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->n:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    .line 107
    .line 108
    invoke-virtual {v2, v5}, Ll/afj0;->j(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;)V

    .line 109
    .line 110
    .line 111
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/c;->f()Lcom/p1/mobile/putong/core/ui/onlinematch/c;

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->n:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    .line 116
    .line 117
    invoke-virtual {v2, v5, v4}, Lcom/p1/mobile/putong/core/ui/onlinematch/c;->l(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;Z)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->a0()V

    .line 121
    .line 122
    .line 123
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->n:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    .line 124
    .line 125
    invoke-direct {p0, v2, v1, v3}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->d0(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;ZLcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;)V

    .line 126
    .line 127
    .line 128
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->j:Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatAudioBaseHeaderUserView;

    .line 129
    .line 130
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->n:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    .line 131
    .line 132
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->isFemale()Z

    .line 133
    .line 134
    .line 135
    move-result v3

    .line 136
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatAudioBaseHeaderUserView;->setReceiverUserIsFemale(Z)V

    .line 137
    .line 138
    .line 139
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->j:Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatAudioBaseHeaderUserView;

    .line 140
    .line 141
    invoke-static {}, Ll/pzi0;->o()J

    .line 142
    .line 143
    .line 144
    move-result-wide v3

    .line 145
    invoke-virtual {v2, v3, v4}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatAudioBaseHeaderUserView;->setBroadcastTextTimerValue(J)V

    .line 146
    .line 147
    .line 148
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->j:Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatAudioBaseHeaderUserView;

    .line 149
    .line 150
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatAudioBaseHeaderUserView;->h0()V

    .line 151
    .line 152
    .line 153
    :cond_4
    :goto_0
    new-instance v2, Landroid/widget/PopupWindow;

    .line 154
    .line 155
    const/4 v3, -0x1

    .line 156
    const/4 v4, -0x2

    .line 157
    invoke-direct {v2, v0, v3, v4}, Landroid/widget/PopupWindow;-><init>(Landroid/view/View;II)V

    .line 158
    .line 159
    .line 160
    iput-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->q:Landroid/widget/PopupWindow;

    .line 161
    .line 162
    invoke-virtual {v2, v1}, Landroid/widget/PopupWindow;->setOutsideTouchable(Z)V

    .line 163
    .line 164
    .line 165
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->q:Landroid/widget/PopupWindow;

    .line 166
    .line 167
    sget v1, Ll/agc0;->D:I

    .line 168
    .line 169
    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setAnimationStyle(I)V

    .line 170
    .line 171
    .line 172
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->T()V

    .line 173
    .line 174
    .line 175
    const p0, 0x7fffffff

    .line 176
    .line 177
    .line 178
    return p0

    .line 179
    :cond_5
    :goto_1
    iget-object v0, p0, Ll/jlb0;->b:Ll/x20;

    .line 180
    .line 181
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 182
    .line 183
    .line 184
    move-result v0

    .line 185
    if-eqz v0, :cond_6

    .line 186
    .line 187
    iget-object p0, p0, Ll/jlb0;->b:Ll/x20;

    .line 188
    .line 189
    invoke-interface {p0}, Ll/x20;->call()V

    .line 190
    .line 191
    .line 192
    :cond_6
    return v1
.end method

.method public L()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->q:Landroid/widget/PopupWindow;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->q:Landroid/widget/PopupWindow;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->dismiss()V

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->q:Landroid/widget/PopupWindow;

    .line 16
    .line 17
    iget-object v0, p0, Ll/jlb0;->b:Ll/x20;

    .line 18
    .line 19
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    iget-object p0, p0, Ll/jlb0;->b:Ll/x20;

    .line 26
    .line 27
    invoke-interface {p0}, Ll/x20;->call()V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public M(Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/ui/poplevel/a;->p()Lcom/p1/mobile/android/ui/poplevel/a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/ui/poplevel/a;->I()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-static {}, Ll/ji30;->k()Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const/4 v1, 0x1

    .line 21
    invoke-virtual {v0, v1}, Lrx/c;->skip(I)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v1, Ll/b1c0;

    .line 30
    .line 31
    invoke-direct {v1, p0, p1}, Ll/b1c0;-><init>(Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;Lcom/p1/mobile/android/app/Act;)V

    .line 32
    .line 33
    .line 34
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public N()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->q:Landroid/widget/PopupWindow;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->q:Landroid/widget/PopupWindow;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public final synthetic O(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/main/base/TabName;)V
    .locals 2

    .line 1
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->r:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Msg:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 4
    .line 5
    if-ne p2, v0, :cond_0

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 v1, 0x0

    .line 10
    :goto_0
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->Z(Z)V

    .line 11
    .line 12
    .line 13
    if-ne p2, v0, :cond_1

    .line 14
    .line 15
    invoke-static {}, Ll/cl80;->e()Ll/cl80;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ll/cl80;->f()Ll/al80;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p2

    .line 27
    if-eqz p2, :cond_1

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/al80;->g()Ll/f3m;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    instance-of p0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;

    .line 34
    .line 35
    if-eqz p0, :cond_1

    .line 36
    .line 37
    new-instance p0, Ll/c1c0;

    .line 38
    .line 39
    invoke-direct {p0}, Ll/c1c0;-><init>()V

    .line 40
    .line 41
    .line 42
    const-wide/16 v0, 0x3e8

    .line 43
    .line 44
    invoke-static {p1, p0, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 45
    .line 46
    .line 47
    :cond_1
    return-void
.end method

.method public U(Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatAudioHeaderView$HeaderState;)Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->p:Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatAudioHeaderView$HeaderState;

    .line 2
    .line 3
    return-object p0
.end method

.method public V(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->l:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public W(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;)Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->m:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;

    .line 2
    .line 3
    return-object p0
.end method

.method public X()V
    .locals 3

    .line 1
    invoke-static {}, Ll/spl0;->R()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->o:Ll/kcg0;

    .line 9
    .line 10
    invoke-static {v0}, Ll/bsj0;->U(Ll/kcg0;)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/c;->f()Lcom/p1/mobile/putong/core/ui/onlinematch/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-wide/16 v1, 0x0

    .line 18
    .line 19
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/onlinematch/c;->i(J)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->j:Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatAudioBaseHeaderUserView;

    .line 23
    .line 24
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->j:Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatAudioBaseHeaderUserView;

    .line 31
    .line 32
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatAudioBaseHeaderUserView;->i0()V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->j:Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatAudioBaseHeaderUserView;

    .line 36
    .line 37
    const-wide/16 v0, -0x1

    .line 38
    .line 39
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatAudioBaseHeaderUserView;->setBroadcastTextTimerValue(J)V

    .line 40
    .line 41
    .line 42
    :cond_1
    :goto_0
    return-void
.end method

.method public Y(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;)Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->n:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    .line 2
    .line 3
    return-object p0
.end method

.method public Z(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->q:Landroid/widget/PopupWindow;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->T()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->q:Landroid/widget/PopupWindow;

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/widget/PopupWindow;->dismiss()V

    .line 18
    .line 19
    .line 20
    :cond_1
    return-void
.end method

.method public a0()V
    .locals 5

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/c;->f()Lcom/p1/mobile/putong/core/ui/onlinematch/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/onlinematch/c;->e()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    const-wide/16 v2, 0x0

    .line 10
    .line 11
    cmp-long v0, v0, v2

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->o:Ll/kcg0;

    .line 17
    .line 18
    invoke-static {v0}, Ll/bsj0;->U(Ll/kcg0;)V

    .line 19
    .line 20
    .line 21
    const-wide/16 v0, 0x1

    .line 22
    .line 23
    sget-object v4, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 24
    .line 25
    invoke-static {v2, v3, v0, v1, v4}, Lrx/c;->interval(JJLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    new-instance v1, Ll/d1c0;

    .line 42
    .line 43
    invoke-direct {v1, p0}, Ll/d1c0;-><init>(Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;)V

    .line 44
    .line 45
    .line 46
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->o:Ll/kcg0;

    .line 55
    .line 56
    return-void
.end method

.method public b0()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->a0()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->j:Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatAudioBaseHeaderUserView;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->j:Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatAudioBaseHeaderUserView;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatAudioBaseHeaderUserView;->getBroadcastTextTimerValue()J

    .line 15
    .line 16
    .line 17
    move-result-wide v0

    .line 18
    const-wide/16 v2, 0x0

    .line 19
    .line 20
    cmp-long v0, v0, v2

    .line 21
    .line 22
    if-lez v0, :cond_0

    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->j:Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatAudioBaseHeaderUserView;

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatAudioBaseHeaderUserView;->h0()V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public c0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->o:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bsj0;->U(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->j:Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatAudioBaseHeaderUserView;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->j:Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatAudioBaseHeaderUserView;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatAudioBaseHeaderUserView;->i0()V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public f(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->q:Landroid/widget/PopupWindow;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->q:Landroid/widget/PopupWindow;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p1, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->q:Landroid/widget/PopupWindow;

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const/high16 p1, 0x3f800000    # 1.0f

    .line 30
    .line 31
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    const/high16 v0, -0x3a860000    # -4000.0f

    .line 40
    .line 41
    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 42
    .line 43
    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->q:Landroid/widget/PopupWindow;

    .line 45
    .line 46
    invoke-virtual {p0}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 51
    .line 52
    .line 53
    :cond_1
    return-void
.end method

.method public isValid()Z
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->r:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Msg:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-eq v0, v1, :cond_0

    .line 7
    .line 8
    return v2

    .line 9
    :cond_0
    const-string v0, "match_success"

    .line 10
    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->l:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const-wide/16 v3, 0x0

    .line 18
    .line 19
    if-eqz v0, :cond_2

    .line 20
    .line 21
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/c;->f()Lcom/p1/mobile/putong/core/ui/onlinematch/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/onlinematch/c;->h()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->z()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->I:Lrx/subjects/a;

    .line 36
    .line 37
    sget-object v1, Lcom/p1/mobile/putong/core/api/v;->b0:Ll/pf60;

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/c;->f()Lcom/p1/mobile/putong/core/ui/onlinematch/c;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v0, v3, v4}, Lcom/p1/mobile/putong/core/ui/onlinematch/c;->i(J)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->X()V

    .line 50
    .line 51
    .line 52
    return v2

    .line 53
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->p:Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatAudioHeaderView$HeaderState;

    .line 54
    .line 55
    sget-object v0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatAudioHeaderView$HeaderState;->GetUserState:Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatAudioHeaderView$HeaderState;

    .line 56
    .line 57
    if-ne p0, v0, :cond_4

    .line 58
    .line 59
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->z()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->I:Lrx/subjects/a;

    .line 64
    .line 65
    sget-object v0, Lcom/p1/mobile/putong/core/api/v;->b0:Ll/pf60;

    .line 66
    .line 67
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 68
    .line 69
    .line 70
    return v2

    .line 71
    :cond_2
    const-string v0, "tickets_broadcast"

    .line 72
    .line 73
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->l:Ljava/lang/String;

    .line 74
    .line 75
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    if-eqz v0, :cond_4

    .line 80
    .line 81
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->p:Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatAudioHeaderView$HeaderState;

    .line 82
    .line 83
    sget-object v1, Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatAudioHeaderView$HeaderState;->GetUserState:Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatAudioHeaderView$HeaderState;

    .line 84
    .line 85
    if-ne v0, v1, :cond_3

    .line 86
    .line 87
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->z()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->I:Lrx/subjects/a;

    .line 92
    .line 93
    sget-object v0, Lcom/p1/mobile/putong/core/api/v;->b0:Ll/pf60;

    .line 94
    .line 95
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 96
    .line 97
    .line 98
    return v2

    .line 99
    :cond_3
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/c;->f()Lcom/p1/mobile/putong/core/ui/onlinematch/c;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/onlinematch/c;->h()Z

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    if-eqz v0, :cond_4

    .line 108
    .line 109
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->z()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->I:Lrx/subjects/a;

    .line 114
    .line 115
    sget-object v1, Lcom/p1/mobile/putong/core/api/v;->b0:Ll/pf60;

    .line 116
    .line 117
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 118
    .line 119
    .line 120
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/c;->f()Lcom/p1/mobile/putong/core/ui/onlinematch/c;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    invoke-virtual {v0, v3, v4}, Lcom/p1/mobile/putong/core/ui/onlinematch/c;->i(J)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->X()V

    .line 128
    .line 129
    .line 130
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 131
    .line 132
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->D0:Lcom/p1/mobile/putong/core/api/v;

    .line 133
    .line 134
    const/4 v0, 0x0

    .line 135
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/v;->L4(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;)Lrx/c;

    .line 136
    .line 137
    .line 138
    return v2

    .line 139
    :cond_4
    const/4 p0, 0x1

    .line 140
    return p0
.end method

.method public j()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->i:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public m()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->i:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public n(Z)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->q:Landroid/widget/PopupWindow;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/b;->q:Landroid/widget/PopupWindow;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/widget/PopupWindow;->dismiss()V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    iget-object p1, p0, Ll/fqe0;->f:Ll/z2m;

    .line 18
    .line 19
    if-eqz p1, :cond_1

    .line 20
    .line 21
    invoke-interface {p1, p0}, Ll/z2m;->a(Ll/d3m;)V

    .line 22
    .line 23
    .line 24
    :cond_1
    return-void
.end method

.method public o()Ljava/lang/String;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/bubble/MagicBubble;->QUICK_CHAT_BUBBLE:Lcom/p1/mobile/putong/core/newui/home/bubble/MagicBubble;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/bubble/MagicBubble;->getGroup()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public p()Ljava/lang/String;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/bubble/MagicBubble;->QUICK_CHAT_BUBBLE:Lcom/p1/mobile/putong/core/newui/home/bubble/MagicBubble;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/bubble/MagicBubble;->getId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
