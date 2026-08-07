.class Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard$1;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;",
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
    const-class p0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard$1;->newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;",
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
    const-string p0, "relationDetail"

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
    const-string p0, "worth"

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
    const-string p0, "level"

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
    const-string p0, "id"

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
    const-string p0, "userInfo"

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
    const-string p0, "otherUserInfo"

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
    const-string p0, "endTime"

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
    const-string p0, "startTime"

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
    const-string p0, "remainSeconds"

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
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelation;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 122
    .line 123
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelation;

    .line 128
    .line 129
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;->relationDetail:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelation;

    .line 130
    .line 131
    return v1

    .line 132
    :pswitch_1
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 133
    .line 134
    .line 135
    move-result p0

    .line 136
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;->worth:I

    .line 137
    .line 138
    return v1

    .line 139
    :pswitch_2
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 140
    .line 141
    .line 142
    move-result p0

    .line 143
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;->level:I

    .line 144
    .line 145
    return v1

    .line 146
    :pswitch_3
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object p0

    .line 150
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;->id:Ljava/lang/String;

    .line 151
    .line 152
    return v0

    .line 153
    :pswitch_4
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 154
    .line 155
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 156
    .line 157
    .line 158
    move-result-object p0

    .line 159
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;

    .line 160
    .line 161
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;->userInfo:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;

    .line 162
    .line 163
    return v1

    .line 164
    :pswitch_5
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 165
    .line 166
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 167
    .line 168
    .line 169
    move-result-object p0

    .line 170
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;

    .line 171
    .line 172
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;->otherUserInfo:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;

    .line 173
    .line 174
    return v1

    .line 175
    :pswitch_6
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 176
    .line 177
    .line 178
    move-result p0

    .line 179
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;->endTime:I

    .line 180
    .line 181
    return v1

    .line 182
    :pswitch_7
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 183
    .line 184
    .line 185
    move-result p0

    .line 186
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;->startTime:I

    .line 187
    .line 188
    return v1

    .line 189
    :pswitch_8
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 190
    .line 191
    .line 192
    move-result p0

    .line 193
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;->remainSeconds:I

    .line 194
    .line 195
    return v1

    .line 196
    nop

    .line 197
    :sswitch_data_0
    .sparse-switch
        -0x7fe4318d -> :sswitch_8
        -0x7eea75b1 -> :sswitch_7
        -0x5fcc95b8 -> :sswitch_6
        -0x406245b7 -> :sswitch_5
        -0xfe718e7 -> :sswitch_4
        0xd1b -> :sswitch_3
        0x6219b84 -> :sswitch_2
        0x6c11c8e -> :sswitch_1
        0x18c6916d -> :sswitch_0
    .end sparse-switch

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

    .line 197
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard$1;->parseField(Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const-string p0, "level"

    .line 2
    .line 3
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;->level:I

    .line 4
    .line 5
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 6
    .line 7
    .line 8
    const-string p0, "worth"

    .line 9
    .line 10
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;->worth:I

    .line 11
    .line 12
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 13
    .line 14
    .line 15
    const-string p0, "startTime"

    .line 16
    .line 17
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;->startTime:I

    .line 18
    .line 19
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 20
    .line 21
    .line 22
    const-string p0, "endTime"

    .line 23
    .line 24
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;->endTime:I

    .line 25
    .line 26
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    const-string p0, "remainSeconds"

    .line 30
    .line 31
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;->remainSeconds:I

    .line 32
    .line 33
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;->relationDetail:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelation;

    .line 37
    .line 38
    const/4 v0, 0x1

    .line 39
    if-eqz p0, :cond_0

    .line 40
    .line 41
    const-string p0, "relationDetail"

    .line 42
    .line 43
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelation;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 47
    .line 48
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;->relationDetail:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelation;

    .line 49
    .line 50
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 51
    .line 52
    .line 53
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;->userInfo:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;

    .line 54
    .line 55
    if-eqz p0, :cond_1

    .line 56
    .line 57
    const-string p0, "userInfo"

    .line 58
    .line 59
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 63
    .line 64
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;->userInfo:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;

    .line 65
    .line 66
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 67
    .line 68
    .line 69
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;->otherUserInfo:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;

    .line 70
    .line 71
    if-eqz p0, :cond_2

    .line 72
    .line 73
    const-string p0, "otherUserInfo"

    .line 74
    .line 75
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 79
    .line 80
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;->otherUserInfo:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;

    .line 81
    .line 82
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 83
    .line 84
    .line 85
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;->id:Ljava/lang/String;

    .line 86
    .line 87
    if-eqz p0, :cond_3

    .line 88
    .line 89
    const-string p1, "id"

    .line 90
    .line 91
    invoke-virtual {p2, p1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    :cond_3
    return-void
.end method

.method public bridge synthetic serializeFields(Lcom/tantanapp/common/data/ValueObject;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 95
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard$1;->serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
