.class public Ll/rl9;
.super Ll/dy6;
.source "SourceFile"


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/api/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/dy6;-><init>(Lcom/p1/mobile/putong/core/api/c;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a3(Ll/rl9;Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rl9;->f3(Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;)V

    return-void
.end method

.method public static synthetic b3(Ll/rl9;Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rl9;->g3(Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;)V

    return-void
.end method

.method public static synthetic c3(Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "conversation_virtual_voice"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->roomInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;

    .line 9
    .line 10
    iget-object v1, v1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->roomId:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 20
    .line 21
    iget-object v1, v1, Ll/il8;->m:Ll/mm6;

    .line 22
    .line 23
    invoke-virtual {v1, v0}, Ll/wzh0;->query(Ljava/lang/String;)Lcom/tantanapp/common/data/DbObject;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 28
    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    iget v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->level:I

    .line 32
    .line 33
    const/16 v2, 0x64

    .line 34
    .line 35
    if-ne v1, v2, :cond_0

    .line 36
    .line 37
    const/4 v2, 0x0

    .line 38
    :cond_0
    iput v2, v0, Lcom/p1/mobile/putong/core/data/Conversation;->level:I

    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->roomInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;

    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->title:Ljava/lang/String;

    .line 43
    .line 44
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->localExtraInfo:Ljava/lang/String;

    .line 45
    .line 46
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 47
    .line 48
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 49
    .line 50
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/g;->mq(Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 51
    .line 52
    .line 53
    :cond_1
    return-void
.end method

.method public static synthetic d3(Ll/rl9;Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rl9;->h3(Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;)V

    return-void
.end method


# virtual methods
.method public final e3()V
    .locals 4

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 2
    .line 3
    iget-object p0, p0, Ll/il8;->m:Ll/mm6;

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/data/Conversation;->CONVTYPE:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 6
    .line 7
    const-string v1, "virtualvoice"

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    filled-new-array {v0}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    sget-object v1, Lcom/p1/mobile/putong/core/data/Conversation;->UPDATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 22
    .line 23
    iget-object v1, v1, Lcom/tantanapp/common/data/orm/OrderedColumn;->DESC:Lcom/tantanapp/common/data/orm/Order;

    .line 24
    .line 25
    const/4 v2, 0x0

    .line 26
    invoke-virtual {p0, v0, v1, v2}, Ll/wzh0;->query(Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;I)Ljava/util/List;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    check-cast v0, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 45
    .line 46
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 47
    .line 48
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->liveVirtualVoice:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;

    .line 49
    .line 50
    if-eqz v0, :cond_0

    .line 51
    .line 52
    iget-object v1, v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->cellInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;

    .line 53
    .line 54
    iget-boolean v3, v1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isRemind:Z

    .line 55
    .line 56
    if-eqz v3, :cond_0

    .line 57
    .line 58
    iget-boolean v3, v1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isRemoved:Z

    .line 59
    .line 60
    if-nez v3, :cond_0

    .line 61
    .line 62
    iget-boolean v1, v1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemInfo;->isDissolved:Z

    .line 63
    .line 64
    if-nez v1, :cond_0

    .line 65
    .line 66
    iget-object v0, v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->chatInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;

    .line 67
    .line 68
    iget v0, v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->unreadedCount:I

    .line 69
    .line 70
    add-int/2addr v2, v0

    .line 71
    goto :goto_0

    .line 72
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-interface {p0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->r9()Ll/c8m0;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-interface {p0}, Ll/c8m0;->d()Lrx/subjects/a;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 89
    .line 90
    .line 91
    return-void
.end method

.method public final synthetic f3(Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;)V
    .locals 2

    .line 1
    const-string v0, "DbCheck"

    .line 2
    .line 3
    const-string v1, "delete voice step transaction remove"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    new-instance v0, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    const-string v1, "conversation_virtual_voice"

    .line 11
    .line 12
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->roomInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;

    .line 16
    .line 17
    iget-object p1, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->roomId:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 27
    .line 28
    iget-object v0, v0, Ll/il8;->m:Ll/mm6;

    .line 29
    .line 30
    invoke-virtual {v0, p1}, Ll/wzh0;->query(Ljava/lang/String;)Lcom/tantanapp/common/data/DbObject;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 35
    .line 36
    if-eqz v0, :cond_0

    .line 37
    .line 38
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 39
    .line 40
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 41
    .line 42
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/api/g;->Ef(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    :cond_0
    invoke-virtual {p0}, Ll/rl9;->e3()V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public final synthetic g3(Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;)V
    .locals 2

    .line 1
    const-string v0, "DbCheck"

    .line 2
    .line 3
    const-string v1, "delete voice step io remove"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->U:Ll/fy6;

    .line 11
    .line 12
    new-instance v1, Ll/ql9;

    .line 13
    .line 14
    invoke-direct {v1, p0, p1}, Ll/ql9;-><init>(Ll/rl9;Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ll/fy6;->a(Ll/x20;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final synthetic h3(Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->U:Ll/fy6;

    .line 4
    .line 5
    new-instance v0, Ll/pl9;

    .line 6
    .line 7
    invoke-direct {v0, p1}, Ll/pl9;-><init>(Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Ll/fy6;->a(Ll/x20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public i3(Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;)V
    .locals 2

    .line 1
    const-string v0, "DbCheck"

    .line 2
    .line 3
    const-string v1, "delete voice step remove"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    new-instance v0, Ll/ol9;

    .line 9
    .line 10
    invoke-direct {v0, p0, p1}, Ll/ol9;-><init>(Ll/rl9;Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;)V

    .line 11
    .line 12
    .line 13
    invoke-static {v0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public j3(Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;)V
    .locals 1

    .line 1
    new-instance v0, Ll/nl9;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/nl9;-><init>(Ll/rl9;Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
