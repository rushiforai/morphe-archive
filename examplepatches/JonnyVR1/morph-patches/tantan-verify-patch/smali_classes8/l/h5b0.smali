.class public Ll/h5b0;
.super Ll/e5b0;
.source "SourceFile"


# direct methods
.method public constructor <init>(Ll/yxz;Ll/tvz;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/e5b0;-><init>(Ll/yxz;Ll/tvz;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic i(Ll/h5b0;Ljava/lang/Boolean;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/h5b0;->m(Ljava/lang/Boolean;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic j(Ll/h5b0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/h5b0;->l()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/data/User;)Z
    .locals 1
    .param p1    # Lcom/p1/mobile/putong/core/data/Conversation;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/data/User;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/h39;->J()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/e5b0;->b:Ll/tvz;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/tvz;->r3()Ljava/lang/String;

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
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isBannedNew()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_0

    .line 36
    .line 37
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isAccountCancellation()Z

    .line 38
    .line 39
    .line 40
    move-result p2

    .line 41
    if-nez p2, :cond_0

    .line 42
    .line 43
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 44
    .line 45
    const-string v0, "default"

    .line 46
    .line 47
    invoke-static {p2, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 48
    .line 49
    .line 50
    move-result p2

    .line 51
    if-eqz p2, :cond_0

    .line 52
    .line 53
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 54
    .line 55
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 56
    .line 57
    .line 58
    move-result p2

    .line 59
    if-eqz p2, :cond_0

    .line 60
    .line 61
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localDraft:Ljava/lang/String;

    .line 62
    .line 63
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 64
    .line 65
    .line 66
    move-result p2

    .line 67
    if-eqz p2, :cond_0

    .line 68
    .line 69
    iget p2, p1, Lcom/p1/mobile/putong/core/data/Conversation;->mm:I

    .line 70
    .line 71
    if-nez p2, :cond_0

    .line 72
    .line 73
    iget p1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->userMessageCount:I

    .line 74
    .line 75
    const/4 p2, 0x1

    .line 76
    if-ne p1, p2, :cond_0

    .line 77
    .line 78
    iget-object p1, p0, Ll/e5b0;->b:Ll/tvz;

    .line 79
    .line 80
    invoke-virtual {p1}, Ll/tvz;->r3()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    invoke-virtual {p0, p1}, Ll/h5b0;->k(Ljava/lang/String;)Z

    .line 85
    .line 86
    .line 87
    move-result p1

    .line 88
    if-nez p1, :cond_0

    .line 89
    .line 90
    invoke-virtual {p0}, Ll/h5b0;->d()Z

    .line 91
    .line 92
    .line 93
    move-result p1

    .line 94
    if-nez p1, :cond_0

    .line 95
    .line 96
    invoke-virtual {p0, p2}, Ll/h5b0;->e(Z)Z

    .line 97
    .line 98
    .line 99
    move-result p1

    .line 100
    if-nez p1, :cond_0

    .line 101
    .line 102
    invoke-virtual {p0, p2}, Ll/h5b0;->f(Z)Z

    .line 103
    .line 104
    .line 105
    move-result p0

    .line 106
    if-nez p0, :cond_0

    .line 107
    .line 108
    return p2

    .line 109
    :cond_0
    const/4 p0, 0x0

    .line 110
    return p0
.end method

.method public b()Lrx/c;
    .locals 2
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/f5b0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/f5b0;-><init>(Ll/h5b0;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lrx/c;->fromCallable(Ljava/util/concurrent/Callable;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/g5b0;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/g5b0;-><init>(Ll/h5b0;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public d()Z
    .locals 2

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/g;->O1:Ll/byd0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ljava/lang/Long;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    invoke-static {v0, v1}, Ll/pzi0;->D(J)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method

.method public e(Z)Z
    .locals 2

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/g;->M1:Ll/byd0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ljava/lang/Long;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    invoke-static {v0, v1}, Ll/pzi0;->D(J)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/g;->L1:Ll/vxd0;

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    check-cast p0, Ljava/lang/Integer;

    .line 34
    .line 35
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    invoke-static {p1}, Ll/h39;->B(Z)I

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    if-lt p0, p1, :cond_0

    .line 44
    .line 45
    const/4 p0, 0x1

    .line 46
    return p0

    .line 47
    :cond_0
    const/4 p0, 0x0

    .line 48
    return p0
.end method

.method public f(Z)Z
    .locals 2

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/g;->M1:Ll/byd0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ljava/lang/Long;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    invoke-static {v0, v1}, Ll/pzi0;->D(J)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    const/4 v0, 0x0

    .line 22
    if-nez p0, :cond_0

    .line 23
    .line 24
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/g;->N1:Ll/vxd0;

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    check-cast p0, Ljava/lang/Integer;

    .line 35
    .line 36
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    invoke-static {p1}, Ll/h39;->z(Z)I

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    if-lt p0, p1, :cond_0

    .line 45
    .line 46
    const/4 p0, 0x1

    .line 47
    return p0

    .line 48
    :cond_0
    return v0
.end method

.method public handle()Z
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->PrologueNotResponseGuideLastShowTime:Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;

    .line 2
    .line 3
    iget-object v1, p0, Ll/e5b0;->b:Ll/tvz;

    .line 4
    .line 5
    iget-object v1, v1, Ll/clz;->b:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {}, Ll/pzi0;->o()J

    .line 8
    .line 9
    .line 10
    move-result-wide v2

    .line 11
    invoke-virtual {v0, v1, v2, v3}, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->setLong(Ljava/lang/String;J)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/e5b0;->a:Ll/yxz;

    .line 15
    .line 16
    iget-object p0, p0, Ll/e5b0;->c:Ljava/util/List;

    .line 17
    .line 18
    const-string v1, "no_reply"

    .line 19
    .line 20
    invoke-virtual {v0, p0, v1}, Ll/yxz;->l5(Ljava/util/List;Ljava/lang/String;)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0
.end method

.method public final k(Ljava/lang/String;)Z
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->PrologueNotResponseGuideLastShowTime:Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->getLong(Ljava/lang/String;)J

    .line 4
    .line 5
    .line 6
    move-result-wide p0

    .line 7
    invoke-static {p0, p1}, Ll/pzi0;->D(J)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public final synthetic l()Ljava/lang/Boolean;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 2
    .line 3
    iget-object v0, v0, Ll/il8;->c:Ll/t600;

    .line 4
    .line 5
    iget-object v1, p0, Ll/e5b0;->b:Ll/tvz;

    .line 6
    .line 7
    invoke-virtual {v1}, Ll/tvz;->r3()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v0, v1, v2}, Ll/t600;->G(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 24
    .line 25
    iget-object v1, v1, Ll/il8;->c:Ll/t600;

    .line 26
    .line 27
    iget-object v2, p0, Ll/e5b0;->b:Ll/tvz;

    .line 28
    .line 29
    invoke-virtual {v2}, Ll/tvz;->r3()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    iget-object v3, p0, Ll/e5b0;->b:Ll/tvz;

    .line 34
    .line 35
    invoke-virtual {v3}, Ll/tvz;->r3()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    invoke-virtual {v1, v2, v3}, Ll/t600;->G(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 44
    .line 45
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 46
    .line 47
    iget-object v3, p0, Ll/e5b0;->b:Ll/tvz;

    .line 48
    .line 49
    invoke-virtual {v3}, Ll/tvz;->r3()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/core/api/g;->Mo(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    const/4 v3, 0x0

    .line 62
    if-eqz v1, :cond_0

    .line 63
    .line 64
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    const/4 v4, 0x1

    .line 69
    if-ne v1, v4, :cond_0

    .line 70
    .line 71
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    check-cast v1, Lcom/p1/mobile/putong/core/data/Message;

    .line 76
    .line 77
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 78
    .line 79
    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 80
    .line 81
    .line 82
    move-result-wide v5

    .line 83
    iget-object v1, v2, Lcom/p1/mobile/putong/core/data/Conversation;->otherReadUntil:Ljava/lang/String;

    .line 84
    .line 85
    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 86
    .line 87
    .line 88
    move-result-wide v1

    .line 89
    cmp-long v1, v5, v1

    .line 90
    .line 91
    if-nez v1, :cond_0

    .line 92
    .line 93
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    check-cast v0, Lcom/p1/mobile/putong/core/data/Message;

    .line 98
    .line 99
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 100
    .line 101
    const-string v1, "prologue"

    .line 102
    .line 103
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    if-nez v0, :cond_0

    .line 108
    .line 109
    iget-object p0, p0, Ll/e5b0;->b:Ll/tvz;

    .line 110
    .line 111
    invoke-virtual {p0}, Ll/clz;->j3()Lcom/p1/mobile/putong/core/data/Conversation;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    iget p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->mm:I

    .line 116
    .line 117
    if-nez p0, :cond_0

    .line 118
    .line 119
    move v3, v4

    .line 120
    :cond_0
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    return-object p0
.end method

.method public final synthetic m(Ljava/lang/Boolean;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-super {p0}, Ll/e5b0;->b()Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method
