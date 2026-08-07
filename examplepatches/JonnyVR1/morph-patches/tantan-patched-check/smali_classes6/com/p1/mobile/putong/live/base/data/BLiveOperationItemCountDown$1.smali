.class Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown$1;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;",
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
    const-class p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown$1;->newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;",
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
    const-string p0, "actionType"

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
    goto/16 :goto_0

    .line 25
    .line 26
    :cond_0
    const/16 v0, 0x8

    .line 27
    .line 28
    goto/16 :goto_0

    .line 29
    .line 30
    :sswitch_1
    const-string p0, "currentTime"

    .line 31
    .line 32
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    if-nez p0, :cond_1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    const/4 v0, 0x7

    .line 40
    goto :goto_0

    .line 41
    :sswitch_2
    const-string p0, "actionAfterCountdown"

    .line 42
    .line 43
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    if-nez p0, :cond_2

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_2
    const/4 v0, 0x6

    .line 51
    goto :goto_0

    .line 52
    :sswitch_3
    const-string p0, "type"

    .line 53
    .line 54
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    if-nez p0, :cond_3

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_3
    const/4 v0, 0x5

    .line 62
    goto :goto_0

    .line 63
    :sswitch_4
    const-string p0, "jumpScheme"

    .line 64
    .line 65
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    if-nez p0, :cond_4

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_4
    const/4 v0, 0x4

    .line 73
    goto :goto_0

    .line 74
    :sswitch_5
    const-string p0, "endTime"

    .line 75
    .line 76
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    move-result p0

    .line 80
    if-nez p0, :cond_5

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_5
    const/4 v0, 0x3

    .line 84
    goto :goto_0

    .line 85
    :sswitch_6
    const-string p0, "endText"

    .line 86
    .line 87
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result p0

    .line 91
    if-nez p0, :cond_6

    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_6
    const/4 v0, 0x2

    .line 95
    goto :goto_0

    .line 96
    :sswitch_7
    const-string p0, "randomDelaySeconds"

    .line 97
    .line 98
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    move-result p0

    .line 102
    if-nez p0, :cond_7

    .line 103
    .line 104
    goto :goto_0

    .line 105
    :cond_7
    move v0, p6

    .line 106
    goto :goto_0

    .line 107
    :sswitch_8
    const-string p0, "startTime"

    .line 108
    .line 109
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    move-result p0

    .line 113
    if-nez p0, :cond_8

    .line 114
    .line 115
    goto :goto_0

    .line 116
    :cond_8
    move v0, p5

    .line 117
    :goto_0
    packed-switch v0, :pswitch_data_0

    .line 118
    .line 119
    .line 120
    return p5

    .line 121
    :pswitch_0
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->actionType:Ljava/lang/String;

    .line 126
    .line 127
    return p6

    .line 128
    :pswitch_1
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 129
    .line 130
    .line 131
    move-result-wide p2

    .line 132
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->currentTime:J

    .line 133
    .line 134
    return p6

    .line 135
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationActionAfterCountdown;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 136
    .line 137
    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationActionAfterCountdown;

    .line 142
    .line 143
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->actionAfterCountdown:Lcom/p1/mobile/putong/live/base/data/BLiveOperationActionAfterCountdown;

    .line 144
    .line 145
    return p6

    .line 146
    :pswitch_3
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationCountDownType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 147
    .line 148
    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    .line 149
    .line 150
    .line 151
    move-result-object p0

    .line 152
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationCountDownType;

    .line 153
    .line 154
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->type:Lcom/p1/mobile/putong/live/base/data/BLiveOperationCountDownType;

    .line 155
    .line 156
    return p6

    .line 157
    :pswitch_4
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object p0

    .line 161
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->jumpScheme:Ljava/lang/String;

    .line 162
    .line 163
    return p6

    .line 164
    :pswitch_5
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 165
    .line 166
    .line 167
    move-result-wide p2

    .line 168
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->endTime:J

    .line 169
    .line 170
    return p6

    .line 171
    :pswitch_6
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object p0

    .line 175
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->endText:Ljava/lang/String;

    .line 176
    .line 177
    return p6

    .line 178
    :pswitch_7
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 179
    .line 180
    .line 181
    move-result-wide p2

    .line 182
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->randomDelaySeconds:J

    .line 183
    .line 184
    return p6

    .line 185
    :pswitch_8
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 186
    .line 187
    .line 188
    move-result-wide p2

    .line 189
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->startTime:J

    .line 190
    .line 191
    return p6

    .line 192
    nop

    .line 193
    :sswitch_data_0
    .sparse-switch
        -0x7eea75b1 -> :sswitch_8
        -0x6aecd421 -> :sswitch_7
        -0x5fcca358 -> :sswitch_6
        -0x5fcc95b8 -> :sswitch_5
        -0x2370448d -> :sswitch_4
        0x368f3a -> :sswitch_3
        0xc817b8b -> :sswitch_2
        0x23d61fe6 -> :sswitch_1
        0x6e617690 -> :sswitch_0
    .end sparse-switch

    .line 194
    .line 195
    .line 196
    .line 197
    .line 198
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_8
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

    .line 193
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown$1;->parseField(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const-string p0, "currentTime"

    .line 2
    .line 3
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->currentTime:J

    .line 4
    .line 5
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 6
    .line 7
    .line 8
    const-string p0, "startTime"

    .line 9
    .line 10
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->startTime:J

    .line 11
    .line 12
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 13
    .line 14
    .line 15
    const-string p0, "endTime"

    .line 16
    .line 17
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->endTime:J

    .line 18
    .line 19
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->endText:Ljava/lang/String;

    .line 23
    .line 24
    if-eqz p0, :cond_0

    .line 25
    .line 26
    const-string v0, "endText"

    .line 27
    .line 28
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->actionAfterCountdown:Lcom/p1/mobile/putong/live/base/data/BLiveOperationActionAfterCountdown;

    .line 32
    .line 33
    const/4 v0, 0x1

    .line 34
    if-eqz p0, :cond_1

    .line 35
    .line 36
    const-string p0, "actionAfterCountdown"

    .line 37
    .line 38
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationActionAfterCountdown;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 42
    .line 43
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->actionAfterCountdown:Lcom/p1/mobile/putong/live/base/data/BLiveOperationActionAfterCountdown;

    .line 44
    .line 45
    invoke-virtual {p0, v1, p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->serialize(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 46
    .line 47
    .line 48
    :cond_1
    const-string p0, "randomDelaySeconds"

    .line 49
    .line 50
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->randomDelaySeconds:J

    .line 51
    .line 52
    invoke-virtual {p2, p0, v1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 53
    .line 54
    .line 55
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->jumpScheme:Ljava/lang/String;

    .line 56
    .line 57
    if-eqz p0, :cond_2

    .line 58
    .line 59
    const-string v1, "jumpScheme"

    .line 60
    .line 61
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->actionType:Ljava/lang/String;

    .line 65
    .line 66
    if-eqz p0, :cond_3

    .line 67
    .line 68
    const-string v1, "actionType"

    .line 69
    .line 70
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->type:Lcom/p1/mobile/putong/live/base/data/BLiveOperationCountDownType;

    .line 74
    .line 75
    if-eqz p0, :cond_4

    .line 76
    .line 77
    const-string p0, "type"

    .line 78
    .line 79
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationCountDownType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 83
    .line 84
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->type:Lcom/p1/mobile/putong/live/base/data/BLiveOperationCountDownType;

    .line 85
    .line 86
    invoke-virtual {p0, p1, p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->serialize(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 87
    .line 88
    .line 89
    :cond_4
    return-void
.end method

.method public bridge synthetic serializeFields(Lcom/tantanapp/common/data/ValueObject;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 90
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown$1;->serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
