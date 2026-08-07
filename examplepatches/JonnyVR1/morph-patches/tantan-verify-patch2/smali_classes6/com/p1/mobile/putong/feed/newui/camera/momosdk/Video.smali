.class public Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public advancedRecordingVideo:Z
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation
.end field

.field public avgBitrate:I
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation
.end field

.field public cameraFPS:I
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation
.end field

.field public frameRate:F
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation
.end field

.field public height:I
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation
.end field

.field private id:I
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation
.end field

.field public isAcrossScreen:Z
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation
.end field

.field public isCQ:Z
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation
.end field

.field public isChosenFromLocal:Z
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation
.end field

.field public isCut:Z
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation
.end field

.field public isFrontCamera:Z
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation
.end field

.field public length:J
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation
.end field

.field public name:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation
.end field

.field public originSize:J
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation
.end field

.field public osPercent:I
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation
.end field

.field public path:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation
.end field

.field public playingMusic:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation
.end field

.field public psPercent:I
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation
.end field

.field public renderFPS:I
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation
.end field

.field public resolution:I
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation
.end field

.field public resolutionGpu:I
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation
.end field

.field public resolutionStrategy:I
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation
.end field

.field public rotate:I
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation
.end field

.field public size:I
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation
.end field

.field public soundPitchMode:I
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation
.end field

.field public thumb:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation
.end field

.field public videoId:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation
.end field

.field public width:I
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .line 259
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 260
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->isFrontCamera:Z

    .line 261
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->isChosenFromLocal:Z

    .line 262
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->osPercent:I

    .line 263
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->psPercent:I

    .line 264
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->isAcrossScreen:Z

    const/4 v1, 0x1

    .line 265
    iput-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->advancedRecordingVideo:Z

    .line 266
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->isCut:Z

    .line 267
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->soundPitchMode:I

    const-wide/16 v2, 0x0

    .line 268
    iput-wide v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->originSize:J

    .line 269
    iput-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->isCQ:Z

    return-void
.end method

