.class public Lorg/fourthline/cling/support/model/PositionInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private absCount:I

.field private absTime:Ljava/lang/String;

.field private relCount:I

.field private relTime:Ljava/lang/String;

.field private track:Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

.field private trackDuration:Ljava/lang/String;

.field private trackMetaData:Ljava/lang/String;

.field private trackURI:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 139
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 140
    new-instance v0, Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

    const-wide/16 v1, 0x0

    invoke-direct {v0, v1, v2}, Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;-><init>(J)V

    iput-object v0, p0, Lorg/fourthline/cling/support/model/PositionInfo;->track:Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

    .line 141
    const-string v0, "00:00:00"

    iput-object v0, p0, Lorg/fourthline/cling/support/model/PositionInfo;->trackDuration:Ljava/lang/String;

    .line 142
    const-string v1, "NOT_IMPLEMENTED"

    iput-object v1, p0, Lorg/fourthline/cling/support/model/PositionInfo;->trackMetaData:Ljava/lang/String;

    .line 143
    const-string v1, ""

    iput-object v1, p0, Lorg/fourthline/cling/support/model/PositionInfo;->trackURI:Ljava/lang/String;

    .line 144
    iput-object v0, p0, Lorg/fourthline/cling/support/model/PositionInfo;->relTime:Ljava/lang/String;

    .line 145
    iput-object v0, p0, Lorg/fourthline/cling/support/model/PositionInfo;->absTime:Ljava/lang/String;

    const v0, 0x7fffffff

    .line 146
    iput v0, p0, Lorg/fourthline/cling/support/model/PositionInfo;->relCount:I

    .line 147
    iput v0, p0, Lorg/fourthline/cling/support/model/PositionInfo;->absCount:I

    return-void
.end method

