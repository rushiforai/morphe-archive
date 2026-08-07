.class public Ll/gnw;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private a:Lcom/momo/pub/MomoPipelineModuleRegister;

.field private b:Ll/zzl;

.field private c:Lcom/immomo/momomediaext/utils/MMLiveUserConfig;

.field private d:Ll/usl;

.field public e:Ll/p4k0;

.field private f:Ll/fb1;


# direct methods
.method public constructor <init>(Lcom/momo/pub/MomoPipelineModuleRegister;Lcom/immomo/momomediaext/utils/MMLiveUserConfig;)V
    .locals 8

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;

    .line 5
    .line 6
    const-string v6, "100"

    .line 7
    .line 8
    const/4 v7, 0x1

    .line 9
    const-string v1, "0"

    .line 10
    .line 11
    const-string v2, "0"

    .line 12
    .line 13
    const-string v3, "0"

    .line 14
    .line 15
    const-string v4, "0"

    .line 16
    .line 17
    const-string v5, "0"

    .line 18
    .line 19
    invoke-direct/range {v0 .. v7}, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Ll/gnw;->c:Lcom/immomo/momomediaext/utils/MMLiveUserConfig;

    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    iput-object v0, p0, Ll/gnw;->e:Ll/p4k0;

    .line 26
    .line 27
    iput-object p1, p0, Ll/gnw;->a:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 28
    .line 29
    invoke-direct {p0, p2}, Ll/gnw;->f(Lcom/immomo/momomediaext/utils/MMLiveUserConfig;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method private f(Lcom/immomo/momomediaext/utils/MMLiveUserConfig;)V
    .locals 8

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Ll/gnw;->c:Lcom/immomo/momomediaext/utils/MMLiveUserConfig;

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance v0, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;

    .line 7
    .line 8
    const-string v6, "100"

    .line 9
    .line 10
    const/4 v7, 0x0

    .line 11
    const-string v1, "0"

    .line 12
    .line 13
    const-string v2, "0"

    .line 14
    .line 15
    const-string v3, "0"

    .line 16
    .line 17
    const-string v4, "0"

    .line 18
    .line 19
    const-string v5, "0"

    .line 20
    .line 21
    invoke-direct/range {v0 .. v7}, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Ll/gnw;->c:Lcom/immomo/momomediaext/utils/MMLiveUserConfig;

    .line 25
    .line 26
    return-void
.end method


# virtual methods
.method public a(Lcom/immomo/mediacore/coninf/MRtcAudioHandler;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/gnw;->b:Ll/zzl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/16 v0, 0x64

    .line 6
    .line 7
    invoke-interface {p0, p1, v0, v0}, Ll/c4m;->Z1(Lcom/immomo/mediacore/coninf/MRtcAudioHandler;II)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public b(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gnw;->b:Ll/zzl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/c4m;->u(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public c(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gnw;->b:Ll/zzl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/zzl;->b1(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public d()Ll/mob0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gnw;->b:Ll/zzl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/c4m;->g()Ll/mob0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public e()Ll/p4k0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gnw;->e:Ll/p4k0;

    .line 2
    .line 3
    return-object p0
.end method

.method public g()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gnw;->b:Ll/zzl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/l6m;->j()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public h(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gnw;->b:Ll/zzl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/c4m;->T0(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public i(Ll/fpf0;)V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/gnw;->a:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/16 v0, 0x1388

    .line 6
    .line 7
    const/4 v1, 0x6

    .line 8
    invoke-interface {p0, v0, v1, p1}, Lcom/momo/pub/MomoPipelineModuleRegister;->i(IILl/fpf0;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public j(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gnw;->b:Ll/zzl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/c4m;->a(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public k(Ll/fb1;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/gnw;->f:Ll/fb1;

    .line 2
    .line 3
    return-void
.end method

.method public l(Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;Ljava/lang/String;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/gnw;->a:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/momo/pub/MomoPipelineModuleRegister;->getParameters()Ll/ror;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget v1, p1, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->encodeWidth:I

    .line 8
    .line 9
    iput v1, v0, Ll/tow;->m:I

    .line 10
    .line 11
    iget v1, p1, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->encodeHeight:I

    .line 12
    .line 13
    iput v1, v0, Ll/tow;->n:I

    .line 14
    .line 15
    iget v1, p1, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->videoFPS:I

    .line 16
    .line 17
    iput v1, v0, Ll/tow;->F:I

    .line 18
    .line 19
    iput v1, v0, Ll/uow;->E0:I

    .line 20
    .line 21
    invoke-static {}, Ll/qj20;->f()Ll/qj20;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    iget-object v2, p1, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->ipv6Url:Ljava/lang/String;

    .line 26
    .line 27
    iget-object v3, p1, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->url:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {v1, v2, v3}, Ll/qj20;->i(Ljava/lang/String;Ljava/lang/String;)Ll/p4k0;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    iput-object v1, p0, Ll/gnw;->e:Ll/p4k0;

    .line 34
    .line 35
    if-eqz v1, :cond_0

    .line 36
    .line 37
    invoke-virtual {v1}, Ll/p4k0;->d()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-nez v1, :cond_0

    .line 46
    .line 47
    iget-object v1, p0, Ll/gnw;->e:Ll/p4k0;

    .line 48
    .line 49
    invoke-virtual {v1}, Ll/p4k0;->d()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    iput-object v1, v0, Ll/uow;->v0:Ljava/lang/String;

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_0
    iget-object v1, p1, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->url:Ljava/lang/String;

    .line 57
    .line 58
    iput-object v1, v0, Ll/uow;->v0:Ljava/lang/String;

    .line 59
    .line 60
    const/4 v1, 0x0

    .line 61
    iput-object v1, p0, Ll/gnw;->e:Ll/p4k0;

    .line 62
    .line 63
    :goto_0
    iget-object v1, p0, Ll/gnw;->e:Ll/p4k0;

    .line 64
    .line 65
    iput-object v1, v0, Ll/uow;->w0:Ll/p4k0;

    .line 66
    .line 67
    iget v1, p1, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->videoBitRate:I

    .line 68
    .line 69
    iput v1, v0, Ll/tow;->H:I

    .line 70
    .line 71
    iget v1, p1, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->audioChannels:I

    .line 72
    .line 73
    iput v1, v0, Ll/tow;->R:I

    .line 74
    .line 75
    iget v1, p1, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->audioSampleRate:I

    .line 76
    .line 77
    iput v1, v0, Ll/tow;->P:I

    .line 78
    .line 79
    iget v1, p1, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->audioBitrate:I

    .line 80
    .line 81
    iput v1, v0, Ll/tow;->S:I

    .line 82
    .line 83
    iget v1, p1, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->videoCodecType:I

    .line 84
    .line 85
    const/4 v2, 0x2

    .line 86
    const/4 v3, 0x0

    .line 87
    const/4 v4, 0x1

    .line 88
    if-ne v1, v2, :cond_1

    .line 89
    .line 90
    move v1, v4

    .line 91
    goto :goto_1

    .line 92
    :cond_1
    move v1, v3

    .line 93
    :goto_1
    iput-boolean v1, v0, Ll/uow;->H0:Z

    .line 94
    .line 95
    iput-boolean v3, v0, Ll/uow;->G0:Z

    .line 96
    .line 97
    iget-object v0, p0, Ll/gnw;->a:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 98
    .line 99
    invoke-interface {v0}, Lcom/momo/pub/MomoPipelineModuleRegister;->L()Ll/usl;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    iput-object v0, p0, Ll/gnw;->d:Ll/usl;

    .line 104
    .line 105
    new-instance v0, Ll/brx;

    .line 106
    .line 107
    invoke-direct {v0}, Ll/brx;-><init>()V

    .line 108
    .line 109
    .line 110
    iget-object v1, p0, Ll/gnw;->c:Lcom/immomo/momomediaext/utils/MMLiveUserConfig;

    .line 111
    .line 112
    invoke-virtual {v1}, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;->getAppid()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    invoke-virtual {v0, v1}, Ll/brx;->o(Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    iget-object v1, p0, Ll/gnw;->c:Lcom/immomo/momomediaext/utils/MMLiveUserConfig;

    .line 120
    .line 121
    invoke-virtual {v1}, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;->getMomoid()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v1

    .line 125
    invoke-virtual {v0, v1}, Ll/brx;->u(Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    iget-object v1, p0, Ll/gnw;->c:Lcom/immomo/momomediaext/utils/MMLiveUserConfig;

    .line 129
    .line 130
    invoke-virtual {v1}, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;->getRoomid()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    invoke-virtual {v0, v1}, Ll/brx;->s(Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    iget v1, p1, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->cdnType:I

    .line 138
    .line 139
    invoke-virtual {v0, v1}, Ll/brx;->r(I)V

    .line 140
    .line 141
    .line 142
    iget v1, p1, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->businessType:I

    .line 143
    .line 144
    invoke-virtual {v0, v1}, Ll/brx;->p(I)V

    .line 145
    .line 146
    .line 147
    iget-object v1, p0, Ll/gnw;->a:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 148
    .line 149
    invoke-interface {v1, v0}, Lcom/momo/pub/MomoPipelineModuleRegister;->P(Ll/brx;)Ll/zzl;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    iput-object v0, p0, Ll/gnw;->b:Ll/zzl;

    .line 154
    .line 155
    iget-object v0, p0, Ll/gnw;->a:Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 156
    .line 157
    invoke-interface {v0}, Lcom/momo/pub/MomoPipelineModuleRegister;->x()Ll/dpl;

    .line 158
    .line 159
    .line 160
    move-result-object v1

    .line 161
    invoke-interface {v0, v1}, Lcom/momo/pub/MomoPipelineModuleRegister;->J(Ll/dpl;)V

    .line 162
    .line 163
    .line 164
    iget-object v0, p0, Ll/gnw;->b:Ll/zzl;

    .line 165
    .line 166
    invoke-interface {v0, v4}, Ll/c4m;->t1(I)V

    .line 167
    .line 168
    .line 169
    iget-object p1, p1, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->url:Ljava/lang/String;

    .line 170
    .line 171
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 172
    .line 173
    .line 174
    move-result p1

    .line 175
    if-eqz p1, :cond_2

    .line 176
    .line 177
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 178
    .line 179
    .line 180
    move-result-object p1

    .line 181
    const-string v0, "rtmpUrl"

    .line 182
    .line 183
    sget-object v1, Lcom/immomo/medialog/LogLevel;->ERROR:Lcom/immomo/medialog/LogLevel;

    .line 184
    .line 185
    const-string v2, "startPush"

    .line 186
    .line 187
    invoke-virtual {p1, v2, v0, v1}, Ll/b7y;->a(Ljava/lang/String;Ljava/lang/String;Lcom/immomo/medialog/LogLevel;)V

    .line 188
    .line 189
    .line 190
    :cond_2
    iget-object p1, p0, Ll/gnw;->b:Ll/zzl;

    .line 191
    .line 192
    if-eqz p1, :cond_4

    .line 193
    .line 194
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 195
    .line 196
    .line 197
    move-result p1

    .line 198
    if-nez p1, :cond_3

    .line 199
    .line 200
    iget-object p1, p0, Ll/gnw;->b:Ll/zzl;

    .line 201
    .line 202
    invoke-interface {p1, p2}, Ll/c4m;->J(Ljava/lang/String;)V

    .line 203
    .line 204
    .line 205
    :cond_3
    iget-object p1, p0, Ll/gnw;->b:Ll/zzl;

    .line 206
    .line 207
    iget-object p2, p0, Ll/gnw;->f:Ll/fb1;

    .line 208
    .line 209
    invoke-interface {p1, p2}, Ll/l6m;->R(Ll/fb1;)V

    .line 210
    .line 211
    .line 212
    iget-object p0, p0, Ll/gnw;->b:Ll/zzl;

    .line 213
    .line 214
    invoke-interface {p0}, Ll/c4m;->t0()I

    .line 215
    .line 216
    .line 217
    :cond_4
    return-void
.end method

.method public m(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gnw;->b:Ll/zzl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/l6m;->O1(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public n()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gnw;->b:Ll/zzl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/c4m;->f()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public o()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gnw;->b:Ll/zzl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/l6m;->stopSurroundMusic()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
