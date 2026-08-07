.class public Ll/umg;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Ll/byd0;

.field public static b:Ll/vxd0;

.field public static c:Ll/byd0;

.field public static d:Ll/vxd0;

.field public static e:Ll/byd0;

.field public static f:Ll/vxd0;

.field public static g:Ll/byd0;

.field public static h:Ll/byd0;

.field public static i:Ll/byd0;

.field public static j:Ll/vxd0;

.field public static k:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    new-instance v0, Ll/byd0;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "last_show_unread_activities_tips_time_"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    const-wide/16 v2, 0x0

    .line 26
    .line 27
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-direct {v0, v1, v2}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 32
    .line 33
    .line 34
    sput-object v0, Ll/umg;->a:Ll/byd0;

    .line 35
    .line 36
    new-instance v0, Ll/vxd0;

    .line 37
    .line 38
    new-instance v1, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    const-string v3, "show_unread_activities_tips_count_"

    .line 41
    .line 42
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    invoke-interface {v3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    const/4 v3, 0x0

    .line 61
    invoke-direct {v0, v1, v3}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 62
    .line 63
    .line 64
    sput-object v0, Ll/umg;->b:Ll/vxd0;

    .line 65
    .line 66
    new-instance v0, Ll/byd0;

    .line 67
    .line 68
    new-instance v1, Ljava/lang/StringBuilder;

    .line 69
    .line 70
    const-string v4, "last_show_all_read_activities_tips_time_"

    .line 71
    .line 72
    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 76
    .line 77
    .line 78
    move-result-object v4

    .line 79
    invoke-interface {v4}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v4

    .line 83
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    invoke-direct {v0, v1, v2}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 91
    .line 92
    .line 93
    sput-object v0, Ll/umg;->c:Ll/byd0;

    .line 94
    .line 95
    new-instance v0, Ll/vxd0;

    .line 96
    .line 97
    new-instance v1, Ljava/lang/StringBuilder;

    .line 98
    .line 99
    const-string v4, "show_all_read_activities_tips_count_"

    .line 100
    .line 101
    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 105
    .line 106
    .line 107
    move-result-object v4

    .line 108
    invoke-interface {v4}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v4

    .line 112
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    invoke-direct {v0, v1, v3}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 120
    .line 121
    .line 122
    sput-object v0, Ll/umg;->d:Ll/vxd0;

    .line 123
    .line 124
    new-instance v0, Ll/byd0;

    .line 125
    .line 126
    new-instance v1, Ljava/lang/StringBuilder;

    .line 127
    .line 128
    const-string v4, "last_show_all_read_activities_dialog_time_"

    .line 129
    .line 130
    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 134
    .line 135
    .line 136
    move-result-object v4

    .line 137
    invoke-interface {v4}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object v4

    .line 141
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object v1

    .line 148
    invoke-direct {v0, v1, v2}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 149
    .line 150
    .line 151
    sput-object v0, Ll/umg;->e:Ll/byd0;

    .line 152
    .line 153
    new-instance v0, Ll/vxd0;

    .line 154
    .line 155
    new-instance v1, Ljava/lang/StringBuilder;

    .line 156
    .line 157
    const-string v4, "show_all_read_activities_dialog_count_"

    .line 158
    .line 159
    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 160
    .line 161
    .line 162
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 163
    .line 164
    .line 165
    move-result-object v4

    .line 166
    invoke-interface {v4}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object v4

    .line 170
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 171
    .line 172
    .line 173
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object v1

    .line 177
    invoke-direct {v0, v1, v3}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 178
    .line 179
    .line 180
    sput-object v0, Ll/umg;->f:Ll/vxd0;

    .line 181
    .line 182
    new-instance v0, Ll/byd0;

    .line 183
    .line 184
    new-instance v1, Ljava/lang/StringBuilder;

    .line 185
    .line 186
    const-string v4, "last_auto_clear_unread_activities_time_"

    .line 187
    .line 188
    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 189
    .line 190
    .line 191
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 192
    .line 193
    .line 194
    move-result-object v4

    .line 195
    invoke-interface {v4}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object v4

    .line 199
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 200
    .line 201
    .line 202
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 203
    .line 204
    .line 205
    move-result-object v1

    .line 206
    invoke-direct {v0, v1, v2}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 207
    .line 208
    .line 209
    sput-object v0, Ll/umg;->g:Ll/byd0;

    .line 210
    .line 211
    new-instance v0, Ll/byd0;

    .line 212
    .line 213
    new-instance v1, Ljava/lang/StringBuilder;

    .line 214
    .line 215
    const-string v4, "last_ignore_all_read_activities_dialog_time_"

    .line 216
    .line 217
    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 218
    .line 219
    .line 220
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 221
    .line 222
    .line 223
    move-result-object v4

    .line 224
    invoke-interface {v4}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 225
    .line 226
    .line 227
    move-result-object v4

    .line 228
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 229
    .line 230
    .line 231
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 232
    .line 233
    .line 234
    move-result-object v1

    .line 235
    invoke-direct {v0, v1, v2}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 236
    .line 237
    .line 238
    sput-object v0, Ll/umg;->h:Ll/byd0;

    .line 239
    .line 240
    new-instance v0, Ll/byd0;

    .line 241
    .line 242
    new-instance v1, Ljava/lang/StringBuilder;

    .line 243
    .line 244
    const-string v4, "last_upgrades_all_read_activities_dialog_time_"

    .line 245
    .line 246
    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 247
    .line 248
    .line 249
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 250
    .line 251
    .line 252
    move-result-object v4

    .line 253
    invoke-interface {v4}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 254
    .line 255
    .line 256
    move-result-object v4

    .line 257
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 258
    .line 259
    .line 260
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 261
    .line 262
    .line 263
    move-result-object v1

    .line 264
    invoke-direct {v0, v1, v2}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 265
    .line 266
    .line 267
    sput-object v0, Ll/umg;->i:Ll/byd0;

    .line 268
    .line 269
    new-instance v0, Ll/vxd0;

    .line 270
    .line 271
    new-instance v1, Ljava/lang/StringBuilder;

    .line 272
    .line 273
    const-string v2, "show_upgrades_all_read_activities_dialog_count_"

    .line 274
    .line 275
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 276
    .line 277
    .line 278
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 279
    .line 280
    .line 281
    move-result-object v2

    .line 282
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 283
    .line 284
    .line 285
    move-result-object v2

    .line 286
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 287
    .line 288
    .line 289
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 290
    .line 291
    .line 292
    move-result-object v1

    .line 293
    invoke-direct {v0, v1, v3}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 294
    .line 295
    .line 296
    sput-object v0, Ll/umg;->j:Ll/vxd0;

    .line 297
    .line 298
    const-string v0, "e_all_read_remind_popup"

    .line 299
    .line 300
    sput-object v0, Ll/umg;->k:Ljava/lang/String;

    .line 301
    .line 302
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a()V
    .locals 3

    .line 1
    sget-object v0, Ll/umg;->e:Ll/byd0;

    .line 2
    .line 3
    invoke-static {}, Ll/pzi0;->o()J

    .line 4
    .line 5
    .line 6
    move-result-wide v1

    .line 7
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    sget-object v0, Ll/umg;->f:Ll/vxd0;

    .line 15
    .line 16
    const/4 v1, 0x2

    .line 17
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static b(I)Z
    .locals 13

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    invoke-static {}, Ll/cmg;->p()Z

    .line 7
    .line 8
    .line 9
    move-result v2

    .line 10
    const/4 v3, 0x0

    .line 11
    if-eqz v2, :cond_8

    .line 12
    .line 13
    sget-object v2, Ll/umg;->i:Ll/byd0;

    .line 14
    .line 15
    invoke-virtual {v2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    check-cast v2, Ljava/lang/Long;

    .line 20
    .line 21
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    .line 22
    .line 23
    .line 24
    move-result-wide v4

    .line 25
    sget-object v2, Ll/umg;->e:Ll/byd0;

    .line 26
    .line 27
    invoke-virtual {v2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    check-cast v2, Ljava/lang/Long;

    .line 32
    .line 33
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    .line 34
    .line 35
    .line 36
    move-result-wide v6

    .line 37
    sget-object v2, Ll/umg;->f:Ll/vxd0;

    .line 38
    .line 39
    invoke-virtual {v2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    check-cast v2, Ljava/lang/Integer;

    .line 44
    .line 45
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    sget-object v8, Ll/umg;->c:Ll/byd0;

    .line 50
    .line 51
    invoke-virtual {v8}, Ll/azd0;->get()Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v8

    .line 55
    check-cast v8, Ljava/lang/Long;

    .line 56
    .line 57
    invoke-virtual {v8}, Ljava/lang/Long;->longValue()J

    .line 58
    .line 59
    .line 60
    move-result-wide v8

    .line 61
    sget-object v10, Ll/umg;->d:Ll/vxd0;

    .line 62
    .line 63
    invoke-virtual {v10}, Ll/azd0;->get()Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v10

    .line 67
    check-cast v10, Ljava/lang/Integer;

    .line 68
    .line 69
    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    .line 70
    .line 71
    .line 72
    move-result v10

    .line 73
    invoke-static {v6, v7}, Ll/p6i;->m(J)Z

    .line 74
    .line 75
    .line 76
    move-result v11

    .line 77
    if-nez v11, :cond_0

    .line 78
    .line 79
    sget-object v11, Ll/umg;->f:Ll/vxd0;

    .line 80
    .line 81
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 82
    .line 83
    .line 84
    move-result-object v12

    .line 85
    invoke-virtual {v11, v12}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    :cond_0
    invoke-static {}, Ll/umg;->g()I

    .line 89
    .line 90
    .line 91
    move-result v11

    .line 92
    if-ge p0, v11, :cond_1

    .line 93
    .line 94
    return v3

    .line 95
    :cond_1
    const/4 p0, 0x3

    .line 96
    if-ge v10, p0, :cond_2

    .line 97
    .line 98
    return v3

    .line 99
    :cond_2
    const-wide/16 v10, 0x0

    .line 100
    .line 101
    cmp-long p0, v8, v10

    .line 102
    .line 103
    if-lez p0, :cond_3

    .line 104
    .line 105
    invoke-static {v8, v9}, Landroid/text/format/DateUtils;->isToday(J)Z

    .line 106
    .line 107
    .line 108
    move-result p0

    .line 109
    if-eqz p0, :cond_3

    .line 110
    .line 111
    return v3

    .line 112
    :cond_3
    cmp-long p0, v6, v10

    .line 113
    .line 114
    if-lez p0, :cond_4

    .line 115
    .line 116
    invoke-static {v6, v7}, Landroid/text/format/DateUtils;->isToday(J)Z

    .line 117
    .line 118
    .line 119
    move-result v8

    .line 120
    if-eqz v8, :cond_4

    .line 121
    .line 122
    return v3

    .line 123
    :cond_4
    cmp-long v8, v4, v10

    .line 124
    .line 125
    if-lez v8, :cond_5

    .line 126
    .line 127
    invoke-static {v4, v5}, Landroid/text/format/DateUtils;->isToday(J)Z

    .line 128
    .line 129
    .line 130
    move-result v4

    .line 131
    if-eqz v4, :cond_5

    .line 132
    .line 133
    return v3

    .line 134
    :cond_5
    if-gtz p0, :cond_6

    .line 135
    .line 136
    sget-object p0, Ll/umg;->e:Ll/byd0;

    .line 137
    .line 138
    invoke-static {}, Ll/pzi0;->o()J

    .line 139
    .line 140
    .line 141
    move-result-wide v2

    .line 142
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 143
    .line 144
    .line 145
    move-result-object v2

    .line 146
    invoke-virtual {p0, v2}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 147
    .line 148
    .line 149
    sget-object p0, Ll/umg;->f:Ll/vxd0;

    .line 150
    .line 151
    invoke-virtual {p0, v1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 152
    .line 153
    .line 154
    return v0

    .line 155
    :cond_6
    invoke-static {v6, v7}, Ll/p6i;->m(J)Z

    .line 156
    .line 157
    .line 158
    move-result p0

    .line 159
    if-nez p0, :cond_7

    .line 160
    .line 161
    sget-object p0, Ll/umg;->e:Ll/byd0;

    .line 162
    .line 163
    invoke-static {}, Ll/pzi0;->o()J

    .line 164
    .line 165
    .line 166
    move-result-wide v2

    .line 167
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 168
    .line 169
    .line 170
    move-result-object v2

    .line 171
    invoke-virtual {p0, v2}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 172
    .line 173
    .line 174
    sget-object p0, Ll/umg;->f:Ll/vxd0;

    .line 175
    .line 176
    invoke-virtual {p0, v1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 177
    .line 178
    .line 179
    return v0

    .line 180
    :cond_7
    const/4 p0, 0x2

    .line 181
    if-ge v2, p0, :cond_8

    .line 182
    .line 183
    sget-object p0, Ll/umg;->e:Ll/byd0;

    .line 184
    .line 185
    invoke-static {}, Ll/pzi0;->o()J

    .line 186
    .line 187
    .line 188
    move-result-wide v3

    .line 189
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 190
    .line 191
    .line 192
    move-result-object v1

    .line 193
    invoke-virtual {p0, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 194
    .line 195
    .line 196
    sget-object p0, Ll/umg;->f:Ll/vxd0;

    .line 197
    .line 198
    add-int/2addr v2, v0

    .line 199
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 200
    .line 201
    .line 202
    move-result-object v1

    .line 203
    invoke-virtual {p0, v1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 204
    .line 205
    .line 206
    return v0

    .line 207
    :cond_8
    return v3
.end method

.method public static c(II)Z
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    if-gtz p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    const-string p1, "unreadnoticenumber"

    .line 6
    .line 7
    invoke-static {p1}, Ll/umg;->h(Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-ge p0, p1, :cond_1

    .line 12
    .line 13
    return v0

    .line 14
    :cond_1
    sget-object p0, Ll/umg;->h:Ll/byd0;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Ljava/lang/Long;

    .line 21
    .line 22
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 23
    .line 24
    .line 25
    move-result-wide p0

    .line 26
    sget-object v1, Ll/umg;->i:Ll/byd0;

    .line 27
    .line 28
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    check-cast v1, Ljava/lang/Long;

    .line 33
    .line 34
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 35
    .line 36
    .line 37
    move-result-wide v1

    .line 38
    invoke-static {v1, v2}, Ll/p6i;->m(J)Z

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    if-nez v3, :cond_2

    .line 43
    .line 44
    sget-object v3, Ll/umg;->j:Ll/vxd0;

    .line 45
    .line 46
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 47
    .line 48
    .line 49
    move-result-object v4

    .line 50
    invoke-virtual {v3, v4}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    :cond_2
    const-wide/16 v3, 0x0

    .line 54
    .line 55
    cmp-long v5, v1, v3

    .line 56
    .line 57
    if-lez v5, :cond_3

    .line 58
    .line 59
    invoke-static {v1, v2}, Landroid/text/format/DateUtils;->isToday(J)Z

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    if-eqz v1, :cond_3

    .line 64
    .line 65
    return v0

    .line 66
    :cond_3
    sget-object v1, Ll/umg;->j:Ll/vxd0;

    .line 67
    .line 68
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    check-cast v1, Ljava/lang/Integer;

    .line 73
    .line 74
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    const-string v2, "unreadguidepopshownumber"

    .line 79
    .line 80
    invoke-static {v2}, Ll/umg;->h(Ljava/lang/String;)I

    .line 81
    .line 82
    .line 83
    move-result v2

    .line 84
    if-lt v1, v2, :cond_4

    .line 85
    .line 86
    return v0

    .line 87
    :cond_4
    cmp-long v2, p0, v3

    .line 88
    .line 89
    const/4 v3, 0x1

    .line 90
    if-lez v2, :cond_5

    .line 91
    .line 92
    invoke-static {p0, p1}, Landroid/text/format/DateUtils;->isToday(J)Z

    .line 93
    .line 94
    .line 95
    move-result p0

    .line 96
    if-nez p0, :cond_5

    .line 97
    .line 98
    sget-object p0, Ll/umg;->i:Ll/byd0;

    .line 99
    .line 100
    invoke-static {}, Ll/pzi0;->o()J

    .line 101
    .line 102
    .line 103
    move-result-wide v4

    .line 104
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    invoke-virtual {p0, p1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    sget-object p0, Ll/umg;->j:Ll/vxd0;

    .line 112
    .line 113
    add-int/2addr v1, v3

    .line 114
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    invoke-virtual {p0, p1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 119
    .line 120
    .line 121
    return v3

    .line 122
    :cond_5
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    invoke-interface {p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 131
    .line 132
    .line 133
    move-result p1

    .line 134
    if-eqz p1, :cond_6

    .line 135
    .line 136
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 137
    .line 138
    .line 139
    move-result p0

    .line 140
    if-eqz p0, :cond_6

    .line 141
    .line 142
    sget-object p0, Ll/umg;->i:Ll/byd0;

    .line 143
    .line 144
    invoke-static {}, Ll/pzi0;->o()J

    .line 145
    .line 146
    .line 147
    move-result-wide v4

    .line 148
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    invoke-virtual {p0, p1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 153
    .line 154
    .line 155
    sget-object p0, Ll/umg;->j:Ll/vxd0;

    .line 156
    .line 157
    add-int/2addr v1, v3

    .line 158
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 159
    .line 160
    .line 161
    move-result-object p1

    .line 162
    invoke-virtual {p0, p1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 163
    .line 164
    .line 165
    return v3

    .line 166
    :cond_6
    return v0
.end method

.method public static d(I)Z
    .locals 8

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    invoke-static {}, Ll/cmg;->p()Z

    .line 7
    .line 8
    .line 9
    move-result v2

    .line 10
    const/4 v3, 0x0

    .line 11
    if-eqz v2, :cond_4

    .line 12
    .line 13
    sget-object v2, Ll/umg;->c:Ll/byd0;

    .line 14
    .line 15
    invoke-virtual {v2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    check-cast v2, Ljava/lang/Long;

    .line 20
    .line 21
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    .line 22
    .line 23
    .line 24
    move-result-wide v4

    .line 25
    sget-object v2, Ll/umg;->d:Ll/vxd0;

    .line 26
    .line 27
    invoke-virtual {v2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    check-cast v2, Ljava/lang/Integer;

    .line 32
    .line 33
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    invoke-static {}, Ll/umg;->g()I

    .line 38
    .line 39
    .line 40
    move-result v6

    .line 41
    if-ge p0, v6, :cond_0

    .line 42
    .line 43
    return v3

    .line 44
    :cond_0
    const-wide/16 v6, 0x0

    .line 45
    .line 46
    cmp-long p0, v4, v6

    .line 47
    .line 48
    if-lez p0, :cond_1

    .line 49
    .line 50
    invoke-static {v4, v5}, Landroid/text/format/DateUtils;->isToday(J)Z

    .line 51
    .line 52
    .line 53
    move-result v6

    .line 54
    if-eqz v6, :cond_1

    .line 55
    .line 56
    return v3

    .line 57
    :cond_1
    if-gtz p0, :cond_2

    .line 58
    .line 59
    sget-object p0, Ll/umg;->c:Ll/byd0;

    .line 60
    .line 61
    invoke-static {}, Ll/pzi0;->o()J

    .line 62
    .line 63
    .line 64
    move-result-wide v2

    .line 65
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    invoke-virtual {p0, v2}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    sget-object p0, Ll/umg;->d:Ll/vxd0;

    .line 73
    .line 74
    invoke-virtual {p0, v1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    return v0

    .line 78
    :cond_2
    invoke-static {v4, v5}, Ll/p6i;->m(J)Z

    .line 79
    .line 80
    .line 81
    move-result p0

    .line 82
    if-nez p0, :cond_3

    .line 83
    .line 84
    sget-object p0, Ll/umg;->c:Ll/byd0;

    .line 85
    .line 86
    invoke-static {}, Ll/pzi0;->o()J

    .line 87
    .line 88
    .line 89
    move-result-wide v2

    .line 90
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    invoke-virtual {p0, v2}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    sget-object p0, Ll/umg;->d:Ll/vxd0;

    .line 98
    .line 99
    invoke-virtual {p0, v1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    return v0

    .line 103
    :cond_3
    const/4 p0, 0x3

    .line 104
    if-ge v2, p0, :cond_4

    .line 105
    .line 106
    sget-object p0, Ll/umg;->c:Ll/byd0;

    .line 107
    .line 108
    invoke-static {}, Ll/pzi0;->o()J

    .line 109
    .line 110
    .line 111
    move-result-wide v3

    .line 112
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    invoke-virtual {p0, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 117
    .line 118
    .line 119
    sget-object p0, Ll/umg;->d:Ll/vxd0;

    .line 120
    .line 121
    add-int/2addr v2, v0

    .line 122
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 123
    .line 124
    .line 125
    move-result-object v1

    .line 126
    invoke-virtual {p0, v1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 127
    .line 128
    .line 129
    return v0

    .line 130
    :cond_4
    return v3
.end method

.method public static e(I)Z
    .locals 8

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    invoke-static {}, Ll/cmg;->p()Z

    .line 7
    .line 8
    .line 9
    move-result v2

    .line 10
    const/4 v3, 0x0

    .line 11
    if-eqz v2, :cond_4

    .line 12
    .line 13
    sget-object v2, Ll/umg;->a:Ll/byd0;

    .line 14
    .line 15
    invoke-virtual {v2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    check-cast v2, Ljava/lang/Long;

    .line 20
    .line 21
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    .line 22
    .line 23
    .line 24
    move-result-wide v4

    .line 25
    sget-object v2, Ll/umg;->b:Ll/vxd0;

    .line 26
    .line 27
    invoke-virtual {v2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    check-cast v2, Ljava/lang/Integer;

    .line 32
    .line 33
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    invoke-static {}, Ll/umg;->g()I

    .line 38
    .line 39
    .line 40
    move-result v6

    .line 41
    if-ge p0, v6, :cond_0

    .line 42
    .line 43
    return v3

    .line 44
    :cond_0
    const-wide/16 v6, 0x0

    .line 45
    .line 46
    cmp-long p0, v4, v6

    .line 47
    .line 48
    if-lez p0, :cond_1

    .line 49
    .line 50
    invoke-static {v4, v5}, Landroid/text/format/DateUtils;->isToday(J)Z

    .line 51
    .line 52
    .line 53
    move-result v6

    .line 54
    if-eqz v6, :cond_1

    .line 55
    .line 56
    return v3

    .line 57
    :cond_1
    if-gtz p0, :cond_2

    .line 58
    .line 59
    sget-object p0, Ll/umg;->a:Ll/byd0;

    .line 60
    .line 61
    invoke-static {}, Ll/pzi0;->o()J

    .line 62
    .line 63
    .line 64
    move-result-wide v2

    .line 65
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    invoke-virtual {p0, v2}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    sget-object p0, Ll/umg;->b:Ll/vxd0;

    .line 73
    .line 74
    invoke-virtual {p0, v1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    return v0

    .line 78
    :cond_2
    invoke-static {v4, v5}, Ll/p6i;->m(J)Z

    .line 79
    .line 80
    .line 81
    move-result p0

    .line 82
    if-nez p0, :cond_3

    .line 83
    .line 84
    sget-object p0, Ll/umg;->a:Ll/byd0;

    .line 85
    .line 86
    invoke-static {}, Ll/pzi0;->o()J

    .line 87
    .line 88
    .line 89
    move-result-wide v2

    .line 90
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    invoke-virtual {p0, v2}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    sget-object p0, Ll/umg;->b:Ll/vxd0;

    .line 98
    .line 99
    invoke-virtual {p0, v1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    return v0

    .line 103
    :cond_3
    const/4 p0, 0x3

    .line 104
    if-ge v2, p0, :cond_4

    .line 105
    .line 106
    sget-object p0, Ll/umg;->a:Ll/byd0;

    .line 107
    .line 108
    invoke-static {}, Ll/pzi0;->o()J

    .line 109
    .line 110
    .line 111
    move-result-wide v3

    .line 112
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    invoke-virtual {p0, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 117
    .line 118
    .line 119
    sget-object p0, Ll/umg;->b:Ll/vxd0;

    .line 120
    .line 121
    add-int/2addr v2, v0

    .line 122
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 123
    .line 124
    .line 125
    move-result-object v1

    .line 126
    invoke-virtual {p0, v1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 127
    .line 128
    .line 129
    return v0

    .line 130
    :cond_4
    return v3
.end method

.method public static f()Z
    .locals 2

    .line 1
    :try_start_0
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "moment_unread_notes"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->F(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    new-instance v1, Lorg/json/JSONObject;

    .line 18
    .line 19
    invoke-direct {v1, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    const-string v0, "autoClearSwitch"

    .line 23
    .line 24
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    .line 25
    .line 26
    .line 27
    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 28
    return v0

    .line 29
    :catch_0
    :cond_0
    const/4 v0, 0x0

    .line 30
    return v0
.end method

.method public static g()I
    .locals 2

    .line 1
    :try_start_0
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "moment_unread_notes"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->F(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    new-instance v1, Lorg/json/JSONObject;

    .line 18
    .line 19
    invoke-direct {v1, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    const-string v0, "unreadNotes"

    .line 23
    .line 24
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 28
    return v0

    .line 29
    :catch_0
    :cond_0
    const/16 v0, 0x64

    .line 30
    .line 31
    return v0
.end method

.method public static h(Ljava/lang/String;)I
    .locals 2

    .line 1
    :try_start_0
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "moment_unread_notes"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->F(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    new-instance v1, Lorg/json/JSONObject;

    .line 18
    .line 19
    invoke-direct {v1, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 26
    return p0

    .line 27
    :catch_0
    :cond_0
    const-string v0, "unreadnoticenumber"

    .line 28
    .line 29
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    const/16 p0, 0x32

    .line 36
    .line 37
    return p0

    .line 38
    :cond_1
    const-string v0, "unreadguidepopshownumber"

    .line 39
    .line 40
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    if-eqz p0, :cond_2

    .line 45
    .line 46
    const/4 p0, 0x3

    .line 47
    return p0

    .line 48
    :cond_2
    const/16 p0, 0x64

    .line 49
    .line 50
    return p0
.end method

.method public static i()Z
    .locals 5

    .line 1
    sget-object v0, Ll/umg;->f:Ll/vxd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Integer;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    sget-object v1, Ll/umg;->g:Ll/byd0;

    .line 14
    .line 15
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Ljava/lang/Long;

    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 22
    .line 23
    .line 24
    move-result-wide v1

    .line 25
    const/4 v3, 0x2

    .line 26
    if-ne v0, v3, :cond_1

    .line 27
    .line 28
    sget-object v0, Ll/umg;->e:Ll/byd0;

    .line 29
    .line 30
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Ljava/lang/Long;

    .line 35
    .line 36
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 37
    .line 38
    .line 39
    move-result-wide v3

    .line 40
    invoke-static {v3, v4}, Ll/p6i;->m(J)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_1

    .line 45
    .line 46
    invoke-static {}, Ll/umg;->f()Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-eqz v0, :cond_1

    .line 51
    .line 52
    const-wide/16 v3, 0x0

    .line 53
    .line 54
    cmp-long v0, v1, v3

    .line 55
    .line 56
    if-lez v0, :cond_0

    .line 57
    .line 58
    invoke-static {v1, v2}, Ll/p6i;->m(J)Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-nez v0, :cond_1

    .line 63
    .line 64
    :cond_0
    sget-object v0, Ll/umg;->g:Ll/byd0;

    .line 65
    .line 66
    invoke-static {}, Ll/pzi0;->o()J

    .line 67
    .line 68
    .line 69
    move-result-wide v1

    .line 70
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    invoke-virtual {v0, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    const/4 v0, 0x1

    .line 78
    return v0

    .line 79
    :cond_1
    const/4 v0, 0x0

    .line 80
    return v0
.end method