.method public constructor <init>(JLjava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 213
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 214
    new-instance v0, Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

    const-wide/16 v1, 0x0

    invoke-direct {v0, v1, v2}, Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;-><init>(J)V

    iput-object v0, p0, Lorg/fourthline/cling/support/model/PositionInfo;->track:Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

    .line 215
    const-string v0, "00:00:00"

    iput-object v0, p0, Lorg/fourthline/cling/support/model/PositionInfo;->trackDuration:Ljava/lang/String;

    .line 216
    const-string v1, "NOT_IMPLEMENTED"

    iput-object v1, p0, Lorg/fourthline/cling/support/model/PositionInfo;->trackMetaData:Ljava/lang/String;

    .line 217
    const-string v1, ""

    iput-object v1, p0, Lorg/fourthline/cling/support/model/PositionInfo;->trackURI:Ljava/lang/String;

    .line 218
    iput-object v0, p0, Lorg/fourthline/cling/support/model/PositionInfo;->relTime:Ljava/lang/String;

    .line 219
    iput-object v0, p0, Lorg/fourthline/cling/support/model/PositionInfo;->absTime:Ljava/lang/String;

    const v0, 0x7fffffff

    .line 220
    iput v0, p0, Lorg/fourthline/cling/support/model/PositionInfo;->relCount:I

    .line 221
    iput v0, p0, Lorg/fourthline/cling/support/model/PositionInfo;->absCount:I

    .line 222
    new-instance v0, Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

    invoke-direct {v0, p1, p2}, Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;-><init>(J)V

    iput-object v0, p0, Lorg/fourthline/cling/support/model/PositionInfo;->track:Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

    .line 223
    iput-object p3, p0, Lorg/fourthline/cling/support/model/PositionInfo;->trackMetaData:Ljava/lang/String;

    .line 224
    iput-object p4, p0, Lorg/fourthline/cling/support/model/PositionInfo;->trackURI:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 182
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 183
    new-instance v0, Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

    const-wide/16 v1, 0x0

    invoke-direct {v0, v1, v2}, Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;-><init>(J)V

    iput-object v0, p0, Lorg/fourthline/cling/support/model/PositionInfo;->track:Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

    .line 184
    const-string v0, "00:00:00"

    iput-object v0, p0, Lorg/fourthline/cling/support/model/PositionInfo;->trackDuration:Ljava/lang/String;

    .line 185
    const-string v1, "NOT_IMPLEMENTED"

    iput-object v1, p0, Lorg/fourthline/cling/support/model/PositionInfo;->trackMetaData:Ljava/lang/String;

    .line 186
    const-string v1, ""

    iput-object v1, p0, Lorg/fourthline/cling/support/model/PositionInfo;->trackURI:Ljava/lang/String;

    .line 187
    iput-object v0, p0, Lorg/fourthline/cling/support/model/PositionInfo;->relTime:Ljava/lang/String;

    .line 188
    iput-object v0, p0, Lorg/fourthline/cling/support/model/PositionInfo;->absTime:Ljava/lang/String;

    const v0, 0x7fffffff

    .line 189
    iput v0, p0, Lorg/fourthline/cling/support/model/PositionInfo;->relCount:I

    .line 190
    iput v0, p0, Lorg/fourthline/cling/support/model/PositionInfo;->absCount:I

    .line 191
    new-instance v0, Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

    invoke-direct {v0, p1, p2}, Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;-><init>(J)V

    iput-object v0, p0, Lorg/fourthline/cling/support/model/PositionInfo;->track:Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

    .line 192
    iput-object p3, p0, Lorg/fourthline/cling/support/model/PositionInfo;->trackDuration:Ljava/lang/String;

    .line 193
    iput-object p4, p0, Lorg/fourthline/cling/support/model/PositionInfo;->trackURI:Ljava/lang/String;

    .line 194
    iput-object p5, p0, Lorg/fourthline/cling/support/model/PositionInfo;->relTime:Ljava/lang/String;

    .line 195
    iput-object p6, p0, Lorg/fourthline/cling/support/model/PositionInfo;->absTime:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;II)V
    .locals 3

    .line 196
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 197
    new-instance v0, Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

    const-wide/16 v1, 0x0

    invoke-direct {v0, v1, v2}, Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;-><init>(J)V

    iput-object v0, p0, Lorg/fourthline/cling/support/model/PositionInfo;->track:Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

    .line 198
    const-string v0, "00:00:00"

    iput-object v0, p0, Lorg/fourthline/cling/support/model/PositionInfo;->trackDuration:Ljava/lang/String;

    .line 199
    const-string v1, "NOT_IMPLEMENTED"

    iput-object v1, p0, Lorg/fourthline/cling/support/model/PositionInfo;->trackMetaData:Ljava/lang/String;

    .line 200
    const-string v1, ""

    iput-object v1, p0, Lorg/fourthline/cling/support/model/PositionInfo;->trackURI:Ljava/lang/String;

    .line 201
    iput-object v0, p0, Lorg/fourthline/cling/support/model/PositionInfo;->relTime:Ljava/lang/String;

    .line 202
    iput-object v0, p0, Lorg/fourthline/cling/support/model/PositionInfo;->absTime:Ljava/lang/String;

    const v0, 0x7fffffff

    .line 203
    iput v0, p0, Lorg/fourthline/cling/support/model/PositionInfo;->relCount:I

    .line 204
    iput v0, p0, Lorg/fourthline/cling/support/model/PositionInfo;->absCount:I

    .line 205
    new-instance v0, Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

    invoke-direct {v0, p1, p2}, Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;-><init>(J)V

    iput-object v0, p0, Lorg/fourthline/cling/support/model/PositionInfo;->track:Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

    .line 206
    iput-object p3, p0, Lorg/fourthline/cling/support/model/PositionInfo;->trackDuration:Ljava/lang/String;

    .line 207
    iput-object p4, p0, Lorg/fourthline/cling/support/model/PositionInfo;->trackMetaData:Ljava/lang/String;

    .line 208
    iput-object p5, p0, Lorg/fourthline/cling/support/model/PositionInfo;->trackURI:Ljava/lang/String;

    .line 209
    iput-object p6, p0, Lorg/fourthline/cling/support/model/PositionInfo;->relTime:Ljava/lang/String;

    .line 210
    iput-object p7, p0, Lorg/fourthline/cling/support/model/PositionInfo;->absTime:Ljava/lang/String;

    .line 211
    iput p8, p0, Lorg/fourthline/cling/support/model/PositionInfo;->relCount:I

    .line 212
    iput p9, p0, Lorg/fourthline/cling/support/model/PositionInfo;->absCount:I

    return-void
