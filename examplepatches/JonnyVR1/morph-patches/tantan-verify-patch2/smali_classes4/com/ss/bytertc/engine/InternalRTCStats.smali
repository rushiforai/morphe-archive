.class public Lcom/ss/bytertc/engine/InternalRTCStats;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public cpuAppUsage:D

.field public cpuTotalUsage:D

.field public rtt:I

.field public rxAudioKBitRate:I

.field public rxBytes:I

.field public rxCellularKBitrate:I

.field public rxJitter:I

.field public rxKBitRate:I

.field public rxLostrate:D

.field public rxScreenKBitRate:I

.field public rxVideoKBitRate:I

.field public totalDuration:I

.field public txAudioKBitRate:I

.field public txBytes:I

.field public txCellularKBitrate:I

.field public txJitter:I

.field public txKBitRate:I

.field public txLostrate:D

.field public txScreenKBitRate:I

.field public txVideoKBitRate:I

.field public users:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(IIIIIIIIIIIIDDDDIIIII)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/ss/bytertc/engine/InternalRTCStats;->totalDuration:I

    .line 5
    .line 6
    iput p2, p0, Lcom/ss/bytertc/engine/InternalRTCStats;->txBytes:I

    .line 7
    .line 8
    iput p3, p0, Lcom/ss/bytertc/engine/InternalRTCStats;->rxBytes:I

    .line 9
    .line 10
    iput p4, p0, Lcom/ss/bytertc/engine/InternalRTCStats;->txKBitRate:I

    .line 11
    .line 12
    iput p5, p0, Lcom/ss/bytertc/engine/InternalRTCStats;->rxKBitRate:I

    .line 13
    .line 14
    iput p6, p0, Lcom/ss/bytertc/engine/InternalRTCStats;->txAudioKBitRate:I

    .line 15
    .line 16
    iput p7, p0, Lcom/ss/bytertc/engine/InternalRTCStats;->rxAudioKBitRate:I

    .line 17
    .line 18
    iput p8, p0, Lcom/ss/bytertc/engine/InternalRTCStats;->txVideoKBitRate:I

    .line 19
    .line 20
    iput p9, p0, Lcom/ss/bytertc/engine/InternalRTCStats;->rxVideoKBitRate:I

    .line 21
    .line 22
    iput p10, p0, Lcom/ss/bytertc/engine/InternalRTCStats;->txScreenKBitRate:I

    .line 23
    .line 24
    iput p11, p0, Lcom/ss/bytertc/engine/InternalRTCStats;->rxScreenKBitRate:I

    .line 25
    .line 26
    iput p12, p0, Lcom/ss/bytertc/engine/InternalRTCStats;->users:I

    .line 27
    .line 28
    iput-wide p13, p0, Lcom/ss/bytertc/engine/InternalRTCStats;->cpuTotalUsage:D

    .line 29
    .line 30
    move-wide p1, p15

    .line 31
    iput-wide p1, p0, Lcom/ss/bytertc/engine/InternalRTCStats;->cpuAppUsage:D

    .line 32
    .line 33
    move-wide/from16 p1, p19

    .line 34
    .line 35
    iput-wide p1, p0, Lcom/ss/bytertc/engine/InternalRTCStats;->rxLostrate:D

    .line 36
    .line 37
    move-wide/from16 p1, p17

    .line 38
    .line 39
    iput-wide p1, p0, Lcom/ss/bytertc/engine/InternalRTCStats;->txLostrate:D

    .line 40
    .line 41
    move/from16 p1, p21

    .line 42
    .line 43
    iput p1, p0, Lcom/ss/bytertc/engine/InternalRTCStats;->rtt:I

    .line 44
    .line 45
    move/from16 p1, p22

    .line 46
    .line 47
    iput p1, p0, Lcom/ss/bytertc/engine/InternalRTCStats;->txJitter:I

    .line 48
    .line 49
    move/from16 p1, p23

    .line 50
    .line 51
    iput p1, p0, Lcom/ss/bytertc/engine/InternalRTCStats;->rxJitter:I

    .line 52
    .line 53
    move/from16 p1, p24

    .line 54
    .line 55
    iput p1, p0, Lcom/ss/bytertc/engine/InternalRTCStats;->txCellularKBitrate:I

    .line 56
    .line 57
    move/from16 p1, p25

    .line 58
    .line 59
    iput p1, p0, Lcom/ss/bytertc/engine/InternalRTCStats;->rxCellularKBitrate:I

    .line 60
    .line 61
    return-void
.end method

