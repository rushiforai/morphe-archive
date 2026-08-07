.class final enum Lcom/p1/mobile/putong/core/data/PurchaseType$11;
.super Lcom/p1/mobile/putong/core/data/PurchaseType;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/PurchaseType;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4011
    name = null
.end annotation


# direct methods
.method private constructor <init>(Ljava/lang/String;I)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/data/PurchaseType;-><init>(Ljava/lang/String;ILl/vib0;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;ILl/vib0;)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/PurchaseType$11;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method private getGreetPrivilege()Lcom/p1/mobile/putong/core/data/Privilege;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/PurchaseType;->isRevGreet()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    sget-object p0, Lcom/p1/mobile/putong/core/data/Privilege;->greet:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/data/Privilege;->letter:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 11
    .line 12
    return-object p0
.end method


# virtual methods
.method public getPrivilegeData(Lcom/p1/mobile/putong/data/Gender;)Ljava/util/ArrayList;
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/Gender;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/data/Privilege;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->h5()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_7

    .line 14
    .line 15
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->see_who_likes_me:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 16
    .line 17
    sget-object v2, Lcom/p1/mobile/putong/core/data/Privilege;->vip_unlimited_likes:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 18
    .line 19
    sget-object v14, Lcom/p1/mobile/putong/core/data/Privilege;->online_match_tickets:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 20
    .line 21
    sget-object v15, Lcom/p1/mobile/putong/core/data/Privilege;->voice_quick_chat:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 22
    .line 23
    invoke-direct/range {p0 .. p0}, Lcom/p1/mobile/putong/core/data/PurchaseType$11;->getGreetPrivilege()Lcom/p1/mobile/putong/core/data/Privilege;

    .line 24
    .line 25
    .line 26
    move-result-object v5

    .line 27
    sget-object v6, Lcom/p1/mobile/putong/core/data/Privilege;->vip_super_like:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 28
    .line 29
    sget-object v7, Lcom/p1/mobile/putong/core/data/Privilege;->liked_user:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 30
    .line 31
    sget-object v8, Lcom/p1/mobile/putong/core/data/Privilege;->boost:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 32
    .line 33
    sget-object v3, Lcom/p1/mobile/putong/core/data/Privilege;->advanced_filter:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 34
    .line 35
    sget-object v10, Lcom/p1/mobile/putong/core/data/Privilege;->message_read_state:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 36
    .line 37
    sget-object v11, Lcom/p1/mobile/putong/core/data/Privilege;->privacy_membership:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 38
    .line 39
    sget-object v9, Lcom/p1/mobile/putong/core/data/Privilege;->recover_unmatches:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 40
    .line 41
    sget-object v4, Lcom/p1/mobile/putong/core/data/Privilege;->vip_undo:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 42
    .line 43
    move-object v12, v9

    .line 44
    move-object v9, v3

    .line 45
    move-object v3, v14

    .line 46
    sget-object v14, Lcom/p1/mobile/putong/core/data/Privilege;->vip_location:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 47
    .line 48
    move-object v13, v4

    .line 49
    move-object v4, v15

    .line 50
    sget-object v15, Lcom/p1/mobile/putong/core/data/Privilege;->svip_badge:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 51
    .line 52
    filled-new-array/range {v1 .. v15}, [Lcom/p1/mobile/putong/core/data/Privilege;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    move-object v5, v10

    .line 57
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 62
    .line 63
    .line 64
    move-result-object v10

    .line 65
    invoke-interface {v10}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Vo()Z

    .line 66
    .line 67
    .line 68
    move-result v10

    .line 69
    if-eqz v10, :cond_0

    .line 70
    .line 71
    const/16 v10, 0xa

    .line 72
    .line 73
    move-object/from16 p1, v1

    .line 74
    .line 75
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->moment_boost:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 76
    .line 77
    invoke-virtual {v0, v10, v1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 78
    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_0
    move-object/from16 p1, v1

    .line 82
    .line 83
    :goto_0
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    invoke-virtual {v1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->z1()Z

    .line 92
    .line 93
    .line 94
    move-result v1

    .line 95
    if-eqz v1, :cond_1

    .line 96
    .line 97
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 98
    .line 99
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 100
    .line 101
    invoke-virtual {v1}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 106
    .line 107
    .line 108
    move-result v1

    .line 109
    if-eqz v1, :cond_1

    .line 110
    .line 111
    invoke-direct/range {p0 .. p0}, Lcom/p1/mobile/putong/core/data/PurchaseType$11;->getGreetPrivilege()Lcom/p1/mobile/putong/core/data/Privilege;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    move-object v1, v8

    .line 116
    move-object v8, v7

    .line 117
    move-object v7, v1

    .line 118
    move-object/from16 v1, p1

    .line 119
    .line 120
    move-object v10, v15

    .line 121
    move-object v15, v4

    .line 122
    move-object v4, v13

    .line 123
    move-object v13, v6

    .line 124
    move-object v6, v14

    .line 125
    move-object v14, v3

    .line 126
    move-object v3, v9

    .line 127
    move-object v9, v12

    .line 128
    move-object v12, v2

    .line 129
    move-object v2, v11

    .line 130
    move-object v11, v0

    .line 131
    filled-new-array/range {v1 .. v15}, [Lcom/p1/mobile/putong/core/data/Privilege;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    move-object v3, v14

    .line 136
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 141
    .line 142
    .line 143
    move-result-object v2

    .line 144
    invoke-interface {v2}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Vo()Z

    .line 145
    .line 146
    .line 147
    move-result v2

    .line 148
    if-eqz v2, :cond_2

    .line 149
    .line 150
    const/4 v2, 0x5

    .line 151
    sget-object v4, Lcom/p1/mobile/putong/core/data/Privilege;->moment_boost:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 152
    .line 153
    invoke-virtual {v0, v2, v4}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 154
    .line 155
    .line 156
    goto :goto_1

    .line 157
    :cond_1
    move-object/from16 v1, p1

    .line 158
    .line 159
    :cond_2
    :goto_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 160
    .line 161
    .line 162
    move-result-object v2

    .line 163
    invoke-virtual {v2}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 164
    .line 165
    .line 166
    move-result-object v2

    .line 167
    invoke-interface {v2}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->D9()Z

    .line 168
    .line 169
    .line 170
    move-result v2

    .line 171
    if-eqz v2, :cond_3

    .line 172
    .line 173
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    .line 174
    .line 175
    .line 176
    move-result v2

    .line 177
    add-int/lit8 v2, v2, 0x1

    .line 178
    .line 179
    sget-object v4, Lcom/p1/mobile/putong/core/data/Privilege;->nearby_people:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 180
    .line 181
    invoke-virtual {v0, v2, v4}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 182
    .line 183
    .line 184
    :cond_3
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 185
    .line 186
    .line 187
    move-result-object v2

    .line 188
    invoke-virtual {v2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 189
    .line 190
    .line 191
    move-result-object v2

    .line 192
    invoke-interface {v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->t9()Z

    .line 193
    .line 194
    .line 195
    move-result v2

    .line 196
    if-eqz v2, :cond_4

    .line 197
    .line 198
    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 199
    .line 200
    .line 201
    :cond_4
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 202
    .line 203
    .line 204
    move-result-object v2

    .line 205
    invoke-virtual {v2}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 206
    .line 207
    .line 208
    move-result-object v2

    .line 209
    invoke-interface {v2}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->xj()Z

    .line 210
    .line 211
    .line 212
    move-result v2

    .line 213
    if-eqz v2, :cond_5

    .line 214
    .line 215
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    .line 216
    .line 217
    .line 218
    move-result v1

    .line 219
    add-int/lit8 v1, v1, 0x1

    .line 220
    .line 221
    sget-object v2, Lcom/p1/mobile/putong/core/data/Privilege;->hide_me_from_nearby:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 222
    .line 223
    invoke-virtual {v0, v1, v2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 224
    .line 225
    .line 226
    :cond_5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 227
    .line 228
    .line 229
    move-result-object v1

    .line 230
    invoke-virtual {v1}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 231
    .line 232
    .line 233
    move-result-object v1

    .line 234
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->d9()Z

    .line 235
    .line 236
    .line 237
    move-result v1

    .line 238
    if-eqz v1, :cond_6

    .line 239
    .line 240
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    .line 241
    .line 242
    .line 243
    move-result v1

    .line 244
    add-int/lit8 v1, v1, 0x1

    .line 245
    .line 246
    sget-object v2, Lcom/p1/mobile/putong/core/data/Privilege;->unlock_learn_about_him_module:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 247
    .line 248
    invoke-virtual {v0, v1, v2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 249
    .line 250
    .line 251
    :cond_6
    return-object v0

    .line 252
    :cond_7
    new-instance v0, Ljava/util/ArrayList;

    .line 253
    .line 254
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 255
    .line 256
    .line 257
    return-object v0
.end method

.method public getPrivilegeDataForGP(Lcom/p1/mobile/putong/data/Gender;)Ljava/util/ArrayList;
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/Gender;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/data/Privilege;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Hg()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_7

    .line 14
    .line 15
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->premium_compliment:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 16
    .line 17
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->intl_advanced_filter:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 18
    .line 19
    sget-object v2, Lcom/p1/mobile/putong/core/data/Privilege;->see_who_likes_me:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 20
    .line 21
    sget-object v3, Lcom/p1/mobile/putong/core/data/Privilege;->vip_unlimited_likes:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 22
    .line 23
    sget-object v4, Lcom/p1/mobile/putong/core/data/Privilege;->liked_user:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 24
    .line 25
    sget-object v5, Lcom/p1/mobile/putong/core/data/Privilege;->boost:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 26
    .line 27
    sget-object v6, Lcom/p1/mobile/putong/core/data/Privilege;->vip_super_like:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 28
    .line 29
    sget-object v7, Lcom/p1/mobile/putong/core/data/Privilege;->vip_undo:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 30
    .line 31
    sget-object v8, Lcom/p1/mobile/putong/core/data/Privilege;->intl_no_ad:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 32
    .line 33
    sget-object v9, Lcom/p1/mobile/putong/core/data/Privilege;->vip_membership_active_time_gp:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 34
    .line 35
    sget-object v10, Lcom/p1/mobile/putong/core/data/Privilege;->vip_membership_remark_gp:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 36
    .line 37
    sget-object v11, Lcom/p1/mobile/putong/core/data/Privilege;->vip_membership_search_gp:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 38
    .line 39
    sget-object v12, Lcom/p1/mobile/putong/core/data/Privilege;->vip_location:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 40
    .line 41
    sget-object v13, Lcom/p1/mobile/putong/core/data/Privilege;->vip_badge:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 42
    .line 43
    filled-new-array/range {v0 .. v13}, [Lcom/p1/mobile/putong/core/data/Privilege;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->o()Z

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    if-eqz p1, :cond_0

    .line 56
    .line 57
    sget-object p1, Lcom/p1/mobile/putong/core/data/Privilege;->vip_message_block_gp:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 58
    .line 59
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/core/data/Privilege;->message_read_state:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 63
    .line 64
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->ir()Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    const/4 v1, 0x1

    .line 80
    if-eqz v0, :cond_1

    .line 81
    .line 82
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->intl_visitor:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 83
    .line 84
    invoke-virtual {p0, v1, v0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 85
    .line 86
    .line 87
    :cond_1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->R8()Z

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    if-eqz v0, :cond_2

    .line 100
    .line 101
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->loveBuzz:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 102
    .line 103
    invoke-virtual {p0, v1, v0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 104
    .line 105
    .line 106
    const/4 v0, 0x4

    .line 107
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->picksMembership:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 108
    .line 109
    invoke-virtual {p0, v0, v1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 110
    .line 111
    .line 112
    goto :goto_0

    .line 113
    :cond_2
    const/4 v0, 0x3

    .line 114
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->picksMembership:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 115
    .line 116
    invoke-virtual {p0, v0, v1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 117
    .line 118
    .line 119
    :goto_0
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Rk()Z

    .line 128
    .line 129
    .line 130
    move-result v0

    .line 131
    if-eqz v0, :cond_4

    .line 132
    .line 133
    invoke-virtual {p0, v4}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    if-eqz v0, :cond_4

    .line 138
    .line 139
    invoke-virtual {p0, v4}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    invoke-virtual {p0, v4}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 144
    .line 145
    .line 146
    const/4 v1, -0x1

    .line 147
    if-ne v0, v1, :cond_3

    .line 148
    .line 149
    const/4 v0, 0x2

    .line 150
    :cond_3
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->svip_greet:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 151
    .line 152
    invoke-virtual {p0, v0, v1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 153
    .line 154
    .line 155
    :cond_4
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->t9()Z

    .line 164
    .line 165
    .line 166
    move-result v0

    .line 167
    if-eqz v0, :cond_5

    .line 168
    .line 169
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 170
    .line 171
    .line 172
    :cond_5
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 173
    .line 174
    .line 175
    move-result-object p1

    .line 176
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 177
    .line 178
    .line 179
    move-result-object p1

    .line 180
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->F6()Z

    .line 181
    .line 182
    .line 183
    move-result p1

    .line 184
    if-eqz p1, :cond_6

    .line 185
    .line 186
    const/4 p1, 0x0

    .line 187
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->tribe:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 188
    .line 189
    invoke-virtual {p0, p1, v0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 190
    .line 191
    .line 192
    :cond_6
    return-object p0

    .line 193
    :cond_7
    new-instance p0, Ljava/util/ArrayList;

    .line 194
    .line 195
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 196
    .line 197
    .line 198
    return-object p0
.end method

.method public productCategory()Lcom/p1/mobile/putong/core/data/ProductCategory;
    .locals 0

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Hg()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const-string p0, "tttSvipGoogleplay"

    .line 16
    .line 17
    invoke-static {p0}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0

    .line 22
    :cond_0
    const-string p0, "svip"

    .line 23
    .line 24
    invoke-static {p0}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method
