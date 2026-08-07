.class public Lcom/tencent/liteav/beauty/b/f;
.super Lcom/tencent/liteav/basic/c/h;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/liteav/beauty/b/f$b;,
        Lcom/tencent/liteav/beauty/b/f$a;,
        Lcom/tencent/liteav/beauty/b/f$c;
    }
.end annotation


# instance fields
.field private A:[I

.field private B:F

.field r:I

.field s:I

.field t:Z

.field private u:Lcom/tencent/liteav/beauty/b/d;

.field private v:Lcom/tencent/liteav/basic/c/h;

.field private w:Lcom/tencent/liteav/beauty/b/f$c;

.field private x:Lcom/tencent/liteav/beauty/b/f$a;

.field private y:Lcom/tencent/liteav/beauty/b/f$b;

.field private z:[I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/tencent/liteav/basic/c/h;-><init>()V

    .line 2
    .line 3
    .line 4
    const/high16 v0, 0x40800000    # 4.0f

    .line 5
    .line 6
    iput v0, p0, Lcom/tencent/liteav/beauty/b/f;->B:F

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(II)V
    .locals 13

    .line 1
    iget v0, p0, Lcom/tencent/liteav/basic/c/h;->f:I

    .line 2
    .line 3
    if-ne v0, p2, :cond_0

    .line 4
    .line 5
    iget v0, p0, Lcom/tencent/liteav/basic/c/h;->e:I

    .line 6
    .line 7
    if-ne v0, p1, :cond_0

    .line 8
    .line 9
    goto/16 :goto_3

    .line 10
    .line 11
    :cond_0
    invoke-super/range {p0 .. p2}, Lcom/tencent/liteav/basic/c/h;->a(II)V

    .line 12
    .line 13
    .line 14
    iget-boolean v0, p0, Lcom/tencent/liteav/beauty/b/f;->t:Z

    .line 15
    .line 16
    if-nez v0, :cond_4

    .line 17
    .line 18
    const/high16 v0, 0x40800000    # 4.0f

    .line 19
    .line 20
    const/high16 v1, 0x3f800000    # 1.0f

    .line 21
    .line 22
    const/16 v2, 0x21c

    .line 23
    .line 24
    if-ge p1, p2, :cond_2

    .line 25
    .line 26
    if-ge p1, v2, :cond_1

    .line 27
    .line 28
    iput v1, p0, Lcom/tencent/liteav/beauty/b/f;->B:F

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    iput v0, p0, Lcom/tencent/liteav/beauty/b/f;->B:F

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_2
    if-ge p2, v2, :cond_3

    .line 35
    .line 36
    iput v1, p0, Lcom/tencent/liteav/beauty/b/f;->B:F

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_3
    iput v0, p0, Lcom/tencent/liteav/beauty/b/f;->B:F

    .line 40
    .line 41
    :cond_4
    :goto_0
    int-to-float v0, p1

    .line 42
    iget v1, p0, Lcom/tencent/liteav/beauty/b/f;->B:F

    .line 43
    .line 44
    div-float/2addr v0, v1

    .line 45
    float-to-int v0, v0

    .line 46
    iput v0, p0, Lcom/tencent/liteav/beauty/b/f;->r:I

    .line 47
    .line 48
    int-to-float v2, p2

    .line 49
    div-float/2addr v2, v1

    .line 50
    float-to-int v1, v2

    .line 51
    iput v1, p0, Lcom/tencent/liteav/beauty/b/f;->s:I

    .line 52
    .line 53
    iget-object v2, p0, Lcom/tencent/liteav/beauty/b/f;->v:Lcom/tencent/liteav/basic/c/h;

    .line 54
    .line 55
    invoke-virtual {v2, v0, v1}, Lcom/tencent/liteav/basic/c/h;->a(II)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/f;->w:Lcom/tencent/liteav/beauty/b/f$c;

    .line 59
    .line 60
    iget v1, p0, Lcom/tencent/liteav/beauty/b/f;->r:I

    .line 61
    .line 62
    iget v2, p0, Lcom/tencent/liteav/beauty/b/f;->s:I

    .line 63
    .line 64
    invoke-virtual {v0, v1, v2}, Lcom/tencent/liteav/beauty/b/f$c;->a(II)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/f;->x:Lcom/tencent/liteav/beauty/b/f$a;

    .line 68
    .line 69
    iget v1, p0, Lcom/tencent/liteav/beauty/b/f;->r:I

    .line 70
    .line 71
    iget v2, p0, Lcom/tencent/liteav/beauty/b/f;->s:I

    .line 72
    .line 73
    invoke-virtual {v0, v1, v2}, Lcom/tencent/liteav/basic/c/h;->a(II)V

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/f;->y:Lcom/tencent/liteav/beauty/b/f$b;

    .line 77
    .line 78
    invoke-virtual {v0, p1, p2}, Lcom/tencent/liteav/beauty/b/t;->a(II)V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/f;->u:Lcom/tencent/liteav/beauty/b/d;

    .line 82
    .line 83
    iget v1, p0, Lcom/tencent/liteav/beauty/b/f;->r:I

    .line 84
    .line 85
    iget v2, p0, Lcom/tencent/liteav/beauty/b/f;->s:I

    .line 86
    .line 87
    invoke-virtual {v0, v1, v2}, Lcom/tencent/liteav/beauty/b/d;->a(II)V

    .line 88
    .line 89
    .line 90
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/f;->z:[I

    .line 91
    .line 92
    const/4 v1, 0x0

    .line 93
    if-eqz v0, :cond_5

    .line 94
    .line 95
    array-length v2, v0

    .line 96
    invoke-static {v2, v0, v1}, Landroid/opengl/GLES20;->glDeleteFramebuffers(I[II)V

    .line 97
    .line 98
    .line 99
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/f;->z:[I

    .line 100
    .line 101
    array-length v0, v0

    .line 102
    iget-object v2, p0, Lcom/tencent/liteav/beauty/b/f;->A:[I

    .line 103
    .line 104
    invoke-static {v0, v2, v1}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 105
    .line 106
    .line 107
    const/4 v0, 0x0

    .line 108
    iput-object v0, p0, Lcom/tencent/liteav/beauty/b/f;->z:[I

    .line 109
    .line 110
    iput-object v0, p0, Lcom/tencent/liteav/beauty/b/f;->A:[I

    .line 111
    .line 112
    :cond_5
    const/16 v0, 0x8

    .line 113
    .line 114
    new-array v0, v0, [I

    .line 115
    .line 116
    iput-object v0, p0, Lcom/tencent/liteav/beauty/b/f;->z:[I

    .line 117
    .line 118
    array-length v2, v0

    .line 119
    new-array v2, v2, [I

    .line 120
    .line 121
    iput-object v2, p0, Lcom/tencent/liteav/beauty/b/f;->A:[I

    .line 122
    .line 123
    array-length v2, v0

    .line 124
    invoke-static {v2, v0, v1}, Landroid/opengl/GLES20;->glGenFramebuffers(I[II)V

    .line 125
    .line 126
    .line 127
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/f;->z:[I

    .line 128
    .line 129
    array-length v0, v0

    .line 130
    iget-object v2, p0, Lcom/tencent/liteav/beauty/b/f;->A:[I

    .line 131
    .line 132
    invoke-static {v0, v2, v1}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 133
    .line 134
    .line 135
    move v0, v1

    .line 136
    :goto_1
    iget-object v2, p0, Lcom/tencent/liteav/beauty/b/f;->z:[I

    .line 137
    .line 138
    array-length v2, v2

    .line 139
    if-ge v0, v2, :cond_7

    .line 140
    .line 141
    iget-object v2, p0, Lcom/tencent/liteav/beauty/b/f;->A:[I

    .line 142
    .line 143
    aget v2, v2, v0

    .line 144
    .line 145
    const/16 v3, 0xde1

    .line 146
    .line 147
    invoke-static {v3, v2}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 148
    .line 149
    .line 150
    const/4 v2, 0x5

    .line 151
    if-lt v0, v2, :cond_6

    .line 152
    .line 153
    const/16 v11, 0x1401

    .line 154
    .line 155
    const/4 v12, 0x0

    .line 156
    const/16 v4, 0xde1

    .line 157
    .line 158
    const/4 v5, 0x0

    .line 159
    const/16 v6, 0x1908

    .line 160
    .line 161
    const/4 v9, 0x0

    .line 162
    const/16 v10, 0x1908

    .line 163
    .line 164
    move v7, p1

    .line 165
    move v8, p2

    .line 166
    invoke-static/range {v4 .. v12}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 167
    .line 168
    .line 169
    goto :goto_2

    .line 170
    :cond_6
    iget v7, p0, Lcom/tencent/liteav/beauty/b/f;->r:I

    .line 171
    .line 172
    iget v8, p0, Lcom/tencent/liteav/beauty/b/f;->s:I

    .line 173
    .line 174
    const/16 v11, 0x1401

    .line 175
    .line 176
    const/4 v12, 0x0

    .line 177
    const/16 v4, 0xde1

    .line 178
    .line 179
    const/4 v5, 0x0

    .line 180
    const/16 v6, 0x1908

    .line 181
    .line 182
    const/4 v9, 0x0

    .line 183
    const/16 v10, 0x1908

    .line 184
    .line 185
    invoke-static/range {v4 .. v12}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 186
    .line 187
    .line 188
    :goto_2
    const/16 v2, 0x2800

    .line 189
    .line 190
    const v4, 0x46180400    # 9729.0f

    .line 191
    .line 192
    .line 193
    invoke-static {v3, v2, v4}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 194
    .line 195
    .line 196
    const/16 v2, 0x2801

    .line 197
    .line 198
    invoke-static {v3, v2, v4}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 199
    .line 200
    .line 201
    const/16 v2, 0x2802

    .line 202
    .line 203
    const v4, 0x47012f00    # 33071.0f

    .line 204
    .line 205
    .line 206
    invoke-static {v3, v2, v4}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 207
    .line 208
    .line 209
    const/16 v2, 0x2803

    .line 210
    .line 211
    invoke-static {v3, v2, v4}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 212
    .line 213
    .line 214
    iget-object v2, p0, Lcom/tencent/liteav/beauty/b/f;->z:[I

    .line 215
    .line 216
    aget v2, v2, v0

    .line 217
    .line 218
    const v4, 0x8d40

    .line 219
    .line 220
    .line 221
    invoke-static {v4, v2}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 222
    .line 223
    .line 224
    iget-object v2, p0, Lcom/tencent/liteav/beauty/b/f;->A:[I

    .line 225
    .line 226
    aget v2, v2, v0

    .line 227
    .line 228
    const v5, 0x8ce0

    .line 229
    .line 230
    .line 231
    invoke-static {v4, v5, v3, v2, v1}, Landroid/opengl/GLES20;->glFramebufferTexture2D(IIIII)V

    .line 232
    .line 233
    .line 234
    invoke-static {v3, v1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 235
    .line 236
    .line 237
    invoke-static {v4, v1}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 238
    .line 239
    .line 240
    add-int/lit8 v0, v0, 0x1

    .line 241
    .line 242
    goto :goto_1

    .line 243
    :cond_7
    :goto_3
    return-void
.end method

.method public b(I)I
    .locals 10

    .line 1
    iget v0, p0, Lcom/tencent/liteav/beauty/b/f;->B:F

    .line 2
    .line 3
    const/high16 v1, 0x3f800000    # 1.0f

    .line 4
    .line 5
    cmpl-float v0, v0, v1

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget v0, p0, Lcom/tencent/liteav/beauty/b/f;->r:I

    .line 11
    .line 12
    iget v3, p0, Lcom/tencent/liteav/beauty/b/f;->s:I

    .line 13
    .line 14
    invoke-static {v2, v2, v0, v3}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/f;->v:Lcom/tencent/liteav/basic/c/h;

    .line 18
    .line 19
    invoke-virtual {v0, p1}, Lcom/tencent/liteav/basic/c/h;->b(I)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    move v0, p1

    .line 25
    :goto_0
    iget-object v3, p0, Lcom/tencent/liteav/beauty/b/f;->u:Lcom/tencent/liteav/beauty/b/d;

    .line 26
    .line 27
    iget-object v4, p0, Lcom/tencent/liteav/beauty/b/f;->z:[I

    .line 28
    .line 29
    const/4 v5, 0x4

    .line 30
    aget v4, v4, v5

    .line 31
    .line 32
    iget-object v6, p0, Lcom/tencent/liteav/beauty/b/f;->A:[I

    .line 33
    .line 34
    aget v5, v6, v5

    .line 35
    .line 36
    invoke-virtual {v3, v0, v4, v5}, Lcom/tencent/liteav/basic/c/h;->a(III)I

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    iget-object v4, p0, Lcom/tencent/liteav/beauty/b/f;->w:Lcom/tencent/liteav/beauty/b/f$c;

    .line 41
    .line 42
    iget-object v5, p0, Lcom/tencent/liteav/beauty/b/f;->z:[I

    .line 43
    .line 44
    aget v5, v5, v2

    .line 45
    .line 46
    iget-object v6, p0, Lcom/tencent/liteav/beauty/b/f;->A:[I

    .line 47
    .line 48
    aget v6, v6, v2

    .line 49
    .line 50
    invoke-virtual {v4, v0, v3, v5, v6}, Lcom/tencent/liteav/beauty/b/u;->a(IIII)I

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    iget-object v4, p0, Lcom/tencent/liteav/beauty/b/f;->x:Lcom/tencent/liteav/beauty/b/f$a;

    .line 55
    .line 56
    iget-object v5, p0, Lcom/tencent/liteav/beauty/b/f;->z:[I

    .line 57
    .line 58
    const/4 v6, 0x1

    .line 59
    aget v5, v5, v6

    .line 60
    .line 61
    iget-object v7, p0, Lcom/tencent/liteav/beauty/b/f;->A:[I

    .line 62
    .line 63
    aget v6, v7, v6

    .line 64
    .line 65
    invoke-virtual {v4, v0, v3, v5, v6}, Lcom/tencent/liteav/beauty/b/u;->a(IIII)I

    .line 66
    .line 67
    .line 68
    move-result v3

    .line 69
    iget-object v4, p0, Lcom/tencent/liteav/beauty/b/f;->u:Lcom/tencent/liteav/beauty/b/d;

    .line 70
    .line 71
    iget-object v5, p0, Lcom/tencent/liteav/beauty/b/f;->z:[I

    .line 72
    .line 73
    const/4 v6, 0x2

    .line 74
    aget v5, v5, v6

    .line 75
    .line 76
    iget-object v7, p0, Lcom/tencent/liteav/beauty/b/f;->A:[I

    .line 77
    .line 78
    aget v6, v7, v6

    .line 79
    .line 80
    invoke-virtual {v4, v0, v5, v6}, Lcom/tencent/liteav/basic/c/h;->a(III)I

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    iget-object v4, p0, Lcom/tencent/liteav/beauty/b/f;->u:Lcom/tencent/liteav/beauty/b/d;

    .line 85
    .line 86
    iget-object v5, p0, Lcom/tencent/liteav/beauty/b/f;->z:[I

    .line 87
    .line 88
    const/4 v6, 0x3

    .line 89
    aget v5, v5, v6

    .line 90
    .line 91
    iget-object v7, p0, Lcom/tencent/liteav/beauty/b/f;->A:[I

    .line 92
    .line 93
    aget v6, v7, v6

    .line 94
    .line 95
    invoke-virtual {v4, v3, v5, v6}, Lcom/tencent/liteav/basic/c/h;->a(III)I

    .line 96
    .line 97
    .line 98
    move-result v3

    .line 99
    iget v4, p0, Lcom/tencent/liteav/beauty/b/f;->B:F

    .line 100
    .line 101
    cmpl-float v1, v4, v1

    .line 102
    .line 103
    if-eqz v1, :cond_1

    .line 104
    .line 105
    iget v1, p0, Lcom/tencent/liteav/basic/c/h;->e:I

    .line 106
    .line 107
    iget v4, p0, Lcom/tencent/liteav/basic/c/h;->f:I

    .line 108
    .line 109
    invoke-static {v2, v2, v1, v4}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 110
    .line 111
    .line 112
    iget-object v1, p0, Lcom/tencent/liteav/beauty/b/f;->v:Lcom/tencent/liteav/basic/c/h;

    .line 113
    .line 114
    iget-object v2, p0, Lcom/tencent/liteav/beauty/b/f;->z:[I

    .line 115
    .line 116
    const/4 v4, 0x5

    .line 117
    aget v2, v2, v4

    .line 118
    .line 119
    iget-object v5, p0, Lcom/tencent/liteav/beauty/b/f;->A:[I

    .line 120
    .line 121
    aget v4, v5, v4

    .line 122
    .line 123
    invoke-virtual {v1, v0, v2, v4}, Lcom/tencent/liteav/basic/c/h;->a(III)I

    .line 124
    .line 125
    .line 126
    move-result v0

    .line 127
    iget-object v1, p0, Lcom/tencent/liteav/beauty/b/f;->v:Lcom/tencent/liteav/basic/c/h;

    .line 128
    .line 129
    iget-object v2, p0, Lcom/tencent/liteav/beauty/b/f;->z:[I

    .line 130
    .line 131
    const/4 v4, 0x6

    .line 132
    aget v2, v2, v4

    .line 133
    .line 134
    iget-object v5, p0, Lcom/tencent/liteav/beauty/b/f;->A:[I

    .line 135
    .line 136
    aget v4, v5, v4

    .line 137
    .line 138
    invoke-virtual {v1, v3, v2, v4}, Lcom/tencent/liteav/basic/c/h;->a(III)I

    .line 139
    .line 140
    .line 141
    move-result v3

    .line 142
    :cond_1
    move v5, v0

    .line 143
    move v6, v3

    .line 144
    iget-object v4, p0, Lcom/tencent/liteav/beauty/b/f;->y:Lcom/tencent/liteav/beauty/b/f$b;

    .line 145
    .line 146
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/f;->z:[I

    .line 147
    .line 148
    const/4 v1, 0x7

    .line 149
    aget v8, v0, v1

    .line 150
    .line 151
    iget-object p0, p0, Lcom/tencent/liteav/beauty/b/f;->A:[I

    .line 152
    .line 153
    aget v9, p0, v1

    .line 154
    .line 155
    move v7, p1

    .line 156
    invoke-virtual/range {v4 .. v9}, Lcom/tencent/liteav/beauty/b/t;->a(IIIII)I

    .line 157
    .line 158
    .line 159
    move-result p0

    .line 160
    return p0
.end method

.method public b()Z
    .locals 3

    .line 161
    invoke-super {p0}, Lcom/tencent/liteav/basic/c/h;->b()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 162
    new-instance v1, Lcom/tencent/liteav/beauty/b/d;

    invoke-direct {v1}, Lcom/tencent/liteav/beauty/b/d;-><init>()V

    iput-object v1, p0, Lcom/tencent/liteav/beauty/b/f;->u:Lcom/tencent/liteav/beauty/b/d;

    if-eqz v0, :cond_0

    .line 163
    invoke-virtual {v1}, Lcom/tencent/liteav/basic/c/h;->a()Z

    move-result v0

    .line 164
    :cond_0
    new-instance v1, Lcom/tencent/liteav/beauty/b/f$c;

    invoke-direct {v1}, Lcom/tencent/liteav/beauty/b/f$c;-><init>()V

    iput-object v1, p0, Lcom/tencent/liteav/beauty/b/f;->w:Lcom/tencent/liteav/beauty/b/f$c;

    if-eqz v0, :cond_1

    .line 165
    invoke-virtual {v1}, Lcom/tencent/liteav/beauty/b/f$c;->a()Z

    move-result v0

    .line 166
    :cond_1
    new-instance v1, Lcom/tencent/liteav/beauty/b/f$a;

    const-string v2, "precision highp float;  \nuniform sampler2D inputImageTexture;  \nuniform sampler2D inputImageTexture2;  \nvarying vec2 textureCoordinate;  \nvarying vec2 textureCoordinate2;  \nvoid main()  \n{  \n\tgl_FragColor = texture2D(inputImageTexture2, textureCoordinate2) - texture2D(inputImageTexture, textureCoordinate) * texture2D(inputImageTexture2, textureCoordinate2);  \n}  \n"

    invoke-direct {v1, v2}, Lcom/tencent/liteav/beauty/b/f$a;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lcom/tencent/liteav/beauty/b/f;->x:Lcom/tencent/liteav/beauty/b/f$a;

    if-eqz v0, :cond_2

    .line 167
    invoke-virtual {v1}, Lcom/tencent/liteav/basic/c/h;->a()Z

    move-result v0

    .line 168
    :cond_2
    new-instance v1, Lcom/tencent/liteav/beauty/b/f$b;

    const-string v2, "precision highp float;   \nuniform sampler2D inputImageTexture;   \nuniform sampler2D inputImageTexture2;  \nuniform sampler2D inputImageTexture3;   \nvarying vec2 textureCoordinate;   \nvarying vec2 textureCoordinate2;  \nvarying vec2 textureCoordinate3;    \nvoid main()   \n{   \n\tgl_FragColor = texture2D(inputImageTexture, textureCoordinate) * texture2D(inputImageTexture3, textureCoordinate3) + texture2D(inputImageTexture2, textureCoordinate2);   \n}   \n"

    invoke-direct {v1, v2}, Lcom/tencent/liteav/beauty/b/f$b;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lcom/tencent/liteav/beauty/b/f;->y:Lcom/tencent/liteav/beauty/b/f$b;

    if-eqz v0, :cond_3

    .line 169
    invoke-virtual {v1}, Lcom/tencent/liteav/basic/c/h;->a()Z

    move-result v0

    .line 170
    :cond_3
    new-instance v1, Lcom/tencent/liteav/basic/c/h;

    invoke-direct {v1}, Lcom/tencent/liteav/basic/c/h;-><init>()V

    iput-object v1, p0, Lcom/tencent/liteav/beauty/b/f;->v:Lcom/tencent/liteav/basic/c/h;

    const/4 v2, 0x1

    .line 171
    invoke-virtual {v1, v2}, Lcom/tencent/liteav/basic/c/h;->a(Z)V

    if-eqz v0, :cond_4

    .line 172
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/f;->v:Lcom/tencent/liteav/basic/c/h;

    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/h;->a()Z

    move-result v0

    :cond_4
    if-eqz v0, :cond_5

    return v2

    .line 173
    :cond_5
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/c/h;->d()V

    const/4 p0, 0x0

    return p0
.end method

.method public e()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/tencent/liteav/basic/c/h;->g:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-super {p0}, Lcom/tencent/liteav/basic/c/h;->e()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/f;->u:Lcom/tencent/liteav/beauty/b/d;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/h;->d()V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/f;->w:Lcom/tencent/liteav/beauty/b/f$c;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/h;->d()V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/f;->x:Lcom/tencent/liteav/beauty/b/f$a;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/h;->d()V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/f;->y:Lcom/tencent/liteav/beauty/b/f$b;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/h;->d()V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/f;->v:Lcom/tencent/liteav/basic/c/h;

    .line 29
    .line 30
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/h;->d()V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/f;->z:[I

    .line 34
    .line 35
    const/4 v1, 0x0

    .line 36
    if-eqz v0, :cond_0

    .line 37
    .line 38
    array-length v2, v0

    .line 39
    const/4 v3, 0x0

    .line 40
    invoke-static {v2, v0, v3}, Landroid/opengl/GLES20;->glDeleteFramebuffers(I[II)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/f;->z:[I

    .line 44
    .line 45
    array-length v0, v0

    .line 46
    iget-object v2, p0, Lcom/tencent/liteav/beauty/b/f;->A:[I

    .line 47
    .line 48
    invoke-static {v0, v2, v3}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 49
    .line 50
    .line 51
    iput-object v1, p0, Lcom/tencent/liteav/beauty/b/f;->z:[I

    .line 52
    .line 53
    :cond_0
    iput-object v1, p0, Lcom/tencent/liteav/beauty/b/f;->A:[I

    .line 54
    .line 55
    :cond_1
    return-void
.end method
