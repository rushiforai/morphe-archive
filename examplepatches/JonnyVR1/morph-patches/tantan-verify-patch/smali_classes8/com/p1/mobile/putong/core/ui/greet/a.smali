.class public Lcom/p1/mobile/putong/core/ui/greet/a;
.super Lcom/p1/mobile/putong/core/ui/greet/c;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/core/ui/greet/c<",
        "Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;",
        ">;"
    }
.end annotation


# instance fields
.field public g:Ljava/lang/String;

.field public h:Z

.field public i:D

.field public j:Z


# direct methods
.method public constructor <init>(Ll/ner;Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/greet/c;-><init>(Ll/ner;Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/greet/a;->h:Z

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic A0(Lcom/p1/mobile/putong/core/ui/greet/a;Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/a;->g1(Lcom/p1/mobile/putong/core/data/Conversation;)V

    return-void
.end method

.method public static synthetic C0(Lcom/p1/mobile/putong/core/ui/greet/a;Ljava/lang/String;Ll/vg60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/greet/a;->f1(Ljava/lang/String;Ll/vg60;)V

    return-void
.end method

.method public static synthetic D0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic E0(Lcom/p1/mobile/putong/core/ui/greet/a;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/a;->i1(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic F0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const-string p0, "\u72b6\u6001\u5df2\u7ed3\u675f"

    .line 2
    .line 3
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic G0(Lcom/p1/mobile/putong/core/ui/greet/a;Lcom/p1/mobile/putong/core/data/Greeting;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/a;->s1(Lcom/p1/mobile/putong/core/data/Greeting;)V

    return-void
.end method

.method public static synthetic H0(Lcom/p1/mobile/putong/core/ui/greet/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/greet/a;->j1()V

    return-void
.end method

.method public static synthetic I0(Lcom/p1/mobile/putong/core/ui/greet/a;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/a;->m1(Ll/pf60;)V

    return-void
.end method

.method public static synthetic J0(Lcom/p1/mobile/putong/core/ui/greet/a;Lcom/p1/mobile/putong/core/data/Greeting;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/a;->c1(Lcom/p1/mobile/putong/core/data/Greeting;)V

    return-void
.end method

.method public static synthetic L0(Lcom/p1/mobile/putong/core/ui/greet/a;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/a;->l1(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic N0(Lcom/p1/mobile/putong/core/data/Greeting;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 6
    .line 7
    iget p1, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 8
    .line 9
    const v0, 0x9c6a

    .line 10
    .line 11
    .line 12
    if-eq p1, v0, :cond_1

    .line 13
    .line 14
    const v0, 0x9c6c

    .line 15
    .line 16
    .line 17
    if-eq p1, v0, :cond_1

    .line 18
    .line 19
    const v0, 0x9c6d

    .line 20
    .line 21
    .line 22
    if-ne p1, v0, :cond_0

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const v0, 0x9c6e

    .line 26
    .line 27
    .line 28
    if-ne p1, v0, :cond_4

    .line 29
    .line 30
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 31
    .line 32
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Greeting;->otherUser:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/api/g;->ap(Ljava/lang/String;)Lrx/c;

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_1
    :goto_0
    const-string p0, "\u5bf9\u65b9\u8d26\u53f7\u5f02\u5e38"

    .line 41
    .line 42
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_2
    instance-of p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 47
    .line 48
    if-eqz p0, :cond_4

    .line 49
    .line 50
    check-cast p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 51
    .line 52
    invoke-static {p1}, Ll/g39;->e(Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;)Z

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    if-eqz p0, :cond_3

    .line 57
    .line 58
    const-string p0, "\u5bf9\u65b9\u540c\u610f\u914d\u5bf9\u540e\u53ef\u53d1\u9001\u6d88\u606f\uff0c\u8bf7\u8010\u5fc3\u7b49\u5f85"

    .line 59
    .line 60
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :cond_3
    invoke-static {p1}, Ll/g39;->d(Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;)Z

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    if-eqz p0, :cond_4

    .line 69
    .line 70
    iget-object p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->message:Ljava/lang/String;

    .line 71
    .line 72
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    :cond_4
    return-void
.end method

.method private W0()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/a;->t1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/sak;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/sak;-><init>(Lcom/p1/mobile/putong/core/ui/greet/a;)V

    .line 14
    .line 15
    .line 16
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method private synthetic i1(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->r()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic j1()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->X()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic k0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 12
    .line 13
    const-string v0, "moment_reference"

    .line 14
    .line 15
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->moment:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-nez p0, :cond_0

    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    const/4 p0, 0x0

    .line 32
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0
.end method

.method private synthetic k1(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_1

    .line 4
    .line 5
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/greet/a;->h:Z

    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 10
    .line 11
    check-cast p1, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->g0()V

    .line 14
    .line 15
    .line 16
    :cond_0
    const/4 p1, 0x0

    .line 17
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/greet/a;->h:Z

    .line 18
    .line 19
    :cond_1
    return-void
.end method

.method public static synthetic l0(Lcom/p1/mobile/putong/core/ui/greet/a;Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/greet/a;->p1(Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;Ll/uxj0;)V

    return-void
.end method

.method private synthetic l1(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->Z0(Lcom/p1/mobile/putong/data/User;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast v0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;

    .line 11
    .line 12
    const-string v1, "greet"

    .line 13
    .line 14
    invoke-static {v1}, Lcom/p1/mobile/putong/data/CoreGiftPanelName;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/CoreGiftPanelName;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v0, p1, v1}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->q1(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/CoreGiftPanelName;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 22
    .line 23
    check-cast v0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->g0()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Greeting;->moment:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/data/IdBoxed;->id:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {v0, p1, p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->t1(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public static synthetic m0(Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 2
    .line 3
    const-string v0, "local_dynamic_greeting_agree_match"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic n0(Lcom/p1/mobile/putong/core/ui/greet/a;Ljava/lang/String;Ljava/lang/Integer;)Ljava/util/List;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/greet/a;->h1(Ljava/lang/String;Ljava/lang/Integer;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic o0(Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 8
    .line 9
    const-string v0, "fake_id_"

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public static synthetic p0(Lcom/p1/mobile/putong/core/ui/greet/a;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Greeting;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/greet/a;->r1(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Greeting;Lcom/p1/mobile/putong/core/data/Message;)V

    return-void
.end method

.method public static synthetic q0(Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->recvUserID:Ljava/lang/String;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    const-string v1, "p_kankan_chat_popup"

    .line 5
    .line 6
    invoke-static {v1, p0, v0}, Ll/vvj;->e(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 7
    .line 8
    .line 9
    invoke-static {p1}, Ll/g39;->c(Ljava/lang/Throwable;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic r0(Lcom/p1/mobile/putong/core/ui/greet/a;Ljava/lang/String;Ljava/util/List;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/greet/a;->e1(Ljava/lang/String;Ljava/util/List;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic s0(Lcom/p1/mobile/putong/core/ui/greet/a;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Greeting;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/greet/a;->q1(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Greeting;Lcom/p1/mobile/putong/core/data/Message;)V

    return-void
.end method

.method public static synthetic t0(Lcom/p1/mobile/putong/core/data/Conversation;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object v1, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/g;->uh(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 14
    .line 15
    const-string v1, "fakeReceiveLikeGuideSVip"

    .line 16
    .line 17
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 24
    .line 25
    const-string v0, "local_instant_chat_guide"

    .line 26
    .line 27
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-nez p0, :cond_0

    .line 32
    .line 33
    const/4 p0, 0x1

    .line 34
    goto :goto_0

    .line 35
    :cond_0
    const/4 p0, 0x0

    .line 36
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    return-object p0
.end method

.method public static synthetic u0(Lcom/p1/mobile/putong/core/ui/greet/a;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/a;->n1(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic x0(Lcom/p1/mobile/putong/core/ui/greet/a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/a;->o1()V

    return-void
.end method

.method public static synthetic y0(Lcom/p1/mobile/putong/core/ui/greet/a;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/a;->k1(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic z0(Lcom/p1/mobile/putong/core/ui/greet/a;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/a;->d1(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method


# virtual methods
.method public B1(Ljava/lang/String;Ljava/lang/String;)V
    .locals 9

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    const/4 v7, 0x0

    .line 18
    const/4 v8, 0x0

    .line 19
    const/4 v6, 0x0

    .line 20
    move-object v5, p1

    .line 21
    move-object v4, p2

    .line 22
    invoke-interface/range {v2 .. v8}, Ll/r97;->A5(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZZ)Landroid/content/Intent;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {v0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    sget p1, Ll/y7c0;->e:I

    .line 34
    .line 35
    const/4 p2, 0x0

    .line 36
    invoke-virtual {p0, p1, p2}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final C1()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Hj()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->getFrom()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "p_interested_user"

    .line 16
    .line 17
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 26
    .line 27
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/j;->j0:Lrx/subjects/b;

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->g0()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Greeting;->id:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {v0, p0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method public final D1()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/a;->a1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->g0()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Greeting;->id:Ljava/lang/String;

    .line 12
    .line 13
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 16
    .line 17
    iput-object v0, v1, Lcom/p1/mobile/putong/core/api/j;->k0:Ljava/lang/String;

    .line 18
    .line 19
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/j;->i0:Lrx/subjects/b;

    .line 20
    .line 21
    invoke-virtual {v1, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/a;->C1()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public E1(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->new_()Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->g0()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Greeting;->otherUser:Ljava/lang/String;

    .line 10
    .line 11
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->recvUserID:Ljava/lang/String;

    .line 12
    .line 13
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 14
    .line 15
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->giftID:Ljava/lang/String;

    .line 16
    .line 17
    const/4 v1, 0x1

    .line 18
    iput v1, v0, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->giftAmount:I

    .line 19
    .line 20
    const-string v1, "chat"

    .line 21
    .line 22
    invoke-static {v1}, Lcom/p1/mobile/putong/data/CoreGiftPanelName;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/CoreGiftPanelName;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->bizType:Ljava/lang/String;

    .line 31
    .line 32
    invoke-static {}, Lcom/p1/mobile/putong/core/data/SendGiftExtra;->new_()Lcom/p1/mobile/putong/core/data/SendGiftExtra;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->g0()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Greeting;->moment:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 41
    .line 42
    iget-object v2, v2, Lcom/p1/mobile/putong/data/IdBoxed;->id:Ljava/lang/String;

    .line 43
    .line 44
    iput-object v2, v1, Lcom/p1/mobile/putong/core/data/SendGiftExtra;->momentId:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->g0()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Greeting;->channel:Lcom/p1/mobile/putong/data/Channel;

    .line 51
    .line 52
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    iput-object v2, v1, Lcom/p1/mobile/putong/core/data/SendGiftExtra;->greetingChannel:Ljava/lang/String;

    .line 57
    .line 58
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->extra:Lcom/p1/mobile/putong/core/data/SendGiftExtra;

    .line 59
    .line 60
    const-string v1, "greet"

    .line 61
    .line 62
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/GiftSubBizType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/GiftSubBizType;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->subBizType:Lcom/p1/mobile/putong/core/data/GiftSubBizType;

    .line 67
    .line 68
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->consumeType:Ljava/lang/String;

    .line 69
    .line 70
    const-string v2, "privilege"

    .line 71
    .line 72
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result v2

    .line 76
    if-nez v2, :cond_0

    .line 77
    .line 78
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->coinSign:Ljava/lang/String;

    .line 79
    .line 80
    iput-object p1, v0, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->coinSign:Ljava/lang/String;

    .line 81
    .line 82
    :cond_0
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->consumeType:Ljava/lang/String;

    .line 83
    .line 84
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->g0()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Greeting;->otherUser:Ljava/lang/String;

    .line 89
    .line 90
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/a;->X0(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/greet/a;->F1(Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;)V

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method public final F1(Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f1:Ll/lu8;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/lu8;->k4(Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/z9k;

    .line 10
    .line 11
    invoke-direct {v1, p0, p1}, Ll/z9k;-><init>(Lcom/p1/mobile/putong/core/ui/greet/a;Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;)V

    .line 12
    .line 13
    .line 14
    new-instance p0, Ll/aak;

    .line 15
    .line 16
    invoke-direct {p0, p1}, Ll/aak;-><init>(Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public H1()V
    .locals 10

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->k1:Ll/ela;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->g0()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Greeting;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ll/ela;->t3(Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->d2()Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;->isStartHomeCard:Z

    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->getFrom()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    const-string v2, "home_card"

    .line 39
    .line 40
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    if-nez v1, :cond_2

    .line 45
    .line 46
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->getFrom()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    const-string v2, "home_moment_theme_card"

    .line 51
    .line 52
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    if-eqz v1, :cond_1

    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_1
    :goto_0
    move v3, v0

    .line 60
    goto :goto_2

    .line 61
    :cond_2
    :goto_1
    const/4 v0, 0x1

    .line 62
    goto :goto_0

    .line 63
    :goto_2
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/a;->S0()Lcom/p1/mobile/putong/data/User;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->g0()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    iget-object v4, p0, Lcom/p1/mobile/putong/core/data/Greeting;->id:Ljava/lang/String;

    .line 76
    .line 77
    const-string p0, "greet"

    .line 78
    .line 79
    invoke-static {p0}, Lcom/p1/mobile/putong/data/LikeFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LikeFrom;

    .line 80
    .line 81
    .line 82
    move-result-object v5

    .line 83
    const/4 p0, 0x2

    .line 84
    new-array v9, p0, [Z

    .line 85
    .line 86
    fill-array-data v9, :array_0

    .line 87
    .line 88
    .line 89
    const/4 v6, 0x0

    .line 90
    const/4 v7, 0x0

    .line 91
    const/4 v8, 0x0

    .line 92
    invoke-static/range {v1 .. v9}, Ll/j1a;->z(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;Lcom/p1/mobile/putong/data/LikeFrom;Ll/y20;Ll/y20;Ljava/lang/String;[Z)V

    .line 93
    .line 94
    .line 95
    return-void

    .line 96
    nop

    .line 97
    :array_0
    .array-data 1
        0x0t
        0x0t
    .end array-data
.end method

.method public final I1(Lcom/p1/mobile/putong/core/data/Greeting;Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;)V
    .locals 8

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object v2, v1, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 8
    .line 9
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/Greeting;->id:Ljava/lang/String;

    .line 10
    .line 11
    iget-object v4, p1, Lcom/p1/mobile/putong/core/data/Greeting;->channel:Lcom/p1/mobile/putong/data/Channel;

    .line 12
    .line 13
    const/4 v7, 0x0

    .line 14
    move-object v5, p2

    .line 15
    move-object v6, p3

    .line 16
    invoke-virtual/range {v2 .. v7}, Lcom/p1/mobile/putong/core/api/j;->u6(Ljava/lang/String;Lcom/p1/mobile/putong/data/Channel;Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;Ll/x20;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    const/4 p3, 0x1

    .line 21
    invoke-virtual {p2, p3}, Lrx/c;->take(I)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    new-instance p3, Ll/iak;

    .line 26
    .line 27
    invoke-direct {p3, p0, v5, p1}, Ll/iak;-><init>(Lcom/p1/mobile/putong/core/ui/greet/a;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Greeting;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p2, p3}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    invoke-virtual {v0, p2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    new-instance p3, Ll/jak;

    .line 39
    .line 40
    invoke-direct {p3, p0, v5, p1}, Ll/jak;-><init>(Lcom/p1/mobile/putong/core/ui/greet/a;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Greeting;)V

    .line 41
    .line 42
    .line 43
    new-instance p0, Ll/kak;

    .line 44
    .line 45
    invoke-direct {p0, p1}, Ll/kak;-><init>(Lcom/p1/mobile/putong/core/data/Greeting;)V

    .line 46
    .line 47
    .line 48
    invoke-static {p3, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public J1(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->x:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->f:Z

    .line 9
    .line 10
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 17
    .line 18
    check-cast v0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;

    .line 19
    .line 20
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->x:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->getFrom()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v5

    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->g0()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-object v6, v0, Lcom/p1/mobile/putong/core/data/Greeting;->otherUser:Ljava/lang/String;

    .line 31
    .line 32
    const-string v3, ""

    .line 33
    .line 34
    const-string v4, "p_kankan_chat_popup"

    .line 35
    .line 36
    invoke-interface/range {v1 .. v6}, Ll/r97;->h4(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 40
    .line 41
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 42
    .line 43
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-eqz v1, :cond_1

    .line 52
    .line 53
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isJailed()Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-eqz v1, :cond_0

    .line 58
    .line 59
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-interface {p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->startJailedDialogLikeAct()V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_0
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isNameFake()Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-eqz v0, :cond_1

    .line 72
    .line 73
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    invoke-interface {p1, p0}, Ll/r97;->A(Lcom/p1/mobile/android/app/Act;)V

    .line 86
    .line 87
    .line 88
    return-void

    .line 89
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->g0()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Greeting;->moment:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 94
    .line 95
    iget-object v0, v0, Lcom/p1/mobile/putong/data/IdBoxed;->id:Ljava/lang/String;

    .line 96
    .line 97
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    if-nez v0, :cond_4

    .line 102
    .line 103
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/a;->g:Ljava/lang/String;

    .line 104
    .line 105
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    if-eqz v0, :cond_3

    .line 110
    .line 111
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->g0()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Greeting;->actorUserId:Ljava/lang/String;

    .line 116
    .line 117
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v1

    .line 125
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    if-nez v0, :cond_2

    .line 130
    .line 131
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/a;->g:Ljava/lang/String;

    .line 140
    .line 141
    goto :goto_0

    .line 142
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->g0()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Greeting;->otherUser:Ljava/lang/String;

    .line 147
    .line 148
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/a;->g:Ljava/lang/String;

    .line 149
    .line 150
    :cond_3
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 151
    .line 152
    const-string v1, "?source=moment&moment_id="

    .line 153
    .line 154
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 155
    .line 156
    .line 157
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->g0()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 158
    .line 159
    .line 160
    move-result-object v1

    .line 161
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Greeting;->moment:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 162
    .line 163
    iget-object v1, v1, Lcom/p1/mobile/putong/data/IdBoxed;->id:Ljava/lang/String;

    .line 164
    .line 165
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    const-string v1, "&moment_owner_id="

    .line 169
    .line 170
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 171
    .line 172
    .line 173
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/greet/a;->g:Ljava/lang/String;

    .line 174
    .line 175
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 176
    .line 177
    .line 178
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    goto :goto_1

    .line 183
    :cond_4
    const-string v0, ""

    .line 184
    .line 185
    :goto_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->g0()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 186
    .line 187
    .line 188
    move-result-object v1

    .line 189
    invoke-virtual {p0, v1, p1, v0}, Lcom/p1/mobile/putong/core/ui/greet/a;->I1(Lcom/p1/mobile/putong/core/data/Greeting;Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;)V

    .line 190
    .line 191
    .line 192
    return-void
.end method

.method public final L1()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->g0()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Greeting;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->g0()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Greeting;->readUntil:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/api/j;->A6(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    new-instance v1, Ll/y9k;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Ll/y9k;-><init>(Lcom/p1/mobile/putong/core/ui/greet/a;)V

    .line 28
    .line 29
    .line 30
    new-instance p0, Ll/fjf0;

    .line 31
    .line 32
    invoke-direct {p0}, Ll/fjf0;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public N1()Z
    .locals 2

    .line 1
    const-string v0, "from_anonymous_profile"

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->getFrom()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->g0()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->g0()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Greeting;->channel:Lcom/p1/mobile/putong/data/Channel;

    .line 28
    .line 29
    const-string v0, "anonymous"

    .line 30
    .line 31
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-eqz p0, :cond_0

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    const/4 p0, 0x0

    .line 39
    return p0

    .line 40
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 41
    return p0
.end method

.method public final O0(Ljava/util/List;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    new-instance v0, Ll/bak;

    .line 13
    .line 14
    invoke-direct {v0}, Ll/bak;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-static {p1, v0}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    return-object p1

    .line 24
    :cond_0
    return-object p0
.end method

.method public final O1()V
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 4
    .line 5
    const-string v1, "pending"

    .line 6
    .line 7
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/NotificationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    const-string v2, "removed"

    .line 12
    .line 13
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/NotificationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->g0()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 18
    .line 19
    .line 20
    move-result-object v4

    .line 21
    iget-object v4, v4, Lcom/p1/mobile/putong/core/data/Greeting;->id:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v0, v1, v3, v4}, Lcom/p1/mobile/putong/core/api/j;->N6(Lcom/p1/mobile/putong/core/data/NotificationStatus;Lcom/p1/mobile/putong/core/data/NotificationStatus;Ljava/lang/String;)Lrx/c;

    .line 24
    .line 25
    .line 26
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 27
    .line 28
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 29
    .line 30
    const-string v1, "ongoing"

    .line 31
    .line 32
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/NotificationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/NotificationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->g0()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/Greeting;->id:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {v0, v1, v2, v3}, Lcom/p1/mobile/putong/core/api/j;->N6(Lcom/p1/mobile/putong/core/data/NotificationStatus;Lcom/p1/mobile/putong/core/data/NotificationStatus;Ljava/lang/String;)Lrx/c;

    .line 47
    .line 48
    .line 49
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-interface {v0}, Ll/r97;->t3()Ljava/util/Collection;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    if-eqz v1, :cond_1

    .line 70
    .line 71
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    check-cast v1, Ljava/lang/Integer;

    .line 76
    .line 77
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    invoke-static {v1}, Ll/u17;->v(I)Z

    .line 82
    .line 83
    .line 84
    move-result v2

    .line 85
    if-eqz v2, :cond_0

    .line 86
    .line 87
    add-int/lit16 v2, v1, -0x2710

    .line 88
    .line 89
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->g0()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 94
    .line 95
    .line 96
    move-result-object v3

    .line 97
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/Greeting;->id:Ljava/lang/String;

    .line 98
    .line 99
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 100
    .line 101
    .line 102
    move-result v2

    .line 103
    if-eqz v2, :cond_0

    .line 104
    .line 105
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    invoke-virtual {p0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    invoke-interface {p0, v1}, Ll/r97;->c3(I)V

    .line 114
    .line 115
    .line 116
    :cond_1
    return-void
.end method

.method public P0()J
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->g0()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const-wide/16 v1, 0x0

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    :try_start_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->g0()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Greeting;->clearedUntil:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {p0}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 24
    .line 25
    .line 26
    move-result-wide v0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 27
    return-wide v0

    .line 28
    :catch_0
    :cond_0
    return-wide v1
.end method

.method public Q0()D
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/ui/greet/a;->i:D

    .line 2
    .line 3
    return-wide v0
.end method

.method public R0()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->g0()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->g0()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Greeting;->id:Ljava/lang/String;

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_0
    const-string p0, ""

    .line 19
    .line 20
    return-object p0
.end method

.method public S0()Lcom/p1/mobile/putong/data/User;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->g0()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Greeting;->otherUser:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final U0(Ljava/util/List;Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;",
            "Lcom/p1/mobile/putong/data/User;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    if-nez p2, :cond_0

    .line 3
    .line 4
    return-object p0

    .line 5
    :cond_0
    new-instance v0, Ll/eak;

    .line 6
    .line 7
    invoke-direct {v0, p2}, Ll/eak;-><init>(Lcom/p1/mobile/putong/data/User;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p1, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    check-cast p1, Lcom/p1/mobile/putong/core/data/Message;

    .line 15
    .line 16
    if-nez p1, :cond_1

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->moment:Ljava/lang/String;

    .line 20
    .line 21
    return-object p0
.end method

.method public final V0()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/j;->p0:Lrx/subjects/b;

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/rak;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/rak;-><init>(Lcom/p1/mobile/putong/core/ui/greet/a;)V

    .line 14
    .line 15
    .line 16
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final X0(Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->h0()Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;->hasCreatedGreeting:Z

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 17
    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 19
    .line 20
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/api/j;->E6(Ljava/lang/String;)Lrx/c;

    .line 21
    .line 22
    .line 23
    :cond_1
    const/4 v0, 0x0

    .line 24
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-static {v0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-static {}, Lrx/schedulers/Schedulers;->io()Ll/f2e0;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    new-instance v1, Ll/t9k;

    .line 41
    .line 42
    invoke-direct {v1, p0, p1}, Ll/t9k;-><init>(Lcom/p1/mobile/putong/core/ui/greet/a;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    new-instance v1, Ll/u9k;

    .line 50
    .line 51
    invoke-direct {v1, p0, p1}, Ll/u9k;-><init>(Lcom/p1/mobile/putong/core/ui/greet/a;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 59
    .line 60
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 61
    .line 62
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/core/api/g;->uh(Ljava/lang/String;)Z

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    if-eqz v1, :cond_2

    .line 67
    .line 68
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 69
    .line 70
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 71
    .line 72
    const-wide/16 v1, 0x0

    .line 73
    .line 74
    invoke-virtual {v0, p1, v1, v2}, Lcom/p1/mobile/putong/core/api/g;->Un(Ljava/lang/String;D)Lrx/c;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    :cond_2
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    new-instance v1, Ll/v9k;

    .line 91
    .line 92
    invoke-direct {v1, p0, p1}, Ll/v9k;-><init>(Lcom/p1/mobile/putong/core/ui/greet/a;Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 100
    .line 101
    .line 102
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 103
    .line 104
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 105
    .line 106
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/api/g;->Ne(Ljava/lang/String;)Lrx/c;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    new-instance v0, Ll/w9k;

    .line 111
    .line 112
    invoke-direct {v0}, Ll/w9k;-><init>()V

    .line 113
    .line 114
    .line 115
    invoke-virtual {p1, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    const/4 v0, 0x1

    .line 124
    invoke-virtual {p1, v0}, Lrx/c;->take(I)Lrx/c;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    new-instance v0, Ll/x9k;

    .line 129
    .line 130
    invoke-direct {v0, p0}, Ll/x9k;-><init>(Lcom/p1/mobile/putong/core/ui/greet/a;)V

    .line 131
    .line 132
    .line 133
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 138
    .line 139
    .line 140
    return-void
.end method

.method public Y0()Z
    .locals 2

    .line 1
    const-string v0, "from_anonymous_profile"

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->getFrom()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->g0()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->g0()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Greeting;->channel:Lcom/p1/mobile/putong/data/Channel;

    .line 28
    .line 29
    const-string v0, "anonymous"

    .line 30
    .line 31
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-eqz p0, :cond_0

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    const/4 p0, 0x0

    .line 39
    return p0

    .line 40
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 41
    return p0
.end method

.method public Z()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->Z()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public a0()V
    .locals 4

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->a0()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/s9k;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/s9k;-><init>(Lcom/p1/mobile/putong/core/ui/greet/a;)V

    .line 7
    .line 8
    .line 9
    new-instance v1, Ll/dak;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/dak;-><init>(Lcom/p1/mobile/putong/core/ui/greet/a;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0, v1}, Ll/ar2;->creates(Ll/y20;Ll/x20;)V

    .line 15
    .line 16
    .line 17
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/greet/a;->W0()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/lak;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/lak;-><init>(Lcom/p1/mobile/putong/core/ui/greet/a;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->g0()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Greeting;->id:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/greet/a;->X0(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 46
    .line 47
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->g0()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Greeting;->otherUser:Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    new-instance v1, Ll/td;

    .line 64
    .line 65
    invoke-direct {v1}, Ll/td;-><init>()V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    const/4 v1, 0x1

    .line 73
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    new-instance v2, Ll/mak;

    .line 78
    .line 79
    invoke-direct {v2, p0}, Ll/mak;-><init>(Lcom/p1/mobile/putong/core/ui/greet/a;)V

    .line 80
    .line 81
    .line 82
    new-instance v3, Ll/nak;

    .line 83
    .line 84
    invoke-direct {v3}, Ll/nak;-><init>()V

    .line 85
    .line 86
    .line 87
    invoke-static {v2, v3}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 92
    .line 93
    .line 94
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 95
    .line 96
    check-cast v0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;

    .line 97
    .line 98
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->x:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 99
    .line 100
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->d2()Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;->stateId:Ljava/lang/String;

    .line 105
    .line 106
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    if-nez v0, :cond_0

    .line 111
    .line 112
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    iget-object v2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 117
    .line 118
    check-cast v2, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;

    .line 119
    .line 120
    iget-object v2, v2, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->x:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 121
    .line 122
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->d2()Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;

    .line 123
    .line 124
    .line 125
    move-result-object v2

    .line 126
    iget-object v2, v2, Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;->stateId:Ljava/lang/String;

    .line 127
    .line 128
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->g0()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 129
    .line 130
    .line 131
    move-result-object v3

    .line 132
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/Greeting;->otherUser:Ljava/lang/String;

    .line 133
    .line 134
    invoke-interface {v0, v2, v3}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->l8(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 139
    .line 140
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 141
    .line 142
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->g0()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 143
    .line 144
    .line 145
    move-result-object v3

    .line 146
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/Greeting;->otherUser:Ljava/lang/String;

    .line 147
    .line 148
    invoke-virtual {v2, v3}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 149
    .line 150
    .line 151
    move-result-object v2

    .line 152
    new-instance v3, Ll/oak;

    .line 153
    .line 154
    invoke-direct {v3}, Ll/oak;-><init>()V

    .line 155
    .line 156
    .line 157
    invoke-static {v0, v2, v3}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 166
    .line 167
    .line 168
    move-result-object v0

    .line 169
    new-instance v1, Ll/pak;

    .line 170
    .line 171
    invoke-direct {v1, p0}, Ll/pak;-><init>(Lcom/p1/mobile/putong/core/ui/greet/a;)V

    .line 172
    .line 173
    .line 174
    new-instance v2, Ll/qak;

    .line 175
    .line 176
    invoke-direct {v2}, Ll/qak;-><init>()V

    .line 177
    .line 178
    .line 179
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 180
    .line 181
    .line 182
    move-result-object v1

    .line 183
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 184
    .line 185
    .line 186
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/a;->O1()V

    .line 187
    .line 188
    .line 189
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/a;->V0()V

    .line 190
    .line 191
    .line 192
    return-void
.end method

.method public a1()Z
    .locals 2

    .line 1
    const-string v0, "card"

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->getFrom()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    const-string v0, "from_city_centre_card"

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->getFrom()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    const-string v0, "home_card"

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->getFrom()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_1

    .line 36
    .line 37
    const-string v0, "home_moment_theme_card"

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->getFrom()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-nez v0, :cond_1

    .line 48
    .line 49
    const-string v0, "p_poi_nearby_card"

    .line 50
    .line 51
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->getFrom()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    if-eqz p0, :cond_0

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_0
    const/4 p0, 0x0

    .line 63
    return p0

    .line 64
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 65
    return p0
.end method

.method public final b1(Ljava/util/List;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;)Z"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/greet/a;->j:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->g0()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->g0()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Greeting;->actorUserId:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-nez p0, :cond_1

    .line 36
    .line 37
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-nez p0, :cond_1

    .line 42
    .line 43
    new-instance p0, Ll/cak;

    .line 44
    .line 45
    invoke-direct {p0}, Ll/cak;-><init>()V

    .line 46
    .line 47
    .line 48
    invoke-static {p1, p0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    check-cast p0, Lcom/p1/mobile/putong/core/data/Message;

    .line 53
    .line 54
    if-nez p0, :cond_1

    .line 55
    .line 56
    const/4 p0, 0x1

    .line 57
    return p0

    .line 58
    :cond_1
    return v1
.end method

.method public final synthetic c1(Lcom/p1/mobile/putong/core/data/Greeting;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Greeting;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->g0()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Greeting;->id:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/c;->a:Lrx/subjects/a;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public final synthetic d1(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->m:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 6
    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->Z()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public final synthetic e1(Ljava/lang/String;Ljava/util/List;)Lrx/c;
    .locals 10

    .line 1
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-wide/16 v0, 0x0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 v0, 0x0

    .line 11
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    check-cast p2, Lcom/p1/mobile/putong/core/data/Message;

    .line 16
    .line 17
    iget-wide v0, p2, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 18
    .line 19
    :goto_0
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/ui/greet/a;->i:D

    .line 20
    .line 21
    :try_start_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->g0()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Greeting;->clearedUntil:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {p2}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    .line 32
    .line 33
    .line 34
    move-result-wide v0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 35
    :goto_1
    move-wide v6, v0

    .line 36
    goto :goto_2

    .line 37
    :catch_0
    const-wide/16 v0, 0x0

    .line 38
    .line 39
    goto :goto_1

    .line 40
    :goto_2
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 41
    .line 42
    iget-object v2, p2, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 43
    .line 44
    iget-wide v4, p0, Lcom/p1/mobile/putong/core/ui/greet/a;->i:D

    .line 45
    .line 46
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/a;->Y0()Z

    .line 47
    .line 48
    .line 49
    move-result v8

    .line 50
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->h0()Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    iget-boolean v9, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;->hasCreatedGreeting:Z

    .line 55
    .line 56
    move-object v3, p1

    .line 57
    invoke-virtual/range {v2 .. v9}, Lcom/p1/mobile/putong/core/api/j;->A5(Ljava/lang/String;DJZZ)Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    return-object p0
.end method

.method public f0()Ljava/lang/String;
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    check-cast v0, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->d2()Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;->stateId:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    const-string p0, "state"

    .line 23
    .line 24
    return-object p0

    .line 25
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->getFrom()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const-string v1, "from_h5_suggest_user"

    .line 30
    .line 31
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    const-string p0, "specialguest"

    .line 38
    .line 39
    return-object p0

    .line 40
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/a;->Y0()Z

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    if-eqz p0, :cond_2

    .line 45
    .line 46
    const-string p0, "anonymous"

    .line 47
    .line 48
    return-object p0

    .line 49
    :cond_2
    const-string p0, "moment"

    .line 50
    .line 51
    return-object p0
.end method

.method public final synthetic f1(Ljava/lang/String;Ll/vg60;)V
    .locals 4

    .line 1
    iget-object p2, p2, Ll/vg60;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/greet/a;->O0(Ljava/util/List;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 16
    .line 17
    check-cast v1, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;

    .line 18
    .line 19
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->A:Ll/tul;

    .line 20
    .line 21
    invoke-virtual {p0, p2, v0}, Lcom/p1/mobile/putong/core/ui/greet/a;->U0(Ljava/util/List;Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-interface {v1, v2}, Ll/tul;->setMomentId(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->O8()Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-eqz v1, :cond_0

    .line 41
    .line 42
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-eqz v1, :cond_0

    .line 47
    .line 48
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_0

    .line 53
    .line 54
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/greet/a;->b1(Ljava/util/List;)Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-eqz v0, :cond_0

    .line 59
    .line 60
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 61
    .line 62
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 63
    .line 64
    const-string v1, "local_dynamic_greeting_agree_match"

    .line 65
    .line 66
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    invoke-virtual {v0, p1, v1}, Lcom/p1/mobile/putong/core/api/j;->G5(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/MessageType;)Lrx/c;

    .line 71
    .line 72
    .line 73
    const/4 p1, 0x1

    .line 74
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/greet/a;->j:Z

    .line 75
    .line 76
    :cond_0
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    const/4 v0, 0x0

    .line 81
    if-nez p1, :cond_1

    .line 82
    .line 83
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    check-cast p1, Lcom/p1/mobile/putong/core/data/Message;

    .line 88
    .line 89
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 90
    .line 91
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->g0()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Greeting;->otherUser:Ljava/lang/String;

    .line 96
    .line 97
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 98
    .line 99
    .line 100
    move-result p1

    .line 101
    if-eqz p1, :cond_1

    .line 102
    .line 103
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->g0()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Greeting;->readUntil:Ljava/lang/String;

    .line 108
    .line 109
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    check-cast v1, Lcom/p1/mobile/putong/core/data/Message;

    .line 114
    .line 115
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 116
    .line 117
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 118
    .line 119
    .line 120
    move-result p1

    .line 121
    if-nez p1, :cond_1

    .line 122
    .line 123
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/a;->L1()V

    .line 124
    .line 125
    .line 126
    :cond_1
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 127
    .line 128
    .line 129
    move-result p1

    .line 130
    if-nez p1, :cond_2

    .line 131
    .line 132
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 133
    .line 134
    .line 135
    move-result-object p1

    .line 136
    check-cast p1, Lcom/p1/mobile/putong/core/data/Message;

    .line 137
    .line 138
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/Message;->localCreatedTime:J

    .line 139
    .line 140
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 141
    .line 142
    .line 143
    move-result-wide v2

    .line 144
    sub-long/2addr v0, v2

    .line 145
    const-wide/32 v2, 0x3b9aca00

    .line 146
    .line 147
    .line 148
    cmp-long p1, v0, v2

    .line 149
    .line 150
    if-gez p1, :cond_2

    .line 151
    .line 152
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 153
    .line 154
    check-cast p1, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;

    .line 155
    .line 156
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->T0()V

    .line 157
    .line 158
    .line 159
    :cond_2
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 160
    .line 161
    check-cast p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;

    .line 162
    .line 163
    invoke-static {p2}, Lcom/google/common/collect/Lists;->q(Ljava/util/List;)Ljava/util/List;

    .line 164
    .line 165
    .line 166
    move-result-object p1

    .line 167
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->Y0(Ljava/util/List;)V

    .line 168
    .line 169
    .line 170
    return-void
.end method

.method public final synthetic g1(Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/wi5;->d()Ll/wi5;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/wi5;->e()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/a;->D1()V

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/a;->C1()V

    .line 16
    .line 17
    .line 18
    :goto_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/j;->J6()Lrx/c;

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 34
    .line 35
    const/4 v2, 0x0

    .line 36
    invoke-static {v1, p1, v2, v2}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->k2(Landroid/content/Context;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {v0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public final synthetic h1(Ljava/lang/String;Ljava/lang/Integer;)Ljava/util/List;
    .locals 0

    .line 1
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 2
    .line 3
    iget-object p2, p2, Ll/il8;->c:Ll/t600;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->g0()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Greeting;->clearedUntil:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p2, p1, p0}, Ll/t600;->O(Ljava/lang/String;Ljava/lang/String;)Ll/wzh0$a;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/wzh0$a;->j()Ljava/util/List;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public i0()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->i0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic m1(Ll/pf60;)V
    .locals 4

    .line 1
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/data/Envelope;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Envelope;->data:Lcom/p1/mobile/putong/data/Data;

    .line 6
    .line 7
    const-class v1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/Data;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreData;->states:Ljava/util/List;

    .line 16
    .line 17
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-nez v1, :cond_0

    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    if-eqz v2, :cond_0

    .line 33
    .line 34
    iget-object v2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 35
    .line 36
    check-cast v2, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;

    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->g0()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/Greeting;->otherUser:Ljava/lang/String;

    .line 43
    .line 44
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    check-cast v0, Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 49
    .line 50
    invoke-virtual {v2, v3, v0}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->u1(Ljava/lang/String;Lcom/p1/mobile/putong/data/BubbleInfo;)V

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_0
    const-string v0, "\u72b6\u6001\u5df2\u7ed3\u675f"

    .line 55
    .line 56
    invoke-static {v0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    :goto_0
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 60
    .line 61
    move-object v1, v0

    .line 62
    check-cast v1, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;

    .line 63
    .line 64
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 65
    .line 66
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    .line 67
    .line 68
    check-cast v0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;

    .line 69
    .line 70
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->x:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 71
    .line 72
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->d2()Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;->recommendReason:Ljava/lang/String;

    .line 77
    .line 78
    invoke-virtual {v1, p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->v1(Lcom/p1/mobile/putong/core/ui/greet/a;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public final synthetic n1(Ll/uxj0;)V
    .locals 2

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->g0()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Greeting;->id:Ljava/lang/String;

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-virtual {p1, p0, v0, v1}, Lcom/p1/mobile/putong/core/api/j;->F6(Ljava/lang/String;ZZ)Lrx/c;

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic o1()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->d1()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic p1(Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;Ll/uxj0;)V
    .locals 5

    .line 1
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->recvUserID:Ljava/lang/String;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    const-string v1, "p_kankan_chat_popup"

    .line 5
    .line 6
    invoke-static {v1, p2, v0}, Ll/vvj;->e(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->getFrom()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    const-string v0, "from_meet_liked"

    .line 14
    .line 15
    invoke-static {p2, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    const-string v0, "chat_gift_id"

    .line 20
    .line 21
    const-string v1, "showfrom_meet_sayhi"

    .line 22
    .line 23
    const-string v2, "p_meet"

    .line 24
    .line 25
    const-string v3, "e_chat_gift_bar_gift_send"

    .line 26
    .line 27
    if-eqz p2, :cond_0

    .line 28
    .line 29
    const-string p2, "I_like_say_hi"

    .line 30
    .line 31
    invoke-static {v1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->giftID:Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    filled-new-array {p2, p1}, [Ll/pf60;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-static {v3, v2, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->getFrom()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p2

    .line 53
    const-string v4, "from_meet_picks"

    .line 54
    .line 55
    invoke-static {p2, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 56
    .line 57
    .line 58
    move-result p2

    .line 59
    if-eqz p2, :cond_1

    .line 60
    .line 61
    const-string p2, "picks_say_hi"

    .line 62
    .line 63
    invoke-static {v1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 64
    .line 65
    .line 66
    move-result-object p2

    .line 67
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->giftID:Ljava/lang/String;

    .line 68
    .line 69
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    filled-new-array {p2, p1}, [Ll/pf60;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    invoke-static {v3, v2, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 78
    .line 79
    .line 80
    :cond_1
    :goto_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    move-result p1

    .line 88
    if-eqz p1, :cond_2

    .line 89
    .line 90
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 91
    .line 92
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    move-result p1

    .line 96
    if-eqz p1, :cond_2

    .line 97
    .line 98
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 99
    .line 100
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 101
    .line 102
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->g0()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 103
    .line 104
    .line 105
    move-result-object p2

    .line 106
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Greeting;->id:Ljava/lang/String;

    .line 107
    .line 108
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/api/j;->E6(Ljava/lang/String;)Lrx/c;

    .line 109
    .line 110
    .line 111
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    new-instance p2, Ll/hak;

    .line 116
    .line 117
    invoke-direct {p2, p0}, Ll/hak;-><init>(Lcom/p1/mobile/putong/core/ui/greet/a;)V

    .line 118
    .line 119
    .line 120
    const-wide/16 v0, 0x64

    .line 121
    .line 122
    invoke-static {p1, p2, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 123
    .line 124
    .line 125
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/a;->D1()V

    .line 126
    .line 127
    .line 128
    return-void
.end method

.method public final synthetic q1(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Greeting;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 1

    .line 1
    const-string p3, "coin"

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->consumeType:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p3

    .line 9
    if-eqz p3, :cond_0

    .line 10
    .line 11
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 14
    .line 15
    invoke-virtual {p1}, Ll/lqb;->k5()Lrx/c;

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const-string p3, "privilege"

    .line 20
    .line 21
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->consumeType:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {p3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eqz p1, :cond_1

    .line 28
    .line 29
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 30
    .line 31
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 32
    .line 33
    invoke-virtual {p1}, Ll/joa;->v4()Lrx/c;

    .line 34
    .line 35
    .line 36
    :cond_1
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-interface {p1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->so()Z

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    if-eqz p1, :cond_2

    .line 45
    .line 46
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-interface {p1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Gm()Ljava/util/List;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Greeting;->id:Ljava/lang/String;

    .line 55
    .line 56
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/a;->H1()V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/a;->D1()V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public final synthetic r1(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Greeting;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 1

    .line 1
    const-string p3, "coin"

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->consumeType:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p3

    .line 9
    if-eqz p3, :cond_0

    .line 10
    .line 11
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 14
    .line 15
    invoke-virtual {p1}, Ll/lqb;->k5()Lrx/c;

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const-string p3, "privilege"

    .line 20
    .line 21
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->consumeType:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {p3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eqz p1, :cond_1

    .line 28
    .line 29
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 30
    .line 31
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 32
    .line 33
    invoke-virtual {p1}, Ll/joa;->v4()Lrx/c;

    .line 34
    .line 35
    .line 36
    :cond_1
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-interface {p1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->so()Z

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    if-eqz p1, :cond_2

    .line 45
    .line 46
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-interface {p1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Gm()Ljava/util/List;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Greeting;->id:Ljava/lang/String;

    .line 55
    .line 56
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/a;->H1()V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/a;->D1()V

    .line 63
    .line 64
    .line 65
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 66
    .line 67
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 68
    .line 69
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/j;->J6()Lrx/c;

    .line 70
    .line 71
    .line 72
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 73
    .line 74
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->h2:Ll/no7;

    .line 75
    .line 76
    invoke-virtual {p1}, Ll/no7;->T3()V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->getFrom()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    const-string p1, "from_surprise_box"

    .line 84
    .line 85
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 86
    .line 87
    .line 88
    move-result p0

    .line 89
    if-eqz p0, :cond_3

    .line 90
    .line 91
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-virtual {p0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Sh()V

    .line 100
    .line 101
    .line 102
    :cond_3
    return-void
.end method

.method public final synthetic s1(Lcom/p1/mobile/putong/core/data/Greeting;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/a;->Y0()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/j;->o0:Lrx/subjects/b;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/j;->n0:Lrx/subjects/b;

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public t1()Z
    .locals 1

    .line 1
    sget p0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v0, 0x1a

    .line 4
    .line 5
    if-eq p0, v0, :cond_0

    .line 6
    .line 7
    const/16 v0, 0x1c

    .line 8
    .line 9
    if-ne p0, v0, :cond_1

    .line 10
    .line 11
    :cond_0
    sget-object p0, Landroid/os/Build;->BRAND:Ljava/lang/String;

    .line 12
    .line 13
    const-string v0, "HONOR"

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_2

    .line 20
    .line 21
    const-string v0, "HUAWEI"

    .line 22
    .line 23
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-eqz p0, :cond_1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    const/4 p0, 0x0

    .line 31
    return p0

    .line 32
    :cond_2
    :goto_0
    const/4 p0, 0x1

    .line 33
    return p0
.end method

.method public u1(IILandroid/content/Intent;)Z
    .locals 1

    .line 1
    const/16 p3, 0x10

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-ne p1, p3, :cond_1

    .line 5
    .line 6
    const/4 p1, -0x1

    .line 7
    if-ne p2, p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0, v0, v0}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 21
    .line 22
    .line 23
    :cond_0
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_1
    return v0
.end method

.method public v1(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 1

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
    invoke-interface {v0, p1}, Ll/r97;->K2(Lcom/p1/mobile/putong/core/data/Message;)Lcom/p1/mobile/putong/core/data/ChatGiftInfoExtra;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGiftInfoExtra;->giftRecordId:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_0

    .line 26
    .line 27
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f1:Ll/lu8;

    .line 30
    .line 31
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ChatGiftInfoExtra;->giftRecordId:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {v0, p1}, Ll/lu8;->j4(Ljava/lang/String;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    new-instance v0, Ll/fak;

    .line 38
    .line 39
    invoke-direct {v0, p0}, Ll/fak;-><init>(Lcom/p1/mobile/putong/core/ui/greet/a;)V

    .line 40
    .line 41
    .line 42
    new-instance p0, Ll/gak;

    .line 43
    .line 44
    invoke-direct {p0}, Ll/gak;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 52
    .line 53
    .line 54
    :cond_0
    return-void
.end method

.method public x1()V
    .locals 8

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->g0()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Greeting;->moment:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/data/IdBoxed;->id:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Co()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    :cond_0
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 26
    .line 27
    check-cast v0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->x:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 30
    .line 31
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->i2()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_1

    .line 36
    .line 37
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    const-string v6, ""

    .line 58
    .line 59
    const/4 v7, 0x2

    .line 60
    const-string v4, "from_greet_act"

    .line 61
    .line 62
    const/4 v5, -0x1

    .line 63
    invoke-interface/range {v1 .. v7}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->argsToPhotoAlbumFeedAct(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)Landroid/content/Intent;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :cond_1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-virtual {v1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    const/4 v3, 0x0

    .line 96
    const-string v4, "messages_thumbnail_right"

    .line 97
    .line 98
    invoke-interface {v1, p0, v2, v4, v3}, Ll/r97;->M1(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    const/16 v1, 0x10

    .line 103
    .line 104
    invoke-virtual {v0, p0, v1}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 105
    .line 106
    .line 107
    return-void
.end method

.method public z1(Ljava/lang/String;Ljava/lang/String;)V
    .locals 10

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0, p2}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/4 v2, 0x0

    .line 14
    if-eqz v1, :cond_1

    .line 15
    .line 16
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 17
    .line 18
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-nez v1, :cond_0

    .line 23
    .line 24
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 25
    .line 26
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    const/4 v3, 0x1

    .line 31
    if-ne v1, v3, :cond_1

    .line 32
    .line 33
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/data/User;->picture(I)Lcom/p1/mobile/putong/data/Picture;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 38
    .line 39
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-eqz v1, :cond_1

    .line 44
    .line 45
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/data/User;->picture(I)Lcom/p1/mobile/putong/data/Picture;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 50
    .line 51
    iget v1, v1, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 52
    .line 53
    if-eqz v1, :cond_0

    .line 54
    .line 55
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/data/User;->picture(I)Lcom/p1/mobile/putong/data/Picture;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 60
    .line 61
    iget v0, v0, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 62
    .line 63
    if-nez v0, :cond_1

    .line 64
    .line 65
    :cond_0
    return-void

    .line 66
    :cond_1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 75
    .line 76
    .line 77
    move-result-object v4

    .line 78
    const-string v8, ""

    .line 79
    .line 80
    const/4 v9, 0x2

    .line 81
    const/4 v7, -0x1

    .line 82
    move-object v6, p1

    .line 83
    move-object v5, p2

    .line 84
    invoke-interface/range {v3 .. v9}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->argsToPhotoAlbumFeedAct(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)Landroid/content/Intent;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    invoke-virtual {v0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    sget p1, Ll/y7c0;->e:I

    .line 96
    .line 97
    invoke-virtual {p0, p1, v2}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 98
    .line 99
    .line 100
    return-void
.end method
