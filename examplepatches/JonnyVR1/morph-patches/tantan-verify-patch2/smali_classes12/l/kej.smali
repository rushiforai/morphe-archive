.class public Ll/kej;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Z

.field protected b:[I

.field protected c:[I

.field protected d:[I

.field private e:Ljava/lang/Object;

.field private f:I

.field private g:I

.field private h:I

.field private i:Z

.field private j:Z


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
    iput-object p1, p0, Ll/kej;->e:Ljava/lang/Object;

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    iput-boolean p1, p0, Ll/kej;->i:Z

    .line 13
    .line 14
    iput-boolean p1, p0, Ll/kej;->j:Z

    .line 15
    .line 16
    const/4 p2, 0x1

    .line 17
    new-array v0, p2, [I

    .line 18
    .line 19
    iput-object v0, p0, Ll/kej;->b:[I

    .line 20
    .line 21
    new-array v0, p2, [I

    .line 22
    .line 23
    iput-object v0, p0, Ll/kej;->c:[I

    .line 24
    .line 25
    new-array p2, p2, [I

    .line 26
    .line 27
    iput-object p2, p0, Ll/kej;->d:[I

    .line 28
    .line 29
    iput p1, p0, Ll/kej;->f:I

    .line 30
    .line 31
    return-void
.end method


# virtual methods
.method public a(II)V
    .locals 13

    .line 1
    move v4, p2

    .line 2
    iget-boolean v0, p0, Ll/kej;->i:Z

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    iput p1, p0, Ll/kej;->g:I

    .line 8
    .line 9
    iput v4, p0, Ll/kej;->h:I

    .line 10
    .line 11
    iget-object v0, p0, Ll/kej;->b:[I

    .line 12
    .line 13
    const/4 v9, 0x1

    .line 14
    const/4 v10, 0x0

    .line 15
    invoke-static {v9, v0, v10}, Landroid/opengl/GLES20;->glGenFramebuffers(I[II)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/kej;->d:[I

    .line 19
    .line 20
    invoke-static {v9, v0, v10}, Landroid/opengl/GLES20;->glGenRenderbuffers(I[II)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/kej;->c:[I

    .line 24
    .line 25
    invoke-static {v9, v0, v10}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/kej;->b:[I

    .line 29
    .line 30
    aget v0, v0, v10

    .line 31
    .line 32
    const v11, 0x8d40

    .line 33
    .line 34
    .line 35
    invoke-static {v11, v0}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 36
    .line 37
    .line 38
    const v0, 0x84c0

    .line 39
    .line 40
    .line 41
    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Ll/kej;->c:[I

    .line 45
    .line 46
    aget v0, v0, v10

    .line 47
    .line 48
    const/16 v12, 0xde1

    .line 49
    .line 50
    invoke-static {v12, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 51
    .line 52
    .line 53
    iget-boolean v0, p0, Ll/kej;->j:Z

    .line 54
    .line 55
    if-eqz v0, :cond_1

    .line 56
    .line 57
    const/16 v6, 0x1908

    .line 58
    .line 59
    const/4 v8, 0x0

    .line 60
    const/16 v0, 0xde1

    .line 61
    .line 62
    const/4 v1, 0x0

    .line 63
    const v2, 0x881a

    .line 64
    .line 65
    .line 66
    const/4 v5, 0x0

    .line 67
    const v7, 0x8d61

    .line 68
    .line 69
    .line 70
    move v3, p1

    .line 71
    invoke-static/range {v0 .. v8}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 72
    .line 73
    .line 74
    move v4, p2

    .line 75
    goto :goto_0

    .line 76
    :cond_1
    const/16 v7, 0x1401

    .line 77
    .line 78
    const/4 v8, 0x0

    .line 79
    const/16 v0, 0xde1

    .line 80
    .line 81
    const/4 v1, 0x0

    .line 82
    const/16 v2, 0x1908

    .line 83
    .line 84
    const/4 v5, 0x0

    .line 85
    const/16 v6, 0x1908

    .line 86
    .line 87
    move v3, p1

    .line 88
    move v4, p2

    .line 89
    invoke-static/range {v0 .. v8}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 90
    .line 91
    .line 92
    :goto_0
    const/16 v0, 0x2802

    .line 93
    .line 94
    const v1, 0x812f

    .line 95
    .line 96
    .line 97
    invoke-static {v12, v0, v1}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 98
    .line 99
    .line 100
    const/16 v0, 0x2803

    .line 101
    .line 102
    invoke-static {v12, v0, v1}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 103
    .line 104
    .line 105
    const/16 v0, 0x2800

    .line 106
    .line 107
    const/16 v1, 0x2601

    .line 108
    .line 109
    invoke-static {v12, v0, v1}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 110
    .line 111
    .line 112
    const/16 v0, 0x2801

    .line 113
    .line 114
    invoke-static {v12, v0, v1}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 115
    .line 116
    .line 117
    iget-object v0, p0, Ll/kej;->c:[I

    .line 118
    .line 119
    aget v0, v0, v10

    .line 120
    .line 121
    const v1, 0x8ce0

    .line 122
    .line 123
    .line 124
    invoke-static {v11, v1, v12, v0, v10}, Landroid/opengl/GLES20;->glFramebufferTexture2D(IIIII)V

    .line 125
    .line 126
    .line 127
    iget-object v0, p0, Ll/kej;->d:[I

    .line 128
    .line 129
    aget v0, v0, v10

    .line 130
    .line 131
    const v1, 0x8d41

    .line 132
    .line 133
    .line 134
    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindRenderbuffer(II)V

    .line 135
    .line 136
    .line 137
    const v0, 0x81a5

    .line 138
    .line 139
    .line 140
    invoke-static {v1, v0, p1, p2}, Landroid/opengl/GLES20;->glRenderbufferStorage(IIII)V

    .line 141
    .line 142
    .line 143
    iget-object v0, p0, Ll/kej;->d:[I

    .line 144
    .line 145
    aget v0, v0, v10

    .line 146
    .line 147
    const v2, 0x8d00

    .line 148
    .line 149
    .line 150
    invoke-static {v11, v2, v1, v0}, Landroid/opengl/GLES20;->glFramebufferRenderbuffer(IIII)V

    .line 151
    .line 152
    .line 153
    iput-boolean v9, p0, Ll/kej;->i:Z

    .line 154
    .line 155
    return-void
.end method

.method public b()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/kej;->b:[I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x0

    .line 5
    const/4 v3, 0x1

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-static {v3, v0, v2}, Landroid/opengl/GLES20;->glDeleteFramebuffers(I[II)V

    .line 9
    .line 10
    .line 11
    iput-object v1, p0, Ll/kej;->b:[I

    .line 12
    .line 13
    :cond_0
    iget-object v0, p0, Ll/kej;->c:[I

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-static {v3, v0, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 18
    .line 19
    .line 20
    iput-object v1, p0, Ll/kej;->c:[I

    .line 21
    .line 22
    :cond_1
    iget-object v0, p0, Ll/kej;->d:[I

    .line 23
    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    invoke-static {v3, v0, v2}, Landroid/opengl/GLES20;->glDeleteRenderbuffers(I[II)V

    .line 27
    .line 28
    .line 29
    iput-object v1, p0, Ll/kej;->d:[I

    .line 30
    .line 31
    :cond_2
    return-void
.end method

.method public c()[I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kej;->b:[I

    .line 2
    .line 3
    return-object p0
.end method

.method public d()[I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kej;->c:[I

    .line 2
    .line 3
    return-object p0
.end method

.method public e(Z)V
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
    iput-boolean p1, p0, Ll/kej;->j:Z

    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public f()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/kej;->e:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget v1, p0, Ll/kej;->f:I

    .line 5
    .line 6
    const/4 v2, 0x1

    .line 7
    sub-int/2addr v1, v2

    .line 8
    iput v1, p0, Ll/kej;->f:I

    .line 9
    .line 10
    if-ge v1, v2, :cond_0

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    iput-boolean v1, p0, Ll/kej;->a:Z

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