.method private static create(IIIIIIIIIIIIDDDDIIIII)Lcom/ss/bytertc/engine/InternalRTCStats;
    .locals 26
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    new-instance v0, Lcom/ss/bytertc/engine/InternalRTCStats;

    .line 2
    .line 3
    move/from16 v1, p0

    .line 4
    .line 5
    move/from16 v2, p1

    .line 6
    .line 7
    move/from16 v3, p2

    .line 8
    .line 9
    move/from16 v4, p3

    .line 10
    .line 11
    move/from16 v5, p4

    .line 12
    .line 13
    move/from16 v6, p5

    .line 14
    .line 15
    move/from16 v7, p6

    .line 16
    .line 17
    move/from16 v8, p7

    .line 18
    .line 19
    move/from16 v9, p8

    .line 20
    .line 21
    move/from16 v10, p9

    .line 22
    .line 23
    move/from16 v11, p10

    .line 24
    .line 25
    move/from16 v12, p11

    .line 26
    .line 27
    move-wide/from16 v13, p12

    .line 28
    .line 29
    move-wide/from16 v15, p14

    .line 30
    .line 31
    move-wide/from16 v17, p16

    .line 32
    .line 33
    move-wide/from16 v19, p18

    .line 34
    .line 35
    move/from16 v21, p20

    .line 36
    .line 37
    move/from16 v22, p21

    .line 38
    .line 39
    move/from16 v23, p22

    .line 40
    .line 41
    move/from16 v24, p23

    .line 42
    .line 43
    move/from16 v25, p24

    .line 44
    .line 45
    invoke-direct/range {v0 .. v25}, Lcom/ss/bytertc/engine/InternalRTCStats;-><init>(IIIIIIIIIIIIDDDDIIIII)V

    .line 46
    .line 47
    .line 48
    return-object v0
.end method


