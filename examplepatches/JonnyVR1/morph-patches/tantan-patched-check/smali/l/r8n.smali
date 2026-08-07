.class public Ll/r8n;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static volatile p:Ll/r8n;


# instance fields
.field public a:Ll/dji;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/dji<",
            "Lcom/p1/mobile/putong/core/data/InsertConversationsList;",
            ">;"
        }
    .end annotation
.end field

.field public b:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/putong/core/data/InsertConversationsList;",
            ">;"
        }
    .end annotation
.end field

.field public c:Ll/kcg0;

.field public d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/InsertConversationUser;",
            ">;"
        }
    .end annotation
.end field

.field public e:Ll/byd0;

.field public f:Ll/wyd0;

.field public g:Ll/jxd0;

.field public h:Ll/xyd0;

.field public i:Ll/wyd0;

.field public j:Ll/jxd0;

.field public k:Ll/wyd0;

.field public l:Ll/byd0;

.field public m:Ll/xyd0;

.field public n:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public o:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 6

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/dji;

    .line 5
    .line 6
    new-instance v1, Ll/vod;

    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    const-string v3, "intl_chat_request_insert_users"

    .line 17
    .line 18
    const-string v4, "_1"

    .line 19
    .line 20
    invoke-direct {v1, v3, v4, v2}, Ll/vod;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    const/4 v2, -0x1

    .line 24
    sget-object v3, Lcom/p1/mobile/putong/core/data/InsertConversationsList;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 25
    .line 26
    invoke-direct {v0, v1, v2, v3}, Ll/dji;-><init>(Ll/dji$b;ILcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 27
    .line 28
    .line 29
    iput-object v0, p0, Ll/r8n;->a:Ll/dji;

    .line 30
    .line 31
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iput-object v0, p0, Ll/r8n;->b:Lrx/subjects/a;

    .line 36
    .line 37
    new-instance v0, Ll/byd0;

    .line 38
    .line 39
    new-instance v1, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    const-string v2, "last_time_insert_chat_request"

    .line 42
    .line 43
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    const-wide/16 v2, 0x0

    .line 62
    .line 63
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    invoke-direct {v0, v1, v2}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 68
    .line 69
    .line 70
    iput-object v0, p0, Ll/r8n;->e:Ll/byd0;

    .line 71
    .line 72
    new-instance v0, Ll/wyd0;

    .line 73
    .line 74
    new-instance v1, Ljava/lang/StringBuilder;

    .line 75
    .line 76
    const-string v3, "current_click_chat_request_user_id"

    .line 77
    .line 78
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 82
    .line 83
    .line 84
    move-result-object v3

    .line 85
    invoke-interface {v3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v3

    .line 89
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    const-string v3, ""

    .line 97
    .line 98
    invoke-direct {v0, v1, v3}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    iput-object v0, p0, Ll/r8n;->f:Ll/wyd0;

    .line 102
    .line 103
    new-instance v0, Ll/jxd0;

    .line 104
    .line 105
    new-instance v1, Ljava/lang/StringBuilder;

    .line 106
    .line 107
    const-string v4, "intl_has_chat_request_request"

    .line 108
    .line 109
    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 113
    .line 114
    .line 115
    move-result-object v4

    .line 116
    invoke-interface {v4}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v4

    .line 120
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    sget-object v4, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 128
    .line 129
    invoke-direct {v0, v1, v4}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 130
    .line 131
    .line 132
    iput-object v0, p0, Ll/r8n;->g:Ll/jxd0;

    .line 133
    .line 134
    new-instance v0, Ll/xyd0;

    .line 135
    .line 136
    new-instance v1, Ljava/util/HashSet;

    .line 137
    .line 138
    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 139
    .line 140
    .line 141
    const-string v5, "ignore_chat_request_user_set"

    .line 142
    .line 143
    invoke-direct {v0, v5, v1}, Ll/xyd0;-><init>(Ljava/lang/String;Ljava/util/HashSet;)V

    .line 144
    .line 145
    .line 146
    iput-object v0, p0, Ll/r8n;->h:Ll/xyd0;

    .line 147
    .line 148
    new-instance v0, Ll/wyd0;

    .line 149
    .line 150
    new-instance v1, Ljava/lang/StringBuilder;

    .line 151
    .line 152
    const-string v5, "current_ignore_chat_request_user_id"

    .line 153
    .line 154
    invoke-direct {v1, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 155
    .line 156
    .line 157
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 158
    .line 159
    .line 160
    move-result-object v5

    .line 161
    invoke-interface {v5}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object v5

    .line 165
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object v1

    .line 172
    invoke-direct {v0, v1, v3}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 173
    .line 174
    .line 175
    iput-object v0, p0, Ll/r8n;->i:Ll/wyd0;

    .line 176
    .line 177
    new-instance v0, Ll/jxd0;

    .line 178
    .line 179
    new-instance v1, Ljava/lang/StringBuilder;

    .line 180
    .line 181
    const-string v5, "intl_chat_request_chat_list_mv"

    .line 182
    .line 183
    invoke-direct {v1, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 184
    .line 185
    .line 186
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 187
    .line 188
    .line 189
    move-result-object v5

    .line 190
    invoke-interface {v5}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 191
    .line 192
    .line 193
    move-result-object v5

    .line 194
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 195
    .line 196
    .line 197
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 198
    .line 199
    .line 200
    move-result-object v1

    .line 201
    invoke-direct {v0, v1, v4}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 202
    .line 203
    .line 204
    iput-object v0, p0, Ll/r8n;->j:Ll/jxd0;

    .line 205
    .line 206
    new-instance v0, Ll/wyd0;

    .line 207
    .line 208
    new-instance v1, Ljava/lang/StringBuilder;

    .line 209
    .line 210
    const-string v4, "intl_chat_request_match_user"

    .line 211
    .line 212
    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 213
    .line 214
    .line 215
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 216
    .line 217
    .line 218
    move-result-object v4

    .line 219
    invoke-interface {v4}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 220
    .line 221
    .line 222
    move-result-object v4

    .line 223
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 224
    .line 225
    .line 226
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 227
    .line 228
    .line 229
    move-result-object v1

    .line 230
    invoke-direct {v0, v1, v3}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 231
    .line 232
    .line 233
    iput-object v0, p0, Ll/r8n;->k:Ll/wyd0;

    .line 234
    .line 235
    new-instance v0, Ll/byd0;

    .line 236
    .line 237
    new-instance v1, Ljava/lang/StringBuilder;

    .line 238
    .line 239
    const-string v4, "last_chat_request_on_top_time_"

    .line 240
    .line 241
    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 242
    .line 243
    .line 244
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 245
    .line 246
    .line 247
    move-result-object v4

    .line 248
    invoke-interface {v4}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 249
    .line 250
    .line 251
    move-result-object v4

    .line 252
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 253
    .line 254
    .line 255
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 256
    .line 257
    .line 258
    move-result-object v1

    .line 259
    invoke-direct {v0, v1, v2}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 260
    .line 261
    .line 262
    iput-object v0, p0, Ll/r8n;->l:Ll/byd0;

    .line 263
    .line 264
    new-instance v0, Ll/xyd0;

    .line 265
    .line 266
    new-instance v1, Ljava/lang/StringBuilder;

    .line 267
    .line 268
    const-string v2, "chat_request_match_set_"

    .line 269
    .line 270
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 271
    .line 272
    .line 273
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 274
    .line 275
    .line 276
    move-result-object v2

    .line 277
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 278
    .line 279
    .line 280
    move-result-object v2

    .line 281
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 282
    .line 283
    .line 284
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 285
    .line 286
    .line 287
    move-result-object v1

    .line 288
    new-instance v2, Ljava/util/HashSet;

    .line 289
    .line 290
    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 291
    .line 292
    .line 293
    invoke-direct {v0, v1, v2}, Ll/xyd0;-><init>(Ljava/lang/String;Ljava/util/HashSet;)V

    .line 294
    .line 295
    .line 296
    iput-object v0, p0, Ll/r8n;->m:Ll/xyd0;

    .line 297
    .line 298
    new-instance v0, Ljava/util/ArrayList;

    .line 299
    .line 300
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 301
    .line 302
    .line 303
    iput-object v0, p0, Ll/r8n;->n:Ljava/util/List;

    .line 304
    .line 305
    iput-object v3, p0, Ll/r8n;->o:Ljava/lang/String;

    .line 306
    .line 307
    return-void
.end method

.method public static synthetic a(Ll/r8n;ZLjava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/r8n;->l(ZLjava/lang/String;Z)V

    return-void
.end method

.method public static f()Ll/r8n;
    .locals 2

    .line 1
    sget-object v0, Ll/r8n;->p:Ll/r8n;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/r8n;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/r8n;->p:Ll/r8n;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/r8n;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/r8n;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/r8n;->p:Ll/r8n;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, Ll/r8n;->p:Ll/r8n;

    .line 27
    .line 28
    return-object v0
.end method

.method public static i(D)Z
    .locals 4

    .line 1
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    double-to-long p0, p0

    .line 6
    invoke-virtual {v0, p0, p1}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 7
    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const/16 v2, 0x7b2

    .line 15
    .line 16
    if-gt v0, v2, :cond_0

    .line 17
    .line 18
    return v1

    .line 19
    :cond_0
    sget-object v0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 22
    .line 23
    .line 24
    move-result-wide v2

    .line 25
    sub-long/2addr v2, p0

    .line 26
    const-wide/16 p0, 0x3e8

    .line 27
    .line 28
    div-long/2addr v2, p0

    .line 29
    const-wide/16 p0, 0x12c

    .line 30
    .line 31
    cmp-long p0, v2, p0

    .line 32
    .line 33
    if-gez p0, :cond_1

    .line 34
    .line 35
    return v1

    .line 36
    :cond_1
    const/4 p0, 0x0

    .line 37
    return p0
.end method


# virtual methods
.method public final b()Ljava/lang/String;
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->H2:Lrx/subjects/a;

    .line 6
    .line 7
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

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
    const-string v1, ""

    .line 16
    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    return-object v1

    .line 20
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 23
    .line 24
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->H2:Lrx/subjects/a;

    .line 25
    .line 26
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Ll/vg60;

    .line 31
    .line 32
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 33
    .line 34
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    if-nez v2, :cond_6

    .line 39
    .line 40
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    const/4 v3, 0x2

    .line 45
    if-ge v2, v3, :cond_1

    .line 46
    .line 47
    goto/16 :goto_2

    .line 48
    .line 49
    :cond_1
    new-instance v2, Ljava/util/HashSet;

    .line 50
    .line 51
    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 52
    .line 53
    .line 54
    iget-object v3, p0, Ll/r8n;->b:Lrx/subjects/a;

    .line 55
    .line 56
    invoke-virtual {v3}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    if-eqz v3, :cond_2

    .line 61
    .line 62
    iget-object v3, p0, Ll/r8n;->b:Lrx/subjects/a;

    .line 63
    .line 64
    invoke-virtual {v3}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    check-cast v3, Lcom/p1/mobile/putong/core/data/InsertConversationsList;

    .line 69
    .line 70
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/InsertConversationsList;->users:Ljava/util/List;

    .line 71
    .line 72
    invoke-static {v3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 73
    .line 74
    .line 75
    move-result v3

    .line 76
    if-nez v3, :cond_2

    .line 77
    .line 78
    iget-object p0, p0, Ll/r8n;->b:Lrx/subjects/a;

    .line 79
    .line 80
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    check-cast p0, Lcom/p1/mobile/putong/core/data/InsertConversationsList;

    .line 85
    .line 86
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/InsertConversationsList;->users:Ljava/util/List;

    .line 87
    .line 88
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 93
    .line 94
    .line 95
    move-result v3

    .line 96
    if-eqz v3, :cond_2

    .line 97
    .line 98
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object v3

    .line 102
    check-cast v3, Lcom/p1/mobile/putong/core/data/InsertConversationUser;

    .line 103
    .line 104
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/InsertConversationUser;->userId:Ljava/lang/String;

    .line 105
    .line 106
    invoke-interface {v2, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 107
    .line 108
    .line 109
    goto :goto_0

    .line 110
    :cond_2
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->d:Ll/yy6;

    .line 111
    .line 112
    invoke-virtual {p0}, Ll/yy6;->G()Lcom/p1/mobile/putong/core/data/SpecialCard;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    if-eqz p0, :cond_3

    .line 117
    .line 118
    invoke-static {}, Lcom/p1/mobile/putong/core/api/a0;->j()Lcom/p1/mobile/putong/core/api/a0;

    .line 119
    .line 120
    .line 121
    move-result-object v3

    .line 122
    iget-object v4, p0, Lcom/p1/mobile/putong/core/data/SpecialCard;->device_OS:Lcom/p1/mobile/putong/core/data/DeviceType;

    .line 123
    .line 124
    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/core/api/a0;->p(Lcom/p1/mobile/putong/core/data/DeviceType;)Z

    .line 125
    .line 126
    .line 127
    move-result v3

    .line 128
    if-eqz v3, :cond_3

    .line 129
    .line 130
    invoke-static {}, Lcom/p1/mobile/putong/core/api/a0;->j()Lcom/p1/mobile/putong/core/api/a0;

    .line 131
    .line 132
    .line 133
    move-result-object v3

    .line 134
    iget-object v4, p0, Lcom/p1/mobile/putong/core/data/SpecialCard;->signup_country:Ljava/util/List;

    .line 135
    .line 136
    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/core/api/a0;->o(Ljava/util/List;)Z

    .line 137
    .line 138
    .line 139
    move-result v3

    .line 140
    if-eqz v3, :cond_3

    .line 141
    .line 142
    invoke-static {}, Lcom/p1/mobile/putong/core/api/a0;->j()Lcom/p1/mobile/putong/core/api/a0;

    .line 143
    .line 144
    .line 145
    move-result-object v3

    .line 146
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/SpecialCard;->gender:Lcom/p1/mobile/putong/core/data/SpecialCardGender;

    .line 147
    .line 148
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 149
    .line 150
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 151
    .line 152
    invoke-virtual {v4}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 153
    .line 154
    .line 155
    move-result-object v4

    .line 156
    invoke-virtual {v3, p0, v4}, Lcom/p1/mobile/putong/core/api/a0;->q(Lcom/p1/mobile/putong/core/data/SpecialCardGender;Lcom/p1/mobile/putong/data/User;)Z

    .line 157
    .line 158
    .line 159
    move-result p0

    .line 160
    if-eqz p0, :cond_3

    .line 161
    .line 162
    const/4 p0, 0x1

    .line 163
    goto :goto_1

    .line 164
    :cond_3
    const/4 p0, 0x0

    .line 165
    :goto_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 166
    .line 167
    .line 168
    move-result v3

    .line 169
    if-ge p0, v3, :cond_6

    .line 170
    .line 171
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 172
    .line 173
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 174
    .line 175
    invoke-interface {v0, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 176
    .line 177
    .line 178
    move-result-object v4

    .line 179
    check-cast v4, Ljava/lang/String;

    .line 180
    .line 181
    invoke-virtual {v3, v4}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 182
    .line 183
    .line 184
    move-result-object v3

    .line 185
    invoke-interface {v0, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 186
    .line 187
    .line 188
    move-result-object v4

    .line 189
    invoke-interface {v2, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 190
    .line 191
    .line 192
    move-result v4

    .line 193
    if-nez v4, :cond_5

    .line 194
    .line 195
    if-eqz v3, :cond_4

    .line 196
    .line 197
    invoke-static {v3}, Lcom/p1/mobile/putong/data/User;->isMatched(Lcom/p1/mobile/putong/data/User;)Z

    .line 198
    .line 199
    .line 200
    move-result v3

    .line 201
    if-nez v3, :cond_5

    .line 202
    .line 203
    :cond_4
    invoke-interface {v0, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 204
    .line 205
    .line 206
    move-result-object p0

    .line 207
    check-cast p0, Ljava/lang/String;

    .line 208
    .line 209
    return-object p0

    .line 210
    :cond_5
    add-int/lit8 p0, p0, 0x1

    .line 211
    .line 212
    goto :goto_1

    .line 213
    :cond_6
    :goto_2
    return-object v1
.end method

.method public c(Ljava/lang/String;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/r8n;->b:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_2

    .line 9
    .line 10
    iget-object v0, p0, Ll/r8n;->b:Lrx/subjects/a;

    .line 11
    .line 12
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Lcom/p1/mobile/putong/core/data/InsertConversationsList;

    .line 17
    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/InsertConversationsList;->users:Ljava/util/List;

    .line 19
    .line 20
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    iget-object p0, p0, Ll/r8n;->b:Lrx/subjects/a;

    .line 28
    .line 29
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    check-cast p0, Lcom/p1/mobile/putong/core/data/InsertConversationsList;

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/InsertConversationsList;->users:Ljava/util/List;

    .line 36
    .line 37
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    :cond_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_2

    .line 46
    .line 47
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    check-cast v0, Lcom/p1/mobile/putong/core/data/InsertConversationUser;

    .line 52
    .line 53
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/InsertConversationUser;->userId:Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-eqz v0, :cond_1

    .line 60
    .line 61
    const/4 p0, 0x1

    .line 62
    return p0

    .line 63
    :cond_2
    :goto_0
    return v1
.end method

.method public final d(Ljava/util/List;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/InsertConversationUser;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/InsertConversationUser;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->H2:Lrx/subjects/a;

    .line 6
    .line 7
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

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
    if-eqz v0, :cond_5

    .line 16
    .line 17
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->H2:Lrx/subjects/a;

    .line 22
    .line 23
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Ll/vg60;

    .line 28
    .line 29
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 30
    .line 31
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_0

    .line 36
    .line 37
    goto/16 :goto_1

    .line 38
    .line 39
    :cond_0
    new-instance v0, Ljava/util/HashSet;

    .line 40
    .line 41
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 42
    .line 43
    .line 44
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 45
    .line 46
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 47
    .line 48
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested;->H2:Lrx/subjects/a;

    .line 49
    .line 50
    invoke-virtual {v1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    check-cast v1, Ll/vg60;

    .line 55
    .line 56
    iget-object v1, v1, Ll/vg60;->a:Ljava/util/List;

    .line 57
    .line 58
    invoke-interface {v0, v1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 59
    .line 60
    .line 61
    new-instance v1, Ljava/util/ArrayList;

    .line 62
    .line 63
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 64
    .line 65
    .line 66
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    :cond_1
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 71
    .line 72
    .line 73
    move-result v2

    .line 74
    if-eqz v2, :cond_4

    .line 75
    .line 76
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    check-cast v2, Lcom/p1/mobile/putong/core/data/InsertConversationUser;

    .line 81
    .line 82
    iget-object v3, v2, Lcom/p1/mobile/putong/core/data/InsertConversationUser;->userId:Ljava/lang/String;

    .line 83
    .line 84
    invoke-interface {v0, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    move-result v3

    .line 88
    const-string v4, "intlSeeChatRequest"

    .line 89
    .line 90
    if-eqz v3, :cond_3

    .line 91
    .line 92
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 93
    .line 94
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 95
    .line 96
    iget-object v5, v2, Lcom/p1/mobile/putong/core/data/InsertConversationUser;->userId:Ljava/lang/String;

    .line 97
    .line 98
    invoke-virtual {v3, v5}, Lcom/p1/mobile/putong/core/api/g;->Xe(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 99
    .line 100
    .line 101
    move-result-object v3

    .line 102
    if-eqz v3, :cond_2

    .line 103
    .line 104
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 105
    .line 106
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 107
    .line 108
    iget-object v5, v2, Lcom/p1/mobile/putong/core/data/InsertConversationUser;->userId:Ljava/lang/String;

    .line 109
    .line 110
    invoke-virtual {v3, v5}, Lcom/p1/mobile/putong/core/api/g;->Xe(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 111
    .line 112
    .line 113
    move-result-object v3

    .line 114
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 115
    .line 116
    invoke-static {v3, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 117
    .line 118
    .line 119
    move-result v3

    .line 120
    if-eqz v3, :cond_3

    .line 121
    .line 122
    :cond_2
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    goto :goto_0

    .line 126
    :cond_3
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 127
    .line 128
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 129
    .line 130
    iget-object v5, v2, Lcom/p1/mobile/putong/core/data/InsertConversationUser;->userId:Ljava/lang/String;

    .line 131
    .line 132
    invoke-virtual {v3, v5}, Lcom/p1/mobile/putong/core/api/g;->Xe(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 133
    .line 134
    .line 135
    move-result-object v3

    .line 136
    if-eqz v3, :cond_1

    .line 137
    .line 138
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 139
    .line 140
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 141
    .line 142
    iget-object v5, v2, Lcom/p1/mobile/putong/core/data/InsertConversationUser;->userId:Ljava/lang/String;

    .line 143
    .line 144
    invoke-virtual {v3, v5}, Lcom/p1/mobile/putong/core/api/g;->Xe(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 145
    .line 146
    .line 147
    move-result-object v3

    .line 148
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 149
    .line 150
    invoke-static {v3, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 151
    .line 152
    .line 153
    move-result v3

    .line 154
    if-nez v3, :cond_1

    .line 155
    .line 156
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/InsertConversationUser;->userId:Ljava/lang/String;

    .line 157
    .line 158
    const/4 v3, 0x1

    .line 159
    invoke-virtual {p0, v2, v3}, Ll/r8n;->r(Ljava/lang/String;Z)V

    .line 160
    .line 161
    .line 162
    goto :goto_0

    .line 163
    :cond_4
    return-object v1

    .line 164
    :cond_5
    :goto_1
    return-object p1
.end method

.method public e(I)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/InsertConversationUser;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/r8n;->d:Ljava/util/List;

    .line 7
    .line 8
    iget-object v0, p0, Ll/r8n;->b:Lrx/subjects/a;

    .line 9
    .line 10
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Ll/r8n;->b:Lrx/subjects/a;

    .line 17
    .line 18
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Lcom/p1/mobile/putong/core/data/InsertConversationsList;

    .line 23
    .line 24
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/InsertConversationsList;->users:Ljava/util/List;

    .line 25
    .line 26
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-nez v0, :cond_0

    .line 31
    .line 32
    iget-object v0, p0, Ll/r8n;->d:Ljava/util/List;

    .line 33
    .line 34
    iget-object v1, p0, Ll/r8n;->b:Lrx/subjects/a;

    .line 35
    .line 36
    invoke-virtual {v1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    check-cast v1, Lcom/p1/mobile/putong/core/data/InsertConversationsList;

    .line 41
    .line 42
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/InsertConversationsList;->users:Ljava/util/List;

    .line 43
    .line 44
    invoke-virtual {p0, v1}, Ll/r8n;->d(Ljava/util/List;)Ljava/util/List;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 49
    .line 50
    .line 51
    :cond_0
    invoke-static {}, Ll/rbb0;->q()Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-nez v0, :cond_1

    .line 56
    .line 57
    iget-object p0, p0, Ll/r8n;->d:Ljava/util/List;

    .line 58
    .line 59
    return-object p0

    .line 60
    :cond_1
    const/4 v0, 0x3

    .line 61
    if-gt p1, v0, :cond_2

    .line 62
    .line 63
    const/4 v0, 0x1

    .line 64
    goto :goto_0

    .line 65
    :cond_2
    const/4 v1, 0x7

    .line 66
    if-gt p1, v1, :cond_3

    .line 67
    .line 68
    const/4 v0, 0x2

    .line 69
    :cond_3
    :goto_0
    iget-object p1, p0, Ll/r8n;->d:Ljava/util/List;

    .line 70
    .line 71
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    if-le v0, p1, :cond_4

    .line 76
    .line 77
    invoke-virtual {p0}, Ll/r8n;->k()Z

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    if-eqz p1, :cond_4

    .line 82
    .line 83
    invoke-virtual {p0}, Ll/r8n;->b()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    if-nez v0, :cond_4

    .line 92
    .line 93
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 94
    .line 95
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 96
    .line 97
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->m8()Lrx/c;

    .line 98
    .line 99
    .line 100
    invoke-static {}, Lcom/p1/mobile/putong/core/data/InsertConversationUser;->new_()Lcom/p1/mobile/putong/core/data/InsertConversationUser;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    iput-object p1, v0, Lcom/p1/mobile/putong/core/data/InsertConversationUser;->userId:Ljava/lang/String;

    .line 105
    .line 106
    invoke-static {}, Ll/pzi0;->o()J

    .line 107
    .line 108
    .line 109
    move-result-wide v1

    .line 110
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/InsertConversationUser;->timeStamp:Ljava/lang/Long;

    .line 115
    .line 116
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 117
    .line 118
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/InsertConversationUser;->clicked:Ljava/lang/Boolean;

    .line 119
    .line 120
    iget-object v1, p0, Ll/r8n;->d:Ljava/util/List;

    .line 121
    .line 122
    const/4 v2, 0x0

    .line 123
    invoke-interface {v1, v2, v0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 124
    .line 125
    .line 126
    invoke-static {}, Lcom/p1/mobile/putong/core/data/InsertConversationsList;->new_()Lcom/p1/mobile/putong/core/data/InsertConversationsList;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/InsertConversationsList;->users:Ljava/util/List;

    .line 131
    .line 132
    iget-object v2, p0, Ll/r8n;->d:Ljava/util/List;

    .line 133
    .line 134
    invoke-interface {v1, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 135
    .line 136
    .line 137
    iget-object v1, p0, Ll/r8n;->b:Lrx/subjects/a;

    .line 138
    .line 139
    invoke-virtual {v1, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 140
    .line 141
    .line 142
    iget-object v0, p0, Ll/r8n;->e:Ll/byd0;

    .line 143
    .line 144
    invoke-static {}, Ll/pzi0;->o()J

    .line 145
    .line 146
    .line 147
    move-result-wide v1

    .line 148
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 149
    .line 150
    .line 151
    move-result-object v1

    .line 152
    invoke-virtual {v0, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 153
    .line 154
    .line 155
    invoke-virtual {p0, p1}, Ll/r8n;->q(Ljava/lang/String;)V

    .line 156
    .line 157
    .line 158
    :cond_4
    iget-object p0, p0, Ll/r8n;->d:Ljava/util/List;

    .line 159
    .line 160
    return-object p0
.end method

.method public g(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;)V"
        }
    .end annotation

    return-void

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

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
    if-eqz v1, :cond_5

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    goto/16 :goto_0

    .line 22
    .line 23
    :cond_0
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isBanned()Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_2

    .line 28
    .line 29
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_1

    .line 34
    .line 35
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 36
    .line 37
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_1

    .line 42
    .line 43
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 44
    .line 45
    const-string v1, "hidden"

    .line 46
    .line 47
    invoke-static {v1}, Lcom/p1/mobile/putong/data/UserStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/UserStatus;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-nez v0, :cond_2

    .line 56
    .line 57
    :cond_1
    iget-object p1, p0, Ll/r8n;->a:Ll/dji;

    .line 58
    .line 59
    invoke-virtual {p1}, Ll/dji;->c()V

    .line 60
    .line 61
    .line 62
    invoke-static {}, Lcom/p1/mobile/putong/core/data/InsertConversationsList;->new_()Lcom/p1/mobile/putong/core/data/InsertConversationsList;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    iget-object p0, p0, Ll/r8n;->b:Lrx/subjects/a;

    .line 67
    .line 68
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    :cond_2
    invoke-virtual {p0}, Ll/r8n;->h()Z

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-nez v0, :cond_3

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_3
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 80
    .line 81
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 82
    .line 83
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->H2:Lrx/subjects/a;

    .line 84
    .line 85
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    if-eqz v0, :cond_4

    .line 94
    .line 95
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 96
    .line 97
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 98
    .line 99
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->H2:Lrx/subjects/a;

    .line 100
    .line 101
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    check-cast v0, Ll/vg60;

    .line 106
    .line 107
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 108
    .line 109
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    if-eqz v0, :cond_4

    .line 114
    .line 115
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 116
    .line 117
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 118
    .line 119
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->H2:Lrx/subjects/a;

    .line 120
    .line 121
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    check-cast v0, Ll/vg60;

    .line 126
    .line 127
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 128
    .line 129
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    iget-object v1, p0, Ll/r8n;->h:Ll/xyd0;

    .line 134
    .line 135
    invoke-virtual {v1}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    check-cast v1, Ljava/util/HashSet;

    .line 140
    .line 141
    invoke-virtual {v1}, Ljava/util/HashSet;->size()I

    .line 142
    .line 143
    .line 144
    move-result v1

    .line 145
    add-int/2addr v0, v1

    .line 146
    const/4 v1, 0x3

    .line 147
    if-ge v0, v1, :cond_4

    .line 148
    .line 149
    goto :goto_0

    .line 150
    :cond_4
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 151
    .line 152
    .line 153
    move-result v0

    .line 154
    invoke-virtual {p0, v0}, Ll/r8n;->e(I)Ljava/util/List;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    invoke-virtual {p0, p1, v0}, Ll/r8n;->m(Ljava/util/List;Ljava/util/List;)Ljava/util/List;

    .line 159
    .line 160
    .line 161
    move-result-object p0

    .line 162
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 163
    .line 164
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 165
    .line 166
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/api/g;->Rg(Ljava/util/List;)V

    .line 167
    .line 168
    .line 169
    :cond_5
    :goto_0
    return-void
.end method

.method public final h()Z
    .locals 4

    .line 1
    invoke-static {}, Ll/pzi0;->n()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    iget-wide v2, p0, Lcom/p1/mobile/putong/data/User;->createdTime:D

    .line 14
    .line 15
    double-to-long v2, v2

    .line 16
    invoke-static {v2, v3}, Ll/tzi0;->c(J)J

    .line 17
    .line 18
    .line 19
    move-result-wide v2

    .line 20
    sub-long/2addr v0, v2

    .line 21
    const-wide/32 v2, 0x5265c00

    .line 22
    .line 23
    .line 24
    div-long/2addr v0, v2

    .line 25
    long-to-int p0, v0

    .line 26
    const/4 v0, 0x1

    .line 27
    if-lt p0, v0, :cond_0

    .line 28
    .line 29
    return v0

    .line 30
    :cond_0
    const/4 p0, 0x0

    .line 31
    return p0
.end method

.method public j(I)Z
    .locals 6

    .line 1
    const/4 p0, 0x0

    .line 2
    if-gtz p1, :cond_0

    .line 3
    .line 4
    return p0

    .line 5
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->f()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x1

    .line 10
    if-eqz v0, :cond_2

    .line 11
    .line 12
    int-to-double v2, p1

    .line 13
    const-wide v4, 0x3f445cae56c00036L    # 6.214E-4

    .line 14
    .line 15
    .line 16
    .line 17
    .line 18
    mul-double/2addr v2, v4

    .line 19
    const-wide/high16 v4, 0x4024000000000000L    # 10.0

    .line 20
    .line 21
    cmpg-double p1, v2, v4

    .line 22
    .line 23
    if-gez p1, :cond_1

    .line 24
    .line 25
    return v1

    .line 26
    :cond_1
    return p0

    .line 27
    :cond_2
    const/16 v0, 0x2710

    .line 28
    .line 29
    if-ge p1, v0, :cond_3

    .line 30
    .line 31
    return v1

    .line 32
    :cond_3
    return p0
.end method

.method public final k()Z
    .locals 4

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-object p0, p0, Ll/r8n;->e:Ll/byd0;

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
    move-result-wide v2

    .line 17
    sub-long/2addr v0, v2

    .line 18
    const-wide/32 v2, 0x5265c00

    .line 19
    .line 20
    .line 21
    cmp-long p0, v0, v2

    .line 22
    .line 23
    if-ltz p0, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return p0
.end method

.method public final synthetic l(ZLjava/lang/String;Z)V
    .locals 9

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/data/InsertConversationsList;->new_()Lcom/p1/mobile/putong/core/data/InsertConversationsList;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    iget-object v2, p0, Ll/r8n;->b:Lrx/subjects/a;

    .line 11
    .line 12
    invoke-virtual {v2}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-eqz v2, :cond_0

    .line 21
    .line 22
    iget-object v2, p0, Ll/r8n;->b:Lrx/subjects/a;

    .line 23
    .line 24
    invoke-virtual {v2}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    check-cast v2, Lcom/p1/mobile/putong/core/data/InsertConversationsList;

    .line 29
    .line 30
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/InsertConversationsList;->users:Ljava/util/List;

    .line 31
    .line 32
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    if-nez v2, :cond_0

    .line 37
    .line 38
    iget-object v1, p0, Ll/r8n;->b:Lrx/subjects/a;

    .line 39
    .line 40
    invoke-virtual {v1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    check-cast v1, Lcom/p1/mobile/putong/core/data/InsertConversationsList;

    .line 45
    .line 46
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/InsertConversationsList;->users:Ljava/util/List;

    .line 47
    .line 48
    :cond_0
    new-instance v2, Ljava/util/ArrayList;

    .line 49
    .line 50
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-static {}, Lcom/p1/mobile/putong/core/data/InsertConversationUser;->new_()Lcom/p1/mobile/putong/core/data/InsertConversationUser;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    const/4 v4, 0x0

    .line 62
    move v5, v4

    .line 63
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 64
    .line 65
    .line 66
    move-result v6

    .line 67
    if-eqz v6, :cond_3

    .line 68
    .line 69
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v6

    .line 73
    check-cast v6, Lcom/p1/mobile/putong/core/data/InsertConversationUser;

    .line 74
    .line 75
    if-eqz p1, :cond_1

    .line 76
    .line 77
    iget-object v7, v6, Lcom/p1/mobile/putong/core/data/InsertConversationUser;->userId:Ljava/lang/String;

    .line 78
    .line 79
    invoke-virtual {p2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    move-result v7

    .line 83
    if-eqz v7, :cond_1

    .line 84
    .line 85
    iget-object v6, p0, Ll/r8n;->g:Ll/jxd0;

    .line 86
    .line 87
    sget-object v7, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 88
    .line 89
    invoke-virtual {v6, v7}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_1
    iget-object v7, v6, Lcom/p1/mobile/putong/core/data/InsertConversationUser;->userId:Ljava/lang/String;

    .line 94
    .line 95
    invoke-virtual {p2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    move-result v7

    .line 99
    if-eqz v7, :cond_2

    .line 100
    .line 101
    invoke-static {}, Ll/pzi0;->o()J

    .line 102
    .line 103
    .line 104
    move-result-wide v7

    .line 105
    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 106
    .line 107
    .line 108
    move-result-object v5

    .line 109
    iput-object v5, v6, Lcom/p1/mobile/putong/core/data/InsertConversationUser;->timeStamp:Ljava/lang/Long;

    .line 110
    .line 111
    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 112
    .line 113
    .line 114
    move-result-object v5

    .line 115
    iput-object v5, v6, Lcom/p1/mobile/putong/core/data/InsertConversationUser;->clicked:Ljava/lang/Boolean;

    .line 116
    .line 117
    iget-object v5, v6, Lcom/p1/mobile/putong/core/data/InsertConversationUser;->userId:Ljava/lang/String;

    .line 118
    .line 119
    iput-object v5, v3, Lcom/p1/mobile/putong/core/data/InsertConversationUser;->userId:Ljava/lang/String;

    .line 120
    .line 121
    iget-object v5, p0, Ll/r8n;->g:Ll/jxd0;

    .line 122
    .line 123
    sget-object v6, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 124
    .line 125
    invoke-virtual {v5, v6}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 126
    .line 127
    .line 128
    const/4 v5, 0x1

    .line 129
    goto :goto_0

    .line 130
    :cond_2
    invoke-interface {v2, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 131
    .line 132
    .line 133
    goto :goto_0

    .line 134
    :cond_3
    if-eqz v5, :cond_4

    .line 135
    .line 136
    invoke-static {}, Ll/pzi0;->o()J

    .line 137
    .line 138
    .line 139
    move-result-wide v6

    .line 140
    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 141
    .line 142
    .line 143
    move-result-object v1

    .line 144
    iput-object v1, v3, Lcom/p1/mobile/putong/core/data/InsertConversationUser;->timeStamp:Ljava/lang/Long;

    .line 145
    .line 146
    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 147
    .line 148
    .line 149
    move-result-object p3

    .line 150
    iput-object p3, v3, Lcom/p1/mobile/putong/core/data/InsertConversationUser;->clicked:Ljava/lang/Boolean;

    .line 151
    .line 152
    invoke-interface {v2, v4, v3}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 153
    .line 154
    .line 155
    :cond_4
    if-nez v5, :cond_5

    .line 156
    .line 157
    if-nez p1, :cond_5

    .line 158
    .line 159
    invoke-static {}, Lcom/p1/mobile/putong/core/data/InsertConversationUser;->new_()Lcom/p1/mobile/putong/core/data/InsertConversationUser;

    .line 160
    .line 161
    .line 162
    move-result-object p3

    .line 163
    iput-object p2, p3, Lcom/p1/mobile/putong/core/data/InsertConversationUser;->userId:Ljava/lang/String;

    .line 164
    .line 165
    invoke-static {}, Ll/pzi0;->o()J

    .line 166
    .line 167
    .line 168
    move-result-wide v3

    .line 169
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 170
    .line 171
    .line 172
    move-result-object v1

    .line 173
    iput-object v1, p3, Lcom/p1/mobile/putong/core/data/InsertConversationUser;->timeStamp:Ljava/lang/Long;

    .line 174
    .line 175
    invoke-interface {v2, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 176
    .line 177
    .line 178
    :cond_5
    if-eqz p1, :cond_6

    .line 179
    .line 180
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 181
    .line 182
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 183
    .line 184
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/api/g;->zf(Ljava/lang/String;)V

    .line 185
    .line 186
    .line 187
    :cond_6
    iget-object p1, v0, Lcom/p1/mobile/putong/core/data/InsertConversationsList;->users:Ljava/util/List;

    .line 188
    .line 189
    invoke-interface {p1, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 190
    .line 191
    .line 192
    iget-object p1, p0, Ll/r8n;->a:Ll/dji;

    .line 193
    .line 194
    invoke-virtual {p1}, Ll/dji;->c()V

    .line 195
    .line 196
    .line 197
    iget-object p1, p0, Ll/r8n;->a:Ll/dji;

    .line 198
    .line 199
    invoke-virtual {p1, v0}, Ll/dji;->p(Ljava/lang/Object;)V

    .line 200
    .line 201
    .line 202
    iget-object p0, p0, Ll/r8n;->b:Lrx/subjects/a;

    .line 203
    .line 204
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 205
    .line 206
    .line 207
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 208
    .line 209
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 210
    .line 211
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/api/g;->Rg(Ljava/util/List;)V

    .line 212
    .line 213
    .line 214
    return-void
.end method

.method public declared-synchronized m(Ljava/util/List;Ljava/util/List;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/InsertConversationUser;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/InsertConversationUser;",
            ">;"
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Ll/r8n;->o:Ljava/lang/String;

    .line 15
    .line 16
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 17
    .line 18
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 19
    .line 20
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->publicId:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-nez v0, :cond_0

    .line 31
    .line 32
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 33
    .line 34
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 35
    .line 36
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->publicId:Ljava/lang/String;

    .line 41
    .line 42
    iput-object v0, p0, Ll/r8n;->o:Ljava/lang/String;

    .line 43
    .line 44
    const/4 v0, 0x0

    .line 45
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    check-cast v1, Lcom/p1/mobile/putong/core/data/InsertConversationUser;

    .line 50
    .line 51
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/InsertConversationUser;->timeStamp:Ljava/lang/Long;

    .line 52
    .line 53
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    .line 54
    .line 55
    .line 56
    move-result-wide v2

    .line 57
    long-to-double v2, v2

    .line 58
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    check-cast p1, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 63
    .line 64
    iget-wide v4, p1, Lcom/p1/mobile/putong/core/data/Conversation;->updatedTime:D

    .line 65
    .line 66
    cmpg-double p1, v2, v4

    .line 67
    .line 68
    if-gez p1, :cond_0

    .line 69
    .line 70
    invoke-static {}, Ll/pzi0;->o()J

    .line 71
    .line 72
    .line 73
    move-result-wide v2

    .line 74
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/InsertConversationUser;->timeStamp:Ljava/lang/Long;

    .line 79
    .line 80
    invoke-static {}, Lcom/p1/mobile/putong/core/data/InsertConversationsList;->new_()Lcom/p1/mobile/putong/core/data/InsertConversationsList;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/InsertConversationsList;->users:Ljava/util/List;

    .line 85
    .line 86
    invoke-interface {v2, p2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 87
    .line 88
    .line 89
    iget-object v2, p0, Ll/r8n;->b:Lrx/subjects/a;

    .line 90
    .line 91
    invoke-virtual {v2, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 92
    .line 93
    .line 94
    iget-object p1, v1, Lcom/p1/mobile/putong/core/data/InsertConversationUser;->userId:Ljava/lang/String;

    .line 95
    .line 96
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/InsertConversationUser;->clicked:Ljava/lang/Boolean;

    .line 97
    .line 98
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 99
    .line 100
    .line 101
    move-result v1

    .line 102
    invoke-virtual {p0, p1, v0, v1}, Ll/r8n;->s(Ljava/lang/String;ZZ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 103
    .line 104
    .line 105
    goto :goto_0

    .line 106
    :catchall_0
    move-exception p1

    .line 107
    goto :goto_1

    .line 108
    :cond_0
    :goto_0
    monitor-exit p0

    .line 109
    return-object p2

    .line 110
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 111
    throw p1
.end method

.method public n(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/r8n;->b:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/r8n;->b:Lrx/subjects/a;

    .line 10
    .line 11
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Lcom/p1/mobile/putong/core/data/InsertConversationsList;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/InsertConversationsList;->users:Ljava/util/List;

    .line 18
    .line 19
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    invoke-static {}, Ll/r8n;->f()Ll/r8n;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-object v0, v0, Ll/r8n;->g:Ll/jxd0;

    .line 31
    .line 32
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 38
    .line 39
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 40
    .line 41
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/g;->Fo()Lrx/c;

    .line 42
    .line 43
    .line 44
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->A2()V

    .line 45
    .line 46
    .line 47
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 48
    .line 49
    const/4 v0, 0x1

    .line 50
    invoke-virtual {p0, p1, v0}, Ll/r8n;->r(Ljava/lang/String;Z)V

    .line 51
    .line 52
    .line 53
    :cond_1
    :goto_0
    return-void
.end method

.method public o()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/r8n;->k:Ll/wyd0;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/r8n;->c:Ll/kcg0;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const/4 v1, 0x0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Ll/r8n;->c:Ll/kcg0;

    .line 18
    .line 19
    invoke-interface {v0}, Ll/kcg0;->unsubscribe()V

    .line 20
    .line 21
    .line 22
    iput-object v1, p0, Ll/r8n;->c:Ll/kcg0;

    .line 23
    .line 24
    :cond_0
    sput-object v1, Ll/r8n;->p:Ll/r8n;

    .line 25
    .line 26
    return-void
.end method

.method public p(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/r8n;->m:Ll/xyd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/util/HashSet;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/r8n;->m:Ll/xyd0;

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Ll/dyd0;->put(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public q(Ljava/lang/String;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Ll/r8n;->r(Ljava/lang/String;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public r(Ljava/lang/String;Z)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Ll/r8n;->s(Ljava/lang/String;ZZ)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public s(Ljava/lang/String;ZZ)V
    .locals 1

    .line 1
    new-instance v0, Ll/q8n;

    .line 2
    .line 3
    invoke-direct {v0, p0, p2, p1, p3}, Ll/q8n;-><init>(Ll/r8n;ZLjava/lang/String;Z)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
