.class public Ll/emb0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private agoraGlFlush:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "agora_gl_flush"
    .end annotation
.end field

.field private agoraMinkbs:Ljava/util/List;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "agora_minkbs"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private agoraRtcKeepAlive:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "agora_rtc_keepalive"
    .end annotation
.end field

.field private agora_ai_aec:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "agora_ai_aec"
    .end annotation
.end field

.field private agora_ai_ns:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "agora_ai_ns"
    .end annotation
.end field

.field private audioProfile:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "audio_profile"
    .end annotation
.end field

.field private audioScenario:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "audio_scenario"
    .end annotation
.end field

.field public beautifyScale:Ll/wu2;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "beautify_scale"
    .end annotation
.end field

.field public beautyConfig:Ll/zu2;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "beauty_config"
    .end annotation
.end field

.field private cam:Ll/g94;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "cam"
    .end annotation
.end field

.field private clearView:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "clear_view"
    .end annotation
.end field

.field public commParms:Ll/vg5;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "comm_parms"
    .end annotation
.end field

.field public cvConfig:Ll/a1c;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "cv_config"
    .end annotation
.end field

.field private enableBEncode:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "enable_B_encode"
    .end annotation
.end field

.field private fdkAacOnoff:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "fdk_aac_onoff"
    .end annotation
.end field

.field private focusEnable:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "focus_enable"
    .end annotation
.end field

.field private hevcDropRasl:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "hevc_drop_rasl"
    .end annotation
.end field

.field private previewRenderApi:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "preview_render_api"
    .end annotation
.end field

.field private syncStreamReplace:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "sync_stream_replace"
    .end annotation
.end field

.field private tanscodeABitrate:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "tanscode_aBitrate"
    .end annotation
.end field

.field public vbrConfig:Ll/q1l0;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "vbr_config"
    .end annotation
.end field

.field private volcGlFlush:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "volc_gl_flush"
    .end annotation
.end field

.field private volcMinkbs:Ljava/util/List;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "volc_minkbs"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private volcRtcKeepAlive:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "volc_rtc_keepalive"
    .end annotation
.end field

.field private volcTestAppidList:Ljava/util/List;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "volc_test_appid_list"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Ll/emb0;->audioScenario:I

    .line 6
    .line 7
    iput v0, p0, Ll/emb0;->audioProfile:I

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    iput v0, p0, Ll/emb0;->clearView:I

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput v0, p0, Ll/emb0;->syncStreamReplace:I

    .line 14
    .line 15
    iput v0, p0, Ll/emb0;->agoraGlFlush:I

    .line 16
    .line 17
    iput v0, p0, Ll/emb0;->agoraRtcKeepAlive:I

    .line 18
    .line 19
    iput v0, p0, Ll/emb0;->volcRtcKeepAlive:I

    .line 20
    .line 21
    iput v0, p0, Ll/emb0;->agora_ai_aec:I

    .line 22
    .line 23
    iput v0, p0, Ll/emb0;->agora_ai_ns:I

    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public a()I
    .locals 0

    .line 1
    iget p0, p0, Ll/emb0;->agoraGlFlush:I

    .line 2
    .line 3
    return p0
.end method

.method public b()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/emb0;->agoraMinkbs:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()I
    .locals 0

    .line 1
    iget p0, p0, Ll/emb0;->agoraRtcKeepAlive:I

    .line 2
    .line 3
    return p0
.end method

.method public d()I
    .locals 0

    .line 1
    iget p0, p0, Ll/emb0;->agora_ai_aec:I

    .line 2
    .line 3
    return p0
.end method

.method public e()I
    .locals 0

    .line 1
    iget p0, p0, Ll/emb0;->agora_ai_ns:I

    .line 2
    .line 3
    return p0
.end method

.method public f()I
    .locals 0

    .line 1
    iget p0, p0, Ll/emb0;->audioProfile:I

    .line 2
    .line 3
    return p0
.end method

.method public g()I
    .locals 0

    .line 1
    iget p0, p0, Ll/emb0;->audioScenario:I

    .line 2
    .line 3
    return p0
.end method

.method public h()Ll/zu2;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/emb0;->beautyConfig:Ll/zu2;

    .line 2
    .line 3
    return-object p0
.end method

.method public i()I
    .locals 0

    .line 1
    iget p0, p0, Ll/emb0;->clearView:I

    .line 2
    .line 3
    return p0
.end method

.method public j()Ll/vg5;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/emb0;->commParms:Ll/vg5;

    .line 2
    .line 3
    return-object p0
