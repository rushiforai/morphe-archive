.class public Ll/ihk;
.super Ljava/lang/Object;
.source "SourceFile"


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

.method public static synthetic a(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static synthetic b(Landroid/widget/TextView;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Conversation;ZLcom/p1/mobile/android/app/Act;Ll/x20;Ll/pf60;)V
    .locals 7

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    iget-object p6, p6, Ll/pf60;->b:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast p6, Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    .line 9
    .line 10
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    .line 11
    .line 12
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    const/4 v2, 0x0

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    move v1, v2

    .line 27
    :goto_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    const/4 v4, 0x1

    .line 32
    if-nez v3, :cond_2

    .line 33
    .line 34
    if-eqz v1, :cond_1

    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_1
    move v3, v2

    .line 38
    goto :goto_2

    .line 39
    :cond_2
    :goto_1
    move v3, v4

    .line 40
    :goto_2
    iget-object v5, p2, Lcom/p1/mobile/putong/core/data/Conversation;->group:Lcom/p1/mobile/putong/core/data/ConversationGroupProperty;

    .line 41
    .line 42
    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/ConversationGroupProperty;->latestNotificationMsgId:Ljava/lang/String;

    .line 43
    .line 44
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 45
    .line 46
    .line 47
    move-result v5

    .line 48
    if-nez v5, :cond_3

    .line 49
    .line 50
    sget-object v5, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 51
    .line 52
    iget-object v5, v5, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 53
    .line 54
    iget-object v6, p2, Lcom/p1/mobile/putong/core/data/Conversation;->group:Lcom/p1/mobile/putong/core/data/ConversationGroupProperty;

    .line 55
    .line 56
    iget-object v6, v6, Lcom/p1/mobile/putong/core/data/ConversationGroupProperty;->latestNotificationMsgId:Ljava/lang/String;

    .line 57
    .line 58
    invoke-virtual {v5, v6}, Lcom/p1/mobile/putong/core/api/g;->Oo(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Message;

    .line 59
    .line 60
    .line 61
    move-result-object v5

    .line 62
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result v5

    .line 66
    if-eqz v5, :cond_3

    .line 67
    .line 68
    if-nez v1, :cond_3

    .line 69
    .line 70
    move v2, v4

    .line 71
    :cond_3
    invoke-static {p6}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    const/4 v4, 0x0

    .line 76
    if-eqz v1, :cond_8

    .line 77
    .line 78
    if-eqz p3, :cond_6

    .line 79
    .line 80
    iget p3, p2, Lcom/p1/mobile/putong/core/data/Conversation;->unreadMessages:I

    .line 81
    .line 82
    if-lez p3, :cond_6

    .line 83
    .line 84
    if-nez v2, :cond_6

    .line 85
    .line 86
    if-eqz v3, :cond_4

    .line 87
    .line 88
    const-string v1, "[%1$s]%2$s%3$s"

    .line 89
    .line 90
    goto :goto_3

    .line 91
    :cond_4
    const-string v1, "[%1$s]%2$s: %3$s"

    .line 92
    .line 93
    :goto_3
    sget v2, Lcom/p1/mobile/putong/core/message/R$string;->V2:I

    .line 94
    .line 95
    invoke-static {p3}, Ll/a9g0;->f(I)Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object p3

    .line 99
    filled-new-array {p3}, [Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    move-result-object p3

    .line 103
    invoke-virtual {p4, v2, p3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object p3

    .line 107
    if-eqz v3, :cond_5

    .line 108
    .line 109
    goto :goto_4

    .line 110
    :cond_5
    invoke-virtual {p6}, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->groupMemberName()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object p4

    .line 114
    invoke-static {p4}, Ll/jek;->o(Ljava/lang/String;)Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    :goto_4
    invoke-static {p1, p2}, Ll/ihk;->g(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Conversation;)Ljava/lang/CharSequence;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    filled-new-array {p3, v0, p1}, [Ljava/lang/Object;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    invoke-static {v1, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 131
    .line 132
    .line 133
    goto :goto_6

    .line 134
    :cond_6
    if-eqz v3, :cond_7

    .line 135
    .line 136
    invoke-static {p1, p2}, Ll/ihk;->g(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Conversation;)Ljava/lang/CharSequence;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    goto :goto_5

    .line 141
    :cond_7
    invoke-virtual {p6}, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->groupMemberName()Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object p3

    .line 145
    invoke-static {p3}, Ll/jek;->o(Ljava/lang/String;)Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object p3

    .line 149
    invoke-static {p1, p2}, Ll/ihk;->g(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Conversation;)Ljava/lang/CharSequence;

    .line 150
    .line 151
    .line 152
    move-result-object p1

    .line 153
    filled-new-array {p3, p1}, [Ljava/lang/Object;

    .line 154
    .line 155
    .line 156
    move-result-object p1

    .line 157
    const-string p3, "%1$s: %2$s"

    .line 158
    .line 159
    invoke-static {p3, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object p1

    .line 163
    :goto_5
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 164
    .line 165
    .line 166
    :goto_6
    invoke-static {p0, p2, v4}, Ll/ihk;->f(Landroid/widget/TextView;Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 167
    .line 168
    .line 169
    goto :goto_8

    .line 170
    :cond_8
    if-eqz p3, :cond_9

    .line 171
    .line 172
    iget p3, p2, Lcom/p1/mobile/putong/core/data/Conversation;->unreadMessages:I

    .line 173
    .line 174
    if-lez p3, :cond_9

    .line 175
    .line 176
    if-nez v2, :cond_9

    .line 177
    .line 178
    sget p6, Lcom/p1/mobile/putong/core/message/R$string;->V2:I

    .line 179
    .line 180
    invoke-static {p3}, Ll/a9g0;->f(I)Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object p3

    .line 184
    filled-new-array {p3}, [Ljava/lang/Object;

    .line 185
    .line 186
    .line 187
    move-result-object p3

    .line 188
    invoke-virtual {p4, p6, p3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 189
    .line 190
    .line 191
    move-result-object p3

    .line 192
    invoke-static {p1, p2}, Ll/ihk;->g(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Conversation;)Ljava/lang/CharSequence;

    .line 193
    .line 194
    .line 195
    move-result-object p1

    .line 196
    filled-new-array {p3, p1}, [Ljava/lang/Object;

    .line 197
    .line 198
    .line 199
    move-result-object p1

    .line 200
    const-string p3, "[%1$s] %2$s"

    .line 201
    .line 202
    invoke-static {p3, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 203
    .line 204
    .line 205
    move-result-object p1

    .line 206
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 207
    .line 208
    .line 209
    goto :goto_7

    .line 210
    :cond_9
    invoke-static {p1, p2}, Ll/ihk;->g(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Conversation;)Ljava/lang/CharSequence;

    .line 211
    .line 212
    .line 213
    move-result-object p1

    .line 214
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 215
    .line 216
    .line 217
    :goto_7
    invoke-static {p0, p2, v4}, Ll/ihk;->f(Landroid/widget/TextView;Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 218
    .line 219
    .line 220
    :goto_8
    invoke-static {p5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 221
    .line 222
    .line 223
    move-result p0

    .line 224
    if-eqz p0, :cond_a

    .line 225
    .line 226
    invoke-interface {p5}, Ll/x20;->call()V

    .line 227
    .line 228
    .line 229
    :cond_a
    return-void
.end method

.method public static synthetic c(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const-string v0, "0"

    .line 2
    .line 3
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic d(Landroid/widget/TextView;Ll/bkj0;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Conversation;ZLcom/p1/mobile/android/app/Act;Ll/x20;Ll/bkj0;)V
    .locals 5

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p7, Ll/bkj0;->a:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 9
    .line 10
    iget-object v1, p7, Ll/bkj0;->b:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast v1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    .line 13
    .line 14
    iget-object v2, p7, Ll/bkj0;->c:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast v2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    .line 17
    .line 18
    iget-object p1, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 19
    .line 20
    check-cast p1, Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {v0, v1, v2, p1}, Lcom/p1/mobile/putong/core/ui/messages/b;->g(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/ChatGroupMember;Lcom/p1/mobile/putong/core/data/ChatGroupMember;Ljava/lang/String;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/Message;->isOtherUser()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_2

    .line 31
    .line 32
    iget-object p7, p7, Ll/bkj0;->c:Ljava/lang/Object;

    .line 33
    .line 34
    check-cast p7, Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    .line 35
    .line 36
    invoke-virtual {p7}, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->isMe()Z

    .line 37
    .line 38
    .line 39
    move-result p7

    .line 40
    if-eqz p7, :cond_2

    .line 41
    .line 42
    iget-boolean p7, p3, Lcom/p1/mobile/putong/core/data/Conversation;->muted:Z

    .line 43
    .line 44
    if-nez p7, :cond_2

    .line 45
    .line 46
    const-wide v0, 0x7fffffffffffffffL

    .line 47
    .line 48
    .line 49
    .line 50
    .line 51
    const-wide/high16 v2, -0x8000000000000000L

    .line 52
    .line 53
    :try_start_0
    iget-object p7, p3, Lcom/p1/mobile/putong/core/data/Conversation;->readUntil:Ljava/lang/String;

    .line 54
    .line 55
    invoke-static {p7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 56
    .line 57
    .line 58
    move-result p7

    .line 59
    if-nez p7, :cond_0

    .line 60
    .line 61
    iget-object p7, p3, Lcom/p1/mobile/putong/core/data/Conversation;->readUntil:Ljava/lang/String;

    .line 62
    .line 63
    invoke-static {p7}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 64
    .line 65
    .line 66
    move-result-wide v0

    .line 67
    goto :goto_0

    .line 68
    :catch_0
    move-exception p2

    .line 69
    goto :goto_1

    .line 70
    :cond_0
    const-wide/16 v0, 0x0

    .line 71
    .line 72
    :goto_0
    iget-object p7, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 73
    .line 74
    invoke-static {p7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 75
    .line 76
    .line 77
    move-result p7

    .line 78
    if-nez p7, :cond_1

    .line 79
    .line 80
    iget-object p7, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 81
    .line 82
    const-string v4, "fake_id_"

    .line 83
    .line 84
    invoke-virtual {p7, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 85
    .line 86
    .line 87
    move-result p7

    .line 88
    if-nez p7, :cond_1

    .line 89
    .line 90
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 91
    .line 92
    invoke-static {p2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 93
    .line 94
    .line 95
    move-result-wide v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 96
    goto :goto_2

    .line 97
    :goto_1
    invoke-static {p2}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 98
    .line 99
    .line 100
    :cond_1
    :goto_2
    cmp-long p2, v0, v2

    .line 101
    .line 102
    if-gez p2, :cond_2

    .line 103
    .line 104
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 109
    .line 110
    sget p7, Lcom/p1/mobile/putong/core/message/R$string;->a1:I

    .line 111
    .line 112
    invoke-virtual {p2, p7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object p2

    .line 116
    filled-new-array {p2}, [Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object p2

    .line 120
    invoke-static {p2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 121
    .line 122
    .line 123
    move-result-object p2

    .line 124
    const/4 p7, 0x2

    .line 125
    invoke-static {p7}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 126
    .line 127
    .line 128
    move-result-object p7

    .line 129
    const v0, -0xdededf

    .line 130
    .line 131
    .line 132
    invoke-static {p1, p2, v0, p7}, Ll/q8g0;->b0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 133
    .line 134
    .line 135
    move-result-object p1

    .line 136
    invoke-virtual {p1}, Landroid/text/SpannableStringBuilder;->toString()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object p2

    .line 140
    sget-object p7, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 141
    .line 142
    sget v0, Lcom/p1/mobile/putong/core/message/R$string;->a1:I

    .line 143
    .line 144
    invoke-virtual {p7, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object p7

    .line 148
    invoke-virtual {p2, p7}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 149
    .line 150
    .line 151
    move-result p2

    .line 152
    sget-object p7, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 153
    .line 154
    sget v0, Lcom/p1/mobile/putong/core/message/R$string;->a1:I

    .line 155
    .line 156
    invoke-virtual {p7, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object p7

    .line 160
    invoke-virtual {p7}, Ljava/lang/String;->length()I

    .line 161
    .line 162
    .line 163
    move-result p7

    .line 164
    add-int/2addr p7, p2

    .line 165
    if-ltz p2, :cond_2

    .line 166
    .line 167
    new-instance v0, Landroid/text/style/StyleSpan;

    .line 168
    .line 169
    const/4 v1, 0x1

    .line 170
    invoke-direct {v0, v1}, Landroid/text/style/StyleSpan;-><init>(I)V

    .line 171
    .line 172
    .line 173
    const/16 v1, 0x11

    .line 174
    .line 175
    invoke-virtual {p1, v0, p2, p7, v1}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 176
    .line 177
    .line 178
    :cond_2
    if-eqz p4, :cond_3

    .line 179
    .line 180
    iget p2, p3, Lcom/p1/mobile/putong/core/data/Conversation;->unreadMessages:I

    .line 181
    .line 182
    if-lez p2, :cond_3

    .line 183
    .line 184
    iget-object p2, p3, Lcom/p1/mobile/putong/core/data/Conversation;->group:Lcom/p1/mobile/putong/core/data/ConversationGroupProperty;

    .line 185
    .line 186
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/ConversationGroupProperty;->latestNotificationMsgId:Ljava/lang/String;

    .line 187
    .line 188
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 189
    .line 190
    .line 191
    move-result p2

    .line 192
    if-eqz p2, :cond_3

    .line 193
    .line 194
    sget p2, Lcom/p1/mobile/putong/core/message/R$string;->V2:I

    .line 195
    .line 196
    iget p4, p3, Lcom/p1/mobile/putong/core/data/Conversation;->unreadMessages:I

    .line 197
    .line 198
    invoke-static {p4}, Ll/a9g0;->f(I)Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object p4

    .line 202
    filled-new-array {p4}, [Ljava/lang/Object;

    .line 203
    .line 204
    .line 205
    move-result-object p4

    .line 206
    invoke-virtual {p5, p2, p4}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 207
    .line 208
    .line 209
    move-result-object p2

    .line 210
    filled-new-array {p2, p1}, [Ljava/lang/Object;

    .line 211
    .line 212
    .line 213
    move-result-object p1

    .line 214
    const-string p2, "[%1$s] %2$s"

    .line 215
    .line 216
    invoke-static {p2, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 217
    .line 218
    .line 219
    move-result-object p1

    .line 220
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 221
    .line 222
    .line 223
    goto :goto_3

    .line 224
    :cond_3
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 225
    .line 226
    .line 227
    :goto_3
    const/4 p1, 0x0

    .line 228
    invoke-static {p0, p3, p1}, Ll/ihk;->f(Landroid/widget/TextView;Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 229
    .line 230
    .line 231
    invoke-static {p6}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 232
    .line 233
    .line 234
    move-result p0

    .line 235
    if-eqz p0, :cond_4

    .line 236
    .line 237
    invoke-interface {p6}, Ll/x20;->call()V

    .line 238
    .line 239
    .line 240
    :cond_4
    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/data/ChatGroupMember;)Ll/pf60;
    .locals 2

    .line 1
    new-instance v0, Ll/pf60;

    .line 2
    .line 3
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 4
    .line 5
    invoke-direct {v0, v1, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public static f(Landroid/widget/TextView;Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 2

    .line 1
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 24
    .line 25
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/Message;->getHostId()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v0, v1, p2}, Lcom/p1/mobile/putong/core/api/e;->W8(Ljava/lang/String;Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_0

    .line 40
    .line 41
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->groupMemberName()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-nez v0, :cond_0

    .line 50
    .line 51
    new-instance v0, Ljava/lang/StringBuilder;

    .line 52
    .line 53
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 54
    .line 55
    .line 56
    invoke-static {p2}, Ll/jek;->o(Ljava/lang/String;)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string p2, ": "

    .line 64
    .line 65
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 69
    .line 70
    .line 71
    move-result-object p2

    .line 72
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p2

    .line 79
    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 80
    .line 81
    .line 82
    :cond_0
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/Conversation;->group:Lcom/p1/mobile/putong/core/data/ConversationGroupProperty;

    .line 83
    .line 84
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    move-result p2

    .line 88
    if-eqz p2, :cond_3

    .line 89
    .line 90
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/Conversation;->group:Lcom/p1/mobile/putong/core/data/ConversationGroupProperty;

    .line 91
    .line 92
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/ConversationGroupProperty;->latestNotificationMsgId:Ljava/lang/String;

    .line 93
    .line 94
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 95
    .line 96
    .line 97
    move-result p2

    .line 98
    if-nez p2, :cond_3

    .line 99
    .line 100
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 101
    .line 102
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 103
    .line 104
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->group:Lcom/p1/mobile/putong/core/data/ConversationGroupProperty;

    .line 105
    .line 106
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ConversationGroupProperty;->latestNotificationMsgId:Ljava/lang/String;

    .line 107
    .line 108
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/core/api/g;->Oo(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Message;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    move-result p2

    .line 116
    if-eqz p2, :cond_3

    .line 117
    .line 118
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    .line 119
    .line 120
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 121
    .line 122
    .line 123
    move-result p2

    .line 124
    if-nez p2, :cond_3

    .line 125
    .line 126
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->notifiedUsers:Ljava/util/List;

    .line 127
    .line 128
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 129
    .line 130
    .line 131
    move-result p2

    .line 132
    if-nez p2, :cond_3

    .line 133
    .line 134
    new-instance p2, Ll/ghk;

    .line 135
    .line 136
    invoke-direct {p2}, Ll/ghk;-><init>()V

    .line 137
    .line 138
    .line 139
    invoke-static {p1, p2}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 140
    .line 141
    .line 142
    move-result p2

    .line 143
    if-eqz p2, :cond_1

    .line 144
    .line 145
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 146
    .line 147
    sget p2, Lcom/p1/mobile/putong/core/message/R$string;->U2:I

    .line 148
    .line 149
    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object p1

    .line 153
    goto :goto_0

    .line 154
    :cond_1
    new-instance p2, Ll/hhk;

    .line 155
    .line 156
    invoke-direct {p2}, Ll/hhk;-><init>()V

    .line 157
    .line 158
    .line 159
    invoke-static {p1, p2}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 160
    .line 161
    .line 162
    move-result p1

    .line 163
    if-eqz p1, :cond_2

    .line 164
    .line 165
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 166
    .line 167
    sget p2, Lcom/p1/mobile/putong/core/message/R$string;->K2:I

    .line 168
    .line 169
    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object p1

    .line 173
    goto :goto_0

    .line 174
    :cond_2
    const/4 p1, 0x0

    .line 175
    :goto_0
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 176
    .line 177
    .line 178
    move-result p2

    .line 179
    if-eqz p2, :cond_3

    .line 180
    .line 181
    const-string p2, "["

    .line 182
    .line 183
    const-string v0, ""

    .line 184
    .line 185
    invoke-virtual {p1, p2, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 186
    .line 187
    .line 188
    move-result-object p1

    .line 189
    const-string p2, "]"

    .line 190
    .line 191
    invoke-virtual {p1, p2, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 192
    .line 193
    .line 194
    move-result-object p1

    .line 195
    invoke-virtual {p0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 196
    .line 197
    .line 198
    move-result-object p2

    .line 199
    invoke-static {p1, p2}, Ll/c17;->n0(Ljava/lang/String;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 200
    .line 201
    .line 202
    move-result-object p1

    .line 203
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 204
    .line 205
    .line 206
    :cond_3
    return-void
.end method

.method public static g(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Conversation;)Ljava/lang/CharSequence;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-interface {p1, p0}, Ll/r97;->P5(Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0

    .line 30
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-interface {v0, p0, p1}, Ll/r97;->M0(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Conversation;)Ljava/lang/CharSequence;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0
.end method

.method public static h(Landroid/widget/TextView;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Conversation;ZLl/pol;Lcom/p1/mobile/android/app/Act;[Ll/kcg0;Ll/x20;)V
    .locals 10
    .param p6    # [Ll/kcg0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Message;->new_()Lcom/p1/mobile/putong/core/data/Message;

    .line 2
    .line 3
    .line 4
    move-result-object v1

    .line 5
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/core/data/Message;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v8, 0x0

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    move-object v2, v8

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    move-object v2, p1

    .line 15
    :goto_0
    const/4 p1, 0x0

    .line 16
    aget-object v1, p6, p1

    .line 17
    .line 18
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    aget-object v1, p6, p1

    .line 25
    .line 26
    invoke-interface {v1}, Ll/kcg0;->isUnsubscribed()Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-nez v1, :cond_1

    .line 31
    .line 32
    aget-object v1, p6, p1

    .line 33
    .line 34
    invoke-static {v1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 35
    .line 36
    .line 37
    :cond_1
    iget-object v1, p2, Lcom/p1/mobile/putong/core/data/Conversation;->localDraft:Ljava/lang/String;

    .line 38
    .line 39
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-nez v1, :cond_3

    .line 44
    .line 45
    sget p3, Lcom/p1/mobile/putong/core/message/R$string;->z4:I

    .line 46
    .line 47
    invoke-virtual {p5, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p3

    .line 51
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Conversation;->localDraft:Ljava/lang/String;

    .line 52
    .line 53
    invoke-static {p3, p2}, Ll/c17;->n0(Ljava/lang/String;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 58
    .line 59
    .line 60
    invoke-static/range {p7 .. p7}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result p2

    .line 64
    if-eqz p2, :cond_2

    .line 65
    .line 66
    invoke-interface/range {p7 .. p7}, Ll/x20;->call()V

    .line 67
    .line 68
    .line 69
    :cond_2
    move-object v3, v2

    .line 70
    goto/16 :goto_2

    .line 71
    .line 72
    :cond_3
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    const-string v3, ""

    .line 77
    .line 78
    if-eqz v1, :cond_7

    .line 79
    .line 80
    iget-object v1, p2, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 81
    .line 82
    iget-object v4, v2, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 83
    .line 84
    const-string v6, "tickle"

    .line 85
    .line 86
    invoke-static {v4, v6}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 87
    .line 88
    .line 89
    move-result v4

    .line 90
    if-eqz v4, :cond_5

    .line 91
    .line 92
    move-object v4, v3

    .line 93
    move-object v3, v2

    .line 94
    invoke-static {v3}, Lcom/p1/mobile/putong/core/ui/messages/b;->o(Lcom/p1/mobile/putong/core/data/Message;)Ll/bkj0;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    move-result v6

    .line 102
    if-eqz v6, :cond_4

    .line 103
    .line 104
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 105
    .line 106
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 107
    .line 108
    iget-object v6, v2, Ll/bkj0;->a:Ljava/lang/Object;

    .line 109
    .line 110
    check-cast v6, Ljava/lang/String;

    .line 111
    .line 112
    invoke-virtual {v4, v6}, Ll/dkb;->Ma(Ljava/lang/String;)Lrx/c;

    .line 113
    .line 114
    .line 115
    move-result-object v4

    .line 116
    new-instance v6, Ll/td;

    .line 117
    .line 118
    invoke-direct {v6}, Ll/td;-><init>()V

    .line 119
    .line 120
    .line 121
    invoke-virtual {v4, v6}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 122
    .line 123
    .line 124
    move-result-object v4

    .line 125
    sget-object v6, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 126
    .line 127
    iget-object v6, v6, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 128
    .line 129
    iget-object v7, v2, Ll/bkj0;->a:Ljava/lang/Object;

    .line 130
    .line 131
    check-cast v7, Ljava/lang/String;

    .line 132
    .line 133
    invoke-virtual {v6, v1, v7}, Lcom/p1/mobile/putong/core/api/e;->T6(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 134
    .line 135
    .line 136
    move-result-object v6

    .line 137
    new-instance v7, Ll/hh7;

    .line 138
    .line 139
    invoke-direct {v7}, Ll/hh7;-><init>()V

    .line 140
    .line 141
    .line 142
    invoke-virtual {v6, v7}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 143
    .line 144
    .line 145
    move-result-object v6

    .line 146
    sget-object v7, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 147
    .line 148
    iget-object v7, v7, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 149
    .line 150
    iget-object v9, v2, Ll/bkj0;->b:Ljava/lang/Object;

    .line 151
    .line 152
    check-cast v9, Ljava/lang/String;

    .line 153
    .line 154
    invoke-virtual {v7, v1, v9}, Lcom/p1/mobile/putong/core/api/e;->T6(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 155
    .line 156
    .line 157
    move-result-object v1

    .line 158
    new-instance v7, Ll/hh7;

    .line 159
    .line 160
    invoke-direct {v7}, Ll/hh7;-><init>()V

    .line 161
    .line 162
    .line 163
    invoke-virtual {v1, v7}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 164
    .line 165
    .line 166
    move-result-object v1

    .line 167
    new-instance v7, Ll/ijq;

    .line 168
    .line 169
    invoke-direct {v7}, Ll/ijq;-><init>()V

    .line 170
    .line 171
    .line 172
    invoke-static {v4, v6, v1, v7}, Ll/psd0;->s(Lrx/c;Lrx/c;Lrx/c;Ll/scj;)Lrx/c;

    .line 173
    .line 174
    .line 175
    move-result-object v1

    .line 176
    invoke-interface {p4, p5, v1}, Ll/pol;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 177
    .line 178
    .line 179
    move-result-object v0

    .line 180
    const/4 v1, 0x1

    .line 181
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 182
    .line 183
    .line 184
    move-result-object v9

    .line 185
    new-instance v0, Ll/dhk;

    .line 186
    .line 187
    move-object v1, p0

    .line 188
    move-object v4, p2

    .line 189
    move v5, p3

    .line 190
    move-object v6, p5

    .line 191
    move-object/from16 v7, p7

    .line 192
    .line 193
    invoke-direct/range {v0 .. v7}, Ll/dhk;-><init>(Landroid/widget/TextView;Ll/bkj0;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Conversation;ZLcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 194
    .line 195
    .line 196
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 197
    .line 198
    .line 199
    move-result-object p2

    .line 200
    invoke-virtual {v9, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 201
    .line 202
    .line 203
    move-result-object p2

    .line 204
    aput-object p2, p6, p1

    .line 205
    .line 206
    goto/16 :goto_2

    .line 207
    .line 208
    :cond_4
    invoke-virtual {p0, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 209
    .line 210
    .line 211
    invoke-static {p0, p2, v3}, Ll/ihk;->f(Landroid/widget/TextView;Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 212
    .line 213
    .line 214
    invoke-static/range {p7 .. p7}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 215
    .line 216
    .line 217
    move-result p2

    .line 218
    if-eqz p2, :cond_8

    .line 219
    .line 220
    invoke-interface/range {p7 .. p7}, Ll/x20;->call()V

    .line 221
    .line 222
    .line 223
    goto :goto_2

    .line 224
    :cond_5
    move-object v3, v2

    .line 225
    const-string v4, "0"

    .line 226
    .line 227
    iget-object v7, v3, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 228
    .line 229
    invoke-static {v4, v7}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 230
    .line 231
    .line 232
    move-result v4

    .line 233
    if-eqz v4, :cond_6

    .line 234
    .line 235
    new-instance v1, Ll/pf60;

    .line 236
    .line 237
    sget-object v4, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 238
    .line 239
    invoke-direct {v1, v4, v8}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 240
    .line 241
    .line 242
    invoke-static {v1}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 243
    .line 244
    .line 245
    move-result-object v1

    .line 246
    goto :goto_1

    .line 247
    :cond_6
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 248
    .line 249
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 250
    .line 251
    iget-object v7, v3, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 252
    .line 253
    invoke-virtual {v4, v1, v7}, Lcom/p1/mobile/putong/core/api/e;->T6(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 254
    .line 255
    .line 256
    move-result-object v1

    .line 257
    new-instance v4, Ll/ehk;

    .line 258
    .line 259
    invoke-direct {v4}, Ll/ehk;-><init>()V

    .line 260
    .line 261
    .line 262
    invoke-virtual {v1, v4}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 263
    .line 264
    .line 265
    move-result-object v1

    .line 266
    :goto_1
    invoke-interface {p4, p5, v1}, Ll/pol;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 267
    .line 268
    .line 269
    move-result-object v7

    .line 270
    new-instance v0, Ll/fhk;

    .line 271
    .line 272
    move-object v1, p0

    .line 273
    move v4, p3

    .line 274
    move-object v5, p5

    .line 275
    move-object/from16 v6, p7

    .line 276
    .line 277
    move-object v2, v3

    .line 278
    move-object v3, p2

    .line 279
    invoke-direct/range {v0 .. v6}, Ll/fhk;-><init>(Landroid/widget/TextView;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Conversation;ZLcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 280
    .line 281
    .line 282
    move-object v3, v2

    .line 283
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 284
    .line 285
    .line 286
    move-result-object p2

    .line 287
    invoke-virtual {v7, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 288
    .line 289
    .line 290
    move-result-object p2

    .line 291
    aput-object p2, p6, p1

    .line 292
    .line 293
    goto :goto_2

    .line 294
    :cond_7
    move-object v4, v3

    .line 295
    move-object v3, v2

    .line 296
    invoke-virtual {p0, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 297
    .line 298
    .line 299
    invoke-static/range {p7 .. p7}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 300
    .line 301
    .line 302
    move-result p2

    .line 303
    if-eqz p2, :cond_8

    .line 304
    .line 305
    invoke-interface/range {p7 .. p7}, Ll/x20;->call()V

    .line 306
    .line 307
    .line 308
    :cond_8
    :goto_2
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 309
    .line 310
    .line 311
    move-result p2

    .line 312
    if-eqz p2, :cond_9

    .line 313
    .line 314
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/Message;->status()Lcom/p1/mobile/putong/data/LocalStatus;

    .line 315
    .line 316
    .line 317
    move-result-object p2

    .line 318
    const-string p3, "failed"

    .line 319
    .line 320
    invoke-static {p2, p3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 321
    .line 322
    .line 323
    move-result p2

    .line 324
    if-eqz p2, :cond_9

    .line 325
    .line 326
    invoke-virtual {p5}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 327
    .line 328
    .line 329
    move-result-object p2

    .line 330
    sget p3, Ll/ibc0;->b0:I

    .line 331
    .line 332
    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 333
    .line 334
    .line 335
    move-result-object p2

    .line 336
    const/high16 p3, 0x41500000    # 13.0f

    .line 337
    .line 338
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 339
    .line 340
    .line 341
    move-result v0

    .line 342
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 343
    .line 344
    .line 345
    move-result p3

    .line 346
    invoke-virtual {p2, p1, p1, v0, p3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 347
    .line 348
    .line 349
    invoke-virtual {p0, v8, v8, p2, v8}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 350
    .line 351
    .line 352
    return-void

    .line 353
    :cond_9
    invoke-virtual {p0, v8, v8, v8, v8}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 354
    .line 355
    .line 356
    return-void
.end method
