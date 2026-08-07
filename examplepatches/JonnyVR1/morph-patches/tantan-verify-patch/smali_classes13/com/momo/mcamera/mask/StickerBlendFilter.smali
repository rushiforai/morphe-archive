.class public Lcom/momo/mcamera/mask/StickerBlendFilter;
.super Ll/ogk;
.source "SourceFile"

# interfaces
.implements Ll/gam;
.implements Ll/suf;
.implements Lcom/momo/mcamera/mask/StickerAdjustFilter$IOrderable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/mcamera/mask/StickerBlendFilter$StickerStateChangeListener;,
        Lcom/momo/mcamera/mask/StickerBlendFilter$StickerMaskFinishListener;
    }
.end annotation


# instance fields
.field private coll:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List;",
            ">;"
        }
    .end annotation
.end field

.field public finishListener:Lcom/momo/mcamera/mask/StickerBlendFilter$StickerMaskFinishListener;

.field private hasShowed:Z

.field private hasShowedThisTrigger:Z

.field private hiddenFrameCount:I

.field private isClearsFaceArea:Z

.field public isFixedFilter:Z

.field private isHiddenFrame:Z

.field private isPlaying:Z

.field private lastShouldShow:Z

.field public mStickerDuration:J

.field private needPlayLoop:Z

.field segmentFilter:Lcom/momo/mcamera/mask/segment/AbsSegmentFilter;

.field sobelFilter:Lcom/momo/mcamera/mask/SobelFilter;

.field startTime:J

.field public sticker:Lcom/momo/mcamera/mask/Sticker;

.field stickerMaskFilter:Lcom/momo/mcamera/mask/FaceDetectFilter;

.field public stickerStateChangeListener:Lcom/momo/mcamera/mask/StickerBlendFilter$StickerStateChangeListener;

.field triggerBlendFilter:Lcom/momo/mcamera/mask/TriggerBlendFilter;


