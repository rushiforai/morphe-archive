.class public Ll/tcn;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ll/byd0;

.field public static final b:Ll/byd0;

.field public static final c:Ll/jxd0;

.field public static final d:Ll/jxd0;

.field public static e:Z


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Ll/byd0;

    .line 2
    .line 3
    const-wide/16 v1, -0x1

    .line 4
    .line 5
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const-string v2, "af_retention_day0_time"

    .line 10
    .line 11
    invoke-direct {v0, v2, v1}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 12
    .line 13
    .line 14
    sput-object v0, Ll/tcn;->a:Ll/byd0;

    .line 15
    .line 16
    new-instance v0, Ll/byd0;

    .line 17
    .line 18
    const-string v2, "app_last_retention_time"

    .line 19
    .line 20
    invoke-direct {v0, v2, v1}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 21
    .line 22
    .line 23
    sput-object v0, Ll/tcn;->b:Ll/byd0;

    .line 24
    .line 25
    new-instance v0, Ll/jxd0;

    .line 26
    .line 27
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 28
    .line 29
    const-string v2, "intl.event.D1-D2_retention"

    .line 30
    .line 31
    invoke-direct {v0, v2, v1}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 32
    .line 33
    .line 34
    sput-object v0, Ll/tcn;->c:Ll/jxd0;

    .line 35
    .line 36
    new-instance v0, Ll/jxd0;

    .line 37
    .line 38
    const-string v2, "intl.event.D1-D3_retention"

    .line 39
    .line 40
    invoke-direct {v0, v2, v1}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 41
    .line 42
    .line 43
    sput-object v0, Ll/tcn;->d:Ll/jxd0;

    .line 44
    .line 45
    const/4 v0, 0x0

    .line 46
    sput-boolean v0, Ll/tcn;->e:Z

    .line 47
    .line 48
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

