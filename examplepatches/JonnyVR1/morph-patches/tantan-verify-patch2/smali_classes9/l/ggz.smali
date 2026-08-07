.class public Ll/ggz;
.super Ll/clz;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/clz<",
        "Lcom/p1/mobile/putong/core/data/ChatGroup;",
        "Ll/lgz;",
        ">;"
    }
.end annotation


# instance fields
.field public I0:Ljava/lang/String;

.field public J0:D

.field public final K0:Ljava/lang/String;

.field public L0:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public M0:Ll/kcg0;

.field public N0:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Ll/ner;Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 4

    .line 1
    invoke-direct {p0, p1}, Ll/clz;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    const-string p1, ""

    .line 5
    .line 6
    iput-object p1, p0, Ll/ggz;->I0:Ljava/lang/String;

    .line 7
    .line 8
    const-wide/high16 v0, -0x4010000000000000L    # -1.0

    .line 9
    .line 10
    iput-wide v0, p0, Ll/ggz;->J0:D

    .line 11
    .line 12
    const-string p1, "19"

    .line 13
    .line 14
    iput-object p1, p0, Ll/ggz;->K0:Ljava/lang/String;

    .line 15
    .line 16
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 17
    .line 18
    invoke-static {p1}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iput-object p1, p0, Ll/ggz;->L0:Lrx/subjects/a;

    .line 23
    .line 24
    new-instance p1, Ll/xfz;

    .line 25
    .line 26
    invoke-direct {p1, p0}, Ll/xfz;-><init>(Ll/ggz;)V

    .line 27
    .line 28
    .line 29
    iput-object p1, p0, Ll/ggz;->N0:Ljava/lang/Runnable;

    .line 30
    .line 31
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_1

    .line 36
    .line 37
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 38
    .line 39
    iput-object p1, p0, Ll/ggz;->I0:Ljava/lang/String;

    .line 40
    .line 41
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/Conversation;->group:Lcom/p1/mobile/putong/core/data/ConversationGroupProperty;

    .line 42
    .line 43
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    if-eqz p1, :cond_0

    .line 48
    .line 49
    invoke-static {p2}, Ll/pm6;->c(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    if-nez p1, :cond_0

    .line 54
    .line 55
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/Conversation;->group:Lcom/p1/mobile/putong/core/data/ConversationGroupProperty;

    .line 56
    .line 57
    iget-wide p1, p1, Lcom/p1/mobile/putong/core/data/ConversationGroupProperty;->joinedTime:D

    .line 58
    .line 59
    iput-wide p1, p0, Ll/ggz;->J0:D

    .line 60
    .line 61
    :cond_0
    iget-wide p1, p0, Ll/ggz;->J0:D

    .line 62
    .line 63
    const-wide/16 v2, 0x0

    .line 64
    .line 65
    cmpl-double p1, p1, v2

    .line 66
    .line 67
    if-nez p1, :cond_1

    .line 68
    .line 69
    iput-wide v0, p0, Ll/ggz;->J0:D

    .line 70
    .line 71
    :cond_1
    return-void
.end method

.method public static synthetic A7(Lcom/p1/mobile/putong/core/data/ChatGroup;)Lcom/p1/mobile/putong/core/data/ChatSendMessage;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->punishment:Lcom/p1/mobile/putong/core/data/ChatPunishment;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ChatPunishment;->sendMessage:Lcom/p1/mobile/putong/core/data/ChatSendMessage;

    .line 4
    .line 5
    return-object p0
.end method

.method public static synthetic B7(Ll/ggz;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ggz;->U7(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic C7(Ll/ggz;Ll/uxj0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ggz;->T7(Ll/uxj0;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic D7(Ll/ggz;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ggz;->S7(Ll/bkj0;)V

    return-void
.end method

.method public static synthetic E7(Ll/ggz;JIJLcom/p1/mobile/putong/core/data/ChatSendMessage;Lcom/p1/mobile/putong/core/data/ChatGroupSilence;Lcom/p1/mobile/putong/data/User;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p9}, Ll/ggz;->d8(JIJLcom/p1/mobile/putong/core/data/ChatSendMessage;Lcom/p1/mobile/putong/core/data/ChatGroupSilence;Lcom/p1/mobile/putong/data/User;Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic F7(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic G7(Ll/ggz;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ggz;->X7(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic H7(Ll/ggz;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ggz;->c8(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic I7(Ll/ggz;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ggz;->a8(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic J7(Ll/ggz;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ggz;->Z7(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method private O7()V
    .locals 1

    .line 1
    new-instance v0, Ll/rfz;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/rfz;-><init>(Ll/ggz;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private synthetic a8(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ggz;->R7()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic u7(Ll/ggz;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ggz;->W7(Ll/pf60;)V

    return-void
.end method

.method public static synthetic v7(Ll/ggz;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ggz;->b8()V

    return-void
.end method

.method public static synthetic w7(Ll/ggz;Lcom/p1/mobile/putong/core/data/ChatGroupMember;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ggz;->Y7(Lcom/p1/mobile/putong/core/data/ChatGroupMember;)V

    return-void
.end method

.method public static synthetic x7(Ll/ggz;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ggz;->V7(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic y7(Lcom/p1/mobile/putong/core/data/ChatSendMessage;Lcom/p1/mobile/putong/core/data/ChatGroupMember;Lcom/p1/mobile/putong/data/User;Ll/uxj0;)Ll/bkj0;
    .locals 0

    .line 1
    new-instance p3, Ll/bkj0;

    .line 2
    .line 3
    invoke-direct {p3, p0, p1, p2}, Ll/bkj0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-object p3
.end method

.method public static synthetic z7(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public A3()Ljava/lang/String;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ggz;->r3()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/e;->s6(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupType:Lcom/p1/mobile/putong/core/data/ChatGroupType;

    .line 20
    .line 21
    const-string v1, "anonymous"

    .line 22
    .line 23
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    const-string p0, "chat_group_anonymity"

    .line 30
    .line 31
    return-object p0

    .line 32
    :cond_0
    invoke-super {p0}, Ll/clz;->A3()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0
.end method

.method public final K7()V
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ggz;->r3()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/e;->o6(Ljava/lang/String;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/dgz;

    .line 14
    .line 15
    invoke-direct {v1}, Ll/dgz;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 27
    .line 28
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/ggz;->r3()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    invoke-interface {v3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    invoke-virtual {v1, v2, v3}, Lcom/p1/mobile/putong/core/api/e;->T6(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    new-instance v2, Ll/hh7;

    .line 47
    .line 48
    invoke-direct {v2}, Ll/hh7;-><init>()V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v1, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 56
    .line 57
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 58
    .line 59
    invoke-virtual {v2}, Ll/dkb;->o9()Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    iget-object v3, p0, Ll/ggz;->L0:Lrx/subjects/a;

    .line 64
    .line 65
    new-instance v4, Ll/egz;

    .line 66
    .line 67
    invoke-direct {v4}, Ll/egz;-><init>()V

    .line 68
    .line 69
    .line 70
    invoke-static {v0, v1, v2, v3, v4}, Lrx/c;->combineLatest(Lrx/c;Lrx/c;Lrx/c;Lrx/c;Ll/tcj;)Lrx/c;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    new-instance v1, Ll/fgz;

    .line 79
    .line 80
    invoke-direct {v1, p0}, Ll/fgz;-><init>(Ll/ggz;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/y20;)Ll/kcg0;

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method public final L7()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/e;->y6()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/ufz;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/ufz;-><init>(Ll/ggz;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const/4 v1, 0x1

    .line 23
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Ll/vfz;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Ll/vfz;-><init>(Ll/ggz;)V

    .line 30
    .line 31
    .line 32
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final M7()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/e;->R6()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/cgz;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/cgz;-><init>(Ll/ggz;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final N7()V
    .locals 5

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
    invoke-interface {v0}, Ll/r97;->D()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/ggz;->r3()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 26
    .line 27
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/clz;->i3()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/g;->Ne(Ljava/lang/String;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 38
    .line 39
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/clz;->i3()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-virtual {p0}, Ll/ggz;->t3()D

    .line 46
    .line 47
    .line 48
    move-result-wide v3

    .line 49
    invoke-virtual {v1, v2, v3, v4}, Lcom/p1/mobile/putong/core/api/g;->Un(Ljava/lang/String;D)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    new-instance v2, Ll/gu20;

    .line 54
    .line 55
    invoke-direct {v2}, Ll/gu20;-><init>()V

    .line 56
    .line 57
    .line 58
    invoke-static {v0, v1, v2}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    new-instance v1, Ll/agz;

    .line 67
    .line 68
    invoke-direct {v1, p0}, Ll/agz;-><init>(Ll/ggz;)V

    .line 69
    .line 70
    .line 71
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 76
    .line 77
    .line 78
    new-instance v0, Ll/bgz;

    .line 79
    .line 80
    invoke-direct {v0}, Ll/bgz;-><init>()V

    .line 81
    .line 82
    .line 83
    new-instance v1, Ll/eoz;

    .line 84
    .line 85
    invoke-direct {v1}, Ll/eoz;-><init>()V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p0, v0, v1}, Ll/ar2;->creates(Ll/y20;Ll/x20;)V

    .line 89
    .line 90
    .line 91
    :cond_0
    return-void
.end method

.method public final P7()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ggz;->r3()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/api/e;->T6(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Ll/hh7;

    .line 22
    .line 23
    invoke-direct {v1}, Ll/hh7;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    new-instance v1, Ll/tfz;

    .line 35
    .line 36
    invoke-direct {v1, p0}, Ll/tfz;-><init>(Ll/ggz;)V

    .line 37
    .line 38
    .line 39
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public final Q7()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/sfz;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/sfz;-><init>(Ll/ggz;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final R7()V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ggz;->r3()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/e;->h7(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-interface {v1}, Ll/r97;->p()Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-eqz v1, :cond_4

    .line 29
    .line 30
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->ownerUserId:Ljava/lang/String;

    .line 31
    .line 32
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-interface {v2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-nez v1, :cond_4

    .line 47
    .line 48
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 49
    .line 50
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 51
    .line 52
    const/4 v2, 0x0

    .line 53
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/api/g;->zg(Z)Ljava/util/LinkedHashMap;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    if-eqz v1, :cond_4

    .line 58
    .line 59
    invoke-virtual {v1}, Ljava/util/AbstractMap;->isEmpty()Z

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    if-eqz v2, :cond_1

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_1
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->ownerUserId:Ljava/lang/String;

    .line 67
    .line 68
    invoke-virtual {v1, v2}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    check-cast v1, Lcom/p1/mobile/putong/data/UserLiveLabel;

    .line 73
    .line 74
    if-nez v1, :cond_2

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_2
    const-string v2, "onVoice"

    .line 78
    .line 79
    iget-object v3, v1, Lcom/p1/mobile/putong/data/UserLiveLabel;->liveState:Ljava/lang/String;

    .line 80
    .line 81
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result v2

    .line 85
    if-nez v2, :cond_3

    .line 86
    .line 87
    const-string v2, "onLive"

    .line 88
    .line 89
    iget-object v3, v1, Lcom/p1/mobile/putong/data/UserLiveLabel;->liveState:Ljava/lang/String;

    .line 90
    .line 91
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    move-result v2

    .line 95
    if-eqz v2, :cond_4

    .line 96
    .line 97
    :cond_3
    invoke-virtual {p0}, Ll/ggz;->r3()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v2

    .line 101
    iget-object v1, v1, Lcom/p1/mobile/putong/data/UserLiveLabel;->groupId:Ljava/lang/String;

    .line 102
    .line 103
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    move-result v1

    .line 107
    if-eqz v1, :cond_4

    .line 108
    .line 109
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 110
    .line 111
    check-cast v1, Ll/lgz;

    .line 112
    .line 113
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->category:Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;

    .line 114
    .line 115
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;->id:Ljava/lang/String;

    .line 116
    .line 117
    invoke-virtual {p0}, Ll/ggz;->r3()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    invoke-virtual {v1, v0, p0}, Ll/qzz;->Y1(Ljava/lang/String;Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    :cond_4
    :goto_0
    return-void
.end method

.method public final synthetic S7(Ll/bkj0;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/ggz;->M0:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 9
    .line 10
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 11
    .line 12
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    const/4 v2, 0x1

    .line 17
    const/4 v3, 0x0

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 21
    .line 22
    iget-object v1, v1, Lcom/p1/mobile/putong/data/UserState;->jailedBusiness:Lcom/p1/mobile/putong/data/JailedBusiness;

    .line 23
    .line 24
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-eqz v1, :cond_0

    .line 29
    .line 30
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 31
    .line 32
    iget-object v1, v1, Lcom/p1/mobile/putong/data/UserState;->jailedBusiness:Lcom/p1/mobile/putong/data/JailedBusiness;

    .line 33
    .line 34
    iget-object v1, v1, Lcom/p1/mobile/putong/data/JailedBusiness;->groupChat:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 35
    .line 36
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-eqz v1, :cond_0

    .line 41
    .line 42
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 43
    .line 44
    iget-object v0, v0, Lcom/p1/mobile/putong/data/UserState;->jailedBusiness:Lcom/p1/mobile/putong/data/JailedBusiness;

    .line 45
    .line 46
    iget-object v0, v0, Lcom/p1/mobile/putong/data/JailedBusiness;->groupChat:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 47
    .line 48
    iget-boolean v1, v0, Lcom/p1/mobile/putong/data/JailedGroupChat;->active:Z

    .line 49
    .line 50
    if-eqz v1, :cond_0

    .line 51
    .line 52
    iget-wide v0, v0, Lcom/p1/mobile/putong/data/JailedGroupChat;->expireTime:D

    .line 53
    .line 54
    invoke-static {}, Ll/pzi0;->o()J

    .line 55
    .line 56
    .line 57
    move-result-wide v4

    .line 58
    long-to-double v4, v4

    .line 59
    cmpl-double v0, v0, v4

    .line 60
    .line 61
    if-lez v0, :cond_0

    .line 62
    .line 63
    move v0, v2

    .line 64
    goto :goto_0

    .line 65
    :cond_0
    move v0, v3

    .line 66
    :goto_0
    iget-object v1, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 67
    .line 68
    check-cast v1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    .line 69
    .line 70
    iget-object v4, v1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->status:Lcom/p1/mobile/putong/core/data/ChatGroupMemberStatus;

    .line 71
    .line 72
    const-string v5, "exited"

    .line 73
    .line 74
    invoke-static {v4, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 75
    .line 76
    .line 77
    move-result v4

    .line 78
    if-eqz v4, :cond_1

    .line 79
    .line 80
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 81
    .line 82
    check-cast p0, Ll/lgz;

    .line 83
    .line 84
    invoke-virtual {p0, v3}, Ll/lgz;->w2(Z)V

    .line 85
    .line 86
    .line 87
    return-void

    .line 88
    :cond_1
    iget-object v4, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 89
    .line 90
    check-cast v4, Lcom/p1/mobile/putong/core/data/ChatSendMessage;

    .line 91
    .line 92
    iget-boolean v4, v4, Lcom/p1/mobile/putong/core/data/ChatSendMessage;->active:Z

    .line 93
    .line 94
    if-nez v4, :cond_3

    .line 95
    .line 96
    iget-object v4, v1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->silence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 97
    .line 98
    iget-boolean v4, v4, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;->enable:Z

    .line 99
    .line 100
    if-nez v4, :cond_3

    .line 101
    .line 102
    if-eqz v0, :cond_2

    .line 103
    .line 104
    goto :goto_1

    .line 105
    :cond_2
    move v2, v3

    .line 106
    :cond_3
    :goto_1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 107
    .line 108
    check-cast v0, Ll/lgz;

    .line 109
    .line 110
    invoke-virtual {v0, v2}, Ll/lgz;->w2(Z)V

    .line 111
    .line 112
    .line 113
    if-eqz v2, :cond_4

    .line 114
    .line 115
    iget-object v0, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 116
    .line 117
    check-cast v0, Lcom/p1/mobile/putong/core/data/ChatSendMessage;

    .line 118
    .line 119
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->silence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 120
    .line 121
    iget-object p1, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 122
    .line 123
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    .line 124
    .line 125
    invoke-virtual {p0, v0, v1, p1}, Ll/ggz;->g8(Lcom/p1/mobile/putong/core/data/ChatSendMessage;Lcom/p1/mobile/putong/core/data/ChatGroupSilence;Lcom/p1/mobile/putong/data/User;)V

    .line 126
    .line 127
    .line 128
    :cond_4
    return-void
.end method

.method public final synthetic T7(Ll/uxj0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ggz;->r3()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/api/e;->h7(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    xor-int/lit8 p0, p0, 0x1

    .line 18
    .line 19
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public final synthetic U7(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public V2()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ggz;->h4()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    return p0
.end method

.method public final synthetic V7(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ggz;->e8()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic W7(Ll/pf60;)V
    .locals 3

    .line 1
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 4
    .line 5
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p1, Ll/vg60;

    .line 8
    .line 9
    iget-object p1, p1, Ll/vg60;->a:Ljava/util/List;

    .line 10
    .line 11
    const/16 v1, 0xa

    .line 12
    .line 13
    iget-object v2, p0, Ll/clz;->n:Ljava/util/HashMap;

    .line 14
    .line 15
    invoke-static {v0, p1, v1, v2}, Lcom/p1/mobile/putong/core/ui/messages/b;->l(Lcom/p1/mobile/putong/core/data/Conversation;Ljava/util/List;ILjava/util/HashMap;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iget-object v0, p0, Ll/ggz;->N0:Ljava/lang/Runnable;

    .line 26
    .line 27
    const-wide/16 v1, 0x1f4

    .line 28
    .line 29
    invoke-static {p1, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 30
    .line 31
    .line 32
    const/4 p1, 0x0

    .line 33
    invoke-virtual {p0, p1}, Ll/clz;->s7(Z)V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method public final synthetic X7(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/lgz;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/lgz;->q2()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic Y7(Lcom/p1/mobile/putong/core/data/ChatGroupMember;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/lgz;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->status:Lcom/p1/mobile/putong/core/data/ChatGroupMemberStatus;

    .line 6
    .line 7
    const-string v1, "exited"

    .line 8
    .line 9
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-nez p1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/ggz;->h4()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    :goto_0
    invoke-virtual {v0, p0}, Ll/lgz;->z2(Z)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final synthetic Z7(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->f:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-eq p1, v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 6
    .line 7
    if-ne p1, v0, :cond_1

    .line 8
    .line 9
    :cond_0
    invoke-virtual {p0}, Ll/clz;->i3()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    const/4 p1, 0x1

    .line 20
    invoke-virtual {p0, p1}, Ll/clz;->s7(Z)V

    .line 21
    .line 22
    .line 23
    :cond_1
    return-void
.end method

.method public a0()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/clz;->a0()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/clz;->i3()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/g;->dn(Ljava/lang/String;)Lrx/c;

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Ll/ggz;->Q7()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ll/ggz;->N7()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Ll/ggz;->K7()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Ll/ggz;->e8()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Ll/ggz;->M7()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Ll/ggz;->P7()V

    .line 31
    .line 32
    .line 33
    new-instance v0, Ll/qfz;

    .line 34
    .line 35
    invoke-direct {v0, p0}, Ll/qfz;-><init>(Ll/ggz;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Ll/ggz;->h8()V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Ll/ggz;->L7()V

    .line 45
    .line 46
    .line 47
    invoke-direct {p0}, Ll/ggz;->O7()V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public final synthetic b8()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/lgz;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/qzz;->C1()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic c8(Ll/uxj0;)V
    .locals 1

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ggz;->r3()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/api/e;->s6(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-interface {p0}, Ll/mzl;->F()Ll/ruy;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    instance-of v0, p0, Ll/avy;

    .line 34
    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    check-cast p0, Ll/avy;

    .line 38
    .line 39
    invoke-virtual {p0, p1}, Ll/avy;->I0(Lcom/p1/mobile/putong/core/data/ChatGroup;)V

    .line 40
    .line 41
    .line 42
    :cond_0
    return-void
.end method

.method public final synthetic d8(JIJLcom/p1/mobile/putong/core/data/ChatSendMessage;Lcom/p1/mobile/putong/core/data/ChatGroupSilence;Lcom/p1/mobile/putong/data/User;Ljava/lang/Long;)V
    .locals 8

    .line 1
    move-object/from16 v0, p8

    .line 2
    .line 3
    invoke-static {}, Ll/pzi0;->o()J

    .line 4
    .line 5
    .line 6
    move-result-wide v1

    .line 7
    cmp-long v1, v1, p1

    .line 8
    .line 9
    if-gez v1, :cond_0

    .line 10
    .line 11
    invoke-static {}, Ll/pzi0;->o()J

    .line 12
    .line 13
    .line 14
    move-result-wide p6

    .line 15
    sub-long v2, p1, p6

    .line 16
    .line 17
    move-object v0, p0

    .line 18
    move-wide v4, p1

    .line 19
    move v1, p3

    .line 20
    move-wide v6, p4

    .line 21
    invoke-virtual/range {v0 .. v7}, Ll/ggz;->f8(IJJJ)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    iget-object p2, p0, Ll/ggz;->M0:Ll/kcg0;

    .line 26
    .line 27
    invoke-static {p2}, Ll/psd0;->z(Ll/kcg0;)V

    .line 28
    .line 29
    .line 30
    iget-boolean p2, p6, Lcom/p1/mobile/putong/core/data/ChatSendMessage;->active:Z

    .line 31
    .line 32
    if-eqz p2, :cond_1

    .line 33
    .line 34
    invoke-static {}, Ll/pzi0;->o()J

    .line 35
    .line 36
    .line 37
    move-result-wide p2

    .line 38
    long-to-double p2, p2

    .line 39
    iget-wide p4, p6, Lcom/p1/mobile/putong/core/data/ChatSendMessage;->until:D

    .line 40
    .line 41
    cmpg-double p2, p2, p4

    .line 42
    .line 43
    if-gez p2, :cond_1

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    iget-boolean p2, p7, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;->enable:Z

    .line 47
    .line 48
    if-eqz p2, :cond_2

    .line 49
    .line 50
    invoke-static {}, Ll/pzi0;->o()J

    .line 51
    .line 52
    .line 53
    move-result-wide p2

    .line 54
    long-to-double p2, p2

    .line 55
    iget-wide p4, p7, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;->until:D

    .line 56
    .line 57
    cmpg-double p2, p2, p4

    .line 58
    .line 59
    if-gez p2, :cond_2

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_2
    iget-object p2, v0, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 63
    .line 64
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result p2

    .line 68
    if-eqz p2, :cond_3

    .line 69
    .line 70
    iget-object p2, v0, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 71
    .line 72
    iget-object p2, p2, Lcom/p1/mobile/putong/data/UserState;->jailedBusiness:Lcom/p1/mobile/putong/data/JailedBusiness;

    .line 73
    .line 74
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result p2

    .line 78
    if-eqz p2, :cond_3

    .line 79
    .line 80
    iget-object p2, v0, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 81
    .line 82
    iget-object p2, p2, Lcom/p1/mobile/putong/data/UserState;->jailedBusiness:Lcom/p1/mobile/putong/data/JailedBusiness;

    .line 83
    .line 84
    iget-object p2, p2, Lcom/p1/mobile/putong/data/JailedBusiness;->groupChat:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 85
    .line 86
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    move-result p2

    .line 90
    if-eqz p2, :cond_3

    .line 91
    .line 92
    iget-object p2, v0, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 93
    .line 94
    iget-object p2, p2, Lcom/p1/mobile/putong/data/UserState;->jailedBusiness:Lcom/p1/mobile/putong/data/JailedBusiness;

    .line 95
    .line 96
    iget-object p2, p2, Lcom/p1/mobile/putong/data/JailedBusiness;->groupChat:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 97
    .line 98
    iget-boolean p3, p2, Lcom/p1/mobile/putong/data/JailedGroupChat;->active:Z

    .line 99
    .line 100
    if-eqz p3, :cond_3

    .line 101
    .line 102
    iget-wide p2, p2, Lcom/p1/mobile/putong/data/JailedGroupChat;->expireTime:D

    .line 103
    .line 104
    invoke-static {}, Ll/pzi0;->o()J

    .line 105
    .line 106
    .line 107
    move-result-wide p4

    .line 108
    long-to-double p4, p4

    .line 109
    cmpl-double p2, p2, p4

    .line 110
    .line 111
    if-lez p2, :cond_3

    .line 112
    .line 113
    :goto_0
    iget-object p0, p0, Ll/ggz;->L0:Lrx/subjects/a;

    .line 114
    .line 115
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 116
    .line 117
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 118
    .line 119
    .line 120
    return-void

    .line 121
    :cond_3
    iget-object p2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 122
    .line 123
    check-cast p2, Ll/lgz;

    .line 124
    .line 125
    const/4 p3, 0x0

    .line 126
    invoke-virtual {p2, p3}, Ll/lgz;->w2(Z)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {p0}, Ll/ggz;->e8()V

    .line 130
    .line 131
    .line 132
    return-void
.end method

.method public e4()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public final e8()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ggz;->r3()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/e;->X8(Ljava/lang/String;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ll/yfz;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Ll/yfz;-><init>(Ll/ggz;)V

    .line 20
    .line 21
    .line 22
    new-instance v2, Ll/zfz;

    .line 23
    .line 24
    invoke-direct {v2}, Ll/zfz;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 32
    .line 33
    .line 34
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 35
    .line 36
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 37
    .line 38
    invoke-virtual {p0}, Ll/ggz;->r3()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/e;->Q8(Ljava/lang/String;)Lrx/c;

    .line 43
    .line 44
    .line 45
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 46
    .line 47
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 48
    .line 49
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {v0, v1}, Ll/dkb;->W9(Ljava/lang/String;)Lrx/c;

    .line 58
    .line 59
    .line 60
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 61
    .line 62
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 63
    .line 64
    invoke-virtual {p0}, Ll/ggz;->r3()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/putong/core/api/e;->Z8(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public final f8(IJJJ)V
    .locals 3

    .line 1
    const-wide/16 v0, 0x3e8

    .line 2
    .line 3
    div-long/2addr p2, v0

    .line 4
    const-wide/16 v0, 0x3c

    .line 5
    .line 6
    div-long/2addr p6, v0

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    new-instance p1, Ljava/util/Date;

    .line 10
    .line 11
    invoke-direct {p1, p4, p5}, Ljava/util/Date;-><init>(J)V

    .line 12
    .line 13
    .line 14
    sget-object p2, Ll/jek;->a:Ljava/text/SimpleDateFormat;

    .line 15
    .line 16
    invoke-virtual {p2, p1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    sget p3, Lcom/p1/mobile/putong/core/message/R$string;->h0:I

    .line 25
    .line 26
    const/4 p4, 0x0

    .line 27
    const/4 p5, 0x4

    .line 28
    invoke-virtual {p1, p4, p5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p4

    .line 32
    const/4 p5, 0x5

    .line 33
    const/4 p6, 0x7

    .line 34
    invoke-virtual {p1, p5, p6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p5

    .line 38
    const/16 p6, 0x8

    .line 39
    .line 40
    const/16 p7, 0xa

    .line 41
    .line 42
    invoke-virtual {p1, p6, p7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    filled-new-array {p4, p5, p1}, [Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {p2, p3, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    iget-object p2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 55
    .line 56
    check-cast p2, Ll/lgz;

    .line 57
    .line 58
    invoke-virtual {p2, p1}, Ll/lgz;->u2(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_0
    const/4 v2, 0x2

    .line 63
    if-ne p1, v2, :cond_1

    .line 64
    .line 65
    new-instance p1, Ljava/util/Date;

    .line 66
    .line 67
    invoke-direct {p1, p4, p5}, Ljava/util/Date;-><init>(J)V

    .line 68
    .line 69
    .line 70
    iget-object p2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 71
    .line 72
    check-cast p2, Ll/lgz;

    .line 73
    .line 74
    new-instance p3, Ljava/lang/StringBuilder;

    .line 75
    .line 76
    const-string p4, "\u60a8\u7684\u8d26\u53f7\u6536\u5230\u591a\u6761\u4e3e\u62a5\uff0c\u7ecf\u5e73\u53f0\u6838\u5b9e\u786e\u5b9a\u8fdd\u89c4\uff0c\u5c06\u4e8e "

    .line 77
    .line 78
    invoke-direct {p3, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    sget-object p4, Ll/pzi0;->e:Ljava/text/SimpleDateFormat;

    .line 82
    .line 83
    invoke-virtual {p4, p1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    const-string p1, " \u89e3\u9664\u7981\u8a00\u3002"

    .line 91
    .line 92
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    invoke-virtual {p2, p1}, Ll/lgz;->u2(Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    goto :goto_0

    .line 103
    :cond_1
    const/4 p4, 0x1

    .line 104
    if-ne p1, p4, :cond_3

    .line 105
    .line 106
    cmp-long p1, p2, v0

    .line 107
    .line 108
    iget-object p4, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 109
    .line 110
    if-gez p1, :cond_2

    .line 111
    .line 112
    check-cast p4, Ll/lgz;

    .line 113
    .line 114
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    sget p5, Lcom/p1/mobile/putong/core/message/R$string;->B:I

    .line 119
    .line 120
    new-instance p6, Ljava/lang/StringBuilder;

    .line 121
    .line 122
    invoke-direct {p6}, Ljava/lang/StringBuilder;-><init>()V

    .line 123
    .line 124
    .line 125
    const-wide/16 v0, 0x1

    .line 126
    .line 127
    invoke-static {v0, v1, p2, p3}, Ljava/lang/Math;->max(JJ)J

    .line 128
    .line 129
    .line 130
    move-result-wide p2

    .line 131
    invoke-virtual {p6, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    const-string p2, ""

    .line 135
    .line 136
    invoke-virtual {p6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    invoke-virtual {p6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object p2

    .line 143
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 144
    .line 145
    .line 146
    move-result-object p2

    .line 147
    invoke-virtual {p1, p5, p2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    invoke-virtual {p4, p1}, Ll/lgz;->u2(Ljava/lang/String;)V

    .line 152
    .line 153
    .line 154
    goto :goto_0

    .line 155
    :cond_2
    check-cast p4, Ll/lgz;

    .line 156
    .line 157
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 158
    .line 159
    .line 160
    move-result-object p1

    .line 161
    sget p2, Lcom/p1/mobile/putong/core/message/R$string;->A:I

    .line 162
    .line 163
    invoke-static {p6, p7}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object p3

    .line 167
    filled-new-array {p3}, [Ljava/lang/Object;

    .line 168
    .line 169
    .line 170
    move-result-object p3

    .line 171
    invoke-virtual {p1, p2, p3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object p1

    .line 175
    invoke-virtual {p4, p1}, Ll/lgz;->u2(Ljava/lang/String;)V

    .line 176
    .line 177
    .line 178
    :cond_3
    :goto_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 179
    .line 180
    .line 181
    move-result-object p0

    .line 182
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 183
    .line 184
    .line 185
    return-void
.end method

.method public final g8(Lcom/p1/mobile/putong/core/data/ChatSendMessage;Lcom/p1/mobile/putong/core/data/ChatGroupSilence;Lcom/p1/mobile/putong/data/User;)V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v8, p1

    .line 4
    .line 5
    move-object/from16 v9, p2

    .line 6
    .line 7
    move-object/from16 v10, p3

    .line 8
    .line 9
    iget-boolean v1, v8, Lcom/p1/mobile/putong/core/data/ChatSendMessage;->active:Z

    .line 10
    .line 11
    const-wide/16 v2, 0x0

    .line 12
    .line 13
    const/4 v4, 0x0

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    iget-wide v5, v8, Lcom/p1/mobile/putong/core/data/ChatSendMessage;->until:D

    .line 17
    .line 18
    invoke-static {}, Ll/pzi0;->o()J

    .line 19
    .line 20
    .line 21
    move-result-wide v11

    .line 22
    long-to-double v11, v11

    .line 23
    cmpl-double v1, v5, v11

    .line 24
    .line 25
    if-lez v1, :cond_0

    .line 26
    .line 27
    iget-wide v5, v8, Lcom/p1/mobile/putong/core/data/ChatSendMessage;->until:D

    .line 28
    .line 29
    double-to-long v5, v5

    .line 30
    invoke-static {}, Ll/pzi0;->o()J

    .line 31
    .line 32
    .line 33
    move-result-wide v11

    .line 34
    sub-long/2addr v5, v11

    .line 35
    iget-wide v11, v8, Lcom/p1/mobile/putong/core/data/ChatSendMessage;->until:D

    .line 36
    .line 37
    double-to-long v11, v11

    .line 38
    move-wide v13, v2

    .line 39
    :goto_0
    move v1, v4

    .line 40
    goto/16 :goto_1

    .line 41
    .line 42
    :cond_0
    iget-object v1, v10, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 43
    .line 44
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    if-eqz v1, :cond_1

    .line 49
    .line 50
    iget-object v1, v10, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 51
    .line 52
    iget-object v1, v1, Lcom/p1/mobile/putong/data/UserState;->jailedBusiness:Lcom/p1/mobile/putong/data/JailedBusiness;

    .line 53
    .line 54
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    if-eqz v1, :cond_1

    .line 59
    .line 60
    iget-object v1, v10, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 61
    .line 62
    iget-object v1, v1, Lcom/p1/mobile/putong/data/UserState;->jailedBusiness:Lcom/p1/mobile/putong/data/JailedBusiness;

    .line 63
    .line 64
    iget-object v1, v1, Lcom/p1/mobile/putong/data/JailedBusiness;->groupChat:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 65
    .line 66
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    if-eqz v1, :cond_1

    .line 71
    .line 72
    iget-object v1, v10, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 73
    .line 74
    iget-object v1, v1, Lcom/p1/mobile/putong/data/UserState;->jailedBusiness:Lcom/p1/mobile/putong/data/JailedBusiness;

    .line 75
    .line 76
    iget-object v1, v1, Lcom/p1/mobile/putong/data/JailedBusiness;->groupChat:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 77
    .line 78
    iget-boolean v5, v1, Lcom/p1/mobile/putong/data/JailedGroupChat;->active:Z

    .line 79
    .line 80
    if-eqz v5, :cond_1

    .line 81
    .line 82
    iget-wide v5, v1, Lcom/p1/mobile/putong/data/JailedGroupChat;->expireTime:D

    .line 83
    .line 84
    invoke-static {}, Ll/pzi0;->o()J

    .line 85
    .line 86
    .line 87
    move-result-wide v11

    .line 88
    long-to-double v11, v11

    .line 89
    cmpl-double v1, v5, v11

    .line 90
    .line 91
    if-lez v1, :cond_1

    .line 92
    .line 93
    iget-object v1, v10, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 94
    .line 95
    iget-object v1, v1, Lcom/p1/mobile/putong/data/UserState;->jailedBusiness:Lcom/p1/mobile/putong/data/JailedBusiness;

    .line 96
    .line 97
    iget-object v1, v1, Lcom/p1/mobile/putong/data/JailedBusiness;->groupChat:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 98
    .line 99
    iget-wide v5, v1, Lcom/p1/mobile/putong/data/JailedGroupChat;->expireTime:D

    .line 100
    .line 101
    double-to-long v5, v5

    .line 102
    invoke-static {}, Ll/pzi0;->o()J

    .line 103
    .line 104
    .line 105
    move-result-wide v11

    .line 106
    sub-long/2addr v5, v11

    .line 107
    iget-object v1, v10, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 108
    .line 109
    iget-object v1, v1, Lcom/p1/mobile/putong/data/UserState;->jailedBusiness:Lcom/p1/mobile/putong/data/JailedBusiness;

    .line 110
    .line 111
    iget-object v1, v1, Lcom/p1/mobile/putong/data/JailedBusiness;->groupChat:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 112
    .line 113
    iget-wide v11, v1, Lcom/p1/mobile/putong/data/JailedGroupChat;->expireTime:D

    .line 114
    .line 115
    double-to-long v11, v11

    .line 116
    const/4 v1, 0x2

    .line 117
    move-wide v13, v2

    .line 118
    goto :goto_1

    .line 119
    :cond_1
    iget-boolean v1, v9, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;->enable:Z

    .line 120
    .line 121
    if-eqz v1, :cond_2

    .line 122
    .line 123
    iget-wide v5, v9, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;->until:D

    .line 124
    .line 125
    invoke-static {}, Ll/pzi0;->o()J

    .line 126
    .line 127
    .line 128
    move-result-wide v11

    .line 129
    long-to-double v11, v11

    .line 130
    cmpl-double v1, v5, v11

    .line 131
    .line 132
    if-lez v1, :cond_2

    .line 133
    .line 134
    iget-wide v5, v9, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;->until:D

    .line 135
    .line 136
    double-to-long v5, v5

    .line 137
    invoke-static {}, Ll/pzi0;->o()J

    .line 138
    .line 139
    .line 140
    move-result-wide v11

    .line 141
    sub-long/2addr v5, v11

    .line 142
    iget-wide v11, v9, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;->until:D

    .line 143
    .line 144
    double-to-long v11, v11

    .line 145
    iget-wide v13, v9, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;->duration:J

    .line 146
    .line 147
    const/4 v1, 0x1

    .line 148
    goto :goto_1

    .line 149
    :cond_2
    move-wide v5, v2

    .line 150
    move-wide v11, v5

    .line 151
    move-wide v13, v11

    .line 152
    goto :goto_0

    .line 153
    :goto_1
    iget-object v7, v0, Ll/ggz;->M0:Ll/kcg0;

    .line 154
    .line 155
    invoke-static {v7}, Ll/psd0;->z(Ll/kcg0;)V

    .line 156
    .line 157
    .line 158
    cmp-long v2, v5, v2

    .line 159
    .line 160
    if-gtz v2, :cond_3

    .line 161
    .line 162
    iget-object v0, v0, Ll/ar2;->viewModel:Ll/iam;

    .line 163
    .line 164
    check-cast v0, Ll/lgz;

    .line 165
    .line 166
    invoke-virtual {v0, v4}, Ll/lgz;->w2(Z)V

    .line 167
    .line 168
    .line 169
    return-void

    .line 170
    :cond_3
    invoke-static {}, Ll/pzi0;->o()J

    .line 171
    .line 172
    .line 173
    move-result-wide v2

    .line 174
    cmp-long v2, v2, v11

    .line 175
    .line 176
    if-gez v2, :cond_4

    .line 177
    .line 178
    invoke-static {}, Ll/pzi0;->o()J

    .line 179
    .line 180
    .line 181
    move-result-wide v2

    .line 182
    sub-long v2, v11, v2

    .line 183
    .line 184
    move-wide v4, v11

    .line 185
    move-wide v6, v13

    .line 186
    invoke-virtual/range {v0 .. v7}, Ll/ggz;->f8(IJJJ)V

    .line 187
    .line 188
    .line 189
    move-wide v2, v4

    .line 190
    move-wide v5, v6

    .line 191
    goto :goto_2

    .line 192
    :cond_4
    move-wide v2, v11

    .line 193
    move-wide v5, v13

    .line 194
    :goto_2
    const-wide/16 v11, 0x1

    .line 195
    .line 196
    sget-object v4, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 197
    .line 198
    invoke-static {v11, v12, v4}, Lrx/c;->interval(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 199
    .line 200
    .line 201
    move-result-object v4

    .line 202
    invoke-virtual {v0, v4}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 203
    .line 204
    .line 205
    move-result-object v4

    .line 206
    invoke-virtual {v4}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 207
    .line 208
    .line 209
    move-result-object v4

    .line 210
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 211
    .line 212
    .line 213
    move-result-object v7

    .line 214
    invoke-virtual {v4, v7}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 215
    .line 216
    .line 217
    move-result-object v11

    .line 218
    new-instance v0, Ll/wfz;

    .line 219
    .line 220
    move v4, v1

    .line 221
    move-object v7, v8

    .line 222
    move-object v8, v9

    .line 223
    move-object v9, v10

    .line 224
    move-object/from16 v1, p0

    .line 225
    .line 226
    invoke-direct/range {v0 .. v9}, Ll/wfz;-><init>(Ll/ggz;JIJLcom/p1/mobile/putong/core/data/ChatSendMessage;Lcom/p1/mobile/putong/core/data/ChatGroupSilence;Lcom/p1/mobile/putong/data/User;)V

    .line 227
    .line 228
    .line 229
    move-object v15, v1

    .line 230
    move-object v1, v0

    .line 231
    move-object v0, v15

    .line 232
    invoke-virtual {v11, v1}, Lrx/c;->subscribe(Ll/y20;)Ll/kcg0;

    .line 233
    .line 234
    .line 235
    move-result-object v1

    .line 236
    iput-object v1, v0, Ll/ggz;->M0:Ll/kcg0;

    .line 237
    .line 238
    return-void
.end method

.method public h4()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/clz;->q3()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->category:Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;->id:Ljava/lang/String;

    .line 10
    .line 11
    const-string v0, "19"

    .line 12
    .line 13
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public final h8()V
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

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
    invoke-virtual {p0}, Ll/ggz;->r3()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v4

    .line 21
    invoke-virtual {v0, v1, v3, v4}, Lcom/p1/mobile/putong/core/api/g;->Xp(Lcom/p1/mobile/putong/core/data/NotificationStatus;Lcom/p1/mobile/putong/core/data/NotificationStatus;Ljava/lang/String;)Lrx/c;

    .line 22
    .line 23
    .line 24
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 25
    .line 26
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 27
    .line 28
    const-string v1, "ongoing"

    .line 29
    .line 30
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/NotificationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/NotificationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-virtual {p0}, Ll/ggz;->r3()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {v0, v1, v2, p0}, Lcom/p1/mobile/putong/core/api/g;->Xp(Lcom/p1/mobile/putong/core/data/NotificationStatus;Lcom/p1/mobile/putong/core/data/NotificationStatus;Ljava/lang/String;)Lrx/c;

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public r3()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ggz;->I0:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public s3(Ljava/lang/String;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/e;->o6(Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public t3()D
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/ggz;->J0:D

    .line 2
    .line 3
    return-wide v0
.end method
