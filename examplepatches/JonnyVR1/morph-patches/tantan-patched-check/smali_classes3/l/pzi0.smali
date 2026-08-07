.class public Ll/pzi0;
.super Ll/tzi0;
.source "SourceFile"


# static fields
.field public static a:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static final b:Ljava/text/SimpleDateFormat;

.field public static final c:Ljava/text/SimpleDateFormat;

.field public static final d:Ljava/text/SimpleDateFormat;

.field public static final e:Ljava/text/SimpleDateFormat;

.field public static final f:Ljava/text/SimpleDateFormat;

.field public static final g:Ljava/text/SimpleDateFormat;

.field public static final h:Ljava/text/SimpleDateFormat;

.field public static final i:Ljava/text/SimpleDateFormat;

.field public static final j:Ljava/text/SimpleDateFormat;

.field public static final k:Ljava/text/SimpleDateFormat;

.field public static final l:Ljava/text/SimpleDateFormat;

.field public static final m:Ljava/text/SimpleDateFormat;

.field public static final n:Ljava/text/SimpleDateFormat;

.field public static final o:Ljava/text/SimpleDateFormat;

.field public static final p:Ljava/text/SimpleDateFormat;

.field public static q:Ljava/util/Calendar;

.field public static r:Ljava/util/Calendar;


