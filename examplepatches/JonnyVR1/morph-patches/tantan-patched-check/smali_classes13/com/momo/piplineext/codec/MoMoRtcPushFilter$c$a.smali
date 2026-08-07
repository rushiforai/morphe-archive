.class Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->onFirstRemoteVideoFrame(IIII)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:I

.field final synthetic b:I

.field final synthetic c:I

.field final synthetic d:Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;


# direct methods
.method public constructor <init>(Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;III)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a;->d:Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;

    .line 2
    .line 3
    iput p2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a;->a:I

    .line 4
    .line 5
    iput p3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a;->b:I

    .line 6
    .line 7
    iput p4, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a;->c:I

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public run()V
    .locals 20
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0xf
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a;->d:Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 6
    .line 7
    invoke-static {v1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->M2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/momo/rtcbase/EglBase;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    iget-object v1, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a;->d:Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;

    .line 14
    .line 15
    iget-object v1, v1, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 16
    .line 17
    invoke-static {}, Lcom/momo/rtcbase/EglBase;->create()Lcom/momo/rtcbase/EglBase;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-static {v1, v2}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->N2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;Lcom/momo/rtcbase/EglBase;)Lcom/momo/rtcbase/EglBase;

    .line 22
    .line 23
    .line 24
    :cond_0
    iget-object v1, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a;->d:Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;

    .line 25
    .line 26
    iget-object v1, v1, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 27
    .line 28
    invoke-virtual {v1}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->W1()Landroid/content/Context;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-static {v1}, Lcom/momo/momortc/MMRtcEngine;->CreateRendererView(Landroid/content/Context;)Lcom/momo/rtcbase/SurfaceViewRenderer;

    .line 33
    .line 34
    .line 35
    move-result-object v5

    .line 36
    iget-object v1, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a;->d:Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;

    .line 37
    .line 38
    iget-object v1, v1, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 39
    .line 40
    invoke-static {v1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->M2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/momo/rtcbase/EglBase;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-interface {v1}, Lcom/momo/rtcbase/EglBase;->getEglBaseContext()Lcom/momo/rtcbase/EglBase$Context;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    new-instance v2, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a$a;

    .line 49
    .line 50
    invoke-direct {v2, v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a$a;-><init>(Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v5, v1, v2}, Lcom/momo/rtcbase/SurfaceViewRenderer;->init(Lcom/momo/rtcbase/EglBase$Context;Lcom/momo/rtcbase/RendererCommon$RendererEvents;)V

    .line 54
    .line 55
    .line 56
    const/4 v1, 0x1

    .line 57
    invoke-virtual {v5, v1}, Landroid/view/SurfaceView;->setZOrderOnTop(Z)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v5, v1}, Landroid/view/SurfaceView;->setZOrderMediaOverlay(Z)V

    .line 61
    .line 62
    .line 63
    iget-object v2, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a;->d:Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;

    .line 64
    .line 65
    iget-object v2, v2, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 66
    .line 67
    invoke-static {v2}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->O2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ljava/util/Map;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    monitor-enter v2

    .line 72
    :try_start_0
    iget-object v3, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a;->d:Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;

    .line 73
    .line 74
    iget-object v3, v3, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 75
    .line 76
    invoke-static {v3}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->O2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ljava/util/Map;

    .line 77
    .line 78
    .line 79
    move-result-object v3

    .line 80
    iget v4, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a;->a:I

    .line 81
    .line 82
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 83
    .line 84
    .line 85
    move-result-object v4

    .line 86
    invoke-interface {v3, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 90
    iget-object v2, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a;->d:Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;

    .line 91
    .line 92
    iget-object v2, v2, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 93
    .line 94
    invoke-static {v2}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->P2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/momo/momortc/MMRtcEngine;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    if-eqz v2, :cond_1

    .line 99
    .line 100
    iget-object v2, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a;->d:Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;

    .line 101
    .line 102
    iget-object v2, v2, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 103
    .line 104
    invoke-static {v2}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->P2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/momo/momortc/MMRtcEngine;

    .line 105
    .line 106
    .line 107
    move-result-object v2

    .line 108
    new-instance v3, Lcom/momo/rtcbase/VideoCanvas;

    .line 109
    .line 110
    iget v4, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a;->a:I

    .line 111
    .line 112
    invoke-direct {v3, v5, v1, v4}, Lcom/momo/rtcbase/VideoCanvas;-><init>(Landroid/view/SurfaceView;II)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {v2, v3}, Lcom/momo/momortc/MMRtcEngine;->setupRemoteVideo(Lcom/momo/rtcbase/VideoCanvas;)I

    .line 116
    .line 117
    .line 118
    :cond_1
    iget-object v1, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a;->d:Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;

    .line 119
    .line 120
    iget-object v1, v1, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 121
    .line 122
    invoke-static {v1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->Q2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Z

    .line 123
    .line 124
    .line 125
    move-result v1

    .line 126
    if-nez v1, :cond_2

    .line 127
    .line 128
    iget-object v1, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a;->d:Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;

    .line 129
    .line 130
    iget-object v1, v1, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 131
    .line 132
    invoke-static {v1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->R2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/gkl0;

    .line 133
    .line 134
    .line 135
    move-result-object v1

    .line 136
    if-nez v1, :cond_2

    .line 137
    .line 138
    iget-object v1, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a;->d:Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;

    .line 139
    .line 140
    iget-object v1, v1, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 141
    .line 142
    invoke-static {v1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->T2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/fbl0;

    .line 143
    .line 144
    .line 145
    move-result-object v1

    .line 146
    if-nez v1, :cond_2

    .line 147
    .line 148
    iget-object v1, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a;->d:Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;

    .line 149
    .line 150
    iget-object v1, v1, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 151
    .line 152
    invoke-static {v1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->V2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/ebl0;

    .line 153
    .line 154
    .line 155
    move-result-object v1

    .line 156
    if-eqz v1, :cond_4

    .line 157
    .line 158
    iget-object v1, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a;->d:Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;

    .line 159
    .line 160
    iget-object v1, v1, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 161
    .line 162
    invoke-static {v1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->W2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Z

    .line 163
    .line 164
    .line 165
    move-result v1

    .line 166
    if-nez v1, :cond_4

    .line 167
    .line 168
    iget-object v1, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a;->d:Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;

    .line 169
    .line 170
    iget-object v1, v1, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 171
    .line 172
    invoke-static {v1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->X2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Z

    .line 173
    .line 174
    .line 175
    move-result v1

    .line 176
    if-nez v1, :cond_4

    .line 177
    .line 178
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 179
    .line 180
    .line 181
    move-result-object v1

    .line 182
    const-string v2, "MoMoRtcPushFilter"

    .line 183
    .line 184
    new-instance v3, Ljava/lang/StringBuilder;

    .line 185
    .line 186
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 187
    .line 188
    .line 189
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 190
    .line 191
    .line 192
    move-result-object v4

    .line 193
    invoke-virtual {v4}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object v4

    .line 197
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 198
    .line 199
    .line 200
    const-string v4, "----onVideoChannelAdded: userID="

    .line 201
    .line 202
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 203
    .line 204
    .line 205
    iget v4, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a;->a:I

    .line 206
    .line 207
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 208
    .line 209
    .line 210
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 211
    .line 212
    .line 213
    move-result-object v3

    .line 214
    invoke-virtual {v1, v2, v3}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 215
    .line 216
    .line 217
    iget-object v1, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a;->d:Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;

    .line 218
    .line 219
    iget-object v1, v1, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 220
    .line 221
    invoke-static {v1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->V2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/ebl0;

    .line 222
    .line 223
    .line 224
    move-result-object v2

    .line 225
    iget v1, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a;->a:I

    .line 226
    .line 227
    int-to-long v3, v1

    .line 228
    iget v6, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a;->b:I

    .line 229
    .line 230
    iget v7, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a;->c:I

    .line 231
    .line 232
    invoke-interface/range {v2 .. v7}, Ll/ebl0;->a(JLandroid/view/SurfaceView;II)V

    .line 233
    .line 234
    .line 235
    return-void

    .line 236
    :cond_2
    iget-object v1, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a;->d:Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;

    .line 237
    .line 238
    iget-object v1, v1, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 239
    .line 240
    invoke-static {v1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->Y2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 241
    .line 242
    .line 243
    move-result-object v1

    .line 244
    iget v2, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a;->a:I

    .line 245
    .line 246
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 247
    .line 248
    .line 249
    move-result-object v2

    .line 250
    invoke-virtual {v1, v2}, Ljava/util/AbstractMap;->containsKey(Ljava/lang/Object;)Z

    .line 251
    .line 252
    .line 253
    move-result v1

    .line 254
    if-nez v1, :cond_4

    .line 255
    .line 256
    iget-object v1, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a;->d:Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;

    .line 257
    .line 258
    iget-object v1, v1, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 259
    .line 260
    invoke-static {v1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->Y2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 261
    .line 262
    .line 263
    move-result-object v1

    .line 264
    iget v2, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a;->a:I

    .line 265
    .line 266
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 267
    .line 268
    .line 269
    move-result-object v2

    .line 270
    iget v3, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a;->a:I

    .line 271
    .line 272
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 273
    .line 274
    .line 275
    move-result-object v3

    .line 276
    invoke-virtual {v1, v2, v3}, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 277
    .line 278
    .line 279
    iget-object v1, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a;->d:Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;

    .line 280
    .line 281
    iget-object v1, v1, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 282
    .line 283
    invoke-static {v1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->R2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/gkl0;

    .line 284
    .line 285
    .line 286
    move-result-object v1

    .line 287
    if-eqz v1, :cond_3

    .line 288
    .line 289
    iget-object v1, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a;->d:Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;

    .line 290
    .line 291
    iget-object v1, v1, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 292
    .line 293
    invoke-static {v1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->R2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/gkl0;

    .line 294
    .line 295
    .line 296
    move-result-object v6

    .line 297
    iget v1, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a;->a:I

    .line 298
    .line 299
    int-to-long v7, v1

    .line 300
    new-instance v9, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a$b;

    .line 301
    .line 302
    invoke-direct {v9, v0, v5}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a$b;-><init>(Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a;Lcom/momo/rtcbase/SurfaceViewRenderer;)V

    .line 303
    .line 304
    .line 305
    iget v10, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a;->b:I

    .line 306
    .line 307
    iget v11, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a;->c:I

    .line 308
    .line 309
    invoke-interface/range {v6 .. v11}, Ll/gkl0;->a(JLl/gkl0$c;II)V

    .line 310
    .line 311
    .line 312
    return-void

    .line 313
    :cond_3
    new-instance v3, Ll/sti0;

    .line 314
    .line 315
    iget v1, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a;->a:I

    .line 316
    .line 317
    int-to-long v13, v1

    .line 318
    iget v15, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a;->b:I

    .line 319
    .line 320
    iget v1, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a;->c:I

    .line 321
    .line 322
    new-instance v2, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a$c;

    .line 323
    .line 324
    invoke-direct {v2, v0, v5}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a$c;-><init>(Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a;Lcom/momo/rtcbase/SurfaceViewRenderer;)V

    .line 325
    .line 326
    .line 327
    move/from16 v16, v1

    .line 328
    .line 329
    move-object/from16 v17, v2

    .line 330
    .line 331
    move-object v12, v3

    .line 332
    invoke-direct/range {v12 .. v17}, Ll/sti0;-><init>(JIILl/gkl0$c;)V

    .line 333
    .line 334
    .line 335
    iget-object v1, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a;->d:Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;

    .line 336
    .line 337
    iget-object v1, v1, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 338
    .line 339
    invoke-static {v1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->T2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/fbl0;

    .line 340
    .line 341
    .line 342
    move-result-object v1

    .line 343
    if-eqz v1, :cond_4

    .line 344
    .line 345
    iget-object v1, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a;->d:Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;

    .line 346
    .line 347
    iget-object v1, v1, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 348
    .line 349
    invoke-static {v1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->W2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Z

    .line 350
    .line 351
    .line 352
    move-result v1

    .line 353
    if-nez v1, :cond_4

    .line 354
    .line 355
    iget-object v1, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a;->d:Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;

    .line 356
    .line 357
    iget-object v1, v1, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 358
    .line 359
    invoke-static {v1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->X2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Z

    .line 360
    .line 361
    .line 362
    move-result v1

    .line 363
    if-nez v1, :cond_4

    .line 364
    .line 365
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 366
    .line 367
    .line 368
    move-result-object v1

    .line 369
    const-string v2, "MoMoRtcPushFilter"

    .line 370
    .line 371
    new-instance v4, Ljava/lang/StringBuilder;

    .line 372
    .line 373
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 374
    .line 375
    .line 376
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 377
    .line 378
    .line 379
    move-result-object v5

    .line 380
    invoke-virtual {v5}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 381
    .line 382
    .line 383
    move-result-object v5

    .line 384
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 385
    .line 386
    .line 387
    const-string v5, "----onVideoChannelAddedExt: userID="

    .line 388
    .line 389
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 390
    .line 391
    .line 392
    iget v5, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a;->a:I

    .line 393
    .line 394
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 395
    .line 396
    .line 397
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 398
    .line 399
    .line 400
    move-result-object v4

    .line 401
    invoke-virtual {v1, v2, v4}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 402
    .line 403
    .line 404
    iget-object v1, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a;->d:Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;

    .line 405
    .line 406
    iget-object v1, v1, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 407
    .line 408
    invoke-static {v1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->T2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/fbl0;

    .line 409
    .line 410
    .line 411
    move-result-object v1

    .line 412
    iget v2, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a;->a:I

    .line 413
    .line 414
    int-to-long v4, v2

    .line 415
    move-wide/from16 v18, v4

    .line 416
    .line 417
    move-object v5, v1

    .line 418
    move-wide/from16 v1, v18

    .line 419
    .line 420
    iget v4, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a;->b:I

    .line 421
    .line 422
    iget v0, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a;->c:I

    .line 423
    .line 424
    move-object/from16 v18, v5

    .line 425
    .line 426
    move v5, v0

    .line 427
    move-object/from16 v0, v18

    .line 428
    .line 429
    invoke-interface/range {v0 .. v5}, Ll/fbl0;->a(JLl/sti0;II)V

    .line 430
    .line 431
    .line 432
    :cond_4
    return-void

    .line 433
    :catchall_0
    move-exception v0

    .line 434
    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 435
    throw v0
.end method