.end method

.method public constructor <init>(Ljava/util/Map;)V
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lorg/fourthline/cling/model/action/ActionArgumentValue;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "Track"

    .line 2
    .line 3
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lorg/fourthline/cling/model/action/ActionArgumentValue;

    .line 8
    .line 9
    invoke-virtual {v0}, Lorg/fourthline/cling/model/VariableValue;->getValue()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

    .line 14
    .line 15
    invoke-virtual {v0}, Lorg/fourthline/cling/model/types/UnsignedVariableInteger;->getValue()Ljava/lang/Long;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 20
    .line 21
    .line 22
    move-result-wide v2

    .line 23
    const-string v0, "TrackDuration"

    .line 24
    .line 25
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Lorg/fourthline/cling/model/action/ActionArgumentValue;

    .line 30
    .line 31
    invoke-virtual {v0}, Lorg/fourthline/cling/model/VariableValue;->getValue()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    move-object v4, v0

    .line 36
    check-cast v4, Ljava/lang/String;

    .line 37
    .line 38
    const-string v0, "TrackMetaData"

    .line 39
    .line 40
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    check-cast v0, Lorg/fourthline/cling/model/action/ActionArgumentValue;

    .line 45
    .line 46
    invoke-virtual {v0}, Lorg/fourthline/cling/model/VariableValue;->getValue()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    move-object v5, v0

    .line 51
    check-cast v5, Ljava/lang/String;

    .line 52
    .line 53
    const-string v0, "TrackURI"

    .line 54
    .line 55
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    check-cast v0, Lorg/fourthline/cling/model/action/ActionArgumentValue;

    .line 60
    .line 61
    invoke-virtual {v0}, Lorg/fourthline/cling/model/VariableValue;->getValue()Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    move-object v6, v0

    .line 66
    check-cast v6, Ljava/lang/String;

    .line 67
    .line 68
    const-string v0, "RelTime"

    .line 69
    .line 70
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    check-cast v0, Lorg/fourthline/cling/model/action/ActionArgumentValue;

    .line 75
    .line 76
    invoke-virtual {v0}, Lorg/fourthline/cling/model/VariableValue;->getValue()Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    move-object v7, v0

    .line 81
    check-cast v7, Ljava/lang/String;

    .line 82
    .line 83
    const-string v0, "AbsTime"

    .line 84
    .line 85
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    check-cast v0, Lorg/fourthline/cling/model/action/ActionArgumentValue;

    .line 90
    .line 91
    invoke-virtual {v0}, Lorg/fourthline/cling/model/VariableValue;->getValue()Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    move-object v8, v0

    .line 96
    check-cast v8, Ljava/lang/String;

    .line 97
    .line 98
    const-string v0, "RelCount"

    .line 99
    .line 100
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    check-cast v0, Lorg/fourthline/cling/model/action/ActionArgumentValue;

    .line 105
    .line 106
    invoke-virtual {v0}, Lorg/fourthline/cling/model/VariableValue;->getValue()Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    check-cast v0, Ljava/lang/Integer;

    .line 111
    .line 112
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 113
    .line 114
    .line 115
    move-result v9

    .line 116
    const-string v0, "AbsCount"

    .line 117
    .line 118
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    check-cast p1, Lorg/fourthline/cling/model/action/ActionArgumentValue;

    .line 123
    .line 124
    invoke-virtual {p1}, Lorg/fourthline/cling/model/VariableValue;->getValue()Ljava/lang/Object;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    check-cast p1, Ljava/lang/Integer;

    .line 129
    .line 130
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 131
    .line 132
    .line 133
    move-result v10

    .line 134
    move-object v1, p0

    .line 135
    invoke-direct/range {v1 .. v10}, Lorg/fourthline/cling/support/model/PositionInfo;-><init>(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;II)V

    .line 136
    .line 137
    .line 138
    return-void
