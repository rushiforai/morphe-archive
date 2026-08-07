.class Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/momortc/IMMRtcEngineEventInterface;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->m5(Ll/uow;)Lcom/momo/momortc/MMRtcEngine;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;


# direct methods
.method public constructor <init>(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private a(Lcom/momo/momortc/IMMRtcEngineEventInterface$LocalVideoStats;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v2, "onLocalVideoStatsstats:"

    .line 8
    .line 9
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const-string v2, "MoMoRtcPushFilter"

    .line 20
    .line 21
    invoke-virtual {v0, v2, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 25
    .line 26
    invoke-static {v0, p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->H3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;Lcom/momo/momortc/IMMRtcEngineEventInterface$LocalVideoStats;)Lcom/momo/momortc/IMMRtcEngineEventInterface$LocalVideoStats;

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 30
    .line 31
    const/4 v0, 0x0

    .line 32
    invoke-static {p1, v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->I3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;Z)Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-eqz p1, :cond_0

    .line 37
    .line 38
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 39
    .line 40
    const/4 v1, 0x1

    .line 41
    invoke-static {p1, v1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->I3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;Z)Z

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 45
    .line 46
    invoke-static {p1, v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->J3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;Z)Z

    .line 47
    .line 48
    .line 49
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 50
    .line 51
    invoke-static {p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->d3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/q210$a;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    const/16 v1, 0x1003

    .line 56
    .line 57
    iget-object v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 58
    .line 59
    invoke-interface {p1, v1, v0, v0, v2}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 60
    .line 61
    .line 62
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 63
    .line 64
    invoke-static {p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->K3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)I

    .line 65
    .line 66
    .line 67
    :cond_0
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 68
    .line 69
    invoke-static {p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->D3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/wpw;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    if-eqz p1, :cond_1

    .line 74
    .line 75
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 76
    .line 77
    invoke-static {p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->L3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/imw;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 82
    .line 83
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->G3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/momo/momortc/IMMRtcEngineEventInterface$LocalVideoStats;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    iget v0, v0, Lcom/momo/momortc/IMMRtcEngineEventInterface$LocalVideoStats;->sentBitrate:I

    .line 88
    .line 89
    iput v0, p1, Ll/imw;->a:I

    .line 90
    .line 91
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 92
    .line 93
    invoke-static {p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->L3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/imw;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 98
    .line 99
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->G3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/momo/momortc/IMMRtcEngineEventInterface$LocalVideoStats;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    iget v0, v0, Lcom/momo/momortc/IMMRtcEngineEventInterface$LocalVideoStats;->sentFrameRate:I

    .line 104
    .line 105
    iput v0, p1, Ll/imw;->b:I

    .line 106
    .line 107
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 108
    .line 109
    invoke-static {p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->D3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/wpw;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 114
    .line 115
    invoke-static {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->L3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/imw;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    invoke-interface {p1, p0}, Ll/wpw;->b(Ll/imw;)V

    .line 120
    .line 121
    .line 122
    :cond_1
    return-void
.end method

.method private b(Lcom/momo/momortc/IMMRtcEngineEventInterface$RemoteVideoStats;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v2, " onRemoteVideoStatsstats:"

    .line 8
    .line 9
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v2, "w "

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    iget v2, p1, Lcom/momo/momortc/IMMRtcEngineEventInterface$RemoteVideoStats;->width:I

    .line 21
    .line 22
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string v2, " h "

    .line 26
    .line 27
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    iget v2, p1, Lcom/momo/momortc/IMMRtcEngineEventInterface$RemoteVideoStats;->height:I

    .line 31
    .line 32
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    const-string v2, " bits "

    .line 36
    .line 37
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    iget v2, p1, Lcom/momo/momortc/IMMRtcEngineEventInterface$RemoteVideoStats;->receivedBitrate:I

    .line 41
    .line 42
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    const-string v2, " fps "

    .line 46
    .line 47
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    iget v2, p1, Lcom/momo/momortc/IMMRtcEngineEventInterface$RemoteVideoStats;->receivedFrameRate:I

    .line 51
    .line 52
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    const-string v2, "MoMoRtcPushFilter"

    .line 60
    .line 61
    invoke-virtual {v0, v2, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 65
    .line 66
    invoke-static {v0, p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->C3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;Lcom/momo/momortc/IMMRtcEngineEventInterface$RemoteVideoStats;)Lcom/momo/momortc/IMMRtcEngineEventInterface$RemoteVideoStats;

    .line 67
    .line 68
    .line 69
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 70
    .line 71
    invoke-static {p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->D3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/wpw;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    if-eqz p1, :cond_0

    .line 76
    .line 77
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 78
    .line 79
    invoke-static {p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->F3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/tpw;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 84
    .line 85
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->B3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/momo/momortc/IMMRtcEngineEventInterface$RemoteVideoStats;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    iget v0, v0, Lcom/momo/momortc/IMMRtcEngineEventInterface$RemoteVideoStats;->delay:I

    .line 90
    .line 91
    iput v0, p1, Ll/tpw;->b:I

    .line 92
    .line 93
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 94
    .line 95
    invoke-static {p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->F3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/tpw;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 100
    .line 101
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->B3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/momo/momortc/IMMRtcEngineEventInterface$RemoteVideoStats;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    iget v0, v0, Lcom/momo/momortc/IMMRtcEngineEventInterface$RemoteVideoStats;->height:I

    .line 106
    .line 107
    iput v0, p1, Ll/tpw;->d:I

    .line 108
    .line 109
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 110
    .line 111
    invoke-static {p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->F3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/tpw;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 116
    .line 117
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->B3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/momo/momortc/IMMRtcEngineEventInterface$RemoteVideoStats;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    iget v0, v0, Lcom/momo/momortc/IMMRtcEngineEventInterface$RemoteVideoStats;->delay:I

    .line 122
    .line 123
    iput v0, p1, Ll/tpw;->b:I

    .line 124
    .line 125
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 126
    .line 127
    invoke-static {p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->F3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/tpw;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 132
    .line 133
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->B3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/momo/momortc/IMMRtcEngineEventInterface$RemoteVideoStats;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    iget v0, v0, Lcom/momo/momortc/IMMRtcEngineEventInterface$RemoteVideoStats;->receivedBitrate:I

    .line 138
    .line 139
    iput v0, p1, Ll/tpw;->e:I

    .line 140
    .line 141
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 142
    .line 143
    invoke-static {p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->F3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/tpw;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 148
    .line 149
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->B3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/momo/momortc/IMMRtcEngineEventInterface$RemoteVideoStats;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    iget v0, v0, Lcom/momo/momortc/IMMRtcEngineEventInterface$RemoteVideoStats;->receivedFrameRate:I

    .line 154
    .line 155
    iput v0, p1, Ll/tpw;->f:I

    .line 156
    .line 157
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 158
    .line 159
    invoke-static {p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->F3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/tpw;

    .line 160
    .line 161
    .line 162
    move-result-object p1

    .line 163
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 164
    .line 165
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->B3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/momo/momortc/IMMRtcEngineEventInterface$RemoteVideoStats;

    .line 166
    .line 167
    .line 168
    move-result-object v0

    .line 169
    iget v0, v0, Lcom/momo/momortc/IMMRtcEngineEventInterface$RemoteVideoStats;->rxStreamType:I

    .line 170
    .line 171
    iput v0, p1, Ll/tpw;->g:I

    .line 172
    .line 173
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 174
    .line 175
    invoke-static {p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->F3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/tpw;

    .line 176
    .line 177
    .line 178
    move-result-object p1

    .line 179
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 180
    .line 181
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->B3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/momo/momortc/IMMRtcEngineEventInterface$RemoteVideoStats;

    .line 182
    .line 183
    .line 184
    move-result-object v0

    .line 185
    iget v0, v0, Lcom/momo/momortc/IMMRtcEngineEventInterface$RemoteVideoStats;->uid:I

    .line 186
    .line 187
    iput v0, p1, Ll/tpw;->a:I

    .line 188
    .line 189
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 190
    .line 191
    invoke-static {p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->F3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/tpw;

    .line 192
    .line 193
    .line 194
    move-result-object p1

    .line 195
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 196
    .line 197
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->B3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/momo/momortc/IMMRtcEngineEventInterface$RemoteVideoStats;

    .line 198
    .line 199
    .line 200
    move-result-object v0

    .line 201
    iget v0, v0, Lcom/momo/momortc/IMMRtcEngineEventInterface$RemoteVideoStats;->width:I

    .line 202
    .line 203
    iput v0, p1, Ll/tpw;->c:I

    .line 204
    .line 205
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 206
    .line 207
    invoke-static {p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->D3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/wpw;

    .line 208
    .line 209
    .line 210
    move-result-object p1

    .line 211
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 212
    .line 213
    invoke-static {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->F3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/tpw;

    .line 214
    .line 215
    .line 216
    move-result-object p0

    .line 217
    invoke-interface {p1, p0}, Ll/wpw;->a(Ll/tpw;)V

    .line 218
    .line 219
    .line 220
    :cond_0
    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 1
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public didOnKickedOut(Ljava/lang/String;III)V
    .locals 0

    .line 1
    iget-object p2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    invoke-static {p2}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->J2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/kod0;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->J2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/kod0;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    int-to-long p2, p3

    .line 16
    invoke-virtual {p0, p1, p2, p3}, Ll/kod0;->j(Ljava/lang/String;J)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    if-eq p0, p1, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    const/4 p0, 0x1

    return p0
.end method

.method public finalize()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 1
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public hashCode()I
    .locals 0

    .line 1
    invoke-super {p0}, Ljava/lang/Object;->hashCode()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public onActiveSpeaker(I)V
    .locals 0

    return-void
.end method

.method public onApiCallExecuted(ILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public onAudioEffectFinished(I)V
    .locals 0

    return-void
.end method

.method public onAudioMixingBegin()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->K2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/nnw;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onAudioMixingError()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->K2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/nnw;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onAudioMixingFinished()V
    .locals 4

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "MoMoRtcPushFilter"

    .line 6
    .line 7
    const-string v2, "onAudioMixingFinished"

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-static {v0, v1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->i4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;Z)Z

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    const/4 v3, 0x2

    .line 22
    invoke-static {v0, v2, v3, v1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->j4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;Ljava/lang/Object;II)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 26
    .line 27
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->f3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 34
    .line 35
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->f3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-interface {v0}, Lcom/immomo/mediacore/coninf/MRtcEventHandler;->onAudioMixingFinished()V

    .line 40
    .line 41
    .line 42
    :cond_0
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 43
    .line 44
    invoke-static {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->K2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/nnw;

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public onAudioQuality(IISS)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->i3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    int-to-long v1, p1

    .line 8
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/util/AbstractMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Ll/iny;

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    invoke-virtual {v0, p3, p4}, Ll/iny;->j(II)V

    .line 21
    .line 22
    .line 23
    :cond_0
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->a4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/immomo/mediacore/coninf/MRtcQualityHandler;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 32
    .line 33
    invoke-static {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->a4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/immomo/mediacore/coninf/MRtcQualityHandler;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-interface {p0, p1, p2, p3, p4}, Lcom/immomo/mediacore/coninf/MRtcQualityHandler;->onAudioQuality(IISS)V

    .line 38
    .line 39
    .line 40
    :cond_1
    return-void
.end method

.method public onAudioRouteChanged(I)V
    .locals 0

    return-void
.end method

.method public onAudioVolumeIndication([Lcom/momo/momortc/AudioVolumeInfo;I)V
    .locals 13

    .line 1
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->n3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_5

    .line 10
    .line 11
    :cond_0
    array-length v0, p1

    .line 12
    if-lez v0, :cond_8

    .line 13
    .line 14
    iget-object v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 15
    .line 16
    invoke-static {v1, p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->q3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;[Lcom/momo/momortc/AudioVolumeInfo;)[Lcom/momo/momortc/AudioVolumeInfo;

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 20
    .line 21
    invoke-static {v1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->r3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/immomo/mediacore/coninf/MRtcAudioHandlerEx;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    const/4 v2, 0x0

    .line 26
    const-wide/16 v3, 0x0

    .line 27
    .line 28
    const/4 v5, 0x0

    .line 29
    const/high16 v6, 0x41200000    # 10.0f

    .line 30
    .line 31
    const/high16 v7, 0x3f800000    # 1.0f

    .line 32
    .line 33
    if-eqz v1, :cond_4

    .line 34
    .line 35
    new-array v1, v0, [Lcom/immomo/mediacore/audio/AudioVolumeWeight;

    .line 36
    .line 37
    const/4 v8, -0x1

    .line 38
    move v9, v5

    .line 39
    :goto_0
    if-ge v9, v0, :cond_2

    .line 40
    .line 41
    new-instance v10, Lcom/immomo/mediacore/audio/AudioVolumeWeight;

    .line 42
    .line 43
    invoke-direct {v10}, Lcom/immomo/mediacore/audio/AudioVolumeWeight;-><init>()V

    .line 44
    .line 45
    .line 46
    iget-object v11, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 47
    .line 48
    invoke-static {v11}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->p3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)[Lcom/momo/momortc/AudioVolumeInfo;

    .line 49
    .line 50
    .line 51
    move-result-object v11

    .line 52
    aget-object v11, v11, v9

    .line 53
    .line 54
    iget-wide v11, v11, Lcom/momo/momortc/AudioVolumeInfo;->uid:J

    .line 55
    .line 56
    cmp-long v11, v11, v3

    .line 57
    .line 58
    if-nez v11, :cond_1

    .line 59
    .line 60
    move v8, v9

    .line 61
    :cond_1
    iget-object v11, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 62
    .line 63
    invoke-static {v11}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->p3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)[Lcom/momo/momortc/AudioVolumeInfo;

    .line 64
    .line 65
    .line 66
    move-result-object v11

    .line 67
    aget-object v11, v11, v9

    .line 68
    .line 69
    iget-wide v11, v11, Lcom/momo/momortc/AudioVolumeInfo;->uid:J

    .line 70
    .line 71
    long-to-int v11, v11

    .line 72
    iput v11, v10, Lcom/immomo/mediacore/audio/AudioVolumeWeight;->uid:I

    .line 73
    .line 74
    iget-object v11, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 75
    .line 76
    invoke-static {v11}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->p3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)[Lcom/momo/momortc/AudioVolumeInfo;

    .line 77
    .line 78
    .line 79
    move-result-object v11

    .line 80
    aget-object v11, v11, v9

    .line 81
    .line 82
    iget v11, v11, Lcom/momo/momortc/AudioVolumeInfo;->volume:I

    .line 83
    .line 84
    int-to-float v11, v11

    .line 85
    mul-float/2addr v11, v7

    .line 86
    div-float/2addr v11, v6

    .line 87
    iput v11, v10, Lcom/immomo/mediacore/audio/AudioVolumeWeight;->volume:F

    .line 88
    .line 89
    aput-object v10, v1, v9

    .line 90
    .line 91
    add-int/lit8 v9, v9, 0x1

    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_2
    iget-object v9, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 95
    .line 96
    invoke-static {v9}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->r3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/immomo/mediacore/coninf/MRtcAudioHandlerEx;

    .line 97
    .line 98
    .line 99
    move-result-object v9

    .line 100
    invoke-interface {v9, v1, p2}, Lcom/immomo/mediacore/coninf/MRtcAudioHandlerEx;->onAudioVolumeIndication([Lcom/immomo/mediacore/audio/AudioVolumeWeight;I)V

    .line 101
    .line 102
    .line 103
    if-lez v8, :cond_4

    .line 104
    .line 105
    new-instance v1, Lcom/immomo/mediacore/audio/AudioVolumeWeight;

    .line 106
    .line 107
    invoke-direct {v1}, Lcom/immomo/mediacore/audio/AudioVolumeWeight;-><init>()V

    .line 108
    .line 109
    .line 110
    iget-object v8, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 111
    .line 112
    invoke-static {v8}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->k3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/ror;

    .line 113
    .line 114
    .line 115
    move-result-object v8

    .line 116
    iget v8, v8, Ll/uow;->B0:I

    .line 117
    .line 118
    iput v8, v1, Lcom/immomo/mediacore/audio/AudioVolumeWeight;->uid:I

    .line 119
    .line 120
    iget-object v8, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 121
    .line 122
    invoke-static {v8}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->t3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Z

    .line 123
    .line 124
    .line 125
    move-result v8

    .line 126
    if-nez v8, :cond_3

    .line 127
    .line 128
    aget-object p1, p1, v5

    .line 129
    .line 130
    iget p1, p1, Lcom/momo/momortc/AudioVolumeInfo;->volume:I

    .line 131
    .line 132
    int-to-float p1, p1

    .line 133
    mul-float/2addr p1, v7

    .line 134
    div-float/2addr p1, v6

    .line 135
    iput p1, v1, Lcom/immomo/mediacore/audio/AudioVolumeWeight;->volume:F

    .line 136
    .line 137
    goto :goto_1

    .line 138
    :cond_3
    iput v2, v1, Lcom/immomo/mediacore/audio/AudioVolumeWeight;->volume:F

    .line 139
    .line 140
    :goto_1
    filled-new-array {v1}, [Lcom/immomo/mediacore/audio/AudioVolumeWeight;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    iget-object v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 145
    .line 146
    invoke-static {v1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->r3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/immomo/mediacore/coninf/MRtcAudioHandlerEx;

    .line 147
    .line 148
    .line 149
    move-result-object v1

    .line 150
    invoke-interface {v1, p1, p2}, Lcom/immomo/mediacore/coninf/MRtcAudioHandlerEx;->onAudioVolumeIndication([Lcom/immomo/mediacore/audio/AudioVolumeWeight;I)V

    .line 151
    .line 152
    .line 153
    :cond_4
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 154
    .line 155
    invoke-static {p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->u3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/immomo/mediacore/coninf/MRtcAudioHandler;

    .line 156
    .line 157
    .line 158
    move-result-object p1

    .line 159
    if-eqz p1, :cond_8

    .line 160
    .line 161
    new-array p1, v0, [Lcom/immomo/mediacore/audio/AudioVolumeWeight;

    .line 162
    .line 163
    :goto_2
    if-ge v5, v0, :cond_7

    .line 164
    .line 165
    new-instance v1, Lcom/immomo/mediacore/audio/AudioVolumeWeight;

    .line 166
    .line 167
    invoke-direct {v1}, Lcom/immomo/mediacore/audio/AudioVolumeWeight;-><init>()V

    .line 168
    .line 169
    .line 170
    iget-object v8, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 171
    .line 172
    invoke-static {v8}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->p3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)[Lcom/momo/momortc/AudioVolumeInfo;

    .line 173
    .line 174
    .line 175
    move-result-object v8

    .line 176
    aget-object v8, v8, v5

    .line 177
    .line 178
    iget-wide v8, v8, Lcom/momo/momortc/AudioVolumeInfo;->uid:J

    .line 179
    .line 180
    cmp-long v8, v8, v3

    .line 181
    .line 182
    iget-object v9, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 183
    .line 184
    if-nez v8, :cond_6

    .line 185
    .line 186
    invoke-static {v9}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->p3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)[Lcom/momo/momortc/AudioVolumeInfo;

    .line 187
    .line 188
    .line 189
    move-result-object v8

    .line 190
    aget-object v8, v8, v5

    .line 191
    .line 192
    iget-object v9, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 193
    .line 194
    invoke-static {v9}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->k3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/ror;

    .line 195
    .line 196
    .line 197
    move-result-object v9

    .line 198
    iget v9, v9, Ll/uow;->B0:I

    .line 199
    .line 200
    int-to-long v9, v9

    .line 201
    iput-wide v9, v8, Lcom/momo/momortc/AudioVolumeInfo;->uid:J

    .line 202
    .line 203
    iget-object v8, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 204
    .line 205
    invoke-static {v8}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->t3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Z

    .line 206
    .line 207
    .line 208
    move-result v8

    .line 209
    if-nez v8, :cond_5

    .line 210
    .line 211
    iget-object v8, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 212
    .line 213
    invoke-static {v8}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->p3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)[Lcom/momo/momortc/AudioVolumeInfo;

    .line 214
    .line 215
    .line 216
    move-result-object v8

    .line 217
    aget-object v8, v8, v5

    .line 218
    .line 219
    iget v8, v8, Lcom/momo/momortc/AudioVolumeInfo;->volume:I

    .line 220
    .line 221
    int-to-float v8, v8

    .line 222
    mul-float/2addr v8, v7

    .line 223
    div-float/2addr v8, v6

    .line 224
    iput v8, v1, Lcom/immomo/mediacore/audio/AudioVolumeWeight;->volume:F

    .line 225
    .line 226
    goto :goto_3

    .line 227
    :cond_5
    iput v2, v1, Lcom/immomo/mediacore/audio/AudioVolumeWeight;->volume:F

    .line 228
    .line 229
    :goto_3
    iget-object v8, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 230
    .line 231
    invoke-static {v8}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->p3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)[Lcom/momo/momortc/AudioVolumeInfo;

    .line 232
    .line 233
    .line 234
    move-result-object v8

    .line 235
    aget-object v8, v8, v5

    .line 236
    .line 237
    iget-wide v8, v8, Lcom/momo/momortc/AudioVolumeInfo;->uid:J

    .line 238
    .line 239
    long-to-int v8, v8

    .line 240
    iput v8, v1, Lcom/immomo/mediacore/audio/AudioVolumeWeight;->uid:I

    .line 241
    .line 242
    goto :goto_4

    .line 243
    :cond_6
    invoke-static {v9}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->p3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)[Lcom/momo/momortc/AudioVolumeInfo;

    .line 244
    .line 245
    .line 246
    move-result-object v8

    .line 247
    aget-object v8, v8, v5

    .line 248
    .line 249
    iget-wide v8, v8, Lcom/momo/momortc/AudioVolumeInfo;->uid:J

    .line 250
    .line 251
    long-to-int v8, v8

    .line 252
    iput v8, v1, Lcom/immomo/mediacore/audio/AudioVolumeWeight;->uid:I

    .line 253
    .line 254
    iget-object v8, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 255
    .line 256
    invoke-static {v8}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->p3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)[Lcom/momo/momortc/AudioVolumeInfo;

    .line 257
    .line 258
    .line 259
    move-result-object v8

    .line 260
    aget-object v8, v8, v5

    .line 261
    .line 262
    iget v8, v8, Lcom/momo/momortc/AudioVolumeInfo;->volume:I

    .line 263
    .line 264
    int-to-float v8, v8

    .line 265
    mul-float/2addr v8, v7

    .line 266
    div-float/2addr v8, v6

    .line 267
    iput v8, v1, Lcom/immomo/mediacore/audio/AudioVolumeWeight;->volume:F

    .line 268
    .line 269
    :goto_4
    aput-object v1, p1, v5

    .line 270
    .line 271
    add-int/lit8 v5, v5, 0x1

    .line 272
    .line 273
    goto :goto_2

    .line 274
    :cond_7
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 275
    .line 276
    invoke-static {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->u3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/immomo/mediacore/coninf/MRtcAudioHandler;

    .line 277
    .line 278
    .line 279
    move-result-object p0

    .line 280
    invoke-interface {p0, p1, p2}, Lcom/immomo/mediacore/coninf/MRtcAudioHandler;->onAudioVolumeIndication([Lcom/immomo/mediacore/audio/AudioVolumeWeight;I)V

    .line 281
    .line 282
    .line 283
    :cond_8
    :goto_5
    return-void
.end method

.method public onCameraFocusAreaChanged(Landroid/graphics/Rect;)V
    .locals 0

    return-void
.end method

.method public onCameraReady()V
    .locals 0

    return-void
.end method

.method public onChannelList(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    return-void
.end method

.method public onClientRoleChanged(II)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->o4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/evx;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    const-string v3, "onClientRoleChanged"

    .line 16
    .line 17
    filled-new-array {v3, v1, v2}, [Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 25
    .line 26
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->p4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/wvx;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-boolean v0, v0, Ll/wvx;->b:Z

    .line 31
    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 35
    .line 36
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->b3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    iget-object v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 41
    .line 42
    const/4 v2, 0x1

    .line 43
    if-ne v0, v2, :cond_0

    .line 44
    .line 45
    invoke-virtual {v1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->h2()V

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_0
    invoke-virtual {v1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->f2()V

    .line 50
    .line 51
    .line 52
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 53
    .line 54
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->q4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/immomo/mediacore/coninf/MRtcClientRoleChangedHandler;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    if-eqz v0, :cond_2

    .line 59
    .line 60
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 61
    .line 62
    invoke-static {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->q4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/immomo/mediacore/coninf/MRtcClientRoleChangedHandler;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-interface {p0, p1, p2}, Lcom/immomo/mediacore/coninf/MRtcClientRoleChangedHandler;->onClientRoleChanged(II)V

    .line 67
    .line 68
    .line 69
    :cond_2
    return-void
.end method

.method public onConnectionBanned()V
    .locals 4

    .line 1
    const-string v0, "unint"

    .line 2
    .line 3
    const-string v1, "onConnectionBanned"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->m4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/immomo/mediacore/coninf/MRtcConnectHandler;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 17
    .line 18
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->m4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/immomo/mediacore/coninf/MRtcConnectHandler;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-interface {v0}, Lcom/immomo/mediacore/coninf/MRtcConnectHandler;->onReconnectTimeout()V

    .line 23
    .line 24
    .line 25
    :cond_0
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 26
    .line 27
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->d3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/q210$a;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const/4 v1, 0x0

    .line 32
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 33
    .line 34
    const/16 v2, 0x1101

    .line 35
    .line 36
    const/16 v3, 0xa

    .line 37
    .line 38
    invoke-interface {v0, v2, v3, v1, p0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public onConnectionInterrupted()V
    .locals 2

    .line 1
    const-string v0, "unint"

    .line 2
    .line 3
    const-string v1, "onConnectionInterrupted"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 9
    .line 10
    invoke-static {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->Z3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/ypw;

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public onConnectionLost()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->k4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/evx;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "onConnectionLost"

    .line 8
    .line 9
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    const-string v0, "unint"

    .line 17
    .line 18
    const-string v1, "onConnectionLost="

    .line 19
    .line 20
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->f3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 32
    .line 33
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->f3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-interface {v0}, Lcom/immomo/mediacore/coninf/MRtcEventHandler;->onConnectionLost()V

    .line 38
    .line 39
    .line 40
    :cond_0
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 41
    .line 42
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->l4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/wvx;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    const-wide/16 v1, 0xa

    .line 47
    .line 48
    iput-wide v1, v0, Ll/wvx;->y0:J

    .line 49
    .line 50
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 51
    .line 52
    const/16 v0, 0x1101

    .line 53
    .line 54
    const/16 v1, 0xa

    .line 55
    .line 56
    invoke-virtual {p0, v0, v1}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->e2(II)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public onError(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    const/16 v1, 0x1f7

    .line 4
    .line 5
    if-ne p1, v1, :cond_0

    .line 6
    .line 7
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->e4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/evx;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "onDNSError"

    .line 12
    .line 13
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    filled-new-array {v1, v2}, [Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->f4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/evx;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const-string v1, "onError"

    .line 30
    .line 31
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    filled-new-array {v1, v2}, [Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    const-string v1, "onError="

    .line 45
    .line 46
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    const-string v1, "unint"

    .line 57
    .line 58
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 59
    .line 60
    .line 61
    if-nez p1, :cond_1

    .line 62
    .line 63
    return-void

    .line 64
    :cond_1
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 65
    .line 66
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->f3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    if-eqz v0, :cond_2

    .line 71
    .line 72
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 73
    .line 74
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->f3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-interface {v0, p1}, Lcom/immomo/mediacore/coninf/MRtcEventHandler;->onError(I)V

    .line 79
    .line 80
    .line 81
    :cond_2
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    new-instance v1, Ljava/lang/StringBuilder;

    .line 86
    .line 87
    const-string v2, "onError,err:"

    .line 88
    .line 89
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    const-string v2, "MoMoRtcPushFilter"

    .line 100
    .line 101
    invoke-virtual {v0, v2, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    new-instance v0, Ljava/lang/StringBuilder;

    .line 105
    .line 106
    const-string v1, "onError, err: "

    .line 107
    .line 108
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    const-string v1, "->MOMORTC"

    .line 119
    .line 120
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 121
    .line 122
    .line 123
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 124
    .line 125
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->g4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/wvx;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    int-to-long v1, p1

    .line 130
    iput-wide v1, v0, Ll/wvx;->y0:J

    .line 131
    .line 132
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 133
    .line 134
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->Z2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Landroid/os/Handler;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    new-instance v1, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$c;

    .line 139
    .line 140
    invoke-direct {v1, p0, p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$c;-><init>(Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;I)V

    .line 141
    .line 142
    .line 143
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 144
    .line 145
    .line 146
    return-void
.end method

.method public onFirstLocalAudioFrame(I)V
    .locals 0

    return-void
.end method

.method public onFirstLocalVideoFrame(III)V
    .locals 2

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v1, "onFirstLocalVideoFrame:width:"

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v1, ",height:"

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ",elapsed:"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const-string v1, "MoMoRtcPushFilter"

    .line 36
    .line 37
    invoke-virtual {p0, v1, v0}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    new-instance v0, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    const-string v1, "onFirstLocalVideoFrame  "

    .line 47
    .line 48
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    const-string p1, " "

    .line 55
    .line 56
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    const-string p2, "MediaEngineCallback"

    .line 73
    .line 74
    invoke-virtual {p0, p2, p1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public onFirstRemoteAudioFrame(II)V
    .locals 0

    return-void
.end method

.method public onFirstRemoteVideoDecoded(IIII)V
    .locals 0

    return-void
.end method

.method public onFirstRemoteVideoFrame(IIII)V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p1

    .line 4
    .line 5
    move/from16 v3, p2

    .line 6
    .line 7
    move/from16 v4, p3

    .line 8
    .line 9
    iget-object v2, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 10
    .line 11
    invoke-static {v2}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->L2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/evx;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object v5

    .line 19
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 20
    .line 21
    .line 22
    move-result-object v6

    .line 23
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 24
    .line 25
    .line 26
    move-result-object v7

    .line 27
    invoke-static/range {p4 .. p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 28
    .line 29
    .line 30
    move-result-object v8

    .line 31
    const-string v9, "onFirstRemoteVideoFrame"

    .line 32
    .line 33
    filled-new-array {v9, v5, v6, v7, v8}, [Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v5

    .line 37
    invoke-virtual {v2, v5}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    new-instance v5, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    const-string v6, "onFirstRemoteVideoDecoded:uid"

    .line 47
    .line 48
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    const-string v6, "width"

    .line 55
    .line 56
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    const-string v6, "height"

    .line 63
    .line 64
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    const-string v6, "elapsed"

    .line 71
    .line 72
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    move/from16 v6, p4

    .line 76
    .line 77
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v5

    .line 84
    const-string v7, "MoMoRtcPushFilter"

    .line 85
    .line 86
    invoke-virtual {v2, v7, v5}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    iget-object v2, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 90
    .line 91
    invoke-virtual {v2}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->W1()Landroid/content/Context;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    if-nez v2, :cond_0

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_0
    iget-object v2, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 99
    .line 100
    invoke-static {v2}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->Z2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Landroid/os/Handler;

    .line 101
    .line 102
    .line 103
    move-result-object v2

    .line 104
    new-instance v5, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a;

    .line 105
    .line 106
    invoke-direct {v5, v0, v1, v3, v4}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a;-><init>(Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;III)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {v2, v5}, Landroid/os/Handler;->postAtFrontOfQueue(Ljava/lang/Runnable;)Z

    .line 110
    .line 111
    .line 112
    iget-object v2, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 113
    .line 114
    invoke-static {v2}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->a3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 115
    .line 116
    .line 117
    move-result-object v2

    .line 118
    int-to-long v10, v1

    .line 119
    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 120
    .line 121
    .line 122
    move-result-object v5

    .line 123
    invoke-virtual {v2, v5}, Ljava/util/AbstractMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    move-result-object v2

    .line 127
    check-cast v2, Ll/xhy;

    .line 128
    .line 129
    if-eqz v2, :cond_2

    .line 130
    .line 131
    invoke-virtual {v2}, Ll/xhy;->d()Z

    .line 132
    .line 133
    .line 134
    move-result v5

    .line 135
    if-nez v5, :cond_2

    .line 136
    .line 137
    const-string v5, "zhengjijian"

    .line 138
    .line 139
    const-string v7, "agora get first idr"

    .line 140
    .line 141
    invoke-static {v5, v7}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 142
    .line 143
    .line 144
    const/4 v5, 0x1

    .line 145
    invoke-virtual {v2, v5}, Ll/xhy;->g(Z)V

    .line 146
    .line 147
    .line 148
    iget-object v7, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 149
    .line 150
    invoke-static {v7}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->b3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)I

    .line 151
    .line 152
    .line 153
    move-result v7

    .line 154
    if-ne v7, v5, :cond_1

    .line 155
    .line 156
    iget-object v5, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 157
    .line 158
    invoke-static {v5}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->c3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/evx;

    .line 159
    .line 160
    .line 161
    move-result-object v7

    .line 162
    invoke-virtual {v2}, Ll/xhy;->c()I

    .line 163
    .line 164
    .line 165
    move-result v9

    .line 166
    const-wide/16 v14, 0x0

    .line 167
    .line 168
    const-wide/16 v16, 0x0

    .line 169
    .line 170
    const/4 v8, 0x1

    .line 171
    const-wide/16 v12, 0x0

    .line 172
    .line 173
    invoke-virtual/range {v7 .. v17}, Ll/evx;->c(ZIJJJJ)V

    .line 174
    .line 175
    .line 176
    :cond_1
    iget-object v2, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 177
    .line 178
    invoke-static {v2}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->d3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/q210$a;

    .line 179
    .line 180
    .line 181
    move-result-object v2

    .line 182
    const/4 v5, 0x0

    .line 183
    iget-object v7, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 184
    .line 185
    const/16 v8, 0x2006

    .line 186
    .line 187
    invoke-interface {v2, v8, v1, v5, v7}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 188
    .line 189
    .line 190
    :cond_2
    iget-object v1, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 191
    .line 192
    invoke-static {v1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->f3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 193
    .line 194
    .line 195
    move-result-object v1

    .line 196
    if-eqz v1, :cond_3

    .line 197
    .line 198
    iget-object v0, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 199
    .line 200
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->f3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 201
    .line 202
    .line 203
    move-result-object v0

    .line 204
    move v5, v6

    .line 205
    move-wide v1, v10

    .line 206
    invoke-interface/range {v0 .. v5}, Lcom/immomo/mediacore/coninf/MRtcEventHandler;->onFirstRemoteVideoDecoded(JIII)V

    .line 207
    .line 208
    .line 209
    :cond_3
    :goto_0
    return-void
.end method

.method public onHttpError(ILjava/lang/String;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->B2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/evx;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "onHttpError"

    .line 8
    .line 9
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    filled-new-array {v0, p1, p2}, [Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p0, p1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public onJoinChannelSuccess(Ljava/lang/String;II)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->r4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/evx;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    const-string v3, "onJoinChannelSuccess"

    .line 16
    .line 17
    filled-new-array {v3, p1, v1, v2}, [Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    new-instance v0, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    const-string v1, " onJoinChannelSuccess "

    .line 27
    .line 28
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    const-string v1, " "

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    int-to-long v2, p2

    .line 46
    const-wide v4, 0xffffffffL

    .line 47
    .line 48
    .line 49
    .line 50
    .line 51
    and-long/2addr v4, v2

    .line 52
    invoke-virtual {v0, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    const-string p2, ";getSabineEnable="

    .line 62
    .line 63
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    iget-object p2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 67
    .line 68
    invoke-static {p2}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->P2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/momo/momortc/MMRtcEngine;

    .line 69
    .line 70
    .line 71
    move-result-object p2

    .line 72
    invoke-virtual {p2}, Lcom/momo/momortc/MMRtcEngine;->getSabineEnable()I

    .line 73
    .line 74
    .line 75
    move-result p2

    .line 76
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p2

    .line 83
    const-string v0, "unint"

    .line 84
    .line 85
    invoke-static {v0, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 86
    .line 87
    .line 88
    iget-object p2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 89
    .line 90
    invoke-static {p2}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->s4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/wvx;

    .line 91
    .line 92
    .line 93
    move-result-object p2

    .line 94
    const/4 v0, 0x1

    .line 95
    iput-boolean v0, p2, Ll/wvx;->b:Z

    .line 96
    .line 97
    iget-object p2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 98
    .line 99
    sget-object v1, Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;->FILTER_PLAY:Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;

    .line 100
    .line 101
    invoke-static {p2, v1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->t4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;)V

    .line 102
    .line 103
    .line 104
    iget-object p2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 105
    .line 106
    invoke-static {p2}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->P2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/momo/momortc/MMRtcEngine;

    .line 107
    .line 108
    .line 109
    move-result-object p2

    .line 110
    if-eqz p2, :cond_0

    .line 111
    .line 112
    iget-object p2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 113
    .line 114
    invoke-static {p2, v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->o3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;Z)Z

    .line 115
    .line 116
    .line 117
    iget-object p2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 118
    .line 119
    invoke-static {p2}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->u4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/wvx;

    .line 120
    .line 121
    .line 122
    move-result-object p2

    .line 123
    iget-wide v4, p2, Ll/wvx;->s:J

    .line 124
    .line 125
    const-wide/16 v6, 0x0

    .line 126
    .line 127
    cmp-long p2, v4, v6

    .line 128
    .line 129
    if-eqz p2, :cond_0

    .line 130
    .line 131
    iget-object p2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 132
    .line 133
    invoke-static {p2}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->P2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/momo/momortc/MMRtcEngine;

    .line 134
    .line 135
    .line 136
    move-result-object p2

    .line 137
    iget-object v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 138
    .line 139
    invoke-static {v1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->v4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/wvx;

    .line 140
    .line 141
    .line 142
    move-result-object v1

    .line 143
    iget-wide v4, v1, Ll/wvx;->s:J

    .line 144
    .line 145
    long-to-int v1, v4

    .line 146
    invoke-virtual {p2, v1}, Lcom/momo/momortc/MMRtcEngine;->setRoomMode(I)I

    .line 147
    .line 148
    .line 149
    :cond_0
    iget-object p2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 150
    .line 151
    invoke-static {p2}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->w4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object p2

    .line 155
    const/4 v1, 0x0

    .line 156
    if-eqz p2, :cond_1

    .line 157
    .line 158
    iget-object p2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 159
    .line 160
    invoke-static {p2}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->k3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/ror;

    .line 161
    .line 162
    .line 163
    move-result-object p2

    .line 164
    iget-boolean p2, p2, Ll/ror;->h1:Z

    .line 165
    .line 166
    if-eqz p2, :cond_1

    .line 167
    .line 168
    const-string p2, "MoMoRtcPushFilter"

    .line 169
    .line 170
    const-string v4, "zhangjialiang onJoinChannelSuccess setJsonForPostion"

    .line 171
    .line 172
    invoke-static {p2, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 173
    .line 174
    .line 175
    iget-object p2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 176
    .line 177
    invoke-static {p2, v1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->x4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;Z)Z

    .line 178
    .line 179
    .line 180
    iget-object p2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 181
    .line 182
    invoke-static {p2}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->w4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object v4

    .line 186
    invoke-virtual {p2, v4}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->w6(Ljava/lang/String;)V

    .line 187
    .line 188
    .line 189
    :cond_1
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 190
    .line 191
    .line 192
    move-result-object p2

    .line 193
    iget-object v4, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 194
    .line 195
    invoke-static {v4}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->P2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/momo/momortc/MMRtcEngine;

    .line 196
    .line 197
    .line 198
    move-result-object v4

    .line 199
    invoke-virtual {v4}, Lcom/momo/momortc/MMRtcEngine;->getSabineEnable()I

    .line 200
    .line 201
    .line 202
    move-result v4

    .line 203
    if-ne v4, v0, :cond_2

    .line 204
    .line 205
    move v4, v1

    .line 206
    goto :goto_0

    .line 207
    :cond_2
    move v4, v0

    .line 208
    :goto_0
    invoke-virtual {p2, v4}, Ll/csx;->C1(I)V

    .line 209
    .line 210
    .line 211
    iget-object p2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 212
    .line 213
    const/high16 v4, 0x3f800000    # 1.0f

    .line 214
    .line 215
    invoke-virtual {p2, v4}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->y6(F)V

    .line 216
    .line 217
    .line 218
    iget-object p2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 219
    .line 220
    sget-object v4, Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;->START:Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;

    .line 221
    .line 222
    invoke-static {p2, v4}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->z4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;)Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;

    .line 223
    .line 224
    .line 225
    iget-object p2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 226
    .line 227
    invoke-virtual {p2}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->c2()V

    .line 228
    .line 229
    .line 230
    iget-object p2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 231
    .line 232
    invoke-static {p2}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->A4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)V

    .line 233
    .line 234
    .line 235
    iget-object p2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 236
    .line 237
    invoke-static {p2}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->d3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/q210$a;

    .line 238
    .line 239
    .line 240
    move-result-object p2

    .line 241
    const/16 v4, 0x1000

    .line 242
    .line 243
    iget-object v5, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 244
    .line 245
    invoke-interface {p2, v4, v1, v1, v5}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 246
    .line 247
    .line 248
    iget-object p2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 249
    .line 250
    invoke-static {p2}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->d3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/q210$a;

    .line 251
    .line 252
    .line 253
    move-result-object p2

    .line 254
    const/16 v4, 0x3012

    .line 255
    .line 256
    iget-object v5, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 257
    .line 258
    invoke-interface {p2, v4, v1, v1, v5}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 259
    .line 260
    .line 261
    iget-object p2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 262
    .line 263
    invoke-static {p2}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->W2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Z

    .line 264
    .line 265
    .line 266
    move-result p2

    .line 267
    if-nez p2, :cond_3

    .line 268
    .line 269
    iget-object p2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 270
    .line 271
    invoke-static {p2}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->X2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Z

    .line 272
    .line 273
    .line 274
    move-result p2

    .line 275
    if-eqz p2, :cond_4

    .line 276
    .line 277
    :cond_3
    iget-object p2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 278
    .line 279
    invoke-static {p2}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->B4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)I

    .line 280
    .line 281
    .line 282
    move-result p2

    .line 283
    if-eqz p2, :cond_4

    .line 284
    .line 285
    iget-object p2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 286
    .line 287
    invoke-static {p2}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->C4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)V

    .line 288
    .line 289
    .line 290
    :cond_4
    iget-object p2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 291
    .line 292
    invoke-static {p2}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->D4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Z

    .line 293
    .line 294
    .line 295
    move-result p2

    .line 296
    if-ne p2, v0, :cond_5

    .line 297
    .line 298
    iget-object p2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 299
    .line 300
    invoke-static {p2}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->P2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/momo/momortc/MMRtcEngine;

    .line 301
    .line 302
    .line 303
    move-result-object p2

    .line 304
    if-eqz p2, :cond_5

    .line 305
    .line 306
    iget-object p2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 307
    .line 308
    invoke-static {p2}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->P2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/momo/momortc/MMRtcEngine;

    .line 309
    .line 310
    .line 311
    move-result-object p2

    .line 312
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 313
    .line 314
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->F4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)I

    .line 315
    .line 316
    .line 317
    move-result v0

    .line 318
    int-to-long v4, v0

    .line 319
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 320
    .line 321
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->G4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ljava/lang/String;

    .line 322
    .line 323
    .line 324
    move-result-object v0

    .line 325
    invoke-virtual {p2, v4, v5, v0}, Lcom/momo/momortc/MMRtcEngine;->startChannelMediaRelay(JLjava/lang/String;)I

    .line 326
    .line 327
    .line 328
    iget-object p2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 329
    .line 330
    invoke-static {p2, v1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->E4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;Z)Z

    .line 331
    .line 332
    .line 333
    :cond_5
    iget-object p2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 334
    .line 335
    invoke-static {p2}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->f3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 336
    .line 337
    .line 338
    move-result-object p2

    .line 339
    if-eqz p2, :cond_6

    .line 340
    .line 341
    iget-object p2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 342
    .line 343
    invoke-static {p2}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->f3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 344
    .line 345
    .line 346
    move-result-object p2

    .line 347
    invoke-interface {p2, p1, v2, v3, p3}, Lcom/immomo/mediacore/coninf/MRtcEventHandler;->onJoinChannelSuccess(Ljava/lang/String;JI)V

    .line 348
    .line 349
    .line 350
    :cond_6
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 351
    .line 352
    invoke-static {p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->k3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/ror;

    .line 353
    .line 354
    .line 355
    move-result-object p1

    .line 356
    iget p1, p1, Ll/tow;->k:I

    .line 357
    .line 358
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 359
    .line 360
    if-lez p1, :cond_7

    .line 361
    .line 362
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->k3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/ror;

    .line 363
    .line 364
    .line 365
    move-result-object p1

    .line 366
    iget-boolean v1, p1, Ll/ror;->h1:Z

    .line 367
    .line 368
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 369
    .line 370
    invoke-static {p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->k3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/ror;

    .line 371
    .line 372
    .line 373
    move-result-object p1

    .line 374
    iget v2, p1, Ll/tow;->k:I

    .line 375
    .line 376
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 377
    .line 378
    invoke-static {p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->k3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/ror;

    .line 379
    .line 380
    .line 381
    move-result-object p1

    .line 382
    iget v3, p1, Ll/tow;->l:I

    .line 383
    .line 384
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 385
    .line 386
    invoke-static {p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->H4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)I

    .line 387
    .line 388
    .line 389
    move-result v4

    .line 390
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 391
    .line 392
    invoke-static {p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->k3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/ror;

    .line 393
    .line 394
    .line 395
    move-result-object p1

    .line 396
    iget-object v6, p1, Ll/uow;->v0:Ljava/lang/String;

    .line 397
    .line 398
    const/16 v5, 0xf

    .line 399
    .line 400
    invoke-static/range {v0 .. v6}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->I4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;ZIIIILjava/lang/String;)V

    .line 401
    .line 402
    .line 403
    goto :goto_1

    .line 404
    :cond_7
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->k3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/ror;

    .line 405
    .line 406
    .line 407
    move-result-object p1

    .line 408
    iget-boolean v1, p1, Ll/ror;->h1:Z

    .line 409
    .line 410
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 411
    .line 412
    invoke-static {p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->k3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/ror;

    .line 413
    .line 414
    .line 415
    move-result-object p1

    .line 416
    iget v2, p1, Ll/tow;->s:I

    .line 417
    .line 418
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 419
    .line 420
    invoke-static {p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->k3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/ror;

    .line 421
    .line 422
    .line 423
    move-result-object p1

    .line 424
    iget v3, p1, Ll/tow;->t:I

    .line 425
    .line 426
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 427
    .line 428
    invoke-static {p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->H4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)I

    .line 429
    .line 430
    .line 431
    move-result v4

    .line 432
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 433
    .line 434
    invoke-static {p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->k3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/ror;

    .line 435
    .line 436
    .line 437
    move-result-object p1

    .line 438
    iget-object v6, p1, Ll/uow;->v0:Ljava/lang/String;

    .line 439
    .line 440
    const/16 v5, 0xf

    .line 441
    .line 442
    invoke-static/range {v0 .. v6}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->I4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;ZIIIILjava/lang/String;)V

    .line 443
    .line 444
    .line 445
    :goto_1
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 446
    .line 447
    invoke-static {p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->J4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)V

    .line 448
    .line 449
    .line 450
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 451
    .line 452
    iget-object p2, p1, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->D2:Ljava/util/Timer;

    .line 453
    .line 454
    if-nez p2, :cond_8

    .line 455
    .line 456
    new-instance p2, Ljava/util/Timer;

    .line 457
    .line 458
    invoke-direct {p2}, Ljava/util/Timer;-><init>()V

    .line 459
    .line 460
    .line 461
    iput-object p2, p1, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->D2:Ljava/util/Timer;

    .line 462
    .line 463
    new-instance v1, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$d;

    .line 464
    .line 465
    invoke-direct {v1, p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$d;-><init>(Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;)V

    .line 466
    .line 467
    .line 468
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 469
    .line 470
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->D2:Ljava/util/Timer;

    .line 471
    .line 472
    const-wide/16 v2, 0x64

    .line 473
    .line 474
    const-wide/16 v4, 0x3e8

    .line 475
    .line 476
    invoke-virtual/range {v0 .. v5}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;JJ)V

    .line 477
    .line 478
    .line 479
    :cond_8
    return-void
.end method

.method public onLastmileQuality(I)V
    .locals 3

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v2, "onLastmileQuality "

    .line 8
    .line 9
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const-string v2, "MoMoRtcPushFilter"

    .line 20
    .line 21
    invoke-virtual {v0, v2, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 25
    .line 26
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->d3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/q210$a;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const/4 v1, 0x0

    .line 31
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 32
    .line 33
    const/16 v2, 0x1005

    .line 34
    .line 35
    invoke-interface {v0, v2, p1, v1, p0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public onLeaveChannel(Lcom/momo/momortc/live/MMRtcStats;)V
    .locals 3

    .line 1
    const-string v0, "unint"

    .line 2
    .line 3
    const-string v1, "onLeaveChannel"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v1, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    const-string v2, " onLeaveChannelstats:"

    .line 29
    .line 30
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    const-string v2, "MoMoRtcPushFilter"

    .line 41
    .line 42
    invoke-virtual {v0, v2, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 46
    .line 47
    const/4 v1, 0x0

    .line 48
    invoke-static {v0, v1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->o3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;Z)Z

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 52
    .line 53
    sget-object v1, Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;->STOP:Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;

    .line 54
    .line 55
    invoke-static {v0, v1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->b4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;)Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;

    .line 56
    .line 57
    .line 58
    if-eqz p1, :cond_0

    .line 59
    .line 60
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 61
    .line 62
    invoke-static {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->d4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/wvx;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    iget-wide v0, p1, Lcom/momo/momortc/live/MMRtcStats;->txBytes:J

    .line 67
    .line 68
    iput-wide v0, p0, Ll/wvx;->B:J

    .line 69
    .line 70
    new-instance p0, Ljava/lang/StringBuilder;

    .line 71
    .line 72
    const-string v0, ""

    .line 73
    .line 74
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    iget-wide v0, p1, Lcom/momo/momortc/live/MMRtcStats;->txBytes:J

    .line 78
    .line 79
    invoke-virtual {p0, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    const-string v0, "/"

    .line 83
    .line 84
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    iget-wide v0, p1, Lcom/momo/momortc/live/MMRtcStats;->txBytes:J

    .line 88
    .line 89
    invoke-virtual {p0, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    const-string p1, "AgoraJzheng"

    .line 97
    .line 98
    invoke-static {p1, p0}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 99
    .line 100
    .line 101
    :cond_0
    return-void
.end method

.method public onLocalVideoQualityLimited(Lcom/momo/momortc/IMMRtcEngineEventInterface$LocalVideoStats;Lcom/momo/momortc/IMMRtcEngineEventInterface$QualityLimitationReason;)V
    .locals 7

    .line 1
    iget p2, p1, Lcom/momo/momortc/IMMRtcEngineEventInterface$LocalVideoStats;->targetBitrate:I

    .line 2
    .line 3
    mul-int/lit16 p2, p2, 0x3e8

    .line 4
    .line 5
    iget v0, p1, Lcom/momo/momortc/IMMRtcEngineEventInterface$LocalVideoStats;->targetFrameRate:I

    .line 6
    .line 7
    const-string v1, "]"

    .line 8
    .line 9
    const-string v2, " ] To [ "

    .line 10
    .line 11
    const-string v3, "DYNAMIC_SCALING"

    .line 12
    .line 13
    const-string v4, ", "

    .line 14
    .line 15
    if-eqz p2, :cond_4

    .line 16
    .line 17
    if-eqz v0, :cond_4

    .line 18
    .line 19
    iget-object v5, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 20
    .line 21
    invoke-static {v5}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->S2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)I

    .line 22
    .line 23
    .line 24
    move-result v5

    .line 25
    if-ne v5, p2, :cond_0

    .line 26
    .line 27
    iget-object v5, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 28
    .line 29
    invoke-static {v5}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->e3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)I

    .line 30
    .line 31
    .line 32
    move-result v5

    .line 33
    if-eq v5, v0, :cond_4

    .line 34
    .line 35
    :cond_0
    iget-object v5, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 36
    .line 37
    invoke-static {v5}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->s3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/immomo/mediacore/coninf/MRtcPusherHandler;

    .line 38
    .line 39
    .line 40
    move-result-object v5

    .line 41
    if-eqz v5, :cond_1

    .line 42
    .line 43
    iget-object v5, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 44
    .line 45
    invoke-static {v5}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->s3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/immomo/mediacore/coninf/MRtcPusherHandler;

    .line 46
    .line 47
    .line 48
    move-result-object v5

    .line 49
    invoke-interface {v5, p2, v0}, Lcom/immomo/mediacore/coninf/MRtcPusherHandler;->onPushLevelChange(II)V

    .line 50
    .line 51
    .line 52
    :cond_1
    iget-object v5, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 53
    .line 54
    invoke-static {v5}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->E3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/uow;

    .line 55
    .line 56
    .line 57
    move-result-object v6

    .line 58
    iget v6, v6, Ll/tow;->H:I

    .line 59
    .line 60
    invoke-static {v5, v6}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;I)I

    .line 61
    .line 62
    .line 63
    iget-object v5, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 64
    .line 65
    invoke-static {v5}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->Q3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/uow;

    .line 66
    .line 67
    .line 68
    move-result-object v6

    .line 69
    iget v6, v6, Ll/uow;->E0:I

    .line 70
    .line 71
    invoke-static {v5, v6}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->g3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;I)I

    .line 72
    .line 73
    .line 74
    new-instance v5, Ljava/lang/StringBuilder;

    .line 75
    .line 76
    const-string v6, "from [ "

    .line 77
    .line 78
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    iget-object v6, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 82
    .line 83
    invoke-static {v6}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->S2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)I

    .line 84
    .line 85
    .line 86
    move-result v6

    .line 87
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    iget-object v6, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 94
    .line 95
    invoke-static {v6}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->c4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/uow;

    .line 96
    .line 97
    .line 98
    move-result-object v6

    .line 99
    iget v6, v6, Ll/uow;->E0:I

    .line 100
    .line 101
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    iget p1, p1, Lcom/momo/momortc/IMMRtcEngineEventInterface$LocalVideoStats;->targetFrameRate:I

    .line 114
    .line 115
    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    invoke-static {v3, p1}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 126
    .line 127
    .line 128
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 129
    .line 130
    invoke-static {p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->S2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)I

    .line 131
    .line 132
    .line 133
    move-result p1

    .line 134
    if-gt p1, p2, :cond_3

    .line 135
    .line 136
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 137
    .line 138
    invoke-static {p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->e3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)I

    .line 139
    .line 140
    .line 141
    move-result p1

    .line 142
    if-le p1, v0, :cond_2

    .line 143
    .line 144
    goto :goto_0

    .line 145
    :cond_2
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 146
    .line 147
    const/4 v1, 0x0

    .line 148
    invoke-static {p1, v1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->n4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;I)V

    .line 149
    .line 150
    .line 151
    goto :goto_1

    .line 152
    :cond_3
    :goto_0
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 153
    .line 154
    const/4 v1, 0x1

    .line 155
    invoke-static {p1, v1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->n4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;I)V

    .line 156
    .line 157
    .line 158
    :goto_1
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 159
    .line 160
    invoke-static {p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->y4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/uow;

    .line 161
    .line 162
    .line 163
    move-result-object p1

    .line 164
    iput p2, p1, Ll/tow;->H:I

    .line 165
    .line 166
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 167
    .line 168
    invoke-static {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->s2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/uow;

    .line 169
    .line 170
    .line 171
    move-result-object p0

    .line 172
    iput v0, p0, Ll/uow;->E0:I

    .line 173
    .line 174
    return-void

    .line 175
    :cond_4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 176
    .line 177
    const-string v5, "xxxxxxxxx from [ "

    .line 178
    .line 179
    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 180
    .line 181
    .line 182
    iget-object v5, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 183
    .line 184
    invoke-static {v5}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->S2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)I

    .line 185
    .line 186
    .line 187
    move-result v5

    .line 188
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 189
    .line 190
    .line 191
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 192
    .line 193
    .line 194
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 195
    .line 196
    invoke-static {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->D2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/uow;

    .line 197
    .line 198
    .line 199
    move-result-object p0

    .line 200
    iget p0, p0, Ll/uow;->E0:I

    .line 201
    .line 202
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 203
    .line 204
    .line 205
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 206
    .line 207
    .line 208
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 209
    .line 210
    .line 211
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 212
    .line 213
    .line 214
    iget p0, p1, Lcom/momo/momortc/IMMRtcEngineEventInterface$LocalVideoStats;->targetFrameRate:I

    .line 215
    .line 216
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 217
    .line 218
    .line 219
    const-string p0, ",[[sentBitrate "

    .line 220
    .line 221
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 222
    .line 223
    .line 224
    iget p0, p1, Lcom/momo/momortc/IMMRtcEngineEventInterface$LocalVideoStats;->sentBitrate:I

    .line 225
    .line 226
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 227
    .line 228
    .line 229
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 230
    .line 231
    .line 232
    iget p0, p1, Lcom/momo/momortc/IMMRtcEngineEventInterface$LocalVideoStats;->sentFrameRate:I

    .line 233
    .line 234
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 235
    .line 236
    .line 237
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 238
    .line 239
    .line 240
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 241
    .line 242
    .line 243
    move-result-object p0

    .line 244
    invoke-static {v3, p0}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 245
    .line 246
    .line 247
    return-void
.end method

.method public onLog(ILjava/lang/String;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, v0, :cond_0

    .line 3
    .line 4
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 5
    .line 6
    invoke-static {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->C2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/evx;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0, p2}, Ll/evx;->n(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const/4 v0, 0x2

    .line 15
    if-ne p1, v0, :cond_1

    .line 16
    .line 17
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 18
    .line 19
    invoke-static {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->E2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/evx;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0, p2}, Ll/evx;->o(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    const/4 v0, 0x3

    .line 28
    if-ne p1, v0, :cond_2

    .line 29
    .line 30
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 31
    .line 32
    invoke-static {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->F2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/evx;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0, p2}, Ll/evx;->p(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_2
    const/4 v0, 0x4

    .line 41
    if-ne p1, v0, :cond_3

    .line 42
    .line 43
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 44
    .line 45
    invoke-static {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->G2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/evx;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {p0, p2}, Ll/evx;->m(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_3
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 54
    .line 55
    const/4 v0, 0x5

    .line 56
    if-ne p1, v0, :cond_4

    .line 57
    .line 58
    invoke-static {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->H2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/evx;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {p0, p2}, Ll/evx;->q(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_4
    invoke-static {p0, p1, p2}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->I2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;ILjava/lang/String;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public onMediaEngineLoadSuccess()V
    .locals 2

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "MoMoRtcPushFilter"

    .line 6
    .line 7
    const-string v1, "onMediaEngineLoadSuccess"

    .line 8
    .line 9
    invoke-virtual {p0, v0, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public onMediaEngineStartCallSuccess()V
    .locals 0

    return-void
.end method

.method public onMicrophoneEnabled(Z)V
    .locals 0

    return-void
.end method

.method public onNetworkQuality(III)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->a4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/immomo/mediacore/coninf/MRtcQualityHandler;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->a4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/immomo/mediacore/coninf/MRtcQualityHandler;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0, p1, p2, p3}, Lcom/immomo/mediacore/coninf/MRtcQualityHandler;->onNetworkQuality(III)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public onReceiveSEI(ILjava/lang/String;)V
    .locals 7

    .line 1
    const-string v0, "ts"

    .line 2
    .line 3
    const-string v1, "bType"

    .line 4
    .line 5
    const-string v2, "onReceiveSEI getbType: "

    .line 6
    .line 7
    :try_start_0
    new-instance v3, Lorg/json/JSONObject;

    .line 8
    .line 9
    invoke-direct {v3, p2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v3, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 13
    .line 14
    .line 15
    move-result v4

    .line 16
    if-eqz v4, :cond_0

    .line 17
    .line 18
    invoke-virtual {v3, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    iget-object v4, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 23
    .line 24
    invoke-static {v4}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->h3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/wvx;

    .line 25
    .line 26
    .line 27
    move-result-object v4

    .line 28
    int-to-long v5, v1

    .line 29
    iput-wide v5, v4, Ll/wvx;->s:J

    .line 30
    .line 31
    const-string v4, "MoMoRtcPushFilter"

    .line 32
    .line 33
    new-instance v5, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    invoke-direct {v5, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-static {v4, v1}, Ll/esx;->d(Ljava/lang/String;Ljava/lang/Object;)I

    .line 46
    .line 47
    .line 48
    :cond_0
    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    if-eqz v1, :cond_1

    .line 53
    .line 54
    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-virtual {v1}, Ll/csx;->X()J

    .line 63
    .line 64
    .line 65
    move-result-wide v1

    .line 66
    invoke-static {v0}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 71
    .line 72
    .line 73
    move-result-wide v3

    .line 74
    sub-long/2addr v1, v3

    .line 75
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 76
    .line 77
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->i3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    int-to-long v3, p1

    .line 82
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 83
    .line 84
    .line 85
    move-result-object v3

    .line 86
    invoke-virtual {v0, v3}, Ljava/util/AbstractMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    check-cast v0, Ll/iny;

    .line 91
    .line 92
    if-eqz v0, :cond_1

    .line 93
    .line 94
    iget v3, v0, Ll/iny;->E:I

    .line 95
    .line 96
    add-int/lit8 v3, v3, 0x1

    .line 97
    .line 98
    iput v3, v0, Ll/iny;->E:I

    .line 99
    .line 100
    iget v3, v0, Ll/iny;->D:I

    .line 101
    .line 102
    int-to-long v3, v3

    .line 103
    add-long/2addr v3, v1

    .line 104
    long-to-int v1, v3

    .line 105
    iput v1, v0, Ll/iny;->D:I
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 106
    .line 107
    :catch_0
    :cond_1
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 108
    .line 109
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->j3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/immomo/mediacore/coninf/MRtcReceiveSeiHandler;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    if-eqz v0, :cond_2

    .line 114
    .line 115
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 116
    .line 117
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->k3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/ror;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    if-eqz v0, :cond_2

    .line 122
    .line 123
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 124
    .line 125
    invoke-static {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->j3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/immomo/mediacore/coninf/MRtcReceiveSeiHandler;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    invoke-virtual {p2}, Ljava/lang/String;->getBytes()[B

    .line 130
    .line 131
    .line 132
    move-result-object p2

    .line 133
    int-to-long v0, p1

    .line 134
    const-string p1, ""

    .line 135
    .line 136
    invoke-interface {p0, p2, v0, v1, p1}, Lcom/immomo/mediacore/coninf/MRtcReceiveSeiHandler;->OnReceiveH264Sei([BJLjava/lang/String;)V

    .line 137
    .line 138
    .line 139
    :cond_2
    return-void
.end method

.method public onRefreshRecordingServiceStatus(I)V
    .locals 0

    return-void
.end method

.method public onRejoinChannelSuccess(Ljava/lang/String;II)V
    .locals 4

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v1, "onRejoinChannelSuccess "

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v2, " "

    .line 16
    .line 17
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const-string v3, "MyEngineEventHandler"

    .line 34
    .line 35
    invoke-virtual {p0, v3, v0}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    new-instance p0, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    const-string p1, "unint"

    .line 63
    .line 64
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public onRemoteVideoFrame(ILcom/momo/rtcbase/VideoFrame;)V
    .locals 0

    return-void
.end method

.method public onRemoteVideoStateChanged(II)V
    .locals 0

    return-void
.end method

.method public onRequestToken()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->l3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/immomo/mediacore/coninf/MRtcChannelHandler;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->l3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/immomo/mediacore/coninf/MRtcChannelHandler;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0}, Lcom/immomo/mediacore/coninf/MRtcChannelHandler;->onRequestChannelKey()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public onRtcStats(Lcom/momo/momortc/live/MMRtcStats;)V
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    new-instance v3, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v4, "onRtcStatsstats:"

    .line 12
    .line 13
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    const-string v4, "MoMoRtcPushFilter"

    .line 24
    .line 25
    invoke-virtual {v2, v4, v3}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget-object v2, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 29
    .line 30
    invoke-static {v2}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->B3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/momo/momortc/IMMRtcEngineEventInterface$RemoteVideoStats;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    if-nez v2, :cond_0

    .line 35
    .line 36
    iget-object v2, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 37
    .line 38
    new-instance v3, Lcom/momo/momortc/IMMRtcEngineEventInterface$RemoteVideoStats;

    .line 39
    .line 40
    invoke-direct {v3}, Lcom/momo/momortc/IMMRtcEngineEventInterface$RemoteVideoStats;-><init>()V

    .line 41
    .line 42
    .line 43
    invoke-static {v2, v3}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->C3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;Lcom/momo/momortc/IMMRtcEngineEventInterface$RemoteVideoStats;)Lcom/momo/momortc/IMMRtcEngineEventInterface$RemoteVideoStats;

    .line 44
    .line 45
    .line 46
    :cond_0
    iget-object v2, v1, Lcom/momo/momortc/live/MMRtcStats;->remoteStats:Ljava/util/List;

    .line 47
    .line 48
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    const-wide/16 v3, 0x0

    .line 53
    .line 54
    move-wide v7, v3

    .line 55
    const/4 v9, 0x0

    .line 56
    const/4 v10, 0x1

    .line 57
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 58
    .line 59
    .line 60
    move-result v11

    .line 61
    if-eqz v11, :cond_5

    .line 62
    .line 63
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v11

    .line 67
    check-cast v11, Lcom/momo/momortc/live/MMRtcRemoteStats;

    .line 68
    .line 69
    new-instance v12, Ljava/lang/StringBuilder;

    .line 70
    .line 71
    const-string v13, "onRtcStats "

    .line 72
    .line 73
    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    iget-wide v13, v11, Lcom/momo/momortc/live/MMRtcRemoteStats;->uid:J

    .line 77
    .line 78
    invoke-virtual {v12, v13, v14}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v12

    .line 85
    const-string v13, "AgoraJzheng"

    .line 86
    .line 87
    invoke-static {v13, v12}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 88
    .line 89
    .line 90
    iget-object v12, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 91
    .line 92
    invoke-static {v12}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->i3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 93
    .line 94
    .line 95
    move-result-object v12

    .line 96
    iget-wide v13, v11, Lcom/momo/momortc/live/MMRtcRemoteStats;->uid:J

    .line 97
    .line 98
    invoke-static {v13, v14}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 99
    .line 100
    .line 101
    move-result-object v13

    .line 102
    invoke-virtual {v12, v13}, Ljava/util/AbstractMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object v12

    .line 106
    check-cast v12, Ll/iny;

    .line 107
    .line 108
    iget-object v13, v11, Lcom/momo/momortc/live/MMRtcRemoteStats;->AudioStats:Lcom/momo/momortc/live/MMRtcRemoteAudioStats;

    .line 109
    .line 110
    if-eqz v13, :cond_2

    .line 111
    .line 112
    if-eqz v12, :cond_2

    .line 113
    .line 114
    iget v9, v12, Ll/iny;->j:I

    .line 115
    .line 116
    iget v14, v13, Lcom/momo/momortc/live/MMRtcRemoteAudioStats;->audioCache:I

    .line 117
    .line 118
    add-int/2addr v9, v14

    .line 119
    iput v9, v12, Ll/iny;->j:I

    .line 120
    .line 121
    iget v9, v13, Lcom/momo/momortc/live/MMRtcRemoteAudioStats;->audioLost:I

    .line 122
    .line 123
    iput v9, v12, Ll/iny;->k:I

    .line 124
    .line 125
    iget v9, v13, Lcom/momo/momortc/live/MMRtcRemoteAudioStats;->audioPlayLag:I

    .line 126
    .line 127
    iput v9, v12, Ll/iny;->n:I

    .line 128
    .line 129
    iget-wide v14, v13, Lcom/momo/momortc/live/MMRtcRemoteAudioStats;->aReceiveSize:J

    .line 130
    .line 131
    iput-wide v14, v12, Ll/iny;->f:J

    .line 132
    .line 133
    const/16 v16, 0x1

    .line 134
    .line 135
    iget v6, v13, Lcom/momo/momortc/live/MMRtcRemoteAudioStats;->expandCount:I

    .line 136
    .line 137
    iput v6, v12, Ll/iny;->t:I

    .line 138
    .line 139
    iget v6, v13, Lcom/momo/momortc/live/MMRtcRemoteAudioStats;->expandCartonCount:I

    .line 140
    .line 141
    iput v6, v12, Ll/iny;->u:I

    .line 142
    .line 143
    add-long/2addr v7, v14

    .line 144
    if-nez v9, :cond_1

    .line 145
    .line 146
    const/4 v10, 0x0

    .line 147
    :cond_1
    iget v6, v12, Ll/iny;->z:I

    .line 148
    .line 149
    iget v9, v13, Lcom/momo/momortc/live/MMRtcRemoteAudioStats;->audiLossTimestamp:I

    .line 150
    .line 151
    add-int/2addr v6, v9

    .line 152
    iput v6, v12, Ll/iny;->z:I

    .line 153
    .line 154
    iget v6, v12, Ll/iny;->A:I

    .line 155
    .line 156
    iget v9, v13, Lcom/momo/momortc/live/MMRtcRemoteAudioStats;->networkRtt:I

    .line 157
    .line 158
    add-int/2addr v6, v9

    .line 159
    iput v6, v12, Ll/iny;->A:I

    .line 160
    .line 161
    iget v6, v12, Ll/iny;->B:I

    .line 162
    .line 163
    add-int/lit8 v6, v6, 0x1

    .line 164
    .line 165
    iput v6, v12, Ll/iny;->B:I

    .line 166
    .line 167
    move/from16 v9, v16

    .line 168
    .line 169
    goto :goto_1

    .line 170
    :cond_2
    const/16 v16, 0x1

    .line 171
    .line 172
    :goto_1
    iget-object v6, v11, Lcom/momo/momortc/live/MMRtcRemoteStats;->videoStats:Lcom/momo/momortc/live/MMRtcRemoteVideoStats;

    .line 173
    .line 174
    if-eqz v6, :cond_3

    .line 175
    .line 176
    if-eqz v12, :cond_3

    .line 177
    .line 178
    iget v11, v6, Lcom/momo/momortc/live/MMRtcRemoteVideoStats;->videoBitrate:I

    .line 179
    .line 180
    int-to-long v13, v11

    .line 181
    iput-wide v13, v12, Ll/iny;->b:J

    .line 182
    .line 183
    iget v11, v6, Lcom/momo/momortc/live/MMRtcRemoteVideoStats;->videoheight:I

    .line 184
    .line 185
    int-to-long v13, v11

    .line 186
    iput-wide v13, v12, Ll/iny;->i:J

    .line 187
    .line 188
    iget v11, v6, Lcom/momo/momortc/live/MMRtcRemoteVideoStats;->videowidth:I

    .line 189
    .line 190
    int-to-long v13, v11

    .line 191
    iput-wide v13, v12, Ll/iny;->h:J

    .line 192
    .line 193
    iget v11, v6, Lcom/momo/momortc/live/MMRtcRemoteVideoStats;->videoDelay:I

    .line 194
    .line 195
    iput v11, v12, Ll/iny;->l:I

    .line 196
    .line 197
    iget v11, v6, Lcom/momo/momortc/live/MMRtcRemoteVideoStats;->videoLost:F

    .line 198
    .line 199
    float-to-int v11, v11

    .line 200
    iput v11, v12, Ll/iny;->m:I

    .line 201
    .line 202
    iget-wide v13, v6, Lcom/momo/momortc/live/MMRtcRemoteVideoStats;->vReceiveSize:J

    .line 203
    .line 204
    iput-wide v13, v12, Ll/iny;->e:J

    .line 205
    .line 206
    move-wide/from16 v17, v7

    .line 207
    .line 208
    iget-wide v7, v12, Ll/iny;->c:J

    .line 209
    .line 210
    iget v6, v6, Lcom/momo/momortc/live/MMRtcRemoteVideoStats;->videoFramerate:I

    .line 211
    .line 212
    int-to-long v5, v6

    .line 213
    add-long/2addr v7, v5

    .line 214
    iput-wide v7, v12, Ll/iny;->c:J

    .line 215
    .line 216
    add-long/2addr v3, v13

    .line 217
    iget v5, v12, Ll/iny;->C:I

    .line 218
    .line 219
    add-int/lit8 v5, v5, 0x1

    .line 220
    .line 221
    iput v5, v12, Ll/iny;->C:I

    .line 222
    .line 223
    goto :goto_2

    .line 224
    :cond_3
    move-wide/from16 v17, v7

    .line 225
    .line 226
    :goto_2
    if-eqz v12, :cond_4

    .line 227
    .line 228
    iget-wide v5, v12, Ll/iny;->e:J

    .line 229
    .line 230
    iget-wide v7, v12, Ll/iny;->f:J

    .line 231
    .line 232
    add-long/2addr v5, v7

    .line 233
    iput-wide v5, v12, Ll/iny;->d:J

    .line 234
    .line 235
    :cond_4
    move-wide/from16 v7, v17

    .line 236
    .line 237
    goto/16 :goto_0

    .line 238
    .line 239
    :cond_5
    if-eqz v9, :cond_6

    .line 240
    .line 241
    if-eqz v10, :cond_6

    .line 242
    .line 243
    iget-object v2, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 244
    .line 245
    invoke-static {v2}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->M3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/wvx;

    .line 246
    .line 247
    .line 248
    move-result-object v2

    .line 249
    iget-wide v5, v2, Ll/wvx;->q:J

    .line 250
    .line 251
    const-wide/16 v9, 0x1

    .line 252
    .line 253
    add-long/2addr v5, v9

    .line 254
    iput-wide v5, v2, Ll/wvx;->q:J

    .line 255
    .line 256
    :cond_6
    iget-object v2, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 257
    .line 258
    invoke-static {v2}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->N3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/wvx;

    .line 259
    .line 260
    .line 261
    move-result-object v2

    .line 262
    iput-wide v7, v2, Ll/wvx;->l:J

    .line 263
    .line 264
    iget-object v2, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 265
    .line 266
    invoke-static {v2}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->O3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/wvx;

    .line 267
    .line 268
    .line 269
    move-result-object v2

    .line 270
    iput-wide v3, v2, Ll/wvx;->k:J

    .line 271
    .line 272
    iget-object v2, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 273
    .line 274
    invoke-static {v2}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->P3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/wvx;

    .line 275
    .line 276
    .line 277
    move-result-object v2

    .line 278
    add-long/2addr v7, v3

    .line 279
    iput-wide v7, v2, Ll/wvx;->j:J

    .line 280
    .line 281
    iget-object v2, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 282
    .line 283
    invoke-static {v2}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->B3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/momo/momortc/IMMRtcEngineEventInterface$RemoteVideoStats;

    .line 284
    .line 285
    .line 286
    move-result-object v2

    .line 287
    invoke-direct {v0, v2}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->b(Lcom/momo/momortc/IMMRtcEngineEventInterface$RemoteVideoStats;)V

    .line 288
    .line 289
    .line 290
    iget-object v2, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 291
    .line 292
    invoke-static {v2}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->G3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/momo/momortc/IMMRtcEngineEventInterface$LocalVideoStats;

    .line 293
    .line 294
    .line 295
    move-result-object v2

    .line 296
    if-nez v2, :cond_7

    .line 297
    .line 298
    iget-object v2, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 299
    .line 300
    new-instance v3, Lcom/momo/momortc/IMMRtcEngineEventInterface$LocalVideoStats;

    .line 301
    .line 302
    invoke-direct {v3}, Lcom/momo/momortc/IMMRtcEngineEventInterface$LocalVideoStats;-><init>()V

    .line 303
    .line 304
    .line 305
    invoke-static {v2, v3}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->H3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;Lcom/momo/momortc/IMMRtcEngineEventInterface$LocalVideoStats;)Lcom/momo/momortc/IMMRtcEngineEventInterface$LocalVideoStats;

    .line 306
    .line 307
    .line 308
    :cond_7
    iget-object v2, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 309
    .line 310
    invoke-static {v2}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->G3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/momo/momortc/IMMRtcEngineEventInterface$LocalVideoStats;

    .line 311
    .line 312
    .line 313
    move-result-object v2

    .line 314
    iget-object v3, v1, Lcom/momo/momortc/live/MMRtcStats;->videoStats:Lcom/momo/momortc/live/MMRtcLocalVideoStats;

    .line 315
    .line 316
    iget v3, v3, Lcom/momo/momortc/live/MMRtcLocalVideoStats;->videoFramerate:I

    .line 317
    .line 318
    iput v3, v2, Lcom/momo/momortc/IMMRtcEngineEventInterface$LocalVideoStats;->sentFrameRate:I

    .line 319
    .line 320
    iget-object v2, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 321
    .line 322
    invoke-static {v2}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->G3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/momo/momortc/IMMRtcEngineEventInterface$LocalVideoStats;

    .line 323
    .line 324
    .line 325
    move-result-object v2

    .line 326
    iget-object v3, v1, Lcom/momo/momortc/live/MMRtcStats;->videoStats:Lcom/momo/momortc/live/MMRtcLocalVideoStats;

    .line 327
    .line 328
    iget v3, v3, Lcom/momo/momortc/live/MMRtcLocalVideoStats;->videoBitrate:I

    .line 329
    .line 330
    iput v3, v2, Lcom/momo/momortc/IMMRtcEngineEventInterface$LocalVideoStats;->sentBitrate:I

    .line 331
    .line 332
    iget-object v2, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 333
    .line 334
    invoke-static {v2}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->G3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/momo/momortc/IMMRtcEngineEventInterface$LocalVideoStats;

    .line 335
    .line 336
    .line 337
    move-result-object v2

    .line 338
    invoke-direct {v0, v2}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a(Lcom/momo/momortc/IMMRtcEngineEventInterface$LocalVideoStats;)V

    .line 339
    .line 340
    .line 341
    iget-object v2, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 342
    .line 343
    invoke-static {v2, v1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->S3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;Lcom/momo/momortc/live/MMRtcStats;)Lcom/momo/momortc/live/MMRtcStats;

    .line 344
    .line 345
    .line 346
    iget-object v1, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 347
    .line 348
    invoke-static {v1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->T3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/wvx;

    .line 349
    .line 350
    .line 351
    move-result-object v1

    .line 352
    iget-object v2, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 353
    .line 354
    invoke-static {v2}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->R3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/momo/momortc/live/MMRtcStats;

    .line 355
    .line 356
    .line 357
    move-result-object v2

    .line 358
    iget-object v2, v2, Lcom/momo/momortc/live/MMRtcStats;->videoStats:Lcom/momo/momortc/live/MMRtcLocalVideoStats;

    .line 359
    .line 360
    iget v2, v2, Lcom/momo/momortc/live/MMRtcLocalVideoStats;->vEncodeCount:I

    .line 361
    .line 362
    int-to-long v2, v2

    .line 363
    iput-wide v2, v1, Ll/wvx;->H:J

    .line 364
    .line 365
    iget-object v1, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 366
    .line 367
    invoke-static {v1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/wvx;

    .line 368
    .line 369
    .line 370
    move-result-object v1

    .line 371
    iget-object v2, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 372
    .line 373
    invoke-static {v2}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->R3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/momo/momortc/live/MMRtcStats;

    .line 374
    .line 375
    .line 376
    move-result-object v2

    .line 377
    iget-wide v2, v2, Lcom/momo/momortc/live/MMRtcStats;->txBytes:J

    .line 378
    .line 379
    iput-wide v2, v1, Ll/wvx;->B:J

    .line 380
    .line 381
    iget-object v1, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 382
    .line 383
    invoke-static {v1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->R3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/momo/momortc/live/MMRtcStats;

    .line 384
    .line 385
    .line 386
    move-result-object v2

    .line 387
    iget-object v2, v2, Lcom/momo/momortc/live/MMRtcStats;->videoStats:Lcom/momo/momortc/live/MMRtcLocalVideoStats;

    .line 388
    .line 389
    iget-wide v2, v2, Lcom/momo/momortc/live/MMRtcLocalVideoStats;->vEncodeSize:J

    .line 390
    .line 391
    invoke-static {v1, v2, v3}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->V3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;J)J

    .line 392
    .line 393
    .line 394
    iget-object v1, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 395
    .line 396
    invoke-static {v1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->R3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/momo/momortc/live/MMRtcStats;

    .line 397
    .line 398
    .line 399
    move-result-object v2

    .line 400
    iget-object v2, v2, Lcom/momo/momortc/live/MMRtcStats;->audioStats:Lcom/momo/momortc/live/MMRtcLocalAudioStats;

    .line 401
    .line 402
    iget-wide v2, v2, Lcom/momo/momortc/live/MMRtcLocalAudioStats;->aEncodeSize:J

    .line 403
    .line 404
    invoke-static {v1, v2, v3}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->W3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;J)J

    .line 405
    .line 406
    .line 407
    iget-object v1, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 408
    .line 409
    invoke-static {v1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->R3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/momo/momortc/live/MMRtcStats;

    .line 410
    .line 411
    .line 412
    move-result-object v2

    .line 413
    iget-object v2, v2, Lcom/momo/momortc/live/MMRtcStats;->audioStats:Lcom/momo/momortc/live/MMRtcLocalAudioStats;

    .line 414
    .line 415
    iget-wide v2, v2, Lcom/momo/momortc/live/MMRtcLocalAudioStats;->aSendSize:J

    .line 416
    .line 417
    invoke-static {v1, v2, v3}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->X3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;J)J

    .line 418
    .line 419
    .line 420
    iget-object v1, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 421
    .line 422
    invoke-static {v1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->R3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/momo/momortc/live/MMRtcStats;

    .line 423
    .line 424
    .line 425
    move-result-object v2

    .line 426
    iget-object v2, v2, Lcom/momo/momortc/live/MMRtcStats;->videoStats:Lcom/momo/momortc/live/MMRtcLocalVideoStats;

    .line 427
    .line 428
    iget-wide v2, v2, Lcom/momo/momortc/live/MMRtcLocalVideoStats;->vSendSize:J

    .line 429
    .line 430
    invoke-static {v1, v2, v3}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->Y3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;J)J

    .line 431
    .line 432
    .line 433
    iget-object v1, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 434
    .line 435
    invoke-static {v1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->d3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/q210$a;

    .line 436
    .line 437
    .line 438
    move-result-object v1

    .line 439
    const/16 v2, 0x1002

    .line 440
    .line 441
    iget-object v3, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 442
    .line 443
    const/4 v11, 0x0

    .line 444
    invoke-interface {v1, v2, v11, v11, v3}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 445
    .line 446
    .line 447
    iget-object v0, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 448
    .line 449
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->Z3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/ypw;

    .line 450
    .line 451
    .line 452
    return-void
.end method

.method public onStreamInjectedStatus(Ljava/lang/String;II)V
    .locals 0

    return-void
.end method

.method public onStreamMessage(IILjava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->l3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/immomo/mediacore/coninf/MRtcChannelHandler;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->l3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/immomo/mediacore/coninf/MRtcChannelHandler;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p3}, Ljava/lang/String;->getBytes()[B

    .line 16
    .line 17
    .line 18
    move-result-object p3

    .line 19
    invoke-interface {p0, p1, p2, p3}, Lcom/immomo/mediacore/coninf/MRtcChannelHandler;->onStreamMessage(II[B)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public onStreamMessageError(IIIII)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->l3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/immomo/mediacore/coninf/MRtcChannelHandler;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->l3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/immomo/mediacore/coninf/MRtcChannelHandler;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    move v1, p1

    .line 16
    move v2, p2

    .line 17
    move v3, p3

    .line 18
    move v4, p4

    .line 19
    move v5, p5

    .line 20
    invoke-interface/range {v0 .. v5}, Lcom/immomo/mediacore/coninf/MRtcChannelHandler;->onStreamMessageError(IIIII)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public onStreamPublished(Ljava/lang/String;I)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->t2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    monitor-enter p1

    .line 8
    if-nez p2, :cond_0

    .line 9
    .line 10
    :try_start_0
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 11
    .line 12
    const/4 p2, 0x1

    .line 13
    invoke-static {p0, p2}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->x4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;Z)Z

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :catchall_0
    move-exception p0

    .line 18
    goto :goto_1

    .line 19
    :cond_0
    :goto_0
    monitor-exit p1

    .line 20
    return-void

    .line 21
    :goto_1
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    throw p0
.end method

.method public onStreamUnpublished(Ljava/lang/String;)V
    .locals 4

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "MoMoRtcPushFilter"

    .line 6
    .line 7
    new-instance v2, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v3, "onStreamPublished finish:url="

    .line 10
    .line 11
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {v0, v1, p1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 25
    .line 26
    invoke-static {p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->t2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    monitor-enter p1

    .line 31
    :try_start_0
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 32
    .line 33
    const/4 v1, 0x0

    .line 34
    invoke-static {v0, v1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->x4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;Z)Z

    .line 35
    .line 36
    .line 37
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 38
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 39
    .line 40
    invoke-static {p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->q2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    monitor-enter v0

    .line 45
    :try_start_1
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 46
    .line 47
    invoke-static {p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->u2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/wvx;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    iget-object p1, p1, Ll/wvx;->a0:Ljava/lang/String;

    .line 52
    .line 53
    if-eqz p1, :cond_0

    .line 54
    .line 55
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 56
    .line 57
    invoke-static {p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->v2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Z

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    if-nez p1, :cond_0

    .line 62
    .line 63
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 64
    .line 65
    invoke-static {p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->w2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Z

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    if-nez p1, :cond_0

    .line 70
    .line 71
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 72
    .line 73
    invoke-static {p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->z2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/evx;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    iget-object v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 78
    .line 79
    invoke-static {v2}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->x2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/wvx;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    iget-object v2, v2, Ll/wvx;->a0:Ljava/lang/String;

    .line 84
    .line 85
    iget-object v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 86
    .line 87
    invoke-static {v3}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->y2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/wvx;

    .line 88
    .line 89
    .line 90
    move-result-object v3

    .line 91
    iget-object v3, v3, Ll/wvx;->x:Ljava/lang/String;

    .line 92
    .line 93
    invoke-virtual {p1, v2, v3}, Ll/evx;->B(Ljava/lang/String;Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 97
    .line 98
    invoke-static {p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->P2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/momo/momortc/MMRtcEngine;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    iget-object v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 103
    .line 104
    invoke-static {v2}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->A2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/wvx;

    .line 105
    .line 106
    .line 107
    move-result-object v2

    .line 108
    iget-object v2, v2, Ll/wvx;->a0:Ljava/lang/String;

    .line 109
    .line 110
    const/4 v3, 0x1

    .line 111
    invoke-virtual {p1, v2, v3}, Lcom/momo/momortc/MMRtcEngine;->addPublishStreamUrl(Ljava/lang/String;Z)I

    .line 112
    .line 113
    .line 114
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 115
    .line 116
    invoke-static {p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->d3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/q210$a;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    const/16 v2, 0x3014

    .line 121
    .line 122
    invoke-interface {p1, v2, v1, v1, p0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 123
    .line 124
    .line 125
    goto :goto_0

    .line 126
    :catchall_0
    move-exception p0

    .line 127
    goto :goto_1

    .line 128
    :cond_0
    :goto_0
    monitor-exit v0

    .line 129
    return-void

    .line 130
    :goto_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 131
    throw p0

    .line 132
    :catchall_1
    move-exception p0

    .line 133
    :try_start_2
    monitor-exit p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 134
    throw p0
.end method

.method public onTokenPrivilegeWillExpire(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->m3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/immomo/mediacore/coninf/MRtcTokenWillExpireHander;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->m3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/immomo/mediacore/coninf/MRtcTokenWillExpireHander;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0, p1}, Lcom/immomo/mediacore/coninf/MRtcTokenWillExpireHander;->onTokenPrivilegeWillExpire(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public onTranscodingUpdated()V
    .locals 0

    return-void
.end method

.method public onUserEnableLocalVideo(IZ)V
    .locals 0

    return-void
.end method

.method public onUserEnableVideo(IZ)V
    .locals 0

    return-void
.end method

.method public onUserJoined(II)V
    .locals 13

    .line 1
    const-string v0, "MoMoRtcPushFilter"

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "onUserJoined uid="

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const-string v2, "unint"

    .line 18
    .line 19
    invoke-static {v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 20
    .line 21
    .line 22
    :try_start_0
    iget-object v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 23
    .line 24
    invoke-virtual {v1}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->W1()Landroid/content/Context;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-static {v1, v2}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->v3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;Landroid/content/Context;)Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-eqz v1, :cond_0

    .line 33
    .line 34
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    const-string v2, "onMemberEnter:##### setSpeakerphoneOn(false)"

    .line 39
    .line 40
    invoke-virtual {v1, v0, v2}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    iget-object v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 44
    .line 45
    invoke-static {v1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->P2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/momo/momortc/MMRtcEngine;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    if-eqz v1, :cond_1

    .line 50
    .line 51
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-virtual {v1}, Ll/csx;->D()Z

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_0
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    const-string v2, "onMemberEnter:##### setSpeakerphoneOn(true)"

    .line 64
    .line 65
    invoke-virtual {v1, v0, v2}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    iget-object v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 69
    .line 70
    invoke-static {v1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->P2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/momo/momortc/MMRtcEngine;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    if-eqz v1, :cond_1

    .line 75
    .line 76
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    invoke-virtual {v1}, Ll/csx;->D()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 81
    .line 82
    .line 83
    :catch_0
    :cond_1
    :goto_0
    new-instance v1, Ll/xhy;

    .line 84
    .line 85
    int-to-long v5, p1

    .line 86
    iget-object v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 87
    .line 88
    invoke-virtual {v2}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->w1()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    const-string v3, "S"

    .line 93
    .line 94
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    move-result v2

    .line 98
    const/4 v11, 0x1

    .line 99
    if-eqz v2, :cond_2

    .line 100
    .line 101
    move v2, v11

    .line 102
    goto :goto_1

    .line 103
    :cond_2
    const/4 v2, 0x2

    .line 104
    :goto_1
    invoke-direct {v1, v5, v6, v2}, Ll/xhy;-><init>(JI)V

    .line 105
    .line 106
    .line 107
    iget-object v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 108
    .line 109
    invoke-static {v2}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->a3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 110
    .line 111
    .line 112
    move-result-object v2

    .line 113
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 114
    .line 115
    .line 116
    move-result-object v3

    .line 117
    invoke-virtual {v2, v3, v1}, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    iget-object v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 121
    .line 122
    invoke-static {v2}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->w3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/wvx;

    .line 123
    .line 124
    .line 125
    move-result-object v2

    .line 126
    iget-wide v2, v2, Ll/wvx;->c1:J

    .line 127
    .line 128
    const-wide/16 v7, 0x1

    .line 129
    .line 130
    cmp-long v2, v2, v7

    .line 131
    .line 132
    if-nez v2, :cond_3

    .line 133
    .line 134
    iget-object v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 135
    .line 136
    invoke-static {v2}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->x3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/evx;

    .line 137
    .line 138
    .line 139
    move-result-object v2

    .line 140
    invoke-virtual {v1}, Ll/xhy;->c()I

    .line 141
    .line 142
    .line 143
    move-result v4

    .line 144
    const-wide/16 v7, 0x0

    .line 145
    .line 146
    const-wide/16 v9, 0x0

    .line 147
    .line 148
    const/4 v3, 0x1

    .line 149
    invoke-virtual/range {v2 .. v10}, Ll/evx;->e(ZIJJJ)V

    .line 150
    .line 151
    .line 152
    :cond_3
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 153
    .line 154
    .line 155
    move-result-object v2

    .line 156
    new-instance v3, Ljava/lang/StringBuilder;

    .line 157
    .line 158
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 159
    .line 160
    .line 161
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 162
    .line 163
    .line 164
    move-result-object v4

    .line 165
    invoke-virtual {v4}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object v4

    .line 169
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 170
    .line 171
    .line 172
    const-string v4, " onUserJoined:uid:"

    .line 173
    .line 174
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 175
    .line 176
    .line 177
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 178
    .line 179
    .line 180
    const-string v4, ",elapsed:"

    .line 181
    .line 182
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 183
    .line 184
    .line 185
    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 189
    .line 190
    .line 191
    move-result-object v3

    .line 192
    invoke-virtual {v2, v0, v3}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 193
    .line 194
    .line 195
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 196
    .line 197
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->W2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Z

    .line 198
    .line 199
    .line 200
    move-result v0

    .line 201
    if-nez v0, :cond_4

    .line 202
    .line 203
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 204
    .line 205
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->X2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Z

    .line 206
    .line 207
    .line 208
    move-result v0

    .line 209
    if-eqz v0, :cond_6

    .line 210
    .line 211
    :cond_4
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 212
    .line 213
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->k3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/ror;

    .line 214
    .line 215
    .line 216
    move-result-object v0

    .line 217
    iget v0, v0, Ll/ror;->i1:I

    .line 218
    .line 219
    if-eq v0, p1, :cond_6

    .line 220
    .line 221
    invoke-virtual {v1, v11}, Ll/xhy;->f(Z)V

    .line 222
    .line 223
    .line 224
    invoke-virtual {v1, v11}, Ll/xhy;->g(Z)V

    .line 225
    .line 226
    .line 227
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 228
    .line 229
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->b3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)I

    .line 230
    .line 231
    .line 232
    move-result v0

    .line 233
    if-ne v0, v11, :cond_5

    .line 234
    .line 235
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 236
    .line 237
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->y3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/evx;

    .line 238
    .line 239
    .line 240
    move-result-object v2

    .line 241
    invoke-virtual {v1}, Ll/xhy;->c()I

    .line 242
    .line 243
    .line 244
    move-result v4

    .line 245
    const-wide/16 v9, 0x0

    .line 246
    .line 247
    const-wide/16 v11, 0x0

    .line 248
    .line 249
    const/4 v3, 0x1

    .line 250
    const-wide/16 v7, 0x0

    .line 251
    .line 252
    invoke-virtual/range {v2 .. v12}, Ll/evx;->c(ZIJJJJ)V

    .line 253
    .line 254
    .line 255
    :cond_5
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 256
    .line 257
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->d3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/q210$a;

    .line 258
    .line 259
    .line 260
    move-result-object v0

    .line 261
    const/4 v1, 0x0

    .line 262
    iget-object v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 263
    .line 264
    const/16 v3, 0x2006

    .line 265
    .line 266
    invoke-interface {v0, v3, p1, v1, v2}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 267
    .line 268
    .line 269
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 270
    .line 271
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->Z2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Landroid/os/Handler;

    .line 272
    .line 273
    .line 274
    move-result-object v0

    .line 275
    new-instance v1, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$b;

    .line 276
    .line 277
    invoke-direct {v1, p0, p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$b;-><init>(Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;I)V

    .line 278
    .line 279
    .line 280
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 281
    .line 282
    .line 283
    :cond_6
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 284
    .line 285
    invoke-static {p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->i3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 286
    .line 287
    .line 288
    move-result-object p1

    .line 289
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 290
    .line 291
    .line 292
    move-result-object v0

    .line 293
    new-instance v1, Ll/iny;

    .line 294
    .line 295
    invoke-direct {v1, v5, v6}, Ll/iny;-><init>(J)V

    .line 296
    .line 297
    .line 298
    invoke-virtual {p1, v0, v1}, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 299
    .line 300
    .line 301
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 302
    .line 303
    invoke-static {p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->f3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 304
    .line 305
    .line 306
    move-result-object p1

    .line 307
    if-eqz p1, :cond_7

    .line 308
    .line 309
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 310
    .line 311
    invoke-static {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->f3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 312
    .line 313
    .line 314
    move-result-object p0

    .line 315
    const-string p1, ""

    .line 316
    .line 317
    invoke-interface {p0, p1, v5, v6, p2}, Lcom/immomo/mediacore/coninf/MRtcEventHandler;->onJoinChannelSuccess(Ljava/lang/String;JI)V

    .line 318
    .line 319
    .line 320
    :cond_7
    return-void
.end method

.method public onUserMuteAudio(IZ)V
    .locals 3

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v2, "onUserMuteAudiouid:"

    .line 8
    .line 9
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v2, ",muted:"

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    const-string v2, "MoMoRtcPushFilter"

    .line 28
    .line 29
    invoke-virtual {v0, v2, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 33
    .line 34
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->i3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    int-to-long v1, p1

    .line 39
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v0, v1}, Ljava/util/AbstractMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    check-cast v0, Ll/iny;

    .line 48
    .line 49
    if-eqz v0, :cond_0

    .line 50
    .line 51
    invoke-virtual {v0, p2}, Ll/iny;->g(Z)V

    .line 52
    .line 53
    .line 54
    :cond_0
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 55
    .line 56
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->f3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    if-eqz v0, :cond_1

    .line 61
    .line 62
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 63
    .line 64
    invoke-static {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->f3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-interface {p0, p1, p2}, Lcom/immomo/mediacore/coninf/MRtcEventHandler;->onUserMuteAudio(IZ)V

    .line 69
    .line 70
    .line 71
    :cond_1
    return-void
.end method

.method public onUserMuteVideo(IZ)V
    .locals 3

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v2, "onUserMuteVideouid:"

    .line 8
    .line 9
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v2, ",muted:"

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    const-string v2, "MoMoRtcPushFilter"

    .line 28
    .line 29
    invoke-virtual {v0, v2, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 33
    .line 34
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->i3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    int-to-long v1, p1

    .line 39
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v0, v1}, Ljava/util/AbstractMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    check-cast v0, Ll/iny;

    .line 48
    .line 49
    if-eqz v0, :cond_0

    .line 50
    .line 51
    invoke-virtual {v0, p2}, Ll/iny;->h(Z)V

    .line 52
    .line 53
    .line 54
    :cond_0
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 55
    .line 56
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->f3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    if-eqz v0, :cond_1

    .line 61
    .line 62
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 63
    .line 64
    invoke-static {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->f3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-interface {p0, p1, p2}, Lcom/immomo/mediacore/coninf/MRtcEventHandler;->onUserMuteVideo(IZ)V

    .line 69
    .line 70
    .line 71
    :cond_1
    return-void
.end method

.method public onUserOffline(II)V
    .locals 12

    .line 1
    const-string v0, "unint"

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "onUserOffline uid="

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 21
    .line 22
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->i3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const-wide/16 v1, 0x0

    .line 27
    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 31
    .line 32
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->i3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    int-to-long v3, p1

    .line 37
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 38
    .line 39
    .line 40
    move-result-object v6

    .line 41
    invoke-virtual {v0, v6}, Ljava/util/AbstractMap;->containsKey(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_1

    .line 46
    .line 47
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 48
    .line 49
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->i3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 54
    .line 55
    .line 56
    move-result-object v6

    .line 57
    invoke-virtual {v0, v6}, Ljava/util/AbstractMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    check-cast v0, Ll/iny;

    .line 62
    .line 63
    if-eqz v0, :cond_0

    .line 64
    .line 65
    iget-wide v1, v0, Ll/iny;->d:J

    .line 66
    .line 67
    :cond_0
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 68
    .line 69
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->i3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 74
    .line 75
    .line 76
    move-result-object v3

    .line 77
    invoke-virtual {v0, v3}, Ljava/util/AbstractMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    :cond_1
    move-wide v6, v1

    .line 81
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 82
    .line 83
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->a3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    if-eqz v0, :cond_3

    .line 88
    .line 89
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 90
    .line 91
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->a3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    int-to-long v3, p1

    .line 96
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    invoke-virtual {v0, v1}, Ljava/util/AbstractMap;->containsKey(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    if-eqz v0, :cond_3

    .line 105
    .line 106
    const-string v0, "zhengjijian"

    .line 107
    .line 108
    new-instance v1, Ljava/lang/StringBuilder;

    .line 109
    .line 110
    const-string v2, "onMemberExit userid "

    .line 111
    .line 112
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    const-string v2, " reason "

    .line 119
    .line 120
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v1

    .line 130
    invoke-static {v0, v1}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 131
    .line 132
    .line 133
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 134
    .line 135
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->b3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)I

    .line 136
    .line 137
    .line 138
    move-result v0

    .line 139
    const/4 v1, 0x1

    .line 140
    if-ne v0, v1, :cond_2

    .line 141
    .line 142
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 143
    .line 144
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->z3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/evx;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    iget-object v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 149
    .line 150
    invoke-static {v1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->a3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 151
    .line 152
    .line 153
    move-result-object v1

    .line 154
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 155
    .line 156
    .line 157
    move-result-object v2

    .line 158
    invoke-virtual {v1, v2}, Ljava/util/AbstractMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 159
    .line 160
    .line 161
    move-result-object v1

    .line 162
    check-cast v1, Ll/xhy;

    .line 163
    .line 164
    invoke-virtual {v1}, Ll/xhy;->c()I

    .line 165
    .line 166
    .line 167
    move-result v2

    .line 168
    const/4 v1, 0x1

    .line 169
    move v5, p2

    .line 170
    invoke-virtual/range {v0 .. v5}, Ll/evx;->d(ZIJI)V

    .line 171
    .line 172
    .line 173
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 174
    .line 175
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->A3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/evx;

    .line 176
    .line 177
    .line 178
    move-result-object v0

    .line 179
    iget-object v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 180
    .line 181
    invoke-static {v1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->a3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 182
    .line 183
    .line 184
    move-result-object v1

    .line 185
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 186
    .line 187
    .line 188
    move-result-object v2

    .line 189
    invoke-virtual {v1, v2}, Ljava/util/AbstractMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 190
    .line 191
    .line 192
    move-result-object v1

    .line 193
    check-cast v1, Ll/xhy;

    .line 194
    .line 195
    invoke-virtual {v1}, Ll/xhy;->c()I

    .line 196
    .line 197
    .line 198
    move-result v2

    .line 199
    move-wide v10, v6

    .line 200
    move-wide v7, v3

    .line 201
    move-wide v3, v10

    .line 202
    const-wide/16 v5, 0x0

    .line 203
    .line 204
    const/4 v1, 0x1

    .line 205
    move v9, p2

    .line 206
    invoke-virtual/range {v0 .. v9}, Ll/evx;->f(ZIJJJI)V

    .line 207
    .line 208
    .line 209
    :cond_2
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 210
    .line 211
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->d3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/q210$a;

    .line 212
    .line 213
    .line 214
    move-result-object v0

    .line 215
    const/4 v1, 0x0

    .line 216
    iget-object v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 217
    .line 218
    const/16 v3, 0x2007

    .line 219
    .line 220
    invoke-interface {v0, v3, p1, v1, v2}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 221
    .line 222
    .line 223
    :cond_3
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 224
    .line 225
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->V2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/ebl0;

    .line 226
    .line 227
    .line 228
    move-result-object v0

    .line 229
    if-eqz v0, :cond_5

    .line 230
    .line 231
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 232
    .line 233
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->Q2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Z

    .line 234
    .line 235
    .line 236
    move-result v0

    .line 237
    if-eqz v0, :cond_4

    .line 238
    .line 239
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 240
    .line 241
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->W2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Z

    .line 242
    .line 243
    .line 244
    move-result v0

    .line 245
    if-nez v0, :cond_4

    .line 246
    .line 247
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 248
    .line 249
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->X2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Z

    .line 250
    .line 251
    .line 252
    move-result v0

    .line 253
    if-eqz v0, :cond_5

    .line 254
    .line 255
    :cond_4
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 256
    .line 257
    .line 258
    move-result-object v0

    .line 259
    const-string v1, "MoMoRtcPushFilter"

    .line 260
    .line 261
    new-instance v2, Ljava/lang/StringBuilder;

    .line 262
    .line 263
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 264
    .line 265
    .line 266
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 267
    .line 268
    .line 269
    move-result-object v3

    .line 270
    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 271
    .line 272
    .line 273
    move-result-object v3

    .line 274
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 275
    .line 276
    .line 277
    const-string v3, "----onVideoChannelRemove userID="

    .line 278
    .line 279
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 280
    .line 281
    .line 282
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 283
    .line 284
    .line 285
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 286
    .line 287
    .line 288
    move-result-object v2

    .line 289
    invoke-virtual {v0, v1, v2}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 290
    .line 291
    .line 292
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 293
    .line 294
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->V2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/ebl0;

    .line 295
    .line 296
    .line 297
    move-result-object v0

    .line 298
    int-to-long v1, p1

    .line 299
    invoke-interface {v0, v1, v2, p2}, Ll/ebl0;->b(JI)V

    .line 300
    .line 301
    .line 302
    :cond_5
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 303
    .line 304
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->f3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 305
    .line 306
    .line 307
    move-result-object v0

    .line 308
    if-eqz v0, :cond_6

    .line 309
    .line 310
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 311
    .line 312
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->f3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 313
    .line 314
    .line 315
    move-result-object v0

    .line 316
    int-to-long v1, p1

    .line 317
    invoke-interface {v0, v1, v2, p2}, Lcom/immomo/mediacore/coninf/MRtcEventHandler;->onUserOffline(JI)V

    .line 318
    .line 319
    .line 320
    :cond_6
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 321
    .line 322
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->Y2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 323
    .line 324
    .line 325
    move-result-object v0

    .line 326
    if-eqz v0, :cond_a

    .line 327
    .line 328
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 329
    .line 330
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->Y2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 331
    .line 332
    .line 333
    move-result-object v0

    .line 334
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 335
    .line 336
    .line 337
    move-result-object v1

    .line 338
    invoke-virtual {v0, v1}, Ljava/util/AbstractMap;->containsKey(Ljava/lang/Object;)Z

    .line 339
    .line 340
    .line 341
    move-result v0

    .line 342
    if-nez v0, :cond_7

    .line 343
    .line 344
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 345
    .line 346
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->k3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/ror;

    .line 347
    .line 348
    .line 349
    move-result-object v0

    .line 350
    iget v0, v0, Ll/uow;->B0:I

    .line 351
    .line 352
    if-ne p1, v0, :cond_a

    .line 353
    .line 354
    :cond_7
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 355
    .line 356
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->k3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/ror;

    .line 357
    .line 358
    .line 359
    move-result-object v0

    .line 360
    iget v0, v0, Ll/uow;->B0:I

    .line 361
    .line 362
    if-eq p1, v0, :cond_8

    .line 363
    .line 364
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 365
    .line 366
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->Y2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 367
    .line 368
    .line 369
    move-result-object v0

    .line 370
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 371
    .line 372
    .line 373
    move-result-object v1

    .line 374
    invoke-virtual {v0, v1}, Ljava/util/AbstractMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 375
    .line 376
    .line 377
    :cond_8
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 378
    .line 379
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->Q2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Z

    .line 380
    .line 381
    .line 382
    move-result v0

    .line 383
    iget-object v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 384
    .line 385
    if-eqz v0, :cond_9

    .line 386
    .line 387
    invoke-static {v1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->T2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/fbl0;

    .line 388
    .line 389
    .line 390
    move-result-object v0

    .line 391
    if-eqz v0, :cond_a

    .line 392
    .line 393
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 394
    .line 395
    .line 396
    move-result-object v0

    .line 397
    const-string v1, "MoMoRtcPushFilter"

    .line 398
    .line 399
    new-instance v2, Ljava/lang/StringBuilder;

    .line 400
    .line 401
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 402
    .line 403
    .line 404
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 405
    .line 406
    .line 407
    move-result-object v3

    .line 408
    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 409
    .line 410
    .line 411
    move-result-object v3

    .line 412
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 413
    .line 414
    .line 415
    const-string v3, "----onVideoChannelRemoveExt userID="

    .line 416
    .line 417
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 418
    .line 419
    .line 420
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 421
    .line 422
    .line 423
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 424
    .line 425
    .line 426
    move-result-object v2

    .line 427
    invoke-virtual {v0, v1, v2}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 428
    .line 429
    .line 430
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 431
    .line 432
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->T2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/fbl0;

    .line 433
    .line 434
    .line 435
    move-result-object v0

    .line 436
    int-to-long v1, p1

    .line 437
    invoke-interface {v0, v1, v2, p2}, Ll/fbl0;->b(JI)V

    .line 438
    .line 439
    .line 440
    goto :goto_0

    .line 441
    :cond_9
    invoke-static {v1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->R2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/gkl0;

    .line 442
    .line 443
    .line 444
    move-result-object v0

    .line 445
    if-eqz v0, :cond_a

    .line 446
    .line 447
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 448
    .line 449
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->R2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/gkl0;

    .line 450
    .line 451
    .line 452
    move-result-object v0

    .line 453
    int-to-long v1, p1

    .line 454
    invoke-interface {v0, v1, v2, p2}, Ll/gkl0;->b(JI)V

    .line 455
    .line 456
    .line 457
    :cond_a
    :goto_0
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 458
    .line 459
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->O2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ljava/util/Map;

    .line 460
    .line 461
    .line 462
    move-result-object v1

    .line 463
    monitor-enter v1

    .line 464
    :try_start_0
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 465
    .line 466
    invoke-static {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->O2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ljava/util/Map;

    .line 467
    .line 468
    .line 469
    move-result-object p0

    .line 470
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 471
    .line 472
    .line 473
    move-result-object p1

    .line 474
    invoke-interface {p0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 475
    .line 476
    .line 477
    move-result-object p0

    .line 478
    check-cast p0, Lcom/momo/rtcbase/SurfaceViewRenderer;

    .line 479
    .line 480
    if-eqz p0, :cond_b

    .line 481
    .line 482
    invoke-virtual {p0}, Lcom/momo/rtcbase/SurfaceViewRenderer;->release()V

    .line 483
    .line 484
    .line 485
    goto :goto_1

    .line 486
    :catchall_0
    move-exception v0

    .line 487
    move-object p0, v0

    .line 488
    goto :goto_2

    .line 489
    :cond_b
    :goto_1
    monitor-exit v1

    .line 490
    return-void

    .line 491
    :goto_2
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 492
    throw p0
.end method

.method public onVideoSizeChanged(III)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->J2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/kod0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->J2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/kod0;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0, p1, p2, p3}, Ll/kod0;->r(III)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public onVideoStopped()V
    .locals 0

    return-void
.end method

.method public onWarning(I)V
    .locals 4

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v2, "onWarning"

    .line 8
    .line 9
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const-string v2, "MoMoRtcPushFilter"

    .line 20
    .line 21
    invoke-virtual {v0, v2, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    const/16 v0, 0x2bd

    .line 25
    .line 26
    if-ne p1, v0, :cond_0

    .line 27
    .line 28
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 29
    .line 30
    const/4 v1, -0x1

    .line 31
    const/4 v2, 0x0

    .line 32
    const/4 v3, 0x0

    .line 33
    invoke-static {v0, v3, v1, v2}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->j4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;Ljava/lang/Object;II)V

    .line 34
    .line 35
    .line 36
    :cond_0
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 37
    .line 38
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->f3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    if-eqz v0, :cond_1

    .line 43
    .line 44
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 45
    .line 46
    invoke-static {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->f3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-interface {p0, p1}, Lcom/immomo/mediacore/coninf/MRtcEventHandler;->onWarning(I)V

    .line 51
    .line 52
    .line 53
    :cond_1
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
