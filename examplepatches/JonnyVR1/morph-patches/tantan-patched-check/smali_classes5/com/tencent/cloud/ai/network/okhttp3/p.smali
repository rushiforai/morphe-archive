.class public final Lcom/tencent/cloud/ai/network/okhttp3/p;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/cloud/ai/network/okhttp3/p$a;
    }
.end annotation


# static fields
.field public static final i:[C


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public final d:Ljava/lang/String;

.field public final e:I

.field public final f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final g:Ljava/lang/String;

.field public final h:Ljava/lang/String;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    const/16 v0, 0x10

    .line 2
    .line 3
    new-array v0, v0, [C

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    sput-object v0, Lcom/tencent/cloud/ai/network/okhttp3/p;->i:[C

    .line 9
    .line 10
    return-void

    .line 11
    :array_0
    .array-data 2
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x41s
        0x42s
        0x43s
        0x44s
        0x45s
        0x46s
    .end array-data
.end method

.method public constructor <init>(Lcom/tencent/cloud/ai/network/okhttp3/p$a;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/p;->a:Ljava/lang/String;

    .line 7
    .line 8
    iget-object v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->b:Ljava/lang/String;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-static {v0, v1}, Lcom/tencent/cloud/ai/network/okhttp3/p;->a(Ljava/lang/String;Z)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/p;->b:Ljava/lang/String;

    .line 16
    .line 17
    iget-object v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->c:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {v0, v1}, Lcom/tencent/cloud/ai/network/okhttp3/p;->a(Ljava/lang/String;Z)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/p;->c:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->d:Ljava/lang/String;

    .line 26
    .line 27
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/p;->d:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->b()I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    iput v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/p;->e:I

    .line 34
    .line 35
    iget-object v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->f:Ljava/util/List;

    .line 36
    .line 37
    invoke-virtual {p0, v0, v1}, Lcom/tencent/cloud/ai/network/okhttp3/p;->a(Ljava/util/List;Z)Ljava/util/List;

    .line 38
    .line 39
    .line 40
    iget-object v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->g:Ljava/util/List;

    .line 41
    .line 42
    const/4 v2, 0x0

    .line 43
    if-eqz v0, :cond_0

    .line 44
    .line 45
    const/4 v3, 0x1

    .line 46
    invoke-virtual {p0, v0, v3}, Lcom/tencent/cloud/ai/network/okhttp3/p;->a(Ljava/util/List;Z)Ljava/util/List;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    goto :goto_0

    .line 51
    :cond_0
    move-object v0, v2

    .line 52
    :goto_0
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/p;->f:Ljava/util/List;

    .line 53
    .line 54
    iget-object v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->h:Ljava/lang/String;

    .line 55
    .line 56
    if-eqz v0, :cond_1

    .line 57
    .line 58
    invoke-static {v0, v1}, Lcom/tencent/cloud/ai/network/okhttp3/p;->a(Ljava/lang/String;Z)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    :cond_1
    iput-object v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/p;->g:Ljava/lang/String;

    .line 63
    .line 64
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/p;->h:Ljava/lang/String;

    .line 69
    .line 70
    return-void
.end method

.method public static a(Ljava/lang/String;)I
    .locals 1

    const-string v0, "http"

    .line 207
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 p0, 0x50

    return p0

    :cond_0
    const-string v0, "https"

    .line 208
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1

    const/16 p0, 0x1bb

    return p0

    :cond_1
    const/4 p0, -0x1

    return p0
.end method

.method public static a(Ljava/lang/String;IILjava/lang/String;ZZZZLjava/nio/charset/Charset;)Ljava/lang/String;
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p2

    .line 4
    .line 5
    move-object/from16 v2, p3

    .line 6
    .line 7
    move/from16 v3, p1

    .line 8
    .line 9
    :goto_0
    if-ge v3, v1, :cond_d

    .line 10
    .line 11
    invoke-virtual {v0, v3}, Ljava/lang/String;->codePointAt(I)I

    .line 12
    .line 13
    .line 14
    move-result v4

    .line 15
    const/16 v5, 0x2b

    .line 16
    .line 17
    const/4 v6, -0x1

    .line 18
    const/16 v7, 0x80

    .line 19
    .line 20
    const/16 v8, 0x7f

    .line 21
    .line 22
    const/16 v9, 0x20

    .line 23
    .line 24
    const/16 v10, 0x25

    .line 25
    .line 26
    if-lt v4, v9, :cond_3

    .line 27
    .line 28
    if-eq v4, v8, :cond_3

    .line 29
    .line 30
    if-lt v4, v7, :cond_0

    .line 31
    .line 32
    if-nez p7, :cond_3

    .line 33
    .line 34
    :cond_0
    invoke-virtual {v2, v4}, Ljava/lang/String;->indexOf(I)I

    .line 35
    .line 36
    .line 37
    move-result v11

    .line 38
    if-ne v11, v6, :cond_3

    .line 39
    .line 40
    if-ne v4, v10, :cond_1

    .line 41
    .line 42
    if-eqz p4, :cond_3

    .line 43
    .line 44
    if-eqz p5, :cond_1

    .line 45
    .line 46
    invoke-static {v0, v3, v1}, Lcom/tencent/cloud/ai/network/okhttp3/p;->a(Ljava/lang/String;II)Z

    .line 47
    .line 48
    .line 49
    move-result v11

    .line 50
    if-eqz v11, :cond_3

    .line 51
    .line 52
    :cond_1
    if-ne v4, v5, :cond_2

    .line 53
    .line 54
    if-eqz p6, :cond_2

    .line 55
    .line 56
    goto :goto_1

    .line 57
    :cond_2
    invoke-static {v4}, Ljava/lang/Character;->charCount(I)I

    .line 58
    .line 59
    .line 60
    move-result v4

    .line 61
    add-int/2addr v3, v4

    .line 62
    goto :goto_0

    .line 63
    :cond_3
    :goto_1
    new-instance v4, Lcom/tencent/cloud/ai/network/okio/e;

    .line 64
    .line 65
    invoke-direct {v4}, Lcom/tencent/cloud/ai/network/okio/e;-><init>()V

    .line 66
    .line 67
    .line 68
    move/from16 v11, p1

    .line 69
    .line 70
    invoke-virtual {v4, v0, v11, v3}, Lcom/tencent/cloud/ai/network/okio/e;->a(Ljava/lang/String;II)Lcom/tencent/cloud/ai/network/okio/e;

    .line 71
    .line 72
    .line 73
    const/4 v11, 0x0

    .line 74
    :goto_2
    if-ge v3, v1, :cond_c

    .line 75
    .line 76
    invoke-virtual {v0, v3}, Ljava/lang/String;->codePointAt(I)I

    .line 77
    .line 78
    .line 79
    move-result v12

    .line 80
    if-eqz p4, :cond_4

    .line 81
    .line 82
    const/16 v13, 0x9

    .line 83
    .line 84
    if-eq v12, v13, :cond_b

    .line 85
    .line 86
    const/16 v13, 0xa

    .line 87
    .line 88
    if-eq v12, v13, :cond_b

    .line 89
    .line 90
    const/16 v13, 0xc

    .line 91
    .line 92
    if-eq v12, v13, :cond_b

    .line 93
    .line 94
    const/16 v13, 0xd

    .line 95
    .line 96
    if-ne v12, v13, :cond_4

    .line 97
    .line 98
    goto :goto_6

    .line 99
    :cond_4
    if-ne v12, v5, :cond_6

    .line 100
    .line 101
    if-eqz p6, :cond_6

    .line 102
    .line 103
    if-eqz p4, :cond_5

    .line 104
    .line 105
    const-string v13, "+"

    .line 106
    .line 107
    goto :goto_3

    .line 108
    :cond_5
    const-string v13, "%2B"

    .line 109
    .line 110
    :goto_3
    invoke-virtual {v4, v13}, Lcom/tencent/cloud/ai/network/okio/e;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okio/e;

    .line 111
    .line 112
    .line 113
    goto :goto_6

    .line 114
    :cond_6
    if-lt v12, v9, :cond_9

    .line 115
    .line 116
    if-eq v12, v8, :cond_9

    .line 117
    .line 118
    if-lt v12, v7, :cond_7

    .line 119
    .line 120
    if-nez p7, :cond_9

    .line 121
    .line 122
    :cond_7
    invoke-virtual {v2, v12}, Ljava/lang/String;->indexOf(I)I

    .line 123
    .line 124
    .line 125
    move-result v13

    .line 126
    if-ne v13, v6, :cond_9

    .line 127
    .line 128
    if-ne v12, v10, :cond_8

    .line 129
    .line 130
    if-eqz p4, :cond_9

    .line 131
    .line 132
    if-eqz p5, :cond_8

    .line 133
    .line 134
    invoke-static {v0, v3, v1}, Lcom/tencent/cloud/ai/network/okhttp3/p;->a(Ljava/lang/String;II)Z

    .line 135
    .line 136
    .line 137
    move-result v13

    .line 138
    if-nez v13, :cond_8

    .line 139
    .line 140
    goto :goto_4

    .line 141
    :cond_8
    invoke-virtual {v4, v12}, Lcom/tencent/cloud/ai/network/okio/e;->h(I)Lcom/tencent/cloud/ai/network/okio/e;

    .line 142
    .line 143
    .line 144
    goto :goto_6

    .line 145
    :cond_9
    :goto_4
    if-nez v11, :cond_a

    .line 146
    .line 147
    new-instance v11, Lcom/tencent/cloud/ai/network/okio/e;

    .line 148
    .line 149
    invoke-direct {v11}, Lcom/tencent/cloud/ai/network/okio/e;-><init>()V

    .line 150
    .line 151
    .line 152
    :cond_a
    invoke-virtual {v11, v12}, Lcom/tencent/cloud/ai/network/okio/e;->h(I)Lcom/tencent/cloud/ai/network/okio/e;

    .line 153
    .line 154
    .line 155
    :goto_5
    invoke-virtual {v11}, Lcom/tencent/cloud/ai/network/okio/e;->g()Z

    .line 156
    .line 157
    .line 158
    move-result v13

    .line 159
    if-nez v13, :cond_b

    .line 160
    .line 161
    invoke-virtual {v11}, Lcom/tencent/cloud/ai/network/okio/e;->readByte()B

    .line 162
    .line 163
    .line 164
    move-result v13

    .line 165
    and-int/lit16 v14, v13, 0xff

    .line 166
    .line 167
    invoke-virtual {v4, v10}, Lcom/tencent/cloud/ai/network/okio/e;->e(I)Lcom/tencent/cloud/ai/network/okio/e;

    .line 168
    .line 169
    .line 170
    sget-object v15, Lcom/tencent/cloud/ai/network/okhttp3/p;->i:[C

    .line 171
    .line 172
    shr-int/lit8 v14, v14, 0x4

    .line 173
    .line 174
    and-int/lit8 v14, v14, 0xf

    .line 175
    .line 176
    aget-char v14, v15, v14

    .line 177
    .line 178
    invoke-virtual {v4, v14}, Lcom/tencent/cloud/ai/network/okio/e;->e(I)Lcom/tencent/cloud/ai/network/okio/e;

    .line 179
    .line 180
    .line 181
    and-int/lit8 v13, v13, 0xf

    .line 182
    .line 183
    aget-char v13, v15, v13

    .line 184
    .line 185
    invoke-virtual {v4, v13}, Lcom/tencent/cloud/ai/network/okio/e;->e(I)Lcom/tencent/cloud/ai/network/okio/e;

    .line 186
    .line 187
    .line 188
    goto :goto_5

    .line 189
    :cond_b
    :goto_6
    invoke-static {v12}, Ljava/lang/Character;->charCount(I)I

    .line 190
    .line 191
    .line 192
    move-result v12

    .line 193
    add-int/2addr v3, v12

    .line 194
    goto :goto_2

    .line 195
    :cond_c
    invoke-virtual {v4}, Lcom/tencent/cloud/ai/network/okio/e;->n()Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object v0

    .line 199
    return-object v0

    .line 200
    :cond_d
    move/from16 v11, p1

    .line 201
    .line 202
    invoke-virtual/range {p0 .. p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 203
    .line 204
    .line 205
    move-result-object v0

    .line 206
    return-object v0
.end method

.method public static a(Ljava/lang/String;IIZ)Ljava/lang/String;
    .locals 8

    move v0, p1

    :goto_0
    if-ge v0, p2, :cond_5

    .line 223
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v2, 0x2b

    const/16 v3, 0x25

    if-eq v1, v3, :cond_1

    if-ne v1, v2, :cond_0

    if-eqz p3, :cond_0

    goto :goto_1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 224
    :cond_1
    :goto_1
    new-instance v1, Lcom/tencent/cloud/ai/network/okio/e;

    invoke-direct {v1}, Lcom/tencent/cloud/ai/network/okio/e;-><init>()V

    .line 225
    invoke-virtual {v1, p0, p1, v0}, Lcom/tencent/cloud/ai/network/okio/e;->a(Ljava/lang/String;II)Lcom/tencent/cloud/ai/network/okio/e;

    :goto_2
    if-ge v0, p2, :cond_4

    .line 226
    invoke-virtual {p0, v0}, Ljava/lang/String;->codePointAt(I)I

    move-result p1

    if-ne p1, v3, :cond_2

    add-int/lit8 v4, v0, 0x2

    if-ge v4, p2, :cond_2

    add-int/lit8 v5, v0, 0x1

    .line 227
    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-static {v5}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(C)I

    move-result v5

    .line 228
    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v6

    invoke-static {v6}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(C)I

    move-result v6

    const/4 v7, -0x1

    if-eq v5, v7, :cond_3

    if-eq v6, v7, :cond_3

    shl-int/lit8 v0, v5, 0x4

    add-int/2addr v0, v6

    .line 229
    invoke-virtual {v1, v0}, Lcom/tencent/cloud/ai/network/okio/e;->e(I)Lcom/tencent/cloud/ai/network/okio/e;

    move v0, v4

    goto :goto_3

    :cond_2
    if-ne p1, v2, :cond_3

    if-eqz p3, :cond_3

    const/16 v4, 0x20

    .line 230
    invoke-virtual {v1, v4}, Lcom/tencent/cloud/ai/network/okio/e;->e(I)Lcom/tencent/cloud/ai/network/okio/e;

    goto :goto_3

    .line 231
    :cond_3
    invoke-virtual {v1, p1}, Lcom/tencent/cloud/ai/network/okio/e;->h(I)Lcom/tencent/cloud/ai/network/okio/e;

    .line 232
    :goto_3
    invoke-static {p1}, Ljava/lang/Character;->charCount(I)I

    move-result p1

    add-int/2addr v0, p1

    goto :goto_2

    .line 233
    :cond_4
    invoke-virtual {v1}, Lcom/tencent/cloud/ai/network/okio/e;->n()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 234
    :cond_5
    invoke-virtual {p0, p1, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static a(Ljava/lang/String;Ljava/lang/String;ZZZZ)Ljava/lang/String;
    .locals 9

    .line 242
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v1, 0x0

    const/4 v8, 0x0

    move-object v0, p0

    move-object v3, p1

    move v4, p2

    move v5, p3

    move v6, p4

    move v7, p5

    .line 243
    invoke-static/range {v0 .. v8}, Lcom/tencent/cloud/ai/network/okhttp3/p;->a(Ljava/lang/String;IILjava/lang/String;ZZZZLjava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static a(Ljava/lang/String;Z)Ljava/lang/String;
    .locals 2

    .line 216
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x0

    invoke-static {p0, v1, v0, p1}, Lcom/tencent/cloud/ai/network/okhttp3/p;->a(Ljava/lang/String;IIZ)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static a(Ljava/lang/StringBuilder;Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/StringBuilder;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 209
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_2

    .line 210
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    add-int/lit8 v3, v1, 0x1

    .line 211
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    if-lez v1, :cond_0

    const/16 v4, 0x26

    .line 212
    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 213
    :cond_0
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz v3, :cond_1

    const/16 v2, 0x3d

    .line 214
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 215
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_1
    add-int/lit8 v1, v1, 0x2

    goto :goto_0

    :cond_2
    return-void
.end method

.method public static a(Ljava/lang/String;II)Z
    .locals 2

    add-int/lit8 v0, p1, 0x2

    if-ge v0, p2, :cond_0

    .line 235
    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result p2

    const/16 v1, 0x25

    if-ne p2, v1, :cond_0

    const/4 p2, 0x1

    add-int/2addr p1, p2

    .line 236
    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result p1

    invoke-static {p1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(C)I

    move-result p1

    const/4 v1, -0x1

    if-eq p1, v1, :cond_0

    .line 237
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result p0

    invoke-static {p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(C)I

    move-result p0

    if-eq p0, v1, :cond_0

    return p2

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static b(Ljava/lang/String;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
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
    const/4 v1, 0x0

    .line 7
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    if-gt v1, v2, :cond_3

    .line 12
    .line 13
    const/16 v2, 0x26

    .line 14
    .line 15
    invoke-virtual {p0, v2, v1}, Ljava/lang/String;->indexOf(II)I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    const/4 v3, -0x1

    .line 20
    if-ne v2, v3, :cond_0

    .line 21
    .line 22
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    :cond_0
    const/16 v4, 0x3d

    .line 27
    .line 28
    invoke-virtual {p0, v4, v1}, Ljava/lang/String;->indexOf(II)I

    .line 29
    .line 30
    .line 31
    move-result v4

    .line 32
    if-eq v4, v3, :cond_2

    .line 33
    .line 34
    if-le v4, v2, :cond_1

    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_1
    invoke-virtual {p0, v1, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    add-int/lit8 v4, v4, 0x1

    .line 45
    .line 46
    invoke-virtual {p0, v4, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    goto :goto_2

    .line 54
    :cond_2
    :goto_1
    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    const/4 v1, 0x0

    .line 62
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    :goto_2
    add-int/lit8 v1, v2, 0x1

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_3
    return-object v0
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 3

    .line 238
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/p;->c:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string p0, ""

    return-object p0

    .line 239
    :cond_0
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/p;->h:Ljava/lang/String;

    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/p;->a:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, 0x3

    const/16 v2, 0x3a

    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->indexOf(II)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    .line 240
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/p;->h:Ljava/lang/String;

    const/16 v2, 0x40

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 241
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/p;->h:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final a(Ljava/util/List;Z)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;Z)",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 217
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p0

    .line 218
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p0}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v2, p0, :cond_1

    .line 219
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    if-eqz v3, :cond_0

    .line 220
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    invoke-static {v3, v1, v4, p2}, Lcom/tencent/cloud/ai/network/okhttp3/p;->a(Ljava/lang/String;IIZ)Ljava/lang/String;

    move-result-object v3

    goto :goto_1

    :cond_0
    const/4 v3, 0x0

    .line 221
    :goto_1
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 222
    :cond_1
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public b()Ljava/lang/String;
    .locals 4

    .line 69
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/p;->h:Ljava/lang/String;

    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/p;->a:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, 0x3

    const/16 v2, 0x2f

    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->indexOf(II)I

    move-result v0

    .line 70
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/p;->h:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    const-string v3, "?#"

    invoke-static {v1, v0, v2, v3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Ljava/lang/String;IILjava/lang/String;)I

    move-result v1

    .line 71
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/p;->h:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public c()Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/p;->h:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/p;->a:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    add-int/lit8 v1, v1, 0x3

    .line 10
    .line 11
    const/16 v2, 0x2f

    .line 12
    .line 13
    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->indexOf(II)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/p;->h:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    const-string v4, "?#"

    .line 24
    .line 25
    invoke-static {v1, v0, v3, v4}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Ljava/lang/String;IILjava/lang/String;)I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    new-instance v3, Ljava/util/ArrayList;

    .line 30
    .line 31
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 32
    .line 33
    .line 34
    :goto_0
    if-ge v0, v1, :cond_0

    .line 35
    .line 36
    add-int/lit8 v0, v0, 0x1

    .line 37
    .line 38
    iget-object v4, p0, Lcom/tencent/cloud/ai/network/okhttp3/p;->h:Ljava/lang/String;

    .line 39
    .line 40
    invoke-static {v4, v0, v1, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Ljava/lang/String;IIC)I

    .line 41
    .line 42
    .line 43
    move-result v4

    .line 44
    iget-object v5, p0, Lcom/tencent/cloud/ai/network/okhttp3/p;->h:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {v5, v0, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move v0, v4

    .line 54
    goto :goto_0

    .line 55
    :cond_0
    return-object v3
.end method

.method public d()Ljava/lang/String;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/p;->f:Ljava/util/List;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/p;->h:Ljava/lang/String;

    .line 8
    .line 9
    const/16 v1, 0x3f

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    add-int/lit8 v0, v0, 0x1

    .line 16
    .line 17
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/p;->h:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    const/16 v3, 0x23

    .line 24
    .line 25
    invoke-static {v1, v0, v2, v3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Ljava/lang/String;IIC)I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/p;->h:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method

.method public e()Ljava/lang/String;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/p;->b:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const-string p0, ""

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/p;->a:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    add-int/lit8 v0, v0, 0x3

    .line 19
    .line 20
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/p;->h:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    const-string v3, ":@"

    .line 27
    .line 28
    invoke-static {v1, v0, v2, v3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Ljava/lang/String;IILjava/lang/String;)I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/p;->h:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1

    .line 1
    instance-of v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/p;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/tencent/cloud/ai/network/okhttp3/p;

    .line 6
    .line 7
    iget-object p1, p1, Lcom/tencent/cloud/ai/network/okhttp3/p;->h:Ljava/lang/String;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/p;->h:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public f()Ljava/lang/String;
    .locals 10

    .line 1
    const-string v0, "/..."

    .line 2
    .line 3
    :try_start_0
    new-instance v1, Lcom/tencent/cloud/ai/network/okhttp3/p$a;

    .line 4
    .line 5
    invoke-direct {v1}, Lcom/tencent/cloud/ai/network/okhttp3/p$a;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v1, p0, v0}, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->a(Lcom/tencent/cloud/ai/network/okhttp3/p;Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/p$a;

    .line 9
    .line 10
    .line 11
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 12
    goto :goto_0

    .line 13
    :catch_0
    const/4 p0, 0x0

    .line 14
    :goto_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 15
    .line 16
    .line 17
    const/4 v7, 0x1

    .line 18
    const/4 v8, 0x0

    .line 19
    const-string v0, ""

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    const/4 v2, 0x0

    .line 23
    const-string v3, " \"\':;<=>@[]^`{}|/\\?#"

    .line 24
    .line 25
    const/4 v4, 0x0

    .line 26
    const/4 v5, 0x0

    .line 27
    const/4 v6, 0x0

    .line 28
    invoke-static/range {v0 .. v8}, Lcom/tencent/cloud/ai/network/okhttp3/p;->a(Ljava/lang/String;IILjava/lang/String;ZZZZLjava/nio/charset/Charset;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->b:Ljava/lang/String;

    .line 33
    .line 34
    const/4 v8, 0x1

    .line 35
    const/4 v9, 0x0

    .line 36
    const-string v1, ""

    .line 37
    .line 38
    const/4 v3, 0x0

    .line 39
    const-string v4, " \"\':;<=>@[]^`{}|/\\?#"

    .line 40
    .line 41
    const/4 v7, 0x0

    .line 42
    invoke-static/range {v1 .. v9}, Lcom/tencent/cloud/ai/network/okhttp3/p;->a(Ljava/lang/String;IILjava/lang/String;ZZZZLjava/nio/charset/Charset;)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->c:Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->a()Lcom/tencent/cloud/ai/network/okhttp3/p;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/p;->h:Ljava/lang/String;

    .line 53
    .line 54
    return-object p0
.end method

.method public g()Ljava/net/URI;
    .locals 13

    .line 1
    new-instance v0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/tencent/cloud/ai/network/okhttp3/p$a;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/p;->a:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->a:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/p;->e()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iput-object v1, v0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->b:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/p;->a()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iput-object v1, v0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->c:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/p;->d:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v1, v0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->d:Ljava/lang/String;

    .line 25
    .line 26
    iget v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/p;->e:I

    .line 27
    .line 28
    iget-object v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/p;->a:Ljava/lang/String;

    .line 29
    .line 30
    invoke-static {v2}, Lcom/tencent/cloud/ai/network/okhttp3/p;->a(Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    if-eq v1, v2, :cond_0

    .line 35
    .line 36
    iget v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/p;->e:I

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    const/4 v1, -0x1

    .line 40
    :goto_0
    iput v1, v0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->e:I

    .line 41
    .line 42
    iget-object v1, v0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->f:Ljava/util/List;

    .line 43
    .line 44
    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 45
    .line 46
    .line 47
    iget-object v1, v0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->f:Ljava/util/List;

    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/p;->c()Ljava/util/List;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    invoke-interface {v1, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/p;->d()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-virtual {v0, v1}, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->a(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/p$a;

    .line 61
    .line 62
    .line 63
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/p;->g:Ljava/lang/String;

    .line 64
    .line 65
    const/4 v2, 0x0

    .line 66
    if-nez v1, :cond_1

    .line 67
    .line 68
    move-object p0, v2

    .line 69
    goto :goto_1

    .line 70
    :cond_1
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/p;->h:Ljava/lang/String;

    .line 71
    .line 72
    const/16 v3, 0x23

    .line 73
    .line 74
    invoke-virtual {v1, v3}, Ljava/lang/String;->indexOf(I)I

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    add-int/lit8 v1, v1, 0x1

    .line 79
    .line 80
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/p;->h:Ljava/lang/String;

    .line 81
    .line 82
    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    :goto_1
    iput-object p0, v0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->h:Ljava/lang/String;

    .line 87
    .line 88
    iget-object p0, v0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->f:Ljava/util/List;

    .line 89
    .line 90
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 91
    .line 92
    .line 93
    move-result p0

    .line 94
    const/4 v1, 0x0

    .line 95
    move v3, v1

    .line 96
    :goto_2
    if-ge v3, p0, :cond_2

    .line 97
    .line 98
    iget-object v4, v0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->f:Ljava/util/List;

    .line 99
    .line 100
    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object v4

    .line 104
    move-object v5, v4

    .line 105
    check-cast v5, Ljava/lang/String;

    .line 106
    .line 107
    iget-object v4, v0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->f:Ljava/util/List;

    .line 108
    .line 109
    const/4 v9, 0x0

    .line 110
    const/4 v10, 0x1

    .line 111
    const-string v6, "[]"

    .line 112
    .line 113
    const/4 v7, 0x1

    .line 114
    const/4 v8, 0x1

    .line 115
    invoke-static/range {v5 .. v10}, Lcom/tencent/cloud/ai/network/okhttp3/p;->a(Ljava/lang/String;Ljava/lang/String;ZZZZ)Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v5

    .line 119
    invoke-interface {v4, v3, v5}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 120
    .line 121
    .line 122
    add-int/lit8 v3, v3, 0x1

    .line 123
    .line 124
    goto :goto_2

    .line 125
    :cond_2
    iget-object p0, v0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->g:Ljava/util/List;

    .line 126
    .line 127
    if-eqz p0, :cond_4

    .line 128
    .line 129
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 130
    .line 131
    .line 132
    move-result p0

    .line 133
    :goto_3
    if-ge v1, p0, :cond_4

    .line 134
    .line 135
    iget-object v3, v0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->g:Ljava/util/List;

    .line 136
    .line 137
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 138
    .line 139
    .line 140
    move-result-object v3

    .line 141
    move-object v4, v3

    .line 142
    check-cast v4, Ljava/lang/String;

    .line 143
    .line 144
    if-eqz v4, :cond_3

    .line 145
    .line 146
    iget-object v3, v0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->g:Ljava/util/List;

    .line 147
    .line 148
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    .line 149
    .line 150
    .line 151
    move-result v6

    .line 152
    const/4 v11, 0x1

    .line 153
    const/4 v12, 0x0

    .line 154
    const/4 v5, 0x0

    .line 155
    const-string v7, "\\^`{|}"

    .line 156
    .line 157
    const/4 v8, 0x1

    .line 158
    const/4 v9, 0x1

    .line 159
    const/4 v10, 0x1

    .line 160
    invoke-static/range {v4 .. v12}, Lcom/tencent/cloud/ai/network/okhttp3/p;->a(Ljava/lang/String;IILjava/lang/String;ZZZZLjava/nio/charset/Charset;)Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object v4

    .line 164
    invoke-interface {v3, v1, v4}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 165
    .line 166
    .line 167
    :cond_3
    add-int/lit8 v1, v1, 0x1

    .line 168
    .line 169
    goto :goto_3

    .line 170
    :cond_4
    iget-object v3, v0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->h:Ljava/lang/String;

    .line 171
    .line 172
    if-eqz v3, :cond_5

    .line 173
    .line 174
    const/4 v7, 0x0

    .line 175
    const/4 v8, 0x0

    .line 176
    const-string v4, " \"#<>\\^`{|}"

    .line 177
    .line 178
    const/4 v5, 0x1

    .line 179
    const/4 v6, 0x1

    .line 180
    invoke-static/range {v3 .. v8}, Lcom/tencent/cloud/ai/network/okhttp3/p;->a(Ljava/lang/String;Ljava/lang/String;ZZZZ)Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object p0

    .line 184
    iput-object p0, v0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->h:Ljava/lang/String;

    .line 185
    .line 186
    :cond_5
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->toString()Ljava/lang/String;

    .line 187
    .line 188
    .line 189
    move-result-object p0

    .line 190
    :try_start_0
    new-instance v0, Ljava/net/URI;

    .line 191
    .line 192
    invoke-direct {v0, p0}, Ljava/net/URI;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    .line 193
    .line 194
    .line 195
    return-object v0

    .line 196
    :catch_0
    move-exception v0

    .line 197
    :try_start_1
    const-string v1, "[\\u0000-\\u001F\\u007F-\\u009F\\p{javaWhitespace}]"

    .line 198
    .line 199
    const-string v3, ""

    .line 200
    .line 201
    invoke-virtual {p0, v1, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object p0

    .line 205
    invoke-static {p0}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    .line 206
    .line 207
    .line 208
    move-result-object p0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 209
    return-object p0

    .line 210
    :catch_1
    invoke-static {v0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 211
    .line 212
    .line 213
    return-object v2
.end method

.method public hashCode()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/p;->h:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/p;->h:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
