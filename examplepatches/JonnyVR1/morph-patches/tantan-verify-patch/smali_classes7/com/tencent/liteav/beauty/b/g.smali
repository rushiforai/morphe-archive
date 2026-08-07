.class public Lcom/tencent/liteav/beauty/b/g;
.super Lcom/tencent/liteav/basic/c/h;
.source "SourceFile"


# instance fields
.field protected r:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/tencent/liteav/basic/c/h;",
            ">;"
        }
    .end annotation
.end field

.field protected s:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/tencent/liteav/basic/c/h;",
            ">;"
        }
    .end annotation
.end field

.field private t:[I

.field private u:[I

.field private v:Lcom/tencent/liteav/basic/c/h;


# virtual methods
.method public a(III)I
    .locals 7

    .line 170
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/g;->s:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    .line 171
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/c/h;->k()V

    const/4 v1, 0x0

    move v2, v1

    move v3, v2

    :goto_0
    if-ge v2, v0, :cond_1

    .line 172
    iget-object v4, p0, Lcom/tencent/liteav/beauty/b/g;->s:Ljava/util/List;

    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/tencent/liteav/basic/c/h;

    if-eqz v3, :cond_0

    .line 173
    invoke-virtual {v4, p1, p2, p3}, Lcom/tencent/liteav/basic/c/h;->a(III)I

    move-result p1

    goto :goto_1

    .line 174
    :cond_0
    iget-object v5, p0, Lcom/tencent/liteav/beauty/b/g;->t:[I

    aget v5, v5, v1

    iget-object v6, p0, Lcom/tencent/liteav/beauty/b/g;->u:[I

    aget v6, v6, v1

    invoke-virtual {v4, p1, v5, v6}, Lcom/tencent/liteav/basic/c/h;->a(III)I

    move-result p1

    :goto_1
    xor-int/lit8 v3, v3, 0x1

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    if-eqz v3, :cond_2

    .line 175
    iget-object p0, p0, Lcom/tencent/liteav/beauty/b/g;->v:Lcom/tencent/liteav/basic/c/h;

    invoke-virtual {p0, p1, p2, p3}, Lcom/tencent/liteav/basic/c/h;->a(III)I

    :cond_2
    return p3
.end method

.method public a(II)V
    .locals 13

    .line 1
    move v4, p2

    .line 2
    iget v0, p0, Lcom/tencent/liteav/basic/c/h;->e:I

    .line 3
    .line 4
    if-ne v0, p1, :cond_0

    .line 5
    .line 6
    iget v0, p0, Lcom/tencent/liteav/basic/c/h;->f:I

    .line 7
    .line 8
    if-ne v0, v4, :cond_0

    .line 9
    .line 10
    goto/16 :goto_2

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/g;->t:[I

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/tencent/liteav/beauty/b/g;->f()V

    .line 17
    .line 18
    .line 19
    :cond_1
    invoke-super/range {p0 .. p2}, Lcom/tencent/liteav/basic/c/h;->a(II)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/g;->s:Ljava/util/List;

    .line 23
    .line 24
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    const/4 v9, 0x0

    .line 29
    move v1, v9

    .line 30
    :goto_0
    if-ge v1, v0, :cond_2

    .line 31
    .line 32
    iget-object v2, p0, Lcom/tencent/liteav/beauty/b/g;->s:Ljava/util/List;

    .line 33
    .line 34
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    check-cast v2, Lcom/tencent/liteav/basic/c/h;

    .line 39
    .line 40
    invoke-virtual {v2, p1, p2}, Lcom/tencent/liteav/basic/c/h;->a(II)V

    .line 41
    .line 42
    .line 43
    add-int/lit8 v1, v1, 0x1

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_2
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/g;->v:Lcom/tencent/liteav/basic/c/h;

    .line 47
    .line 48
    invoke-virtual {v0, p1, p2}, Lcom/tencent/liteav/basic/c/h;->a(II)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/g;->s:Ljava/util/List;

    .line 52
    .line 53
    if-eqz v0, :cond_3

    .line 54
    .line 55
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-lez v0, :cond_3

    .line 60
    .line 61
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/g;->s:Ljava/util/List;

    .line 62
    .line 63
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 64
    .line 65
    .line 66
    const/4 v10, 0x2

    .line 67
    new-array v0, v10, [I

    .line 68
    .line 69
    iput-object v0, p0, Lcom/tencent/liteav/beauty/b/g;->t:[I

    .line 70
    .line 71
    new-array v0, v10, [I

    .line 72
    .line 73
    iput-object v0, p0, Lcom/tencent/liteav/beauty/b/g;->u:[I

    .line 74
    .line 75
    move v11, v9

    .line 76
    :goto_1
    if-ge v11, v10, :cond_3

    .line 77
    .line 78
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/g;->t:[I

    .line 79
    .line 80
    const/4 v1, 0x1

    .line 81
    invoke-static {v1, v0, v11}, Landroid/opengl/GLES20;->glGenFramebuffers(I[II)V

    .line 82
    .line 83
    .line 84
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/g;->u:[I

    .line 85
    .line 86
    invoke-static {v1, v0, v11}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 87
    .line 88
    .line 89
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/g;->u:[I

    .line 90
    .line 91
    aget v0, v0, v11

    .line 92
    .line 93
    const/16 v12, 0xde1

    .line 94
    .line 95
    invoke-static {v12, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 96
    .line 97
    .line 98
    const/16 v7, 0x1401

    .line 99
    .line 100
    const/4 v8, 0x0

    .line 101
    const/16 v0, 0xde1

    .line 102
    .line 103
    const/4 v1, 0x0

    .line 104
    const/16 v2, 0x1908

    .line 105
    .line 106
    const/4 v5, 0x0

    .line 107
    const/16 v6, 0x1908

    .line 108
    .line 109
    move v3, p1

    .line 110
    invoke-static/range {v0 .. v8}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 111
    .line 112
    .line 113
    const/16 v0, 0x2800

    .line 114
    .line 115
    const v1, 0x46180400    # 9729.0f

    .line 116
    .line 117
    .line 118
    invoke-static {v12, v0, v1}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 119
    .line 120
    .line 121
    const/16 v0, 0x2801

    .line 122
    .line 123
    invoke-static {v12, v0, v1}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 124
    .line 125
    .line 126
    const/16 v0, 0x2802

    .line 127
    .line 128
    const v1, 0x47012f00    # 33071.0f

    .line 129
    .line 130
    .line 131
    invoke-static {v12, v0, v1}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 132
    .line 133
    .line 134
    const/16 v0, 0x2803

    .line 135
    .line 136
    invoke-static {v12, v0, v1}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 137
    .line 138
    .line 139
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/g;->t:[I

    .line 140
    .line 141
    aget v0, v0, v11

    .line 142
    .line 143
    const v1, 0x8d40

    .line 144
    .line 145
    .line 146
    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 147
    .line 148
    .line 149
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/g;->u:[I

    .line 150
    .line 151
    aget v0, v0, v11

    .line 152
    .line 153
    const v2, 0x8ce0

    .line 154
    .line 155
    .line 156
    invoke-static {v1, v2, v12, v0, v9}, Landroid/opengl/GLES20;->glFramebufferTexture2D(IIIII)V

    .line 157
    .line 158
    .line 159
    invoke-static {v12, v9}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 160
    .line 161
    .line 162
    invoke-static {v1, v9}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 163
    .line 164
    .line 165
    add-int/lit8 v11, v11, 0x1

    .line 166
    .line 167
    move v4, p2

    .line 168
    goto :goto_1

    .line 169
    :cond_3
    :goto_2
    return-void
.end method

.method public b()Z
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/tencent/liteav/basic/c/h;->b()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/g;->r:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_1

    .line 18
    .line 19
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    check-cast v1, Lcom/tencent/liteav/basic/c/h;

    .line 24
    .line 25
    invoke-virtual {v1}, Lcom/tencent/liteav/basic/c/h;->a()Z

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1}, Lcom/tencent/liteav/basic/c/h;->m()Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-nez v1, :cond_0

    .line 33
    .line 34
    :cond_1
    iget-object p0, p0, Lcom/tencent/liteav/beauty/b/g;->v:Lcom/tencent/liteav/basic/c/h;

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/c/h;->a()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    :cond_2
    if-eqz v0, :cond_3

    .line 41
    .line 42
    invoke-static {}, Landroid/opengl/GLES20;->glGetError()I

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    if-nez p0, :cond_3

    .line 47
    .line 48
    const/4 p0, 0x1

    .line 49
    return p0

    .line 50
    :cond_3
    const/4 p0, 0x0

    .line 51
    return p0
.end method

.method public e()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/tencent/liteav/basic/c/h;->e()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/tencent/liteav/beauty/b/g;->r:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lcom/tencent/liteav/basic/c/h;

    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/h;->d()V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    return-void
.end method

.method public f()V
    .locals 4

    .line 1
    invoke-super {p0}, Lcom/tencent/liteav/basic/c/h;->f()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/g;->u:[I

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    const/4 v2, 0x0

    .line 8
    const/4 v3, 0x2

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {v3, v0, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 12
    .line 13
    .line 14
    iput-object v1, p0, Lcom/tencent/liteav/beauty/b/g;->u:[I

    .line 15
    .line 16
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/g;->t:[I

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-static {v3, v0, v2}, Landroid/opengl/GLES20;->glDeleteFramebuffers(I[II)V

    .line 21
    .line 22
    .line 23
    iput-object v1, p0, Lcom/tencent/liteav/beauty/b/g;->t:[I

    .line 24
    .line 25
    :cond_1
    return-void
.end method
