.class Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallSummary$1;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallSummary;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallSummary;",
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
    const-class p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallSummary;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallSummary;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallSummary;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallSummary;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallSummary$1;->newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallSummary;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallSummary;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallSummary;",
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
    const/4 v0, 0x0

    .line 9
    const/4 v1, 0x1

    .line 10
    const/4 v2, -0x1

    .line 11
    sparse-switch p0, :sswitch_data_0

    .line 12
    .line 13
    .line 14
    goto/16 :goto_0

    .line 15
    .line 16
    :sswitch_0
    const-string p0, "newFollowCount"

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
    const/16 v2, 0x8

    .line 27
    .line 28
    goto/16 :goto_0

    .line 29
    .line 30
    :sswitch_1
    const-string p0, "bonusGifts"

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
    const/4 v2, 0x7

    .line 40
    goto :goto_0

    .line 41
    :sswitch_2
    const-string p0, "display"

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
    const/4 v2, 0x6

    .line 51
    goto :goto_0

    .line 52
    :sswitch_3
    const-string p0, "rewardPoint"

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
    const/4 v2, 0x5

    .line 62
    goto :goto_0

    .line 63
    :sswitch_4
    const-string p0, "strawberry"

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
    const/4 v2, 0x4

    .line 73
    goto :goto_0

    .line 74
    :sswitch_5
    const-string p0, "type"

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
    const/4 v2, 0x3

    .line 84
    goto :goto_0

    .line 85
    :sswitch_6
    const-string p0, "id"

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
    const/4 v2, 0x2

    .line 95
    goto :goto_0

    .line 96
    :sswitch_7
    const-string p0, "voiceCallId"

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
    move v2, v1

    .line 106
    goto :goto_0

    .line 107
    :sswitch_8
    const-string p0, "duration"

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
    move v2, v0

    .line 117
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 118
    .line 119
    .line 120
    return v0

    .line 121
    :pswitch_0
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 122
    .line 123
    .line 124
    move-result-wide p2

    .line 125
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallSummary;->newFollowCount:J

    .line 126
    .line 127
    return v1

    .line 128
    :pswitch_1
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBonusGifts;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 129
    .line 130
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBonusGifts;

    .line 135
    .line 136
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallSummary;->bonusGifts:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBonusGifts;

    .line 137
    .line 138
    return v1

    .line 139
    :pswitch_2
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 140
    .line 141
    .line 142
    move-result p0

    .line 143
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallSummary;->display:Z

    .line 144
    .line 145
    return v1

    .line 146
    :pswitch_3
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 147
    .line 148
    .line 149
    move-result-wide p2

    .line 150
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallSummary;->rewardPoint:J

    .line 151
    .line 152
    return v1

    .line 153
    :pswitch_4
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 154
    .line 155
    .line 156
    move-result-wide p2

    .line 157
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallSummary;->strawberry:J

    .line 158
    .line 159
    return v1

    .line 160
    :pswitch_5
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object p0

    .line 164
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallSummary;->type:Ljava/lang/String;

    .line 165
    .line 166
    return v1

    .line 167
    :pswitch_6
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object p0

    .line 171
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallSummary;->id:Ljava/lang/String;

    .line 172
    .line 173
    return v0

    .line 174
    :pswitch_7
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object p0

    .line 178
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallSummary;->voiceCallId:Ljava/lang/String;

    .line 179
    .line 180
    return v1

    .line 181
    :pswitch_8
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 182
    .line 183
    .line 184
    move-result-wide p2

    .line 185
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallSummary;->duration:J

    .line 186
    .line 187
    return v1

    .line 188
    nop

    .line 189
    :sswitch_data_0
    .sparse-switch
        -0x76bbb26c -> :sswitch_8
        -0x1fe3fc15 -> :sswitch_7
        0xd1b -> :sswitch_6
        0x368f3a -> :sswitch_5
        0xa27e14f -> :sswitch_4
        0x34b93ba1 -> :sswitch_3
        0x63a518c2 -> :sswitch_2
        0x661ae864 -> :sswitch_1
        0x7b99861e -> :sswitch_0
    .end sparse-switch

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

    .line 189
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallSummary;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallSummary$1;->parseField(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallSummary;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallSummary;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallSummary;->id:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const-string v0, "id"

    .line 6
    .line 7
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallSummary;->type:Ljava/lang/String;

    .line 11
    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    const-string v0, "type"

    .line 15
    .line 16
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallSummary;->voiceCallId:Ljava/lang/String;

    .line 20
    .line 21
    if-eqz p0, :cond_2

    .line 22
    .line 23
    const-string v0, "voiceCallId"

    .line 24
    .line 25
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    :cond_2
    const-string p0, "newFollowCount"

    .line 29
    .line 30
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallSummary;->newFollowCount:J

    .line 31
    .line 32
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 33
    .line 34
    .line 35
    const-string p0, "rewardPoint"

    .line 36
    .line 37
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallSummary;->rewardPoint:J

    .line 38
    .line 39
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 40
    .line 41
    .line 42
    const-string p0, "duration"

    .line 43
    .line 44
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallSummary;->duration:J

    .line 45
    .line 46
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 47
    .line 48
    .line 49
    const-string p0, "strawberry"

    .line 50
    .line 51
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallSummary;->strawberry:J

    .line 52
    .line 53
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 54
    .line 55
    .line 56
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallSummary;->bonusGifts:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBonusGifts;

    .line 57
    .line 58
    if-eqz p0, :cond_3

    .line 59
    .line 60
    const-string p0, "bonusGifts"

    .line 61
    .line 62
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBonusGifts;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 66
    .line 67
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallSummary;->bonusGifts:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBonusGifts;

    .line 68
    .line 69
    const/4 v1, 0x1

    .line 70
    invoke-virtual {p0, v0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 71
    .line 72
    .line 73
    :cond_3
    const-string p0, "display"

    .line 74
    .line 75
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallSummary;->display:Z

    .line 76
    .line 77
    invoke-virtual {p2, p0, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method public bridge synthetic serializeFields(Lcom/tantanapp/common/data/ValueObject;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 81
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallSummary;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallSummary$1;->serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallSummary;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
