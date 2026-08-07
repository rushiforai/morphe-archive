.class Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Landroid/graphics/Bitmap;

.field final synthetic b:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;


# virtual methods
.method public run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$1;->a:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_2

    .line 10
    .line 11
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$1;->b:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 12
    .line 13
    iget-object v1, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->Y:Ll/qnw;

    .line 14
    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    new-instance v1, Ll/qnw;

    .line 18
    .line 19
    invoke-direct {v1}, Ll/qnw;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object v1, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->Y:Ll/qnw;

    .line 23
    .line 24
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$1;->b:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 25
    .line 26
    iget-object v0, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->Y:Ll/qnw;

    .line 27
    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$1;->a:Landroid/graphics/Bitmap;

    .line 31
    .line 32
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    iget-object v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$1;->a:Landroid/graphics/Bitmap;

    .line 37
    .line 38
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$1;->b:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 43
    .line 44
    iget-object v2, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->Y:Ll/qnw;

    .line 45
    .line 46
    const/4 v3, 0x0

    .line 47
    invoke-virtual {v2, v3}, Ll/qnw;->setOESMode(Z)V

    .line 48
    .line 49
    .line 50
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$1;->b:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 51
    .line 52
    iget-object v2, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->Y:Ll/qnw;

    .line 53
    .line 54
    invoke-virtual {v2}, Ll/qnw;->initWithGLContext()V

    .line 55
    .line 56
    .line 57
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$1;->b:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 58
    .line 59
    iget-object v2, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->Y:Ll/qnw;

    .line 60
    .line 61
    iget-object v3, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$1;->a:Landroid/graphics/Bitmap;

    .line 62
    .line 63
    invoke-virtual {v2, v3}, Ll/qnw;->loadTexture(Landroid/graphics/Bitmap;)V

    .line 64
    .line 65
    .line 66
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$1;->b:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 67
    .line 68
    iget-object v3, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->Y:Ll/qnw;

    .line 69
    .line 70
    invoke-virtual {v3}, Ll/qnw;->getBitmapTextureID()I

    .line 71
    .line 72
    .line 73
    move-result v3

    .line 74
    invoke-static {v2, v3}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->R1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;I)I

    .line 75
    .line 76
    .line 77
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$1;->b:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 78
    .line 79
    iget-object v3, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->Y:Ll/qnw;

    .line 80
    .line 81
    invoke-virtual {v3}, Ll/qnw;->getBitmapSurfaceTexture()Landroid/graphics/SurfaceTexture;

    .line 82
    .line 83
    .line 84
    move-result-object v3

    .line 85
    invoke-static {v2, v3}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->T1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;Landroid/graphics/SurfaceTexture;)Landroid/graphics/SurfaceTexture;

    .line 86
    .line 87
    .line 88
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$1;->b:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 89
    .line 90
    invoke-static {v2}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->S1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;)Landroid/graphics/SurfaceTexture;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    if-eqz v2, :cond_0

    .line 95
    .line 96
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$1;->b:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 97
    .line 98
    invoke-static {v2}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->Q1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;)I

    .line 99
    .line 100
    .line 101
    move-result v2

    .line 102
    if-ltz v2, :cond_0

    .line 103
    .line 104
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$1;->b:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 105
    .line 106
    invoke-static {v2, v0}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->U1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;I)I

    .line 107
    .line 108
    .line 109
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$1;->b:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 110
    .line 111
    invoke-static {v0, v1}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->V1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;I)I

    .line 112
    .line 113
    .line 114
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$1;->b:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 115
    .line 116
    iget-object v0, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->Y:Ll/qnw;

    .line 117
    .line 118
    if-eqz v0, :cond_2

    .line 119
    .line 120
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$1;->a:Landroid/graphics/Bitmap;

    .line 121
    .line 122
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    iget-object v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$1;->a:Landroid/graphics/Bitmap;

    .line 127
    .line 128
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 129
    .line 130
    .line 131
    move-result v1

    .line 132
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$1;->b:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 133
    .line 134
    iget-object v2, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->Y:Ll/qnw;

    .line 135
    .line 136
    iget-object v3, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$1;->a:Landroid/graphics/Bitmap;

    .line 137
    .line 138
    invoke-virtual {v2, v3}, Ll/qnw;->loadTexture(Landroid/graphics/Bitmap;)V

    .line 139
    .line 140
    .line 141
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$1;->b:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 142
    .line 143
    iget-object v3, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->Y:Ll/qnw;

    .line 144
    .line 145
    invoke-virtual {v3}, Ll/qnw;->getBitmapTextureID()I

    .line 146
    .line 147
    .line 148
    move-result v3

    .line 149
    invoke-static {v2, v3}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->R1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;I)I

    .line 150
    .line 151
    .line 152
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$1;->b:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 153
    .line 154
    iget-object v3, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->Y:Ll/qnw;

    .line 155
    .line 156
    invoke-virtual {v3}, Ll/qnw;->getBitmapSurfaceTexture()Landroid/graphics/SurfaceTexture;

    .line 157
    .line 158
    .line 159
    move-result-object v3

    .line 160
    invoke-static {v2, v3}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->T1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;Landroid/graphics/SurfaceTexture;)Landroid/graphics/SurfaceTexture;

    .line 161
    .line 162
    .line 163
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$1;->b:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 164
    .line 165
    invoke-static {v2}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->S1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;)Landroid/graphics/SurfaceTexture;

    .line 166
    .line 167
    .line 168
    move-result-object v2

    .line 169
    if-eqz v2, :cond_1

    .line 170
    .line 171
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$1;->b:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 172
    .line 173
    invoke-static {v2}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->Q1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;)I

    .line 174
    .line 175
    .line 176
    move-result v2

    .line 177
    if-ltz v2, :cond_1

    .line 178
    .line 179
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$1;->b:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 180
    .line 181
    invoke-static {v2, v0}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->U1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;I)I

    .line 182
    .line 183
    .line 184
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$1;->b:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 185
    .line 186
    invoke-static {v0, v1}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->V1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;I)I

    .line 187
    .line 188
    .line 189
    :cond_1
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$1;->b:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 190
    .line 191
    iget-object v0, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->Y:Ll/qnw;

    .line 192
    .line 193
    invoke-virtual {v0}, Ll/qnw;->drawFrame()V

    .line 194
    .line 195
    .line 196
    invoke-static {}, Landroid/opengl/GLES20;->glFlush()V

    .line 197
    .line 198
    .line 199
    iget-object p0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$1;->b:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 200
    .line 201
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->Y:Ll/qnw;

    .line 202
    .line 203
    invoke-virtual {v0}, Ll/gfj;->getTextOutID()I

    .line 204
    .line 205
    .line 206
    move-result v0

    .line 207
    invoke-static {p0, v0}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->W1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;I)I

    .line 208
    .line 209
    .line 210
    :cond_2
    return-void
.end method
