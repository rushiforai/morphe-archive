.class public Ll/kg60;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;II)Ljava/lang/String;
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const/16 v1, 0x65

    .line 7
    .line 8
    if-eqz p1, :cond_9

    .line 9
    .line 10
    const/16 p0, 0x32d

    .line 11
    .line 12
    const/16 v2, 0x64

    .line 13
    .line 14
    if-eq p1, p0, :cond_8

    .line 15
    .line 16
    const/16 p0, 0x1101

    .line 17
    .line 18
    if-eq p1, p0, :cond_7

    .line 19
    .line 20
    const/16 p0, 0x3101

    .line 21
    .line 22
    if-eq p1, p0, :cond_3

    .line 23
    .line 24
    const/16 p0, 0x4100

    .line 25
    .line 26
    if-eq p1, p0, :cond_2

    .line 27
    .line 28
    const p0, 0xf4241

    .line 29
    .line 30
    .line 31
    if-eq p1, p0, :cond_0

    .line 32
    .line 33
    goto/16 :goto_1

    .line 34
    .line 35
    :cond_0
    if-ne p2, v2, :cond_1

    .line 36
    .line 37
    const-string p0, "linkType error, check enterRoom linktype"

    .line 38
    .line 39
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    goto/16 :goto_1

    .line 43
    .line 44
    :cond_1
    if-ne p2, v1, :cond_e

    .line 45
    .line 46
    const-string p0, "livesource is null"

    .line 47
    .line 48
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    goto/16 :goto_1

    .line 52
    .line 53
    :cond_2
    const-string p0, "Camera open error"

    .line 54
    .line 55
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    goto/16 :goto_1

    .line 59
    .line 60
    :cond_3
    const/4 p0, 0x1

    .line 61
    if-ne p2, p0, :cond_4

    .line 62
    .line 63
    const-string p0, "rtmp pusher connect timeout, check network or rtmp pushurl"

    .line 64
    .line 65
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    goto/16 :goto_1

    .line 69
    .line 70
    :cond_4
    const/16 p0, 0xb

    .line 71
    .line 72
    if-eq p2, p0, :cond_6

    .line 73
    .line 74
    const/16 p0, 0xc

    .line 75
    .line 76
    if-eq p2, p0, :cond_6

    .line 77
    .line 78
    const/16 p0, 0xd

    .line 79
    .line 80
    if-ne p2, p0, :cond_5

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_5
    const/16 p0, 0xe

    .line 84
    .line 85
    if-ne p2, p0, :cond_e

    .line 86
    .line 87
    const-string p0, "rtmp send size is 0, check network"

    .line 88
    .line 89
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    goto :goto_1

    .line 93
    :cond_6
    :goto_0
    const-string p0, "rtmp write header or packet error, check network or rtmp pushpurl"

    .line 94
    .line 95
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    goto :goto_1

    .line 99
    :cond_7
    const/16 p0, 0x32c

    .line 100
    .line 101
    if-ne p2, p0, :cond_e

    .line 102
    .line 103
    const-string p0, "rtc network error"

    .line 104
    .line 105
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    goto :goto_1

    .line 109
    :cond_8
    if-ne p2, v2, :cond_e

    .line 110
    .line 111
    const-string p0, "linkType error, check enterRoom linktype not support tx, mm, wl"

    .line 112
    .line 113
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    goto :goto_1

    .line 117
    :cond_9
    sget-object p1, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->MMLiveTypeConfAG:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 118
    .line 119
    const-string v2, "roomid or userid is null"

    .line 120
    .line 121
    const/16 v3, -0x64

    .line 122
    .line 123
    if-ne p0, p1, :cond_d

    .line 124
    .line 125
    const/16 p0, 0x6d

    .line 126
    .line 127
    if-ne p2, p0, :cond_a

    .line 128
    .line 129
    const-string p0, "Token Expired"

    .line 130
    .line 131
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    goto :goto_1

    .line 135
    :cond_a
    const/16 p0, 0x6e

    .line 136
    .line 137
    if-ne p2, p0, :cond_b

    .line 138
    .line 139
    const-string p0, "Token Invalid"

    .line 140
    .line 141
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    goto :goto_1

    .line 145
    :cond_b
    if-ne p2, v1, :cond_c

    .line 146
    .line 147
    const-string p0, "appid Invalid"

    .line 148
    .line 149
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    goto :goto_1

    .line 153
    :cond_c
    if-ne p2, v3, :cond_e

    .line 154
    .line 155
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    goto :goto_1

    .line 159
    :cond_d
    sget-object p1, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->MMLiveTypeConfVolc:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 160
    .line 161
    if-ne p0, p1, :cond_e

    .line 162
    .line 163
    if-ne p2, v3, :cond_e

    .line 164
    .line 165
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    :cond_e
    :goto_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object p0

    .line 172
    return-object p0
.end method
