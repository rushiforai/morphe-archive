.class public final Ll/vzi0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/RestrictTo;
    value = {
        .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY_GROUP_PREFIX:Landroidx/annotation/RestrictTo$Scope;
    }
.end annotation


# static fields
.field public static final a:Ljava/lang/Object;

.field public static b:[C


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/Object;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/vzi0;->a:Ljava/lang/Object;

    .line 7
    .line 8
    const/16 v0, 0x18

    .line 9
    .line 10
    new-array v0, v0, [C

    .line 11
    .line 12
    sput-object v0, Ll/vzi0;->b:[C

    .line 13
    .line 14
    return-void
.end method

.method public static a(IIZI)I
    .locals 2

    .line 1
    const/16 v0, 0x63

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    if-gt p0, v0, :cond_5

    .line 5
    .line 6
    if-eqz p2, :cond_0

    .line 7
    .line 8
    if-lt p3, v1, :cond_0

    .line 9
    .line 10
    goto :goto_2

    .line 11
    :cond_0
    const/16 v0, 0x9

    .line 12
    .line 13
    const/4 v1, 0x2

    .line 14
    if-gt p0, v0, :cond_4

    .line 15
    .line 16
    if-eqz p2, :cond_1

    .line 17
    .line 18
    if-lt p3, v1, :cond_1

    .line 19
    .line 20
    goto :goto_1

    .line 21
    :cond_1
    if-nez p2, :cond_3

    .line 22
    .line 23
    if-lez p0, :cond_2

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_2
    const/4 p0, 0x0

    .line 27
    return p0

    .line 28
    :cond_3
    :goto_0
    add-int/lit8 p1, p1, 0x1

    .line 29
    .line 30
    return p1

    .line 31
    :cond_4
    :goto_1
    add-int/2addr p1, v1

    .line 32
    return p1

    .line 33
    :cond_5
    :goto_2
    add-int/2addr p1, v1

    .line 34
    return p1
.end method

.method public static b(JJLjava/io/PrintWriter;)V
    .locals 2
    .annotation build Landroidx/annotation/RestrictTo;
        value = {
            .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY_GROUP_PREFIX:Landroidx/annotation/RestrictTo$Scope;
        }
    .end annotation

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p0, v0

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string p0, "--"

    .line 8
    .line 9
    invoke-virtual {p4, p0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    sub-long/2addr p0, p2

    .line 14
    const/4 p2, 0x0

    .line 15
    invoke-static {p0, p1, p4, p2}, Ll/vzi0;->d(JLjava/io/PrintWriter;I)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static c(JLjava/io/PrintWriter;)V
    .locals 1
    .annotation build Landroidx/annotation/RestrictTo;
        value = {
            .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY_GROUP_PREFIX:Landroidx/annotation/RestrictTo$Scope;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, p2, v0}, Ll/vzi0;->d(JLjava/io/PrintWriter;I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static d(JLjava/io/PrintWriter;I)V
    .locals 2
    .annotation build Landroidx/annotation/RestrictTo;
        value = {
            .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY_GROUP_PREFIX:Landroidx/annotation/RestrictTo$Scope;
        }
    .end annotation

    .line 1
    sget-object v0, Ll/vzi0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    invoke-static {p0, p1, p3}, Ll/vzi0;->e(JI)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    new-instance p1, Ljava/lang/String;

    .line 9
    .line 10
    sget-object p3, Ll/vzi0;->b:[C

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-direct {p1, p3, v1, p0}, Ljava/lang/String;-><init>([CII)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    monitor-exit v0

    .line 20
    return-void

    .line 21
    :catchall_0
    move-exception p0

    .line 22
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    throw p0
.end method

.method public static e(JI)I
    .locals 16

    .line 1
    move-wide/from16 v0, p0

    .line 2
    .line 3
    move/from16 v2, p2

    .line 4
    .line 5
    sget-object v3, Ll/vzi0;->b:[C

    .line 6
    .line 7
    array-length v3, v3

    .line 8
    if-ge v3, v2, :cond_0

    .line 9
    .line 10
    new-array v3, v2, [C

    .line 11
    .line 12
    sput-object v3, Ll/vzi0;->b:[C

    .line 13
    .line 14
    :cond_0
    sget-object v4, Ll/vzi0;->b:[C

    .line 15
    .line 16
    const-wide/16 v5, 0x0

    .line 17
    .line 18
    cmp-long v3, v0, v5

    .line 19
    .line 20
    const/16 v5, 0x20

    .line 21
    .line 22
    const/4 v10, 0x1

    .line 23
    const/4 v11, 0x0

    .line 24
    if-nez v3, :cond_2

    .line 25
    .line 26
    add-int/lit8 v0, v2, -0x1

    .line 27
    .line 28
    :goto_0
    if-lez v0, :cond_1

    .line 29
    .line 30
    aput-char v5, v4, v11

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    const/16 v0, 0x30

    .line 34
    .line 35
    aput-char v0, v4, v11

    .line 36
    .line 37
    return v10

    .line 38
    :cond_2
    if-lez v3, :cond_3

    .line 39
    .line 40
    const/16 v3, 0x2b

    .line 41
    .line 42
    goto :goto_1

    .line 43
    :cond_3
    neg-long v0, v0

    .line 44
    const/16 v3, 0x2d

    .line 45
    .line 46
    :goto_1
    const-wide/16 v6, 0x3e8

    .line 47
    .line 48
    rem-long v8, v0, v6

    .line 49
    .line 50
    long-to-int v12, v8

    .line 51
    div-long/2addr v0, v6

    .line 52
    long-to-double v0, v0

    .line 53
    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    .line 54
    .line 55
    .line 56
    move-result-wide v0

    .line 57
    double-to-int v0, v0

    .line 58
    const v1, 0x15180

    .line 59
    .line 60
    .line 61
    if-le v0, v1, :cond_4

    .line 62
    .line 63
    div-int v6, v0, v1

    .line 64
    .line 65
    mul-int/2addr v1, v6

    .line 66
    sub-int/2addr v0, v1

    .line 67
    goto :goto_2

    .line 68
    :cond_4
    move v6, v11

    .line 69
    :goto_2
    const/16 v1, 0xe10

    .line 70
    .line 71
    if-le v0, v1, :cond_5

    .line 72
    .line 73
    div-int/lit16 v1, v0, 0xe10

    .line 74
    .line 75
    mul-int/lit16 v7, v1, 0xe10

    .line 76
    .line 77
    sub-int/2addr v0, v7

    .line 78
    goto :goto_3

    .line 79
    :cond_5
    move v1, v11

    .line 80
    :goto_3
    const/16 v7, 0x3c

    .line 81
    .line 82
    if-le v0, v7, :cond_6

    .line 83
    .line 84
    div-int/lit8 v7, v0, 0x3c

    .line 85
    .line 86
    mul-int/lit8 v8, v7, 0x3c

    .line 87
    .line 88
    sub-int/2addr v0, v8

    .line 89
    move v13, v7

    .line 90
    goto :goto_4

    .line 91
    :cond_6
    move v13, v11

    .line 92
    :goto_4
    const/4 v14, 0x3

    .line 93
    const/4 v15, 0x2

    .line 94
    if-eqz v2, :cond_b

    .line 95
    .line 96
    invoke-static {v6, v10, v11, v11}, Ll/vzi0;->a(IIZI)I

    .line 97
    .line 98
    .line 99
    move-result v7

    .line 100
    if-lez v7, :cond_7

    .line 101
    .line 102
    move v8, v10

    .line 103
    goto :goto_5

    .line 104
    :cond_7
    move v8, v11

    .line 105
    :goto_5
    invoke-static {v1, v10, v8, v15}, Ll/vzi0;->a(IIZI)I

    .line 106
    .line 107
    .line 108
    move-result v8

    .line 109
    add-int/2addr v7, v8

    .line 110
    if-lez v7, :cond_8

    .line 111
    .line 112
    move v8, v10

    .line 113
    goto :goto_6

    .line 114
    :cond_8
    move v8, v11

    .line 115
    :goto_6
    invoke-static {v13, v10, v8, v15}, Ll/vzi0;->a(IIZI)I

    .line 116
    .line 117
    .line 118
    move-result v8

    .line 119
    add-int/2addr v7, v8

    .line 120
    if-lez v7, :cond_9

    .line 121
    .line 122
    move v8, v10

    .line 123
    goto :goto_7

    .line 124
    :cond_9
    move v8, v11

    .line 125
    :goto_7
    invoke-static {v0, v10, v8, v15}, Ll/vzi0;->a(IIZI)I

    .line 126
    .line 127
    .line 128
    move-result v8

    .line 129
    add-int/2addr v7, v8

    .line 130
    if-lez v7, :cond_a

    .line 131
    .line 132
    move v8, v14

    .line 133
    goto :goto_8

    .line 134
    :cond_a
    move v8, v11

    .line 135
    :goto_8
    invoke-static {v12, v15, v10, v8}, Ll/vzi0;->a(IIZI)I

    .line 136
    .line 137
    .line 138
    move-result v8

    .line 139
    add-int/2addr v8, v10

    .line 140
    add-int/2addr v7, v8

    .line 141
    move v8, v11

    .line 142
    :goto_9
    if-ge v7, v2, :cond_c

    .line 143
    .line 144
    aput-char v5, v4, v8

    .line 145
    .line 146
    add-int/lit8 v8, v8, 0x1

    .line 147
    .line 148
    add-int/lit8 v7, v7, 0x1

    .line 149
    .line 150
    goto :goto_9

    .line 151
    :cond_b
    move v8, v11

    .line 152
    :cond_c
    aput-char v3, v4, v8

    .line 153
    .line 154
    add-int/lit8 v7, v8, 0x1

    .line 155
    .line 156
    if-eqz v2, :cond_d

    .line 157
    .line 158
    move v2, v10

    .line 159
    goto :goto_a

    .line 160
    :cond_d
    move v2, v11

    .line 161
    :goto_a
    const/4 v8, 0x0

    .line 162
    const/4 v9, 0x0

    .line 163
    move v5, v6

    .line 164
    const/16 v6, 0x64

    .line 165
    .line 166
    invoke-static/range {v4 .. v9}, Ll/vzi0;->f([CICIZI)I

    .line 167
    .line 168
    .line 169
    move-result v3

    .line 170
    move v5, v7

    .line 171
    if-eq v3, v5, :cond_e

    .line 172
    .line 173
    move v8, v10

    .line 174
    goto :goto_b

    .line 175
    :cond_e
    move v8, v11

    .line 176
    :goto_b
    if-eqz v2, :cond_f

    .line 177
    .line 178
    move v9, v15

    .line 179
    goto :goto_c

    .line 180
    :cond_f
    move v9, v11

    .line 181
    :goto_c
    const/16 v6, 0x68

    .line 182
    .line 183
    move v7, v5

    .line 184
    move v5, v1

    .line 185
    move v1, v7

    .line 186
    move v7, v3

    .line 187
    invoke-static/range {v4 .. v9}, Ll/vzi0;->f([CICIZI)I

    .line 188
    .line 189
    .line 190
    move-result v7

    .line 191
    if-eq v7, v1, :cond_10

    .line 192
    .line 193
    move v8, v10

    .line 194
    goto :goto_d

    .line 195
    :cond_10
    move v8, v11

    .line 196
    :goto_d
    if-eqz v2, :cond_11

    .line 197
    .line 198
    move v9, v15

    .line 199
    goto :goto_e

    .line 200
    :cond_11
    move v9, v11

    .line 201
    :goto_e
    const/16 v6, 0x6d

    .line 202
    .line 203
    move v5, v13

    .line 204
    invoke-static/range {v4 .. v9}, Ll/vzi0;->f([CICIZI)I

    .line 205
    .line 206
    .line 207
    move-result v7

    .line 208
    if-eq v7, v1, :cond_12

    .line 209
    .line 210
    move v8, v10

    .line 211
    goto :goto_f

    .line 212
    :cond_12
    move v8, v11

    .line 213
    :goto_f
    if-eqz v2, :cond_13

    .line 214
    .line 215
    move v9, v15

    .line 216
    goto :goto_10

    .line 217
    :cond_13
    move v9, v11

    .line 218
    :goto_10
    const/16 v6, 0x73

    .line 219
    .line 220
    move v5, v0

    .line 221
    invoke-static/range {v4 .. v9}, Ll/vzi0;->f([CICIZI)I

    .line 222
    .line 223
    .line 224
    move-result v7

    .line 225
    if-eqz v2, :cond_14

    .line 226
    .line 227
    if-eq v7, v1, :cond_14

    .line 228
    .line 229
    move v9, v14

    .line 230
    goto :goto_11

    .line 231
    :cond_14
    move v9, v11

    .line 232
    :goto_11
    const/16 v6, 0x6d

    .line 233
    .line 234
    const/4 v8, 0x1

    .line 235
    move v5, v12

    .line 236
    invoke-static/range {v4 .. v9}, Ll/vzi0;->f([CICIZI)I

    .line 237
    .line 238
    .line 239
    move-result v0

    .line 240
    const/16 v1, 0x73

    .line 241
    .line 242
    aput-char v1, v4, v0

    .line 243
    .line 244
    add-int/2addr v0, v10

    .line 245
    return v0
.end method

.method public static f([CICIZI)I
    .locals 2

    .line 1
    if-nez p4, :cond_1

    .line 2
    .line 3
    if-lez p1, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    return p3

    .line 7
    :cond_1
    :goto_0
    if-eqz p4, :cond_2

    .line 8
    .line 9
    const/4 v0, 0x3

    .line 10
    if-ge p5, v0, :cond_3

    .line 11
    .line 12
    :cond_2
    const/16 v0, 0x63

    .line 13
    .line 14
    if-le p1, v0, :cond_4

    .line 15
    .line 16
    :cond_3
    div-int/lit8 v0, p1, 0x64

    .line 17
    .line 18
    add-int/lit8 v1, v0, 0x30

    .line 19
    .line 20
    int-to-char v1, v1

    .line 21
    aput-char v1, p0, p3

    .line 22
    .line 23
    add-int/lit8 v1, p3, 0x1

    .line 24
    .line 25
    mul-int/lit8 v0, v0, 0x64

    .line 26
    .line 27
    sub-int/2addr p1, v0

    .line 28
    goto :goto_1

    .line 29
    :cond_4
    move v1, p3

    .line 30
    :goto_1
    const/4 v0, 0x2

    .line 31
    if-eqz p4, :cond_5

    .line 32
    .line 33
    if-ge p5, v0, :cond_6

    .line 34
    .line 35
    :cond_5
    const/16 p4, 0x9

    .line 36
    .line 37
    if-gt p1, p4, :cond_6

    .line 38
    .line 39
    if-eq p3, v1, :cond_7

    .line 40
    .line 41
    :cond_6
    div-int/lit8 p3, p1, 0xa

    .line 42
    .line 43
    add-int/lit8 p4, p3, 0x30

    .line 44
    .line 45
    int-to-char p4, p4

    .line 46
    aput-char p4, p0, v1

    .line 47
    .line 48
    add-int/lit8 v1, v1, 0x1

    .line 49
    .line 50
    mul-int/lit8 p3, p3, 0xa

    .line 51
    .line 52
    sub-int/2addr p1, p3

    .line 53
    :cond_7
    add-int/lit8 p1, p1, 0x30

    .line 54
    .line 55
    int-to-char p1, p1

    .line 56
    aput-char p1, p0, v1

    .line 57
    .line 58
    add-int/lit8 p1, v1, 0x1

    .line 59
    .line 60
    aput-char p2, p0, p1

    .line 61
    .line 62
    add-int/2addr v1, v0

    .line 63
    return v1
.end method
