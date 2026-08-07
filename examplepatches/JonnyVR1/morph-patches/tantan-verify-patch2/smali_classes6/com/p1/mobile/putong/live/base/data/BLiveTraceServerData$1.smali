.class Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData$1;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;",
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
    const-class p0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData$1;->newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;",
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
    const-string p0, "location"

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
    const-string p0, "index"

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
    const-string p0, "enterSource"

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
    const-string p0, "type"

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
    const-string p0, "biz"

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
    const-string p0, "giftBarTab"

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
    const-string p0, "giftBarPageId"

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
    const-string p0, "givenSource"

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
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->location:Ljava/lang/String;

    .line 112
    .line 113
    return p6

    .line 114
    :pswitch_1
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 115
    .line 116
    .line 117
    move-result-wide p2

    .line 118
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->index:J

    .line 119
    .line 120
    return p6

    .line 121
    :pswitch_2
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->enterSource:Ljava/lang/String;

    .line 126
    .line 127
    return p6

    .line 128
    :pswitch_3
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 129
    .line 130
    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerType;

    .line 135
    .line 136
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->type:Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerType;

    .line 137
    .line 138
    return p6

    .line 139
    :pswitch_4
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->biz:Ljava/lang/String;

    .line 144
    .line 145
    return p6

    .line 146
    :pswitch_5
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object p0

    .line 150
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->giftBarTab:Ljava/lang/String;

    .line 151
    .line 152
    return p6

    .line 153
    :pswitch_6
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 154
    .line 155
    .line 156
    move-result-wide p2

    .line 157
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->giftBarPageId:J

    .line 158
    .line 159
    return p6

    .line 160
    :pswitch_7
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object p0

    .line 164
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->givenSource:Ljava/lang/String;

    .line 165
    .line 166
    return p6

    .line 167
    :sswitch_data_0
    .sparse-switch
        -0x43980608 -> :sswitch_7
        -0x2a7d2153 -> :sswitch_6
        -0x142b602e -> :sswitch_5
        0x17d13 -> :sswitch_4
        0x368f3a -> :sswitch_3
        0x31dd913 -> :sswitch_2
        0x5fb28d2 -> :sswitch_1
        0x714f9fb5 -> :sswitch_0
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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData$1;->parseField(Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->type:Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerType;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const-string p0, "type"

    .line 6
    .line 7
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 11
    .line 12
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->type:Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerType;

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    invoke-virtual {p0, v0, p2, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->serialize(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->location:Ljava/lang/String;

    .line 19
    .line 20
    if-eqz p0, :cond_1

    .line 21
    .line 22
    const-string v0, "location"

    .line 23
    .line 24
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->biz:Ljava/lang/String;

    .line 28
    .line 29
    if-eqz p0, :cond_2

    .line 30
    .line 31
    const-string v0, "biz"

    .line 32
    .line 33
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->giftBarTab:Ljava/lang/String;

    .line 37
    .line 38
    if-eqz p0, :cond_3

    .line 39
    .line 40
    const-string v0, "giftBarTab"

    .line 41
    .line 42
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    :cond_3
    const-string p0, "giftBarPageId"

    .line 46
    .line 47
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->giftBarPageId:J

    .line 48
    .line 49
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 50
    .line 51
    .line 52
    const-string p0, "index"

    .line 53
    .line 54
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->index:J

    .line 55
    .line 56
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 57
    .line 58
    .line 59
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->enterSource:Ljava/lang/String;

    .line 60
    .line 61
    if-eqz p0, :cond_4

    .line 62
    .line 63
    const-string v0, "enterSource"

    .line 64
    .line 65
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->givenSource:Ljava/lang/String;

    .line 69
    .line 70
    if-eqz p0, :cond_5

    .line 71
    .line 72
    const-string p1, "givenSource"

    .line 73
    .line 74
    invoke-virtual {p2, p1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    :cond_5
    return-void
.end method

.method public bridge synthetic serializeFields(Lcom/tantanapp/common/data/ValueObject;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 78
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData$1;->serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
