.class public Ll/gfm0;
.super Ll/im5;
.source "SourceFile"


# direct methods
.method public constructor <init>(Ll/zq90;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/im5;-><init>(Ll/zq90;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Ll/zq90;)Z
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/zq90;->U()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public b(I)Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;
    .locals 4

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;->None:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;

    .line 2
    .line 3
    iget-object v0, p0, Ll/im5;->a:Ll/zq90;

    .line 4
    .line 5
    iget-object v0, v0, Ll/zq90;->o:Ljava/util/List;

    .line 6
    .line 7
    if-eqz v0, :cond_e

    .line 8
    .line 9
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_a

    .line 14
    .line 15
    iget-object v0, p0, Ll/im5;->a:Ll/zq90;

    .line 16
    .line 17
    iget-object v0, v0, Ll/zq90;->o:Ljava/util/List;

    .line 18
    .line 19
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_e

    .line 28
    .line 29
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    check-cast v1, Lcom/p1/mobile/putong/data/Relationship;

    .line 34
    .line 35
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    iget-object v3, p0, Ll/im5;->a:Ll/zq90;

    .line 40
    .line 41
    iget-object v3, v3, Ll/zq90;->d:Ljava/lang/String;

    .line 42
    .line 43
    invoke-interface {v2, v3}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->sg(Ljava/lang/String;)Z

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    if-nez v2, :cond_9

    .line 48
    .line 49
    iget-object v2, p0, Ll/im5;->a:Ll/zq90;

    .line 50
    .line 51
    iget-object v2, v2, Ll/zq90;->a:Lcom/p1/mobile/putong/data/User;

    .line 52
    .line 53
    invoke-static {v2}, Lcom/p1/mobile/putong/data/User;->isMatched(Lcom/p1/mobile/putong/data/User;)Z

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    if-eqz v2, :cond_1

    .line 58
    .line 59
    goto/16 :goto_2

    .line 60
    .line 61
    :cond_1
    iget-object v2, v1, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 62
    .line 63
    const-string v3, "liked"

    .line 64
    .line 65
    invoke-static {v2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    if-eqz v2, :cond_4

    .line 70
    .line 71
    iget-object v2, v1, Lcom/p1/mobile/putong/data/Relationship;->relationshipExtensions:Lcom/p1/mobile/putong/data/RelationshipExtensions;

    .line 72
    .line 73
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result v2

    .line 77
    if-eqz v2, :cond_2

    .line 78
    .line 79
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Relationship;->relationshipExtensions:Lcom/p1/mobile/putong/data/RelationshipExtensions;

    .line 80
    .line 81
    iget-object v1, v1, Lcom/p1/mobile/putong/data/RelationshipExtensions;->relationType:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 82
    .line 83
    const-string v2, "SUPERLIKED"

    .line 84
    .line 85
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    if-eqz v1, :cond_2

    .line 90
    .line 91
    iget-object v1, p0, Ll/im5;->a:Ll/zq90;

    .line 92
    .line 93
    invoke-virtual {v1}, Ll/zq90;->R()Z

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    if-eqz v1, :cond_0

    .line 98
    .line 99
    sget-object p1, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;->Match:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;

    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_2
    iget-object p1, p0, Ll/im5;->a:Ll/zq90;

    .line 103
    .line 104
    invoke-virtual {p1}, Ll/zq90;->R()Z

    .line 105
    .line 106
    .line 107
    move-result p1

    .line 108
    if-eqz p1, :cond_3

    .line 109
    .line 110
    sget-object p1, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;->SuperLike_Match:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;

    .line 111
    .line 112
    goto :goto_0

    .line 113
    :cond_3
    sget-object p1, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;->SuperLike:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;

    .line 114
    .line 115
    goto :goto_0

    .line 116
    :cond_4
    iget-object v2, v1, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 117
    .line 118
    const-string v3, "superliked"

    .line 119
    .line 120
    invoke-static {v2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 121
    .line 122
    .line 123
    move-result v2

    .line 124
    if-eqz v2, :cond_5

    .line 125
    .line 126
    iget-object v1, p0, Ll/im5;->a:Ll/zq90;

    .line 127
    .line 128
    invoke-virtual {v1}, Ll/zq90;->R()Z

    .line 129
    .line 130
    .line 131
    move-result v1

    .line 132
    if-eqz v1, :cond_0

    .line 133
    .line 134
    sget-object p1, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;->Match:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;

    .line 135
    .line 136
    goto :goto_0

    .line 137
    :cond_5
    iget-object p1, v1, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 138
    .line 139
    const-string v2, "disliked"

    .line 140
    .line 141
    invoke-static {p1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 142
    .line 143
    .line 144
    move-result p1

    .line 145
    if-nez p1, :cond_8

    .line 146
    .line 147
    iget-object p1, v1, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 148
    .line 149
    const-string v1, "blocked"

    .line 150
    .line 151
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 152
    .line 153
    .line 154
    move-result p1

    .line 155
    if-eqz p1, :cond_6

    .line 156
    .line 157
    goto :goto_1

    .line 158
    :cond_6
    iget-object p1, p0, Ll/im5;->a:Ll/zq90;

    .line 159
    .line 160
    invoke-virtual {p1}, Ll/zq90;->R()Z

    .line 161
    .line 162
    .line 163
    move-result p1

    .line 164
    if-eqz p1, :cond_7

    .line 165
    .line 166
    sget-object p1, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;->Dislike_Like_SuperLike_Match:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;

    .line 167
    .line 168
    goto/16 :goto_0

    .line 169
    .line 170
    :cond_7
    sget-object p1, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;->Dislike_Like_SuperLike:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;

    .line 171
    .line 172
    goto/16 :goto_0

    .line 173
    .line 174
    :cond_8
    :goto_1
    sget-object p1, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;->None:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;

    .line 175
    .line 176
    goto/16 :goto_0

    .line 177
    .line 178
    :cond_9
    :goto_2
    sget-object p1, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;->Chat_Single:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;

    .line 179
    .line 180
    goto/16 :goto_0

    .line 181
    .line 182
    :cond_a
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 183
    .line 184
    .line 185
    move-result-object p1

    .line 186
    iget-object v0, p0, Ll/im5;->a:Ll/zq90;

    .line 187
    .line 188
    iget-object v0, v0, Ll/zq90;->d:Ljava/lang/String;

    .line 189
    .line 190
    invoke-interface {p1, v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->sg(Ljava/lang/String;)Z

    .line 191
    .line 192
    .line 193
    move-result p1

    .line 194
    if-nez p1, :cond_d

    .line 195
    .line 196
    iget-object p1, p0, Ll/im5;->a:Ll/zq90;

    .line 197
    .line 198
    iget-object p1, p1, Ll/zq90;->a:Lcom/p1/mobile/putong/data/User;

    .line 199
    .line 200
    invoke-static {p1}, Lcom/p1/mobile/putong/data/User;->isMatched(Lcom/p1/mobile/putong/data/User;)Z

    .line 201
    .line 202
    .line 203
    move-result p1

    .line 204
    if-eqz p1, :cond_b

    .line 205
    .line 206
    goto :goto_3

    .line 207
    :cond_b
    iget-object p1, p0, Ll/im5;->a:Ll/zq90;

    .line 208
    .line 209
    invoke-virtual {p1}, Ll/zq90;->R()Z

    .line 210
    .line 211
    .line 212
    move-result p1

    .line 213
    if-eqz p1, :cond_c

    .line 214
    .line 215
    sget-object p1, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;->Dislike_Like_SuperLike_Match:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;

    .line 216
    .line 217
    goto :goto_4

    .line 218
    :cond_c
    sget-object p1, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;->Dislike_Like_SuperLike:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;

    .line 219
    .line 220
    goto :goto_4

    .line 221
    :cond_d
    :goto_3
    sget-object p1, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;->Chat_Single:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;

    .line 222
    .line 223
    :cond_e
    :goto_4
    iget-object v0, p0, Ll/im5;->g:Ll/lp90;

    .line 224
    .line 225
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 226
    .line 227
    .line 228
    move-result v0

    .line 229
    if-eqz v0, :cond_f

    .line 230
    .line 231
    iget-object p0, p0, Ll/im5;->g:Ll/lp90;

    .line 232
    .line 233
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;->getLayoutDesc()Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc;

    .line 234
    .line 235
    .line 236
    move-result-object v0

    .line 237
    invoke-virtual {p0, v0}, Ll/lp90;->l(Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc;)V

    .line 238
    .line 239
    .line 240
    :cond_f
    return-object p1
.end method