# direct methods
.method public constructor <init>(Ll/jt2;Lcom/momo/mcamera/mask/Sticker;)V
    .locals 10

    .line 1
    invoke-direct {p0}, Ll/ogk;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, -0x1

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->mStickerDuration:J

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    iput-boolean v2, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->hasShowed:Z

    .line 10
    .line 11
    iput-wide v0, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->startTime:J

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->lastShouldShow:Z

    .line 15
    .line 16
    new-instance v1, Ljava/util/HashMap;

    .line 17
    .line 18
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object v1, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->coll:Ljava/util/Map;

    .line 22
    .line 23
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->needPlayLoop:Z

    .line 24
    .line 25
    iput-boolean v2, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->isClearsFaceArea:Z

    .line 26
    .line 27
    iput-object p2, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 28
    .line 29
    invoke-virtual {p2}, Lcom/momo/mcamera/mask/Sticker;->isClearsFaceArea()Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->isClearsFaceArea:Z

    .line 34
    .line 35
    invoke-virtual {p2}, Lcom/momo/mcamera/mask/Sticker;->isClearsBodyArea()Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    invoke-virtual {p2}, Lcom/momo/mcamera/mask/Sticker;->getStrokeColor()[F

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    if-eqz v3, :cond_0

    .line 44
    .line 45
    move v3, v0

    .line 46
    goto :goto_0

    .line 47
    :cond_0
    move v3, v2

    .line 48
    :goto_0
    const/4 v4, 0x3

    .line 49
    const/4 v5, 0x2

    .line 50
    if-eqz v1, :cond_2

    .line 51
    .line 52
    if-eqz v3, :cond_1

    .line 53
    .line 54
    const/4 v6, 0x4

    .line 55
    goto :goto_1

    .line 56
    :cond_1
    move v6, v4

    .line 57
    goto :goto_1

    .line 58
    :cond_2
    move v6, v5

    .line 59
    :goto_1
    invoke-virtual {p2}, Lcom/momo/mcamera/mask/Sticker;->getStickerType()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v7

    .line 63
    instance-of v8, p1, Lcom/momo/mcamera/mask/FaceDetectFilter;

    .line 64
    .line 65
    if-eqz v8, :cond_3

    .line 66
    .line 67
    move-object v8, p1

    .line 68
    check-cast v8, Lcom/momo/mcamera/mask/FaceDetectFilter;

    .line 69
    .line 70
    iput-object v8, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->stickerMaskFilter:Lcom/momo/mcamera/mask/FaceDetectFilter;

    .line 71
    .line 72
    :cond_3
    new-instance v8, Lcom/momo/mcamera/mask/NormalFilter;

    .line 73
    .line 74
    invoke-direct {v8}, Lcom/momo/mcamera/mask/NormalFilter;-><init>()V

    .line 75
    .line 76
    .line 77
    const-string v9, "FACE_MASK_TYPE"

    .line 78
    .line 79
    invoke-virtual {v9, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    move-result v7

    .line 83
    if-eqz v7, :cond_5

    .line 84
    .line 85
    iget-object v6, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 86
    .line 87
    invoke-virtual {v6}, Lcom/momo/mcamera/mask/Sticker;->isComic()Z

    .line 88
    .line 89
    .line 90
    move-result v6

    .line 91
    if-eqz v6, :cond_4

    .line 92
    .line 93
    new-instance v6, Lcom/momo/mcamera/mask/TriggerBlendFilter;

    .line 94
    .line 95
    invoke-direct {v6}, Lcom/momo/mcamera/mask/TriggerBlendFilter;-><init>()V

    .line 96
    .line 97
    .line 98
    iput-object v6, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->triggerBlendFilter:Lcom/momo/mcamera/mask/TriggerBlendFilter;

    .line 99
    .line 100
    goto :goto_2

    .line 101
    :cond_4
    new-instance v6, Lcom/momo/mcamera/mask/MultiplyMaskBlendFilter;

    .line 102
    .line 103
    invoke-direct {v6}, Lcom/momo/mcamera/mask/MultiplyMaskBlendFilter;-><init>()V

    .line 104
    .line 105
    .line 106
    iput-object v6, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->triggerBlendFilter:Lcom/momo/mcamera/mask/TriggerBlendFilter;

    .line 107
    .line 108
    goto :goto_2

    .line 109
    :cond_5
    invoke-virtual {p2}, Lcom/momo/mcamera/mask/Sticker;->getLayerType()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v7

    .line 113
    if-eqz v7, :cond_6

    .line 114
    .line 115
    invoke-virtual {p2}, Lcom/momo/mcamera/mask/Sticker;->getLayerType()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v7

    .line 119
    const-string v9, "3d"

    .line 120
    .line 121
    invoke-virtual {v7, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 122
    .line 123
    .line 124
    move-result v7

    .line 125
    if-eqz v7, :cond_6

    .line 126
    .line 127
    new-instance v7, Lcom/momo/mcamera/mask/XEngineBlendFilter;

    .line 128
    .line 129
    invoke-direct {v7, v6}, Lcom/momo/mcamera/mask/XEngineBlendFilter;-><init>(I)V

    .line 130
    .line 131
    .line 132
    iput-object v7, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->triggerBlendFilter:Lcom/momo/mcamera/mask/TriggerBlendFilter;

    .line 133
    .line 134
    invoke-virtual {v7, v1}, Lcom/momo/mcamera/mask/TriggerBlendFilter;->setSegmentBody(Z)V

    .line 135
    .line 136
    .line 137
    iget-boolean v6, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->isClearsFaceArea:Z

    .line 138
    .line 139
    if-eqz v6, :cond_8

    .line 140
    .line 141
    iget-object v6, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->triggerBlendFilter:Lcom/momo/mcamera/mask/TriggerBlendFilter;

    .line 142
    .line 143
    invoke-virtual {v6, v5}, Lcom/momo/mcamera/mask/TriggerBlendFilter;->setBlend(I)V

    .line 144
    .line 145
    .line 146
    goto :goto_2

    .line 147
    :cond_6
    invoke-virtual {p2}, Lcom/momo/mcamera/mask/Sticker;->getLayerType()Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object v7

    .line 151
    if-eqz v7, :cond_7

    .line 152
    .line 153
    invoke-virtual {p2}, Lcom/momo/mcamera/mask/Sticker;->getLayerType()Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v7

    .line 157
    const-string v9, "fault"

    .line 158
    .line 159
    invoke-virtual {v7, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 160
    .line 161
    .line 162
    move-result v7

    .line 163
    if-eqz v7, :cond_7

    .line 164
    .line 165
    new-instance v6, Lcom/momo/mcamera/mask/ArtifactframeFilter;

    .line 166
    .line 167
    invoke-direct {v6}, Lcom/momo/mcamera/mask/ArtifactframeFilter;-><init>()V

    .line 168
    .line 169
    .line 170
    iput-object v6, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->triggerBlendFilter:Lcom/momo/mcamera/mask/TriggerBlendFilter;

    .line 171
    .line 172
    iget-object v6, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 173
    .line 174
    invoke-direct {p0, v6}, Lcom/momo/mcamera/mask/StickerBlendFilter;->ProcessFaultInfo(Lcom/momo/mcamera/mask/Sticker;)V

    .line 175
    .line 176
    .line 177
    goto :goto_2

    .line 178
    :cond_7
    new-instance v7, Lcom/momo/mcamera/mask/TriggerBlendFilter;

    .line 179
    .line 180
    invoke-direct {v7, v6}, Lcom/momo/mcamera/mask/TriggerBlendFilter;-><init>(I)V

    .line 181
    .line 182
    .line 183
    iput-object v7, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->triggerBlendFilter:Lcom/momo/mcamera/mask/TriggerBlendFilter;

    .line 184
    .line 185
    invoke-virtual {v7, v1}, Lcom/momo/mcamera/mask/TriggerBlendFilter;->setSegmentBody(Z)V

    .line 186
    .line 187
    .line 188
    invoke-virtual {p2}, Lcom/momo/mcamera/mask/Sticker;->getBlendMode()Lcom/momo/mcamera/mask/Sticker$BlendMode;

    .line 189
    .line 190
    .line 191
    move-result-object v6

    .line 192
    if-eqz v6, :cond_8

    .line 193
    .line 194
    iget-object v6, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->triggerBlendFilter:Lcom/momo/mcamera/mask/TriggerBlendFilter;

    .line 195
    .line 196
    invoke-virtual {p2}, Lcom/momo/mcamera/mask/Sticker;->getBlendMode()Lcom/momo/mcamera/mask/Sticker$BlendMode;

    .line 197
    .line 198
    .line 199
    move-result-object v7

    .line 200
    iget-object v7, v7, Lcom/momo/mcamera/mask/Sticker$BlendMode;->name:Ljava/lang/String;

    .line 201
    .line 202
    invoke-virtual {v6, v7}, Lcom/momo/mcamera/mask/TriggerBlendFilter;->setBlendType(Ljava/lang/String;)V

    .line 203
    .line 204
    .line 205
    :cond_8
    :goto_2
    iget-object v6, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->triggerBlendFilter:Lcom/momo/mcamera/mask/TriggerBlendFilter;

    .line 206
    .line 207
    invoke-virtual {v8, v6}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 208
    .line 209
    .line 210
    iget-object v6, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->triggerBlendFilter:Lcom/momo/mcamera/mask/TriggerBlendFilter;

    .line 211
    .line 212
    invoke-virtual {p1, v6}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 213
    .line 214
    .line 215
    if-eqz v1, :cond_9

    .line 216
    .line 217
    invoke-virtual {p2}, Lcom/momo/mcamera/mask/Sticker;->getSegmentType()Ljava/lang/String;

    .line 218
    .line 219
    .line 220
    move-result-object p2

    .line 221
    invoke-static {p2}, Lcom/momo/mcamera/mask/segment/SegmentFilterFactory;->createSegmentFilter(Ljava/lang/String;)Lcom/momo/mcamera/mask/segment/AbsSegmentFilter;

    .line 222
    .line 223
    .line 224
    move-result-object p2

    .line 225
    iput-object p2, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->segmentFilter:Lcom/momo/mcamera/mask/segment/AbsSegmentFilter;

    .line 226
    .line 227
    iget-object v6, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->triggerBlendFilter:Lcom/momo/mcamera/mask/TriggerBlendFilter;

    .line 228
    .line 229
    invoke-virtual {p2, v6}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 230
    .line 231
    .line 232
    if-eqz v3, :cond_9

    .line 233
    .line 234
    new-instance p2, Lcom/momo/mcamera/mask/SobelFilter;

    .line 235
    .line 236
    invoke-direct {p2}, Lcom/momo/mcamera/mask/SobelFilter;-><init>()V

    .line 237
    .line 238
    .line 239
    iput-object p2, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->sobelFilter:Lcom/momo/mcamera/mask/SobelFilter;

    .line 240
    .line 241
    iget-object v3, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->segmentFilter:Lcom/momo/mcamera/mask/segment/AbsSegmentFilter;

    .line 242
    .line 243
    invoke-virtual {v3, p2}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 244
    .line 245
    .line 246
    iget-object p2, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->sobelFilter:Lcom/momo/mcamera/mask/SobelFilter;

    .line 247
    .line 248
    iget-object v3, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->triggerBlendFilter:Lcom/momo/mcamera/mask/TriggerBlendFilter;

    .line 249
    .line 250
    invoke-virtual {p2, v3}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 251
    .line 252
    .line 253
    :cond_9
    iget-object p2, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->triggerBlendFilter:Lcom/momo/mcamera/mask/TriggerBlendFilter;

    .line 254
    .line 255
    invoke-virtual {p2, v8, v2}, Ll/hs10;->registerFilterLocation(Ll/gfj;I)V

    .line 256
    .line 257
    .line 258
    iget-object p2, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->triggerBlendFilter:Lcom/momo/mcamera/mask/TriggerBlendFilter;

    .line 259
    .line 260
    invoke-virtual {p2, p1, v0}, Ll/hs10;->registerFilterLocation(Ll/gfj;I)V

    .line 261
    .line 262
    .line 263
    if-eqz v1, :cond_a

    .line 264
    .line 265
    iget-object p2, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->triggerBlendFilter:Lcom/momo/mcamera/mask/TriggerBlendFilter;

    .line 266
    .line 267
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->segmentFilter:Lcom/momo/mcamera/mask/segment/AbsSegmentFilter;

    .line 268
    .line 269
    invoke-virtual {p2, v0, v5}, Ll/hs10;->registerFilterLocation(Ll/gfj;I)V

    .line 270
    .line 271
    .line 272
    iget-object p2, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->triggerBlendFilter:Lcom/momo/mcamera/mask/TriggerBlendFilter;

    .line 273
    .line 274
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->sobelFilter:Lcom/momo/mcamera/mask/SobelFilter;

    .line 275
    .line 276
    invoke-virtual {p2, v0, v4}, Ll/hs10;->registerFilterLocation(Ll/gfj;I)V

    .line 277
    .line 278
    .line 279
    :cond_a
    iget-object p2, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->triggerBlendFilter:Lcom/momo/mcamera/mask/TriggerBlendFilter;

    .line 280
    .line 281
    invoke-virtual {p2, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 282
    .line 283
    .line 284
    invoke-virtual {p0, v8}, Ll/ogk;->registerInitialFilter(Ll/jt2;)V

    .line 285
    .line 286
    .line 287
    invoke-virtual {p0, p1}, Ll/ogk;->registerInitialFilter(Ll/jt2;)V

    .line 288
    .line 289
    .line 290
    if-eqz v1, :cond_b

    .line 291
    .line 292
    iget-object p1, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->segmentFilter:Lcom/momo/mcamera/mask/segment/AbsSegmentFilter;

    .line 293
    .line 294
    invoke-virtual {p0, p1}, Ll/ogk;->registerInitialFilter(Ll/jt2;)V

    .line 295
    .line 296
    .line 297
    :cond_b
    iget-object p1, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->triggerBlendFilter:Lcom/momo/mcamera/mask/TriggerBlendFilter;

    .line 298
    .line 299
    invoke-virtual {p0, p1}, Ll/ogk;->registerTerminalFilter(Ll/jt2;)V

    .line 300
    .line 301
    .line 302
    return-void
.end method

.method private ProcessFaultInfo(Lcom/momo/mcamera/mask/Sticker;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->coll:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/Map;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->coll:Ljava/util/Map;

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->coll:Ljava/util/Map;

    .line 18
    .line 19
    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 20
    .line 21
    .line 22
    :cond_0
    new-instance v0, Ljava/io/File;

    .line 23
    .line 24
    new-instance v1, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getImageFolderPath()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string p1, "/fault.txt"

    .line 37
    .line 38
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    if-eqz p1, :cond_3

    .line 53
    .line 54
    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    if-eqz p1, :cond_3

    .line 59
    .line 60
    :try_start_0
    new-instance p1, Ljava/io/FileInputStream;

    .line 61
    .line 62
    invoke-direct {p1, v0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 63
    .line 64
    .line 65
    new-instance v0, Ljava/io/InputStreamReader;

    .line 66
    .line 67
    invoke-direct {v0, p1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 68
    .line 69
    .line 70
    new-instance v1, Ljava/io/BufferedReader;

    .line 71
    .line 72
    invoke-direct {v1, v0}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 73
    .line 74
    .line 75
    :cond_1
    :goto_0
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    if-eqz v0, :cond_2

    .line 80
    .line 81
    const-string v2, ""

    .line 82
    .line 83
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    move-result v2

    .line 87
    if-nez v2, :cond_1

    .line 88
    .line 89
    new-instance v2, Ljava/util/ArrayList;

    .line 90
    .line 91
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 92
    .line 93
    .line 94
    const-string v3, " "

    .line 95
    .line 96
    invoke-virtual {v0, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    const/4 v3, 0x1

    .line 101
    aget-object v3, v0, v3

    .line 102
    .line 103
    invoke-static {v3}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 104
    .line 105
    .line 106
    move-result v3

    .line 107
    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 108
    .line 109
    .line 110
    move-result-object v3

    .line 111
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    const/4 v3, 0x2

    .line 115
    aget-object v3, v0, v3

    .line 116
    .line 117
    invoke-static {v3}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 118
    .line 119
    .line 120
    move-result v3

    .line 121
    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 122
    .line 123
    .line 124
    move-result-object v3

    .line 125
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 126
    .line 127
    .line 128
    iget-object v3, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->coll:Ljava/util/Map;

    .line 129
    .line 130
    const/4 v4, 0x0

    .line 131
    aget-object v0, v0, v4

    .line 132
    .line 133
    invoke-interface {v3, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    goto :goto_0

    .line 137
    :cond_2
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 138
    .line 139
    .line 140
    :catch_0
    :cond_3
    return-void
.end method

.method private resumeDisplay()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->stickerMaskFilter:Lcom/momo/mcamera/mask/FaceDetectFilter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/FaceDetectFilter;->resumeBitmapCache()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-boolean v0, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->isClearsFaceArea:Z

    .line 9
    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->triggerBlendFilter:Lcom/momo/mcamera/mask/TriggerBlendFilter;

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    invoke-virtual {v0, v1}, Lcom/momo/mcamera/mask/TriggerBlendFilter;->setBlend(Z)V

    .line 16
    .line 17
    .line 18
    :cond_1
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/StickerBlendFilter;->startPlay()V

    .line 19
    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public cancelDraw()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->stickerMaskFilter:Lcom/momo/mcamera/mask/FaceDetectFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/FaceDetectFilter;->cancelDraw()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public clearPoints()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->stickerMaskFilter:Lcom/momo/mcamera/mask/FaceDetectFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/FaceDetectFilter;->clearPoints()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public destroy()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/ogk;->destroy()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/StickerBlendFilter;->cancelDraw()V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-object v0, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->finishListener:Lcom/momo/mcamera/mask/StickerBlendFilter$StickerMaskFinishListener;

    .line 9
    .line 10
    return-void
.end method

.method public getEscapedTime()J
    .locals 4

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->startTime:J

    .line 6
    .line 7
    sub-long/2addr v0, v2

    .line 8
    iget-wide v2, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->mStickerDuration:J

    .line 9
    .line 10
    cmp-long v0, v0, v2

    .line 11
    .line 12
    if-ltz v0, :cond_0

    .line 13
    .line 14
    return-wide v2

    .line 15
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 16
    .line 17
    .line 18
    move-result-wide v0

    .line 19
    iget-wide v2, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->startTime:J

    .line 20
    .line 21
    sub-long/2addr v0, v2

    .line 22
    return-wide v0
.end method

.method public getOrderedIndex()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/Sticker;->getOrderedIndex()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public lockTexture()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->stickerMaskFilter:Lcom/momo/mcamera/mask/FaceDetectFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/FaceDetectFilter;->lockTexture()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public newTextureReady(ILl/gfj;Z)V
    .locals 2

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/ogk;->newTextureReady(ILl/gfj;Z)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->triggerBlendFilter:Lcom/momo/mcamera/mask/TriggerBlendFilter;

    .line 5
    .line 6
    instance-of p1, p1, Lcom/momo/mcamera/mask/ArtifactframeFilter;

    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    iget-object p1, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->stickerMaskFilter:Lcom/momo/mcamera/mask/FaceDetectFilter;

    .line 11
    .line 12
    check-cast p1, Lcom/momo/mcamera/mask/StickerMaskFilter;

    .line 13
    .line 14
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/StickerMaskFilter;->getImagePathName()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    iget-object p1, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->stickerMaskFilter:Lcom/momo/mcamera/mask/FaceDetectFilter;

    .line 21
    .line 22
    check-cast p1, Lcom/momo/mcamera/mask/StickerMaskFilter;

    .line 23
    .line 24
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/StickerMaskFilter;->getImagePathName()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    const-string p2, "/"

    .line 29
    .line 30
    invoke-virtual {p1, p2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    iget-object p2, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->coll:Ljava/util/Map;

    .line 35
    .line 36
    array-length p3, p1

    .line 37
    const/4 v0, 0x1

    .line 38
    sub-int/2addr p3, v0

    .line 39
    aget-object p3, p1, p3

    .line 40
    .line 41
    invoke-interface {p2, p3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result p2

    .line 45
    if-eqz p2, :cond_0

    .line 46
    .line 47
    iget-object p2, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->triggerBlendFilter:Lcom/momo/mcamera/mask/TriggerBlendFilter;

    .line 48
    .line 49
    check-cast p2, Lcom/momo/mcamera/mask/ArtifactframeFilter;

    .line 50
    .line 51
    iget-object p3, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->coll:Ljava/util/Map;

    .line 52
    .line 53
    array-length v1, p1

    .line 54
    sub-int/2addr v1, v0

    .line 55
    aget-object v1, p1, v1

    .line 56
    .line 57
    invoke-interface {p3, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object p3

    .line 61
    check-cast p3, Ljava/util/List;

    .line 62
    .line 63
    const/4 v1, 0x0

    .line 64
    invoke-interface {p3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object p3

    .line 68
    check-cast p3, Ljava/lang/Float;

    .line 69
    .line 70
    invoke-virtual {p3}, Ljava/lang/Float;->floatValue()F

    .line 71
    .line 72
    .line 73
    move-result p3

    .line 74
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->coll:Ljava/util/Map;

    .line 75
    .line 76
    array-length v1, p1

    .line 77
    sub-int/2addr v1, v0

    .line 78
    aget-object p1, p1, v1

    .line 79
    .line 80
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    check-cast p0, Ljava/util/List;

    .line 85
    .line 86
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    check-cast p0, Ljava/lang/Float;

    .line 91
    .line 92
    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    .line 93
    .line 94
    .line 95
    move-result p0

    .line 96
    invoke-virtual {p2, p3, p0}, Lcom/momo/mcamera/mask/ArtifactframeFilter;->setFaultInfo(FF)V

    .line 97
    .line 98
    .line 99
    :cond_0
    return-void
.end method

.method public pauseBitmapCache()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->stickerMaskFilter:Lcom/momo/mcamera/mask/FaceDetectFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/FaceDetectFilter;->pauseBitmapCache()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public releaseFrameBuffer()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/ogk;->releaseFrameBuffer()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/StickerBlendFilter;->cancelDraw()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public resetSticker(Lcom/momo/mcamera/mask/Sticker;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/gfj;->getLockObject()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    monitor-enter v0

    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/StickerBlendFilter;->clearPoints()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 10
    .line 11
    iget-object v1, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->stickerMaskFilter:Lcom/momo/mcamera/mask/FaceDetectFilter;

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-virtual {v1, p1}, Lcom/momo/mcamera/mask/FaceDetectFilter;->resetSticker(Lcom/momo/mcamera/mask/Sticker;)V

    .line 16
    .line 17
    .line 18
    const-wide/16 v1, -0x1

    .line 19
    .line 20
    iput-wide v1, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->startTime:J

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :catchall_0
    move-exception p0

    .line 24
    goto :goto_1

    .line 25
    :cond_0
    :goto_0
    monitor-exit v0

    .line 26
    return-void

    .line 27
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    throw p0
.end method

.method public resumeBitmapCache()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->stickerMaskFilter:Lcom/momo/mcamera/mask/FaceDetectFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/FaceDetectFilter;->resumeBitmapCache()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setDetectParam(Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V
    .locals 6

    .line 1
    iget-object v0, p1, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->filterTrigerManager:Lcom/momo/mcamera/mask/FilterTriggerManager;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 7
    .line 8
    iget-object v3, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->stickerStateChangeListener:Lcom/momo/mcamera/mask/StickerBlendFilter$StickerStateChangeListener;

    .line 9
    .line 10
    invoke-virtual {v0, v2, v3}, Lcom/momo/mcamera/mask/FilterTriggerManager;->triggerTypeProcess(Lcom/momo/mcamera/mask/Sticker;Lcom/momo/mcamera/mask/StickerBlendFilter$StickerStateChangeListener;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    move v0, v1

    .line 16
    :goto_0
    const/4 v2, 0x0

    .line 17
    if-eqz v0, :cond_2

    .line 18
    .line 19
    iget-object v3, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 20
    .line 21
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/Sticker;->getObjectTriggerType()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    if-eqz v3, :cond_1

    .line 30
    .line 31
    iget-object v3, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 32
    .line 33
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/Sticker;->getHiddenObjectTriggerType()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    if-nez v3, :cond_2

    .line 42
    .line 43
    :cond_1
    iget-object v0, p1, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->filterTrigerManager:Lcom/momo/mcamera/mask/FilterTriggerManager;

    .line 44
    .line 45
    iget-object v3, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 46
    .line 47
    invoke-virtual {v0, v3, p1, v2}, Lcom/momo/mcamera/mask/FilterTriggerManager;->objectTriggerTypeProcess(Lcom/momo/mcamera/mask/Sticker;Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;Z)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    :cond_2
    iget-object v3, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 52
    .line 53
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/Sticker;->getMinHiddenFrameCount()I

    .line 54
    .line 55
    .line 56
    move-result v3

    .line 57
    if-lez v3, :cond_6

    .line 58
    .line 59
    iget-object v3, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 60
    .line 61
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/Sticker;->getHiddenTriggerType()I

    .line 62
    .line 63
    .line 64
    move-result v3

    .line 65
    if-gtz v3, :cond_3

    .line 66
    .line 67
    iget-object v3, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 68
    .line 69
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/Sticker;->getHiddenObjectTriggerType()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 74
    .line 75
    .line 76
    move-result v3

    .line 77
    if-nez v3, :cond_6

    .line 78
    .line 79
    :cond_3
    if-nez v0, :cond_4

    .line 80
    .line 81
    iget-boolean v3, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->lastShouldShow:Z

    .line 82
    .line 83
    if-eqz v3, :cond_4

    .line 84
    .line 85
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->isHiddenFrame:Z

    .line 86
    .line 87
    :cond_4
    iget-boolean v3, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->isHiddenFrame:Z

    .line 88
    .line 89
    if-eqz v3, :cond_6

    .line 90
    .line 91
    iget-object v3, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 92
    .line 93
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/Sticker;->getMinHiddenFrameCount()I

    .line 94
    .line 95
    .line 96
    move-result v3

    .line 97
    if-lez v3, :cond_5

    .line 98
    .line 99
    iget v3, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->hiddenFrameCount:I

    .line 100
    .line 101
    iget-object v4, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 102
    .line 103
    invoke-virtual {v4}, Lcom/momo/mcamera/mask/Sticker;->getMinHiddenFrameCount()I

    .line 104
    .line 105
    .line 106
    move-result v4

    .line 107
    add-int/lit8 v4, v4, 0x2

    .line 108
    .line 109
    if-le v3, v4, :cond_5

    .line 110
    .line 111
    iput v2, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->hiddenFrameCount:I

    .line 112
    .line 113
    iput-boolean v2, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->isHiddenFrame:Z

    .line 114
    .line 115
    :cond_5
    iget-boolean v3, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->isHiddenFrame:Z

    .line 116
    .line 117
    if-eqz v3, :cond_6

    .line 118
    .line 119
    iget v3, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->hiddenFrameCount:I

    .line 120
    .line 121
    add-int/2addr v3, v1

    .line 122
    iput v3, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->hiddenFrameCount:I

    .line 123
    .line 124
    move v3, v2

    .line 125
    goto :goto_1

    .line 126
    :cond_6
    move v3, v0

    .line 127
    :goto_1
    iget-boolean v4, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->hasShowedThisTrigger:Z

    .line 128
    .line 129
    if-eqz v4, :cond_8

    .line 130
    .line 131
    iget-object v4, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 132
    .line 133
    invoke-virtual {v4}, Lcom/momo/mcamera/mask/Sticker;->isNotHiddenAfterTrigger()Z

    .line 134
    .line 135
    .line 136
    move-result v4

    .line 137
    if-nez v4, :cond_7

    .line 138
    .line 139
    iget-object v4, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 140
    .line 141
    invoke-virtual {v4}, Lcom/momo/mcamera/mask/Sticker;->getLoopStart()I

    .line 142
    .line 143
    .line 144
    move-result v4

    .line 145
    if-lez v4, :cond_8

    .line 146
    .line 147
    iget-object v4, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 148
    .line 149
    invoke-virtual {v4}, Lcom/momo/mcamera/mask/Sticker;->isAlwaysShow()Z

    .line 150
    .line 151
    .line 152
    move-result v4

    .line 153
    if-eqz v4, :cond_8

    .line 154
    .line 155
    :cond_7
    move v3, v1

    .line 156
    :cond_8
    iget-object v4, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 157
    .line 158
    iget v5, v4, Lcom/momo/mcamera/mask/Sticker;->curIndex:I

    .line 159
    .line 160
    invoke-virtual {v4}, Lcom/momo/mcamera/mask/Sticker;->getFrameNumber()I

    .line 161
    .line 162
    .line 163
    move-result v4

    .line 164
    sub-int/2addr v4, v1

    .line 165
    if-ne v5, v4, :cond_9

    .line 166
    .line 167
    iget-object v4, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 168
    .line 169
    invoke-virtual {v4}, Lcom/momo/mcamera/mask/Sticker;->getLoopStart()I

    .line 170
    .line 171
    .line 172
    move-result v4

    .line 173
    const/4 v5, -0x1

    .line 174
    if-ne v4, v5, :cond_9

    .line 175
    .line 176
    iput-boolean v2, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->needPlayLoop:Z

    .line 177
    .line 178
    :cond_9
    if-eqz v3, :cond_e

    .line 179
    .line 180
    if-eqz v0, :cond_a

    .line 181
    .line 182
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 183
    .line 184
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->isNotHiddenAfterTrigger()Z

    .line 185
    .line 186
    .line 187
    move-result v0

    .line 188
    if-eqz v0, :cond_a

    .line 189
    .line 190
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 191
    .line 192
    iget v4, v0, Lcom/momo/mcamera/mask/Sticker;->curIndex:I

    .line 193
    .line 194
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getFrameNumber()I

    .line 195
    .line 196
    .line 197
    move-result v0

    .line 198
    sub-int/2addr v0, v1

    .line 199
    if-ne v4, v0, :cond_a

    .line 200
    .line 201
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 202
    .line 203
    iput v2, v0, Lcom/momo/mcamera/mask/Sticker;->curIndex:I

    .line 204
    .line 205
    :cond_a
    iget-boolean v0, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->needPlayLoop:Z

    .line 206
    .line 207
    if-nez v0, :cond_b

    .line 208
    .line 209
    goto/16 :goto_4

    .line 210
    .line 211
    :cond_b
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->stickerMaskFilter:Lcom/momo/mcamera/mask/FaceDetectFilter;

    .line 212
    .line 213
    if-eqz v0, :cond_c

    .line 214
    .line 215
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/FaceDetectFilter;->resumeBitmapCache()V

    .line 216
    .line 217
    .line 218
    :cond_c
    iget-boolean v0, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->isClearsFaceArea:Z

    .line 219
    .line 220
    if-nez v0, :cond_d

    .line 221
    .line 222
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->triggerBlendFilter:Lcom/momo/mcamera/mask/TriggerBlendFilter;

    .line 223
    .line 224
    invoke-virtual {v0, v3}, Lcom/momo/mcamera/mask/TriggerBlendFilter;->setBlend(Z)V

    .line 225
    .line 226
    .line 227
    :cond_d
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->hasShowed:Z

    .line 228
    .line 229
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/StickerBlendFilter;->startPlay()V

    .line 230
    .line 231
    .line 232
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->lastShouldShow:Z

    .line 233
    .line 234
    iput-boolean v2, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->isHiddenFrame:Z

    .line 235
    .line 236
    goto/16 :goto_3

    .line 237
    .line 238
    :cond_e
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 239
    .line 240
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->isNotHiddenAfterTrigger()Z

    .line 241
    .line 242
    .line 243
    move-result v0

    .line 244
    if-eqz v0, :cond_f

    .line 245
    .line 246
    iput-boolean v3, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->lastShouldShow:Z

    .line 247
    .line 248
    :cond_f
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 249
    .line 250
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->isNotHiddenAfterTrigger()Z

    .line 251
    .line 252
    .line 253
    move-result v0

    .line 254
    if-eqz v0, :cond_10

    .line 255
    .line 256
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 257
    .line 258
    iget v4, v0, Lcom/momo/mcamera/mask/Sticker;->curIndex:I

    .line 259
    .line 260
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getFrameNumber()I

    .line 261
    .line 262
    .line 263
    move-result v0

    .line 264
    sub-int/2addr v0, v1

    .line 265
    if-ne v4, v0, :cond_10

    .line 266
    .line 267
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 268
    .line 269
    iget v0, v0, Lcom/momo/mcamera/mask/Sticker;->curIndex:I

    .line 270
    .line 271
    if-lez v0, :cond_10

    .line 272
    .line 273
    invoke-direct {p0}, Lcom/momo/mcamera/mask/StickerBlendFilter;->resumeDisplay()V

    .line 274
    .line 275
    .line 276
    :goto_2
    move v3, v1

    .line 277
    goto :goto_3

    .line 278
    :cond_10
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 279
    .line 280
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->isNoBreakLoop()Z

    .line 281
    .line 282
    .line 283
    move-result v0

    .line 284
    if-eqz v0, :cond_11

    .line 285
    .line 286
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 287
    .line 288
    iget v4, v0, Lcom/momo/mcamera/mask/Sticker;->curIndex:I

    .line 289
    .line 290
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getFrameNumber()I

    .line 291
    .line 292
    .line 293
    move-result v0

    .line 294
    sub-int/2addr v0, v1

    .line 295
    if-ge v4, v0, :cond_11

    .line 296
    .line 297
    iget-boolean v0, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->hasShowed:Z

    .line 298
    .line 299
    if-eqz v0, :cond_11

    .line 300
    .line 301
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 302
    .line 303
    iget v0, v0, Lcom/momo/mcamera/mask/Sticker;->curIndex:I

    .line 304
    .line 305
    if-lez v0, :cond_11

    .line 306
    .line 307
    iget-boolean v0, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->needPlayLoop:Z

    .line 308
    .line 309
    if-eqz v0, :cond_11

    .line 310
    .line 311
    invoke-direct {p0}, Lcom/momo/mcamera/mask/StickerBlendFilter;->resumeDisplay()V

    .line 312
    .line 313
    .line 314
    goto :goto_2

    .line 315
    :cond_11
    iget-boolean v0, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->isClearsFaceArea:Z

    .line 316
    .line 317
    if-nez v0, :cond_12

    .line 318
    .line 319
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->triggerBlendFilter:Lcom/momo/mcamera/mask/TriggerBlendFilter;

    .line 320
    .line 321
    invoke-virtual {v0, v2}, Lcom/momo/mcamera/mask/TriggerBlendFilter;->setBlend(Z)V

    .line 322
    .line 323
    .line 324
    :cond_12
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->stickerMaskFilter:Lcom/momo/mcamera/mask/FaceDetectFilter;

    .line 325
    .line 326
    if-eqz v0, :cond_13

    .line 327
    .line 328
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/FaceDetectFilter;->pauseBitmapCache()V

    .line 329
    .line 330
    .line 331
    :cond_13
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 332
    .line 333
    iget v4, v0, Lcom/momo/mcamera/mask/Sticker;->curIndex:I

    .line 334
    .line 335
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getFrameNumber()I

    .line 336
    .line 337
    .line 338
    move-result v0

    .line 339
    sub-int/2addr v0, v1

    .line 340
    if-ne v4, v0, :cond_15

    .line 341
    .line 342
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 343
    .line 344
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getLoopStart()I

    .line 345
    .line 346
    .line 347
    move-result v0

    .line 348
    if-lez v0, :cond_14

    .line 349
    .line 350
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 351
    .line 352
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->isAlwaysShow()Z

    .line 353
    .line 354
    .line 355
    move-result v0

    .line 356
    if-nez v0, :cond_15

    .line 357
    .line 358
    :cond_14
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 359
    .line 360
    iput v2, v0, Lcom/momo/mcamera/mask/Sticker;->curIndex:I

    .line 361
    .line 362
    :cond_15
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/StickerBlendFilter;->stopPlay()V

    .line 363
    .line 364
    .line 365
    :goto_3
    if-eqz v3, :cond_16

    .line 366
    .line 367
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->hasShowedThisTrigger:Z

    .line 368
    .line 369
    :cond_16
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->stickerStateChangeListener:Lcom/momo/mcamera/mask/StickerBlendFilter$StickerStateChangeListener;

    .line 370
    .line 371
    if-eqz v0, :cond_17

    .line 372
    .line 373
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 374
    .line 375
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getObjectTriggerType()Ljava/lang/String;

    .line 376
    .line 377
    .line 378
    move-result-object v0

    .line 379
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 380
    .line 381
    .line 382
    move-result v0

    .line 383
    if-nez v0, :cond_17

    .line 384
    .line 385
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->stickerStateChangeListener:Lcom/momo/mcamera/mask/StickerBlendFilter$StickerStateChangeListener;

    .line 386
    .line 387
    iget-object v1, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 388
    .line 389
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/Sticker;->getObjectTriggerType()Ljava/lang/String;

    .line 390
    .line 391
    .line 392
    move-result-object v1

    .line 393
    invoke-interface {v0, v1, v3}, Lcom/momo/mcamera/mask/StickerBlendFilter$StickerStateChangeListener;->stickerGestureTypeChanged(Ljava/lang/String;Z)V

    .line 394
    .line 395
    .line 396
    :cond_17
    iget-wide v0, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->mStickerDuration:J

    .line 397
    .line 398
    const-wide/16 v2, -0x1

    .line 399
    .line 400
    cmp-long v0, v0, v2

    .line 401
    .line 402
    if-lez v0, :cond_19

    .line 403
    .line 404
    iget-wide v0, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->startTime:J

    .line 405
    .line 406
    cmp-long v0, v0, v2

    .line 407
    .line 408
    if-eqz v0, :cond_19

    .line 409
    .line 410
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 411
    .line 412
    .line 413
    move-result-wide v0

    .line 414
    iget-wide v4, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->startTime:J

    .line 415
    .line 416
    sub-long/2addr v0, v4

    .line 417
    iget-wide v4, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->mStickerDuration:J

    .line 418
    .line 419
    cmp-long v0, v0, v4

    .line 420
    .line 421
    if-lez v0, :cond_19

    .line 422
    .line 423
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->stickerMaskFilter:Lcom/momo/mcamera/mask/FaceDetectFilter;

    .line 424
    .line 425
    if-eqz v0, :cond_19

    .line 426
    .line 427
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/FaceDetectFilter;->clearPoints()V

    .line 428
    .line 429
    .line 430
    iget-object p1, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->finishListener:Lcom/momo/mcamera/mask/StickerBlendFilter$StickerMaskFinishListener;

    .line 431
    .line 432
    if-eqz p1, :cond_18

    .line 433
    .line 434
    invoke-interface {p1}, Lcom/momo/mcamera/mask/StickerBlendFilter$StickerMaskFinishListener;->stickerRenderFinished()V

    .line 435
    .line 436
    .line 437
    :cond_18
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/StickerBlendFilter;->stopPlay()V

    .line 438
    .line 439
    .line 440
    return-void

    .line 441
    :cond_19
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->stickerMaskFilter:Lcom/momo/mcamera/mask/FaceDetectFilter;

    .line 442
    .line 443
    if-eqz v0, :cond_1a

    .line 444
    .line 445
    invoke-virtual {v0, p1}, Lcom/momo/mcamera/mask/FaceDetectFilter;->setDetectParam(Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V

    .line 446
    .line 447
    .line 448
    :cond_1a
    iget-wide v0, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->startTime:J

    .line 449
    .line 450
    cmp-long p1, v0, v2

    .line 451
    .line 452
    if-nez p1, :cond_1b

    .line 453
    .line 454
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 455
    .line 456
    .line 457
    move-result-wide v0

    .line 458
    iput-wide v0, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->startTime:J

    .line 459
    .line 460
    :cond_1b
    :goto_4
    return-void
.end method

.method public setFinishListener(Lcom/momo/mcamera/mask/StickerBlendFilter$StickerMaskFinishListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->finishListener:Lcom/momo/mcamera/mask/StickerBlendFilter$StickerMaskFinishListener;

    .line 2
    .line 3
    return-void
.end method

.method public setMMCVInfo(Ll/omw;)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_1

    .line 4
    :cond_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->triggerBlendFilter:Lcom/momo/mcamera/mask/TriggerBlendFilter;

    .line 5
    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Lcom/momo/mcamera/mask/TriggerBlendFilter;->setMMCVInfo(Ll/omw;)V

    .line 9
    .line 10
    .line 11
    :cond_1
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->segmentFilter:Lcom/momo/mcamera/mask/segment/AbsSegmentFilter;

    .line 12
    .line 13
    if-eqz v0, :cond_2

    .line 14
    .line 15
    invoke-virtual {v0, p1}, Lcom/momo/mcamera/mask/segment/AbsSegmentFilter;->setMMCVInfo(Ll/omw;)V

    .line 16
    .line 17
    .line 18
    :cond_2
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->sobelFilter:Lcom/momo/mcamera/mask/SobelFilter;

    .line 19
    .line 20
    if-eqz v0, :cond_4

    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    invoke-virtual {p1, v0}, Ll/omw;->j(I)Ll/nuf;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    if-eqz v1, :cond_3

    .line 28
    .line 29
    invoke-virtual {v1}, Ll/nuf;->o()[F

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    if-eqz v2, :cond_3

    .line 34
    .line 35
    invoke-virtual {v1}, Ll/nuf;->v()[F

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    if-eqz v1, :cond_3

    .line 40
    .line 41
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->sobelFilter:Lcom/momo/mcamera/mask/SobelFilter;

    .line 42
    .line 43
    const/4 v1, 0x1

    .line 44
    invoke-virtual {v0, v1}, Lcom/momo/mcamera/mask/SobelFilter;->setSobelEnabled(Z)V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_3
    iget-object v1, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->sobelFilter:Lcom/momo/mcamera/mask/SobelFilter;

    .line 49
    .line 50
    invoke-virtual {v1, v0}, Lcom/momo/mcamera/mask/SobelFilter;->setSobelEnabled(Z)V

    .line 51
    .line 52
    .line 53
    :cond_4
    :goto_0
    invoke-virtual {p1}, Ll/omw;->n()I

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    if-nez p1, :cond_5

    .line 58
    .line 59
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/StickerBlendFilter;->stopPlay()V

    .line 60
    .line 61
    .line 62
    :cond_5
    :goto_1
    return-void
.end method

.method public setOrderedIndex(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/Sticker;->setOrderedIndex(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setSegmentBody(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->triggerBlendFilter:Lcom/momo/mcamera/mask/TriggerBlendFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/TriggerBlendFilter;->setSegmentBody(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setSegmentStrokeColor([F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->triggerBlendFilter:Lcom/momo/mcamera/mask/TriggerBlendFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/TriggerBlendFilter;->setSegmentStrokeColor([F)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setSegmentStrokeRadius(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->triggerBlendFilter:Lcom/momo/mcamera/mask/TriggerBlendFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/TriggerBlendFilter;->setSegmentStrokeRadius(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setTimeStamp(J)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->stickerMaskFilter:Lcom/momo/mcamera/mask/FaceDetectFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    instance-of v0, p0, Ll/gam;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    check-cast p0, Ll/gam;

    .line 10
    .line 11
    invoke-interface {p0, p1, p2}, Ll/gam;->setTimeStamp(J)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public startPlay()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->isPlaying:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->stickerStateChangeListener:Lcom/momo/mcamera/mask/StickerBlendFilter$StickerStateChangeListener;

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getSoundId()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-lez v0, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->stickerStateChangeListener:Lcom/momo/mcamera/mask/StickerBlendFilter$StickerStateChangeListener;

    .line 19
    .line 20
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 21
    .line 22
    invoke-virtual {v2}, Lcom/momo/mcamera/mask/Sticker;->getSoundId()I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    invoke-interface {v0, v2, v1}, Lcom/momo/mcamera/mask/StickerBlendFilter$StickerStateChangeListener;->playStateChanged(IZ)V

    .line 27
    .line 28
    .line 29
    :cond_0
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->isPlaying:Z

    .line 30
    .line 31
    :cond_1
    return-void
.end method

.method public stopPlay()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->isPlaying:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->stickerStateChangeListener:Lcom/momo/mcamera/mask/StickerBlendFilter$StickerStateChangeListener;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getSoundId()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-lez v0, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->stickerStateChangeListener:Lcom/momo/mcamera/mask/StickerBlendFilter$StickerStateChangeListener;

    .line 19
    .line 20
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 21
    .line 22
    invoke-virtual {v2}, Lcom/momo/mcamera/mask/Sticker;->getSoundId()I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    invoke-interface {v0, v2, v1}, Lcom/momo/mcamera/mask/StickerBlendFilter$StickerStateChangeListener;->playStateChanged(IZ)V

    .line 27
    .line 28
    .line 29
    :cond_0
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->isPlaying:Z

    .line 30
    .line 31
    :cond_1
    return-void
.end method

.method public unlockTexture()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerBlendFilter;->stickerMaskFilter:Lcom/momo/mcamera/mask/FaceDetectFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/FaceDetectFilter;->unlockTexture()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
