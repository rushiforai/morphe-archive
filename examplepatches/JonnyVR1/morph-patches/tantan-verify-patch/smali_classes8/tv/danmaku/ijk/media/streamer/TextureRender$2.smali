.class Ltv/danmaku/ijk/media/streamer/TextureRender$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ltv/danmaku/ijk/media/streamer/TextureRender;->O(IIZIIIII)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:I

.field final synthetic b:I

.field final synthetic c:I

.field final synthetic d:I

.field final synthetic e:I

.field final synthetic f:Z

.field final synthetic g:I

.field final synthetic h:Ltv/danmaku/ijk/media/streamer/TextureRender;


# direct methods
.method public constructor <init>(Ltv/danmaku/ijk/media/streamer/TextureRender;IIIIIZI)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender$2;->h:Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 2
    .line 3
    iput p2, p0, Ltv/danmaku/ijk/media/streamer/TextureRender$2;->a:I

    .line 4
    .line 5
    iput p3, p0, Ltv/danmaku/ijk/media/streamer/TextureRender$2;->b:I

    .line 6
    .line 7
    iput p4, p0, Ltv/danmaku/ijk/media/streamer/TextureRender$2;->c:I

    .line 8
    .line 9
    iput p5, p0, Ltv/danmaku/ijk/media/streamer/TextureRender$2;->d:I

    .line 10
    .line 11
    iput p6, p0, Ltv/danmaku/ijk/media/streamer/TextureRender$2;->e:I

    .line 12
    .line 13
    iput-boolean p7, p0, Ltv/danmaku/ijk/media/streamer/TextureRender$2;->f:Z

    .line 14
    .line 15
    iput p8, p0, Ltv/danmaku/ijk/media/streamer/TextureRender$2;->g:I

    .line 16
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "----updateCamera: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender$2;->a:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ","

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget v2, p0, Ltv/danmaku/ijk/media/streamer/TextureRender$2;->b:I

    .line 19
    .line 20
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v2, ", O:"

    .line 24
    .line 25
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget v2, p0, Ltv/danmaku/ijk/media/streamer/TextureRender$2;->c:I

    .line 29
    .line 30
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    iget v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender$2;->d:I

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    const-string v1, "TextureRender"

    .line 46
    .line 47
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender$2;->h:Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 51
    .line 52
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/TextureRender;->c(Ltv/danmaku/ijk/media/streamer/TextureRender;)Ll/zej;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    if-eqz v0, :cond_1

    .line 57
    .line 58
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender$2;->h:Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 59
    .line 60
    iget-object v1, v0, Ltv/danmaku/ijk/media/streamer/TextureRender;->h:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 61
    .line 62
    const/4 v2, 0x0

    .line 63
    if-eqz v1, :cond_0

    .line 64
    .line 65
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/TextureRender;->c(Ltv/danmaku/ijk/media/streamer/TextureRender;)Ll/zej;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-virtual {v1, v0}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender$2;->h:Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 73
    .line 74
    iget-object v1, v0, Ltv/danmaku/ijk/media/streamer/TextureRender;->c:Ll/pej;

    .line 75
    .line 76
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/TextureRender;->c(Ltv/danmaku/ijk/media/streamer/TextureRender;)Ll/zej;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-virtual {v1, v0}, Ll/pej;->a(Ll/wej;)V

    .line 81
    .line 82
    .line 83
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender$2;->h:Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 84
    .line 85
    invoke-static {v0, v2}, Ltv/danmaku/ijk/media/streamer/TextureRender;->d(Ltv/danmaku/ijk/media/streamer/TextureRender;Ll/zej;)Ll/zej;

    .line 86
    .line 87
    .line 88
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender$2;->h:Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 89
    .line 90
    iget-object v1, v0, Ltv/danmaku/ijk/media/streamer/TextureRender;->i:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 91
    .line 92
    if-eqz v1, :cond_1

    .line 93
    .line 94
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/TextureRender;->c(Ltv/danmaku/ijk/media/streamer/TextureRender;)Ll/zej;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    invoke-virtual {v1, v0}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 99
    .line 100
    .line 101
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender$2;->h:Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 102
    .line 103
    iget-object v1, v0, Ltv/danmaku/ijk/media/streamer/TextureRender;->c:Ll/pej;

    .line 104
    .line 105
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/TextureRender;->c(Ltv/danmaku/ijk/media/streamer/TextureRender;)Ll/zej;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    invoke-virtual {v1, v0}, Ll/pej;->a(Ll/wej;)V

    .line 110
    .line 111
    .line 112
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender$2;->h:Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 113
    .line 114
    invoke-static {v0, v2}, Ltv/danmaku/ijk/media/streamer/TextureRender;->d(Ltv/danmaku/ijk/media/streamer/TextureRender;Ll/zej;)Ll/zej;

    .line 115
    .line 116
    .line 117
    :cond_1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender$2;->h:Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 118
    .line 119
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/TextureRender;->e(Ltv/danmaku/ijk/media/streamer/TextureRender;)V

    .line 120
    .line 121
    .line 122
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender$2;->h:Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 123
    .line 124
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/TextureRender;->f(Ltv/danmaku/ijk/media/streamer/TextureRender;)I

    .line 125
    .line 126
    .line 127
    move-result v0

    .line 128
    const/4 v1, 0x2

    .line 129
    if-ne v0, v1, :cond_2

    .line 130
    .line 131
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender$2;->h:Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 132
    .line 133
    iget v2, p0, Ltv/danmaku/ijk/media/streamer/TextureRender$2;->a:I

    .line 134
    .line 135
    invoke-static {v0, v2}, Ltv/danmaku/ijk/media/streamer/TextureRender;->g(Ltv/danmaku/ijk/media/streamer/TextureRender;I)I

    .line 136
    .line 137
    .line 138
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender$2;->h:Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 139
    .line 140
    iget v2, p0, Ltv/danmaku/ijk/media/streamer/TextureRender$2;->b:I

    .line 141
    .line 142
    invoke-static {v0, v2}, Ltv/danmaku/ijk/media/streamer/TextureRender;->h(Ltv/danmaku/ijk/media/streamer/TextureRender;I)I

    .line 143
    .line 144
    .line 145
    goto :goto_1

    .line 146
    :cond_2
    iget v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender$2;->e:I

    .line 147
    .line 148
    const/16 v2, 0x5a

    .line 149
    .line 150
    if-eq v0, v2, :cond_4

    .line 151
    .line 152
    const/16 v2, 0x10e

    .line 153
    .line 154
    if-ne v0, v2, :cond_3

    .line 155
    .line 156
    goto :goto_0

    .line 157
    :cond_3
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender$2;->h:Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 158
    .line 159
    iget v2, p0, Ltv/danmaku/ijk/media/streamer/TextureRender$2;->a:I

    .line 160
    .line 161
    invoke-static {v0, v2}, Ltv/danmaku/ijk/media/streamer/TextureRender;->g(Ltv/danmaku/ijk/media/streamer/TextureRender;I)I

    .line 162
    .line 163
    .line 164
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender$2;->h:Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 165
    .line 166
    iget v2, p0, Ltv/danmaku/ijk/media/streamer/TextureRender$2;->b:I

    .line 167
    .line 168
    invoke-static {v0, v2}, Ltv/danmaku/ijk/media/streamer/TextureRender;->h(Ltv/danmaku/ijk/media/streamer/TextureRender;I)I

    .line 169
    .line 170
    .line 171
    goto :goto_1

    .line 172
    :cond_4
    :goto_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender$2;->h:Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 173
    .line 174
    iget v2, p0, Ltv/danmaku/ijk/media/streamer/TextureRender$2;->a:I

    .line 175
    .line 176
    invoke-static {v0, v2}, Ltv/danmaku/ijk/media/streamer/TextureRender;->h(Ltv/danmaku/ijk/media/streamer/TextureRender;I)I

    .line 177
    .line 178
    .line 179
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender$2;->h:Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 180
    .line 181
    iget v2, p0, Ltv/danmaku/ijk/media/streamer/TextureRender$2;->b:I

    .line 182
    .line 183
    invoke-static {v0, v2}, Ltv/danmaku/ijk/media/streamer/TextureRender;->g(Ltv/danmaku/ijk/media/streamer/TextureRender;I)I

    .line 184
    .line 185
    .line 186
    :goto_1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender$2;->h:Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 187
    .line 188
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/TextureRender;->f(Ltv/danmaku/ijk/media/streamer/TextureRender;)I

    .line 189
    .line 190
    .line 191
    move-result v0

    .line 192
    const/4 v2, 0x1

    .line 193
    if-nez v0, :cond_6

    .line 194
    .line 195
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender$2;->f:Z

    .line 196
    .line 197
    iget-object v3, p0, Ltv/danmaku/ijk/media/streamer/TextureRender$2;->h:Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 198
    .line 199
    if-eqz v0, :cond_5

    .line 200
    .line 201
    iget-object v0, v3, Ltv/danmaku/ijk/media/streamer/TextureRender;->d:Ll/gb20;

    .line 202
    .line 203
    iget v2, p0, Ltv/danmaku/ijk/media/streamer/TextureRender$2;->e:I

    .line 204
    .line 205
    rsub-int v2, v2, 0x168

    .line 206
    .line 207
    invoke-virtual {v0, v2}, Ll/gb20;->changeCurRotation(I)V

    .line 208
    .line 209
    .line 210
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender$2;->h:Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 211
    .line 212
    iget-object v0, v0, Ltv/danmaku/ijk/media/streamer/TextureRender;->d:Ll/gb20;

    .line 213
    .line 214
    invoke-virtual {v0, v1}, Ll/gb20;->flipPosition(I)V

    .line 215
    .line 216
    .line 217
    goto :goto_2

    .line 218
    :cond_5
    iget-object v0, v3, Ltv/danmaku/ijk/media/streamer/TextureRender;->d:Ll/gb20;

    .line 219
    .line 220
    iget v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender$2;->e:I

    .line 221
    .line 222
    invoke-virtual {v0, v1}, Ll/gb20;->changeCurRotation(I)V

    .line 223
    .line 224
    .line 225
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender$2;->h:Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 226
    .line 227
    iget-object v0, v0, Ltv/danmaku/ijk/media/streamer/TextureRender;->d:Ll/gb20;

    .line 228
    .line 229
    invoke-virtual {v0, v2}, Ll/gb20;->flipPosition(I)V

    .line 230
    .line 231
    .line 232
    :goto_2
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender$2;->h:Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 233
    .line 234
    iget-object v0, v0, Ltv/danmaku/ijk/media/streamer/TextureRender;->d:Ll/gb20;

    .line 235
    .line 236
    iget v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender$2;->a:I

    .line 237
    .line 238
    iget v2, p0, Ltv/danmaku/ijk/media/streamer/TextureRender$2;->b:I

    .line 239
    .line 240
    invoke-virtual {v0, v1, v2}, Ll/wej;->setRenderSize(II)V

    .line 241
    .line 242
    .line 243
    goto :goto_3

    .line 244
    :cond_6
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender$2;->h:Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 245
    .line 246
    iget-object v0, v0, Ltv/danmaku/ijk/media/streamer/TextureRender;->e:Ll/qnw;

    .line 247
    .line 248
    iget v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender$2;->e:I

    .line 249
    .line 250
    invoke-virtual {v0, v1}, Ll/qnw;->changeCurRotation(I)V

    .line 251
    .line 252
    .line 253
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender$2;->h:Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 254
    .line 255
    iget-object v0, v0, Ltv/danmaku/ijk/media/streamer/TextureRender;->e:Ll/qnw;

    .line 256
    .line 257
    invoke-virtual {v0, v2}, Ll/qnw;->flipPosition(I)V

    .line 258
    .line 259
    .line 260
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender$2;->h:Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 261
    .line 262
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/TextureRender;->f(Ltv/danmaku/ijk/media/streamer/TextureRender;)I

    .line 263
    .line 264
    .line 265
    move-result v0

    .line 266
    if-ne v0, v2, :cond_7

    .line 267
    .line 268
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender$2;->h:Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 269
    .line 270
    iget-object v0, v0, Ltv/danmaku/ijk/media/streamer/TextureRender;->e:Ll/qnw;

    .line 271
    .line 272
    iget v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender$2;->a:I

    .line 273
    .line 274
    iget v2, p0, Ltv/danmaku/ijk/media/streamer/TextureRender$2;->b:I

    .line 275
    .line 276
    invoke-virtual {v0, v1, v2}, Ll/qnw;->setRenderSize(II)V

    .line 277
    .line 278
    .line 279
    :cond_7
    :goto_3
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender$2;->h:Ltv/danmaku/ijk/media/streamer/TextureRender;

    .line 280
    .line 281
    iget v1, p0, Ltv/danmaku/ijk/media/streamer/TextureRender$2;->c:I

    .line 282
    .line 283
    iget v2, p0, Ltv/danmaku/ijk/media/streamer/TextureRender$2;->d:I

    .line 284
    .line 285
    iget p0, p0, Ltv/danmaku/ijk/media/streamer/TextureRender$2;->g:I

    .line 286
    .line 287
    invoke-static {v0, v1, v2, p0}, Ltv/danmaku/ijk/media/streamer/TextureRender;->i(Ltv/danmaku/ijk/media/streamer/TextureRender;III)V

    .line 288
    .line 289
    .line 290
    return-void
.end method
