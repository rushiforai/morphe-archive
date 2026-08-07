.class Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary$1;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getDataClass()Ljava/lang/Class;
    .locals 0

    .line 1
    const-class p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary$1;->newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;",
            "Ljava/lang/String;",
            "Lcom/fasterxml/jackson/core/JsonParser;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Lcom/tantanapp/common/data/BaseData;",
            ">;",
            "Lcom/tantanapp/common/data/DataChecker;",
            ")Z"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    const/4 p5, 0x0

    .line 9
    const/4 p6, 0x1

    .line 10
    const/4 v0, -0x1

    .line 11
    sparse-switch p0, :sswitch_data_0

    .line 12
    .line 13
    .line 14
    goto/16 :goto_0

    .line 15
    .line 16
    :sswitch_0
    const-string p0, "guardScoreIncrement"

    .line 17
    .line 18
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-nez p0, :cond_0

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const/4 v0, 0x7

    .line 26
    goto :goto_0

    .line 27
    :sswitch_1
    const-string p0, "guardType"

    .line 28
    .line 29
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-nez p0, :cond_1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    const/4 v0, 0x6

    .line 37
    goto :goto_0

    .line 38
    :sswitch_2
    const-string p0, "isKnight"

    .line 39
    .line 40
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    if-nez p0, :cond_2

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_2
    const/4 v0, 0x5

    .line 48
    goto :goto_0

    .line 49
    :sswitch_3
    const-string p0, "createdTime"

    .line 50
    .line 51
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    if-nez p0, :cond_3

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_3
    const/4 v0, 0x4

    .line 59
    goto :goto_0

    .line 60
    :sswitch_4
    const-string p0, "isInRoom"

    .line 61
    .line 62
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    if-nez p0, :cond_4

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_4
    const/4 v0, 0x3

    .line 70
    goto :goto_0

    .line 71
    :sswitch_5
    const-string p0, "expireTime"

    .line 72
    .line 73
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result p0

    .line 77
    if-nez p0, :cond_5

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_5
    const/4 v0, 0x2

    .line 81
    goto :goto_0

    .line 82
    :sswitch_6
    const-string p0, "userId"

    .line 83
    .line 84
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    move-result p0

    .line 88
    if-nez p0, :cond_6

    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_6
    move v0, p6

    .line 92
    goto :goto_0

    .line 93
    :sswitch_7
    const-string p0, "sessionSendCoins"

    .line 94
    .line 95
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    move-result p0

    .line 99
    if-nez p0, :cond_7

    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_7
    move v0, p5

    .line 103
    :goto_0
    packed-switch v0, :pswitch_data_0

    .line 104
    .line 105
    .line 106
    return p5

    .line 107
    :pswitch_0
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 108
    .line 109
    .line 110
    move-result-wide p2

    .line 111
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->guardScoreIncrement:J

    .line 112
    .line 113
    return p6

    .line 114
    :pswitch_1
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 115
    .line 116
    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;

    .line 121
    .line 122
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->guardType:Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;

    .line 123
    .line 124
    return p6

    .line 125
    :pswitch_2
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 126
    .line 127
    .line 128
    move-result p0

    .line 129
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->isKnight:Z

    .line 130
    .line 131
    return p6

    .line 132
    :pswitch_3
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 133
    .line 134
    .line 135
    move-result-wide p2

    .line 136
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->createdTime:J

    .line 137
    .line 138
    return p6

    .line 139
    :pswitch_4
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 140
    .line 141
    .line 142
    move-result p0

    .line 143
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->isInRoom:Z

    .line 144
    .line 145
    return p6

    .line 146
    :pswitch_5
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 147
    .line 148
    .line 149
    move-result-wide p2

    .line 150
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->expireTime:J

    .line 151
    .line 152
    return p6

    .line 153
    :pswitch_6
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object p0

    .line 157
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->userId:Ljava/lang/String;

    .line 158
    .line 159
    return p6

    .line 160
    :pswitch_7
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 161
    .line 162
    .line 163
    move-result p0

    .line 164
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->sessionSendCoins:I

    .line 165
    .line 166
    return p6

    .line 167
    :sswitch_data_0
    .sparse-switch
        -0x7659009c -> :sswitch_7
        -0x31d4d1ba -> :sswitch_6
        -0x31c0e374 -> :sswitch_5
        -0x1e712696 -> :sswitch_4
        -0x1d336e2b -> :sswitch_3
        -0x1afd1fa9 -> :sswitch_2
        -0xb1fb881 -> :sswitch_1
        0x57459702 -> :sswitch_0
    .end sparse-switch

    .line 168
    .line 169
    .line 170
    .line 171
    .line 172
    .line 173
    .line 174
    .line 175
    .line 176
    .line 177
    .line 178
    .line 179
    .line 180
    .line 181
    .line 182
    .line 183
    .line 184
    .line 185
    .line 186
    .line 187
    .line 188
    .line 189
    .line 190
    .line 191
    .line 192
    .line 193
    .line 194
    .line 195
    .line 196
    .line 197
    .line 198
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public bridge synthetic parseField(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 167
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary$1;->parseField(Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const-string p0, "isKnight"

    .line 2
    .line 3
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->isKnight:Z

    .line 4
    .line 5
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 6
    .line 7
    .line 8
    const-string p0, "createdTime"

    .line 9
    .line 10
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->createdTime:J

    .line 11
    .line 12
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 13
    .line 14
    .line 15
    const-string p0, "expireTime"

    .line 16
    .line 17
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->expireTime:J

    .line 18
    .line 19
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->userId:Ljava/lang/String;

    .line 23
    .line 24
    if-eqz p0, :cond_0

    .line 25
    .line 26
    const-string v0, "userId"

    .line 27
    .line 28
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    :cond_0
    const-string p0, "sessionSendCoins"

    .line 32
    .line 33
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->sessionSendCoins:I

    .line 34
    .line 35
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->guardType:Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;

    .line 39
    .line 40
    if-eqz p0, :cond_1

    .line 41
    .line 42
    const-string p0, "guardType"

    .line 43
    .line 44
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 48
    .line 49
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->guardType:Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;

    .line 50
    .line 51
    const/4 v1, 0x1

    .line 52
    invoke-virtual {p0, v0, p2, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->serialize(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 53
    .line 54
    .line 55
    :cond_1
    const-string p0, "isInRoom"

    .line 56
    .line 57
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->isInRoom:Z

    .line 58
    .line 59
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 60
    .line 61
    .line 62
    const-string p0, "guardScoreIncrement"

    .line 63
    .line 64
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->guardScoreIncrement:J

    .line 65
    .line 66
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public bridge synthetic serializeFields(Lcom/tantanapp/common/data/ValueObject;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 70
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary$1;->serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
