.class public Lcom/ss/bytertc/engine/VideoEncoderConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/bytertc/engine/VideoEncoderConfig$FrameRate;,
        Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;,
        Lcom/ss/bytertc/engine/VideoEncoderConfig$EncoderPreference;,
        Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoCodecType;,
        Lcom/ss/bytertc/engine/VideoEncoderConfig$CodecMode;
    }
.end annotation


# static fields
.field public static final VD_120x120:Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;

.field public static final VD_1280x720:Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;

.field public static final VD_160x120:Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;

.field public static final VD_180x180:Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;

.field public static final VD_1920x1080:Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;

.field public static final VD_240x180:Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;

.field public static final VD_240x240:Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;

.field public static final VD_2540x1440:Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;

.field public static final VD_320x180:Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;

.field public static final VD_320x240:Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;

.field public static final VD_360x360:Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;

.field public static final VD_3840x2160:Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;

.field public static final VD_424x240:Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;

.field public static final VD_480x360:Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;

.field public static final VD_480x480:Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;

.field public static final VD_640x360:Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;

.field public static final VD_640x480:Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;

.field public static final VD_840x480:Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;

.field public static final VD_960x540:Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;

.field public static final VD_960x720:Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;


# instance fields
.field public encodePreference:Lcom/ss/bytertc/engine/VideoEncoderConfig$EncoderPreference;

.field public frameRate:I

.field public height:I

.field public maxBitrate:I

.field public minBitrate:I

