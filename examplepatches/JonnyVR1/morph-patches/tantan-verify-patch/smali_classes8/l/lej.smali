.class public Ll/lej;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Z

.field protected b:[I

.field protected c:[I

.field protected d:[I

.field protected e:[I

.field protected f:[I

.field private g:Ljava/lang/Object;

.field public h:I

.field private i:I

.field private j:I

.field private k:Z

.field private l:Z

.field private m:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/lang/Object;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/lej;->g:Ljava/lang/Object;

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    iput-boolean p1, p0, Ll/lej;->k:Z

    .line 13
    .line 14
    iput-boolean p1, p0, Ll/lej;->l:Z

    .line 15
    .line 16
    iput-boolean p1, p0, Ll/lej;->m:Z

    .line 17
    .line 18
    const/4 p2, 0x1

    .line 19
    new-array v0, p2, [I

    .line 20
    .line 21
    iput-object v0, p0, Ll/lej;->b:[I

    .line 22
    .line 23
    new-array v0, p2, [I

    .line 24
    .line 25
    iput-object v0, p0, Ll/lej;->c:[I

    .line 26
    .line 27
    new-array v0, p2, [I

    .line 28
    .line 29
    iput-object v0, p0, Ll/lej;->d:[I

    .line 30
    .line 31
    new-array v0, p2, [I

    .line 32
    .line 33
    iput-object v0, p0, Ll/lej;->e:[I

    .line 34
    .line 35
    new-array p2, p2, [I

    .line 36
    .line 37
    iput-object p2, p0, Ll/lej;->f:[I

    .line 38
    .line 39
    iput p1, p0, Ll/lej;->h:I

    .line 40
    .line 41
    return-void
.end method


# virtual methods
.method public a(II)V
    .locals 13

    .line 1
    move v4, p2

    .line 2
    iget-boolean v0, p0, Ll/lej;->k:Z

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    iget-object v0, p0, Ll/lej;->b:[I

    .line 8
    .line 9
    const/4 v9, 0x1

    .line 10
    const/4 v10, 0x0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    new-array v0, v9, [I

    .line 14
    .line 15
    iput-object v0, p0, Ll/lej;->b:[I

    .line 16
    .line 17
    new-array v0, v9, [I

    .line 18
    .line 19
    iput-object v0, p0, Ll/lej;->d:[I

    .line 20
    .line 21
    new-array v0, v9, [I

    .line 22
    .line 23
    iput-object v0, p0, Ll/lej;->e:[I

    .line 24
    .line 25
    iput v10, p0, Ll/lej;->h:I

    .line 26
    .line 27
    :cond_1
    iput p1, p0, Ll/lej;->i:I

    .line 28
    .line 29
    iput v4, p0, Ll/lej;->j:I

    .line 30
    .line 31
    iget-object v0, p0, Ll/lej;->b:[I

    .line 32
    .line 33
    invoke-static {v9, v0, v10}, Landroid/opengl/GLES20;->glGenFramebuffers(I[II)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/lej;->e:[I

    .line 37
    .line 38
    invoke-static {v9, v0, v10}, Landroid/opengl/GLES20;->glGenRenderbuffers(I[II)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Ll/lej;->d:[I

    .line 42
    .line 43
    invoke-static {v9, v0, v10}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Ll/lej;->b:[I

    .line 47
    .line 48
    aget v0, v0, v10

    .line 49
    .line 50
    const v11, 0x8d40

    .line 51
    .line 52
    .line 53
    invoke-static {v11, v0}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 54
    .line 55
    .line 56
    const v0, 0x84c0

    .line 57
    .line 58
    .line 59
    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Ll/lej;->d:[I

    .line 63
    .line 64
    aget v0, v0, v10

    .line 65
    .line 66
    const/16 v12, 0xde1

    .line 67
    .line 68
    invoke-static {v12, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 69
    .line 70
    .line 71
    iget-boolean v0, p0, Ll/lej;->m:Z

    .line 72
    .line 73
    if-eqz v0, :cond_2

    .line 74
    .line 75
    const/16 v6, 0x1908

    .line 76
    .line 77
    const/4 v8, 0x0

    .line 78
    const/16 v0, 0xde1

    .line 79
    .line 80
    const/4 v1, 0x0

    .line 81
    const v2, 0x881a

    .line 82
    .line 83
    .line 84
    const/4 v5, 0x0

    .line 85
    const v7, 0x8d61

    .line 86
    .line 87
    .line 88
    move v3, p1

    .line 89
    invoke-static/range {v0 .. v8}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 90
    .line 91
    .line 92
    const-string v0, "FilterProcess"

    .line 93
    .line 94
    const-string v1, "use half float "

    .line 95
    .line 96
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    move v4, p2

    .line 100
    goto :goto_0

    .line 101
    :cond_2
    const/16 v7, 0x1401

    .line 102
    .line 103
    const/4 v8, 0x0

    .line 104
    const/16 v0, 0xde1

    .line 105
    .line 106
    const/4 v1, 0x0

    .line 107
    const/16 v2, 0x1908

    .line 108
    .line 109
    const/4 v5, 0x0

    .line 110
    const/16 v6, 0x1908

    .line 111
    .line 112
    move v3, p1

    .line 113
    move v4, p2

    .line 114
    invoke-static/range {v0 .. v8}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 115
    .line 116
    .line 117
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 118
    .line 119
    const-string v1, "frameBufferNumber"

    .line 120
    .line 121
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    iget-object v1, p0, Ll/lej;->d:[I

    .line 125
    .line 126
    aget v1, v1, v10

    .line 127
    .line 128
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    const-string v1, "GLFrameBuffer"

    .line 136
    .line 137
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 138
    .line 139
    .line 140
    const/16 v0, 0x2802

    .line 141
    .line 142
    const v1, 0x812f

    .line 143
    .line 144
    .line 145
    invoke-static {v12, v0, v1}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 146
    .line 147
    .line 148
    const/16 v0, 0x2803

    .line 149
    .line 150
    invoke-static {v12, v0, v1}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 151
    .line 152
    .line 153
    const/16 v0, 0x2800

    .line 154
    .line 155
    const/16 v1, 0x2601

    .line 156
    .line 157
    invoke-static {v12, v0, v1}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 158
    .line 159
    .line 160
    const/16 v0, 0x2801

    .line 161
    .line 162
    invoke-static {v12, v0, v1}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 163
    .line 164
    .line 165
    iget-object v0, p0, Ll/lej;->d:[I

    .line 166
    .line 167
    aget v0, v0, v10

    .line 168
    .line 169
    const v1, 0x8ce0

    .line 170
    .line 171
    .line 172
    invoke-static {v11, v1, v12, v0, v10}, Landroid/opengl/GLES20;->glFramebufferTexture2D(IIIII)V

    .line 173
    .line 174
    .line 175
    iget-object v0, p0, Ll/lej;->e:[I

    .line 176
    .line 177
    aget v0, v0, v10

    .line 178
    .line 179
    const v1, 0x8d41

    .line 180
    .line 181
    .line 182
    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindRenderbuffer(II)V

    .line 183
    .line 184
    .line 185
    const v0, 0x81a5

    .line 186
    .line 187
    .line 188
    invoke-static {v1, v0, p1, p2}, Landroid/opengl/GLES20;->glRenderbufferStorage(IIII)V

    .line 189
    .line 190
    .line 191
    iget-object v0, p0, Ll/lej;->e:[I

    .line 192
    .line 193
    aget v0, v0, v10

    .line 194
    .line 195
    const v2, 0x8d00

    .line 196
    .line 197
    .line 198
    invoke-static {v11, v2, v1, v0}, Landroid/opengl/GLES20;->glFramebufferRenderbuffer(IIII)V

    .line 199
    .line 200
    .line 201
    iput-boolean v9, p0, Ll/lej;->k:Z

    .line 202
    .line 203
    return-void
.end method

.method public b(II)V
    .locals 13

    .line 1
    move v4, p2

    .line 2
    iget-boolean v0, p0, Ll/lej;->k:Z

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    iget-object v0, p0, Ll/lej;->b:[I

    .line 8
    .line 9
    const/4 v9, 0x1

    .line 10
    const/4 v10, 0x0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    new-array v0, v9, [I

    .line 14
    .line 15
    iput-object v0, p0, Ll/lej;->b:[I

    .line 16
    .line 17
    new-array v0, v9, [I

    .line 18
    .line 19
    iput-object v0, p0, Ll/lej;->d:[I

    .line 20
    .line 21
    new-array v0, v9, [I

    .line 22
    .line 23
    iput-object v0, p0, Ll/lej;->e:[I

    .line 24
    .line 25
    iput v10, p0, Ll/lej;->h:I

    .line 26
    .line 27
    :cond_1
    iput p1, p0, Ll/lej;->i:I

    .line 28
    .line 29
    iput v4, p0, Ll/lej;->j:I

    .line 30
    .line 31
    iget-object v0, p0, Ll/lej;->b:[I

    .line 32
    .line 33
    invoke-static {v9, v0, v10}, Landroid/opengl/GLES20;->glGenFramebuffers(I[II)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/lej;->e:[I

    .line 37
    .line 38
    invoke-static {v9, v0, v10}, Landroid/opengl/GLES20;->glGenRenderbuffers(I[II)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Ll/lej;->d:[I

    .line 42
    .line 43
    invoke-static {v9, v0, v10}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Ll/lej;->b:[I

    .line 47
    .line 48
    aget v0, v0, v10

    .line 49
    .line 50
    const v11, 0x8d40

    .line 51
    .line 52
    .line 53
    invoke-static {v11, v0}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 54
    .line 55
    .line 56
    const v0, 0x84c0

    .line 57
    .line 58
    .line 59
    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Ll/lej;->d:[I

    .line 63
    .line 64
    aget v0, v0, v10

    .line 65
    .line 66
    const/16 v12, 0xde1

    .line 67
    .line 68
    invoke-static {v12, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 69
    .line 70
    .line 71
    iget-boolean v0, p0, Ll/lej;->m:Z

    .line 72
    .line 73
    if-eqz v0, :cond_2

    .line 74
    .line 75
    const/16 v6, 0x1908

    .line 76
    .line 77
    const/4 v8, 0x0

    .line 78
    const/16 v0, 0xde1

    .line 79
    .line 80
    const/4 v1, 0x0

    .line 81
    const v2, 0x881a

    .line 82
    .line 83
    .line 84
    const/4 v5, 0x0

    .line 85
    const v7, 0x8d61

    .line 86
    .line 87
    .line 88
    move v3, p1

    .line 89
    invoke-static/range {v0 .. v8}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 90
    .line 91
    .line 92
    const-string v0, "FilterProcess"

    .line 93
    .line 94
    const-string v1, "use half float "

    .line 95
    .line 96
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    move v4, p2

    .line 100
    goto :goto_0

    .line 101
    :cond_2
    const/16 v7, 0x1401

    .line 102
    .line 103
    const/4 v8, 0x0

    .line 104
    const/16 v0, 0xde1

    .line 105
    .line 106
    const/4 v1, 0x0

    .line 107
    const/16 v2, 0x1908

    .line 108
    .line 109
    const/4 v5, 0x0

    .line 110
    const/16 v6, 0x1908

    .line 111
    .line 112
    move v3, p1

    .line 113
    move v4, p2

    .line 114
    invoke-static/range {v0 .. v8}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 115
    .line 116
    .line 117
    :goto_0
    const/16 v0, 0x2802

    .line 118
    .line 119
    const v1, 0x812f

    .line 120
    .line 121
    .line 122
    invoke-static {v12, v0, v1}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 123
    .line 124
    .line 125
    const/16 v0, 0x2803

    .line 126
    .line 127
    invoke-static {v12, v0, v1}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 128
    .line 129
    .line 130
    const/16 v0, 0x2800

    .line 131
    .line 132
    const/16 v1, 0x2601

    .line 133
    .line 134
    invoke-static {v12, v0, v1}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 135
    .line 136
    .line 137
    const/16 v0, 0x2801

    .line 138
    .line 139
    invoke-static {v12, v0, v1}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 140
    .line 141
    .line 142
    iget-object v0, p0, Ll/lej;->d:[I

    .line 143
    .line 144
    aget v0, v0, v10

    .line 145
    .line 146
    const v1, 0x8ce0

    .line 147
    .line 148
    .line 149
    invoke-static {v11, v1, v12, v0, v10}, Landroid/opengl/GLES20;->glFramebufferTexture2D(IIIII)V

    .line 150
    .line 151
    .line 152
    iget-object v0, p0, Ll/lej;->e:[I

    .line 153
    .line 154
    aget v0, v0, v10

    .line 155
    .line 156
    const v1, 0x8d41

    .line 157
    .line 158
    .line 159
    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindRenderbuffer(II)V

    .line 160
    .line 161
    .line 162
    const v0, 0x81a5

    .line 163
    .line 164
    .line 165
    invoke-static {v1, v0, p1, p2}, Landroid/opengl/GLES20;->glRenderbufferStorage(IIII)V

    .line 166
    .line 167
    .line 168
    iget-object v0, p0, Ll/lej;->e:[I

    .line 169
    .line 170
    aget v0, v0, v10

    .line 171
    .line 172
    const v2, 0x8d00

    .line 173
    .line 174
    .line 175
    invoke-static {v11, v2, v1, v0}, Landroid/opengl/GLES20;->glFramebufferRenderbuffer(IIII)V

    .line 176
    .line 177
    .line 178
    iput-boolean v9, p0, Ll/lej;->k:Z

    .line 179
    .line 180
    return-void
.end method

.method public c(II)V
    .locals 14

    .line 1
    iget-boolean v0, p0, Ll/lej;->l:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/lej;->e()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-boolean v0, p0, Ll/lej;->k:Z

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    return-void

    .line 13
    :cond_1
    iget-object v0, p0, Ll/lej;->b:[I

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    const/4 v2, 0x0

    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    new-array v0, v1, [I

    .line 20
    .line 21
    iput-object v0, p0, Ll/lej;->b:[I

    .line 22
    .line 23
    new-array v0, v1, [I

    .line 24
    .line 25
    iput-object v0, p0, Ll/lej;->d:[I

    .line 26
    .line 27
    iput v2, p0, Ll/lej;->h:I

    .line 28
    .line 29
    :cond_2
    iput p1, p0, Ll/lej;->i:I

    .line 30
    .line 31
    move/from16 v7, p2

    .line 32
    .line 33
    iput v7, p0, Ll/lej;->j:I

    .line 34
    .line 35
    iget-object v0, p0, Ll/lej;->b:[I

    .line 36
    .line 37
    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glGenFramebuffers(I[II)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Ll/lej;->d:[I

    .line 41
    .line 42
    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Ll/lej;->b:[I

    .line 46
    .line 47
    aget v0, v0, v2

    .line 48
    .line 49
    const v12, 0x8d40

    .line 50
    .line 51
    .line 52
    invoke-static {v12, v0}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 53
    .line 54
    .line 55
    const v0, 0x84c0

    .line 56
    .line 57
    .line 58
    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Ll/lej;->d:[I

    .line 62
    .line 63
    aget v0, v0, v2

    .line 64
    .line 65
    const/16 v13, 0xde1

    .line 66
    .line 67
    invoke-static {v13, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 68
    .line 69
    .line 70
    iget-boolean v0, p0, Ll/lej;->m:Z

    .line 71
    .line 72
    if-eqz v0, :cond_3

    .line 73
    .line 74
    const/16 v9, 0x1908

    .line 75
    .line 76
    const/4 v11, 0x0

    .line 77
    const/16 v3, 0xde1

    .line 78
    .line 79
    const/4 v4, 0x0

    .line 80
    const v5, 0x881a

    .line 81
    .line 82
    .line 83
    const/4 v8, 0x0

    .line 84
    const v10, 0x8d61

    .line 85
    .line 86
    .line 87
    move v6, p1

    .line 88
    invoke-static/range {v3 .. v11}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 89
    .line 90
    .line 91
    const-string p1, "FilterProcess"

    .line 92
    .line 93
    const-string v0, "use half float "

    .line 94
    .line 95
    invoke-static {p1, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_3
    const/16 v10, 0x1401

    .line 100
    .line 101
    const/4 v11, 0x0

    .line 102
    const/16 v3, 0xde1

    .line 103
    .line 104
    const/4 v4, 0x0

    .line 105
    const/16 v5, 0x1908

    .line 106
    .line 107
    const/4 v8, 0x0

    .line 108
    const/16 v9, 0x1908

    .line 109
    .line 110
    move v6, p1

    .line 111
    move/from16 v7, p2

    .line 112
    .line 113
    invoke-static/range {v3 .. v11}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 114
    .line 115
    .line 116
    :goto_0
    const/16 p1, 0x2802

    .line 117
    .line 118
    const/16 v0, 0x2901

    .line 119
    .line 120
    invoke-static {v13, p1, v0}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 121
    .line 122
    .line 123
    const/16 p1, 0x2803

    .line 124
    .line 125
    invoke-static {v13, p1, v0}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 126
    .line 127
    .line 128
    const/16 p1, 0x2800

    .line 129
    .line 130
    const/16 v0, 0x2601

    .line 131
    .line 132
    invoke-static {v13, p1, v0}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 133
    .line 134
    .line 135
    const/16 p1, 0x2801

    .line 136
    .line 137
    invoke-static {v13, p1, v0}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 138
    .line 139
    .line 140
    iget-object p1, p0, Ll/lej;->d:[I

    .line 141
    .line 142
    aget p1, p1, v2

    .line 143
    .line 144
    const v0, 0x8ce0

    .line 145
    .line 146
    .line 147
    invoke-static {v12, v0, v13, p1, v2}, Landroid/opengl/GLES20;->glFramebufferTexture2D(IIIII)V

    .line 148
    .line 149
    .line 150
    iput-boolean v1, p0, Ll/lej;->k:Z

    .line 151
    .line 152
    return-void
.end method

.method public d(II)V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v4, p1

    .line 4
    .line 5
    move/from16 v5, p2

    .line 6
    .line 7
    iget-boolean v1, v0, Ll/lej;->k:Z

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iput v4, v0, Ll/lej;->i:I

    .line 13
    .line 14
    iput v5, v0, Ll/lej;->j:I

    .line 15
    .line 16
    iget-object v1, v0, Ll/lej;->e:[I

    .line 17
    .line 18
    const/4 v10, 0x1

    .line 19
    const/4 v11, 0x0

    .line 20
    invoke-static {v10, v1, v11}, Landroid/opengl/GLES20;->glGenRenderbuffers(I[II)V

    .line 21
    .line 22
    .line 23
    iget-object v1, v0, Ll/lej;->e:[I

    .line 24
    .line 25
    aget v1, v1, v11

    .line 26
    .line 27
    const v12, 0x8d41

    .line 28
    .line 29
    .line 30
    invoke-static {v12, v1}, Landroid/opengl/GLES20;->glBindRenderbuffer(II)V

    .line 31
    .line 32
    .line 33
    const/4 v1, 0x4

    .line 34
    const v2, 0x8058

    .line 35
    .line 36
    .line 37
    invoke-static {v12, v1, v2, v4, v5}, Landroid/opengl/GLES30;->glRenderbufferStorageMultisample(IIIII)V

    .line 38
    .line 39
    .line 40
    invoke-static {v12, v11}, Landroid/opengl/GLES20;->glBindRenderbuffer(II)V

    .line 41
    .line 42
    .line 43
    iget-object v1, v0, Ll/lej;->b:[I

    .line 44
    .line 45
    invoke-static {v10, v1, v11}, Landroid/opengl/GLES20;->glGenFramebuffers(I[II)V

    .line 46
    .line 47
    .line 48
    iget-object v1, v0, Ll/lej;->b:[I

    .line 49
    .line 50
    aget v1, v1, v11

    .line 51
    .line 52
    const v13, 0x8d40

    .line 53
    .line 54
    .line 55
    invoke-static {v13, v1}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 56
    .line 57
    .line 58
    iget-object v1, v0, Ll/lej;->e:[I

    .line 59
    .line 60
    aget v1, v1, v11

    .line 61
    .line 62
    const v14, 0x8ce0

    .line 63
    .line 64
    .line 65
    invoke-static {v13, v14, v12, v1}, Landroid/opengl/GLES20;->glFramebufferRenderbuffer(IIII)V

    .line 66
    .line 67
    .line 68
    iget-object v1, v0, Ll/lej;->d:[I

    .line 69
    .line 70
    invoke-static {v10, v1, v11}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 71
    .line 72
    .line 73
    const v1, 0x84c0

    .line 74
    .line 75
    .line 76
    invoke-static {v1}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 77
    .line 78
    .line 79
    iget-object v1, v0, Ll/lej;->d:[I

    .line 80
    .line 81
    aget v1, v1, v11

    .line 82
    .line 83
    const/16 v15, 0xde1

    .line 84
    .line 85
    invoke-static {v15, v1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 86
    .line 87
    .line 88
    iget-boolean v1, v0, Ll/lej;->m:Z

    .line 89
    .line 90
    if-eqz v1, :cond_1

    .line 91
    .line 92
    const/16 v7, 0x1908

    .line 93
    .line 94
    const/4 v9, 0x0

    .line 95
    const/16 v1, 0xde1

    .line 96
    .line 97
    const/4 v2, 0x0

    .line 98
    const v3, 0x881a

    .line 99
    .line 100
    .line 101
    const/4 v6, 0x0

    .line 102
    const v8, 0x8d61

    .line 103
    .line 104
    .line 105
    invoke-static/range {v1 .. v9}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 106
    .line 107
    .line 108
    const-string v1, "FilterProcess"

    .line 109
    .line 110
    const-string v2, "use half float "

    .line 111
    .line 112
    invoke-static {v1, v2}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    move/from16 v4, p1

    .line 116
    .line 117
    move/from16 v5, p2

    .line 118
    .line 119
    goto :goto_0

    .line 120
    :cond_1
    const/16 v8, 0x1401

    .line 121
    .line 122
    const/4 v9, 0x0

    .line 123
    const/16 v1, 0xde1

    .line 124
    .line 125
    const/4 v2, 0x0

    .line 126
    const/16 v3, 0x1908

    .line 127
    .line 128
    const/4 v6, 0x0

    .line 129
    const/16 v7, 0x1908

    .line 130
    .line 131
    move/from16 v4, p1

    .line 132
    .line 133
    move/from16 v5, p2

    .line 134
    .line 135
    invoke-static/range {v1 .. v9}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 136
    .line 137
    .line 138
    :goto_0
    const/16 v1, 0x2802

    .line 139
    .line 140
    const v2, 0x812f

    .line 141
    .line 142
    .line 143
    invoke-static {v15, v1, v2}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 144
    .line 145
    .line 146
    const/16 v1, 0x2803

    .line 147
    .line 148
    invoke-static {v15, v1, v2}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 149
    .line 150
    .line 151
    const/16 v1, 0x2800

    .line 152
    .line 153
    const/16 v2, 0x2601

    .line 154
    .line 155
    invoke-static {v15, v1, v2}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 156
    .line 157
    .line 158
    const/16 v1, 0x2801

    .line 159
    .line 160
    invoke-static {v15, v1, v2}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 161
    .line 162
    .line 163
    iget-object v1, v0, Ll/lej;->f:[I

    .line 164
    .line 165
    invoke-static {v10, v1, v11}, Landroid/opengl/GLES20;->glGenRenderbuffers(I[II)V

    .line 166
    .line 167
    .line 168
    iget-object v1, v0, Ll/lej;->f:[I

    .line 169
    .line 170
    aget v1, v1, v11

    .line 171
    .line 172
    invoke-static {v12, v1}, Landroid/opengl/GLES20;->glBindRenderbuffer(II)V

    .line 173
    .line 174
    .line 175
    const v1, 0x81a5

    .line 176
    .line 177
    .line 178
    invoke-static {v12, v1, v4, v5}, Landroid/opengl/GLES20;->glRenderbufferStorage(IIII)V

    .line 179
    .line 180
    .line 181
    iget-object v1, v0, Ll/lej;->c:[I

    .line 182
    .line 183
    invoke-static {v10, v1, v11}, Landroid/opengl/GLES20;->glGenFramebuffers(I[II)V

    .line 184
    .line 185
    .line 186
    iget-object v1, v0, Ll/lej;->c:[I

    .line 187
    .line 188
    aget v1, v1, v11

    .line 189
    .line 190
    invoke-static {v13, v1}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 191
    .line 192
    .line 193
    iget-object v1, v0, Ll/lej;->d:[I

    .line 194
    .line 195
    aget v1, v1, v11

    .line 196
    .line 197
    invoke-static {v13, v14, v15, v1, v11}, Landroid/opengl/GLES20;->glFramebufferTexture2D(IIIII)V

    .line 198
    .line 199
    .line 200
    iget-object v1, v0, Ll/lej;->f:[I

    .line 201
    .line 202
    aget v1, v1, v11

    .line 203
    .line 204
    const v2, 0x8d00

    .line 205
    .line 206
    .line 207
    invoke-static {v13, v2, v12, v1}, Landroid/opengl/GLES20;->glFramebufferRenderbuffer(IIII)V

    .line 208
    .line 209
    .line 210
    iput-boolean v10, v0, Ll/lej;->k:Z

    .line 211
    .line 212
    return-void
.end method

.method public e()V
    .locals 4

    .line 1
    invoke-static {}, Ll/sej;->d()Ll/sej;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Ll/sej;->b(Ll/lej;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/lej;->l()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object v0, p0, Ll/lej;->b:[I

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    const/4 v2, 0x1

    .line 19
    const/4 v3, 0x0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    invoke-static {v2, v0, v3}, Landroid/opengl/GLES20;->glDeleteFramebuffers(I[II)V

    .line 23
    .line 24
    .line 25
    iput-object v1, p0, Ll/lej;->b:[I

    .line 26
    .line 27
    :cond_1
    iget-object v0, p0, Ll/lej;->c:[I

    .line 28
    .line 29
    if-eqz v0, :cond_2

    .line 30
    .line 31
    invoke-static {v2, v0, v3}, Landroid/opengl/GLES20;->glDeleteFramebuffers(I[II)V

    .line 32
    .line 33
    .line 34
    iput-object v1, p0, Ll/lej;->c:[I

    .line 35
    .line 36
    :cond_2
    iget-object v0, p0, Ll/lej;->d:[I

    .line 37
    .line 38
    if-eqz v0, :cond_3

    .line 39
    .line 40
    invoke-static {v2, v0, v3}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 41
    .line 42
    .line 43
    iput-object v1, p0, Ll/lej;->d:[I

    .line 44
    .line 45
    :cond_3
    iget-object v0, p0, Ll/lej;->e:[I

    .line 46
    .line 47
    if-eqz v0, :cond_4

    .line 48
    .line 49
    invoke-static {v2, v0, v3}, Landroid/opengl/GLES20;->glDeleteRenderbuffers(I[II)V

    .line 50
    .line 51
    .line 52
    iput-object v1, p0, Ll/lej;->e:[I

    .line 53
    .line 54
    :cond_4
    iget-object v0, p0, Ll/lej;->f:[I

    .line 55
    .line 56
    if-eqz v0, :cond_5

    .line 57
    .line 58
    invoke-static {v2, v0, v3}, Landroid/opengl/GLES20;->glDeleteRenderbuffers(I[II)V

    .line 59
    .line 60
    .line 61
    iput-object v1, p0, Ll/lej;->f:[I

    .line 62
    .line 63
    :cond_5
    invoke-virtual {p0}, Ll/lej;->l()V

    .line 64
    .line 65
    .line 66
    iput-boolean v3, p0, Ll/lej;->k:Z

    .line 67
    .line 68
    return-void
.end method

.method public f()I
    .locals 0

    .line 1
    iget p0, p0, Ll/lej;->j:I

    .line 2
    .line 3
    return p0
.end method

.method public g()I
    .locals 0

    .line 1
    iget p0, p0, Ll/lej;->i:I

    .line 2
    .line 3
    return p0
.end method

.method public h()[I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lej;->b:[I

    .line 2
    .line 3
    return-object p0
.end method

.method public i()[I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lej;->d:[I

    .line 2
    .line 3
    return-object p0
.end method

.method public j()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/lej;->g:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    const/4 v1, 0x1

    .line 5
    :try_start_0
    iput-boolean v1, p0, Ll/lej;->a:Z

    .line 6
    .line 7
    iget v2, p0, Ll/lej;->h:I

    .line 8
    .line 9
    add-int/2addr v2, v1

    .line 10
    iput v2, p0, Ll/lej;->h:I

    .line 11
    .line 12
    monitor-exit v0

    .line 13
    return-void

    .line 14
    :catchall_0
    move-exception p0

    .line 15
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 16
    throw p0
.end method

.method public k(Z)V
    .locals 2

    .line 1
    const/16 v0, 0x1f03

    .line 2
    .line 3
    invoke-static {v0}, Landroid/opengl/GLES20;->glGetString(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const-string v1, "GL_OES_texture_half_float"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iput-boolean p1, p0, Ll/lej;->m:Z

    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public l()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/lej;->g:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget v1, p0, Ll/lej;->h:I

    .line 5
    .line 6
    const/4 v2, 0x1

    .line 7
    sub-int/2addr v1, v2

    .line 8
    iput v1, p0, Ll/lej;->h:I

    .line 9
    .line 10
    if-ge v1, v2, :cond_0

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    iput-boolean v1, p0, Ll/lej;->a:Z

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception p0

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    :goto_0
    monitor-exit v0

    .line 19
    return-void

    .line 20
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21
    throw p0
.end method

.method public m(II)V
    .locals 11

    .line 1
    iget-object v0, p0, Ll/lej;->c:[I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    aget v0, v0, v1

    .line 5
    .line 6
    const v2, 0x8ca9

    .line 7
    .line 8
    .line 9
    invoke-static {v2, v0}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/lej;->b:[I

    .line 13
    .line 14
    aget p0, p0, v1

    .line 15
    .line 16
    const v0, 0x8ca8

    .line 17
    .line 18
    .line 19
    invoke-static {v0, p0}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 20
    .line 21
    .line 22
    const/16 v9, 0x4000

    .line 23
    .line 24
    const/16 v10, 0x2601

    .line 25
    .line 26
    const/4 v2, 0x0

    .line 27
    const/4 v5, 0x0

    .line 28
    const/4 v6, 0x0

    .line 29
    move v7, p1

    .line 30
    move v8, p2

    .line 31
    move v3, p1

    .line 32
    move v4, p2

    .line 33
    invoke-static/range {v1 .. v10}, Landroid/opengl/GLES30;->glBlitFramebuffer(IIIIIIIIII)V

    .line 34
    .line 35
    .line 36
    return-void
.end method
