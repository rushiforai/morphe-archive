.class public Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public activityId:Ljava/lang/String;

.field public advancedMaxDuration:J

.field public alertToast:Ljava/lang/String;

.field public autoMusic:Z

.field public beautyLevel:I

.field public bigEyeAndThinLevel:I

.field public blockBusiness:Z

.field public canChangeTopic:Z

.field public checkedTopicIndex:I

.field public chooseMediaTips:Ljava/lang/String;

.field public choseDelayTime:I

.field public defaultMaxDuration:J

.field public extraBundle:Landroid/os/Bundle;

.field public filterKeyId:Ljava/lang/String;

.field public flashMode:I

.field public fromState:I

.field public gifEnable:Z

.field public gotoActivityName:Ljava/lang/String;

.field public hasMusic:Z

.field public hasOriginalSound:Z

.field public initFaceClassId:Ljava/lang/String;

.field public initTopicId:Ljava/lang/String;

.field public isFragment:Z

.field public isFromDigimonRecorder:Z

.field public isFromSameFilm:Z

.field public isNineToSixteen:Z

.field public isSameMusic:Z

.field public longLegsLevel:I

.field public lowerVideoCompressDuration:J

.field public maxDuration:J

.field public mediaType:I

.field public minDuration:J

.field public musicContent:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

.field public needWaterMask:Z

.field public onlineMusics:Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public onlyAlbum:Z

.field public onlyImage:Z

.field public onlyVideo:Z

.field public originalCovers:Z

.field public originalMode:I

.field public preSelectedMedias:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Photo;",
            ">;"
        }
    .end annotation
.end field

.field public recordFrom:Ljava/lang/String;

.field public saveToGallery:Z

.field public selectFaceId:Ljava/lang/String;

.field public sendText:Ljava/lang/String;

.field public shootMode:I

.field public showMonster:Z

.field public showTopic:Z

.field public slimmingLevel:I

.field public speedIndex:I
    .annotation build Landroidx/annotation/IntRange;
        from = 0x0L
        to = 0x4L
    .end annotation
.end field

.field public upperVideoCompressBitRate:J

.field public upperVideoCompressDuration:J