.field public width:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;

    .line 2
    .line 3
    const/16 v1, 0x78

    .line 4
    .line 5
    invoke-direct {v0, v1, v1}, Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;-><init>(II)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lcom/ss/bytertc/engine/VideoEncoderConfig;->VD_120x120:Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;

    .line 9
    .line 10
    new-instance v0, Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;

    .line 11
    .line 12
    const/16 v2, 0xa0

    .line 13
    .line 14
    invoke-direct {v0, v2, v1}, Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;-><init>(II)V

    .line 15
    .line 16
    .line 17
    sput-object v0, Lcom/ss/bytertc/engine/VideoEncoderConfig;->VD_160x120:Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;

    .line 18
    .line 19
    new-instance v0, Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;

    .line 20
    .line 21
    const/16 v1, 0xb4

    .line 22
    .line 23
    invoke-direct {v0, v1, v1}, Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;-><init>(II)V

    .line 24
    .line 25
    .line 26
    sput-object v0, Lcom/ss/bytertc/engine/VideoEncoderConfig;->VD_180x180:Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;

    .line 27
    .line 28
    new-instance v0, Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;

    .line 29
    .line 30
    const/16 v2, 0xf0

    .line 31
    .line 32
    invoke-direct {v0, v2, v1}, Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;-><init>(II)V

    .line 33
    .line 34
    .line 35
    sput-object v0, Lcom/ss/bytertc/engine/VideoEncoderConfig;->VD_240x180:Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;

    .line 36
    .line 37
    new-instance v0, Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;

    .line 38
    .line 39
    const/16 v3, 0x140

    .line 40
    .line 41
    invoke-direct {v0, v3, v1}, Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;-><init>(II)V

    .line 42
    .line 43
    .line 44
    sput-object v0, Lcom/ss/bytertc/engine/VideoEncoderConfig;->VD_320x180:Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;

    .line 45
    .line 46
    new-instance v0, Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;

    .line 47
    .line 48
    invoke-direct {v0, v2, v2}, Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;-><init>(II)V

    .line 49
    .line 50
    .line 51
    sput-object v0, Lcom/ss/bytertc/engine/VideoEncoderConfig;->VD_240x240:Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;

    .line 52
    .line 53
    new-instance v0, Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;

    .line 54
    .line 55
    invoke-direct {v0, v3, v2}, Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;-><init>(II)V

    .line 56
    .line 57
    .line 58
    sput-object v0, Lcom/ss/bytertc/engine/VideoEncoderConfig;->VD_320x240:Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;

    .line 59
    .line 60
    new-instance v0, Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;

    .line 61
    .line 62
    const/16 v1, 0x1a8

    .line 63
    .line 64
    invoke-direct {v0, v1, v2}, Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;-><init>(II)V

    .line 65
    .line 66
    .line 67
    sput-object v0, Lcom/ss/bytertc/engine/VideoEncoderConfig;->VD_424x240:Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;

    .line 68
    .line 69
    new-instance v0, Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;

    .line 70
    .line 71
    const/16 v1, 0x168

    .line 72
    .line 73
    invoke-direct {v0, v1, v1}, Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;-><init>(II)V

    .line 74
    .line 75
    .line 76
    sput-object v0, Lcom/ss/bytertc/engine/VideoEncoderConfig;->VD_360x360:Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;

    .line 77
    .line 78
    new-instance v0, Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;

    .line 79
    .line 80
    const/16 v2, 0x1e0

    .line 81
    .line 82
    invoke-direct {v0, v2, v1}, Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;-><init>(II)V

    .line 83
    .line 84
    .line 85
    sput-object v0, Lcom/ss/bytertc/engine/VideoEncoderConfig;->VD_480x360:Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;

    .line 86
    .line 87
    new-instance v0, Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;

    .line 88
    .line 89
    const/16 v3, 0x280

    .line 90
    .line 91
    invoke-direct {v0, v3, v1}, Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;-><init>(II)V

    .line 92
    .line 93
    .line 94
    sput-object v0, Lcom/ss/bytertc/engine/VideoEncoderConfig;->VD_640x360:Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;

    .line 95
    .line 96
    new-instance v0, Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;

    .line 97
    .line 98
    invoke-direct {v0, v2, v2}, Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;-><init>(II)V

    .line 99
    .line 100
    .line 101
    sput-object v0, Lcom/ss/bytertc/engine/VideoEncoderConfig;->VD_480x480:Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;

    .line 102
    .line 103
    new-instance v0, Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;

    .line 104
    .line 105
    invoke-direct {v0, v3, v2}, Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;-><init>(II)V

    .line 106
    .line 107
    .line 108
    sput-object v0, Lcom/ss/bytertc/engine/VideoEncoderConfig;->VD_640x480:Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;

    .line 109
    .line 110
    new-instance v0, Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;

    .line 111
    .line 112
    const/16 v1, 0x348

    .line 113
    .line 114
    invoke-direct {v0, v1, v2}, Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;-><init>(II)V

    .line 115
    .line 116
    .line 117
    sput-object v0, Lcom/ss/bytertc/engine/VideoEncoderConfig;->VD_840x480:Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;

    .line 118
    .line 119
    new-instance v0, Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;

    .line 120
    .line 121
    const/16 v1, 0x21c

    .line 122
    .line 123
    const/16 v2, 0x3c0

    .line 124
    .line 125
    invoke-direct {v0, v2, v1}, Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;-><init>(II)V

    .line 126
    .line 127
    .line 128
    sput-object v0, Lcom/ss/bytertc/engine/VideoEncoderConfig;->VD_960x540:Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;

    .line 129
    .line 130
    new-instance v0, Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;

    .line 131
    .line 132
    const/16 v1, 0x2d0

    .line 133
    .line 134
    invoke-direct {v0, v2, v1}, Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;-><init>(II)V

    .line 135
    .line 136
    .line 137
    sput-object v0, Lcom/ss/bytertc/engine/VideoEncoderConfig;->VD_960x720:Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;

    .line 138
    .line 139
    new-instance v0, Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;

    .line 140
    .line 141
    const/16 v2, 0x500

    .line 142
    .line 143
    invoke-direct {v0, v2, v1}, Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;-><init>(II)V

    .line 144
    .line 145
    .line 146
    sput-object v0, Lcom/ss/bytertc/engine/VideoEncoderConfig;->VD_1280x720:Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;

    .line 147
    .line 148
    new-instance v0, Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;

    .line 149
    .line 150
    const/16 v1, 0x780

    .line 151
    .line 152
    const/16 v2, 0x438

    .line 153
    .line 154
    invoke-direct {v0, v1, v2}, Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;-><init>(II)V

    .line 155
    .line 156
    .line 157
    sput-object v0, Lcom/ss/bytertc/engine/VideoEncoderConfig;->VD_1920x1080:Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;

    .line 158
    .line 159
    new-instance v0, Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;

    .line 160
    .line 161
    const/16 v1, 0x9ec

    .line 162
    .line 163
    const/16 v2, 0x5a0

    .line 164
    .line 165
    invoke-direct {v0, v1, v2}, Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;-><init>(II)V

    .line 166
    .line 167
    .line 168
    sput-object v0, Lcom/ss/bytertc/engine/VideoEncoderConfig;->VD_2540x1440:Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;

    .line 169
    .line 170
    new-instance v0, Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;

    .line 171
    .line 172
    const/16 v1, 0xf00

    .line 173
    .line 174
    const/16 v2, 0x870

    .line 175
    .line 176
    invoke-direct {v0, v1, v2}, Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;-><init>(II)V

    .line 177
    .line 178
    .line 179
    sput-object v0, Lcom/ss/bytertc/engine/VideoEncoderConfig;->VD_3840x2160:Lcom/ss/bytertc/engine/VideoEncoderConfig$VideoDimensions;

    .line 180
    .line 181
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 41
    iput v0, p0, Lcom/ss/bytertc/engine/VideoEncoderConfig;->maxBitrate:I

    const/4 v0, 0x0

    .line 42
    iput v0, p0, Lcom/ss/bytertc/engine/VideoEncoderConfig;->minBitrate:I

    .line 43
    sget-object v0, Lcom/ss/bytertc/engine/VideoEncoderConfig$EncoderPreference;->MAINTAIN_FRAMERATE:Lcom/ss/bytertc/engine/VideoEncoderConfig$EncoderPreference;

    iput-object v0, p0, Lcom/ss/bytertc/engine/VideoEncoderConfig;->encodePreference:Lcom/ss/bytertc/engine/VideoEncoderConfig$EncoderPreference;

    return-void
.end method

