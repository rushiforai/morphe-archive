.class public Ll/yej;
.super Ll/vej;
.source "SourceFile"

# interfaces
.implements Ll/cfj;


# instance fields
.field private A:F

.field private B:Z

.field public C:Ljava/lang/String;

.field private D:I

.field private E:I

.field private F:I

.field private G:I

.field private H:I

.field private I:I

.field private J:[Ljava/nio/FloatBuffer;

.field private K:[F

.field private L:[F

.field private M:[F

.field private N:[F

.field private O:Z

.field private x:F

.field private y:F

.field private z:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/vej;-><init>()V

    .line 2
    .line 3
    .line 4
    const/high16 v0, 0x3f800000    # 1.0f

    .line 5
    .line 6
    iput v0, p0, Ll/yej;->y:F

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    iput-boolean v0, p0, Ll/yej;->B:Z

    .line 10
    .line 11
    const-string v0, "mediump"

    .line 12
    .line 13
    iput-object v0, p0, Ll/yej;->C:Ljava/lang/String;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput v0, p0, Ll/yej;->D:I

    .line 17
    .line 18
    iput v0, p0, Ll/yej;->E:I

    .line 19
    .line 20
    iput v0, p0, Ll/yej;->I:I

    .line 21
    .line 22
    iput-boolean v0, p0, Ll/yej;->O:Z

    .line 23
    .line 24
    return-void
.end method

.method private H(II)V
    .locals 2

    .line 1
    int-to-float p1, p1

    .line 2
    const/high16 v0, 0x3f800000    # 1.0f

    .line 3
    .line 4
    mul-float/2addr p1, v0

    .line 5
    iget v1, p0, Ll/yej;->z:F

    .line 6
    .line 7
    div-float/2addr p1, v1

    .line 8
    int-to-float p2, p2

    .line 9
    mul-float/2addr p2, v0

    .line 10
    iget v0, p0, Ll/yej;->A:F

    .line 11
    .line 12
    div-float/2addr p2, v0

    .line 13
    const/high16 v0, 0x3f000000    # 0.5f

    .line 14
    .line 15
    cmpg-float p1, p1, v0

    .line 16
    .line 17
    if-gtz p1, :cond_0

    .line 18
    .line 19
    cmpg-float p1, p2, v0

    .line 20
    .line 21
    if-gtz p1, :cond_0

    .line 22
    .line 23
    const/4 p1, 0x2

    .line 24
    iput p1, p0, Ll/yej;->I:I

    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    const/4 p1, 0x0

    .line 28
    iput p1, p0, Ll/yej;->I:I

    .line 29
    .line 30
    return-void
.end method

.method private I(F)V
    .locals 7

    .line 1
    iget v0, p0, Ll/yej;->A:F

    .line 2
    .line 3
    div-float v1, v0, p1

    .line 4
    .line 5
    float-to-int v1, v1

    .line 6
    iget v2, p0, Ll/yej;->z:F

    .line 7
    .line 8
    mul-float/2addr p1, v2

    .line 9
    float-to-int p1, p1

    .line 10
    int-to-float v1, v1

    .line 11
    cmpg-float v3, v1, v2

    .line 12
    .line 13
    const/4 v4, 0x0

    .line 14
    const/high16 v5, 0x3f000000    # 0.5f

    .line 15
    .line 16
    const/high16 v6, 0x3f800000    # 1.0f

    .line 17
    .line 18
    if-gez v3, :cond_0

    .line 19
    .line 20
    sub-float p1, v2, v1

    .line 21
    .line 22
    mul-float/2addr p1, v5

    .line 23
    div-float/2addr p1, v2

    .line 24
    sub-float v0, v6, p1

    .line 25
    .line 26
    invoke-direct {p0, p1, v0, v4, v6}, Ll/yej;->J(FFFF)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    int-to-float p1, p1

    .line 31
    sub-float p1, v0, p1

    .line 32
    .line 33
    mul-float/2addr p1, v5

    .line 34
    div-float/2addr p1, v0

    .line 35
    sub-float v0, v6, p1

    .line 36
    .line 37
    invoke-direct {p0, v4, v6, p1, v0}, Ll/yej;->J(FFFF)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method private J(FFFF)V
    .locals 11

    .line 1
    iget-boolean v0, p0, Ll/yej;->O:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x4

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    new-array v0, v2, [Ljava/nio/FloatBuffer;

    .line 8
    .line 9
    iput-object v0, p0, Ll/yej;->J:[Ljava/nio/FloatBuffer;

    .line 10
    .line 11
    const/16 v0, 0x8

    .line 12
    .line 13
    new-array v3, v0, [F

    .line 14
    .line 15
    iput-object v3, p0, Ll/yej;->K:[F

    .line 16
    .line 17
    new-array v3, v0, [F

    .line 18
    .line 19
    iput-object v3, p0, Ll/yej;->L:[F

    .line 20
    .line 21
    new-array v3, v0, [F

    .line 22
    .line 23
    iput-object v3, p0, Ll/yej;->M:[F

    .line 24
    .line 25
    new-array v0, v0, [F

    .line 26
    .line 27
    iput-object v0, p0, Ll/yej;->N:[F

    .line 28
    .line 29
    iput-boolean v1, p0, Ll/yej;->O:Z

    .line 30
    .line 31
    :cond_0
    iget-boolean v0, p0, Ll/yej;->O:Z

    .line 32
    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    iget-object v0, p0, Ll/yej;->K:[F

    .line 36
    .line 37
    const/4 v3, 0x0

    .line 38
    aput p1, v0, v3

    .line 39
    .line 40
    aput p3, v0, v1

    .line 41
    .line 42
    const/4 v4, 0x2

    .line 43
    aput p2, v0, v4

    .line 44
    .line 45
    const/4 v5, 0x3

    .line 46
    aput p3, v0, v5

    .line 47
    .line 48
    aput p1, v0, v2

    .line 49
    .line 50
    const/4 v6, 0x5

    .line 51
    aput p4, v0, v6

    .line 52
    .line 53
    const/4 v7, 0x6

    .line 54
    aput p2, v0, v7

    .line 55
    .line 56
    const/4 v8, 0x7

    .line 57
    aput p4, v0, v8

    .line 58
    .line 59
    iget-object v9, p0, Ll/yej;->J:[Ljava/nio/FloatBuffer;

    .line 60
    .line 61
    array-length v0, v0

    .line 62
    mul-int/2addr v0, v2

    .line 63
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 68
    .line 69
    .line 70
    move-result-object v10

    .line 71
    invoke-virtual {v0, v10}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    aput-object v0, v9, v3

    .line 80
    .line 81
    iget-object v0, p0, Ll/yej;->J:[Ljava/nio/FloatBuffer;

    .line 82
    .line 83
    aget-object v0, v0, v3

    .line 84
    .line 85
    iget-object v9, p0, Ll/yej;->K:[F

    .line 86
    .line 87
    invoke-virtual {v0, v9}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-virtual {v0, v3}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 92
    .line 93
    .line 94
    iget-object v0, p0, Ll/yej;->L:[F

    .line 95
    .line 96
    aput p1, v0, v3

    .line 97
    .line 98
    aput p4, v0, v1

    .line 99
    .line 100
    aput p1, v0, v4

    .line 101
    .line 102
    aput p3, v0, v5

    .line 103
    .line 104
    aput p2, v0, v2

    .line 105
    .line 106
    aput p4, v0, v6

    .line 107
    .line 108
    aput p2, v0, v7

    .line 109
    .line 110
    aput p3, v0, v8

    .line 111
    .line 112
    iget-object v9, p0, Ll/yej;->J:[Ljava/nio/FloatBuffer;

    .line 113
    .line 114
    array-length v0, v0

    .line 115
    mul-int/2addr v0, v2

    .line 116
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 121
    .line 122
    .line 123
    move-result-object v10

    .line 124
    invoke-virtual {v0, v10}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    aput-object v0, v9, v1

    .line 133
    .line 134
    iget-object v0, p0, Ll/yej;->J:[Ljava/nio/FloatBuffer;

    .line 135
    .line 136
    aget-object v0, v0, v1

    .line 137
    .line 138
    iget-object v9, p0, Ll/yej;->L:[F

    .line 139
    .line 140
    invoke-virtual {v0, v9}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    invoke-virtual {v0, v3}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 145
    .line 146
    .line 147
    iget-object v0, p0, Ll/yej;->M:[F

    .line 148
    .line 149
    aput p2, v0, v3

    .line 150
    .line 151
    aput p4, v0, v1

    .line 152
    .line 153
    aput p1, v0, v4

    .line 154
    .line 155
    aput p4, v0, v5

    .line 156
    .line 157
    aput p2, v0, v2

    .line 158
    .line 159
    aput p3, v0, v6

    .line 160
    .line 161
    aput p1, v0, v7

    .line 162
    .line 163
    aput p3, v0, v8

    .line 164
    .line 165
    iget-object v9, p0, Ll/yej;->J:[Ljava/nio/FloatBuffer;

    .line 166
    .line 167
    array-length v0, v0

    .line 168
    mul-int/2addr v0, v2

    .line 169
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 174
    .line 175
    .line 176
    move-result-object v10

    .line 177
    invoke-virtual {v0, v10}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 178
    .line 179
    .line 180
    move-result-object v0

    .line 181
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 182
    .line 183
    .line 184
    move-result-object v0

    .line 185
    aput-object v0, v9, v4

    .line 186
    .line 187
    iget-object v0, p0, Ll/yej;->J:[Ljava/nio/FloatBuffer;

    .line 188
    .line 189
    aget-object v0, v0, v4

    .line 190
    .line 191
    iget-object v9, p0, Ll/yej;->M:[F

    .line 192
    .line 193
    invoke-virtual {v0, v9}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 194
    .line 195
    .line 196
    move-result-object v0

    .line 197
    invoke-virtual {v0, v3}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 198
    .line 199
    .line 200
    iget-object v0, p0, Ll/yej;->N:[F

    .line 201
    .line 202
    aput p2, v0, v3

    .line 203
    .line 204
    aput p3, v0, v1

    .line 205
    .line 206
    aput p2, v0, v4

    .line 207
    .line 208
    aput p4, v0, v5

    .line 209
    .line 210
    aput p1, v0, v2

    .line 211
    .line 212
    aput p3, v0, v6

    .line 213
    .line 214
    aput p1, v0, v7

    .line 215
    .line 216
    aput p4, v0, v8

    .line 217
    .line 218
    iget-object p1, p0, Ll/yej;->J:[Ljava/nio/FloatBuffer;

    .line 219
    .line 220
    array-length p2, v0

    .line 221
    mul-int/2addr p2, v2

    .line 222
    invoke-static {p2}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 223
    .line 224
    .line 225
    move-result-object p2

    .line 226
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 227
    .line 228
    .line 229
    move-result-object p3

    .line 230
    invoke-virtual {p2, p3}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 231
    .line 232
    .line 233
    move-result-object p2

    .line 234
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 235
    .line 236
    .line 237
    move-result-object p2

    .line 238
    aput-object p2, p1, v5

    .line 239
    .line 240
    iget-object p1, p0, Ll/yej;->J:[Ljava/nio/FloatBuffer;

    .line 241
    .line 242
    aget-object p1, p1, v5

    .line 243
    .line 244
    iget-object p0, p0, Ll/yej;->N:[F

    .line 245
    .line 246
    invoke-virtual {p1, p0}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 247
    .line 248
    .line 249
    move-result-object p0

    .line 250
    invoke-virtual {p0, v3}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 251
    .line 252
    .line 253
    :cond_1
    return-void
.end method


# virtual methods
.method public E(II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Ll/vej;->E(II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public K(II)V
    .locals 0

    .line 1
    iput p1, p0, Ll/yej;->D:I

    .line 2
    .line 3
    iput p2, p0, Ll/yej;->E:I

    .line 4
    .line 5
    return-void
.end method

.method public b(ILl/ffj;Z)V
    .locals 0

    .line 1
    iput p1, p0, Ll/vej;->h:I

    .line 2
    .line 3
    invoke-virtual {p2}, Ll/vej;->s()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    invoke-virtual {p0, p1}, Ll/vej;->G(I)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p2}, Ll/vej;->q()I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    invoke-virtual {p0, p1}, Ll/vej;->D(I)V

    .line 15
    .line 16
    .line 17
    iget p1, p0, Ll/vej;->a:I

    .line 18
    .line 19
    rem-int/lit8 p1, p1, 0x2

    .line 20
    .line 21
    const/4 p3, 0x1

    .line 22
    if-ne p1, p3, :cond_0

    .line 23
    .line 24
    invoke-virtual {p2}, Ll/vej;->q()I

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    int-to-float p1, p1

    .line 29
    iput p1, p0, Ll/yej;->z:F

    .line 30
    .line 31
    invoke-virtual {p2}, Ll/vej;->s()I

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    int-to-float p1, p1

    .line 36
    iput p1, p0, Ll/yej;->A:F

    .line 37
    .line 38
    invoke-virtual {p2}, Ll/vej;->s()I

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    int-to-float p1, p1

    .line 43
    invoke-virtual {p2}, Ll/vej;->q()I

    .line 44
    .line 45
    .line 46
    move-result p3

    .line 47
    int-to-float p3, p3

    .line 48
    div-float/2addr p1, p3

    .line 49
    iput p1, p0, Ll/yej;->x:F

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_0
    invoke-virtual {p2}, Ll/vej;->s()I

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    int-to-float p1, p1

    .line 57
    iput p1, p0, Ll/yej;->z:F

    .line 58
    .line 59
    invoke-virtual {p2}, Ll/vej;->q()I

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    int-to-float p1, p1

    .line 64
    iput p1, p0, Ll/yej;->A:F

    .line 65
    .line 66
    invoke-virtual {p2}, Ll/vej;->q()I

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    int-to-float p1, p1

    .line 71
    invoke-virtual {p2}, Ll/vej;->s()I

    .line 72
    .line 73
    .line 74
    move-result p3

    .line 75
    int-to-float p3, p3

    .line 76
    div-float/2addr p1, p3

    .line 77
    iput p1, p0, Ll/yej;->x:F

    .line 78
    .line 79
    :goto_0
    invoke-virtual {p0}, Ll/vej;->w()V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p2}, Ll/ffj;->P()V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public i()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/vej;->i()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public k()V
    .locals 5

    .line 1
    iget v0, p0, Ll/vej;->h:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto/16 :goto_3

    .line 6
    .line 7
    :cond_0
    invoke-virtual {p0}, Ll/vej;->s()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-virtual {p0}, Ll/vej;->q()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-direct {p0, v0, v1}, Ll/yej;->H(II)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ll/vej;->q()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    int-to-float v0, v0

    .line 23
    const/high16 v1, 0x3f800000    # 1.0f

    .line 24
    .line 25
    mul-float/2addr v0, v1

    .line 26
    invoke-virtual {p0}, Ll/vej;->s()I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    int-to-float v2, v2

    .line 31
    div-float/2addr v0, v2

    .line 32
    iget v2, p0, Ll/yej;->x:F

    .line 33
    .line 34
    cmpl-float v0, v0, v2

    .line 35
    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    invoke-virtual {p0}, Ll/vej;->q()I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    int-to-float v0, v0

    .line 43
    mul-float/2addr v0, v1

    .line 44
    invoke-virtual {p0}, Ll/vej;->s()I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    int-to-float v1, v1

    .line 49
    div-float/2addr v0, v1

    .line 50
    invoke-direct {p0, v0}, Ll/yej;->I(F)V

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_1
    const/4 v0, 0x0

    .line 55
    invoke-direct {p0, v0, v1, v0, v1}, Ll/yej;->J(FFFF)V

    .line 56
    .line 57
    .line 58
    :goto_0
    iget v0, p0, Ll/yej;->D:I

    .line 59
    .line 60
    const/4 v1, 0x0

    .line 61
    if-eqz v0, :cond_3

    .line 62
    .line 63
    iget v2, p0, Ll/yej;->E:I

    .line 64
    .line 65
    if-nez v2, :cond_2

    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_2
    invoke-static {v1, v1, v0, v2}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 69
    .line 70
    .line 71
    goto :goto_2

    .line 72
    :cond_3
    :goto_1
    invoke-virtual {p0}, Ll/vej;->s()I

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    invoke-virtual {p0}, Ll/vej;->q()I

    .line 77
    .line 78
    .line 79
    move-result v2

    .line 80
    invoke-static {v1, v1, v0, v2}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 81
    .line 82
    .line 83
    :goto_2
    iget v0, p0, Ll/vej;->d:I

    .line 84
    .line 85
    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p0}, Ll/vej;->o()F

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    invoke-virtual {p0}, Ll/vej;->n()F

    .line 93
    .line 94
    .line 95
    move-result v2

    .line 96
    invoke-virtual {p0}, Ll/vej;->m()F

    .line 97
    .line 98
    .line 99
    move-result v3

    .line 100
    invoke-virtual {p0}, Ll/vej;->l()F

    .line 101
    .line 102
    .line 103
    move-result v4

    .line 104
    invoke-static {v0, v2, v3, v4}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {p0}, Ll/yej;->x()V

    .line 108
    .line 109
    .line 110
    const/4 v0, 0x5

    .line 111
    const/4 v2, 0x4

    .line 112
    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 113
    .line 114
    .line 115
    iget-boolean p0, p0, Ll/yej;->B:Z

    .line 116
    .line 117
    if-eqz p0, :cond_4

    .line 118
    .line 119
    invoke-static {}, Landroid/opengl/GLES20;->glFinish()V

    .line 120
    .line 121
    .line 122
    :cond_4
    :goto_3
    return-void
.end method

.method public p()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "precision "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/yej;->C:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string p0, " float;\nuniform sampler2D inputImageTexture0;\nvarying vec2 textureCoordinate;\nvarying vec2 xy_step;\nvarying float smooth; \nvoid main(){\nvec2 point = textureCoordinate; \nvec4 image_c = texture2D(inputImageTexture0,point); \nvec4 image = image_c;\nif (smooth >= 0.1) { \nvec4 image_lt=texture2D(inputImageTexture0, clamp(point+vec2(-xy_step.x,  xy_step.y), 0.0, 1.0)); \nvec4 image_lb=texture2D(inputImageTexture0, clamp(point+vec2(-xy_step.x, -xy_step.y), 0.0, 1.0)); \nvec4 image_rt=texture2D(inputImageTexture0, clamp(point+vec2( xy_step.x,  xy_step.y), 0.0, 1.0)); \nvec4 image_rb=texture2D(inputImageTexture0, clamp(point+vec2( xy_step.x, -xy_step.y), 0.0, 1.0)); \nvec4 image_l =texture2D(inputImageTexture0, clamp(point+vec2(-xy_step.x,     0.0), 0.0, 1.0)); \nvec4 image_r =texture2D(inputImageTexture0, clamp(point+vec2( xy_step.x,     0.0), 0.0, 1.0)); \nvec4 image_t =texture2D(inputImageTexture0, clamp(point+vec2(    0.0,  xy_step.y), 0.0, 1.0)); \nvec4 image_b =texture2D(inputImageTexture0, clamp(point+vec2(    0.0, -xy_step.y), 0.0, 1.0)); \nimage = clamp(image_c*0.25+(image_lt+image_lb+image_rt+image_rb)*0.125+(image_l+image_t+image_b+image_r)*0.0625, 0.0, 1.0); \n} \ngl_FragColor = image;\n}\n"

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public r()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "attribute vec4 position;\nattribute vec2 inputTextureCoordinate;\nvarying vec2 textureCoordinate;\nuniform float widthStep; \nuniform float heightStep; \nuniform float smoothMode; \nvarying float smooth; \nvarying vec2 xy_step;\nvoid main() {\nsmooth = smoothMode; \n  textureCoordinate = inputTextureCoordinate;\nxy_step = vec2(widthStep, heightStep);\ngl_Position = position;\n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public u()V
    .locals 2

    .line 1
    iget v0, p0, Ll/vej;->d:I

    .line 2
    .line 3
    const-string v1, "inputImageTexture0"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iput v0, p0, Ll/vej;->e:I

    .line 10
    .line 11
    iget v0, p0, Ll/vej;->d:I

    .line 12
    .line 13
    const-string v1, "position"

    .line 14
    .line 15
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iput v0, p0, Ll/vej;->f:I

    .line 20
    .line 21
    iget v0, p0, Ll/vej;->d:I

    .line 22
    .line 23
    const-string v1, "inputTextureCoordinate"

    .line 24
    .line 25
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    iput v0, p0, Ll/vej;->g:I

    .line 30
    .line 31
    iget v0, p0, Ll/vej;->d:I

    .line 32
    .line 33
    const-string v1, "widthStep"

    .line 34
    .line 35
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    iput v0, p0, Ll/yej;->F:I

    .line 40
    .line 41
    iget v0, p0, Ll/vej;->d:I

    .line 42
    .line 43
    const-string v1, "heightStep"

    .line 44
    .line 45
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    iput v0, p0, Ll/yej;->G:I

    .line 50
    .line 51
    iget v0, p0, Ll/vej;->d:I

    .line 52
    .line 53
    const-string v1, "smoothMode"

    .line 54
    .line 55
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    iput v0, p0, Ll/yej;->H:I

    .line 60
    .line 61
    return-void
.end method

.method public v()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/vej;->v()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public x()V
    .locals 9

    .line 1
    iget v0, p0, Ll/vej;->a:I

    .line 2
    .line 3
    iget-object v1, p0, Ll/vej;->b:Ljava/nio/FloatBuffer;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-virtual {v1, v2}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 7
    .line 8
    .line 9
    iget v1, p0, Ll/yej;->z:F

    .line 10
    .line 11
    const/high16 v3, 0x3f800000    # 1.0f

    .line 12
    .line 13
    div-float v1, v3, v1

    .line 14
    .line 15
    iget v4, p0, Ll/yej;->A:F

    .line 16
    .line 17
    div-float/2addr v3, v4

    .line 18
    iget v4, p0, Ll/yej;->F:I

    .line 19
    .line 20
    invoke-static {v4, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 21
    .line 22
    .line 23
    iget v1, p0, Ll/yej;->G:I

    .line 24
    .line 25
    invoke-static {v1, v3}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 26
    .line 27
    .line 28
    iget v1, p0, Ll/yej;->H:I

    .line 29
    .line 30
    iget v3, p0, Ll/yej;->I:I

    .line 31
    .line 32
    int-to-float v3, v3

    .line 33
    const/high16 v4, 0x41200000    # 10.0f

    .line 34
    .line 35
    div-float/2addr v3, v4

    .line 36
    invoke-static {v1, v3}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 37
    .line 38
    .line 39
    rem-int/lit8 v0, v0, 0x4

    .line 40
    .line 41
    iget v3, p0, Ll/vej;->f:I

    .line 42
    .line 43
    const/16 v7, 0x8

    .line 44
    .line 45
    iget-object v8, p0, Ll/vej;->b:Ljava/nio/FloatBuffer;

    .line 46
    .line 47
    const/4 v4, 0x2

    .line 48
    const/16 v5, 0x1406

    .line 49
    .line 50
    const/4 v6, 0x0

    .line 51
    invoke-static/range {v3 .. v8}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 52
    .line 53
    .line 54
    iget v1, p0, Ll/vej;->f:I

    .line 55
    .line 56
    invoke-static {v1}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 57
    .line 58
    .line 59
    iget-object v1, p0, Ll/yej;->J:[Ljava/nio/FloatBuffer;

    .line 60
    .line 61
    aget-object v1, v1, v0

    .line 62
    .line 63
    invoke-virtual {v1, v2}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 64
    .line 65
    .line 66
    iget v3, p0, Ll/vej;->g:I

    .line 67
    .line 68
    iget-object v1, p0, Ll/yej;->J:[Ljava/nio/FloatBuffer;

    .line 69
    .line 70
    aget-object v8, v1, v0

    .line 71
    .line 72
    invoke-static/range {v3 .. v8}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 73
    .line 74
    .line 75
    iget v0, p0, Ll/vej;->g:I

    .line 76
    .line 77
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 78
    .line 79
    .line 80
    const v0, 0x84c0

    .line 81
    .line 82
    .line 83
    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 84
    .line 85
    .line 86
    const/16 v0, 0xde1

    .line 87
    .line 88
    iget v1, p0, Ll/vej;->h:I

    .line 89
    .line 90
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 91
    .line 92
    .line 93
    iget p0, p0, Ll/vej;->e:I

    .line 94
    .line 95
    invoke-static {p0, v2}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 96
    .line 97
    .line 98
    return-void
.end method