.field public upperVideoCompressSize:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 456
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 457
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->fromState:I

    const/4 v0, 0x1

    .line 458
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->showTopic:Z

    .line 459
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->canChangeTopic:Z

    const/4 v1, 0x0

    .line 460
    iput-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->onlyImage:Z

    .line 461
    iput-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->onlyAlbum:Z

    .line 462
    iput-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->onlyVideo:Z

    const/4 v1, 0x0

    .line 463
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->alertToast:Ljava/lang/String;

    .line 464
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->needWaterMask:Z

    const/4 v1, 0x2

    .line 465
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->speedIndex:I

    .line 466
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->saveToGallery:Z

    const-wide/32 v1, 0x700000

    .line 467
    iput-wide v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->upperVideoCompressSize:J

    const-wide/16 v1, 0x1388

    .line 468
    iput-wide v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->lowerVideoCompressDuration:J

    const-wide/32 v1, 0xea60

    .line 469
    iput-wide v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->upperVideoCompressDuration:J

    const-wide/32 v1, 0x500000

    .line 470
    iput-wide v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->upperVideoCompressBitRate:J

    .line 471
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->blockBusiness:Z

    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->fromState:I

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->showTopic:Z

    .line 9
    .line 10
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->canChangeTopic:Z

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    iput-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->onlyImage:Z

    .line 14
    .line 15
    iput-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->onlyAlbum:Z

    .line 16
    .line 17
    iput-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->onlyVideo:Z

    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->alertToast:Ljava/lang/String;

    .line 21
    .line 22
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->needWaterMask:Z

    .line 23
    .line 24
    const/4 v2, 0x2

    .line 25
    iput v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->speedIndex:I

    .line 26
    .line 27
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->saveToGallery:Z

    .line 28
    .line 29
    const-wide/32 v2, 0x700000

    .line 30
    .line 31
    .line 32
    iput-wide v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->upperVideoCompressSize:J

    .line 33
    .line 34
    const-wide/16 v2, 0x1388

    .line 35
    .line 36
    iput-wide v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->lowerVideoCompressDuration:J

    .line 37
    .line 38
    const-wide/32 v2, 0xea60

    .line 39
    .line 40
    .line 41
    iput-wide v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->upperVideoCompressDuration:J

    .line 42
    .line 43
    const-wide/32 v2, 0x500000

    .line 44
    .line 45
    .line 46
    iput-wide v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->upperVideoCompressBitRate:J

    .line 47
    .line 48
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->blockBusiness:Z

    .line 49
    .line 50
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    iput v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->fromState:I

    .line 55
    .line 56
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->filterKeyId:Ljava/lang/String;

    .line 61
    .line 62
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->selectFaceId:Ljava/lang/String;

    .line 67
    .line 68
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->initFaceClassId:Ljava/lang/String;

    .line 73
    .line 74
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    .line 75
    .line 76
    .line 77
    move-result v2

    .line 78
    if-eqz v2, :cond_0

    .line 79
    .line 80
    move v2, v0

    .line 81
    goto :goto_0

    .line 82
    :cond_0
    move v2, v1

    .line 83
    :goto_0
    iput-boolean v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->isFragment:Z

    .line 84
    .line 85
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 86
    .line 87
    .line 88
    move-result v2

    .line 89
    iput v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->choseDelayTime:I

    .line 90
    .line 91
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    .line 92
    .line 93
    .line 94
    move-result-wide v2

    .line 95
    iput-wide v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->maxDuration:J

    .line 96
    .line 97
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    .line 98
    .line 99
    .line 100
    move-result-wide v2

    .line 101
    iput-wide v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->defaultMaxDuration:J

    .line 102
    .line 103
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    .line 104
    .line 105
    .line 106
    move-result-wide v2

    .line 107
    iput-wide v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->advancedMaxDuration:J

    .line 108
    .line 109
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    .line 110
    .line 111
    .line 112
    move-result-wide v2

    .line 113
    iput-wide v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->minDuration:J

    .line 114
    .line 115
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 116
    .line 117
    .line 118
    move-result v2

    .line 119
    iput v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->checkedTopicIndex:I

    .line 120
    .line 121
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v2

    .line 125
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->initTopicId:Ljava/lang/String;

    .line 126
    .line 127
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v2

    .line 131
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->recordFrom:Ljava/lang/String;

    .line 132
    .line 133
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    .line 134
    .line 135
    .line 136
    move-result v2

    .line 137
    if-eqz v2, :cond_1

    .line 138
    .line 139
    move v2, v0

    .line 140
    goto :goto_1

    .line 141
    :cond_1
    move v2, v1

    .line 142
    :goto_1
    iput-boolean v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->autoMusic:Z

    .line 143
    .line 144
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    .line 145
    .line 146
    .line 147
    move-result v2

    .line 148
    if-eqz v2, :cond_2

    .line 149
    .line 150
    move v2, v0

    .line 151
    goto :goto_2

    .line 152
    :cond_2
    move v2, v1

    .line 153
    :goto_2
    iput-boolean v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->showTopic:Z

    .line 154
    .line 155
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    .line 156
    .line 157
    .line 158
    move-result v2

    .line 159
    if-eqz v2, :cond_3

    .line 160
    .line 161
    move v2, v0

    .line 162
    goto :goto_3

    .line 163
    :cond_3
    move v2, v1

    .line 164
    :goto_3
    iput-boolean v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->canChangeTopic:Z

    .line 165
    .line 166
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    .line 167
    .line 168
    .line 169
    move-result v2

    .line 170
    if-eqz v2, :cond_4

    .line 171
    .line 172
    move v2, v0

    .line 173
    goto :goto_4

    .line 174
    :cond_4
    move v2, v1

    .line 175
    :goto_4
    iput-boolean v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->onlyImage:Z

    .line 176
    .line 177
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    .line 178
    .line 179
    .line 180
    move-result v2

    .line 181
    if-eqz v2, :cond_5

    .line 182
    .line 183
    move v2, v0

    .line 184
    goto :goto_5

    .line 185
    :cond_5
    move v2, v1

    .line 186
    :goto_5
    iput-boolean v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->onlyVideo:Z

    .line 187
    .line 188
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    .line 189
    .line 190
    .line 191
    move-result v2

    .line 192
    if-eqz v2, :cond_6

    .line 193
    .line 194
    move v2, v0

    .line 195
    goto :goto_6

    .line 196
    :cond_6
    move v2, v1

    .line 197
    :goto_6
    iput-boolean v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->onlyAlbum:Z

    .line 198
    .line 199
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 200
    .line 201
    .line 202
    move-result-object v2

    .line 203
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->alertToast:Ljava/lang/String;

    .line 204
    .line 205
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    .line 206
    .line 207
    .line 208
    move-result v2

    .line 209
    if-eqz v2, :cond_7

    .line 210
    .line 211
    move v2, v0

    .line 212
    goto :goto_7

    .line 213
    :cond_7
    move v2, v1

    .line 214
    :goto_7
    iput-boolean v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->needWaterMask:Z

    .line 215
    .line 216
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 217
    .line 218
    .line 219
    move-result-object v2

    .line 220
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->sendText:Ljava/lang/String;

    .line 221
    .line 222
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 223
    .line 224
    .line 225
    move-result v2

    .line 226
    iput v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->shootMode:I

    .line 227
    .line 228
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 229
    .line 230
    .line 231
    move-result v2

    .line 232
    iput v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->beautyLevel:I

    .line 233
    .line 234
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 235
    .line 236
    .line 237
    move-result v2

    .line 238
    iput v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->bigEyeAndThinLevel:I

    .line 239
    .line 240
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 241
    .line 242
    .line 243
    move-result v2

    .line 244
    iput v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->slimmingLevel:I

    .line 245
    .line 246
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 247
    .line 248
    .line 249
    move-result v2

    .line 250
    iput v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->longLegsLevel:I

    .line 251
    .line 252
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 253
    .line 254
    .line 255
    move-result v2

    .line 256
    iput v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->flashMode:I

    .line 257
    .line 258
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 259
    .line 260
    .line 261
    move-result-object v2

    .line 262
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->gotoActivityName:Ljava/lang/String;

    .line 263
    .line 264
    invoke-virtual {p1}, Landroid/os/Parcel;->readBundle()Landroid/os/Bundle;

    .line 265
    .line 266
    .line 267
    move-result-object v2

    .line 268
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->extraBundle:Landroid/os/Bundle;

    .line 269
    .line 270
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 271
    .line 272
    .line 273
    move-result v2

    .line 274
    iput v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->mediaType:I

    .line 275
    .line 276
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    .line 277
    .line 278
    .line 279
    move-result v2

    .line 280
    if-eqz v2, :cond_8

    .line 281
    .line 282
    move v2, v0

    .line 283
    goto :goto_8

    .line 284
    :cond_8
    move v2, v1

    .line 285
    :goto_8
    iput-boolean v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->gifEnable:Z

    .line 286
    .line 287
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 288
    .line 289
    .line 290
    move-result v2

    .line 291
    iput v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->originalMode:I

    .line 292
    .line 293
    sget-object v2, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Photo;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 294
    .line 295
    invoke-virtual {p1, v2}, Landroid/os/Parcel;->createTypedArrayList(Landroid/os/Parcelable$Creator;)Ljava/util/ArrayList;

    .line 296
    .line 297
    .line 298
    move-result-object v2

    .line 299
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->preSelectedMedias:Ljava/util/List;

    .line 300
    .line 301
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 302
    .line 303
    .line 304
    move-result-object v2

    .line 305
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->chooseMediaTips:Ljava/lang/String;

    .line 306
    .line 307
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 308
    .line 309
    .line 310
    move-result-object v2

    .line 311
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->activityId:Ljava/lang/String;

    .line 312
    .line 313
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    .line 314
    .line 315
    .line 316
    move-result v2

    .line 317
    if-eqz v2, :cond_9

    .line 318
    .line 319
    move v2, v0

    .line 320
    goto :goto_9

    .line 321
    :cond_9
    move v2, v1

    .line 322
    :goto_9
    iput-boolean v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->showMonster:Z

    .line 323
    .line 324
    const-class v2, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 325
    .line 326
    invoke-virtual {v2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 327
    .line 328
    .line 329
    move-result-object v2

    .line 330
    invoke-virtual {p1, v2}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    .line 331
    .line 332
    .line 333
    move-result-object v2

    .line 334
    check-cast v2, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 335
    .line 336
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->musicContent:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 337
    .line 338
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    .line 339
    .line 340
    .line 341
    move-result v2

    .line 342
    if-eqz v2, :cond_a

    .line 343
    .line 344
    move v2, v0

    .line 345
    goto :goto_a

    .line 346
    :cond_a
    move v2, v1

    .line 347
    :goto_a
    iput-boolean v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->isNineToSixteen:Z

    .line 348
    .line 349
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    .line 350
    .line 351
    .line 352
    move-result v2

    .line 353
    if-eqz v2, :cond_b

    .line 354
    .line 355
    move v2, v0

    .line 356
    goto :goto_b

    .line 357
    :cond_b
    move v2, v1

    .line 358
    :goto_b
    iput-boolean v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->originalCovers:Z

    .line 359
    .line 360
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    .line 361
    .line 362
    .line 363
    move-result v2

    .line 364
    if-eqz v2, :cond_c

    .line 365
    .line 366
    move v2, v0

    .line 367
    goto :goto_c

    .line 368
    :cond_c
    move v2, v1

    .line 369
    :goto_c
    iput-boolean v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->saveToGallery:Z

    .line 370
    .line 371
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    .line 372
    .line 373
    .line 374
    move-result-wide v2

    .line 375
    iput-wide v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->upperVideoCompressSize:J

    .line 376
    .line 377
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    .line 378
    .line 379
    .line 380
    move-result-wide v2

    .line 381
    iput-wide v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->lowerVideoCompressDuration:J

    .line 382
    .line 383
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    .line 384
    .line 385
    .line 386
    move-result-wide v2

    .line 387
    iput-wide v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->upperVideoCompressBitRate:J

    .line 388
    .line 389
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    .line 390
    .line 391
    .line 392
    move-result-wide v2

    .line 393
    iput-wide v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->upperVideoCompressDuration:J

    .line 394
    .line 395
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    .line 396
    .line 397
    .line 398
    move-result v2

    .line 399
    if-eqz v2, :cond_d

    .line 400
    .line 401
    move v2, v0

    .line 402
    goto :goto_d

    .line 403
    :cond_d
    move v2, v1

    .line 404
    :goto_d
    iput-boolean v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->isFromDigimonRecorder:Z

    .line 405
    .line 406
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    .line 407
    .line 408
    .line 409
    move-result v2

    .line 410
    if-eqz v2, :cond_e

    .line 411
    .line 412
    move v2, v0

    .line 413
    goto :goto_e

    .line 414
    :cond_e
    move v2, v1

    .line 415
    :goto_e
    iput-boolean v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->isFromSameFilm:Z

    .line 416
    .line 417
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 418
    .line 419
    .line 420
    move-result v2

    .line 421
    iput v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->speedIndex:I

    .line 422
    .line 423
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    .line 424
    .line 425
    .line 426
    move-result v2

    .line 427
    if-eqz v2, :cond_f

    .line 428
    .line 429
    move v2, v0

    .line 430
    goto :goto_f

    .line 431
    :cond_f
    move v2, v1

    .line 432
    :goto_f
    iput-boolean v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->blockBusiness:Z

    .line 433
    .line 434
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    .line 435
    .line 436
    .line 437
    move-result v2

    .line 438
    if-eqz v2, :cond_10

    .line 439
    .line 440
    move v2, v0

    .line 441
    goto :goto_10

    .line 442
    :cond_10
    move v2, v1

    .line 443
    :goto_10
    iput-boolean v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->hasOriginalSound:Z

    .line 444
    .line 445
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    .line 446
    .line 447
    .line 448
    move-result p1

    .line 449
    if-eqz p1, :cond_11

    .line 450
    .line 451
    goto :goto_11

    .line 452
    :cond_11
    move v0, v1

    .line 453
    :goto_11
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->isSameMusic:Z

    .line 454
    .line 455
    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 2

    .line 1
    iget p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->fromState:I

    .line 2
    .line 3
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 4
    .line 5
    .line 6
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->filterKeyId:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->selectFaceId:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->initFaceClassId:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-boolean p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->isFragment:Z

    .line 22
    .line 23
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeByte(B)V

    .line 24
    .line 25
    .line 26
    iget p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->choseDelayTime:I

    .line 27
    .line 28
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 29
    .line 30
    .line 31
    iget-wide v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->maxDuration:J

    .line 32
    .line 33
    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 34
    .line 35
    .line 36
    iget-wide v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->defaultMaxDuration:J

    .line 37
    .line 38
    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 39
    .line 40
    .line 41
    iget-wide v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->advancedMaxDuration:J

    .line 42
    .line 43
    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 44
    .line 45
    .line 46
    iget-wide v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->minDuration:J

    .line 47
    .line 48
    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 49
    .line 50
    .line 51
    iget p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->checkedTopicIndex:I

    .line 52
    .line 53
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 54
    .line 55
    .line 56
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->initTopicId:Ljava/lang/String;

    .line 57
    .line 58
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->recordFrom:Ljava/lang/String;

    .line 62
    .line 63
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    iget-boolean p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->autoMusic:Z

    .line 67
    .line 68
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeByte(B)V

    .line 69
    .line 70
    .line 71
    iget-boolean p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->showTopic:Z

    .line 72
    .line 73
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeByte(B)V

    .line 74
    .line 75
    .line 76
    iget-boolean p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->canChangeTopic:Z

    .line 77
    .line 78
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeByte(B)V

    .line 79
    .line 80
    .line 81
    iget-boolean p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->onlyImage:Z

    .line 82
    .line 83
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeByte(B)V

    .line 84
    .line 85
    .line 86
    iget-boolean p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->onlyVideo:Z

    .line 87
    .line 88
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeByte(B)V

    .line 89
    .line 90
    .line 91
    iget-boolean p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->onlyAlbum:Z

    .line 92
    .line 93
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeByte(B)V

    .line 94
    .line 95
    .line 96
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->alertToast:Ljava/lang/String;

    .line 97
    .line 98
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    iget-boolean p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->needWaterMask:Z

    .line 102
    .line 103
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeByte(B)V

    .line 104
    .line 105
    .line 106
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->sendText:Ljava/lang/String;

    .line 107
    .line 108
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    iget p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->shootMode:I

    .line 112
    .line 113
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 114
    .line 115
    .line 116
    iget p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->beautyLevel:I

    .line 117
    .line 118
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 119
    .line 120
    .line 121
    iget p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->bigEyeAndThinLevel:I

    .line 122
    .line 123
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 124
    .line 125
    .line 126
    iget p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->slimmingLevel:I

    .line 127
    .line 128
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 129
    .line 130
    .line 131
    iget p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->longLegsLevel:I

    .line 132
    .line 133
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 134
    .line 135
    .line 136
    iget p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->flashMode:I

    .line 137
    .line 138
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 139
    .line 140
    .line 141
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->gotoActivityName:Ljava/lang/String;

    .line 142
    .line 143
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 144
    .line 145
    .line 146
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->extraBundle:Landroid/os/Bundle;

    .line 147
    .line 148
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeBundle(Landroid/os/Bundle;)V

    .line 149
    .line 150
    .line 151
    iget p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->mediaType:I

    .line 152
    .line 153
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 154
    .line 155
    .line 156
    iget-boolean p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->gifEnable:Z

    .line 157
    .line 158
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeByte(B)V

    .line 159
    .line 160
    .line 161
    iget p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->originalMode:I

    .line 162
    .line 163
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 164
    .line 165
    .line 166
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->preSelectedMedias:Ljava/util/List;

    .line 167
    .line 168
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeTypedList(Ljava/util/List;)V

    .line 169
    .line 170
    .line 171
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->chooseMediaTips:Ljava/lang/String;

    .line 172
    .line 173
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 174
    .line 175
    .line 176
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->activityId:Ljava/lang/String;

    .line 177
    .line 178
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 179
    .line 180
    .line 181
    iget-boolean p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->showMonster:Z

    .line 182
    .line 183
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeByte(B)V

    .line 184
    .line 185
    .line 186
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->musicContent:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 187
    .line 188
    const/4 v0, 0x0

    .line 189
    invoke-virtual {p1, p2, v0}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 190
    .line 191
    .line 192
    iget-boolean p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->isNineToSixteen:Z

    .line 193
    .line 194
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeByte(B)V

    .line 195
    .line 196
    .line 197
    iget-boolean p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->originalCovers:Z

    .line 198
    .line 199
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeByte(B)V

    .line 200
    .line 201
    .line 202
    iget-boolean p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->saveToGallery:Z

    .line 203
    .line 204
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeByte(B)V

    .line 205
    .line 206
    .line 207
    iget-wide v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->upperVideoCompressSize:J

    .line 208
    .line 209
    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 210
    .line 211
    .line 212
    iget-wide v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->lowerVideoCompressDuration:J

    .line 213
    .line 214
    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 215
    .line 216
    .line 217
    iget-wide v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->upperVideoCompressBitRate:J

    .line 218
    .line 219
    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 220
    .line 221
    .line 222
    iget-wide v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->upperVideoCompressDuration:J

    .line 223
    .line 224
    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 225
    .line 226
    .line 227
    iget-boolean p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->isFromDigimonRecorder:Z

    .line 228
    .line 229
    int-to-byte p2, p2

    .line 230
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeByte(B)V

    .line 231
    .line 232
    .line 233
    iget-boolean p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->isFromSameFilm:Z

    .line 234
    .line 235
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeByte(B)V

    .line 236
    .line 237
    .line 238
    iget p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->speedIndex:I

    .line 239
    .line 240
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 241
    .line 242
    .line 243
    iget-boolean p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->blockBusiness:Z

    .line 244
    .line 245
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeByte(B)V

    .line 246
    .line 247
    .line 248
    iget-boolean p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->hasOriginalSound:Z

    .line 249
    .line 250
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeByte(B)V

    .line 251
    .line 252
    .line 253
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->isSameMusic:Z

    .line 254
    .line 255
    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeByte(B)V

    .line 256
    .line 257
    .line 258
    return-void
.end method
