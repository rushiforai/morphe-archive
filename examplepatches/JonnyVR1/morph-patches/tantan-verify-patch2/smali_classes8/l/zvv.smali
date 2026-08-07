.class public Ll/zvv;
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

.method public static synthetic d(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Conversation;Lrx/subjects/a;Lcom/p1/mobile/putong/core/data/IdealInfo;)V
    .locals 5

    .line 1
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_7

    .line 6
    .line 7
    iget-object v0, p3, Lcom/p1/mobile/putong/core/data/IdealInfo;->targetFitIdeals:Ljava/util/List;

    .line 8
    .line 9
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_7

    .line 14
    .line 15
    iget-object p3, p3, Lcom/p1/mobile/putong/core/data/IdealInfo;->targetFitIdeals:Ljava/util/List;

    .line 16
    .line 17
    invoke-static {p3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_6

    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 32
    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 34
    .line 35
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_0

    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 42
    .line 43
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 44
    .line 45
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 46
    .line 47
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_0

    .line 52
    .line 53
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 54
    .line 55
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 56
    .line 57
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 58
    .line 59
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->ideal:Ljava/util/List;

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_0
    const/4 p0, 0x0

    .line 63
    :goto_0
    if-nez p0, :cond_1

    .line 64
    .line 65
    new-instance p0, Ljava/util/ArrayList;

    .line 66
    .line 67
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 68
    .line 69
    .line 70
    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    .line 71
    .line 72
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 73
    .line 74
    .line 75
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 76
    .line 77
    .line 78
    move-result-object p3

    .line 79
    :goto_1
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    if-eqz v1, :cond_4

    .line 84
    .line 85
    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    check-cast v1, Lcom/p1/mobile/putong/data/IdealTag;

    .line 90
    .line 91
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    :cond_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 96
    .line 97
    .line 98
    move-result v3

    .line 99
    if-eqz v3, :cond_3

    .line 100
    .line 101
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    move-result-object v3

    .line 105
    check-cast v3, Lcom/p1/mobile/putong/data/IdealTag;

    .line 106
    .line 107
    iget-object v3, v3, Lcom/p1/mobile/putong/data/IdealTag;->id:Ljava/lang/String;

    .line 108
    .line 109
    iget-object v4, v1, Lcom/p1/mobile/putong/data/IdealTag;->id:Ljava/lang/String;

    .line 110
    .line 111
    invoke-static {v3, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 112
    .line 113
    .line 114
    move-result v3

    .line 115
    if-eqz v3, :cond_2

    .line 116
    .line 117
    goto :goto_1

    .line 118
    :cond_3
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 119
    .line 120
    .line 121
    goto :goto_1

    .line 122
    :cond_4
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 123
    .line 124
    .line 125
    move-result p0

    .line 126
    if-nez p0, :cond_5

    .line 127
    .line 128
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 129
    .line 130
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 131
    .line 132
    iget-object p3, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 133
    .line 134
    const-string v1, "local_ideal_enquiry"

    .line 135
    .line 136
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 137
    .line 138
    .line 139
    move-result-object v1

    .line 140
    new-instance v2, Ll/xvv;

    .line 141
    .line 142
    invoke-direct {v2, p1, v0}, Ll/xvv;-><init>(Lcom/p1/mobile/putong/core/data/Conversation;Ljava/util/List;)V

    .line 143
    .line 144
    .line 145
    invoke-virtual {p0, p3, v1, v2}, Lcom/p1/mobile/putong/core/api/g;->ch(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/MessageType;Ll/y20;)Lrx/c;

    .line 146
    .line 147
    .line 148
    move-result-object p0

    .line 149
    new-instance p1, Ll/yvv;

    .line 150
    .line 151
    invoke-direct {p1, p2}, Ll/yvv;-><init>(Lrx/subjects/a;)V

    .line 152
    .line 153
    .line 154
    invoke-static {p1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 155
    .line 156
    .line 157
    move-result-object p1

    .line 158
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 159
    .line 160
    .line 161
    return-void

    .line 162
    :cond_5
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 163
    .line 164
    invoke-virtual {p2, p0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 165
    .line 166
    .line 167
    return-void

    .line 168
    :cond_6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 169
    .line 170
    invoke-virtual {p2, p0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 171
    .line 172
    .line 173
    return-void

    .line 174
    :cond_7
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 175
    .line 176
    invoke-virtual {p2, p0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 177
    .line 178
    .line 179
    return-void
.end method

.method public static synthetic e(Lrx/subjects/a;Ll/uxj0;)V
    .locals 0

    .line 1
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/core/data/Conversation;Ljava/util/List;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p0, p2, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 4
    .line 5
    :try_start_0
    invoke-static {}, Lcom/p1/mobile/putong/core/data/IdealInfo;->new_()Lcom/p1/mobile/putong/core/data/IdealInfo;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/IdealInfo;->fitIdeals:Ljava/util/List;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/IdealInfo;->toJson()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    iput-object p0, p2, Lcom/p1/mobile/putong/core/data/Message;->localExtraInfo:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 16
    .line 17
    :catch_0
    return-void
.end method

.method public static synthetic g(Lrx/subjects/a;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()Lcom/p1/mobile/putong/core/ui/messages/manager/insert/LocalMsgInsertType;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/ui/messages/manager/insert/LocalMsgInsertType;->IDEAL_GUIDE_MSG:Lcom/p1/mobile/putong/core/ui/messages/manager/insert/LocalMsgInsertType;

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
    iget-object p0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    sget-object p2, Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;->CONV_MSG_CHANGE:Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;

    .line 4
    .line 5
    const/4 p3, 0x1

    .line 6
    if-ne p5, p2, :cond_0

    .line 7
    .line 8
    sget-object p2, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->IdealGuideMsg:Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;

    .line 9
    .line 10
    const-string p5, "ideal_guide_all_show_count_"

    .line 11
    .line 12
    invoke-virtual {p2, p5}, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->get(Ljava/lang/String;)I

    .line 13
    .line 14
    .line 15
    move-result p6

    .line 16
    add-int/2addr p6, p3

    .line 17
    invoke-virtual {p2, p5, p6}, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->set(Ljava/lang/String;I)V

    .line 18
    .line 19
    .line 20
    const-string p3, "today_show_times_"

    .line 21
    .line 22
    invoke-virtual {p2, p3}, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->set(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 26
    .line 27
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 28
    .line 29
    const-string p3, "chat"

    .line 30
    .line 31
    invoke-virtual {p2, p0, p3}, Ll/dkb;->s7(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p0}, Lrx/c;->first()Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    const-wide/16 p2, 0xbb8

    .line 40
    .line 41
    sget-object p5, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 42
    .line 43
    invoke-virtual {p0, p2, p3, p5}, Lrx/c;->timeout(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    new-instance p2, Ll/vvv;

    .line 48
    .line 49
    invoke-direct {p2, p4, p1, p7}, Ll/vvv;-><init>(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Conversation;Lrx/subjects/a;)V

    .line 50
    .line 51
    .line 52
    new-instance p1, Ll/wvv;

    .line 53
    .line 54
    invoke-direct {p1, p7}, Ll/wvv;-><init>(Lrx/subjects/a;)V

    .line 55
    .line 56
    .line 57
    invoke-static {p2, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_0
    sget-object p2, Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;->PAGE_FINISH:Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;

    .line 66
    .line 67
    if-ne p5, p2, :cond_2

    .line 68
    .line 69
    sget-object p2, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->IdealGuideMsg:Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;

    .line 70
    .line 71
    new-instance p4, Ljava/lang/StringBuilder;

    .line 72
    .line 73
    const-string p5, "ideal_guide_conv_show_flag_"

    .line 74
    .line 75
    invoke-direct {p4, p5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object p4

    .line 85
    invoke-virtual {p2, p4}, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->get(Ljava/lang/String;)I

    .line 86
    .line 87
    .line 88
    move-result p4

    .line 89
    if-ne p4, p3, :cond_1

    .line 90
    .line 91
    new-instance p3, Ljava/lang/StringBuilder;

    .line 92
    .line 93
    invoke-direct {p3, p5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    const/4 p3, 0x2

    .line 104
    invoke-virtual {p2, p0, p3}, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->set(Ljava/lang/String;I)V

    .line 105
    .line 106
    .line 107
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 108
    .line 109
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 110
    .line 111
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 112
    .line 113
    const-string p2, "local_ideal_enquiry"

    .line 114
    .line 115
    filled-new-array {p2}, [Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object p2

    .line 119
    invoke-static {p2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 120
    .line 121
    .line 122
    move-result-object p2

    .line 123
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/api/g;->Qf(Ljava/lang/String;Ljava/util/List;)V

    .line 124
    .line 125
    .line 126
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 127
    .line 128
    invoke-virtual {p7, p0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 129
    .line 130
    .line 131
    :cond_2
    return-void
.end method

.method public c(Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/User;)Z
    .locals 9
    .param p3    # Lcom/p1/mobile/putong/core/data/Message;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object p0, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/4 p4, 0x0

    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    return p4

    .line 11
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;->PAGE_FINISH:Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    if-ne p1, p0, :cond_1

    .line 15
    .line 16
    return v0

    .line 17
    :cond_1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->qf()Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-nez p0, :cond_2

    .line 30
    .line 31
    return p4

    .line 32
    :cond_2
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    if-eqz p0, :cond_3

    .line 37
    .line 38
    iget-object p0, p3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 39
    .line 40
    const-string v1, "fake_id_"

    .line 41
    .line 42
    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    if-eqz p0, :cond_3

    .line 47
    .line 48
    return p4

    .line 49
    :cond_3
    iget-object p0, p2, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 50
    .line 51
    const-string v1, "default"

    .line 52
    .line 53
    invoke-static {v1}, Lcom/p1/mobile/putong/data/ConversationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    if-eq p0, v2, :cond_4

    .line 58
    .line 59
    return p4

    .line 60
    :cond_4
    iget-object p0, p2, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 61
    .line 62
    invoke-static {p0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    if-eqz p0, :cond_b

    .line 67
    .line 68
    iget-object p0, p2, Lcom/p1/mobile/putong/core/data/Conversation;->otherStatus:Ljava/lang/String;

    .line 69
    .line 70
    invoke-static {p0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 71
    .line 72
    .line 73
    move-result p0

    .line 74
    if-nez p0, :cond_5

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_5
    iget p0, p2, Lcom/p1/mobile/putong/core/data/Conversation;->mm:I

    .line 78
    .line 79
    const/4 v1, 0x5

    .line 80
    if-ge p0, v1, :cond_6

    .line 81
    .line 82
    return p4

    .line 83
    :cond_6
    iget-object p0, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 84
    .line 85
    sget-object v2, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->IdealGuideMsg:Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;

    .line 86
    .line 87
    const-string v3, "ideal_guide_all_show_count_"

    .line 88
    .line 89
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->get(Ljava/lang/String;)I

    .line 90
    .line 91
    .line 92
    move-result v3

    .line 93
    const/4 v4, 0x3

    .line 94
    if-lt v3, v4, :cond_7

    .line 95
    .line 96
    return p4

    .line 97
    :cond_7
    const-string v3, "latest_show_time_"

    .line 98
    .line 99
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->getLong(Ljava/lang/String;)J

    .line 100
    .line 101
    .line 102
    move-result-wide v5

    .line 103
    invoke-static {v5, v6}, Ll/pzi0;->D(J)Z

    .line 104
    .line 105
    .line 106
    move-result v5

    .line 107
    const-string v6, "today_show_times_"

    .line 108
    .line 109
    if-nez v5, :cond_8

    .line 110
    .line 111
    invoke-static {}, Ll/pzi0;->o()J

    .line 112
    .line 113
    .line 114
    move-result-wide v7

    .line 115
    invoke-virtual {v2, v3, v7, v8}, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->setLong(Ljava/lang/String;J)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {v2, v6, p4}, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->set(Ljava/lang/String;I)V

    .line 119
    .line 120
    .line 121
    :cond_8
    invoke-virtual {v2, v6}, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->get(Ljava/lang/String;)I

    .line 122
    .line 123
    .line 124
    move-result v3

    .line 125
    if-lt v3, v4, :cond_9

    .line 126
    .line 127
    return p4

    .line 128
    :cond_9
    new-instance v3, Ljava/lang/StringBuilder;

    .line 129
    .line 130
    const-string v4, "ideal_guide_conv_show_flag_"

    .line 131
    .line 132
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object v3

    .line 142
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->get(Ljava/lang/String;)I

    .line 143
    .line 144
    .line 145
    move-result v3

    .line 146
    if-lez v3, :cond_a

    .line 147
    .line 148
    return p4

    .line 149
    :cond_a
    sget-object v3, Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;->CONV_MSG_CHANGE:Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;

    .line 150
    .line 151
    if-ne p1, v3, :cond_b

    .line 152
    .line 153
    iget p1, p2, Lcom/p1/mobile/putong/core/data/Conversation;->mm:I

    .line 154
    .line 155
    if-lt p1, v1, :cond_b

    .line 156
    .line 157
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 158
    .line 159
    .line 160
    move-result p1

    .line 161
    if-eqz p1, :cond_b

    .line 162
    .line 163
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    .line 164
    .line 165
    .line 166
    move-result p1

    .line 167
    if-eqz p1, :cond_b

    .line 168
    .line 169
    new-instance p1, Ljava/lang/StringBuilder;

    .line 170
    .line 171
    invoke-direct {p1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 172
    .line 173
    .line 174
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 175
    .line 176
    .line 177
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object p0

    .line 181
    invoke-virtual {v2, p0, v0}, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->set(Ljava/lang/String;I)V

    .line 182
    .line 183
    .line 184
    return v0

    .line 185
    :cond_b
    :goto_0
    return p4
.end method
