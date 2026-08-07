.class public final Ll/mqr0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/xor0;


# instance fields
.field public final a:Ll/bgw0;

.field public final b:Z

.field public final c:I

.field public final d:I

.field public final e:Ljava/lang/String;

.field public final f:F

.field public final g:I


# direct methods
.method public constructor <init>(Ljava/util/List;)V
    .locals 9

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/bgw0;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/bgw0;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/mqr0;->a:Ll/bgw0;

    .line 10
    .line 11
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const v1, 0x3f59999a    # 0.85f

    .line 16
    .line 17
    .line 18
    const-string v2, "sans-serif"

    .line 19
    .line 20
    const/4 v3, 0x0

    .line 21
    const/4 v4, 0x1

    .line 22
    if-ne v0, v4, :cond_4

    .line 23
    .line 24
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, [B

    .line 29
    .line 30
    array-length v0, v0

    .line 31
    const/16 v5, 0x30

    .line 32
    .line 33
    if-eq v0, v5, :cond_0

    .line 34
    .line 35
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    check-cast v0, [B

    .line 40
    .line 41
    array-length v0, v0

    .line 42
    const/16 v5, 0x35

    .line 43
    .line 44
    if-ne v0, v5, :cond_4

    .line 45
    .line 46
    :cond_0
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    check-cast p1, [B

    .line 51
    .line 52
    const/16 v0, 0x18

    .line 53
    .line 54
    aget-byte v5, p1, v0

    .line 55
    .line 56
    iput v5, p0, Ll/mqr0;->c:I

    .line 57
    .line 58
    const/16 v5, 0x1a

    .line 59
    .line 60
    aget-byte v5, p1, v5

    .line 61
    .line 62
    and-int/lit16 v5, v5, 0xff

    .line 63
    .line 64
    const/16 v6, 0x1b

    .line 65
    .line 66
    aget-byte v6, p1, v6

    .line 67
    .line 68
    and-int/lit16 v6, v6, 0xff

    .line 69
    .line 70
    const/16 v7, 0x1c

    .line 71
    .line 72
    aget-byte v7, p1, v7

    .line 73
    .line 74
    and-int/lit16 v7, v7, 0xff

    .line 75
    .line 76
    const/16 v8, 0x1d

    .line 77
    .line 78
    aget-byte v8, p1, v8

    .line 79
    .line 80
    and-int/lit16 v8, v8, 0xff

    .line 81
    .line 82
    shl-int/lit8 v0, v5, 0x18

    .line 83
    .line 84
    shl-int/lit8 v5, v6, 0x10

    .line 85
    .line 86
    or-int/2addr v0, v5

    .line 87
    shl-int/lit8 v5, v7, 0x8

    .line 88
    .line 89
    or-int/2addr v0, v5

    .line 90
    or-int/2addr v0, v8

    .line 91
    iput v0, p0, Ll/mqr0;->d:I

    .line 92
    .line 93
    array-length v0, p1

    .line 94
    add-int/lit8 v0, v0, -0x2b

    .line 95
    .line 96
    const/16 v5, 0x2b

    .line 97
    .line 98
    invoke-static {p1, v5, v0}, Ll/mpw0;->a([BII)Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    const-string v5, "Serif"

    .line 103
    .line 104
    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    if-eq v4, v0, :cond_1

    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_1
    const-string v2, "serif"

    .line 112
    .line 113
    :goto_0
    iput-object v2, p0, Ll/mqr0;->e:Ljava/lang/String;

    .line 114
    .line 115
    const/16 v0, 0x19

    .line 116
    .line 117
    aget-byte v0, p1, v0

    .line 118
    .line 119
    mul-int/lit8 v0, v0, 0x14

    .line 120
    .line 121
    iput v0, p0, Ll/mqr0;->g:I

    .line 122
    .line 123
    aget-byte v2, p1, v3

    .line 124
    .line 125
    and-int/lit8 v2, v2, 0x20

    .line 126
    .line 127
    if-eqz v2, :cond_2

    .line 128
    .line 129
    move v3, v4

    .line 130
    :cond_2
    iput-boolean v3, p0, Ll/mqr0;->b:Z

    .line 131
    .line 132
    if-eqz v3, :cond_3

    .line 133
    .line 134
    const/16 v1, 0xa

    .line 135
    .line 136
    aget-byte v1, p1, v1

    .line 137
    .line 138
    and-int/lit16 v1, v1, 0xff

    .line 139
    .line 140
    shl-int/lit8 v1, v1, 0x8

    .line 141
    .line 142
    const/16 v2, 0xb

    .line 143
    .line 144
    aget-byte p1, p1, v2

    .line 145
    .line 146
    and-int/lit16 p1, p1, 0xff

    .line 147
    .line 148
    int-to-float v0, v0

    .line 149
    or-int/2addr p1, v1

    .line 150
    int-to-float p1, p1

    .line 151
    div-float/2addr p1, v0

    .line 152
    const v0, 0x3f733333    # 0.95f

    .line 153
    .line 154
    .line 155
    invoke-static {p1, v0}, Ljava/lang/Math;->min(FF)F

    .line 156
    .line 157
    .line 158
    move-result p1

    .line 159
    const/4 v0, 0x0

    .line 160
    invoke-static {v0, p1}, Ljava/lang/Math;->max(FF)F

    .line 161
    .line 162
    .line 163
    move-result p1

    .line 164
    iput p1, p0, Ll/mqr0;->f:F

    .line 165
    .line 166
    return-void

    .line 167
    :cond_3
    iput v1, p0, Ll/mqr0;->f:F

    .line 168
    .line 169
    return-void

    .line 170
    :cond_4
    iput v3, p0, Ll/mqr0;->c:I

    .line 171
    .line 172
    const/4 p1, -0x1

    .line 173
    iput p1, p0, Ll/mqr0;->d:I

    .line 174
    .line 175
    iput-object v2, p0, Ll/mqr0;->e:Ljava/lang/String;

    .line 176
    .line 177
    iput-boolean v3, p0, Ll/mqr0;->b:Z

    .line 178
    .line 179
    iput v1, p0, Ll/mqr0;->f:F

    .line 180
    .line 181
    iput p1, p0, Ll/mqr0;->g:I

    .line 182
    .line 183
    return-void
.end method

.method public static b(Landroid/text/SpannableStringBuilder;IIIII)V
    .locals 1

    .line 1
    if-eq p1, p2, :cond_0

    .line 2
    .line 3
    and-int/lit16 p2, p1, 0xff

    .line 4
    .line 5
    shl-int/lit8 p2, p2, 0x18

    .line 6
    .line 7
    ushr-int/lit8 p1, p1, 0x8

    .line 8
    .line 9
    new-instance v0, Landroid/text/style/ForegroundColorSpan;

    .line 10
    .line 11
    or-int/2addr p1, p2

    .line 12
    invoke-direct {v0, p1}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 13
    .line 14
    .line 15
    or-int/lit8 p1, p5, 0x21

    .line 16
    .line 17
    invoke-virtual {p0, v0, p3, p4, p1}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public static c(Landroid/text/SpannableStringBuilder;IIIII)V
    .locals 4

    .line 1
    if-eq p1, p2, :cond_4

    .line 2
    .line 3
    or-int/lit8 p2, p5, 0x21

    .line 4
    .line 5
    and-int/lit8 p5, p1, 0x1

    .line 6
    .line 7
    and-int/lit8 v0, p1, 0x2

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    const/4 v2, 0x1

    .line 11
    if-eqz p5, :cond_2

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    new-instance v0, Landroid/text/style/StyleSpan;

    .line 16
    .line 17
    const/4 v3, 0x3

    .line 18
    invoke-direct {v0, v3}, Landroid/text/style/StyleSpan;-><init>(I)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, v0, p3, p4, p2}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    new-instance v0, Landroid/text/style/StyleSpan;

    .line 26
    .line 27
    invoke-direct {v0, v2}, Landroid/text/style/StyleSpan;-><init>(I)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, v0, p3, p4, p2}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 31
    .line 32
    .line 33
    :cond_1
    move v2, v1

    .line 34
    goto :goto_0

    .line 35
    :cond_2
    if-eqz v0, :cond_1

    .line 36
    .line 37
    new-instance v0, Landroid/text/style/StyleSpan;

    .line 38
    .line 39
    const/4 v3, 0x2

    .line 40
    invoke-direct {v0, v3}, Landroid/text/style/StyleSpan;-><init>(I)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0, v0, p3, p4, p2}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 44
    .line 45
    .line 46
    :goto_0
    and-int/lit8 p1, p1, 0x4

    .line 47
    .line 48
    if-nez p1, :cond_3

    .line 49
    .line 50
    if-nez p5, :cond_4

    .line 51
    .line 52
    if-nez v2, :cond_4

    .line 53
    .line 54
    new-instance p1, Landroid/text/style/StyleSpan;

    .line 55
    .line 56
    invoke-direct {p1, v1}, Landroid/text/style/StyleSpan;-><init>(I)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0, p1, p3, p4, p2}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_3
    new-instance p1, Landroid/text/style/UnderlineSpan;

    .line 64
    .line 65
    invoke-direct {p1}, Landroid/text/style/UnderlineSpan;-><init>()V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0, p1, p3, p4, p2}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 69
    .line 70
    .line 71
    :cond_4
    return-void