.end method

.method public k()Ll/a1c;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/emb0;->cvConfig:Ll/a1c;

    .line 2
    .line 3
    return-object p0
.end method

.method public l()I
    .locals 0

    .line 1
    iget p0, p0, Ll/emb0;->enableBEncode:I

    .line 2
    .line 3
    return p0
.end method

.method public m()I
    .locals 0

    .line 1
    iget p0, p0, Ll/emb0;->focusEnable:I

    .line 2
    .line 3
    return p0
.end method

.method public n()I
    .locals 0

    .line 1
    iget p0, p0, Ll/emb0;->syncStreamReplace:I

    .line 2
    .line 3
    return p0
.end method

.method public o()I
    .locals 0

    .line 1
    iget p0, p0, Ll/emb0;->tanscodeABitrate:I

    .line 2
    .line 3
    return p0
.end method

.method public p()Ll/q1l0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/emb0;->vbrConfig:Ll/q1l0;

    .line 2
    .line 3
    return-object p0
.end method

.method public q()I
    .locals 0

    .line 1
    iget p0, p0, Ll/emb0;->volcGlFlush:I

    .line 2
    .line 3
    return p0
.end method

.method public r()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/emb0;->volcMinkbs:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public s()I
    .locals 0

    .line 1
    iget p0, p0, Ll/emb0;->volcRtcKeepAlive:I

    .line 2
    .line 3
    return p0
.end method

.method public t()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/emb0;->volcTestAppidList:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "PushConfig{beautyConfig="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Ll/emb0;->beautyConfig:Ll/zu2;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ", beautifyScale="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Ll/emb0;->beautifyScale:Ll/wu2;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ", commParms="

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Ll/emb0;->commParms:Ll/vg5;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, ", cvConfig="

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-object v1, p0, Ll/emb0;->cvConfig:Ll/a1c;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, ", cam="

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget-object v1, p0, Ll/emb0;->cam:Ll/g94;

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v1, ", focusEnable="

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget v1, p0, Ll/emb0;->focusEnable:I

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v1, ", audioScenario="

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    iget v1, p0, Ll/emb0;->audioScenario:I

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    const-string v1, ", audioProfile="

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    iget v1, p0, Ll/emb0;->audioProfile:I

    .line 79
    .line 80
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    const-string v1, ", fdkAacOnoff="

    .line 84
    .line 85
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    iget v1, p0, Ll/emb0;->fdkAacOnoff:I

    .line 89
    .line 90
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    const-string v1, ", enableBEncode="

    .line 94
    .line 95
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    iget v1, p0, Ll/emb0;->enableBEncode:I

    .line 99
    .line 100
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    const-string v1, ", agoraMinkbs="

    .line 104
    .line 105
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    iget-object v1, p0, Ll/emb0;->agoraMinkbs:Ljava/util/List;

    .line 109
    .line 110
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    const-string v1, ", volcMinkbs="

    .line 114
    .line 115
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    iget-object v1, p0, Ll/emb0;->volcMinkbs:Ljava/util/List;

    .line 119
    .line 120
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    const-string v1, ", tanscodeABitrate="

    .line 124
    .line 125
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    iget v1, p0, Ll/emb0;->tanscodeABitrate:I

    .line 129
    .line 130
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    const-string v1, ", volcGlFlush="

    .line 134
    .line 135
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    iget v1, p0, Ll/emb0;->volcGlFlush:I

    .line 139
    .line 140
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    const-string v1, ", hevcDropRasl="

    .line 144
    .line 145
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    iget v1, p0, Ll/emb0;->hevcDropRasl:I

    .line 149
    .line 150
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    const-string v1, ", vbrConfig="

    .line 154
    .line 155
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    iget-object v1, p0, Ll/emb0;->vbrConfig:Ll/q1l0;

    .line 159
    .line 160
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    const-string v1, ", volcTestAppidList="

    .line 164
    .line 165
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    iget-object v1, p0, Ll/emb0;->volcTestAppidList:Ljava/util/List;

    .line 169
    .line 170
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 171
    .line 172
    .line 173
    const-string v1, ", previewRenderApi="

    .line 174
    .line 175
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 176
    .line 177
    .line 178
    iget p0, p0, Ll/emb0;->previewRenderApi:I

    .line 179
    .line 180
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 181
    .line 182
    .line 183
    const/16 p0, 0x7d

    .line 184
    .line 185
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 189
    .line 190
    .line 191
    move-result-object p0

    .line 192
    return-object p0
.end method
