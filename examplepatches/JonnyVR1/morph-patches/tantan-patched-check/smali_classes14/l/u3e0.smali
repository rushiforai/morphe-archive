.class public Ll/u3e0;
.super Ll/o5e0;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/o5e0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Ll/abe0;Ll/z20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/abe0;",
            "Ll/z20<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/u3e0;->c(Ll/abe0;Ll/z20;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-super {p0, p1, p2}, Ll/o5e0;->a(Ll/abe0;Ll/z20;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public c(Ll/abe0;Ll/z20;)Landroid/content/Intent;
    .locals 2
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/abe0;",
            "Ll/z20<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Landroid/content/Intent;"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ll/abe0;->g()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    const-string p2, ""

    .line 10
    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p1}, Ll/abe0;->g()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string v0, "/"

    .line 18
    .line 19
    invoke-virtual {p0, v0, p2}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    :cond_0
    invoke-virtual {p1}, Ll/abe0;->f()Ljava/util/Map;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    const/4 v1, 0x0

    .line 32
    if-nez v0, :cond_2

    .line 33
    .line 34
    const-string v0, "greeting"

    .line 35
    .line 36
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_2

    .line 41
    .line 42
    const-string p2, "userId"

    .line 43
    .line 44
    invoke-interface {p0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object p2

    .line 48
    check-cast p2, Ljava/lang/String;

    .line 49
    .line 50
    const-string v0, "channel"

    .line 51
    .line 52
    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    check-cast p0, Ljava/lang/String;

    .line 57
    .line 58
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-nez v0, :cond_4

    .line 63
    .line 64
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-nez v0, :cond_4

    .line 69
    .line 70
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Greeting;->new_()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    iput-object p2, v0, Lcom/p1/mobile/putong/core/data/Greeting;->otherUser:Ljava/lang/String;

    .line 75
    .line 76
    iput-object p2, v0, Lcom/p1/mobile/putong/core/data/Greeting;->id:Ljava/lang/String;

    .line 77
    .line 78
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 79
    .line 80
    .line 81
    move-result-object p2

    .line 82
    invoke-interface {p2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p2

    .line 86
    iput-object p2, v0, Lcom/p1/mobile/putong/core/data/Greeting;->actorUserId:Ljava/lang/String;

    .line 87
    .line 88
    invoke-static {p0}, Lcom/p1/mobile/putong/data/Channel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Channel;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/Greeting;->channel:Lcom/p1/mobile/putong/data/Channel;

    .line 93
    .line 94
    new-instance p0, Lcom/p1/mobile/putong/core/ui/greet/d$a;

    .line 95
    .line 96
    const-string p2, "card"

    .line 97
    .line 98
    invoke-direct {p0, v0, p2}, Lcom/p1/mobile/putong/core/ui/greet/d$a;-><init>(Lcom/p1/mobile/putong/core/data/Greeting;Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {p1}, Ll/abe0;->b()Landroid/content/Context;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    invoke-static {p1}, Ll/bnl0;->D(Landroid/content/Context;)Landroid/app/Activity;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    if-eqz p1, :cond_1

    .line 110
    .line 111
    instance-of p2, p1, Lcom/p1/mobile/android/app/Act;

    .line 112
    .line 113
    if-eqz p2, :cond_1

    .line 114
    .line 115
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 116
    .line 117
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/core/ui/greet/d;->a(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/greet/d$a;)V

    .line 118
    .line 119
    .line 120
    :cond_1
    return-object v1

    .line 121
    :cond_2
    const-string p0, "receive_message_setting"

    .line 122
    .line 123
    invoke-static {p0, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 124
    .line 125
    .line 126
    move-result p0

    .line 127
    if-eqz p0, :cond_4

    .line 128
    .line 129
    invoke-virtual {p1}, Ll/abe0;->b()Landroid/content/Context;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    instance-of p0, p0, Lcom/p1/mobile/android/app/Act;

    .line 134
    .line 135
    if-eqz p0, :cond_3

    .line 136
    .line 137
    invoke-virtual {p1}, Ll/abe0;->b()Landroid/content/Context;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 142
    .line 143
    new-instance p1, Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg;

    .line 144
    .line 145
    sget-object p2, Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg$FilterFrom;->MSG_DEEPLINK:Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg$FilterFrom;

    .line 146
    .line 147
    invoke-direct {p1, p0, p2}, Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/filter/FilterVerificationUserMsgDlg$FilterFrom;)V

    .line 148
    .line 149
    .line 150
    invoke-virtual {p1}, Landroid/app/Dialog;->show()V

    .line 151
    .line 152
    .line 153
    :cond_3
    return-object v1

    .line 154
    :cond_4
    invoke-virtual {p1}, Ll/abe0;->f()Ljava/util/Map;

    .line 155
    .line 156
    .line 157
    move-result-object p0

    .line 158
    const-string p2, "uid"

    .line 159
    .line 160
    invoke-interface {p0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 161
    .line 162
    .line 163
    move-result-object p0

    .line 164
    check-cast p0, Ljava/lang/String;

    .line 165
    .line 166
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 167
    .line 168
    .line 169
    move-result-object p2

    .line 170
    invoke-interface {p2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->signedIn_()Z

    .line 171
    .line 172
    .line 173
    move-result p2

    .line 174
    if-eqz p2, :cond_5

    .line 175
    .line 176
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 177
    .line 178
    .line 179
    move-result p2

    .line 180
    if-nez p2, :cond_5

    .line 181
    .line 182
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 183
    .line 184
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 185
    .line 186
    invoke-virtual {p2, p0}, Lcom/p1/mobile/putong/core/api/g;->Xe(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 187
    .line 188
    .line 189
    move-result-object p2

    .line 190
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 191
    .line 192
    .line 193
    move-result v0

    .line 194
    if-eqz v0, :cond_5

    .line 195
    .line 196
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 197
    .line 198
    const-string v0, "default"

    .line 199
    .line 200
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 201
    .line 202
    .line 203
    move-result p2

    .line 204
    if-eqz p2, :cond_5

    .line 205
    .line 206
    invoke-virtual {p1}, Ll/abe0;->f()Ljava/util/Map;

    .line 207
    .line 208
    .line 209
    move-result-object p2

    .line 210
    const-string v0, "pushtype"

    .line 211
    .line 212
    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 213
    .line 214
    .line 215
    move-result-object p2

    .line 216
    check-cast p2, Ljava/lang/String;

    .line 217
    .line 218
    invoke-virtual {p1}, Ll/abe0;->f()Ljava/util/Map;

    .line 219
    .line 220
    .line 221
    move-result-object p2

    .line 222
    const-string v0, "showKeyboard"

    .line 223
    .line 224
    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 225
    .line 226
    .line 227
    move-result-object p2

    .line 228
    check-cast p2, Ljava/lang/String;

    .line 229
    .line 230
    invoke-static {p2}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    .line 231
    .line 232
    .line 233
    move-result p2

    .line 234
    invoke-virtual {p1}, Ll/abe0;->b()Landroid/content/Context;

    .line 235
    .line 236
    .line 237
    move-result-object v0

    .line 238
    const/4 v1, 0x1

    .line 239
    invoke-static {v0, p0, v1, p2}, Ll/xwa;->o(Landroid/content/Context;Ljava/lang/String;IZ)Landroid/content/Intent;

    .line 240
    .line 241
    .line 242
    move-result-object v1

    .line 243
    :cond_5
    if-nez v1, :cond_6

    .line 244
    .line 245
    invoke-virtual {p1}, Ll/abe0;->b()Landroid/content/Context;

    .line 246
    .line 247
    .line 248
    move-result-object p0

    .line 249
    invoke-static {p0}, Ll/xwa;->e(Landroid/content/Context;)Landroid/content/Intent;

    .line 250
    .line 251
    .line 252
    move-result-object p0

    .line 253
    return-object p0

    .line 254
    :cond_6
    return-object v1
.end method