# direct methods
.method static constructor <clinit>()V
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
    const/4 v0, 0x3

    .line 7
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    const/4 v0, 0x5

    .line 12
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    const/4 v0, 0x7

    .line 17
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 18
    .line 19
    .line 20
    move-result-object v4

    .line 21
    const/16 v0, 0x8

    .line 22
    .line 23
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 24
    .line 25
    .line 26
    move-result-object v5

    .line 27
    const/16 v0, 0xa

    .line 28
    .line 29
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 30
    .line 31
    .line 32
    move-result-object v6

    .line 33
    const/16 v0, 0xc

    .line 34
    .line 35
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 36
    .line 37
    .line 38
    move-result-object v7

    .line 39
    filled-new-array/range {v1 .. v7}, [Ljava/lang/Integer;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    sput-object v0, Ll/pzi0;->a:Ljava/util/ArrayList;

    .line 48
    .line 49
    new-instance v0, Ll/m8c;

    .line 50
    .line 51
    const-string v1, "yy/MM/dd"

    .line 52
    .line 53
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    invoke-direct {v0, v1, v2}, Ll/m8c;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0}, Ll/m8c;->a()Ljava/text/SimpleDateFormat;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    sput-object v0, Ll/pzi0;->b:Ljava/text/SimpleDateFormat;

    .line 65
    .line 66
    new-instance v0, Ll/m8c;

    .line 67
    .line 68
    const-string v1, "yyyy/MM/dd"

    .line 69
    .line 70
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    invoke-direct {v0, v1, v2}, Ll/m8c;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0}, Ll/m8c;->a()Ljava/text/SimpleDateFormat;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    sput-object v0, Ll/pzi0;->c:Ljava/text/SimpleDateFormat;

    .line 82
    .line 83
    new-instance v0, Ll/m8c;

    .line 84
    .line 85
    const-string v1, "yyyy-MM-dd"

    .line 86
    .line 87
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    invoke-direct {v0, v1, v2}, Ll/m8c;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {v0}, Ll/m8c;->a()Ljava/text/SimpleDateFormat;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    sput-object v0, Ll/pzi0;->d:Ljava/text/SimpleDateFormat;

    .line 99
    .line 100
    new-instance v0, Ll/m8c;

    .line 101
    .line 102
    const-string v1, "yyyy-MM-dd HH:mm"

    .line 103
    .line 104
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 105
    .line 106
    .line 107
    move-result-object v2

    .line 108
    invoke-direct {v0, v1, v2}, Ll/m8c;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {v0}, Ll/m8c;->a()Ljava/text/SimpleDateFormat;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    sput-object v0, Ll/pzi0;->e:Ljava/text/SimpleDateFormat;

    .line 116
    .line 117
    new-instance v0, Ll/m8c;

    .line 118
    .line 119
    const-string v1, "yyyy-MM-dd HH:mm:ss"

    .line 120
    .line 121
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 122
    .line 123
    .line 124
    move-result-object v2

    .line 125
    invoke-direct {v0, v1, v2}, Ll/m8c;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 126
    .line 127
    .line 128
    invoke-virtual {v0}, Ll/m8c;->a()Ljava/text/SimpleDateFormat;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    sput-object v0, Ll/pzi0;->f:Ljava/text/SimpleDateFormat;

    .line 133
    .line 134
    new-instance v0, Ll/m8c;

    .line 135
    .line 136
    const-string v1, "MM/dd"

    .line 137
    .line 138
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 139
    .line 140
    .line 141
    move-result-object v2

    .line 142
    invoke-direct {v0, v1, v2}, Ll/m8c;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 143
    .line 144
    .line 145
    invoke-virtual {v0}, Ll/m8c;->a()Ljava/text/SimpleDateFormat;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    sput-object v0, Ll/pzi0;->g:Ljava/text/SimpleDateFormat;

    .line 150
    .line 151
    new-instance v0, Ljava/text/SimpleDateFormat;

    .line 152
    .line 153
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 154
    .line 155
    .line 156
    move-result-object v1

    .line 157
    const-string v2, "HH:mm"

    .line 158
    .line 159
    invoke-direct {v0, v2, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 160
    .line 161
    .line 162
    sput-object v0, Ll/pzi0;->h:Ljava/text/SimpleDateFormat;

    .line 163
    .line 164
    new-instance v0, Ljava/text/SimpleDateFormat;

    .line 165
    .line 166
    const-string v1, "HH:mm:ss"

    .line 167
    .line 168
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 169
    .line 170
    .line 171
    move-result-object v3

    .line 172
    invoke-direct {v0, v1, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 173
    .line 174
    .line 175
    sput-object v0, Ll/pzi0;->i:Ljava/text/SimpleDateFormat;

    .line 176
    .line 177
    new-instance v0, Ljava/text/SimpleDateFormat;

    .line 178
    .line 179
    const-string v1, "MM\u6708dd\u65e5"

    .line 180
    .line 181
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 182
    .line 183
    .line 184
    move-result-object v3

    .line 185
    invoke-direct {v0, v1, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 186
    .line 187
    .line 188
    sput-object v0, Ll/pzi0;->j:Ljava/text/SimpleDateFormat;

    .line 189
    .line 190
    new-instance v0, Ljava/text/SimpleDateFormat;

    .line 191
    .line 192
    const-string v1, "yyyy"

    .line 193
    .line 194
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 195
    .line 196
    .line 197
    move-result-object v3

    .line 198
    invoke-direct {v0, v1, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 199
    .line 200
    .line 201
    sput-object v0, Ll/pzi0;->k:Ljava/text/SimpleDateFormat;

    .line 202
    .line 203
    new-instance v0, Ll/m8c;

    .line 204
    .line 205
    const-string v1, "MM-dd HH:mm"

    .line 206
    .line 207
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 208
    .line 209
    .line 210
    move-result-object v3

    .line 211
    invoke-direct {v0, v1, v3}, Ll/m8c;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 212
    .line 213
    .line 214
    invoke-virtual {v0}, Ll/m8c;->a()Ljava/text/SimpleDateFormat;

    .line 215
    .line 216
    .line 217
    move-result-object v0

    .line 218
    sput-object v0, Ll/pzi0;->l:Ljava/text/SimpleDateFormat;

    .line 219
    .line 220
    new-instance v0, Ll/m8c;

    .line 221
    .line 222
    const-string v1, "MM-dd"

    .line 223
    .line 224
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 225
    .line 226
    .line 227
    move-result-object v3

    .line 228
    invoke-direct {v0, v1, v3}, Ll/m8c;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 229
    .line 230
    .line 231
    invoke-virtual {v0}, Ll/m8c;->a()Ljava/text/SimpleDateFormat;

    .line 232
    .line 233
    .line 234
    move-result-object v0

    .line 235
    sput-object v0, Ll/pzi0;->m:Ljava/text/SimpleDateFormat;

    .line 236
    .line 237
    new-instance v0, Ljava/text/SimpleDateFormat;

    .line 238
    .line 239
    const-string v1, "MMM"

    .line 240
    .line 241
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 242
    .line 243
    .line 244
    move-result-object v3

    .line 245
    invoke-direct {v0, v1, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 246
    .line 247
    .line 248
    sput-object v0, Ll/pzi0;->n:Ljava/text/SimpleDateFormat;

    .line 249
    .line 250
    new-instance v0, Ljava/text/SimpleDateFormat;

    .line 251
    .line 252
    const-string v1, "dd"

    .line 253
    .line 254
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 255
    .line 256
    .line 257
    move-result-object v3

    .line 258
    invoke-direct {v0, v1, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 259
    .line 260
    .line 261
    sput-object v0, Ll/pzi0;->o:Ljava/text/SimpleDateFormat;

    .line 262
    .line 263
    new-instance v0, Ljava/text/SimpleDateFormat;

    .line 264
    .line 265
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 266
    .line 267
    .line 268
    move-result-object v1

    .line 269
    invoke-direct {v0, v2, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 270
    .line 271
    .line 272
    sput-object v0, Ll/pzi0;->p:Ljava/text/SimpleDateFormat;

    .line 273
    .line 274
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 275
    .line 276
    .line 277
    move-result-object v0

    .line 278
    sput-object v0, Ll/pzi0;->q:Ljava/util/Calendar;

    .line 279
    .line 280
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 281
    .line 282
    .line 283
    move-result-object v0

    .line 284
    sput-object v0, Ll/pzi0;->r:Ljava/util/Calendar;

    .line 285
    .line 286
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/tzi0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static A(IIIJ)Z
    .locals 3

    .line 1
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Ll/pzi0;->o()J

    .line 6
    .line 7
    .line 8
    move-result-wide v1

    .line 9
    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 10
    .line 11
    .line 12
    const/16 v1, 0xb

    .line 13
    .line 14
    invoke-virtual {v0, v1, p0}, Ljava/util/Calendar;->set(II)V

    .line 15
    .line 16
    .line 17
    const/16 p0, 0xc

    .line 18
    .line 19
    invoke-virtual {v0, p0, p1}, Ljava/util/Calendar;->set(II)V

    .line 20
    .line 21
    .line 22
    const/16 p0, 0xd

    .line 23
    .line 24
    invoke-virtual {v0, p0, p2}, Ljava/util/Calendar;->set(II)V

    .line 25
    .line 26
    .line 27
    const/16 p0, 0xe

    .line 28
    .line 29
    const/4 p1, 0x0

    .line 30
    invoke-virtual {v0, p0, p1}, Ljava/util/Calendar;->set(II)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    .line 34
    .line 35
    .line 36
    move-result-wide v0

    .line 37
    sub-long/2addr p3, v0

    .line 38
    const-wide/16 v0, 0x0

    .line 39
    .line 40
    cmp-long p0, p3, v0

    .line 41
    .line 42
    if-lez p0, :cond_0

    .line 43
    .line 44
    const/4 p0, 0x1

    .line 45
    return p0

    .line 46
    :cond_0
    return p1
.end method

.method public static B(IJ)Z
    .locals 4

    .line 1
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Ll/pzi0;->o()J

    .line 6
    .line 7
    .line 8
    move-result-wide v1

    .line 9
    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v1, p1, p2}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 17
    .line 18
    .line 19
    const/4 p1, 0x1

    .line 20
    invoke-virtual {v0, p1}, Ljava/util/Calendar;->get(I)I

    .line 21
    .line 22
    .line 23
    move-result p2

    .line 24
    invoke-virtual {v1, p1}, Ljava/util/Calendar;->get(I)I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    const/4 v3, 0x6

    .line 29
    invoke-virtual {v0, v3}, Ljava/util/Calendar;->get(I)I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    invoke-virtual {v1, v3}, Ljava/util/Calendar;->get(I)I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    :goto_0
    if-ge v2, p2, :cond_1

    .line 38
    .line 39
    invoke-static {v2}, Ll/pzi0;->y(I)Z

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    if-eqz v3, :cond_0

    .line 44
    .line 45
    const/16 v3, 0x16e

    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_0
    const/16 v3, 0x16d

    .line 49
    .line 50
    :goto_1
    add-int/2addr v0, v3

    .line 51
    add-int/lit8 v2, v2, 0x1

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_1
    sub-int/2addr v0, v1

    .line 55
    if-lt v0, p0, :cond_2

    .line 56
    .line 57
    return p1

    .line 58
    :cond_2
    const/4 p0, 0x0

    .line 59
    return p0
.end method

.method public static C(JJ)Z
    .locals 1

    .line 1
    new-instance v0, Ljava/util/Date;

    .line 2
    .line 3
    invoke-direct {v0, p2, p3}, Ljava/util/Date;-><init>(J)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    invoke-virtual {p2, v0}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 14
    .line 15
    .line 16
    move-result-object p3

    .line 17
    new-instance v0, Ljava/util/Date;

    .line 18
    .line 19
    invoke-direct {v0, p0, p1}, Ljava/util/Date;-><init>(J)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p3, v0}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 23
    .line 24
    .line 25
    const/4 p0, 0x5

    .line 26
    invoke-virtual {p2, p0}, Ljava/util/Calendar;->get(I)I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    invoke-virtual {p3, p0}, Ljava/util/Calendar;->get(I)I

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    if-ne p1, p0, :cond_0

    .line 35
    .line 36
    const/4 p0, 0x2

    .line 37
    invoke-virtual {p2, p0}, Ljava/util/Calendar;->get(I)I

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    invoke-virtual {p3, p0}, Ljava/util/Calendar;->get(I)I

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    if-ne p1, p0, :cond_0

    .line 46
    .line 47
    const/4 p0, 0x1

    .line 48
    invoke-virtual {p2, p0}, Ljava/util/Calendar;->get(I)I

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    invoke-virtual {p3, p0}, Ljava/util/Calendar;->get(I)I

    .line 53
    .line 54
    .line 55
    move-result p2

    .line 56
    if-ne p1, p2, :cond_0

    .line 57
    .line 58
    return p0

    .line 59
    :cond_0
    const/4 p0, 0x0

    .line 60
    return p0
.end method

.method public static D(J)Z
    .locals 3

    .line 1
    new-instance v0, Ljava/util/Date;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ljava/util/Date;-><init>(J)V

    .line 4
    .line 5
    .line 6
    new-instance p0, Ljava/text/SimpleDateFormat;

    .line 7
    .line 8
    const-string p1, "yyyy-MM-dd"

    .line 9
    .line 10
    invoke-direct {p0, p1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, v0}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    new-instance v0, Ljava/util/Date;

    .line 18
    .line 19
    invoke-static {}, Ll/pzi0;->o()J

    .line 20
    .line 21
    .line 22
    move-result-wide v1

    .line 23
    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, v0}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    return p0
.end method

.method public static E(JI)Z
    .locals 10

    .line 1
    const/4 v0, 0x1

    .line 2
    :try_start_0
    new-instance v1, Ljava/util/Date;

    .line 3
    .line 4
    invoke-direct {v1, p0, p1}, Ljava/util/Date;-><init>(J)V

    .line 5
    .line 6
    .line 7
    new-instance v2, Ljava/text/SimpleDateFormat;

    .line 8
    .line 9
    const-string v3, "yyyy-MM-dd"

    .line 10
    .line 11
    invoke-direct {v2, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v2, v1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-static {}, Ll/pzi0;->o()J

    .line 19
    .line 20
    .line 21
    move-result-wide v3

    .line 22
    new-instance v5, Ljava/util/Date;

    .line 23
    .line 24
    invoke-direct {v5, v3, v4}, Ljava/util/Date;-><init>(J)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v2, v5}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v5

    .line 31
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 32
    .line 33
    .line 34
    move-result-object v6

    .line 35
    invoke-virtual {v2, v6}, Ljava/text/Format;->format(Ljava/lang/Object;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v6

    .line 39
    invoke-virtual {v2, v6}, Ljava/text/DateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    .line 40
    .line 41
    .line 42
    move-result-object v6

    .line 43
    invoke-virtual {v6}, Ljava/util/Date;->getTime()J

    .line 44
    .line 45
    .line 46
    move-result-wide v6

    .line 47
    sub-long v6, v3, v6

    .line 48
    .line 49
    const-wide/16 v8, 0x3e8

    .line 50
    .line 51
    div-long/2addr v6, v8

    .line 52
    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    const/4 v5, 0x0

    .line 57
    if-eqz v1, :cond_2

    .line 58
    .line 59
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-virtual {v2, v1}, Ljava/text/Format;->format(Ljava/lang/Object;)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    invoke-virtual {v2, v1}, Ljava/text/DateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    .line 72
    .line 73
    .line 74
    move-result-wide v1

    .line 75
    sub-long/2addr p0, v1

    .line 76
    div-long/2addr p0, v8
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 77
    int-to-long v1, p2

    .line 78
    cmp-long p0, p0, v1

    .line 79
    .line 80
    if-lez p0, :cond_0

    .line 81
    .line 82
    return v0

    .line 83
    :cond_0
    cmp-long p0, v6, v1

    .line 84
    .line 85
    if-gez p0, :cond_1

    .line 86
    .line 87
    return v0

    .line 88
    :cond_1
    return v5

    .line 89
    :catch_0
    move-exception p0

    .line 90
    goto :goto_0

    .line 91
    :cond_2
    int-to-long v1, p2

    .line 92
    cmp-long v1, v6, v1

    .line 93
    .line 94
    if-lez v1, :cond_3

    .line 95
    .line 96
    return v5

    .line 97
    :cond_3
    sub-long/2addr v3, p0

    .line 98
    const p0, 0x15180

    .line 99
    .line 100
    .line 101
    sub-int/2addr p0, p2

    .line 102
    int-to-long p0, p0

    .line 103
    add-long/2addr p0, v6

    .line 104
    cmp-long p0, v3, p0

    .line 105
    .line 106
    if-gez p0, :cond_4

    .line 107
    .line 108
    return v0

    .line 109
    :cond_4
    return v5

    .line 110
    :goto_0
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 114
    .line 115
    .line 116
    return v0
.end method

.method public static F(JLjava/util/TimeZone;)Z
    .locals 2

    .line 1
    new-instance v0, Ljava/util/Date;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ljava/util/Date;-><init>(J)V

    .line 4
    .line 5
    .line 6
    invoke-static {p2}, Ljava/util/Calendar;->getInstance(Ljava/util/TimeZone;)Ljava/util/Calendar;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0, v0}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 11
    .line 12
    .line 13
    new-instance p1, Ljava/util/Date;

    .line 14
    .line 15
    invoke-static {}, Ll/pzi0;->o()J

    .line 16
    .line 17
    .line 18
    move-result-wide v0

    .line 19
    invoke-direct {p1, v0, v1}, Ljava/util/Date;-><init>(J)V

    .line 20
    .line 21
    .line 22
    const/4 p2, 0x5

    .line 23
    const/4 v0, 0x1

    .line 24
    invoke-virtual {p0, p2, v0}, Ljava/util/Calendar;->add(II)V

    .line 25
    .line 26
    .line 27
    const/16 p2, 0xb

    .line 28
    .line 29
    const/4 v1, 0x3

    .line 30
    invoke-virtual {p0, p2, v1}, Ljava/util/Calendar;->set(II)V

    .line 31
    .line 32
    .line 33
    const/16 p2, 0xc

    .line 34
    .line 35
    const/4 v1, 0x0

    .line 36
    invoke-virtual {p0, p2, v1}, Ljava/util/Calendar;->set(II)V

    .line 37
    .line 38
    .line 39
    const/16 p2, 0xd

    .line 40
    .line 41
    invoke-virtual {p0, p2, v1}, Ljava/util/Calendar;->set(II)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {p0, p1}, Ljava/util/Date;->compareTo(Ljava/util/Date;)I

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    if-lez p0, :cond_0

    .line 53
    .line 54
    return v0

    .line 55
    :cond_0
    return v1
.end method

.method public static G(D)Ljava/lang/String;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, v0}, Ll/pzi0;->I(DZ)Ljava/lang/String;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public static H(DJ)Ljava/lang/String;
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 2
    .line 3
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    double-to-long p0, p0

    .line 8
    invoke-virtual {v1, p0, p1}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 9
    .line 10
    .line 11
    const/4 v2, 0x1

    .line 12
    invoke-virtual {v1, v2}, Ljava/util/Calendar;->get(I)I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    const/16 v2, 0x7b2

    .line 17
    .line 18
    if-gt v1, v2, :cond_0

    .line 19
    .line 20
    sget p0, Lcom/p1/mobile/putong/common/R$string;->z2:I

    .line 21
    .line 22
    invoke-virtual {v0, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0

    .line 27
    :cond_0
    sub-long/2addr p2, p0

    .line 28
    const-wide/16 p0, 0x3e8

    .line 29
    .line 30
    div-long/2addr p2, p0

    .line 31
    const-wide/32 p0, 0x1e13380

    .line 32
    .line 33
    .line 34
    cmp-long v1, p2, p0

    .line 35
    .line 36
    const-wide/16 v2, 0x1

    .line 37
    .line 38
    if-lez v1, :cond_2

    .line 39
    .line 40
    div-long/2addr p2, p0

    .line 41
    long-to-int p0, p2

    .line 42
    int-to-long p0, p0

    .line 43
    cmp-long p2, p0, v2

    .line 44
    .line 45
    if-lez p2, :cond_1

    .line 46
    .line 47
    sget p2, Lcom/p1/mobile/putong/common/R$string;->p:I

    .line 48
    .line 49
    goto/16 :goto_0

    .line 50
    .line 51
    :cond_1
    sget p2, Lcom/p1/mobile/putong/common/R$string;->o:I

    .line 52
    .line 53
    goto/16 :goto_0

    .line 54
    .line 55
    :cond_2
    const-wide/32 p0, 0x278d00

    .line 56
    .line 57
    .line 58
    cmp-long v1, p2, p0

    .line 59
    .line 60
    if-lez v1, :cond_4

    .line 61
    .line 62
    div-long/2addr p2, p0

    .line 63
    long-to-int p0, p2

    .line 64
    int-to-long p0, p0

    .line 65
    cmp-long p2, p0, v2

    .line 66
    .line 67
    if-lez p2, :cond_3

    .line 68
    .line 69
    sget p2, Lcom/p1/mobile/putong/common/R$string;->l:I

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_3
    sget p2, Lcom/p1/mobile/putong/common/R$string;->k:I

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_4
    const-wide/32 p0, 0x93a80

    .line 76
    .line 77
    .line 78
    cmp-long v1, p2, p0

    .line 79
    .line 80
    if-lez v1, :cond_6

    .line 81
    .line 82
    div-long/2addr p2, p0

    .line 83
    long-to-int p0, p2

    .line 84
    int-to-long p0, p0

    .line 85
    cmp-long p2, p0, v2

    .line 86
    .line 87
    if-lez p2, :cond_5

    .line 88
    .line 89
    sget p2, Lcom/p1/mobile/putong/common/R$string;->n:I

    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_5
    sget p2, Lcom/p1/mobile/putong/common/R$string;->m:I

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_6
    const-wide/32 p0, 0x15180

    .line 96
    .line 97
    .line 98
    cmp-long v1, p2, p0

    .line 99
    .line 100
    if-lez v1, :cond_8

    .line 101
    .line 102
    div-long/2addr p2, p0

    .line 103
    long-to-int p0, p2

    .line 104
    int-to-long p0, p0

    .line 105
    cmp-long p2, p0, v2

    .line 106
    .line 107
    if-lez p2, :cond_7

    .line 108
    .line 109
    sget p2, Lcom/p1/mobile/putong/common/R$string;->j:I

    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_7
    sget p2, Lcom/p1/mobile/putong/common/R$string;->i:I

    .line 113
    .line 114
    goto :goto_0

    .line 115
    :cond_8
    const-wide/16 p0, 0xe10

    .line 116
    .line 117
    cmp-long v1, p2, p0

    .line 118
    .line 119
    if-lez v1, :cond_a

    .line 120
    .line 121
    div-long/2addr p2, p0

    .line 122
    long-to-int p0, p2

    .line 123
    int-to-long p0, p0

    .line 124
    cmp-long p2, p0, v2

    .line 125
    .line 126
    if-lez p2, :cond_9

    .line 127
    .line 128
    sget p2, Lcom/p1/mobile/putong/common/R$string;->x2:I

    .line 129
    .line 130
    goto :goto_0

    .line 131
    :cond_9
    sget p2, Lcom/p1/mobile/putong/common/R$string;->w2:I

    .line 132
    .line 133
    goto :goto_0

    .line 134
    :cond_a
    const-wide/16 p0, 0x3c

    .line 135
    .line 136
    cmp-long v1, p2, p0

    .line 137
    .line 138
    if-lez v1, :cond_c

    .line 139
    .line 140
    div-long/2addr p2, p0

    .line 141
    long-to-int p0, p2

    .line 142
    int-to-long p0, p0

    .line 143
    cmp-long p2, p0, v2

    .line 144
    .line 145
    if-lez p2, :cond_b

    .line 146
    .line 147
    sget p2, Lcom/p1/mobile/putong/common/R$string;->B2:I

    .line 148
    .line 149
    goto :goto_0

    .line 150
    :cond_b
    sget p2, Lcom/p1/mobile/putong/common/R$string;->A2:I

    .line 151
    .line 152
    :goto_0
    sget p3, Lcom/p1/mobile/putong/common/R$string;->v2:I

    .line 153
    .line 154
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 155
    .line 156
    .line 157
    move-result-object p0

    .line 158
    invoke-virtual {v0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object p1

    .line 162
    filled-new-array {p0, p1}, [Ljava/lang/Object;

    .line 163
    .line 164
    .line 165
    move-result-object p0

    .line 166
    invoke-virtual {v0, p3, p0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object p0

    .line 170
    return-object p0

    .line 171
    :cond_c
    sget p0, Lcom/p1/mobile/putong/common/R$string;->z2:I

    .line 172
    .line 173
    invoke-virtual {v0, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object p0

    .line 177
    return-object p0
.end method

.method public static I(DZ)Ljava/lang/String;
    .locals 2

    .line 1
    sget-object p2, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    invoke-static {p0, p1, v0, v1}, Ll/pzi0;->H(DJ)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static J(DZ)Ljava/lang/String;
    .locals 3

    .line 1
    sget-object p2, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    double-to-long p0, p0

    .line 8
    sub-long/2addr v0, p0

    .line 9
    const-wide/16 p0, 0x3e8

    .line 10
    .line 11
    div-long/2addr v0, p0

    .line 12
    sget-object p0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 13
    .line 14
    const-wide/16 p1, 0x12c

    .line 15
    .line 16
    cmp-long p1, v0, p1

    .line 17
    .line 18
    if-gez p1, :cond_0

    .line 19
    .line 20
    sget p1, Lcom/p1/mobile/putong/common/R$string;->b0:I

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0

    .line 27
    :cond_0
    const-wide/32 p1, 0x15180

    .line 28
    .line 29
    .line 30
    cmp-long p1, v0, p1

    .line 31
    .line 32
    if-gez p1, :cond_2

    .line 33
    .line 34
    const-wide/16 p1, 0xe10

    .line 35
    .line 36
    cmp-long v2, v0, p1

    .line 37
    .line 38
    if-gez v2, :cond_1

    .line 39
    .line 40
    const-wide/16 p1, 0x3c

    .line 41
    .line 42
    div-long/2addr v0, p1

    .line 43
    sget p1, Lcom/p1/mobile/putong/common/R$string;->y0:I

    .line 44
    .line 45
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object p2

    .line 53
    invoke-virtual {p0, p1, p2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    return-object p0

    .line 58
    :cond_1
    div-long/2addr v0, p1

    .line 59
    sget p1, Lcom/p1/mobile/putong/common/R$string;->x0:I

    .line 60
    .line 61
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p2

    .line 65
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object p2

    .line 69
    invoke-virtual {p0, p1, p2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    return-object p0

    .line 74
    :cond_2
    const-wide/32 p1, 0x69780

    .line 75
    .line 76
    .line 77
    cmp-long p1, v0, p1

    .line 78
    .line 79
    if-gtz p1, :cond_3

    .line 80
    .line 81
    sget p1, Lcom/p1/mobile/putong/common/R$string;->Z1:I

    .line 82
    .line 83
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    return-object p0

    .line 88
    :cond_3
    const-wide/32 p1, 0x13c680

    .line 89
    .line 90
    .line 91
    cmp-long p1, v0, p1

    .line 92
    .line 93
    if-gtz p1, :cond_4

    .line 94
    .line 95
    sget p1, Lcom/p1/mobile/putong/common/R$string;->H2:I

    .line 96
    .line 97
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    return-object p0

    .line 102
    :cond_4
    const-string p0, ""

    .line 103
    .line 104
    return-object p0
.end method

.method public static K(D)Z
    .locals 2

    .line 1
    sget-object v0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    double-to-long p0, p0

    .line 8
    sub-long/2addr v0, p0

    .line 9
    const-wide/16 p0, 0x3e8

    .line 10
    .line 11
    div-long/2addr v0, p0

    .line 12
    const-wide/16 p0, 0x258

    .line 13
    .line 14
    cmp-long p0, v0, p0

    .line 15
    .line 16
    if-gtz p0, :cond_0

    .line 17
    .line 18
    const/4 p0, 0x1

    .line 19
    return p0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0
.end method

.method public static L(DJZZ)Ljava/lang/String;
    .locals 6

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 2
    .line 3
    double-to-long p0, p0

    .line 4
    sub-long/2addr p2, p0

    .line 5
    const-wide/16 p0, 0x3e8

    .line 6
    .line 7
    div-long/2addr p2, p0

    .line 8
    const-wide/32 p0, 0x93a80

    .line 9
    .line 10
    .line 11
    cmp-long p0, p2, p0

    .line 12
    .line 13
    if-lez p0, :cond_2

    .line 14
    .line 15
    if-eqz p4, :cond_0

    .line 16
    .line 17
    const-string p0, ""

    .line 18
    .line 19
    return-object p0

    .line 20
    :cond_0
    if-eqz p5, :cond_1

    .line 21
    .line 22
    const-string p0, "\u8fd1\u671f\u6d3b\u8dc3"

    .line 23
    .line 24
    return-object p0

    .line 25
    :cond_1
    const-string p0, "\u8fd1\u671f\u6d3b\u8dc3\u8fc7"

    .line 26
    .line 27
    return-object p0

    .line 28
    :cond_2
    const-wide/32 p0, 0x15180

    .line 29
    .line 30
    .line 31
    cmp-long v1, p2, p0

    .line 32
    .line 33
    const-wide/16 v2, 0x1

    .line 34
    .line 35
    if-ltz v1, :cond_6

    .line 36
    .line 37
    div-long/2addr p2, p0

    .line 38
    long-to-int p0, p2

    .line 39
    int-to-long p0, p0

    .line 40
    cmp-long p2, p0, v2

    .line 41
    .line 42
    if-lez p2, :cond_3

    .line 43
    .line 44
    sget p2, Lcom/p1/mobile/putong/common/R$string;->j:I

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_3
    sget p2, Lcom/p1/mobile/putong/common/R$string;->i:I

    .line 48
    .line 49
    :goto_0
    if-eqz p4, :cond_5

    .line 50
    .line 51
    if-eqz p5, :cond_4

    .line 52
    .line 53
    const-string p0, "\u6700\u8fd1\u6d3b\u8dc3"

    .line 54
    .line 55
    return-object p0

    .line 56
    :cond_4
    const-string p0, "\u6700\u8fd1\u6d3b\u8dc3\u8fc7"

    .line 57
    .line 58
    return-object p0

    .line 59
    :cond_5
    sget p3, Lcom/p1/mobile/putong/common/R$string;->v2:I

    .line 60
    .line 61
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {v0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    filled-new-array {p0, p1}, [Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-virtual {v0, p3, p0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    goto :goto_3

    .line 78
    :cond_6
    const-wide/16 p0, 0xe10

    .line 79
    .line 80
    cmp-long p4, p2, p0

    .line 81
    .line 82
    if-ltz p4, :cond_8

    .line 83
    .line 84
    div-long/2addr p2, p0

    .line 85
    long-to-int p0, p2

    .line 86
    int-to-long p0, p0

    .line 87
    cmp-long p2, p0, v2

    .line 88
    .line 89
    if-lez p2, :cond_7

    .line 90
    .line 91
    sget p2, Lcom/p1/mobile/putong/common/R$string;->x2:I

    .line 92
    .line 93
    goto :goto_1

    .line 94
    :cond_7
    sget p2, Lcom/p1/mobile/putong/common/R$string;->w2:I

    .line 95
    .line 96
    :goto_1
    sget p3, Lcom/p1/mobile/putong/common/R$string;->v2:I

    .line 97
    .line 98
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    invoke-virtual {v0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    filled-new-array {p0, p1}, [Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    invoke-virtual {v0, p3, p0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    goto :goto_3

    .line 115
    :cond_8
    const-wide/16 p0, 0x258

    .line 116
    .line 117
    cmp-long p0, p2, p0

    .line 118
    .line 119
    const-wide/16 v4, 0x3c

    .line 120
    .line 121
    if-lez p0, :cond_b

    .line 122
    .line 123
    div-long/2addr p2, v4

    .line 124
    long-to-int p0, p2

    .line 125
    int-to-long p0, p0

    .line 126
    cmp-long p2, p0, v2

    .line 127
    .line 128
    if-lez p2, :cond_9

    .line 129
    .line 130
    sget p2, Lcom/p1/mobile/putong/common/R$string;->B2:I

    .line 131
    .line 132
    goto :goto_2

    .line 133
    :cond_9
    sget p2, Lcom/p1/mobile/putong/common/R$string;->A2:I

    .line 134
    .line 135
    :goto_2
    sget p3, Lcom/p1/mobile/putong/common/R$string;->v2:I

    .line 136
    .line 137
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    invoke-virtual {v0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    filled-new-array {p0, p1}, [Ljava/lang/Object;

    .line 146
    .line 147
    .line 148
    move-result-object p0

    .line 149
    invoke-virtual {v0, p3, p0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object p0

    .line 153
    :goto_3
    if-eqz p5, :cond_a

    .line 154
    .line 155
    return-object p0

    .line 156
    :cond_a
    const-string p1, "%s\u6d3b\u8dc3"

    .line 157
    .line 158
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 159
    .line 160
    .line 161
    move-result-object p0

    .line 162
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object p0

    .line 166
    return-object p0

    .line 167
    :cond_b
    cmp-long p0, p2, v4

    .line 168
    .line 169
    if-ltz p0, :cond_c

    .line 170
    .line 171
    const-string p0, "\u521a\u521a\u6d3b\u8dc3"

    .line 172
    .line 173
    return-object p0

    .line 174
    :cond_c
    if-eqz p5, :cond_d

    .line 175
    .line 176
    const-string p0, "\u5728\u7ebf"

    .line 177
    .line 178
    return-object p0

    .line 179
    :cond_d
    const-string p0, "\u73b0\u5728\u6d3b\u8dc3"

    .line 180
    .line 181
    return-object p0
.end method

.method public static M(DZZ)Ljava/lang/String;
    .locals 7

    .line 1
    sget-object v0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 4
    .line 5
    .line 6
    move-result-wide v3

    .line 7
    move-wide v1, p0

    .line 8
    move v5, p2

    .line 9
    move v6, p3

    .line 10
    invoke-static/range {v1 .. v6}, Ll/pzi0;->L(DJZZ)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public static N(D)Ljava/lang/String;
    .locals 8

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 2
    .line 3
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    double-to-long v2, p0

    .line 8
    invoke-virtual {v1, v2, v3}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 9
    .line 10
    .line 11
    const/4 v4, 0x1

    .line 12
    invoke-virtual {v1, v4}, Ljava/util/Calendar;->get(I)I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    const/16 v4, 0x7b2

    .line 17
    .line 18
    if-gt v1, v4, :cond_0

    .line 19
    .line 20
    sget p0, Lcom/p1/mobile/putong/common/R$string;->z2:I

    .line 21
    .line 22
    invoke-virtual {v0, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0

    .line 27
    :cond_0
    sget-object v1, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 28
    .line 29
    invoke-virtual {v1}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 30
    .line 31
    .line 32
    move-result-wide v4

    .line 33
    sub-long/2addr v4, v2

    .line 34
    const-wide/16 v1, 0x3e8

    .line 35
    .line 36
    div-long/2addr v4, v1

    .line 37
    const-wide/16 v1, 0x3c

    .line 38
    .line 39
    cmp-long v3, v4, v1

    .line 40
    .line 41
    if-gez v3, :cond_1

    .line 42
    .line 43
    sget p0, Lcom/p1/mobile/putong/common/R$string;->z2:I

    .line 44
    .line 45
    invoke-virtual {v0, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    return-object p0

    .line 50
    :cond_1
    const-wide/16 v6, 0xe10

    .line 51
    .line 52
    cmp-long v3, v4, v6

    .line 53
    .line 54
    if-gez v3, :cond_2

    .line 55
    .line 56
    div-long/2addr v4, v1

    .line 57
    long-to-int p0, v4

    .line 58
    int-to-long p0, p0

    .line 59
    sget v1, Lcom/p1/mobile/putong/common/R$string;->C2:I

    .line 60
    .line 61
    new-instance v2, Ljava/lang/StringBuilder;

    .line 62
    .line 63
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v2, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    return-object p0

    .line 81
    :cond_2
    const-wide/32 v1, 0x15180

    .line 82
    .line 83
    .line 84
    cmp-long v1, v4, v1

    .line 85
    .line 86
    if-gez v1, :cond_3

    .line 87
    .line 88
    div-long/2addr v4, v6

    .line 89
    long-to-int p0, v4

    .line 90
    int-to-long p0, p0

    .line 91
    sget v1, Lcom/p1/mobile/putong/common/R$string;->y2:I

    .line 92
    .line 93
    new-instance v2, Ljava/lang/StringBuilder;

    .line 94
    .line 95
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v2, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    return-object p0

    .line 113
    :cond_3
    sget-object v0, Ll/pzi0;->b:Ljava/text/SimpleDateFormat;

    .line 114
    .line 115
    invoke-static {p0, p1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    invoke-virtual {v0, p0}, Ljava/text/Format;->format(Ljava/lang/Object;)Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    return-object p0
.end method

.method public static k(D)Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(D)",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmpg-double v0, p0, v0

    .line 4
    .line 5
    if-gtz v0, :cond_0

    .line 6
    .line 7
    const-string p0, "0"

    .line 8
    .line 9
    filled-new-array {p0}, [Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0

    .line 18
    :cond_0
    const-wide v0, 0x4194997000000000L    # 8.64E7

    .line 19
    .line 20
    .line 21
    .line 22
    .line 23
    div-double v2, p0, v0

    .line 24
    .line 25
    double-to-int v2, v2

    .line 26
    rem-double v0, p0, v0

    .line 27
    .line 28
    const-wide v3, 0x414b774000000000L    # 3600000.0

    .line 29
    .line 30
    .line 31
    .line 32
    .line 33
    div-double/2addr v0, v3

    .line 34
    double-to-int v0, v0

    .line 35
    rem-double v3, p0, v3

    .line 36
    .line 37
    const-wide v5, 0x40ed4c0000000000L    # 60000.0

    .line 38
    .line 39
    .line 40
    .line 41
    .line 42
    div-double/2addr v3, v5

    .line 43
    double-to-int v1, v3

    .line 44
    rem-double/2addr p0, v5

    .line 45
    const-wide v3, 0x408f400000000000L    # 1000.0

    .line 46
    .line 47
    .line 48
    .line 49
    .line 50
    div-double/2addr p0, v3

    .line 51
    double-to-int p0, p0

    .line 52
    const-string p1, "%02d"

    .line 53
    .line 54
    if-lez v2, :cond_1

    .line 55
    .line 56
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    const-string v4, "%d"

    .line 69
    .line 70
    invoke-static {v3, v4, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 75
    .line 76
    .line 77
    move-result-object v3

    .line 78
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-static {v3, p1, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 91
    .line 92
    .line 93
    move-result-object v3

    .line 94
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    invoke-static {v3, p1, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 107
    .line 108
    .line 109
    move-result-object v3

    .line 110
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    invoke-static {v3, p1, p0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    filled-new-array {v2, v0, v1, p0}, [Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    return-object p0

    .line 131
    :cond_1
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 132
    .line 133
    .line 134
    move-result-object v2

    .line 135
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    invoke-static {v2, p1, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 148
    .line 149
    .line 150
    move-result-object v2

    .line 151
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 152
    .line 153
    .line 154
    move-result-object v1

    .line 155
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 156
    .line 157
    .line 158
    move-result-object v1

    .line 159
    invoke-static {v2, p1, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object v1

    .line 163
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 164
    .line 165
    .line 166
    move-result-object v2

    .line 167
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 168
    .line 169
    .line 170
    move-result-object p0

    .line 171
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 172
    .line 173
    .line 174
    move-result-object p0

    .line 175
    invoke-static {v2, p1, p0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object p0

    .line 179
    filled-new-array {v0, v1, p0}, [Ljava/lang/String;

    .line 180
    .line 181
    .line 182
    move-result-object p0

    .line 183
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 184
    .line 185
    .line 186
    move-result-object p0

    .line 187
    return-object p0
.end method

.method public static l(D)Ljava/lang/String;
    .locals 2

    .line 1
    sget-object v0, Ll/pzi0;->g:Ljava/text/SimpleDateFormat;

    .line 2
    .line 3
    new-instance v1, Ljava/util/Date;

    .line 4
    .line 5
    double-to-long p0, p0

    .line 6
    invoke-direct {v1, p0, p1}, Ljava/util/Date;-><init>(J)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static m(J)Ljava/lang/String;
    .locals 4
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "StringFormatInvalid",
            "StringFormatMatches"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/Date;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ljava/util/Date;-><init>(J)V

    .line 4
    .line 5
    .line 6
    new-instance p0, Ljava/util/Date;

    .line 7
    .line 8
    invoke-static {}, Ll/pzi0;->o()J

    .line 9
    .line 10
    .line 11
    move-result-wide v1

    .line 12
    invoke-direct {p0, v1, v2}, Ljava/util/Date;-><init>(J)V

    .line 13
    .line 14
    .line 15
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p1, v0}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 20
    .line 21
    .line 22
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0, p0}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 27
    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    invoke-virtual {v0, p0}, Ljava/util/Calendar;->get(I)I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    invoke-virtual {p1, p0}, Ljava/util/Calendar;->get(I)I

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    sub-int/2addr v1, v2

    .line 39
    const/4 v2, 0x2

    .line 40
    invoke-virtual {v0, v2}, Ljava/util/Calendar;->get(I)I

    .line 41
    .line 42
    .line 43
    move-result v3

    .line 44
    invoke-virtual {p1, v2}, Ljava/util/Calendar;->get(I)I

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    sub-int/2addr v3, v2

    .line 49
    const/4 v2, 0x5

    .line 50
    invoke-virtual {v0, v2}, Ljava/util/Calendar;->get(I)I

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    invoke-virtual {p1, v2}, Ljava/util/Calendar;->get(I)I

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    sub-int/2addr v0, p1

    .line 59
    if-gez v3, :cond_0

    .line 60
    .line 61
    add-int/lit8 v1, v1, -0x1

    .line 62
    .line 63
    add-int/lit8 v3, v3, 0xc

    .line 64
    .line 65
    :cond_0
    if-gez v0, :cond_3

    .line 66
    .line 67
    if-lez v3, :cond_1

    .line 68
    .line 69
    add-int/lit8 v0, v0, 0x1e

    .line 70
    .line 71
    :cond_1
    add-int/lit8 p1, v3, -0x1

    .line 72
    .line 73
    if-gez p1, :cond_2

    .line 74
    .line 75
    add-int/lit8 v1, v1, -0x1

    .line 76
    .line 77
    add-int/lit8 v3, v3, 0xb

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_2
    move v3, p1

    .line 81
    :cond_3
    :goto_0
    if-gtz v1, :cond_5

    .line 82
    .line 83
    if-ge v3, p0, :cond_5

    .line 84
    .line 85
    if-gt v0, p0, :cond_4

    .line 86
    .line 87
    sget-object p0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 88
    .line 89
    sget p1, Lcom/p1/mobile/putong/common/R$string;->Q1:I

    .line 90
    .line 91
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    return-object p0

    .line 96
    :cond_4
    sget-object p0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 97
    .line 98
    sget p1, Lcom/p1/mobile/putong/common/R$string;->O1:I

    .line 99
    .line 100
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    invoke-virtual {p0, p1, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    return-object p0

    .line 113
    :cond_5
    if-ge v1, p0, :cond_7

    .line 114
    .line 115
    if-ne v3, p0, :cond_6

    .line 116
    .line 117
    sget-object p0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 118
    .line 119
    sget p1, Lcom/p1/mobile/putong/common/R$string;->R1:I

    .line 120
    .line 121
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    return-object p0

    .line 126
    :cond_6
    sget-object p0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 127
    .line 128
    sget p1, Lcom/p1/mobile/putong/common/R$string;->P1:I

    .line 129
    .line 130
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    invoke-virtual {p0, p1, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    return-object p0

    .line 143
    :cond_7
    if-ne v1, p0, :cond_8

    .line 144
    .line 145
    sget-object p0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 146
    .line 147
    sget p1, Lcom/p1/mobile/putong/common/R$string;->S1:I

    .line 148
    .line 149
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object p0

    .line 153
    return-object p0

    .line 154
    :cond_8
    sget-object p0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 155
    .line 156
    sget p1, Lcom/p1/mobile/putong/common/R$string;->T1:I

    .line 157
    .line 158
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    invoke-virtual {p0, p1, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object p0

    .line 170
    return-object p0
.end method

.method public static n()J
    .locals 2

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-static {v0, v1}, Ll/tzi0;->c(J)J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public static o()J
    .locals 2

    .line 1
    sget-object v0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public static p(D)Ljava/lang/String;
    .locals 2

    .line 1
    sget-object v0, Ll/pzi0;->f:Ljava/text/SimpleDateFormat;

    .line 2
    .line 3
    new-instance v1, Ljava/util/Date;

    .line 4
    .line 5
    double-to-long p0, p0

    .line 6
    invoke-direct {v1, p0, p1}, Ljava/util/Date;-><init>(J)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static q()Ljava/text/SimpleDateFormat;
    .locals 3

    .line 1
    new-instance v0, Ll/m8c;

    .line 2
    .line 3
    const-string v1, "EEEE yy/MM/dd HH:mm"

    .line 4
    .line 5
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-direct {v0, v1, v2}, Ll/m8c;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0}, Ll/m8c;->a()Ljava/text/SimpleDateFormat;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    return-object v0
.end method

.method public static r(II)I
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    if-ne p1, v0, :cond_1

    .line 3
    .line 4
    invoke-static {p0}, Ll/pzi0;->y(I)Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    const/16 p0, 0x1d

    .line 11
    .line 12
    return p0

    .line 13
    :cond_0
    const/16 p0, 0x1c

    .line 14
    .line 15
    return p0

    .line 16
    :cond_1
    sget-object p0, Ll/pzi0;->a:Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    if-eqz p0, :cond_2

    .line 27
    .line 28
    const/16 p0, 0x1f

    .line 29
    .line 30
    return p0

    .line 31
    :cond_2
    const/16 p0, 0x1e

    .line 32
    .line 33
    return p0
.end method

.method public static s(III)J
    .locals 4

    .line 1
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Ll/pzi0;->o()J

    .line 6
    .line 7
    .line 8
    move-result-wide v1

    .line 9
    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 10
    .line 11
    .line 12
    const/16 v1, 0xb

    .line 13
    .line 14
    invoke-virtual {v0, v1, p0}, Ljava/util/Calendar;->set(II)V

    .line 15
    .line 16
    .line 17
    const/16 p0, 0xc

    .line 18
    .line 19
    invoke-virtual {v0, p0, p1}, Ljava/util/Calendar;->set(II)V

    .line 20
    .line 21
    .line 22
    const/16 p0, 0xd

    .line 23
    .line 24
    invoke-virtual {v0, p0, p2}, Ljava/util/Calendar;->set(II)V

    .line 25
    .line 26
    .line 27
    const/16 p0, 0xe

    .line 28
    .line 29
    const/4 p1, 0x0

    .line 30
    invoke-virtual {v0, p0, p1}, Ljava/util/Calendar;->set(II)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    .line 34
    .line 35
    .line 36
    move-result-wide p0

    .line 37
    invoke-static {}, Ll/pzi0;->o()J

    .line 38
    .line 39
    .line 40
    move-result-wide v0

    .line 41
    sub-long/2addr v0, p0

    .line 42
    const-wide/16 v2, 0x0

    .line 43
    .line 44
    cmp-long p2, v0, v2

    .line 45
    .line 46
    if-lez p2, :cond_0

    .line 47
    .line 48
    const-wide/32 v0, 0x5265c00

    .line 49
    .line 50
    .line 51
    add-long/2addr p0, v0

    .line 52
    invoke-static {}, Ll/pzi0;->o()J

    .line 53
    .line 54
    .line 55
    move-result-wide v0

    .line 56
    :goto_0
    sub-long/2addr p0, v0

    .line 57
    return-wide p0

    .line 58
    :cond_0
    invoke-static {}, Ll/pzi0;->o()J

    .line 59
    .line 60
    .line 61
    move-result-wide v0

    .line 62
    goto :goto_0
.end method

.method public static t()Ljava/lang/String;
    .locals 3

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-static {}, Ljava/text/DateFormat;->getDateInstance()Ljava/text/DateFormat;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v2, v0}, Ljava/text/Format;->format(Ljava/lang/Object;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    return-object v0
.end method

.method public static u()Ljava/text/SimpleDateFormat;
    .locals 3

    .line 1
    new-instance v0, Ljava/text/SimpleDateFormat;

    .line 2
    .line 3
    const-string v1, "EEEE"

    .line 4
    .line 5
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 10
    .line 11
    .line 12
    return-object v0
.end method

.method public static v(J)Z
    .locals 4

    .line 1
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    new-instance v2, Ljava/util/Date;

    .line 10
    .line 11
    invoke-direct {v2, p0, p1}, Ljava/util/Date;-><init>(J)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v2}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 15
    .line 16
    .line 17
    new-instance p0, Ljava/util/Date;

    .line 18
    .line 19
    invoke-static {}, Ll/pzi0;->o()J

    .line 20
    .line 21
    .line 22
    move-result-wide v2

    .line 23
    invoke-direct {p0, v2, v3}, Ljava/util/Date;-><init>(J)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1, p0}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 27
    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    invoke-virtual {v0, p0}, Ljava/util/Calendar;->get(I)I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    invoke-virtual {v1, p0}, Ljava/util/Calendar;->get(I)I

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    if-ne p1, v2, :cond_0

    .line 39
    .line 40
    const/4 p1, 0x3

    .line 41
    invoke-virtual {v0, p1}, Ljava/util/Calendar;->get(I)I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    invoke-virtual {v1, p1}, Ljava/util/Calendar;->get(I)I

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-ne v0, p1, :cond_0

    .line 50
    .line 51
    return p0

    .line 52
    :cond_0
    const/4 p0, 0x0

    .line 53
    return p0
.end method

.method public static w(JI)Z
    .locals 4

    .line 1
    new-instance v0, Ljava/util/Date;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ljava/util/Date;-><init>(J)V

    .line 4
    .line 5
    .line 6
    new-instance p0, Ljava/util/Date;

    .line 7
    .line 8
    invoke-static {}, Ll/pzi0;->o()J

    .line 9
    .line 10
    .line 11
    move-result-wide v1

    .line 12
    invoke-direct {p0, v1, v2}, Ljava/util/Date;-><init>(J)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/util/Date;->getTime()J

    .line 16
    .line 17
    .line 18
    move-result-wide p0

    .line 19
    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    .line 20
    .line 21
    .line 22
    move-result-wide v0

    .line 23
    sub-long/2addr p0, v0

    .line 24
    int-to-long v0, p2

    .line 25
    const-wide/32 v2, 0x36ee80

    .line 26
    .line 27
    .line 28
    mul-long/2addr v0, v2

    .line 29
    cmp-long p0, p0, v0

    .line 30
    .line 31
    if-ltz p0, :cond_0

    .line 32
    .line 33
    const/4 p0, 0x1

    .line 34
    return p0

    .line 35
    :cond_0
    const/4 p0, 0x0

    .line 36
    return p0
.end method

.method public static x(II)Z
    .locals 7

    .line 1
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Ll/pzi0;->o()J

    .line 6
    .line 7
    .line 8
    move-result-wide v1

    .line 9
    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/util/Calendar;->clone()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    check-cast v1, Ljava/util/Calendar;

    .line 17
    .line 18
    const/16 v2, 0xb

    .line 19
    .line 20
    invoke-virtual {v1, v2, p0}, Ljava/util/Calendar;->set(II)V

    .line 21
    .line 22
    .line 23
    const/16 v3, 0xc

    .line 24
    .line 25
    const/4 v4, 0x0

    .line 26
    invoke-virtual {v1, v3, v4}, Ljava/util/Calendar;->set(II)V

    .line 27
    .line 28
    .line 29
    const/16 v5, 0xd

    .line 30
    .line 31
    invoke-virtual {v1, v5, v4}, Ljava/util/Calendar;->set(II)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/util/Calendar;->clone()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v6

    .line 38
    check-cast v6, Ljava/util/Calendar;

    .line 39
    .line 40
    invoke-virtual {v6, v2, p1}, Ljava/util/Calendar;->set(II)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v6, v3, v4}, Ljava/util/Calendar;->set(II)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v6, v5, v4}, Ljava/util/Calendar;->set(II)V

    .line 47
    .line 48
    .line 49
    const/4 v2, 0x1

    .line 50
    if-gt p0, p1, :cond_1

    .line 51
    .line 52
    invoke-virtual {v0, v1}, Ljava/util/Calendar;->after(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    if-eqz p0, :cond_0

    .line 57
    .line 58
    invoke-virtual {v0, v6}, Ljava/util/Calendar;->before(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    if-eqz p0, :cond_0

    .line 63
    .line 64
    return v2

    .line 65
    :cond_0
    return v4

    .line 66
    :cond_1
    invoke-virtual {v0, v1}, Ljava/util/Calendar;->after(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result p0

    .line 70
    if-nez p0, :cond_3

    .line 71
    .line 72
    invoke-virtual {v0, v6}, Ljava/util/Calendar;->before(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result p0

    .line 76
    if-eqz p0, :cond_2

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_2
    return v4

    .line 80
    :cond_3
    :goto_0
    return v2
.end method

.method public static y(I)Z
    .locals 2

    .line 1
    rem-int/lit8 v0, p0, 0x64

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    rem-int/lit16 v0, p0, 0x190

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    return v1

    .line 11
    :cond_0
    rem-int/lit8 p0, p0, 0x4

    .line 12
    .line 13
    if-nez p0, :cond_1

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_1
    return v1
.end method

.method public static z(III)Z
    .locals 2

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-static {p0, p1, p2, v0, v1}, Ll/pzi0;->A(IIIJ)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
