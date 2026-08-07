.class public Ll/gy90;
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


# virtual methods
.method public a(Ll/t3m;Ljava/lang/String;)Z
    .locals 9

    .line 1
    invoke-interface {p1}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 6
    .line 7
    iget-object v1, v0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 8
    .line 9
    iget-boolean v2, v1, Lcom/p1/mobile/putong/data/Studies;->active:Z

    .line 10
    .line 11
    const/4 v3, 0x1

    .line 12
    const/4 v4, 0x0

    .line 13
    if-eqz v2, :cond_3

    .line 14
    .line 15
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Studies;->major:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    xor-int/2addr v1, v3

    .line 22
    invoke-interface {p1}, Ll/t3m;->P1()Z

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    if-eqz v2, :cond_2

    .line 27
    .line 28
    iget-object v2, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 29
    .line 30
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    if-eqz v2, :cond_1

    .line 35
    .line 36
    iget-object v2, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 37
    .line 38
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Settings;->hideSchoolName()Z

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    if-eqz v2, :cond_0

    .line 43
    .line 44
    move v2, v1

    .line 45
    move v1, v3

    .line 46
    move v5, v1

    .line 47
    move v6, v4

    .line 48
    goto :goto_1

    .line 49
    :cond_0
    iget-object v2, v0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 50
    .line 51
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Studies;->school:Ljava/lang/String;

    .line 52
    .line 53
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    :goto_0
    xor-int/2addr v2, v3

    .line 58
    move v5, v2

    .line 59
    move v6, v4

    .line 60
    move v2, v1

    .line 61
    move v1, v3

    .line 62
    goto :goto_1

    .line 63
    :cond_1
    iget-object v2, v0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 64
    .line 65
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Studies;->school:Ljava/lang/String;

    .line 66
    .line 67
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 68
    .line 69
    .line 70
    move-result v2

    .line 71
    goto :goto_0

    .line 72
    :cond_2
    iget-object v2, v0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 73
    .line 74
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Studies;->school:Ljava/lang/String;

    .line 75
    .line 76
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 77
    .line 78
    .line 79
    move-result v2

    .line 80
    goto :goto_0

    .line 81
    :cond_3
    iget-object v1, v0, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 82
    .line 83
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Work;->industry:Ljava/lang/String;

    .line 84
    .line 85
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    xor-int/2addr v1, v3

    .line 90
    iget-object v2, v0, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 91
    .line 92
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Work;->department:Ljava/lang/String;

    .line 93
    .line 94
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 95
    .line 96
    .line 97
    move-result v2

    .line 98
    xor-int/2addr v2, v3

    .line 99
    iget-object v5, v0, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 100
    .line 101
    iget-object v5, v5, Lcom/p1/mobile/putong/data/Work;->company:Ljava/lang/String;

    .line 102
    .line 103
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 104
    .line 105
    .line 106
    move-result v5

    .line 107
    xor-int/2addr v5, v3

    .line 108
    move v6, v5

    .line 109
    move v5, v4

    .line 110
    :goto_1
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->l()Z

    .line 111
    .line 112
    .line 113
    move-result v7

    .line 114
    const-string v8, "unknown_"

    .line 115
    .line 116
    if-eqz v7, :cond_8

    .line 117
    .line 118
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 119
    .line 120
    .line 121
    move-result v7

    .line 122
    if-eqz v7, :cond_4

    .line 123
    .line 124
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 125
    .line 126
    .line 127
    move-result v7

    .line 128
    if-eqz v7, :cond_5

    .line 129
    .line 130
    :cond_4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 131
    .line 132
    .line 133
    move-result p0

    .line 134
    if-nez p0, :cond_8

    .line 135
    .line 136
    :cond_5
    invoke-interface {p1}, Ll/t3m;->m0()Z

    .line 137
    .line 138
    .line 139
    move-result p0

    .line 140
    if-nez p0, :cond_6

    .line 141
    .line 142
    iget-object p0, v0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 143
    .line 144
    if-eqz p0, :cond_8

    .line 145
    .line 146
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Studies;->qualification:Lcom/p1/mobile/putong/data/QualificationType;

    .line 147
    .line 148
    if-eqz p0, :cond_8

    .line 149
    .line 150
    invoke-static {p0, v8}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 151
    .line 152
    .line 153
    move-result p0

    .line 154
    if-nez p0, :cond_8

    .line 155
    .line 156
    :cond_6
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 157
    .line 158
    .line 159
    move-result p0

    .line 160
    xor-int/2addr p0, v3

    .line 161
    iget-object p1, v0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 162
    .line 163
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Studies;->school:Ljava/lang/String;

    .line 164
    .line 165
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 166
    .line 167
    .line 168
    move-result p1

    .line 169
    xor-int/2addr p1, v3

    .line 170
    iget-object p2, v0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 171
    .line 172
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Studies;->qualification:Lcom/p1/mobile/putong/data/QualificationType;

    .line 173
    .line 174
    invoke-static {p2}, Ll/bsj0;->J(Lcom/p1/mobile/putong/data/QualificationType;)Z

    .line 175
    .line 176
    .line 177
    move-result p2

    .line 178
    if-eqz p2, :cond_7

    .line 179
    .line 180
    move v6, v4

    .line 181
    goto :goto_2

    .line 182
    :cond_7
    move p1, v4

    .line 183
    goto :goto_2

    .line 184
    :cond_8
    move p0, v4

    .line 185
    move p1, p0

    .line 186
    :goto_2
    invoke-static {}, Ll/r43;->b()Z

    .line 187
    .line 188
    .line 189
    move-result p2

    .line 190
    if-eqz p2, :cond_9

    .line 191
    .line 192
    iget-object p2, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 193
    .line 194
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 195
    .line 196
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Physical;->bloodType:Ljava/util/List;

    .line 197
    .line 198
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 199
    .line 200
    .line 201
    move-result p2

    .line 202
    if-nez p2, :cond_9

    .line 203
    .line 204
    iget-object p2, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 205
    .line 206
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 207
    .line 208
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Physical;->bloodType:Ljava/util/List;

    .line 209
    .line 210
    invoke-interface {p2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 211
    .line 212
    .line 213
    move-result-object p2

    .line 214
    check-cast p2, Lcom/p1/mobile/putong/data/BloodType;

    .line 215
    .line 216
    invoke-static {p2, v8}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 217
    .line 218
    .line 219
    move-result p2

    .line 220
    if-nez p2, :cond_9

    .line 221
    .line 222
    move p2, v3

    .line 223
    goto :goto_3

    .line 224
    :cond_9
    move p2, v4

    .line 225
    :goto_3
    iget-object v7, v0, Lcom/p1/mobile/putong/data/Profile;->hometown:Ljava/lang/String;

    .line 226
    .line 227
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 228
    .line 229
    .line 230
    move-result v7

    .line 231
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->hangouts:Ljava/lang/String;

    .line 232
    .line 233
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 234
    .line 235
    .line 236
    move-result v0

    .line 237
    if-nez v1, :cond_a

    .line 238
    .line 239
    if-nez v6, :cond_a

    .line 240
    .line 241
    if-nez v5, :cond_a

    .line 242
    .line 243
    if-nez v2, :cond_a

    .line 244
    .line 245
    if-eqz v7, :cond_a

    .line 246
    .line 247
    if-eqz v0, :cond_a

    .line 248
    .line 249
    if-nez p0, :cond_a

    .line 250
    .line 251
    if-nez p2, :cond_a

    .line 252
    .line 253
    if-nez p1, :cond_a

    .line 254
    .line 255
    return v4

    .line 256
    :cond_a
    return v3
.end method