# virtual methods
.method public reset()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/ss/bytertc/engine/InternalRTCStats;->totalDuration:I

    .line 3
    .line 4
    iput v0, p0, Lcom/ss/bytertc/engine/InternalRTCStats;->txBytes:I

    .line 5
    .line 6
    iput v0, p0, Lcom/ss/bytertc/engine/InternalRTCStats;->rxBytes:I

    .line 7
    .line 8
    iput v0, p0, Lcom/ss/bytertc/engine/InternalRTCStats;->txKBitRate:I

    .line 9
    .line 10
    iput v0, p0, Lcom/ss/bytertc/engine/InternalRTCStats;->rxKBitRate:I

    .line 11
    .line 12
    iput v0, p0, Lcom/ss/bytertc/engine/InternalRTCStats;->txAudioKBitRate:I

    .line 13
    .line 14
    iput v0, p0, Lcom/ss/bytertc/engine/InternalRTCStats;->rxAudioKBitRate:I

    .line 15
    .line 16
    iput v0, p0, Lcom/ss/bytertc/engine/InternalRTCStats;->txVideoKBitRate:I

    .line 17
    .line 18
    iput v0, p0, Lcom/ss/bytertc/engine/InternalRTCStats;->rxVideoKBitRate:I

    .line 19
    .line 20
    iput v0, p0, Lcom/ss/bytertc/engine/InternalRTCStats;->txScreenKBitRate:I

    .line 21
    .line 22
    iput v0, p0, Lcom/ss/bytertc/engine/InternalRTCStats;->rxScreenKBitRate:I

    .line 23
    .line 24
    iput v0, p0, Lcom/ss/bytertc/engine/InternalRTCStats;->users:I

    .line 25
    .line 26
    const-wide/16 v1, 0x0

    .line 27
    .line 28
    iput-wide v1, p0, Lcom/ss/bytertc/engine/InternalRTCStats;->cpuTotalUsage:D

    .line 29
    .line 30
    iput-wide v1, p0, Lcom/ss/bytertc/engine/InternalRTCStats;->cpuAppUsage:D

    .line 31
    .line 32
    iput-wide v1, p0, Lcom/ss/bytertc/engine/InternalRTCStats;->rxLostrate:D

    .line 33
    .line 34
    iput-wide v1, p0, Lcom/ss/bytertc/engine/InternalRTCStats;->txLostrate:D

    .line 35
    .line 36
    iput v0, p0, Lcom/ss/bytertc/engine/InternalRTCStats;->rtt:I

    .line 37
    .line 38
    iput v0, p0, Lcom/ss/bytertc/engine/InternalRTCStats;->txJitter:I

    .line 39
    .line 40
    iput v0, p0, Lcom/ss/bytertc/engine/InternalRTCStats;->rxJitter:I

    .line 41
    .line 42
    iput v0, p0, Lcom/ss/bytertc/engine/InternalRTCStats;->txCellularKBitrate:I

    .line 43
    .line 44
    iput v0, p0, Lcom/ss/bytertc/engine/InternalRTCStats;->rxCellularKBitrate:I

    .line 45
    .line 46
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "RtcStats{totalDuration="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Lcom/ss/bytertc/engine/InternalRTCStats;->totalDuration:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ", txBytes="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget v1, p0, Lcom/ss/bytertc/engine/InternalRTCStats;->txBytes:I

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ", rxBytes="

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget v1, p0, Lcom/ss/bytertc/engine/InternalRTCStats;->rxBytes:I

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, ", txKBitRate="

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget v1, p0, Lcom/ss/bytertc/engine/InternalRTCStats;->txKBitRate:I

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, ", rxKBitRate="

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget v1, p0, Lcom/ss/bytertc/engine/InternalRTCStats;->rxKBitRate:I

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v1, ", txAudioKBitRate="

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget v1, p0, Lcom/ss/bytertc/engine/InternalRTCStats;->txAudioKBitRate:I

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v1, ", rxAudioKBitRate="

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    iget v1, p0, Lcom/ss/bytertc/engine/InternalRTCStats;->rxAudioKBitRate:I

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    const-string v1, ", txVideoKBitRate="

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    iget v1, p0, Lcom/ss/bytertc/engine/InternalRTCStats;->txVideoKBitRate:I

    .line 79
    .line 80
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    const-string v1, ", rxVideoKBitRate="

    .line 84
    .line 85
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    iget v1, p0, Lcom/ss/bytertc/engine/InternalRTCStats;->rxVideoKBitRate:I

    .line 89
    .line 90
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    const-string v1, ", txScreenKBitRate="

    .line 94
    .line 95
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    iget v1, p0, Lcom/ss/bytertc/engine/InternalRTCStats;->txScreenKBitRate:I

    .line 99
    .line 100
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    const-string v1, ", rxScreenKBitRate="

    .line 104
    .line 105
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    iget v1, p0, Lcom/ss/bytertc/engine/InternalRTCStats;->rxScreenKBitRate:I

    .line 109
    .line 110
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    const-string v1, ", users="

    .line 114
    .line 115
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    iget v1, p0, Lcom/ss/bytertc/engine/InternalRTCStats;->users:I

    .line 119
    .line 120
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    const-string v1, ", cpuTotalUsage="

    .line 124
    .line 125
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    iget-wide v1, p0, Lcom/ss/bytertc/engine/InternalRTCStats;->cpuTotalUsage:D

    .line 129
    .line 130
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    const-string v1, ", cpuAppUsage="

    .line 134
    .line 135
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    iget-wide v1, p0, Lcom/ss/bytertc/engine/InternalRTCStats;->cpuAppUsage:D

    .line 139
    .line 140
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    const-string v1, ", txLostrate="

    .line 144
    .line 145
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    iget-wide v1, p0, Lcom/ss/bytertc/engine/InternalRTCStats;->txLostrate:D

    .line 149
    .line 150
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    const-string v1, ", rxLostrate="

    .line 154
    .line 155
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    iget-wide v1, p0, Lcom/ss/bytertc/engine/InternalRTCStats;->rxLostrate:D

    .line 159
    .line 160
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    const-string v1, ", rtt="

    .line 164
    .line 165
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    iget v1, p0, Lcom/ss/bytertc/engine/InternalRTCStats;->rtt:I

    .line 169
    .line 170
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 171
    .line 172
    .line 173
    const-string v1, ", txJitter="

    .line 174
    .line 175
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 176
    .line 177
    .line 178
    iget v1, p0, Lcom/ss/bytertc/engine/InternalRTCStats;->txJitter:I

    .line 179
    .line 180
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 181
    .line 182
    .line 183
    const-string v1, ", rxJitter="

    .line 184
    .line 185
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    iget v1, p0, Lcom/ss/bytertc/engine/InternalRTCStats;->rxJitter:I

    .line 189
    .line 190
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 191
    .line 192
    .line 193
    const-string v1, ", txCellularKBitrate="

    .line 194
    .line 195
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 196
    .line 197
    .line 198
    iget v1, p0, Lcom/ss/bytertc/engine/InternalRTCStats;->txCellularKBitrate:I

    .line 199
    .line 200
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 201
    .line 202
    .line 203
    const-string v1, ", rxCellularKBitrate="

    .line 204
    .line 205
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 206
    .line 207
    .line 208
    iget p0, p0, Lcom/ss/bytertc/engine/InternalRTCStats;->rxCellularKBitrate:I

    .line 209
    .line 210
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 211
    .line 212
    .line 213
    const/16 p0, 0x7d

    .line 214
    .line 215
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 216
    .line 217
    .line 218
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 219
    .line 220
    .line 221
    move-result-object p0

    .line 222
    return-object p0
.end method