.end method

.method public constructor <init>(Lorg/fourthline/cling/support/model/PositionInfo;JJ)V
    .locals 3

    .line 165
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 166
    new-instance v0, Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

    const-wide/16 v1, 0x0

    invoke-direct {v0, v1, v2}, Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;-><init>(J)V

    iput-object v0, p0, Lorg/fourthline/cling/support/model/PositionInfo;->track:Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

    .line 167
    const-string v0, "00:00:00"

    iput-object v0, p0, Lorg/fourthline/cling/support/model/PositionInfo;->trackDuration:Ljava/lang/String;

    .line 168
    const-string v1, "NOT_IMPLEMENTED"

    iput-object v1, p0, Lorg/fourthline/cling/support/model/PositionInfo;->trackMetaData:Ljava/lang/String;

    .line 169
    const-string v1, ""

    iput-object v1, p0, Lorg/fourthline/cling/support/model/PositionInfo;->trackURI:Ljava/lang/String;

    .line 170
    iput-object v0, p0, Lorg/fourthline/cling/support/model/PositionInfo;->relTime:Ljava/lang/String;

    .line 171
    iput-object v0, p0, Lorg/fourthline/cling/support/model/PositionInfo;->absTime:Ljava/lang/String;

    const v0, 0x7fffffff

    .line 172
    iput v0, p0, Lorg/fourthline/cling/support/model/PositionInfo;->relCount:I

    .line 173
    iput v0, p0, Lorg/fourthline/cling/support/model/PositionInfo;->absCount:I

    .line 174
    iget-object v0, p1, Lorg/fourthline/cling/support/model/PositionInfo;->track:Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

    iput-object v0, p0, Lorg/fourthline/cling/support/model/PositionInfo;->track:Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

    .line 175
    iget-object v0, p1, Lorg/fourthline/cling/support/model/PositionInfo;->trackDuration:Ljava/lang/String;

    iput-object v0, p0, Lorg/fourthline/cling/support/model/PositionInfo;->trackDuration:Ljava/lang/String;

    .line 176
    iget-object v0, p1, Lorg/fourthline/cling/support/model/PositionInfo;->trackMetaData:Ljava/lang/String;

    iput-object v0, p0, Lorg/fourthline/cling/support/model/PositionInfo;->trackMetaData:Ljava/lang/String;

    .line 177
    iget-object v0, p1, Lorg/fourthline/cling/support/model/PositionInfo;->trackURI:Ljava/lang/String;

    iput-object v0, p0, Lorg/fourthline/cling/support/model/PositionInfo;->trackURI:Ljava/lang/String;

    .line 178
    invoke-static {p2, p3}, Lorg/fourthline/cling/model/ModelUtil;->toTimeString(J)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lorg/fourthline/cling/support/model/PositionInfo;->relTime:Ljava/lang/String;

    .line 179
    invoke-static {p4, p5}, Lorg/fourthline/cling/model/ModelUtil;->toTimeString(J)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lorg/fourthline/cling/support/model/PositionInfo;->absTime:Ljava/lang/String;

    .line 180
    iget p2, p1, Lorg/fourthline/cling/support/model/PositionInfo;->relCount:I

    iput p2, p0, Lorg/fourthline/cling/support/model/PositionInfo;->relCount:I

    .line 181
    iget p1, p1, Lorg/fourthline/cling/support/model/PositionInfo;->absCount:I

    iput p1, p0, Lorg/fourthline/cling/support/model/PositionInfo;->absCount:I

    return-void