.method public static synthetic a(Lcom/p1/mobile/android/app/Act$r;)V
    .locals 11

    .line 1
    if-eqz p0, :cond_a

    .line 2
    .line 3
    sget-object p0, Ll/tcn;->a:Ll/byd0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Ljava/lang/Long;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    const-wide/16 v2, 0x0

    .line 16
    .line 17
    cmp-long v0, v0, v2

    .line 18
    .line 19
    if-gez v0, :cond_0

    .line 20
    .line 21
    goto/16 :goto_2

    .line 22
    .line 23
    :cond_0
    sget-object v0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 26
    .line 27
    .line 28
    move-result-wide v0

    .line 29
    sget-object v2, Ll/tcn;->b:Ll/byd0;

    .line 30
    .line 31
    invoke-virtual {v2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    check-cast v3, Ljava/lang/Long;

    .line 36
    .line 37
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    .line 38
    .line 39
    .line 40
    move-result-wide v3

    .line 41
    cmp-long v3, v3, v0

    .line 42
    .line 43
    if-gez v3, :cond_a

    .line 44
    .line 45
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    invoke-virtual {v3, v0, v1}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 50
    .line 51
    .line 52
    const/16 v0, 0xb

    .line 53
    .line 54
    const/16 v1, 0x18

    .line 55
    .line 56
    invoke-virtual {v3, v0, v1}, Ljava/util/Calendar;->set(II)V

    .line 57
    .line 58
    .line 59
    const/16 v4, 0xc

    .line 60
    .line 61
    const/4 v5, 0x0

    .line 62
    invoke-virtual {v3, v4, v5}, Ljava/util/Calendar;->set(II)V

    .line 63
    .line 64
    .line 65
    const/16 v6, 0xd

    .line 66
    .line 67
    invoke-virtual {v3, v6, v5}, Ljava/util/Calendar;->set(II)V

    .line 68
    .line 69
    .line 70
    const/16 v7, 0xe

    .line 71
    .line 72
    invoke-virtual {v3, v7, v5}, Ljava/util/Calendar;->set(II)V

    .line 73
    .line 74
    .line 75
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 76
    .line 77
    .line 78
    move-result-object v8

    .line 79
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    check-cast p0, Ljava/lang/Long;

    .line 84
    .line 85
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 86
    .line 87
    .line 88
    move-result-wide v9

    .line 89
    invoke-virtual {v8, v9, v10}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {v8, v0, v1}, Ljava/util/Calendar;->set(II)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {v8, v4, v5}, Ljava/util/Calendar;->set(II)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v8, v6, v5}, Ljava/util/Calendar;->set(II)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {v8, v7, v5}, Ljava/util/Calendar;->set(II)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {v8}, Ljava/util/Calendar;->getTimeInMillis()J

    .line 105
    .line 106
    .line 107
    move-result-wide v0

    .line 108
    invoke-virtual {v3}, Ljava/util/Calendar;->getTimeInMillis()J

    .line 109
    .line 110
    .line 111
    move-result-wide v9

    .line 112
    cmp-long p0, v0, v9

    .line 113
    .line 114
    if-gez p0, :cond_1

    .line 115
    .line 116
    invoke-virtual {v3}, Ljava/util/Calendar;->getTimeInMillis()J

    .line 117
    .line 118
    .line 119
    move-result-wide v0

    .line 120
    invoke-virtual {v8}, Ljava/util/Calendar;->getTimeInMillis()J

    .line 121
    .line 122
    .line 123
    move-result-wide v8

    .line 124
    sub-long/2addr v0, v8

    .line 125
    const-wide/32 v8, 0x5265c00

    .line 126
    .line 127
    .line 128
    div-long/2addr v0, v8

    .line 129
    long-to-int p0, v0

    .line 130
    goto :goto_0

    .line 131
    :cond_1
    const/4 p0, -0x1

    .line 132
    :goto_0
    const/4 v0, 0x1

    .line 133
    const/4 v1, 0x3

    .line 134
    const/4 v4, 0x2

    .line 135
    if-eq p0, v0, :cond_7

    .line 136
    .line 137
    if-eq p0, v4, :cond_6

    .line 138
    .line 139
    if-eq p0, v1, :cond_5

    .line 140
    .line 141
    const/4 v0, 0x7

    .line 142
    if-eq p0, v0, :cond_4

    .line 143
    .line 144
    if-eq p0, v7, :cond_3

    .line 145
    .line 146
    const/16 v0, 0x1e

    .line 147
    .line 148
    if-eq p0, v0, :cond_2

    .line 149
    .line 150
    goto :goto_1

    .line 151
    :cond_2
    const-string v0, "Day30_retention"

    .line 152
    .line 153
    new-array v6, v5, [Ljava/lang/Object;

    .line 154
    .line 155
    invoke-static {v0, v6}, Ll/uqb0;->e1(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 156
    .line 157
    .line 158
    goto :goto_1

    .line 159
    :cond_3
    const-string v0, "Day14_retention"

    .line 160
    .line 161
    new-array v6, v5, [Ljava/lang/Object;

    .line 162
    .line 163
    invoke-static {v0, v6}, Ll/uqb0;->e1(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 164
    .line 165
    .line 166
    goto :goto_1

    .line 167
    :cond_4
    const-string v0, "Day7_retention"

    .line 168
    .line 169
    new-array v6, v5, [Ljava/lang/Object;

    .line 170
    .line 171
    invoke-static {v0, v6}, Ll/uqb0;->e1(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 172
    .line 173
    .line 174
    goto :goto_1

    .line 175
    :cond_5
    const-string v0, "Day3_retention"

    .line 176
    .line 177
    new-array v6, v5, [Ljava/lang/Object;

    .line 178
    .line 179
    invoke-static {v0, v6}, Ll/uqb0;->e1(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 180
    .line 181
    .line 182
    goto :goto_1

    .line 183
    :cond_6
    const-string v0, "Day2_retention"

    .line 184
    .line 185
    new-array v6, v5, [Ljava/lang/Object;

    .line 186
    .line 187
    invoke-static {v0, v6}, Ll/uqb0;->e1(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 188
    .line 189
    .line 190
    goto :goto_1

    .line 191
    :cond_7
    const-string v0, "Day1_retention"

    .line 192
    .line 193
    new-array v6, v5, [Ljava/lang/Object;

    .line 194
    .line 195
    invoke-static {v0, v6}, Ll/uqb0;->e1(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 196
    .line 197
    .line 198
    :goto_1
    if-gt p0, v4, :cond_8

    .line 199
    .line 200
    sget-object v0, Ll/tcn;->c:Ll/jxd0;

    .line 201
    .line 202
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 203
    .line 204
    .line 205
    move-result-object v4

    .line 206
    check-cast v4, Ljava/lang/Boolean;

    .line 207
    .line 208
    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    .line 209
    .line 210
    .line 211
    move-result v4

    .line 212
    if-nez v4, :cond_8

    .line 213
    .line 214
    const-string v4, "D1-D2_retention"

    .line 215
    .line 216
    new-array v6, v5, [Ljava/lang/Object;

    .line 217
    .line 218
    invoke-static {v4, v6}, Ll/uqb0;->e1(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 219
    .line 220
    .line 221
    sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 222
    .line 223
    invoke-virtual {v0, v4}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 224
    .line 225
    .line 226
    :cond_8
    if-gt p0, v1, :cond_9

    .line 227
    .line 228
    sget-object p0, Ll/tcn;->d:Ll/jxd0;

    .line 229
    .line 230
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 231
    .line 232
    .line 233
    move-result-object v0

    .line 234
    check-cast v0, Ljava/lang/Boolean;

    .line 235
    .line 236
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 237
    .line 238
    .line 239
    move-result v0

    .line 240
    if-nez v0, :cond_9

    .line 241
    .line 242
    const-string v0, "D1-D3_retention"

    .line 243
    .line 244
    new-array v1, v5, [Ljava/lang/Object;

    .line 245
    .line 246
    invoke-static {v0, v1}, Ll/uqb0;->e1(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 247
    .line 248
    .line 249
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 250
    .line 251
    invoke-virtual {p0, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 252
    .line 253
    .line 254
    :cond_9
    invoke-virtual {v3}, Ljava/util/Calendar;->getTimeInMillis()J

    .line 255
    .line 256
    .line 257
    move-result-wide v0

    .line 258
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 259
    .line 260
    .line 261
    move-result-object p0

    .line 262
    invoke-virtual {v2, p0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 263
    .line 264
    .line 265
    :cond_a
    :goto_2
    return-void
.end method

.method public static b()V
    .locals 3

    .line 1
    :try_start_0
    sget-object v0, Ll/uqb0;->c0:Ll/bn5;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/bn5;->me_()Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 10
    .line 11
    const-string v2, "female"

    .line 12
    .line 13
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    const/4 v2, 0x0

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    const-string v0, "signin_female_fb"

    .line 21
    .line 22
    new-array v1, v2, [Ljava/lang/Object;

    .line 23
    .line 24
    invoke-static {v0, v1}, Ll/uqb0;->e1(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    const-string v0, "signin_female"

    .line 28
    .line 29
    new-array v1, v2, [Ljava/lang/Object;

    .line 30
    .line 31
    invoke-static {v0, v1}, Ll/uqb0;->e1(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 36
    .line 37
    const-string v1, "male"

    .line 38
    .line 39
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_1

    .line 44
    .line 45
    const-string v0, "signin_male_fb"

    .line 46
    .line 47
    new-array v1, v2, [Ljava/lang/Object;

    .line 48
    .line 49
    invoke-static {v0, v1}, Ll/uqb0;->e1(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 50
    .line 51
    .line 52
    const-string v0, "signin_male"

    .line 53
    .line 54
    new-array v1, v2, [Ljava/lang/Object;

    .line 55
    .line 56
    invoke-static {v0, v1}, Ll/uqb0;->e1(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 57
    .line 58
    .line 59
    :catch_0
    :cond_1
    return-void
.end method

.method public static c()V
    .locals 3

    .line 1
    sget-object v0, Ll/uqb0;->c0:Ll/bn5;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/bn5;->me_()Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 10
    .line 11
    const-string v2, "female"

    .line 12
    .line 13
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    const/4 v2, 0x0

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    const-string v0, "signin_female_ph"

    .line 21
    .line 22
    new-array v1, v2, [Ljava/lang/Object;

    .line 23
    .line 24
    invoke-static {v0, v1}, Ll/uqb0;->e1(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    const-string v0, "signin_female"

    .line 28
    .line 29
    new-array v1, v2, [Ljava/lang/Object;

    .line 30
    .line 31
    invoke-static {v0, v1}, Ll/uqb0;->e1(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 36
    .line 37
    const-string v1, "male"

    .line 38
    .line 39
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_1

    .line 44
    .line 45
    const-string v0, "signin_male_ph"

    .line 46
    .line 47
    new-array v1, v2, [Ljava/lang/Object;

    .line 48
    .line 49
    invoke-static {v0, v1}, Ll/uqb0;->e1(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 50
    .line 51
    .line 52
    const-string v0, "signin_male"

    .line 53
    .line 54
    new-array v1, v2, [Ljava/lang/Object;

    .line 55
    .line 56
    invoke-static {v0, v1}, Ll/uqb0;->e1(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 57
    .line 58
    .line 59
    :cond_1
    return-void
.end method

.method public static d()V
    .locals 5

    .line 1
    sget-object v0, Ll/tcn;->a:Ll/byd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    check-cast v1, Ljava/lang/Long;

    .line 8
    .line 9
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 10
    .line 11
    .line 12
    move-result-wide v1

    .line 13
    const-wide/16 v3, 0x0

    .line 14
    .line 15
    cmp-long v1, v1, v3

    .line 16
    .line 17
    if-gez v1, :cond_0

    .line 18
    .line 19
    sget-object v1, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 20
    .line 21
    invoke-virtual {v1}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 22
    .line 23
    .line 24
    move-result-wide v1

    .line 25
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v0, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public static e(Lcom/p1/mobile/putong/data/User;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/16 v1, 0x27

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    const-string v3, "female"

    .line 11
    .line 12
    const/16 v4, 0x12

    .line 13
    .line 14
    if-lt v0, v4, :cond_1

    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    const/16 v5, 0x16

    .line 23
    .line 24
    if-gt v0, v5, :cond_1

    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 27
    .line 28
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_0

    .line 33
    .line 34
    const-string v0, "tantan_female_18to22"

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    const-string v0, "tantan_male_18to22"

    .line 38
    .line 39
    :goto_0
    new-array v5, v2, [Ljava/lang/Object;

    .line 40
    .line 41
    invoke-static {v0, v5}, Ll/uqb0;->e1(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    goto :goto_4

    .line 45
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 46
    .line 47
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    const/16 v5, 0x17

    .line 52
    .line 53
    if-lt v0, v5, :cond_3

    .line 54
    .line 55
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 56
    .line 57
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    const/16 v5, 0x1e

    .line 62
    .line 63
    if-gt v0, v5, :cond_3

    .line 64
    .line 65
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 66
    .line 67
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-eqz v0, :cond_2

    .line 72
    .line 73
    const-string v0, "tantan_female_23to30"

    .line 74
    .line 75
    goto :goto_1

    .line 76
    :cond_2
    const-string v0, "tantan_male_23to30"

    .line 77
    .line 78
    :goto_1
    new-array v5, v2, [Ljava/lang/Object;

    .line 79
    .line 80
    invoke-static {v0, v5}, Ll/uqb0;->e1(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 81
    .line 82
    .line 83
    goto :goto_4

    .line 84
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 85
    .line 86
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    const/16 v5, 0x1f

    .line 91
    .line 92
    if-lt v0, v5, :cond_5

    .line 93
    .line 94
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 95
    .line 96
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    if-gt v0, v1, :cond_5

    .line 101
    .line 102
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 103
    .line 104
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    if-eqz v0, :cond_4

    .line 109
    .line 110
    const-string v0, "tantan_female_31to39"

    .line 111
    .line 112
    goto :goto_2

    .line 113
    :cond_4
    const-string v0, "tantan_male_31to39"

    .line 114
    .line 115
    :goto_2
    new-array v5, v2, [Ljava/lang/Object;

    .line 116
    .line 117
    invoke-static {v0, v5}, Ll/uqb0;->e1(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 118
    .line 119
    .line 120
    goto :goto_4

    .line 121
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 122
    .line 123
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 124
    .line 125
    .line 126
    move-result v0

    .line 127
    if-eqz v0, :cond_6

    .line 128
    .line 129
    const-string v0, "tantan_female_over39"

    .line 130
    .line 131
    goto :goto_3

    .line 132
    :cond_6
    const-string v0, "tantan_male_over39"

    .line 133
    .line 134
    :goto_3
    new-array v5, v2, [Ljava/lang/Object;

    .line 135
    .line 136
    invoke-static {v0, v5}, Ll/uqb0;->e1(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 137
    .line 138
    .line 139
    :goto_4
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 140
    .line 141
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 142
    .line 143
    .line 144
    move-result v0

    .line 145
    if-lt v0, v4, :cond_8

    .line 146
    .line 147
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 148
    .line 149
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 150
    .line 151
    .line 152
    move-result v0

    .line 153
    if-gt v0, v1, :cond_8

    .line 154
    .line 155
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 156
    .line 157
    invoke-static {p0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 158
    .line 159
    .line 160
    move-result p0

    .line 161
    if-eqz p0, :cond_7

    .line 162
    .line 163
    const-string p0, "tantan_female_18to39"

    .line 164
    .line 165
    goto :goto_5

    .line 166
    :cond_7
    const-string p0, "tantan_male_18to39"

    .line 167
    .line 168
    :goto_5
    new-array v0, v2, [Ljava/lang/Object;

    .line 169
    .line 170
    invoke-static {p0, v0}, Ll/uqb0;->e1(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 171
    .line 172
    .line 173
    :cond_8
    return-void
.end method

.method public static f()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/scn;

    .line 6
    .line 7
    invoke-direct {v1}, Ll/scn;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 15
    .line 16
    .line 17
    return-void
.end method