.method public constructor <init>(IIIII)V
    .locals 1

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 32
    iput v0, p0, Lcom/ss/bytertc/engine/VideoEncoderConfig;->maxBitrate:I

    const/4 v0, 0x0

    .line 33
    iput v0, p0, Lcom/ss/bytertc/engine/VideoEncoderConfig;->minBitrate:I

    .line 34
    sget-object v0, Lcom/ss/bytertc/engine/VideoEncoderConfig$EncoderPreference;->MAINTAIN_FRAMERATE:Lcom/ss/bytertc/engine/VideoEncoderConfig$EncoderPreference;

    iput-object v0, p0, Lcom/ss/bytertc/engine/VideoEncoderConfig;->encodePreference:Lcom/ss/bytertc/engine/VideoEncoderConfig$EncoderPreference;

    .line 35
    iput p1, p0, Lcom/ss/bytertc/engine/VideoEncoderConfig;->width:I

    .line 36
    iput p2, p0, Lcom/ss/bytertc/engine/VideoEncoderConfig;->height:I

    .line 37
    iput p3, p0, Lcom/ss/bytertc/engine/VideoEncoderConfig;->frameRate:I

    .line 38
    iput p4, p0, Lcom/ss/bytertc/engine/VideoEncoderConfig;->maxBitrate:I

    .line 39
    iput p5, p0, Lcom/ss/bytertc/engine/VideoEncoderConfig;->minBitrate:I

    return-void
.end method

.method public constructor <init>(IIIIIIII)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 p6, -0x1

    .line 5
    iput p6, p0, Lcom/ss/bytertc/engine/VideoEncoderConfig;->maxBitrate:I

    .line 6
    .line 7
    const/4 p6, 0x0

    .line 8
    iput p6, p0, Lcom/ss/bytertc/engine/VideoEncoderConfig;->minBitrate:I

    .line 9
    .line 10
    sget-object p6, Lcom/ss/bytertc/engine/VideoEncoderConfig$EncoderPreference;->MAINTAIN_FRAMERATE:Lcom/ss/bytertc/engine/VideoEncoderConfig$EncoderPreference;

    .line 11
    .line 12
    iput-object p6, p0, Lcom/ss/bytertc/engine/VideoEncoderConfig;->encodePreference:Lcom/ss/bytertc/engine/VideoEncoderConfig$EncoderPreference;

    .line 13
    .line 14
    iput p1, p0, Lcom/ss/bytertc/engine/VideoEncoderConfig;->width:I

    .line 15
    .line 16
    iput p2, p0, Lcom/ss/bytertc/engine/VideoEncoderConfig;->height:I

    .line 17
    .line 18
    iput p3, p0, Lcom/ss/bytertc/engine/VideoEncoderConfig;->frameRate:I

    .line 19
    .line 20
    iput p4, p0, Lcom/ss/bytertc/engine/VideoEncoderConfig;->maxBitrate:I

    .line 21
    .line 22
    iput p5, p0, Lcom/ss/bytertc/engine/VideoEncoderConfig;->minBitrate:I

    .line 23
    .line 24
    invoke-static {p8}, Lcom/ss/bytertc/engine/VideoEncoderConfig$EncoderPreference;->convertFromInt(I)Lcom/ss/bytertc/engine/VideoEncoderConfig$EncoderPreference;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    iput-object p1, p0, Lcom/ss/bytertc/engine/VideoEncoderConfig;->encodePreference:Lcom/ss/bytertc/engine/VideoEncoderConfig$EncoderPreference;

    .line 29
    .line 30
    return-void
.end method

.method private static create(IIIII)Lcom/ss/bytertc/engine/VideoEncoderConfig;
    .locals 6
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    new-instance v0, Lcom/ss/bytertc/engine/VideoEncoderConfig;

    .line 2
    .line 3
    move v1, p0

    .line 4
    move v2, p1

    .line 5
    move v3, p2

    .line 6
    move v4, p3

    .line 7
    move v5, p4

    .line 8
    invoke-direct/range {v0 .. v5}, Lcom/ss/bytertc/engine/VideoEncoderConfig;-><init>(IIIII)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method


# virtual methods
.method public isValid()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "VideoEncoderConfig{width="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Lcom/ss/bytertc/engine/VideoEncoderConfig;->width:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "height="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget v1, p0, Lcom/ss/bytertc/engine/VideoEncoderConfig;->height:I

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ", frameRate="

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget v1, p0, Lcom/ss/bytertc/engine/VideoEncoderConfig;->frameRate:I

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, ", maxBitrate="

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget v1, p0, Lcom/ss/bytertc/engine/VideoEncoderConfig;->maxBitrate:I

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, ", minBitrate="

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget v1, p0, Lcom/ss/bytertc/engine/VideoEncoderConfig;->minBitrate:I

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v1, ", encodePreference="

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget-object p0, p0, Lcom/ss/bytertc/engine/VideoEncoderConfig;->encodePreference:Lcom/ss/bytertc/engine/VideoEncoderConfig$EncoderPreference;

    .line 59
    .line 60
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const/16 p0, 0x7d

    .line 64
    .line 65
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    return-object p0
.end method
