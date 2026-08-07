.class public Ll/cwv;
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

.method public static synthetic d(Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 2
    .line 3
    iget-object v0, v0, Ll/il8;->c:Ll/t600;

    .line 4
    .line 5
    sget-object v1, Lcom/p1/mobile/putong/core/data/Message;->CID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v1, p0}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    sget-object v1, Lcom/p1/mobile/putong/core/data/Message;->MESSAGETYPE:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

    .line 14
    .line 15
    const-string v2, "local_intl_read_receipts_guide"

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->EQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    filled-new-array {p0, v1}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-static {p0}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {v0, p0}, Ll/wzh0;->delete(Lcom/tantanapp/common/data/orm/Filter;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public static synthetic e(Ll/cwv;Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cwv;->g(Lcom/p1/mobile/putong/core/data/Conversation;)V

    return-void
.end method


# virtual methods
.method public a()Lcom/p1/mobile/putong/core/ui/messages/manager/insert/LocalMsgInsertType;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/ui/messages/manager/insert/LocalMsgInsertType;->INTL_READ_RECEIPTS_GUIDE:Lcom/p1/mobile/putong/core/ui/messages/manager/insert/LocalMsgInsertType;

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
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 4
    .line 5
    invoke-virtual {p2}, Ll/joa;->K3()Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    if-nez p2, :cond_1

    .line 10
    .line 11
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 12
    .line 13
    iget-object p2, p2, Ll/il8;->c:Ll/t600;

    .line 14
    .line 15
    iget-object p3, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 16
    .line 17
    iget-wide p4, p1, Lcom/p1/mobile/putong/core/data/Conversation;->clearedTime:D

    .line 18
    .line 19
    const/4 p6, 0x1

    .line 20
    invoke-virtual {p2, p3, p4, p5, p6}, Ll/t600;->R(Ljava/lang/String;DZ)Ll/wzh0$a;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    invoke-virtual {p2}, Ll/wzh0$a;->e()I

    .line 25
    .line 26
    .line 27
    move-result p2

    .line 28
    if-lez p2, :cond_0

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    invoke-virtual {p0, p1}, Ll/cwv;->f(Lcom/p1/mobile/putong/core/data/Conversation;)I

    .line 32
    .line 33
    .line 34
    move-result p2

    .line 35
    if-gtz p2, :cond_2

    .line 36
    .line 37
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 38
    .line 39
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->U:Ll/fy6;

    .line 40
    .line 41
    new-instance p3, Ll/bwv;

    .line 42
    .line 43
    invoke-direct {p3, p0, p1}, Ll/bwv;-><init>(Ll/cwv;Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p2, p3}, Ll/fy6;->a(Ll/x20;)V

    .line 47
    .line 48
    .line 49
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 50
    .line 51
    invoke-virtual {p7, p0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_1
    :goto_0
    invoke-virtual {p0, p1}, Ll/cwv;->f(Lcom/p1/mobile/putong/core/data/Conversation;)I

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    if-lez p0, :cond_2

    .line 60
    .line 61
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 62
    .line 63
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->U:Ll/fy6;

    .line 64
    .line 65
    new-instance p2, Ll/awv;

    .line 66
    .line 67
    invoke-direct {p2, p1}, Ll/awv;-><init>(Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0, p2}, Ll/fy6;->a(Ll/x20;)V

    .line 71
    .line 72
    .line 73
    :cond_2
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 74
    .line 75
    invoke-virtual {p7, p0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public c(Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/User;)Z
    .locals 0
    .param p3    # Lcom/p1/mobile/putong/core/data/Message;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    sget-object p3, Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;->PAGE_INIT:Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;

    .line 2
    .line 3
    if-eq p1, p3, :cond_0

    .line 4
    .line 5
    sget-object p3, Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;->CONV_MSG_CHANGE:Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;

    .line 6
    .line 7
    if-ne p1, p3, :cond_2

    .line 8
    .line 9
    :cond_0
    if-eqz p2, :cond_2

    .line 10
    .line 11
    iget-object p1, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 12
    .line 13
    const-string p3, "-1"

    .line 14
    .line 15
    invoke-virtual {p1, p3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-nez p1, :cond_2

    .line 20
    .line 21
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 22
    .line 23
    const-string p3, "default"

    .line 24
    .line 25
    invoke-static {p1, p3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_2

    .line 30
    .line 31
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {p1, p3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-nez p1, :cond_1

    .line 38
    .line 39
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 40
    .line 41
    const-string p3, "heartbeatMatch"

    .line 42
    .line 43
    invoke-static {p1, p3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    if-nez p1, :cond_1

    .line 48
    .line 49
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 50
    .line 51
    const-string p3, "compliment"

    .line 52
    .line 53
    invoke-static {p1, p3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    if-nez p1, :cond_1

    .line 58
    .line 59
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 60
    .line 61
    const-string p3, "swiper"

    .line 62
    .line 63
    invoke-static {p1, p3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    if-eqz p1, :cond_2

    .line 68
    .line 69
    :cond_1
    invoke-virtual {p0, p4, p2}, Ll/cwv;->h(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    if-nez p0, :cond_2

    .line 74
    .line 75
    const/4 p0, 0x1

    .line 76
    return p0

    .line 77
    :cond_2
    const/4 p0, 0x0

    .line 78
    return p0
.end method

.method public final f(Lcom/p1/mobile/putong/core/data/Conversation;)I
    .locals 3

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 2
    .line 3
    iget-object p0, p0, Ll/il8;->c:Ll/t600;

    .line 4
    .line 5
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->clearedTime:D

    .line 8
    .line 9
    const-string p1, "local_intl_read_receipts_guide"

    .line 10
    .line 11
    invoke-virtual {p0, v0, v1, v2, p1}, Ll/t600;->p0(Ljava/lang/String;DLjava/lang/String;)Ll/wzh0$a;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/wzh0$a;->e()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0
.end method

.method public final synthetic g(Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 3

    .line 1
    invoke-virtual {p0, p1}, Ll/cwv;->f(Lcom/p1/mobile/putong/core/data/Conversation;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-gtz p0, :cond_0

    .line 6
    .line 7
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 10
    .line 11
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 12
    .line 13
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->clearedTime:D

    .line 14
    .line 15
    invoke-virtual {p0, v0, v1, v2}, Lcom/p1/mobile/putong/core/api/g;->Sg(Ljava/lang/String;D)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public final h(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Conversation;)Z
    .locals 2

    .line 1
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/o3z;->g()Ll/o3z;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 14
    .line 15
    iget-object v1, p2, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ll/dkb;->oa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p0, v0, p1}, Ll/o3z;->i(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    iget-object p0, p2, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->chatInterrupt:Lcom/p1/mobile/putong/core/data/ChatInterrupt;

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ChatInterrupt;->stage:Lcom/p1/mobile/putong/core/data/ChatInterruptStage;

    .line 32
    .line 33
    const-string p1, "locked"

    .line 34
    .line 35
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    if-eqz p0, :cond_0

    .line 40
    .line 41
    const/4 p0, 0x1

    .line 42
    return p0

    .line 43
    :cond_0
    const/4 p0, 0x0

    .line 44
    return p0
.end method
