.class public Ll/dwv;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/vwl;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a()Lcom/p1/mobile/putong/core/ui/messages/manager/insert/LocalMsgInsertType;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/ui/messages/manager/insert/LocalMsgInsertType;->INVITATION_FOR_AUTHENTICATION:Lcom/p1/mobile/putong/core/ui/messages/manager/insert/LocalMsgInsertType;

    .line 2
    .line 3
    return-object p0
.end method

.method public b(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;Ljava/util/List;Lrx/subjects/a;)V
    .locals 0
    .param p2    # Lcom/p1/mobile/putong/core/data/Message;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Lcom/p1/mobile/putong/data/User;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            "Lcom/p1/mobile/putong/core/data/Message;",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/messages/manager/insert/LocalMsgInsertType;",
            ">;",
            "Lrx/subjects/a<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 2
    .line 3
    iget-object p0, p0, Ll/il8;->c:Ll/t600;

    .line 4
    .line 5
    sget-object p2, Lcom/p1/mobile/putong/core/data/Message;->CID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 6
    .line 7
    iget-object p3, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p2, p3}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    sget-object p3, Lcom/p1/mobile/putong/core/data/Message;->MESSAGETYPE:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

    .line 14
    .line 15
    const-string p4, "local_invitation_for_authentication"

    .line 16
    .line 17
    invoke-virtual {p3, p4}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->EQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 18
    .line 19
    .line 20
    move-result-object p3

    .line 21
    filled-new-array {p2, p3}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    invoke-static {p2}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    const/4 p3, 0x1

    .line 30
    invoke-virtual {p0, p2, p3}, Ll/wzh0;->count(Lcom/tantanapp/common/data/orm/Filter;I)I

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    if-lez p0, :cond_0

    .line 35
    .line 36
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 37
    .line 38
    invoke-virtual {p7, p0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 43
    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 45
    .line 46
    iget-object p2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 47
    .line 48
    invoke-static {p4}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 49
    .line 50
    .line 51
    move-result-object p3

    .line 52
    invoke-virtual {p0, p2, p3}, Lcom/p1/mobile/putong/core/api/g;->dh(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/MessageType;)V

    .line 53
    .line 54
    .line 55
    sget-object p0, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->IsInsertInviationForAuthentication:Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;

    .line 56
    .line 57
    iget-wide p1, p1, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 58
    .line 59
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-static {}, Ll/pzi0;->o()J

    .line 64
    .line 65
    .line 66
    move-result-wide p2

    .line 67
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->setLong(Ljava/lang/String;J)V

    .line 68
    .line 69
    .line 70
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 71
    .line 72
    invoke-virtual {p7, p0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public c(Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/User;)Z
    .locals 2
    .param p3    # Lcom/p1/mobile/putong/core/data/Message;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p4}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 p1, 0x0

    .line 6
    if-eqz p0, :cond_1

    .line 7
    .line 8
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 11
    .line 12
    iget-object p3, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {p0, p3}, Ll/dkb;->oa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result p3

    .line 22
    if-eqz p3, :cond_1

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    if-nez p0, :cond_1

    .line 29
    .line 30
    iget-object p0, p2, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 31
    .line 32
    const-string p3, "group"

    .line 33
    .line 34
    invoke-static {p0, p3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    if-nez p0, :cond_1

    .line 39
    .line 40
    iget-wide p3, p2, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 41
    .line 42
    const-wide/16 v0, 0x0

    .line 43
    .line 44
    cmp-long p0, p3, v0

    .line 45
    .line 46
    if-lez p0, :cond_1

    .line 47
    .line 48
    iget-object p0, p2, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 49
    .line 50
    const-string p3, "quickchat"

    .line 51
    .line 52
    invoke-static {p0, p3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    if-nez p0, :cond_1

    .line 57
    .line 58
    sget-object p0, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->IsInsertInviationForAuthentication:Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;

    .line 59
    .line 60
    iget-wide p3, p2, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 61
    .line 62
    invoke-static {p3, p4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p3

    .line 66
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->getLong(Ljava/lang/String;)J

    .line 67
    .line 68
    .line 69
    move-result-wide p3

    .line 70
    cmp-long p0, p3, v0

    .line 71
    .line 72
    if-lez p0, :cond_0

    .line 73
    .line 74
    return p1

    .line 75
    :cond_0
    invoke-static {}, Ll/h39;->h()Lcom/p1/mobile/putong/core/data/ChatInviteToVerifyConfig;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    move-result p3

    .line 83
    if-eqz p3, :cond_1

    .line 84
    .line 85
    iget-boolean p3, p0, Lcom/p1/mobile/putong/core/data/ChatInviteToVerifyConfig;->enable:Z

    .line 86
    .line 87
    if-eqz p3, :cond_1

    .line 88
    .line 89
    iget-object p3, p0, Lcom/p1/mobile/putong/core/data/ChatInviteToVerifyConfig;->functionStartTime:Ljava/lang/String;

    .line 90
    .line 91
    invoke-static {p3}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    .line 92
    .line 93
    .line 94
    move-result-wide p3

    .line 95
    iget v0, p2, Lcom/p1/mobile/putong/core/data/Conversation;->mm:I

    .line 96
    .line 97
    iget p0, p0, Lcom/p1/mobile/putong/core/data/ChatInviteToVerifyConfig;->insertMessageLiming:I

    .line 98
    .line 99
    if-lt v0, p0, :cond_1

    .line 100
    .line 101
    iget-wide v0, p2, Lcom/p1/mobile/putong/core/data/Conversation;->latestTime:D

    .line 102
    .line 103
    cmpl-double p0, v0, p3

    .line 104
    .line 105
    if-lez p0, :cond_1

    .line 106
    .line 107
    const/4 p0, 0x1

    .line 108
    return p0

    .line 109
    :cond_1
    return p1
.end method
