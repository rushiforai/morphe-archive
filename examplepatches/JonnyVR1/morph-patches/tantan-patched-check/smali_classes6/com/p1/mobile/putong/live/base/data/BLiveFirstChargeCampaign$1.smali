.class Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign$1;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;",
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
    const-class p0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign$1;->newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;",
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
    const-string p0, "position"

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
    const/4 v2, 0x7

    .line 26
    goto :goto_0

    .line 27
    :sswitch_1
    const-string p0, "hasConsumedGift"

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
    const/4 v2, 0x6

    .line 37
    goto :goto_0

    .line 38
    :sswitch_2
    const-string p0, "isCoinRecharged"

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
    const/4 v2, 0x5

    .line 48
    goto :goto_0

    .line 49
    :sswitch_3
    const-string p0, "activityArray"

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
    const/4 v2, 0x4

    .line 59
    goto :goto_0

    .line 60
    :sswitch_4
    const-string p0, "firstChargeStatus"

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
    const/4 v2, 0x3

    .line 70
    goto :goto_0

    .line 71
    :sswitch_5
    const-string p0, "detailUrl"

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
    const/4 v2, 0x2

    .line 81
    goto :goto_0

    .line 82
    :sswitch_6
    const-string p0, "detailInset"

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
    move v2, v1

    .line 92
    goto :goto_0

    .line 93
    :sswitch_7
    const-string p0, "firstEnterLiveRoomTime"

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
    move v2, v0

    .line 103
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 104
    .line 105
    .line 106
    return v0

    .line 107
    :pswitch_0
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 108
    .line 109
    .line 110
    move-result p0

    .line 111
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;->position:I

    .line 112
    .line 113
    return v1

    .line 114
    :pswitch_1
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 115
    .line 116
    .line 117
    move-result p0

    .line 118
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;->hasConsumedGift:Z

    .line 119
    .line 120
    return v1

    .line 121
    :pswitch_2
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 122
    .line 123
    .line 124
    move-result p0

    .line 125
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;->isCoinRecharged:Z

    .line 126
    .line 127
    return v1

    .line 128
    :pswitch_3
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeActivity;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 129
    .line 130
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;->activityArray:Ljava/util/List;

    .line 135
    .line 136
    return v1

    .line 137
    :pswitch_4
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 138
    .line 139
    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeStatus;

    .line 144
    .line 145
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;->firstChargeStatus:Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeStatus;

    .line 146
    .line 147
    return v1

    .line 148
    :pswitch_5
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object p0

    .line 152
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;->detailUrl:Ljava/lang/String;

    .line 153
    .line 154
    return v1

    .line 155
    :pswitch_6
    sget-object p0, Lcom/tantanapp/common/data/JsonAdapter;->DOUBLE_BOXED_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 156
    .line 157
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 158
    .line 159
    .line 160
    move-result-object p0

    .line 161
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;->detailInset:Ljava/util/List;

    .line 162
    .line 163
    return v1

    .line 164
    :pswitch_7
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 165
    .line 166
    .line 167
    move-result-wide p2

    .line 168
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;->firstEnterLiveRoomTime:J

    .line 169
    .line 170
    return v1

    .line 171
    :sswitch_data_0
    .sparse-switch
        -0x7e9f3a84 -> :sswitch_7
        -0x7b6a1cb4 -> :sswitch_6
        -0x759af8a2 -> :sswitch_5
        -0x7472596a -> :sswitch_4
        -0x3f69df76 -> :sswitch_3
        -0x3ce30dfe -> :sswitch_2
        0x11e9fcf2 -> :sswitch_1
        0x2c929929 -> :sswitch_0
    .end sparse-switch

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

    .line 171
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign$1;->parseField(Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const-string p0, "isCoinRecharged"

    .line 2
    .line 3
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;->isCoinRecharged:Z

    .line 4
    .line 5
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 6
    .line 7
    .line 8
    const-string p0, "firstEnterLiveRoomTime"

    .line 9
    .line 10
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;->firstEnterLiveRoomTime:J

    .line 11
    .line 12
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;->firstChargeStatus:Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeStatus;

    .line 16
    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    const-string p0, "firstChargeStatus"

    .line 20
    .line 21
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 25
    .line 26
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;->firstChargeStatus:Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeStatus;

    .line 27
    .line 28
    const/4 v1, 0x1

    .line 29
    invoke-virtual {p0, v0, p2, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->serialize(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 30
    .line 31
    .line 32
    :cond_0
    const-string p0, "position"

    .line 33
    .line 34
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;->position:I

    .line 35
    .line 36
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 37
    .line 38
    .line 39
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;->detailUrl:Ljava/lang/String;

    .line 40
    .line 41
    if-eqz p0, :cond_1

    .line 42
    .line 43
    const-string v0, "detailUrl"

    .line 44
    .line 45
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;->detailInset:Ljava/util/List;

    .line 49
    .line 50
    if-eqz p0, :cond_2

    .line 51
    .line 52
    const-string p0, "detailInset"

    .line 53
    .line 54
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;->detailInset:Ljava/util/List;

    .line 58
    .line 59
    sget-object v0, Lcom/tantanapp/common/data/JsonAdapter;->DOUBLE_BOXED_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 60
    .line 61
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 62
    .line 63
    .line 64
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;->activityArray:Ljava/util/List;

    .line 65
    .line 66
    if-eqz p0, :cond_3

    .line 67
    .line 68
    const-string p0, "activityArray"

    .line 69
    .line 70
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;->activityArray:Ljava/util/List;

    .line 74
    .line 75
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeActivity;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 76
    .line 77
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 78
    .line 79
    .line 80
    :cond_3
    const-string p0, "hasConsumedGift"

    .line 81
    .line 82
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;->hasConsumedGift:Z

    .line 83
    .line 84
    invoke-virtual {p2, p0, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 85
    .line 86
    .line 87
    return-void
.end method

.method public bridge synthetic serializeFields(Lcom/tantanapp/common/data/ValueObject;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 88
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign$1;->serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
