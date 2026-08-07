.class public Ll/vmf;
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

.method public static synthetic a(Lcom/p1/mobile/putong/data/Tag;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Tag;->category:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "personality"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/data/Tag;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Tag;->category:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "personality"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    xor-int/lit8 p0, p0, 0x1

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static c(Z)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "avatar"

    .line 7
    .line 8
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    const-string v0, "compliment_received"

    .line 12
    .line 13
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    const-string v0, "name"

    .line 17
    .line 18
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    const-string v0, "verification"

    .line 22
    .line 23
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    const-string v0, "member"

    .line 27
    .line 28
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    const-string v0, "likes"

    .line 32
    .line 33
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    const-string v0, "aboutMe"

    .line 37
    .line 38
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    const-string v0, "relationship_goals"

    .line 42
    .line 43
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    const-string v0, "life_pic"

    .line 47
    .line 48
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    const-string v1, "my_bio"

    .line 52
    .line 53
    invoke-interface {p0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    const-string v1, "moment"

    .line 60
    .line 61
    invoke-interface {p0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    const-string v1, "interests"

    .line 65
    .line 66
    invoke-interface {p0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    const-string v0, "hash_tag"

    .line 73
    .line 74
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    const-string v0, "questionAnswer"

    .line 78
    .line 79
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    const-string v0, "compliment"

    .line 83
    .line 84
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    const-string v0, "tantanid"

    .line 88
    .line 89
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    const-string v0, "admob"

    .line 93
    .line 94
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    const-string v0, "report"

    .line 98
    .line 99
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    return-object p0
.end method

.method public static d(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Ljava/util/List;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;",
            ")",
            "Ljava/util/List<",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/HomeCardExpandedType;",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    new-instance v2, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    iget-object v3, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 12
    .line 13
    if-eqz v3, :cond_0

    .line 14
    .line 15
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Relationship;->conversationStatus:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 16
    .line 17
    const-string v4, "blocked"

    .line 18
    .line 19
    invoke-static {v4}, Lcom/p1/mobile/putong/data/ConversationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 20
    .line 21
    .line 22
    move-result-object v4

    .line 23
    invoke-static {v3, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    if-eqz v3, :cond_0

    .line 28
    .line 29
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/HomeCardExpandedType;->AVATAR:Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/HomeCardExpandedType;

    .line 30
    .line 31
    invoke-static {p0, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-interface {v2, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/HomeCardExpandedType;->CARD_NAME:Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/HomeCardExpandedType;

    .line 39
    .line 40
    invoke-static {p0, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-interface {v2, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/HomeCardExpandedType;->REPORT:Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/HomeCardExpandedType;

    .line 48
    .line 49
    invoke-static {p0, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-interface {v2, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    return-object v2

    .line 57
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isBanedOrInactivated()Z

    .line 58
    .line 59
    .line 60
    move-result v3

    .line 61
    if-eqz v3, :cond_1

    .line 62
    .line 63
    iget-object v3, p2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->renderFrom:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 64
    .line 65
    sget-object v4, Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;->PROFILE:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 66
    .line 67
    if-ne v3, v4, :cond_1

    .line 68
    .line 69
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/HomeCardExpandedType;->AVATAR:Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/HomeCardExpandedType;

    .line 70
    .line 71
    invoke-static {p0, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-interface {v2, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    return-object v2

    .line 79
    :cond_1
    iget-object v3, p2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->renderFrom:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 80
    .line 81
    sget-object v4, Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;->PROFILE_PREVIEW:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 82
    .line 83
    if-ne v3, v4, :cond_2

    .line 84
    .line 85
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/HomeCardExpandedType;->AVATAR:Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/HomeCardExpandedType;

    .line 86
    .line 87
    invoke-static {p0, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    invoke-interface {v2, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    return-object v2

    .line 95
    :cond_2
    invoke-static {}, Ll/g6v;->f()Ll/g6v;

    .line 96
    .line 97
    .line 98
    move-result-object v3

    .line 99
    iget-object v4, p2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 100
    .line 101
    invoke-virtual {v3, v4}, Ll/g6v;->i(Ljava/lang/String;)Z

    .line 102
    .line 103
    .line 104
    move-result v3

    .line 105
    invoke-static {v3}, Ll/vmf;->c(Z)Ljava/util/List;

    .line 106
    .line 107
    .line 108
    move-result-object v3

    .line 109
    const/4 v4, 0x1

    .line 110
    move v5, v0

    .line 111
    :cond_3
    :goto_0
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 112
    .line 113
    .line 114
    move-result v6

    .line 115
    if-ge v5, v6, :cond_c

    .line 116
    .line 117
    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object v6

    .line 121
    check-cast v6, Ljava/lang/String;

    .line 122
    .line 123
    invoke-static {v6}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/HomeCardExpandedType;->getTypeByAlias(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/HomeCardExpandedType;

    .line 124
    .line 125
    .line 126
    move-result-object v6

    .line 127
    add-int/lit8 v5, v5, 0x1

    .line 128
    .line 129
    if-nez v6, :cond_4

    .line 130
    .line 131
    goto :goto_0

    .line 132
    :cond_4
    sget-object v7, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/HomeCardExpandedType;->LIFE_PIC:Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/HomeCardExpandedType;

    .line 133
    .line 134
    if-ne v6, v7, :cond_6

    .line 135
    .line 136
    invoke-static {p0, p1, p2, v6, v4}, Ll/vmf;->e(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/HomeCardExpandedType;I)Z

    .line 137
    .line 138
    .line 139
    move-result v7

    .line 140
    if-eqz v7, :cond_5

    .line 141
    .line 142
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 143
    .line 144
    .line 145
    move-result-object v7

    .line 146
    invoke-static {v6, v7}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 147
    .line 148
    .line 149
    move-result-object v6

    .line 150
    invoke-interface {v2, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 151
    .line 152
    .line 153
    :cond_5
    add-int/lit8 v4, v4, 0x1

    .line 154
    .line 155
    goto :goto_0

    .line 156
    :cond_6
    sget-object v7, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/HomeCardExpandedType;->QUESTION:Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/HomeCardExpandedType;

    .line 157
    .line 158
    if-ne v6, v7, :cond_b

    .line 159
    .line 160
    iget-object v7, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 161
    .line 162
    iget-object v7, v7, Lcom/p1/mobile/putong/data/Profile;->answers:Ljava/util/List;

    .line 163
    .line 164
    invoke-interface {v7}, Ljava/util/List;->size()I

    .line 165
    .line 166
    .line 167
    move-result v7

    .line 168
    move v8, v0

    .line 169
    :goto_1
    if-ge v8, v7, :cond_9

    .line 170
    .line 171
    invoke-static {p0, p1, p2, v6, v8}, Ll/vmf;->e(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/HomeCardExpandedType;I)Z

    .line 172
    .line 173
    .line 174
    move-result v9

    .line 175
    if-eqz v9, :cond_8

    .line 176
    .line 177
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 178
    .line 179
    .line 180
    move-result-object v9

    .line 181
    invoke-static {v6, v9}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 182
    .line 183
    .line 184
    move-result-object v9

    .line 185
    invoke-interface {v2, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 186
    .line 187
    .line 188
    sget-object v9, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/HomeCardExpandedType;->LIFE_PIC:Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/HomeCardExpandedType;

    .line 189
    .line 190
    invoke-static {p0, p1, p2, v9, v4}, Ll/vmf;->e(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/HomeCardExpandedType;I)Z

    .line 191
    .line 192
    .line 193
    move-result v10

    .line 194
    if-eqz v10, :cond_7

    .line 195
    .line 196
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 197
    .line 198
    .line 199
    move-result-object v10

    .line 200
    invoke-static {v9, v10}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 201
    .line 202
    .line 203
    move-result-object v9

    .line 204
    invoke-interface {v2, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 205
    .line 206
    .line 207
    :cond_7
    add-int/lit8 v4, v4, 0x1

    .line 208
    .line 209
    :cond_8
    add-int/lit8 v8, v8, 0x1

    .line 210
    .line 211
    goto :goto_1

    .line 212
    :cond_9
    :goto_2
    iget-object v6, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 213
    .line 214
    invoke-interface {v6}, Ljava/util/List;->size()I

    .line 215
    .line 216
    .line 217
    move-result v6

    .line 218
    if-ge v4, v6, :cond_3

    .line 219
    .line 220
    sget-object v6, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/HomeCardExpandedType;->LIFE_PIC:Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/HomeCardExpandedType;

    .line 221
    .line 222
    invoke-static {p0, p1, p2, v6, v4}, Ll/vmf;->e(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/HomeCardExpandedType;I)Z

    .line 223
    .line 224
    .line 225
    move-result v7

    .line 226
    if-eqz v7, :cond_a

    .line 227
    .line 228
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 229
    .line 230
    .line 231
    move-result-object v7

    .line 232
    invoke-static {v6, v7}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 233
    .line 234
    .line 235
    move-result-object v6

    .line 236
    invoke-interface {v2, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 237
    .line 238
    .line 239
    :cond_a
    add-int/lit8 v4, v4, 0x1

    .line 240
    .line 241
    goto :goto_2

    .line 242
    :cond_b
    invoke-static {p0, p1, p2, v6, v0}, Ll/vmf;->e(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/HomeCardExpandedType;I)Z

    .line 243
    .line 244
    .line 245
    move-result v7

    .line 246
    if-eqz v7, :cond_3

    .line 247
    .line 248
    invoke-static {v6, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 249
    .line 250
    .line 251
    move-result-object v6

    .line 252
    invoke-interface {v2, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 253
    .line 254
    .line 255
    goto/16 :goto_0

    .line 256
    .line 257
    :cond_c
    return-object v2
.end method

.method public static e(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/HomeCardExpandedType;I)Z
    .locals 1

    .line 1
    sget-object p0, Ll/vmf$a;->a:[I

    .line 2
    .line 3
    invoke-virtual {p3}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p3

    .line 7
    aget p0, p0, p3

    .line 8
    .line 9
    const/4 p3, 0x0

    .line 10
    const/4 v0, 0x1

    .line 11
    packed-switch p0, :pswitch_data_0

    .line 12
    .line 13
    .line 14
    return p3

    .line 15
    :pswitch_0
    const-string p0, "ttt_profile_tantanid"

    .line 16
    .line 17
    invoke-static {p0}, Lcom/p1/mobile/putong/api/ABManager;->j0(Ljava/lang/String;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const-string p2, "test"

    .line 22
    .line 23
    invoke-static {p0, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-eqz p0, :cond_0

    .line 28
    .line 29
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-eqz p0, :cond_0

    .line 34
    .line 35
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->publicId:Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-nez p0, :cond_0

    .line 42
    .line 43
    return v0

    .line 44
    :cond_0
    return p3

    .line 45
    :pswitch_1
    invoke-static {p1}, Ll/vmf;->j(Lcom/p1/mobile/putong/data/User;)Z

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    return p0

    .line 50
    :pswitch_2
    invoke-static {p1}, Ll/vmf;->k(Lcom/p1/mobile/putong/data/User;)Z

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    return p0

    .line 55
    :pswitch_3
    invoke-static {p1}, Ll/vmf;->g(Lcom/p1/mobile/putong/data/User;)Z

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    return p0

    .line 60
    :pswitch_4
    invoke-static {p1}, Ll/vmf;->i(Lcom/p1/mobile/putong/data/User;)Z

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    if-nez p0, :cond_1

    .line 65
    .line 66
    invoke-static {p1}, Ll/vmf;->h(Lcom/p1/mobile/putong/data/User;)Z

    .line 67
    .line 68
    .line 69
    move-result p0

    .line 70
    if-eqz p0, :cond_1

    .line 71
    .line 72
    return v0

    .line 73
    :cond_1
    return p3

    .line 74
    :pswitch_5
    return v0

    .line 75
    :pswitch_6
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 76
    .line 77
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 78
    .line 79
    new-instance p1, Ll/umf;

    .line 80
    .line 81
    invoke-direct {p1}, Ll/umf;-><init>()V

    .line 82
    .line 83
    .line 84
    invoke-static {p0, p1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 89
    .line 90
    .line 91
    move-result p0

    .line 92
    :goto_0
    xor-int/2addr p0, v0

    .line 93
    return p0

    .line 94
    :pswitch_7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 95
    .line 96
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 97
    .line 98
    new-instance p1, Ll/tmf;

    .line 99
    .line 100
    invoke-direct {p1}, Ll/tmf;-><init>()V

    .line 101
    .line 102
    .line 103
    invoke-static {p0, p1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 108
    .line 109
    .line 110
    move-result p0

    .line 111
    goto :goto_0

    .line 112
    :pswitch_8
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 113
    .line 114
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 115
    .line 116
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 117
    .line 118
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->intlFriendPurposeV2:Ljava/util/List;

    .line 119
    .line 120
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 121
    .line 122
    .line 123
    move-result p0

    .line 124
    goto :goto_0

    .line 125
    :pswitch_9
    return v0

    .line 126
    :pswitch_a
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 127
    .line 128
    .line 129
    move-result p0

    .line 130
    if-nez p0, :cond_2

    .line 131
    .line 132
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    .line 133
    .line 134
    .line 135
    move-result p0

    .line 136
    if-nez p0, :cond_2

    .line 137
    .line 138
    return v0

    .line 139
    :cond_2
    return p3

    .line 140
    :pswitch_b
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 141
    .line 142
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->answers:Ljava/util/List;

    .line 143
    .line 144
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 145
    .line 146
    .line 147
    move-result p0

    .line 148
    if-le p0, p4, :cond_3

    .line 149
    .line 150
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 151
    .line 152
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->answers:Ljava/util/List;

    .line 153
    .line 154
    invoke-interface {p0, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 155
    .line 156
    .line 157
    move-result-object p0

    .line 158
    check-cast p0, Lcom/p1/mobile/putong/data/Answer;

    .line 159
    .line 160
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Answer;->question:Ljava/lang/String;

    .line 161
    .line 162
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 163
    .line 164
    .line 165
    move-result p0

    .line 166
    if-nez p0, :cond_3

    .line 167
    .line 168
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 169
    .line 170
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->answers:Ljava/util/List;

    .line 171
    .line 172
    invoke-interface {p0, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 173
    .line 174
    .line 175
    move-result-object p0

    .line 176
    check-cast p0, Lcom/p1/mobile/putong/data/Answer;

    .line 177
    .line 178
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Answer;->value:Ljava/lang/String;

    .line 179
    .line 180
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 181
    .line 182
    .line 183
    move-result p0

    .line 184
    if-nez p0, :cond_3

    .line 185
    .line 186
    return v0

    .line 187
    :cond_3
    return p3

    .line 188
    :pswitch_c
    return v0

    .line 189
    :pswitch_d
    invoke-static {p1, p2}, Ll/vmf;->l(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Z

    .line 190
    .line 191
    .line 192
    move-result p0

    .line 193
    return p0

    .line 194
    :pswitch_e
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 195
    .line 196
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 197
    .line 198
    .line 199
    move-result p0

    .line 200
    if-le p0, p4, :cond_4

    .line 201
    .line 202
    return v0

    .line 203
    :cond_4
    return p3

    .line 204
    :pswitch_f
    invoke-static {p1}, Ll/vmf;->i(Lcom/p1/mobile/putong/data/User;)Z

    .line 205
    .line 206
    .line 207
    move-result p0

    .line 208
    return p0

    .line 209
    :pswitch_10
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 210
    .line 211
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 212
    .line 213
    .line 214
    move-result p0

    .line 215
    goto :goto_0

    .line 216
    :pswitch_11
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 217
    .line 218
    .line 219
    move-result p0

    .line 220
    if-eqz p0, :cond_5

    .line 221
    .line 222
    return p3

    .line 223
    :cond_5
    invoke-static {}, Ll/g6v;->f()Ll/g6v;

    .line 224
    .line 225
    .line 226
    move-result-object p0

    .line 227
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 228
    .line 229
    invoke-virtual {p0, p1}, Ll/g6v;->g(Ljava/lang/String;)Ll/bkj0;

    .line 230
    .line 231
    .line 232
    move-result-object p0

    .line 233
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 234
    .line 235
    .line 236
    move-result p1

    .line 237
    if-eqz p1, :cond_7

    .line 238
    .line 239
    iget-object p1, p0, Ll/bkj0;->a:Ljava/lang/Object;

    .line 240
    .line 241
    if-nez p1, :cond_6

    .line 242
    .line 243
    iget-object p1, p0, Ll/bkj0;->b:Ljava/lang/Object;

    .line 244
    .line 245
    if-eqz p1, :cond_7

    .line 246
    .line 247
    :cond_6
    return v0

    .line 248
    :cond_7
    if-eqz p0, :cond_9

    .line 249
    .line 250
    iget-object p0, p0, Ll/bkj0;->c:Ljava/lang/Object;

    .line 251
    .line 252
    check-cast p0, Ljava/lang/Boolean;

    .line 253
    .line 254
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 255
    .line 256
    .line 257
    move-result p0

    .line 258
    if-nez p0, :cond_8

    .line 259
    .line 260
    goto :goto_1

    .line 261
    :cond_8
    return p3

    .line 262
    :cond_9
    :goto_1
    :pswitch_12
    return v0

    .line 263
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static f(Lcom/p1/mobile/putong/data/User;)Z
    .locals 4

    .line 1
    invoke-static {}, Ll/d79;->e0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_4

    .line 7
    .line 8
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_4

    .line 13
    .line 14
    sget-object v0, Ll/p6w;->INSTANCE:Ll/p6w;

    .line 15
    .line 16
    iget-object v2, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v0, v2}, Ll/p6w;->C(Ljava/lang/String;)Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-eqz v2, :cond_0

    .line 23
    .line 24
    const/4 p0, 0x1

    .line 25
    return p0

    .line 26
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isLoveBuzz()Z

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    if-nez v2, :cond_1

    .line 31
    .line 32
    return v1

    .line 33
    :cond_1
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 34
    .line 35
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 36
    .line 37
    iget-object v3, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/core/api/g;->zp(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-virtual {v0, v2}, Ll/p6w;->o(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    if-eqz v3, :cond_2

    .line 48
    .line 49
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 50
    .line 51
    invoke-virtual {v0, p0}, Ll/p6w;->C(Ljava/lang/String;)Z

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    return p0

    .line 56
    :cond_2
    invoke-virtual {v0, v2}, Ll/p6w;->D(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    if-eqz p0, :cond_3

    .line 61
    .line 62
    return v1

    .line 63
    :cond_3
    invoke-virtual {v0, v2}, Ll/p6w;->m(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    return p0

    .line 68
    :cond_4
    return v1
.end method

.method public static g(Lcom/p1/mobile/putong/data/User;)Z
    .locals 6

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->receivedLikes:Ljava/lang/Long;

    .line 11
    .line 12
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    invoke-static {}, Ll/nmp;->c()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_1

    .line 23
    .line 24
    invoke-static {}, Ll/pgj;->a()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-nez v0, :cond_0

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->receivedLikes:Ljava/lang/Long;

    .line 33
    .line 34
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 35
    .line 36
    .line 37
    move-result-wide v2

    .line 38
    const-wide/16 v4, 0x1

    .line 39
    .line 40
    cmp-long p0, v2, v4

    .line 41
    .line 42
    if-gez p0, :cond_0

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    const/4 p0, 0x1

    .line 46
    return p0

    .line 47
    :cond_1
    :goto_0
    return v1
.end method

.method public static h(Lcom/p1/mobile/putong/data/User;)Z
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->E0:Ll/ina;

    .line 8
    .line 9
    invoke-virtual {v1, p0}, Ll/ina;->A3(Lcom/p1/mobile/putong/data/User;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/4 v2, 0x0

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    return v2

    .line 17
    :cond_0
    invoke-static {}, Ll/pgj;->c()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-nez v1, :cond_2

    .line 22
    .line 23
    invoke-static {}, Ll/nmp;->e()Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    return v2

    .line 31
    :cond_2
    :goto_0
    const/4 v1, 0x1

    .line 32
    if-eqz v0, :cond_3

    .line 33
    .line 34
    return v1

    .line 35
    :cond_3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_5

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->gpHideVip()Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_4

    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    if-eqz p0, :cond_5

    .line 53
    .line 54
    return v1

    .line 55
    :cond_5
    :goto_1
    return v2
.end method

.method public static i(Lcom/p1/mobile/putong/data/User;)Z
    .locals 5

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 12
    .line 13
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/d0;->k4()Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    const/4 v3, 0x0

    .line 22
    const/4 v4, 0x1

    .line 23
    if-eqz v2, :cond_1

    .line 24
    .line 25
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_0

    .line 30
    .line 31
    iget-object p0, v1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 32
    .line 33
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    if-eqz p0, :cond_0

    .line 38
    .line 39
    iget-object p0, v1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 42
    .line 43
    const-string v0, "verified"

    .line 44
    .line 45
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    if-eqz p0, :cond_0

    .line 50
    .line 51
    return v3

    .line 52
    :cond_0
    return v4

    .line 53
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    if-eqz p0, :cond_2

    .line 58
    .line 59
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    if-nez p0, :cond_2

    .line 64
    .line 65
    return v4

    .line 66
    :cond_2
    return v3
.end method

.method public static j(Lcom/p1/mobile/putong/data/User;)Z
    .locals 1

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 p0, 0x1

    .line 17
    return p0

    .line 18
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 19
    return p0
.end method

.method public static k(Lcom/p1/mobile/putong/data/User;)Z
    .locals 1

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-static {p0}, Ll/br5;->p(Lcom/p1/mobile/putong/data/User;)Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    xor-int/lit8 p0, p0, 0x1

    .line 21
    .line 22
    return p0

    .line 23
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public static l(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Z
    .locals 1

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->from:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1}, Ll/tnt;->b(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const/4 v0, 0x0

    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    return v0

    .line 11
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-interface {p1}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->a()Ll/hbs;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-interface {p1}, Ll/hbs;->a()Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-eqz p1, :cond_1

    .line 24
    .line 25
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 30
    .line 31
    invoke-interface {p1, p0}, Ll/qhk0;->getUserById(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    :cond_1
    if-eqz p0, :cond_2

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->unilateralBlock()Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-eqz p0, :cond_2

    .line 42
    .line 43
    return v0

    .line 44
    :cond_2
    const/4 p0, 0x1

    .line 45
    return p0
.end method