.end method

.method public constructor <init>(Lorg/fourthline/cling/support/model/PositionInfo;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 148
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 149
    new-instance v0, Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

    const-wide/16 v1, 0x0

    invoke-direct {v0, v1, v2}, Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;-><init>(J)V

    iput-object v0, p0, Lorg/fourthline/cling/support/model/PositionInfo;->track:Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

    .line 150
    const-string v0, "00:00:00"

    iput-object v0, p0, Lorg/fourthline/cling/support/model/PositionInfo;->trackDuration:Ljava/lang/String;

    .line 151
    const-string v1, "NOT_IMPLEMENTED"

    iput-object v1, p0, Lorg/fourthline/cling/support/model/PositionInfo;->trackMetaData:Ljava/lang/String;

    .line 152
    const-string v1, ""

    iput-object v1, p0, Lorg/fourthline/cling/support/model/PositionInfo;->trackURI:Ljava/lang/String;

    .line 153
    iput-object v0, p0, Lorg/fourthline/cling/support/model/PositionInfo;->relTime:Ljava/lang/String;

    .line 154
    iput-object v0, p0, Lorg/fourthline/cling/support/model/PositionInfo;->absTime:Ljava/lang/String;

    const v0, 0x7fffffff

    .line 155
    iput v0, p0, Lorg/fourthline/cling/support/model/PositionInfo;->relCount:I

    .line 156
    iput v0, p0, Lorg/fourthline/cling/support/model/PositionInfo;->absCount:I

    .line 157
    iget-object v0, p1, Lorg/fourthline/cling/support/model/PositionInfo;->track:Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

    iput-object v0, p0, Lorg/fourthline/cling/support/model/PositionInfo;->track:Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

    .line 158
    iget-object v0, p1, Lorg/fourthline/cling/support/model/PositionInfo;->trackDuration:Ljava/lang/String;

    iput-object v0, p0, Lorg/fourthline/cling/support/model/PositionInfo;->trackDuration:Ljava/lang/String;

    .line 159
    iget-object v0, p1, Lorg/fourthline/cling/support/model/PositionInfo;->trackMetaData:Ljava/lang/String;

    iput-object v0, p0, Lorg/fourthline/cling/support/model/PositionInfo;->trackMetaData:Ljava/lang/String;

    .line 160
    iget-object v0, p1, Lorg/fourthline/cling/support/model/PositionInfo;->trackURI:Ljava/lang/String;

    iput-object v0, p0, Lorg/fourthline/cling/support/model/PositionInfo;->trackURI:Ljava/lang/String;

    .line 161
    iput-object p2, p0, Lorg/fourthline/cling/support/model/PositionInfo;->relTime:Ljava/lang/String;

    .line 162
    iput-object p3, p0, Lorg/fourthline/cling/support/model/PositionInfo;->absTime:Ljava/lang/String;

    .line 163
    iget p2, p1, Lorg/fourthline/cling/support/model/PositionInfo;->relCount:I

    iput p2, p0, Lorg/fourthline/cling/support/model/PositionInfo;->relCount:I

    .line 164
    iget p1, p1, Lorg/fourthline/cling/support/model/PositionInfo;->absCount:I

    iput p1, p0, Lorg/fourthline/cling/support/model/PositionInfo;->absCount:I

    return-void
.end method


# virtual methods
.method public getAbsCount()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/fourthline/cling/support/model/PositionInfo;->absCount:I

    .line 2
    .line 3
    return p0
.end method

.method public getAbsTime()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/PositionInfo;->absTime:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getElapsedPercent()I
    .locals 6

    .line 1
    invoke-virtual {p0}, Lorg/fourthline/cling/support/model/PositionInfo;->getTrackElapsedSeconds()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-virtual {p0}, Lorg/fourthline/cling/support/model/PositionInfo;->getTrackDurationSeconds()J

    .line 6
    .line 7
    .line 8
    move-result-wide v2

    .line 9
    const-wide/16 v4, 0x0

    .line 10
    .line 11
    cmp-long p0, v0, v4

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    cmp-long p0, v2, v4

    .line 16
    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance p0, Ljava/lang/Double;

    .line 21
    .line 22
    long-to-double v0, v0

    .line 23
    long-to-double v2, v2

    .line 24
    const-wide/high16 v4, 0x4059000000000000L    # 100.0

    .line 25
    .line 26
    div-double/2addr v2, v4

    .line 27
    div-double/2addr v0, v2

    .line 28
    invoke-direct {p0, v0, v1}, Ljava/lang/Double;-><init>(D)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Ljava/lang/Double;->intValue()I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    return p0

    .line 36
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 37
    return p0
.end method

.method public getRelCount()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/fourthline/cling/support/model/PositionInfo;->relCount:I

    .line 2
    .line 3
    return p0
.end method

.method public getRelTime()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/PositionInfo;->relTime:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTrack()Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/PositionInfo;->track:Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTrackDuration()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/PositionInfo;->trackDuration:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTrackDurationSeconds()J
    .locals 2

    .line 1
    invoke-virtual {p0}, Lorg/fourthline/cling/support/model/PositionInfo;->getTrackDuration()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-wide/16 v0, 0x0

    .line 8
    .line 9
    return-wide v0

    .line 10
    :cond_0
    invoke-virtual {p0}, Lorg/fourthline/cling/support/model/PositionInfo;->getTrackDuration()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-static {p0}, Lorg/fourthline/cling/model/ModelUtil;->fromTimeString(Ljava/lang/String;)J

    .line 15
    .line 16
    .line 17
    move-result-wide v0

    .line 18
    return-wide v0
.end method

.method public getTrackElapsedSeconds()J
    .locals 2

    .line 1
    invoke-virtual {p0}, Lorg/fourthline/cling/support/model/PositionInfo;->getRelTime()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Lorg/fourthline/cling/support/model/PositionInfo;->getRelTime()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "NOT_IMPLEMENTED"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-virtual {p0}, Lorg/fourthline/cling/support/model/PositionInfo;->getRelTime()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-static {p0}, Lorg/fourthline/cling/model/ModelUtil;->fromTimeString(Ljava/lang/String;)J

    .line 25
    .line 26
    .line 27
    move-result-wide v0

    .line 28
    return-wide v0

    .line 29
    :cond_1
    :goto_0
    const-wide/16 v0, 0x0

    .line 30
    .line 31
    return-wide v0
.end method

.method public getTrackMetaData()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/PositionInfo;->trackMetaData:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTrackRemainingSeconds()J
    .locals 4

    .line 1
    invoke-virtual {p0}, Lorg/fourthline/cling/support/model/PositionInfo;->getTrackDurationSeconds()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-virtual {p0}, Lorg/fourthline/cling/support/model/PositionInfo;->getTrackElapsedSeconds()J

    .line 6
    .line 7
    .line 8
    move-result-wide v2

    .line 9
    sub-long/2addr v0, v2

    .line 10
    return-wide v0
.end method

.method public getTrackURI()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/PositionInfo;->trackURI:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setRelTime(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/fourthline/cling/support/model/PositionInfo;->relTime:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setTrackDuration(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/fourthline/cling/support/model/PositionInfo;->trackDuration:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "(PositionInfo) Track: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lorg/fourthline/cling/support/model/PositionInfo;->getTrack()Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v1, " RelTime: "

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Lorg/fourthline/cling/support/model/PositionInfo;->getRelTime()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string v1, " Duration: "

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Lorg/fourthline/cling/support/model/PositionInfo;->getTrackDuration()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    const-string v1, " Percent: "

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Lorg/fourthline/cling/support/model/PositionInfo;->getElapsedPercent()I

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    return-object p0
.end method