.method public constructor <init>(ILjava/lang/String;)V
    .locals 4

    .line 246
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 247
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->isFrontCamera:Z

    .line 248
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->isChosenFromLocal:Z

    .line 249
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->osPercent:I

    .line 250
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->psPercent:I

    .line 251
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->isAcrossScreen:Z

    const/4 v1, 0x1

    .line 252
    iput-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->advancedRecordingVideo:Z

    .line 253
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->isCut:Z

    .line 254
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->soundPitchMode:I

    const-wide/16 v2, 0x0

    .line 255
    iput-wide v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->originSize:J

    .line 256
    iput-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->isCQ:Z

    .line 257
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->id:I

    .line 258
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->path:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->isFrontCamera:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->isChosenFromLocal:Z

    .line 8
    .line 9
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->osPercent:I

    .line 10
    .line 11
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->psPercent:I

    .line 12
    .line 13
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->isAcrossScreen:Z

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    iput-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->advancedRecordingVideo:Z

    .line 17
    .line 18
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->isCut:Z

    .line 19
    .line 20
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->soundPitchMode:I

    .line 21
    .line 22
    const-wide/16 v2, 0x0

    .line 23
    .line 24
    iput-wide v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->originSize:J

    .line 25
    .line 26
    iput-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->isCQ:Z

    .line 27
    .line 28
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    iput v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->id:I

    .line 33
    .line 34
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->videoId:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    iput v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->rotate:I

    .line 45
    .line 46
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    iput v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->width:I

    .line 51
    .line 52
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    iput v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->height:I

    .line 57
    .line 58
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    iput v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->size:I

    .line 63
    .line 64
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 65
    .line 66
    .line 67
    move-result v2

    .line 68
    iput v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->avgBitrate:I

    .line 69
    .line 70
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    .line 71
    .line 72
    .line 73
    move-result-wide v2

    .line 74
    iput-wide v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->length:J

    .line 75
    .line 76
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->path:Ljava/lang/String;

    .line 81
    .line 82
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->name:Ljava/lang/String;

    .line 87
    .line 88
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->thumb:Ljava/lang/String;

    .line 93
    .line 94
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    .line 95
    .line 96
    .line 97
    move-result v2

    .line 98
    if-eqz v2, :cond_0

    .line 99
    .line 100
    move v2, v1

    .line 101
    goto :goto_0

    .line 102
    :cond_0
    move v2, v0

    .line 103
    :goto_0
    iput-boolean v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->isFrontCamera:Z

    .line 104
    .line 105
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    .line 106
    .line 107
    .line 108
    move-result v2

    .line 109
    if-eqz v2, :cond_1

    .line 110
    .line 111
    move v2, v1

    .line 112
    goto :goto_1

    .line 113
    :cond_1
    move v2, v0

    .line 114
    :goto_1
    iput-boolean v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->isChosenFromLocal:Z

    .line 115
    .line 116
    const-class v2, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 117
    .line 118
    invoke-virtual {v2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 119
    .line 120
    .line 121
    move-result-object v2

    .line 122
    invoke-virtual {p1, v2}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    .line 123
    .line 124
    .line 125
    move-result-object v2

    .line 126
    check-cast v2, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 127
    .line 128
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->playingMusic:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 129
    .line 130
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 131
    .line 132
    .line 133
    move-result v2

    .line 134
    iput v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->osPercent:I

    .line 135
    .line 136
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 137
    .line 138
    .line 139
    move-result v2

    .line 140
    iput v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->psPercent:I

    .line 141
    .line 142
    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    .line 143
    .line 144
    .line 145
    move-result v2

    .line 146
    iput v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->frameRate:F

    .line 147
    .line 148
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    .line 149
    .line 150
    .line 151
    move-result v2

    .line 152
    if-eqz v2, :cond_2

    .line 153
    .line 154
    move v2, v1

    .line 155
    goto :goto_2

    .line 156
    :cond_2
    move v2, v0

    .line 157
    :goto_2
    iput-boolean v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->isAcrossScreen:Z

    .line 158
    .line 159
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 160
    .line 161
    .line 162
    move-result v2

    .line 163
    iput v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->cameraFPS:I

    .line 164
    .line 165
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 166
    .line 167
    .line 168
    move-result v2

    .line 169
    iput v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->renderFPS:I

    .line 170
    .line 171
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 172
    .line 173
    .line 174
    move-result v2

    .line 175
    iput v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->resolutionStrategy:I

    .line 176
    .line 177
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 178
    .line 179
    .line 180
    move-result v2

    .line 181
    iput v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->resolution:I

    .line 182
    .line 183
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 184
    .line 185
    .line 186
    move-result v2

    .line 187
    iput v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->resolutionGpu:I

    .line 188
    .line 189
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    .line 190
    .line 191
    .line 192
    move-result v2

    .line 193
    if-eqz v2, :cond_3

    .line 194
    .line 195
    move v2, v1

    .line 196
    goto :goto_3

    .line 197
    :cond_3
    move v2, v0

    .line 198
    :goto_3
    iput-boolean v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->advancedRecordingVideo:Z

    .line 199
    .line 200
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    .line 201
    .line 202
    .line 203
    move-result v2

    .line 204
    if-eqz v2, :cond_4

    .line 205
    .line 206
    move v2, v1

    .line 207
    goto :goto_4

    .line 208
    :cond_4
    move v2, v0

    .line 209
    :goto_4
    iput-boolean v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->isCut:Z

    .line 210
    .line 211
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 212
    .line 213
    .line 214
    move-result v2

    .line 215
    iput v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->soundPitchMode:I

    .line 216
    .line 217
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    .line 218
    .line 219
    .line 220
    move-result-wide v2

    .line 221
    iput-wide v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->originSize:J

    .line 222
    .line 223
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    .line 224
    .line 225
    .line 226
    move-result p1

    .line 227
    if-eqz p1, :cond_5

    .line 228
    .line 229
    move v0, v1

    .line 230
    :cond_5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->isCQ:Z

    .line 231
    .line 232
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 4

    .line 233
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 234
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->isFrontCamera:Z

    .line 235
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->isChosenFromLocal:Z

    .line 236
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->osPercent:I

    .line 237
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->psPercent:I

    .line 238
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->isAcrossScreen:Z

    const/4 v1, 0x1

    .line 239
    iput-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->advancedRecordingVideo:Z

    .line 240
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->isCut:Z

    .line 241
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->soundPitchMode:I

    const-wide/16 v2, 0x0

    .line 242
    iput-wide v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->originSize:J

    .line 243
    iput-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->isCQ:Z

    const/4 v0, -0x1

    .line 244
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->id:I

    .line 245
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->path:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->path:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->path:Ljava/lang/String;

    .line 16
    .line 17
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->path:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->id:I

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->videoId:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->rotate:I

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 14
    .line 15
    .line 16
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->width:I

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 19
    .line 20
    .line 21
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->height:I

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 24
    .line 25
    .line 26
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->size:I

    .line 27
    .line 28
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 29
    .line 30
    .line 31
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->avgBitrate:I

    .line 32
    .line 33
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 34
    .line 35
    .line 36
    iget-wide v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->length:J

    .line 37
    .line 38
    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->path:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->name:Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->thumb:Ljava/lang/String;

    .line 52
    .line 53
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->isFrontCamera:Z

    .line 57
    .line 58
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 59
    .line 60
    .line 61
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->isChosenFromLocal:Z

    .line 62
    .line 63
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->playingMusic:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 67
    .line 68
    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 69
    .line 70
    .line 71
    iget p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->osPercent:I

    .line 72
    .line 73
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 74
    .line 75
    .line 76
    iget p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->psPercent:I

    .line 77
    .line 78
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 79
    .line 80
    .line 81
    iget p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->frameRate:F

    .line 82
    .line 83
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeFloat(F)V

    .line 84
    .line 85
    .line 86
    iget-boolean p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->isAcrossScreen:Z

    .line 87
    .line 88
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeByte(B)V

    .line 89
    .line 90
    .line 91
    iget p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->cameraFPS:I

    .line 92
    .line 93
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 94
    .line 95
    .line 96
    iget p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->renderFPS:I

    .line 97
    .line 98
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 99
    .line 100
    .line 101
    iget p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->resolutionStrategy:I

    .line 102
    .line 103
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 104
    .line 105
    .line 106
    iget p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->resolution:I

    .line 107
    .line 108
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 109
    .line 110
    .line 111
    iget p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->resolutionGpu:I

    .line 112
    .line 113
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 114
    .line 115
    .line 116
    iget-boolean p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->advancedRecordingVideo:Z

    .line 117
    .line 118
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeByte(B)V

    .line 119
    .line 120
    .line 121
    iget-boolean p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->isCut:Z

    .line 122
    .line 123
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeByte(B)V

    .line 124
    .line 125
    .line 126
    iget p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->soundPitchMode:I

    .line 127
    .line 128
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 129
    .line 130
    .line 131
    iget-wide v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->originSize:J

    .line 132
    .line 133
    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 134
    .line 135
    .line 136
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->isCQ:Z

    .line 137
    .line 138
    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeByte(B)V

    .line 139
    .line 140
    .line 141
    return-void
.end method
