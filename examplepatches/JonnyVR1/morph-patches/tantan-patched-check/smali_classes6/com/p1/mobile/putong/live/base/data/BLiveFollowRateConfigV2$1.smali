.class Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2$1;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;",
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
    const-class p0, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2$1;->newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;",
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
    goto :goto_0

    .line 15
    :sswitch_0
    const-string p0, "popup"

    .line 16
    .line 17
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-nez p0, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 v2, 0x5

    .line 25
    goto :goto_0

    .line 26
    :sswitch_1
    const-string p0, "chat"

    .line 27
    .line 28
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    if-nez p0, :cond_1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    const/4 v2, 0x4

    .line 36
    goto :goto_0

    .line 37
    :sswitch_2
    const-string p0, "on"

    .line 38
    .line 39
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    if-nez p0, :cond_2

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_2
    const/4 v2, 0x3

    .line 47
    goto :goto_0

    .line 48
    :sswitch_3
    const-string p0, "noRepeatAnchorCount"

    .line 49
    .line 50
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    if-nez p0, :cond_3

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_3
    const/4 v2, 0x2

    .line 58
    goto :goto_0

    .line 59
    :sswitch_4
    const-string p0, "bubble"

    .line 60
    .line 61
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    if-nez p0, :cond_4

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_4
    move v2, v1

    .line 69
    goto :goto_0

    .line 70
    :sswitch_5
    const-string p0, "afterGiveGift"

    .line 71
    .line 72
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result p0

    .line 76
    if-nez p0, :cond_5

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_5
    move v2, v0

    .line 80
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 81
    .line 82
    .line 83
    return v0

    .line 84
    :pswitch_0
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRatePopupV2;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 85
    .line 86
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRatePopupV2;

    .line 91
    .line 92
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;->popup:Lcom/p1/mobile/putong/live/base/data/BLiveFollowRatePopupV2;

    .line 93
    .line 94
    return v1

    .line 95
    :pswitch_1
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateChatV2;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 96
    .line 97
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateChatV2;

    .line 102
    .line 103
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;->chat:Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateChatV2;

    .line 104
    .line 105
    return v1

    .line 106
    :pswitch_2
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 107
    .line 108
    .line 109
    move-result p0

    .line 110
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;->on:Z

    .line 111
    .line 112
    return v1

    .line 113
    :pswitch_3
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 114
    .line 115
    .line 116
    move-result p0

    .line 117
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;->noRepeatAnchorCount:I

    .line 118
    .line 119
    return v1

    .line 120
    :pswitch_4
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateBubbleV2;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 121
    .line 122
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateBubbleV2;

    .line 127
    .line 128
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;->bubble:Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateBubbleV2;

    .line 129
    .line 130
    return v1

    .line 131
    :pswitch_5
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 132
    .line 133
    .line 134
    move-result p0

    .line 135
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;->afterGiveGift:I

    .line 136
    .line 137
    return v1

    .line 138
    nop

    .line 139
    :sswitch_data_0
    .sparse-switch
        -0x5f8fda23 -> :sswitch_5
        -0x52264b74 -> :sswitch_4
        -0x421e3102 -> :sswitch_3
        0xddf -> :sswitch_2
        0x2e9358 -> :sswitch_1
        0x65e70ac -> :sswitch_0
    .end sparse-switch

    .line 140
    .line 141
    .line 142
    .line 143
    .line 144
    .line 145
    .line 146
    .line 147
    .line 148
    .line 149
    .line 150
    .line 151
    .line 152
    .line 153
    .line 154
    .line 155
    .line 156
    .line 157
    .line 158
    .line 159
    .line 160
    .line 161
    .line 162
    .line 163
    .line 164
    .line 165
    :pswitch_data_0
    .packed-switch 0x0
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

    .line 139
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2$1;->parseField(Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const-string p0, "on"

    .line 2
    .line 3
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;->on:Z

    .line 4
    .line 5
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 6
    .line 7
    .line 8
    const-string p0, "noRepeatAnchorCount"

    .line 9
    .line 10
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;->noRepeatAnchorCount:I

    .line 11
    .line 12
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 13
    .line 14
    .line 15
    const-string p0, "afterGiveGift"

    .line 16
    .line 17
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;->afterGiveGift:I

    .line 18
    .line 19
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;->bubble:Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateBubbleV2;

    .line 23
    .line 24
    const/4 v0, 0x1

    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    const-string p0, "bubble"

    .line 28
    .line 29
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateBubbleV2;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 33
    .line 34
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;->bubble:Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateBubbleV2;

    .line 35
    .line 36
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 37
    .line 38
    .line 39
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;->popup:Lcom/p1/mobile/putong/live/base/data/BLiveFollowRatePopupV2;

    .line 40
    .line 41
    if-eqz p0, :cond_1

    .line 42
    .line 43
    const-string p0, "popup"

    .line 44
    .line 45
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRatePopupV2;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 49
    .line 50
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;->popup:Lcom/p1/mobile/putong/live/base/data/BLiveFollowRatePopupV2;

    .line 51
    .line 52
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 53
    .line 54
    .line 55
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;->chat:Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateChatV2;

    .line 56
    .line 57
    if-eqz p0, :cond_2

    .line 58
    .line 59
    const-string p0, "chat"

    .line 60
    .line 61
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateChatV2;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 65
    .line 66
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;->chat:Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateChatV2;

    .line 67
    .line 68
    invoke-virtual {p0, p1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 69
    .line 70
    .line 71
    :cond_2
    return-void
.end method

.method public bridge synthetic serializeFields(Lcom/tantanapp/common/data/ValueObject;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 72
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2$1;->serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
