.class Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;->sendCustomTextureInternal(Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;

.field final synthetic val$frame:Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;

.field final synthetic val$glThreadHandler:Lcom/tencent/liteav/basic/c/g;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;Lcom/tencent/liteav/basic/c/g;Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil$1;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil$1;->val$glThreadHandler:Lcom/tencent/liteav/basic/c/g;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil$1;->val$frame:Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil$1;->val$glThreadHandler:Lcom/tencent/liteav/basic/c/g;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/g;->d()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil$1;->val$glThreadHandler:Lcom/tencent/liteav/basic/c/g;

    .line 7
    .line 8
    iget-boolean v0, v0, Lcom/tencent/liteav/basic/c/g;->d:Z

    .line 9
    .line 10
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil$1;->val$frame:Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    iget-object v0, v1, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->texture:Lcom/tencent/trtc/TRTCCloudDef$TRTCTexture;

    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil$1;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;

    .line 19
    .line 20
    iget v3, v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCTexture;->textureId:I

    .line 21
    .line 22
    invoke-static {v2, v3, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;->access$000(Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;ILcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;)I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    iput v1, v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCTexture;->textureId:I

    .line 27
    .line 28
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil$1;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;

    .line 29
    .line 30
    invoke-static {v0}, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;->access$100(Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;)Lcom/tencent/liteav/d;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil$1;->val$frame:Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;

    .line 35
    .line 36
    iget-object v2, v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->texture:Lcom/tencent/trtc/TRTCCloudDef$TRTCTexture;

    .line 37
    .line 38
    iget v2, v2, Lcom/tencent/trtc/TRTCCloudDef$TRTCTexture;->textureId:I

    .line 39
    .line 40
    iget v3, v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->width:I

    .line 41
    .line 42
    iget v4, v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->height:I

    .line 43
    .line 44
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil$1;->val$glThreadHandler:Lcom/tencent/liteav/basic/c/g;

    .line 45
    .line 46
    iget-object v0, v0, Lcom/tencent/liteav/basic/c/g;->e:Lcom/tencent/liteav/basic/c/c;

    .line 47
    .line 48
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/c;->e()Landroid/opengl/EGLContext;

    .line 49
    .line 50
    .line 51
    move-result-object v5

    .line 52
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil$1;->val$frame:Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;

    .line 53
    .line 54
    iget-wide v6, p0, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->timestamp:J

    .line 55
    .line 56
    iget v8, p0, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->rotation:I

    .line 57
    .line 58
    invoke-virtual/range {v1 .. v8}, Lcom/tencent/liteav/d;->a(IIILjava/lang/Object;JI)I

    .line 59
    .line 60
    .line 61
    :cond_0
    return-void

    .line 62
    :cond_1
    iget-object v0, v1, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->texture:Lcom/tencent/trtc/TRTCCloudDef$TRTCTexture;

    .line 63
    .line 64
    if-eqz v0, :cond_2

    .line 65
    .line 66
    iget-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil$1;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;

    .line 67
    .line 68
    iget v3, v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCTexture;->textureId:I

    .line 69
    .line 70
    invoke-static {v2, v3, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;->access$000(Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;ILcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;)I

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    iput v1, v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCTexture;->textureId:I

    .line 75
    .line 76
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil$1;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;

    .line 77
    .line 78
    invoke-static {v0}, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;->access$100(Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;)Lcom/tencent/liteav/d;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil$1;->val$frame:Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;

    .line 83
    .line 84
    iget-object v2, v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->texture:Lcom/tencent/trtc/TRTCCloudDef$TRTCTexture;

    .line 85
    .line 86
    iget v2, v2, Lcom/tencent/trtc/TRTCCloudDef$TRTCTexture;->textureId:I

    .line 87
    .line 88
    iget v3, v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->width:I

    .line 89
    .line 90
    iget v4, v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->height:I

    .line 91
    .line 92
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil$1;->val$glThreadHandler:Lcom/tencent/liteav/basic/c/g;

    .line 93
    .line 94
    iget-object v0, v0, Lcom/tencent/liteav/basic/c/g;->g:Lcom/tencent/liteav/basic/c/b;

    .line 95
    .line 96
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/b;->d()Ljavax/microedition/khronos/egl/EGLContext;

    .line 97
    .line 98
    .line 99
    move-result-object v5

    .line 100
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil$1;->val$frame:Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;

    .line 101
    .line 102
    iget-wide v6, p0, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->timestamp:J

    .line 103
    .line 104
    iget v8, p0, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->rotation:I

    .line 105
    .line 106
    invoke-virtual/range {v1 .. v8}, Lcom/tencent/liteav/d;->a(IIILjava/lang/Object;JI)I

    .line 107
    .line 108
    .line 109
    return-void

    .line 110
    :cond_2
    iget v0, v1, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->pixelFormat:I

    .line 111
    .line 112
    const/4 v1, 0x1

    .line 113
    if-ne v0, v1, :cond_3

    .line 114
    .line 115
    move v4, v1

    .line 116
    goto :goto_0

    .line 117
    :cond_3
    const/4 v0, 0x3

    .line 118
    move v4, v0

    .line 119
    :goto_0
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil$1;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;

    .line 120
    .line 121
    invoke-static {v0}, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;->access$200(Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;)Lcom/tencent/liteav/beauty/b/k;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    if-nez v0, :cond_5

    .line 126
    .line 127
    new-instance v0, Lcom/tencent/liteav/beauty/b/k;

    .line 128
    .line 129
    invoke-direct {v0, v4}, Lcom/tencent/liteav/beauty/b/k;-><init>(I)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/basic/c/h;->a(Z)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {v0}, Lcom/tencent/liteav/beauty/b/k;->a()Z

    .line 136
    .line 137
    .line 138
    move-result v1

    .line 139
    if-nez v1, :cond_4

    .line 140
    .line 141
    const-string v1, "TRTCCustomTextureUtil"

    .line 142
    .line 143
    const-string v2, "mI4202RGBAFilter init failed!!, break init"

    .line 144
    .line 145
    invoke-static {v1, v2}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 146
    .line 147
    .line 148
    :cond_4
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil$1;->val$frame:Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;

    .line 149
    .line 150
    iget v2, v1, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->width:I

    .line 151
    .line 152
    iget v1, v1, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->height:I

    .line 153
    .line 154
    invoke-virtual {v0, v2, v1}, Lcom/tencent/liteav/beauty/b/k;->a(II)V

    .line 155
    .line 156
    .line 157
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil$1;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;

    .line 158
    .line 159
    invoke-static {v1, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;->access$202(Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;Lcom/tencent/liteav/beauty/b/k;)Lcom/tencent/liteav/beauty/b/k;

    .line 160
    .line 161
    .line 162
    :cond_5
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil$1;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;

    .line 163
    .line 164
    invoke-static {v0}, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;->access$200(Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;)Lcom/tencent/liteav/beauty/b/k;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    if-eqz v0, :cond_6

    .line 169
    .line 170
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil$1;->val$frame:Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;

    .line 171
    .line 172
    iget v2, v1, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->width:I

    .line 173
    .line 174
    iget v1, v1, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->height:I

    .line 175
    .line 176
    const/4 v3, 0x0

    .line 177
    invoke-static {v3, v3, v2, v1}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 178
    .line 179
    .line 180
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil$1;->val$frame:Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;

    .line 181
    .line 182
    iget-object v1, v1, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->data:[B

    .line 183
    .line 184
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/beauty/b/k;->a([B)V

    .line 185
    .line 186
    .line 187
    invoke-virtual {v0}, Lcom/tencent/liteav/beauty/b/k;->q()I

    .line 188
    .line 189
    .line 190
    move-result v0

    .line 191
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil$1;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;

    .line 192
    .line 193
    iget-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil$1;->val$frame:Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;

    .line 194
    .line 195
    invoke-static {v1, v0, v2}, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;->access$000(Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;ILcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;)I

    .line 196
    .line 197
    .line 198
    move-result v4

    .line 199
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil$1;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;

    .line 200
    .line 201
    invoke-static {v0}, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;->access$100(Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;)Lcom/tencent/liteav/d;

    .line 202
    .line 203
    .line 204
    move-result-object v3

    .line 205
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil$1;->val$frame:Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;

    .line 206
    .line 207
    iget v5, v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->width:I

    .line 208
    .line 209
    iget v6, v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->height:I

    .line 210
    .line 211
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil$1;->val$glThreadHandler:Lcom/tencent/liteav/basic/c/g;

    .line 212
    .line 213
    iget-object v0, v0, Lcom/tencent/liteav/basic/c/g;->g:Lcom/tencent/liteav/basic/c/b;

    .line 214
    .line 215
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/b;->d()Ljavax/microedition/khronos/egl/EGLContext;

    .line 216
    .line 217
    .line 218
    move-result-object v7

    .line 219
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil$1;->val$frame:Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;

    .line 220
    .line 221
    iget-wide v8, p0, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->timestamp:J

    .line 222
    .line 223
    iget v10, p0, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->rotation:I

    .line 224
    .line 225
    invoke-virtual/range {v3 .. v10}, Lcom/tencent/liteav/d;->a(IIILjava/lang/Object;JI)I

    .line 226
    .line 227
    .line 228
    return-void

    .line 229
    :cond_6
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil$1;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;

    .line 230
    .line 231
    invoke-static {v0}, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;->access$100(Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;)Lcom/tencent/liteav/d;

    .line 232
    .line 233
    .line 234
    move-result-object v2

    .line 235
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil$1;->val$frame:Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;

    .line 236
    .line 237
    iget-object v3, v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->data:[B

    .line 238
    .line 239
    iget v5, v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->width:I

    .line 240
    .line 241
    iget v6, v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->height:I

    .line 242
    .line 243
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil$1;->val$glThreadHandler:Lcom/tencent/liteav/basic/c/g;

    .line 244
    .line 245
    iget-object v0, v0, Lcom/tencent/liteav/basic/c/g;->g:Lcom/tencent/liteav/basic/c/b;

    .line 246
    .line 247
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/b;->d()Ljavax/microedition/khronos/egl/EGLContext;

    .line 248
    .line 249
    .line 250
    move-result-object v7

    .line 251
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil$1;->val$frame:Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;

    .line 252
    .line 253
    iget-wide v8, p0, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->timestamp:J

    .line 254
    .line 255
    iget v10, p0, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->rotation:I

    .line 256
    .line 257
    invoke-virtual/range {v2 .. v10}, Lcom/tencent/liteav/d;->a([BIIILjava/lang/Object;JI)I

    .line 258
    .line 259
    .line 260
    return-void
.end method
