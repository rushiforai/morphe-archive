.class public Ll/mw40;
.super Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/mw40$a;
    }
.end annotation


# instance fields
.field public final h:Ll/nw40;

.field public i:Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;


# direct methods
.method public constructor <init>(Ll/nw40;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/mw40;->h:Ll/nw40;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic p1([I)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    const/16 v1, 0x21c

    .line 3
    .line 4
    aput v1, p0, v0

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    const/16 v1, 0x3c0

    .line 8
    .line 9
    aput v1, p0, v0

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic q1(Ll/mw40;Ljava/io/File;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mw40;->w1(Ljava/io/File;)V

    return-void
.end method

.method public static synthetic r1([I)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    const/16 v1, 0x1e0

    .line 3
    .line 4
    aput v1, p0, v0

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    const/16 v1, 0x280

    .line 8
    .line 9
    aput v1, p0, v0

    .line 10
    .line 11
    return-void
.end method

.method public static bridge synthetic s1()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Ll/mw40;->v1()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static t1(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;)Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;
    .locals 1

    .line 1
    new-instance v0, Ll/mw40;

    .line 2
    .line 3
    check-cast p0, Ll/nw40;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Ll/mw40;-><init>(Ll/nw40;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public static v1()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 7
    .line 8
    invoke-virtual {v1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-static {}, Ll/xau;->B()Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-eqz v1, :cond_0

    .line 29
    .line 30
    const-string v1, "watermark.png"

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    const-string v1, "watermark_en.png"

    .line 34
    .line 35
    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    return-object v0
.end method

.method private y1()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 2
    .line 3
    iget-object v0, v0, Ll/u1f;->d:Ll/p410;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/p410;->b1()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 9
    .line 10
    iget-object v0, v0, Ll/u1f;->d:Ll/p410;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/p410;->n1()V

    .line 13
    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput-object v0, p0, Ll/mw40;->i:Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public S(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/eas;->S(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;II)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/t3f;->b()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    if-ne p2, p1, :cond_0

    .line 9
    .line 10
    invoke-direct {p0}, Ll/mw40;->y1()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public X0()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->X0()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->Y0()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public g1()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->g1()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 5
    .line 6
    iget-object p0, p0, Ll/u1f;->d:Ll/p410;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/p410;->n1()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public o1()I
    .locals 3

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->o1()I

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 5
    .line 6
    iget-object v0, v0, Ll/u1f;->h:Ll/r510;

    .line 7
    .line 8
    new-instance v1, Ll/ax40;

    .line 9
    .line 10
    invoke-direct {v1}, Ll/ax40;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ll/r510;->d(Ll/o510;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Ll/mw40;->x1()V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 20
    .line 21
    iget-object v0, v0, Ll/u1f;->d:Ll/p410;

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->W0()Ll/cgu;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Ll/p410;->i1(Ll/cgu;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/mw40;->h:Ll/nw40;

    .line 31
    .line 32
    iget-object v1, v0, Ll/nw40;->l:Ljava/lang/String;

    .line 33
    .line 34
    iget-object v2, v0, Ll/nw40;->k:Ljava/lang/String;

    .line 35
    .line 36
    iget-object v0, v0, Ll/nw40;->j:Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;

    .line 37
    .line 38
    invoke-virtual {p0, v1, v2, v0}, Ll/mw40;->u1(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;)Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iput-object v0, p0, Ll/mw40;->i:Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;

    .line 43
    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 45
    .line 46
    iget-object p0, p0, Ll/u1f;->d:Ll/p410;

    .line 47
    .line 48
    invoke-virtual {p0, v0}, Ll/p410;->m1(Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;)I

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    return p0
.end method

.method public final u1(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;)Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;
    .locals 8

    .line 1
    new-instance v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x2

    .line 7
    iput v1, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->audioChannels:I

    .line 8
    .line 9
    const v2, 0xac44

    .line 10
    .line 11
    .line 12
    iput v2, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->audioSampleRate:I

    .line 13
    .line 14
    const v2, 0xfa00

    .line 15
    .line 16
    .line 17
    iput v2, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->audioBitrate:I

    .line 18
    .line 19
    new-array v1, v1, [I

    .line 20
    .line 21
    const/16 v2, 0x21c

    .line 22
    .line 23
    const/4 v3, 0x0

    .line 24
    aput v2, v1, v3

    .line 25
    .line 26
    const/16 v2, 0x3c0

    .line 27
    .line 28
    const/4 v4, 0x1

    .line 29
    aput v2, v1, v4

    .line 30
    .line 31
    new-instance v2, Ll/jw40;

    .line 32
    .line 33
    invoke-direct {v2, v1}, Ll/jw40;-><init>([I)V

    .line 34
    .line 35
    .line 36
    new-instance v5, Ll/kw40;

    .line 37
    .line 38
    invoke-direct {v5, v1}, Ll/kw40;-><init>([I)V

    .line 39
    .line 40
    .line 41
    invoke-static {v2, v5}, Ll/l210;->a(Ll/x20;Ll/x20;)V

    .line 42
    .line 43
    .line 44
    iput-object p1, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->url:Ljava/lang/String;

    .line 45
    .line 46
    iput-object p2, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->ipv6Url:Ljava/lang/String;

    .line 47
    .line 48
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    if-eqz v2, :cond_0

    .line 53
    .line 54
    iget-object v2, p3, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;->encode:Lcom/p1/mobile/putong/live/base/data/BLiveEncode;

    .line 55
    .line 56
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/base/data/BLiveEncode;->isValid()Z

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    if-eqz v2, :cond_0

    .line 61
    .line 62
    iget-object v2, p3, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;->encode:Lcom/p1/mobile/putong/live/base/data/BLiveEncode;

    .line 63
    .line 64
    iget v5, v2, Lcom/p1/mobile/putong/live/base/data/BLiveEncode;->fps:I

    .line 65
    .line 66
    iget v6, v2, Lcom/p1/mobile/putong/live/base/data/BLiveEncode;->bitRate:I

    .line 67
    .line 68
    iget v7, v2, Lcom/p1/mobile/putong/live/base/data/BLiveEncode;->width:I

    .line 69
    .line 70
    aput v7, v1, v3

    .line 71
    .line 72
    iget v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveEncode;->heigth:I

    .line 73
    .line 74
    aput v2, v1, v4

    .line 75
    .line 76
    iget p3, p3, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;->videoCodecType:I

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_0
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 80
    .line 81
    iget-object p3, p3, Ll/u1f;->c:Ll/b210;

    .line 82
    .line 83
    invoke-virtual {p3}, Ll/b210;->a1()Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;

    .line 84
    .line 85
    .line 86
    move-result-object p3

    .line 87
    if-eqz p3, :cond_1

    .line 88
    .line 89
    invoke-virtual {p3}, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;->isValid()Z

    .line 90
    .line 91
    .line 92
    move-result v2

    .line 93
    if-eqz v2, :cond_1

    .line 94
    .line 95
    iget v5, p3, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;->pushFps:I

    .line 96
    .line 97
    iget v6, p3, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;->pushBitrate:I

    .line 98
    .line 99
    iget v2, p3, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;->pushWidth:I

    .line 100
    .line 101
    aput v2, v1, v3

    .line 102
    .line 103
    iget v2, p3, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;->pushHeight:I

    .line 104
    .line 105
    aput v2, v1, v4

    .line 106
    .line 107
    iget p3, p3, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;->videoCodecType:I

    .line 108
    .line 109
    goto :goto_0

    .line 110
    :cond_1
    const/16 v5, 0x14

    .line 111
    .line 112
    const v6, 0x124f80

    .line 113
    .line 114
    .line 115
    move p3, v3

    .line 116
    :goto_0
    aget v2, v1, v3

    .line 117
    .line 118
    iput v2, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->encodeWidth:I

    .line 119
    .line 120
    aget v2, v1, v4

    .line 121
    .line 122
    iput v2, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->encodeHeight:I

    .line 123
    .line 124
    iput v5, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->videoFPS:I

    .line 125
    .line 126
    iput v6, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->videoBitRate:I

    .line 127
    .line 128
    iput p3, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->videoCodecType:I

    .line 129
    .line 130
    new-instance p3, Ljava/lang/StringBuilder;

    .line 131
    .line 132
    const-string v2, "pushUrl:"

    .line 133
    .line 134
    invoke-direct {p3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    const-string p1, "pushUrlIpv6:"

    .line 141
    .line 142
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 143
    .line 144
    .line 145
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    const-string p1, "encodeSize:"

    .line 149
    .line 150
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    invoke-static {v1}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object p1

    .line 157
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 158
    .line 159
    .line 160
    const-string p1, " fps:"

    .line 161
    .line 162
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 163
    .line 164
    .line 165
    invoke-virtual {p3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    const-string p1, " bitrate:"

    .line 169
    .line 170
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 171
    .line 172
    .line 173
    invoke-virtual {p3, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 174
    .line 175
    .line 176
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object p1

    .line 180
    const-string p2, "[live]sdk_engine"

    .line 181
    .line 182
    invoke-static {p2, p1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 183
    .line 184
    .line 185
    iget-object p1, p0, Ll/mw40;->h:Ll/nw40;

    .line 186
    .line 187
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;->c:Ljava/lang/String;

    .line 188
    .line 189
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 190
    .line 191
    .line 192
    move-result p1

    .line 193
    iput p1, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->businessType:I

    .line 194
    .line 195
    iget-object p0, p0, Ll/mw40;->h:Ll/nw40;

    .line 196
    .line 197
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;->b:Ljava/lang/String;

    .line 198
    .line 199
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 200
    .line 201
    .line 202
    move-result p0

    .line 203
    iput p0, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->cdnType:I

    .line 204
    .line 205
    return-object v0
.end method

.method public final synthetic w1(Ljava/io/File;)V
    .locals 2

    .line 1
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 2
    .line 3
    invoke-static {}, Ll/xau;->B()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    const-string v1, "watermark.png"

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string v1, "watermark_en.png"

    .line 13
    .line 14
    :goto_0
    invoke-static {v0, v1, p1}, Ll/oki;->d(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_1

    .line 19
    .line 20
    new-instance p1, Ll/mw40$a;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 23
    .line 24
    iget-object p0, p0, Ll/u1f;->d:Ll/p410;

    .line 25
    .line 26
    invoke-direct {p1, p0}, Ll/mw40$a;-><init>(Ll/p410;)V

    .line 27
    .line 28
    .line 29
    invoke-static {p1}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 30
    .line 31
    .line 32
    :cond_1
    return-void
.end method

.method public final x1()V
    .locals 2

    .line 1
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    invoke-static {}, Ll/mw40;->v1()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 17
    .line 18
    iget-object p0, p0, Ll/u1f;->d:Ll/p410;

    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {p0, v0}, Ll/p410;->l1(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    new-instance v1, Ll/lw40;

    .line 29
    .line 30
    invoke-direct {v1, p0, v0}, Ll/lw40;-><init>(Ll/mw40;Ljava/io/File;)V

    .line 31
    .line 32
    .line 33
    invoke-static {v1}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method