.end method


# virtual methods
.method public final a([BIILl/wor0;Ll/hkv0;)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p2

    .line 4
    .line 5
    move-object/from16 v2, p5

    .line 6
    .line 7
    add-int v3, v1, p3

    .line 8
    .line 9
    iget-object v4, v0, Ll/mqr0;->a:Ll/bgw0;

    .line 10
    .line 11
    move-object/from16 v5, p1

    .line 12
    .line 13
    invoke-virtual {v4, v5, v3}, Ll/bgw0;->i([BI)V

    .line 14
    .line 15
    .line 16
    iget-object v3, v0, Ll/mqr0;->a:Ll/bgw0;

    .line 17
    .line 18
    invoke-virtual {v3, v1}, Ll/bgw0;->k(I)V

    .line 19
    .line 20
    .line 21
    iget-object v1, v0, Ll/mqr0;->a:Ll/bgw0;

    .line 22
    .line 23
    invoke-virtual {v1}, Ll/bgw0;->q()I

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    const/4 v4, 0x1

    .line 28
    const/4 v5, 0x0

    .line 29
    const/4 v6, 0x2

    .line 30
    if-lt v3, v6, :cond_0

    .line 31
    .line 32
    move v3, v4

    .line 33
    goto :goto_0

    .line 34
    :cond_0
    move v3, v5

    .line 35
    :goto_0
    invoke-static {v3}, Ll/lev0;->d(Z)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v1}, Ll/bgw0;->F()I

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    if-nez v3, :cond_1

    .line 43
    .line 44
    const-string v1, ""

    .line 45
    .line 46
    goto :goto_2

    .line 47
    :cond_1
    invoke-virtual {v1}, Ll/bgw0;->s()I

    .line 48
    .line 49
    .line 50
    move-result v7

    .line 51
    invoke-virtual {v1}, Ll/bgw0;->b()Ljava/nio/charset/Charset;

    .line 52
    .line 53
    .line 54
    move-result-object v8

    .line 55
    invoke-virtual {v1}, Ll/bgw0;->s()I

    .line 56
    .line 57
    .line 58
    move-result v9

    .line 59
    sub-int/2addr v9, v7

    .line 60
    if-eqz v8, :cond_2

    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_2
    sget-object v8, Ll/cow0;->c:Ljava/nio/charset/Charset;

    .line 64
    .line 65
    :goto_1
    sub-int/2addr v3, v9

    .line 66
    invoke-virtual {v1, v3, v8}, Ll/bgw0;->a(ILjava/nio/charset/Charset;)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    :goto_2
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 71
    .line 72
    .line 73
    move-result v3

    .line 74
    if-eqz v3, :cond_3

    .line 75
    .line 76
    new-instance v7, Ll/qor0;

    .line 77
    .line 78
    invoke-static {}, Lcom/google/android/gms/internal/ads/zzgaa;->zzl()Lcom/google/android/gms/internal/ads/zzgaa;

    .line 79
    .line 80
    .line 81
    move-result-object v8

    .line 82
    const-wide v9, -0x7fffffffffffffffL    # -4.9E-324

    .line 83
    .line 84
    .line 85
    .line 86
    .line 87
    move-wide v11, v9

    .line 88
    invoke-direct/range {v7 .. v12}, Ll/qor0;-><init>(Ljava/util/List;JJ)V

    .line 89
    .line 90
    .line 91
    invoke-interface {v2, v7}, Ll/hkv0;->zza(Ljava/lang/Object;)V

    .line 92
    .line 93
    .line 94
    return-void

    .line 95
    :cond_3
    new-instance v8, Landroid/text/SpannableStringBuilder;

    .line 96
    .line 97
    invoke-direct {v8, v1}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 98
    .line 99
    .line 100
    iget v9, v0, Ll/mqr0;->c:I

    .line 101
    .line 102
    invoke-virtual {v8}, Landroid/text/SpannableStringBuilder;->length()I

    .line 103
    .line 104
    .line 105
    move-result v12

    .line 106
    const/high16 v13, 0xff0000

    .line 107
    .line 108
    const/4 v10, 0x0

    .line 109
    const/4 v11, 0x0

    .line 110
    invoke-static/range {v8 .. v13}, Ll/mqr0;->c(Landroid/text/SpannableStringBuilder;IIIII)V

    .line 111
    .line 112
    .line 113
    iget v9, v0, Ll/mqr0;->d:I

    .line 114
    .line 115
    invoke-virtual {v8}, Landroid/text/SpannableStringBuilder;->length()I

    .line 116
    .line 117
    .line 118
    move-result v12

    .line 119
    const/4 v10, -0x1

    .line 120
    invoke-static/range {v8 .. v13}, Ll/mqr0;->b(Landroid/text/SpannableStringBuilder;IIIII)V

    .line 121
    .line 122
    .line 123
    iget-object v1, v0, Ll/mqr0;->e:Ljava/lang/String;

    .line 124
    .line 125
    invoke-virtual {v8}, Landroid/text/SpannableStringBuilder;->length()I

    .line 126
    .line 127
    .line 128
    move-result v3

    .line 129
    const-string v7, "sans-serif"

    .line 130
    .line 131
    if-eq v1, v7, :cond_4

    .line 132
    .line 133
    new-instance v7, Landroid/text/style/TypefaceSpan;

    .line 134
    .line 135
    invoke-direct {v7, v1}, Landroid/text/style/TypefaceSpan;-><init>(Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    const v1, 0xff0021

    .line 139
    .line 140
    .line 141
    invoke-virtual {v8, v7, v5, v3, v1}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 142
    .line 143
    .line 144
    :cond_4
    iget v1, v0, Ll/mqr0;->f:F

    .line 145
    .line 146
    :goto_3
    iget-object v3, v0, Ll/mqr0;->a:Ll/bgw0;

    .line 147
    .line 148
    invoke-virtual {v3}, Ll/bgw0;->q()I

    .line 149
    .line 150
    .line 151
    move-result v7

    .line 152
    const/16 v9, 0x8

    .line 153
    .line 154
    if-lt v7, v9, :cond_d

    .line 155
    .line 156
    invoke-virtual {v3}, Ll/bgw0;->s()I

    .line 157
    .line 158
    .line 159
    move-result v7

    .line 160
    invoke-virtual {v3}, Ll/bgw0;->v()I

    .line 161
    .line 162
    .line 163
    move-result v3

    .line 164
    iget-object v9, v0, Ll/mqr0;->a:Ll/bgw0;

    .line 165
    .line 166
    invoke-virtual {v9}, Ll/bgw0;->v()I

    .line 167
    .line 168
    .line 169
    move-result v9

    .line 170
    const v10, 0x7374796c

    .line 171
    .line 172
    .line 173
    if-ne v9, v10, :cond_a

    .line 174
    .line 175
    iget-object v9, v0, Ll/mqr0;->a:Ll/bgw0;

    .line 176
    .line 177
    invoke-virtual {v9}, Ll/bgw0;->q()I

    .line 178
    .line 179
    .line 180
    move-result v9

    .line 181
    if-lt v9, v6, :cond_5

    .line 182
    .line 183
    move v9, v4

    .line 184
    goto :goto_4

    .line 185
    :cond_5
    move v9, v5

    .line 186
    :goto_4
    invoke-static {v9}, Ll/lev0;->d(Z)V

    .line 187
    .line 188
    .line 189
    iget-object v9, v0, Ll/mqr0;->a:Ll/bgw0;

    .line 190
    .line 191
    invoke-virtual {v9}, Ll/bgw0;->F()I

    .line 192
    .line 193
    .line 194
    move-result v14

    .line 195
    move v15, v5

    .line 196
    :goto_5
    if-ge v15, v14, :cond_9

    .line 197
    .line 198
    iget-object v9, v0, Ll/mqr0;->a:Ll/bgw0;

    .line 199
    .line 200
    invoke-virtual {v9}, Ll/bgw0;->q()I

    .line 201
    .line 202
    .line 203
    move-result v10

    .line 204
    const/16 v11, 0xc

    .line 205
    .line 206
    if-lt v10, v11, :cond_6

    .line 207
    .line 208
    move v10, v4

    .line 209
    goto :goto_6

    .line 210
    :cond_6
    move v10, v5

    .line 211
    :goto_6
    invoke-static {v10}, Ll/lev0;->d(Z)V

    .line 212
    .line 213
    .line 214
    invoke-virtual {v9}, Ll/bgw0;->F()I

    .line 215
    .line 216
    .line 217
    move-result v11

    .line 218
    invoke-virtual {v9}, Ll/bgw0;->F()I

    .line 219
    .line 220
    .line 221
    move-result v10

    .line 222
    invoke-virtual {v9, v6}, Ll/bgw0;->l(I)V

    .line 223
    .line 224
    .line 225
    invoke-virtual {v9}, Ll/bgw0;->B()I

    .line 226
    .line 227
    .line 228
    move-result v12

    .line 229
    invoke-virtual {v9, v4}, Ll/bgw0;->l(I)V

    .line 230
    .line 231
    .line 232
    invoke-virtual {v9}, Ll/bgw0;->v()I

    .line 233
    .line 234
    .line 235
    move-result v16

    .line 236
    invoke-virtual {v8}, Landroid/text/SpannableStringBuilder;->length()I

    .line 237
    .line 238
    .line 239
    move-result v9

    .line 240
    const-string v13, "Tx3gParser"

    .line 241
    .line 242
    const-string v4, ")."

    .line 243
    .line 244
    if-le v10, v9, :cond_7

    .line 245
    .line 246
    invoke-virtual {v8}, Landroid/text/SpannableStringBuilder;->length()I

    .line 247
    .line 248
    .line 249
    move-result v9

    .line 250
    new-instance v5, Ljava/lang/StringBuilder;

    .line 251
    .line 252
    const-string v6, "Truncating styl end ("

    .line 253
    .line 254
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 255
    .line 256
    .line 257
    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 258
    .line 259
    .line 260
    const-string v6, ") to cueText.length() ("

    .line 261
    .line 262
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 263
    .line 264
    .line 265
    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 266
    .line 267
    .line 268
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 269
    .line 270
    .line 271
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 272
    .line 273
    .line 274
    move-result-object v5

    .line 275
    invoke-static {v13, v5}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 276
    .line 277
    .line 278
    invoke-virtual {v8}, Landroid/text/SpannableStringBuilder;->length()I

    .line 279
    .line 280
    .line 281
    move-result v10

    .line 282
    :cond_7
    if-lt v11, v10, :cond_8

    .line 283
    .line 284
    new-instance v5, Ljava/lang/StringBuilder;

    .line 285
    .line 286
    const-string v6, "Ignoring styl with start ("

    .line 287
    .line 288
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 289
    .line 290
    .line 291
    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 292
    .line 293
    .line 294
    const-string v6, ") >= end ("

    .line 295
    .line 296
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 297
    .line 298
    .line 299
    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 300
    .line 301
    .line 302
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 303
    .line 304
    .line 305
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 306
    .line 307
    .line 308
    move-result-object v4

    .line 309
    invoke-static {v13, v4}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 310
    .line 311
    .line 312
    goto :goto_7

    .line 313
    :cond_8
    move v9, v12

    .line 314
    move v12, v10

    .line 315
    iget v10, v0, Ll/mqr0;->c:I

    .line 316
    .line 317
    const/4 v13, 0x0

    .line 318
    invoke-static/range {v8 .. v13}, Ll/mqr0;->c(Landroid/text/SpannableStringBuilder;IIIII)V

    .line 319
    .line 320
    .line 321
    iget v10, v0, Ll/mqr0;->d:I

    .line 322
    .line 323
    move/from16 v9, v16

    .line 324
    .line 325
    invoke-static/range {v8 .. v13}, Ll/mqr0;->b(Landroid/text/SpannableStringBuilder;IIIII)V

    .line 326
    .line 327
    .line 328
    :goto_7
    add-int/lit8 v15, v15, 0x1

    .line 329
    .line 330
    const/4 v4, 0x1

    .line 331
    const/4 v5, 0x0

    .line 332
    const/4 v6, 0x2

    .line 333
    goto/16 :goto_5

    .line 334
    .line 335
    :cond_9
    move v4, v6

    .line 336
    goto :goto_9

    .line 337
    :cond_a
    const v4, 0x74626f78

    .line 338
    .line 339
    .line 340
    if-ne v9, v4, :cond_c

    .line 341
    .line 342
    iget-boolean v4, v0, Ll/mqr0;->b:Z

    .line 343
    .line 344
    if-eqz v4, :cond_c

    .line 345
    .line 346
    iget-object v1, v0, Ll/mqr0;->a:Ll/bgw0;

    .line 347
    .line 348
    invoke-virtual {v1}, Ll/bgw0;->q()I

    .line 349
    .line 350
    .line 351
    move-result v1

    .line 352
    const/4 v4, 0x2

    .line 353
    if-lt v1, v4, :cond_b

    .line 354
    .line 355
    const/4 v1, 0x1

    .line 356
    goto :goto_8

    .line 357
    :cond_b
    const/4 v1, 0x0

    .line 358
    :goto_8
    invoke-static {v1}, Ll/lev0;->d(Z)V

    .line 359
    .line 360
    .line 361
    iget-object v1, v0, Ll/mqr0;->a:Ll/bgw0;

    .line 362
    .line 363
    invoke-virtual {v1}, Ll/bgw0;->F()I

    .line 364
    .line 365
    .line 366
    move-result v1

    .line 367
    int-to-float v1, v1

    .line 368
    iget v5, v0, Ll/mqr0;->g:I

    .line 369
    .line 370
    int-to-float v5, v5

    .line 371
    div-float/2addr v1, v5

    .line 372
    const v5, 0x3f733333    # 0.95f

    .line 373
    .line 374
    .line 375
    invoke-static {v1, v5}, Ljava/lang/Math;->min(FF)F

    .line 376
    .line 377
    .line 378
    move-result v1

    .line 379
    const/4 v5, 0x0

    .line 380
    invoke-static {v5, v1}, Ljava/lang/Math;->max(FF)F

    .line 381
    .line 382
    .line 383
    move-result v1

    .line 384
    goto :goto_9

    .line 385
    :cond_c
    const/4 v4, 0x2

    .line 386
    :goto_9
    iget-object v5, v0, Ll/mqr0;->a:Ll/bgw0;

    .line 387
    .line 388
    add-int/2addr v7, v3

    .line 389
    invoke-virtual {v5, v7}, Ll/bgw0;->k(I)V

    .line 390
    .line 391
    .line 392
    move v6, v4

    .line 393
    const/4 v4, 0x1

    .line 394
    const/4 v5, 0x0

    .line 395
    goto/16 :goto_3

    .line 396
    .line 397
    :cond_d
    new-instance v0, Ll/j2v0;

    .line 398
    .line 399
    invoke-direct {v0}, Ll/j2v0;-><init>()V

    .line 400
    .line 401
    .line 402
    invoke-virtual {v0, v8}, Ll/j2v0;->l(Ljava/lang/CharSequence;)Ll/j2v0;

    .line 403
    .line 404
    .line 405
    const/4 v3, 0x0

    .line 406
    invoke-virtual {v0, v1, v3}, Ll/j2v0;->e(FI)Ll/j2v0;

    .line 407
    .line 408
    .line 409
    invoke-virtual {v0, v3}, Ll/j2v0;->f(I)Ll/j2v0;

    .line 410
    .line 411
    .line 412
    invoke-virtual {v0}, Ll/j2v0;->p()Ll/u4v0;

    .line 413
    .line 414
    .line 415
    move-result-object v0

    .line 416
    new-instance v3, Ll/qor0;

    .line 417
    .line 418
    invoke-static {v0}, Lcom/google/android/gms/internal/ads/zzgaa;->zzm(Ljava/lang/Object;)Lcom/google/android/gms/internal/ads/zzgaa;

    .line 419
    .line 420
    .line 421
    move-result-object v4

    .line 422
    const-wide v5, -0x7fffffffffffffffL    # -4.9E-324

    .line 423
    .line 424
    .line 425
    .line 426
    .line 427
    move-wide v7, v5

    .line 428
    invoke-direct/range {v3 .. v8}, Ll/qor0;-><init>(Ljava/util/List;JJ)V

    .line 429
    .line 430
    .line 431
    invoke-interface {v2, v3}, Ll/hkv0;->zza(Ljava/lang/Object;)V

    .line 432
    .line 433
    .line 434
    return-void
.end method
