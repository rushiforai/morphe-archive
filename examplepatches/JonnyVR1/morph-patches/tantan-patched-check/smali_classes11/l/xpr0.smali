.class public final Ll/xpr0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/xor0;


# static fields
.field public static final g:Ljava/util/regex/Pattern;


# instance fields
.field public final a:Z

.field public final b:Ll/wpr0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final c:Ll/bgw0;

.field public d:Ljava/util/Map;

.field public e:F

.field public f:F


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "(?:(\\d+):)?(\\d+):(\\d+)[:.](\\d+)"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Ll/xpr0;->g:Ljava/util/regex/Pattern;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 81
    invoke-direct {p0, v0}, Ll/xpr0;-><init>(Ljava/util/List;)V

    return-void
.end method

.method public constructor <init>(Ljava/util/List;)V
    .locals 3
    .param p1    # Ljava/util/List;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const v0, -0x800001

    .line 5
    .line 6
    .line 7
    iput v0, p0, Ll/xpr0;->e:F

    .line 8
    .line 9
    iput v0, p0, Ll/xpr0;->f:F

    .line 10
    .line 11
    new-instance v0, Ll/bgw0;

    .line 12
    .line 13
    invoke-direct {v0}, Ll/bgw0;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/xpr0;->c:Ll/bgw0;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-nez v1, :cond_0

    .line 26
    .line 27
    const/4 v1, 0x1

    .line 28
    iput-boolean v1, p0, Ll/xpr0;->a:Z

    .line 29
    .line 30
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, [B

    .line 35
    .line 36
    invoke-static {v0}, Ll/mpw0;->O([B)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    const-string v2, "Format:"

    .line 41
    .line 42
    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    invoke-static {v2}, Ll/lev0;->d(Z)V

    .line 47
    .line 48
    .line 49
    invoke-static {v0}, Ll/wpr0;->a(Ljava/lang/String;)Ll/wpr0;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 54
    .line 55
    .line 56
    iput-object v0, p0, Ll/xpr0;->b:Ll/wpr0;

    .line 57
    .line 58
    new-instance v0, Ll/bgw0;

    .line 59
    .line 60
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    check-cast p1, [B

    .line 65
    .line 66
    invoke-direct {v0, p1}, Ll/bgw0;-><init>([B)V

    .line 67
    .line 68
    .line 69
    sget-object p1, Ll/cow0;->c:Ljava/nio/charset/Charset;

    .line 70
    .line 71
    invoke-virtual {p0, v0, p1}, Ll/xpr0;->e(Ll/bgw0;Ljava/nio/charset/Charset;)V

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :cond_0
    iput-boolean v0, p0, Ll/xpr0;->a:Z

    .line 76
    .line 77
    const/4 p1, 0x0

    .line 78
    iput-object p1, p0, Ll/xpr0;->b:Ll/wpr0;

    .line 79
    .line 80
    return-void
.end method

.method private static b(I)F
    .locals 1

    .line 1
    if-eqz p0, :cond_2

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eq p0, v0, :cond_1

    .line 5
    .line 6
    const/4 v0, 0x2

    .line 7
    if-eq p0, v0, :cond_0

    .line 8
    .line 9
    const p0, -0x800001

    .line 10
    .line 11
    .line 12
    return p0

    .line 13
    :cond_0
    const p0, 0x3f733333    # 0.95f

    .line 14
    .line 15
    .line 16
    return p0

    .line 17
    :cond_1
    const/high16 p0, 0x3f000000    # 0.5f

    .line 18
    .line 19
    return p0

    .line 20
    :cond_2
    const p0, 0x3d4ccccd    # 0.05f

    .line 21
    .line 22
    .line 23
    return p0
.end method

.method public static c(JLjava/util/List;Ljava/util/List;)I
    .locals 3

    .line 1
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    :cond_0
    add-int/lit8 v0, v0, -0x1

    .line 6
    .line 7
    if-ltz v0, :cond_2

    .line 8
    .line 9
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    check-cast v1, Ljava/lang/Long;

    .line 14
    .line 15
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 16
    .line 17
    .line 18
    move-result-wide v1

    .line 19
    cmp-long v1, v1, p0

    .line 20
    .line 21
    if-nez v1, :cond_1

    .line 22
    .line 23
    return v0

    .line 24
    :cond_1
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    check-cast v1, Ljava/lang/Long;

    .line 29
    .line 30
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 31
    .line 32
    .line 33
    move-result-wide v1

    .line 34
    cmp-long v1, v1, p0

    .line 35
    .line 36
    if-gez v1, :cond_0

    .line 37
    .line 38
    add-int/lit8 v0, v0, 0x1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_2
    const/4 v0, 0x0

    .line 42
    :goto_0
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-interface {p2, v0, p0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 47
    .line 48
    .line 49
    if-nez v0, :cond_3

    .line 50
    .line 51
    new-instance p0, Ljava/util/ArrayList;

    .line 52
    .line 53
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 54
    .line 55
    .line 56
    goto :goto_1

    .line 57
    :cond_3
    add-int/lit8 p0, v0, -0x1

    .line 58
    .line 59
    new-instance p1, Ljava/util/ArrayList;

    .line 60
    .line 61
    invoke-interface {p3, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    check-cast p0, Ljava/util/Collection;

    .line 66
    .line 67
    invoke-direct {p1, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 68
    .line 69
    .line 70
    move-object p0, p1

    .line 71
    :goto_1
    invoke-interface {p3, v0, p0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 72
    .line 73
    .line 74
    return v0
.end method

.method public static d(Ljava/lang/String;)J
    .locals 10

    .line 1
    sget-object v0, Ll/xpr0;->g:Ljava/util/regex/Pattern;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->matches()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 18
    .line 19
    .line 20
    .line 21
    .line 22
    return-wide v0

    .line 23
    :cond_0
    const/4 v0, 0x1

    .line 24
    invoke-virtual {p0, v0}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    sget v1, Ll/mpw0;->a:I

    .line 29
    .line 30
    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 31
    .line 32
    .line 33
    move-result-wide v0

    .line 34
    const-wide v2, 0xd693a400L

    .line 35
    .line 36
    .line 37
    .line 38
    .line 39
    mul-long/2addr v0, v2

    .line 40
    const/4 v2, 0x2

    .line 41
    invoke-virtual {p0, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-static {v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 46
    .line 47
    .line 48
    move-result-wide v2

    .line 49
    const-wide/32 v4, 0x3938700

    .line 50
    .line 51
    .line 52
    mul-long/2addr v2, v4

    .line 53
    const/4 v4, 0x3

    .line 54
    invoke-virtual {p0, v4}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v4

    .line 58
    invoke-static {v4}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 59
    .line 60
    .line 61
    move-result-wide v4

    .line 62
    const-wide/32 v6, 0xf4240

    .line 63
    .line 64
    .line 65
    mul-long/2addr v4, v6

    .line 66
    const/4 v6, 0x4

    .line 67
    invoke-virtual {p0, v6}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 72
    .line 73
    .line 74
    move-result-wide v6

    .line 75
    const-wide/16 v8, 0x2710

    .line 76
    .line 77
    mul-long/2addr v6, v8

    .line 78
    add-long/2addr v0, v2

    .line 79
    add-long/2addr v0, v4

    .line 80
    add-long/2addr v0, v6

    .line 81
    return-wide v0
.end method


# virtual methods
.method public final a([BIILl/wor0;Ll/hkv0;)V
    .locals 22

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p2

    .line 4
    .line 5
    new-instance v2, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    new-instance v3, Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 13
    .line 14
    .line 15
    add-int v4, v1, p3

    .line 16
    .line 17
    iget-object v5, v0, Ll/xpr0;->c:Ll/bgw0;

    .line 18
    .line 19
    move-object/from16 v6, p1

    .line 20
    .line 21
    invoke-virtual {v5, v6, v4}, Ll/bgw0;->i([BI)V

    .line 22
    .line 23
    .line 24
    iget-object v4, v0, Ll/xpr0;->c:Ll/bgw0;

    .line 25
    .line 26
    invoke-virtual {v4, v1}, Ll/bgw0;->k(I)V

    .line 27
    .line 28
    .line 29
    iget-object v1, v0, Ll/xpr0;->c:Ll/bgw0;

    .line 30
    .line 31
    invoke-virtual {v1}, Ll/bgw0;->b()Ljava/nio/charset/Charset;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    if-nez v1, :cond_0

    .line 36
    .line 37
    sget-object v1, Ll/cow0;->c:Ljava/nio/charset/Charset;

    .line 38
    .line 39
    :cond_0
    iget-boolean v4, v0, Ll/xpr0;->a:Z

    .line 40
    .line 41
    if-nez v4, :cond_1

    .line 42
    .line 43
    iget-object v4, v0, Ll/xpr0;->c:Ll/bgw0;

    .line 44
    .line 45
    invoke-virtual {v0, v4, v1}, Ll/xpr0;->e(Ll/bgw0;Ljava/nio/charset/Charset;)V

    .line 46
    .line 47
    .line 48
    :cond_1
    iget-object v4, v0, Ll/xpr0;->c:Ll/bgw0;

    .line 49
    .line 50
    iget-boolean v5, v0, Ll/xpr0;->a:Z

    .line 51
    .line 52
    if-eqz v5, :cond_2

    .line 53
    .line 54
    iget-object v5, v0, Ll/xpr0;->b:Ll/wpr0;

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_2
    const/4 v5, 0x0

    .line 58
    :goto_0
    invoke-virtual {v4, v1}, Ll/bgw0;->N(Ljava/nio/charset/Charset;)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v7

    .line 62
    const/4 v8, -0x1

    .line 63
    if-eqz v7, :cond_17

    .line 64
    .line 65
    const-string v11, "Format:"

    .line 66
    .line 67
    invoke-virtual {v7, v11}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 68
    .line 69
    .line 70
    move-result v11

    .line 71
    if-eqz v11, :cond_3

    .line 72
    .line 73
    invoke-static {v7}, Ll/wpr0;->a(Ljava/lang/String;)Ll/wpr0;

    .line 74
    .line 75
    .line 76
    move-result-object v5

    .line 77
    goto :goto_0

    .line 78
    :cond_3
    const-string v11, "Dialogue:"

    .line 79
    .line 80
    invoke-virtual {v7, v11}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 81
    .line 82
    .line 83
    move-result v12

    .line 84
    if-eqz v12, :cond_4

    .line 85
    .line 86
    const-string v12, "SsaParser"

    .line 87
    .line 88
    if-nez v5, :cond_5

    .line 89
    .line 90
    const-string v8, "Skipping dialogue line before complete format: "

    .line 91
    .line 92
    invoke-virtual {v8, v7}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v7

    .line 96
    invoke-static {v12, v7}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    :cond_4
    :goto_1
    move-object/from16 v17, v1

    .line 100
    .line 101
    move-object/from16 v20, v4

    .line 102
    .line 103
    move-object/from16 v19, v5

    .line 104
    .line 105
    goto/16 :goto_c

    .line 106
    .line 107
    :cond_5
    invoke-virtual {v7, v11}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 108
    .line 109
    .line 110
    move-result v11

    .line 111
    invoke-static {v11}, Ll/lev0;->d(Z)V

    .line 112
    .line 113
    .line 114
    const/16 v11, 0x9

    .line 115
    .line 116
    invoke-virtual {v7, v11}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v11

    .line 120
    const-string v13, ","

    .line 121
    .line 122
    iget v14, v5, Ll/wpr0;->e:I

    .line 123
    .line 124
    invoke-virtual {v11, v13, v14}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object v11

    .line 128
    array-length v13, v11

    .line 129
    iget v14, v5, Ll/wpr0;->e:I

    .line 130
    .line 131
    if-eq v13, v14, :cond_6

    .line 132
    .line 133
    const-string v8, "Skipping dialogue line with fewer columns than format: "

    .line 134
    .line 135
    invoke-virtual {v8, v7}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v7

    .line 139
    invoke-static {v12, v7}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 140
    .line 141
    .line 142
    goto :goto_1

    .line 143
    :cond_6
    iget v13, v5, Ll/wpr0;->a:I

    .line 144
    .line 145
    aget-object v13, v11, v13

    .line 146
    .line 147
    invoke-static {v13}, Ll/xpr0;->d(Ljava/lang/String;)J

    .line 148
    .line 149
    .line 150
    move-result-wide v13

    .line 151
    const-wide v15, -0x7fffffffffffffffL    # -4.9E-324

    .line 152
    .line 153
    .line 154
    .line 155
    .line 156
    cmp-long v17, v13, v15

    .line 157
    .line 158
    const-string v6, "Skipping invalid timing: "

    .line 159
    .line 160
    if-nez v17, :cond_7

    .line 161
    .line 162
    invoke-virtual {v6, v7}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object v6

    .line 166
    invoke-static {v12, v6}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 167
    .line 168
    .line 169
    goto :goto_1

    .line 170
    :cond_7
    move-wide/from16 p2, v15

    .line 171
    .line 172
    iget v15, v5, Ll/wpr0;->b:I

    .line 173
    .line 174
    aget-object v15, v11, v15

    .line 175
    .line 176
    invoke-static {v15}, Ll/xpr0;->d(Ljava/lang/String;)J

    .line 177
    .line 178
    .line 179
    move-result-wide v9

    .line 180
    cmp-long v15, v9, p2

    .line 181
    .line 182
    if-nez v15, :cond_8

    .line 183
    .line 184
    invoke-virtual {v6, v7}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object v6

    .line 188
    invoke-static {v12, v6}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 189
    .line 190
    .line 191
    goto :goto_1

    .line 192
    :cond_8
    iget-object v6, v0, Ll/xpr0;->d:Ljava/util/Map;

    .line 193
    .line 194
    if-eqz v6, :cond_9

    .line 195
    .line 196
    iget v7, v5, Ll/wpr0;->c:I

    .line 197
    .line 198
    if-eq v7, v8, :cond_9

    .line 199
    .line 200
    aget-object v7, v11, v7

    .line 201
    .line 202
    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 203
    .line 204
    .line 205
    move-result-object v7

    .line 206
    invoke-interface {v6, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 207
    .line 208
    .line 209
    move-result-object v6

    .line 210
    check-cast v6, Ll/aqr0;

    .line 211
    .line 212
    goto :goto_2

    .line 213
    :cond_9
    const/4 v6, 0x0

    .line 214
    :goto_2
    iget v7, v5, Ll/wpr0;->d:I

    .line 215
    .line 216
    aget-object v7, v11, v7

    .line 217
    .line 218
    invoke-static {v7}, Ll/zpr0;->a(Ljava/lang/String;)Ll/zpr0;

    .line 219
    .line 220
    .line 221
    move-result-object v11

    .line 222
    invoke-static {v7}, Ll/zpr0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 223
    .line 224
    .line 225
    move-result-object v7

    .line 226
    const-string v15, "\\N"

    .line 227
    .line 228
    const-string v8, "\n"

    .line 229
    .line 230
    invoke-virtual {v7, v15, v8}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 231
    .line 232
    .line 233
    move-result-object v7

    .line 234
    const-string v15, "\\n"

    .line 235
    .line 236
    invoke-virtual {v7, v15, v8}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 237
    .line 238
    .line 239
    move-result-object v7

    .line 240
    const-string v8, "\\h"

    .line 241
    .line 242
    const-string v15, "\u00a0"

    .line 243
    .line 244
    invoke-virtual {v7, v8, v15}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 245
    .line 246
    .line 247
    move-result-object v7

    .line 248
    iget v8, v0, Ll/xpr0;->e:F

    .line 249
    .line 250
    iget v15, v0, Ll/xpr0;->f:F

    .line 251
    .line 252
    new-instance v0, Landroid/text/SpannableString;

    .line 253
    .line 254
    invoke-direct {v0, v7}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 255
    .line 256
    .line 257
    new-instance v7, Ll/j2v0;

    .line 258
    .line 259
    invoke-direct {v7}, Ll/j2v0;-><init>()V

    .line 260
    .line 261
    .line 262
    invoke-virtual {v7, v0}, Ll/j2v0;->l(Ljava/lang/CharSequence;)Ll/j2v0;

    .line 263
    .line 264
    .line 265
    move-object/from16 v17, v1

    .line 266
    .line 267
    const v18, -0x800001

    .line 268
    .line 269
    .line 270
    if-eqz v6, :cond_11

    .line 271
    .line 272
    iget-object v1, v6, Ll/aqr0;->c:Ljava/lang/Integer;

    .line 273
    .line 274
    move-object/from16 v19, v1

    .line 275
    .line 276
    if-eqz v19, :cond_a

    .line 277
    .line 278
    new-instance v1, Landroid/text/style/ForegroundColorSpan;

    .line 279
    .line 280
    move-object/from16 v20, v4

    .line 281
    .line 282
    invoke-virtual/range {v19 .. v19}, Ljava/lang/Integer;->intValue()I

    .line 283
    .line 284
    .line 285
    move-result v4

    .line 286
    invoke-direct {v1, v4}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 287
    .line 288
    .line 289
    invoke-virtual {v0}, Landroid/text/SpannableString;->length()I

    .line 290
    .line 291
    .line 292
    move-result v4

    .line 293
    move-object/from16 v19, v5

    .line 294
    .line 295
    move/from16 v21, v8

    .line 296
    .line 297
    const/16 v5, 0x21

    .line 298
    .line 299
    const/4 v8, 0x0

    .line 300
    invoke-virtual {v0, v1, v8, v4, v5}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 301
    .line 302
    .line 303
    goto :goto_3

    .line 304
    :cond_a
    move-object/from16 v20, v4

    .line 305
    .line 306
    move-object/from16 v19, v5

    .line 307
    .line 308
    move/from16 v21, v8

    .line 309
    .line 310
    :goto_3
    iget v1, v6, Ll/aqr0;->j:I

    .line 311
    .line 312
    const/4 v4, 0x3

    .line 313
    if-ne v1, v4, :cond_b

    .line 314
    .line 315
    iget-object v1, v6, Ll/aqr0;->d:Ljava/lang/Integer;

    .line 316
    .line 317
    if-eqz v1, :cond_b

    .line 318
    .line 319
    new-instance v5, Landroid/text/style/BackgroundColorSpan;

    .line 320
    .line 321
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 322
    .line 323
    .line 324
    move-result v1

    .line 325
    invoke-direct {v5, v1}, Landroid/text/style/BackgroundColorSpan;-><init>(I)V

    .line 326
    .line 327
    .line 328
    invoke-virtual {v0}, Landroid/text/SpannableString;->length()I

    .line 329
    .line 330
    .line 331
    move-result v1

    .line 332
    const/4 v4, 0x0

    .line 333
    const/16 v8, 0x21

    .line 334
    .line 335
    invoke-virtual {v0, v5, v4, v1, v8}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 336
    .line 337
    .line 338
    :cond_b
    iget v1, v6, Ll/aqr0;->e:F

    .line 339
    .line 340
    cmpl-float v4, v1, v18

    .line 341
    .line 342
    if-eqz v4, :cond_c

    .line 343
    .line 344
    cmpl-float v4, v15, v18

    .line 345
    .line 346
    if-eqz v4, :cond_c

    .line 347
    .line 348
    div-float/2addr v1, v15

    .line 349
    const/4 v4, 0x1

    .line 350
    invoke-virtual {v7, v1, v4}, Ll/j2v0;->n(FI)Ll/j2v0;

    .line 351
    .line 352
    .line 353
    :cond_c
    iget-boolean v1, v6, Ll/aqr0;->f:Z

    .line 354
    .line 355
    iget-boolean v4, v6, Ll/aqr0;->g:Z

    .line 356
    .line 357
    if-eqz v1, :cond_e

    .line 358
    .line 359
    if-eqz v4, :cond_d

    .line 360
    .line 361
    new-instance v1, Landroid/text/style/StyleSpan;

    .line 362
    .line 363
    const/4 v4, 0x3

    .line 364
    invoke-direct {v1, v4}, Landroid/text/style/StyleSpan;-><init>(I)V

    .line 365
    .line 366
    .line 367
    invoke-virtual {v0}, Landroid/text/SpannableString;->length()I

    .line 368
    .line 369
    .line 370
    move-result v4

    .line 371
    const/16 v5, 0x21

    .line 372
    .line 373
    const/4 v8, 0x0

    .line 374
    invoke-virtual {v0, v1, v8, v4, v5}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 375
    .line 376
    .line 377
    goto :goto_4

    .line 378
    :cond_d
    const/16 v5, 0x21

    .line 379
    .line 380
    const/4 v8, 0x0

    .line 381
    new-instance v1, Landroid/text/style/StyleSpan;

    .line 382
    .line 383
    const/4 v4, 0x1

    .line 384
    invoke-direct {v1, v4}, Landroid/text/style/StyleSpan;-><init>(I)V

    .line 385
    .line 386
    .line 387
    invoke-virtual {v0}, Landroid/text/SpannableString;->length()I

    .line 388
    .line 389
    .line 390
    move-result v4

    .line 391
    invoke-virtual {v0, v1, v8, v4, v5}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 392
    .line 393
    .line 394
    goto :goto_4

    .line 395
    :cond_e
    const/16 v5, 0x21

    .line 396
    .line 397
    const/4 v8, 0x0

    .line 398
    if-eqz v4, :cond_f

    .line 399
    .line 400
    new-instance v1, Landroid/text/style/StyleSpan;

    .line 401
    .line 402
    const/4 v4, 0x2

    .line 403
    invoke-direct {v1, v4}, Landroid/text/style/StyleSpan;-><init>(I)V

    .line 404
    .line 405
    .line 406
    invoke-virtual {v0}, Landroid/text/SpannableString;->length()I

    .line 407
    .line 408
    .line 409
    move-result v4

    .line 410
    invoke-virtual {v0, v1, v8, v4, v5}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 411
    .line 412
    .line 413
    :cond_f
    :goto_4
    iget-boolean v1, v6, Ll/aqr0;->h:Z

    .line 414
    .line 415
    if-eqz v1, :cond_10

    .line 416
    .line 417
    new-instance v1, Landroid/text/style/UnderlineSpan;

    .line 418
    .line 419
    invoke-direct {v1}, Landroid/text/style/UnderlineSpan;-><init>()V

    .line 420
    .line 421
    .line 422
    invoke-virtual {v0}, Landroid/text/SpannableString;->length()I

    .line 423
    .line 424
    .line 425
    move-result v4

    .line 426
    invoke-virtual {v0, v1, v8, v4, v5}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 427
    .line 428
    .line 429
    :cond_10
    iget-boolean v1, v6, Ll/aqr0;->i:Z

    .line 430
    .line 431
    if-eqz v1, :cond_12

    .line 432
    .line 433
    new-instance v1, Landroid/text/style/StrikethroughSpan;

    .line 434
    .line 435
    invoke-direct {v1}, Landroid/text/style/StrikethroughSpan;-><init>()V

    .line 436
    .line 437
    .line 438
    invoke-virtual {v0}, Landroid/text/SpannableString;->length()I

    .line 439
    .line 440
    .line 441
    move-result v4

    .line 442
    invoke-virtual {v0, v1, v8, v4, v5}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 443
    .line 444
    .line 445
    goto :goto_5

    .line 446
    :cond_11
    move-object/from16 v20, v4

    .line 447
    .line 448
    move-object/from16 v19, v5

    .line 449
    .line 450
    move/from16 v21, v8

    .line 451
    .line 452
    :cond_12
    :goto_5
    iget v0, v11, Ll/zpr0;->a:I

    .line 453
    .line 454
    const/4 v1, -0x1

    .line 455
    if-eq v0, v1, :cond_13

    .line 456
    .line 457
    move v8, v0

    .line 458
    goto :goto_6

    .line 459
    :cond_13
    if-eqz v6, :cond_14

    .line 460
    .line 461
    iget v8, v6, Ll/aqr0;->b:I

    .line 462
    .line 463
    goto :goto_6

    .line 464
    :cond_14
    const/4 v8, -0x1

    .line 465
    :goto_6
    const-string v0, "Unknown alignment: "

    .line 466
    .line 467
    packed-switch v8, :pswitch_data_0

    .line 468
    .line 469
    .line 470
    :pswitch_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 471
    .line 472
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 473
    .line 474
    .line 475
    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 476
    .line 477
    .line 478
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 479
    .line 480
    .line 481
    move-result-object v1

    .line 482
    invoke-static {v12, v1}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 483
    .line 484
    .line 485
    :pswitch_1
    const/4 v1, 0x0

    .line 486
    goto :goto_7

    .line 487
    :pswitch_2
    sget-object v1, Landroid/text/Layout$Alignment;->ALIGN_OPPOSITE:Landroid/text/Layout$Alignment;

    .line 488
    .line 489
    goto :goto_7

    .line 490
    :pswitch_3
    sget-object v1, Landroid/text/Layout$Alignment;->ALIGN_CENTER:Landroid/text/Layout$Alignment;

    .line 491
    .line 492
    goto :goto_7

    .line 493
    :pswitch_4
    sget-object v1, Landroid/text/Layout$Alignment;->ALIGN_NORMAL:Landroid/text/Layout$Alignment;

    .line 494
    .line 495
    :goto_7
    invoke-virtual {v7, v1}, Ll/j2v0;->m(Landroid/text/Layout$Alignment;)Ll/j2v0;

    .line 496
    .line 497
    .line 498
    const/high16 v1, -0x80000000

    .line 499
    .line 500
    packed-switch v8, :pswitch_data_1

    .line 501
    .line 502
    .line 503
    :pswitch_5
    new-instance v4, Ljava/lang/StringBuilder;

    .line 504
    .line 505
    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 506
    .line 507
    .line 508
    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 509
    .line 510
    .line 511
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 512
    .line 513
    .line 514
    move-result-object v4

    .line 515
    invoke-static {v12, v4}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 516
    .line 517
    .line 518
    :pswitch_6
    move v4, v1

    .line 519
    goto :goto_8

    .line 520
    :pswitch_7
    const/4 v4, 0x2

    .line 521
    goto :goto_8

    .line 522
    :pswitch_8
    const/4 v4, 0x1

    .line 523
    goto :goto_8

    .line 524
    :pswitch_9
    const/4 v4, 0x0

    .line 525
    :goto_8
    invoke-virtual {v7, v4}, Ll/j2v0;->i(I)Ll/j2v0;

    .line 526
    .line 527
    .line 528
    packed-switch v8, :pswitch_data_2

    .line 529
    .line 530
    .line 531
    :pswitch_a
    new-instance v4, Ljava/lang/StringBuilder;

    .line 532
    .line 533
    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 534
    .line 535
    .line 536
    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 537
    .line 538
    .line 539
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 540
    .line 541
    .line 542
    move-result-object v0

    .line 543
    invoke-static {v12, v0}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 544
    .line 545
    .line 546
    goto :goto_9

    .line 547
    :pswitch_b
    const/4 v1, 0x0

    .line 548
    goto :goto_9

    .line 549
    :pswitch_c
    const/4 v1, 0x1

    .line 550
    goto :goto_9

    .line 551
    :pswitch_d
    const/4 v1, 0x2

    .line 552
    :goto_9
    :pswitch_e
    invoke-virtual {v7, v1}, Ll/j2v0;->f(I)Ll/j2v0;

    .line 553
    .line 554
    .line 555
    iget-object v0, v11, Ll/zpr0;->b:Landroid/graphics/PointF;

    .line 556
    .line 557
    if-eqz v0, :cond_15

    .line 558
    .line 559
    cmpl-float v1, v15, v18

    .line 560
    .line 561
    if-eqz v1, :cond_15

    .line 562
    .line 563
    cmpl-float v1, v21, v18

    .line 564
    .line 565
    if-eqz v1, :cond_15

    .line 566
    .line 567
    iget v0, v0, Landroid/graphics/PointF;->x:F

    .line 568
    .line 569
    div-float v0, v0, v21

    .line 570
    .line 571
    invoke-virtual {v7, v0}, Ll/j2v0;->h(F)Ll/j2v0;

    .line 572
    .line 573
    .line 574
    iget-object v0, v11, Ll/zpr0;->b:Landroid/graphics/PointF;

    .line 575
    .line 576
    iget v0, v0, Landroid/graphics/PointF;->y:F

    .line 577
    .line 578
    div-float/2addr v0, v15

    .line 579
    const/4 v8, 0x0

    .line 580
    invoke-virtual {v7, v0, v8}, Ll/j2v0;->e(FI)Ll/j2v0;

    .line 581
    .line 582
    .line 583
    goto :goto_a

    .line 584
    :cond_15
    const/4 v8, 0x0

    .line 585
    invoke-virtual {v7}, Ll/j2v0;->b()I

    .line 586
    .line 587
    .line 588
    move-result v0

    .line 589
    invoke-static {v0}, Ll/xpr0;->b(I)F

    .line 590
    .line 591
    .line 592
    move-result v0

    .line 593
    invoke-virtual {v7, v0}, Ll/j2v0;->h(F)Ll/j2v0;

    .line 594
    .line 595
    .line 596
    invoke-virtual {v7}, Ll/j2v0;->a()I

    .line 597
    .line 598
    .line 599
    move-result v0

    .line 600
    invoke-static {v0}, Ll/xpr0;->b(I)F

    .line 601
    .line 602
    .line 603
    move-result v0

    .line 604
    invoke-virtual {v7, v0, v8}, Ll/j2v0;->e(FI)Ll/j2v0;

    .line 605
    .line 606
    .line 607
    :goto_a
    invoke-virtual {v7}, Ll/j2v0;->p()Ll/u4v0;

    .line 608
    .line 609
    .line 610
    move-result-object v0

    .line 611
    invoke-static {v13, v14, v3, v2}, Ll/xpr0;->c(JLjava/util/List;Ljava/util/List;)I

    .line 612
    .line 613
    .line 614
    move-result v1

    .line 615
    invoke-static {v9, v10, v3, v2}, Ll/xpr0;->c(JLjava/util/List;Ljava/util/List;)I

    .line 616
    .line 617
    .line 618
    move-result v4

    .line 619
    :goto_b
    if-ge v1, v4, :cond_16

    .line 620
    .line 621
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 622
    .line 623
    .line 624
    move-result-object v5

    .line 625
    check-cast v5, Ljava/util/List;

    .line 626
    .line 627
    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 628
    .line 629
    .line 630
    add-int/lit8 v1, v1, 0x1

    .line 631
    .line 632
    goto :goto_b

    .line 633
    :cond_16
    :goto_c
    move-object/from16 v0, p0

    .line 634
    .line 635
    move-object/from16 v1, v17

    .line 636
    .line 637
    move-object/from16 v5, v19

    .line 638
    .line 639
    move-object/from16 v4, v20

    .line 640
    .line 641
    goto/16 :goto_0

    .line 642
    .line 643
    :cond_17
    const/4 v8, 0x0

    .line 644
    move v0, v8

    .line 645
    :goto_d
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 646
    .line 647
    .line 648
    move-result v1

    .line 649
    if-ge v0, v1, :cond_1b

    .line 650
    .line 651
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 652
    .line 653
    .line 654
    move-result-object v1

    .line 655
    move-object v10, v1

    .line 656
    check-cast v10, Ljava/util/List;

    .line 657
    .line 658
    invoke-interface {v10}, Ljava/util/List;->isEmpty()Z

    .line 659
    .line 660
    .line 661
    move-result v1

    .line 662
    if-eqz v1, :cond_19

    .line 663
    .line 664
    if-eqz v0, :cond_18

    .line 665
    .line 666
    move-object/from16 v1, p5

    .line 667
    .line 668
    const/4 v4, -0x1

    .line 669
    :goto_e
    const/4 v5, 0x1

    .line 670
    goto :goto_f

    .line 671
    :cond_18
    move v0, v8

    .line 672
    :cond_19
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 673
    .line 674
    .line 675
    move-result v1

    .line 676
    const/4 v4, -0x1

    .line 677
    add-int/2addr v1, v4

    .line 678
    if-eq v0, v1, :cond_1a

    .line 679
    .line 680
    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 681
    .line 682
    .line 683
    move-result-object v1

    .line 684
    check-cast v1, Ljava/lang/Long;

    .line 685
    .line 686
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 687
    .line 688
    .line 689
    move-result-wide v11

    .line 690
    add-int/lit8 v1, v0, 0x1

    .line 691
    .line 692
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 693
    .line 694
    .line 695
    move-result-object v1

    .line 696
    check-cast v1, Ljava/lang/Long;

    .line 697
    .line 698
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 699
    .line 700
    .line 701
    move-result-wide v5

    .line 702
    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 703
    .line 704
    .line 705
    move-result-object v1

    .line 706
    check-cast v1, Ljava/lang/Long;

    .line 707
    .line 708
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 709
    .line 710
    .line 711
    move-result-wide v13

    .line 712
    sub-long v13, v5, v13

    .line 713
    .line 714
    new-instance v9, Ll/qor0;

    .line 715
    .line 716
    invoke-direct/range {v9 .. v14}, Ll/qor0;-><init>(Ljava/util/List;JJ)V

    .line 717
    .line 718
    .line 719
    move-object/from16 v1, p5

    .line 720
    .line 721
    invoke-interface {v1, v9}, Ll/hkv0;->zza(Ljava/lang/Object;)V

    .line 722
    .line 723
    .line 724
    goto :goto_e

    .line 725
    :goto_f
    add-int/2addr v0, v5

    .line 726
    goto :goto_d

    .line 727
    :cond_1a
    invoke-static {}, Ll/wpg0;->a()V

    .line 728
    .line 729
    .line 730
    :cond_1b
    return-void

    .line 731
    :pswitch_data_0
    .packed-switch -0x1
        :pswitch_1
        :pswitch_0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_4
        :pswitch_3
        :pswitch_2
    .end packed-switch

    .line 732
    .line 733
    .line 734
    .line 735
    .line 736
    .line 737
    .line 738
    .line 739
    .line 740
    .line 741
    .line 742
    .line 743
    .line 744
    .line 745
    .line 746
    .line 747
    .line 748
    .line 749
    .line 750
    .line 751
    .line 752
    .line 753
    .line 754
    .line 755
    .line 756
    .line 757
    :pswitch_data_1
    .packed-switch -0x1
        :pswitch_6
        :pswitch_5
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_9
        :pswitch_8
        :pswitch_7
    .end packed-switch

    .line 758
    .line 759
    .line 760
    .line 761
    .line 762
    .line 763
    .line 764
    .line 765
    .line 766
    .line 767
    .line 768
    .line 769
    .line 770
    .line 771
    .line 772
    .line 773
    .line 774
    .line 775
    .line 776
    .line 777
    .line 778
    .line 779
    .line 780
    .line 781
    .line 782
    .line 783
    :pswitch_data_2
    .packed-switch -0x1
        :pswitch_e
        :pswitch_a
        :pswitch_d
        :pswitch_d
        :pswitch_d
        :pswitch_c
        :pswitch_c
        :pswitch_c
        :pswitch_b
        :pswitch_b
        :pswitch_b
    .end packed-switch
.end method

.method public final e(Ll/bgw0;Ljava/nio/charset/Charset;)V
    .locals 6

    .line 1
    :cond_0
    :goto_0
    invoke-virtual {p1, p2}, Ll/bgw0;->N(Ljava/nio/charset/Charset;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_b

    .line 6
    .line 7
    const-string v1, "[Script Info]"

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/16 v2, 0x5b

    .line 14
    .line 15
    if-eqz v1, :cond_3

    .line 16
    .line 17
    :catch_0
    :cond_1
    :goto_1
    invoke-virtual {p1, p2}, Ll/bgw0;->N(Ljava/nio/charset/Charset;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-virtual {p1}, Ll/bgw0;->q()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_2

    .line 28
    .line 29
    invoke-virtual {p1, p2}, Ll/bgw0;->p(Ljava/nio/charset/Charset;)C

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eq v1, v2, :cond_0

    .line 34
    .line 35
    :cond_2
    const-string v1, ":"

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    array-length v1, v0

    .line 42
    const/4 v3, 0x2

    .line 43
    if-ne v1, v3, :cond_1

    .line 44
    .line 45
    const/4 v1, 0x0

    .line 46
    aget-object v1, v0, v1

    .line 47
    .line 48
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-static {v1}, Ll/wnw0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 57
    .line 58
    .line 59
    move-result v3

    .line 60
    const/4 v4, 0x1

    .line 61
    packed-switch v3, :pswitch_data_0

    .line 62
    .line 63
    .line 64
    goto :goto_1

    .line 65
    :pswitch_0
    const-string v3, "playresy"

    .line 66
    .line 67
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    if-eqz v1, :cond_1

    .line 72
    .line 73
    :try_start_0
    aget-object v0, v0, v4

    .line 74
    .line 75
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-static {v0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    iput v0, p0, Ll/xpr0;->f:F
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 84
    .line 85
    goto :goto_1

    .line 86
    :pswitch_1
    const-string v3, "playresx"

    .line 87
    .line 88
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    if-eqz v1, :cond_1

    .line 93
    .line 94
    :try_start_1
    aget-object v0, v0, v4

    .line 95
    .line 96
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    invoke-static {v0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    iput v0, p0, Ll/xpr0;->e:F
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0

    .line 105
    .line 106
    goto :goto_1

    .line 107
    :cond_3
    const-string v1, "[V4+ Styles]"

    .line 108
    .line 109
    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 110
    .line 111
    .line 112
    move-result v1

    .line 113
    const-string v3, "SsaParser"

    .line 114
    .line 115
    if-eqz v1, :cond_9

    .line 116
    .line 117
    new-instance v0, Ljava/util/LinkedHashMap;

    .line 118
    .line 119
    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 120
    .line 121
    .line 122
    const/4 v1, 0x0

    .line 123
    :cond_4
    :goto_2
    invoke-virtual {p1, p2}, Ll/bgw0;->N(Ljava/nio/charset/Charset;)Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v4

    .line 127
    if-eqz v4, :cond_8

    .line 128
    .line 129
    invoke-virtual {p1}, Ll/bgw0;->q()I

    .line 130
    .line 131
    .line 132
    move-result v5

    .line 133
    if-eqz v5, :cond_5

    .line 134
    .line 135
    invoke-virtual {p1, p2}, Ll/bgw0;->p(Ljava/nio/charset/Charset;)C

    .line 136
    .line 137
    .line 138
    move-result v5

    .line 139
    if-eq v5, v2, :cond_8

    .line 140
    .line 141
    :cond_5
    const-string v5, "Format:"

    .line 142
    .line 143
    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 144
    .line 145
    .line 146
    move-result v5

    .line 147
    if-eqz v5, :cond_6

    .line 148
    .line 149
    invoke-static {v4}, Ll/ypr0;->a(Ljava/lang/String;)Ll/ypr0;

    .line 150
    .line 151
    .line 152
    move-result-object v1

    .line 153
    goto :goto_2

    .line 154
    :cond_6
    const-string v5, "Style:"

    .line 155
    .line 156
    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 157
    .line 158
    .line 159
    move-result v5

    .line 160
    if-eqz v5, :cond_4

    .line 161
    .line 162
    if-nez v1, :cond_7

    .line 163
    .line 164
    const-string v5, "Skipping \'Style:\' line before \'Format:\' line: "

    .line 165
    .line 166
    invoke-virtual {v5, v4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object v4

    .line 170
    invoke-static {v3, v4}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 171
    .line 172
    .line 173
    goto :goto_2

    .line 174
    :cond_7
    invoke-static {v4, v1}, Ll/aqr0;->b(Ljava/lang/String;Ll/ypr0;)Ll/aqr0;

    .line 175
    .line 176
    .line 177
    move-result-object v4

    .line 178
    if-eqz v4, :cond_4

    .line 179
    .line 180
    iget-object v5, v4, Ll/aqr0;->a:Ljava/lang/String;

    .line 181
    .line 182
    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 183
    .line 184
    .line 185
    goto :goto_2

    .line 186
    :cond_8
    iput-object v0, p0, Ll/xpr0;->d:Ljava/util/Map;

    .line 187
    .line 188
    goto/16 :goto_0

    .line 189
    .line 190
    :cond_9
    const-string v1, "[V4 Styles]"

    .line 191
    .line 192
    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 193
    .line 194
    .line 195
    move-result v1

    .line 196
    if-eqz v1, :cond_a

    .line 197
    .line 198
    const-string v0, "[V4 Styles] are not supported"

    .line 199
    .line 200
    invoke-static {v3, v0}, Ll/y4w0;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 201
    .line 202
    .line 203
    goto/16 :goto_0

    .line 204
    .line 205
    :cond_a
    const-string v1, "[Events]"

    .line 206
    .line 207
    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 208
    .line 209
    .line 210
    move-result v0

    .line 211
    if-eqz v0, :cond_0

    .line 212
    .line 213
    :cond_b
    return-void

    .line 214
    nop

    .line 215
    :pswitch_data_0
    .packed-switch 0x70092d0c
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
