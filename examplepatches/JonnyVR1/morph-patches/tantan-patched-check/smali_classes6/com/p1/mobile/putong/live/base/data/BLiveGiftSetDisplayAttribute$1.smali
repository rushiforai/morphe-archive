.class Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttribute$1;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttribute;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttribute;",
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
    const-class p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttribute;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttribute;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttribute;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttribute;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttribute$1;->newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttribute;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttribute;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttribute;",
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
    const-string p0, "backgroundPicUrl"

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
    const/4 v2, 0x6

    .line 25
    goto :goto_0

    .line 26
    :sswitch_1
    const-string p0, "tickerDisplayAttribute"

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
    const/4 v2, 0x5

    .line 36
    goto :goto_0

    .line 37
    :sswitch_2
    const-string p0, "safeAreaPicUrl"

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
    const/4 v2, 0x4

    .line 47
    goto :goto_0

    .line 48
    :sswitch_3
    const-string p0, "questionMarkDisplayAttribute"

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
    const/4 v2, 0x3

    .line 58
    goto :goto_0

    .line 59
    :sswitch_4
    const-string p0, "giftSetDescDisplayAttribute"

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
    const/4 v2, 0x2

    .line 69
    goto :goto_0

    .line 70
    :sswitch_5
    const-string p0, "resourceDisplayAttribute"

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
    move v2, v1

    .line 80
    goto :goto_0

    .line 81
    :sswitch_6
    const-string p0, "giftDisplayAttribute"

    .line 82
    .line 83
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    move-result p0

    .line 87
    if-nez p0, :cond_6

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_6
    move v2, v0

    .line 91
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 92
    .line 93
    .line 94
    return v0

    .line 95
    :pswitch_0
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttribute;->backgroundPicUrl:Ljava/lang/String;

    .line 100
    .line 101
    return v1

    .line 102
    :pswitch_1
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttributeItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 103
    .line 104
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttributeItem;

    .line 109
    .line 110
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttribute;->tickerDisplayAttribute:Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttributeItem;

    .line 111
    .line 112
    return v1

    .line 113
    :pswitch_2
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttribute;->safeAreaPicUrl:Ljava/lang/String;

    .line 118
    .line 119
    return v1

    .line 120
    :pswitch_3
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttributeItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 121
    .line 122
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttributeItem;

    .line 127
    .line 128
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttribute;->questionMarkDisplayAttribute:Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttributeItem;

    .line 129
    .line 130
    return v1

    .line 131
    :pswitch_4
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttributeItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 132
    .line 133
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttributeItem;

    .line 138
    .line 139
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttribute;->giftSetDescDisplayAttribute:Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttributeItem;

    .line 140
    .line 141
    return v1

    .line 142
    :pswitch_5
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttributeItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 143
    .line 144
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 145
    .line 146
    .line 147
    move-result-object p0

    .line 148
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttributeItem;

    .line 149
    .line 150
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttribute;->resourceDisplayAttribute:Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttributeItem;

    .line 151
    .line 152
    return v1

    .line 153
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttributeItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 154
    .line 155
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 156
    .line 157
    .line 158
    move-result-object p0

    .line 159
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttributeItem;

    .line 160
    .line 161
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttribute;->giftDisplayAttribute:Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttributeItem;

    .line 162
    .line 163
    return v1

    .line 164
    nop

    .line 165
    :sswitch_data_0
    .sparse-switch
        -0x65ac46b6 -> :sswitch_6
        -0x24d667d8 -> :sswitch_5
        -0x237a8f23 -> :sswitch_4
        -0x10e0213 -> :sswitch_3
        0x47f565df -> :sswitch_2
        0x5090c724 -> :sswitch_1
        0x601cde53 -> :sswitch_0
    .end sparse-switch

    .line 166
    .line 167
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
    :pswitch_data_0
    .packed-switch 0x0
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

    .line 165
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttribute;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttribute$1;->parseField(Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttribute;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttribute;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttribute;->backgroundPicUrl:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const-string v0, "backgroundPicUrl"

    .line 6
    .line 7
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttribute;->safeAreaPicUrl:Ljava/lang/String;

    .line 11
    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    const-string v0, "safeAreaPicUrl"

    .line 15
    .line 16
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttribute;->tickerDisplayAttribute:Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttributeItem;

    .line 20
    .line 21
    const/4 v0, 0x1

    .line 22
    if-eqz p0, :cond_2

    .line 23
    .line 24
    const-string p0, "tickerDisplayAttribute"

    .line 25
    .line 26
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttributeItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 30
    .line 31
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttribute;->tickerDisplayAttribute:Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttributeItem;

    .line 32
    .line 33
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 34
    .line 35
    .line 36
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttribute;->giftSetDescDisplayAttribute:Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttributeItem;

    .line 37
    .line 38
    if-eqz p0, :cond_3

    .line 39
    .line 40
    const-string p0, "giftSetDescDisplayAttribute"

    .line 41
    .line 42
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttributeItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 46
    .line 47
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttribute;->giftSetDescDisplayAttribute:Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttributeItem;

    .line 48
    .line 49
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 50
    .line 51
    .line 52
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttribute;->giftDisplayAttribute:Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttributeItem;

    .line 53
    .line 54
    if-eqz p0, :cond_4

    .line 55
    .line 56
    const-string p0, "giftDisplayAttribute"

    .line 57
    .line 58
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttributeItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 62
    .line 63
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttribute;->giftDisplayAttribute:Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttributeItem;

    .line 64
    .line 65
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 66
    .line 67
    .line 68
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttribute;->resourceDisplayAttribute:Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttributeItem;

    .line 69
    .line 70
    if-eqz p0, :cond_5

    .line 71
    .line 72
    const-string p0, "resourceDisplayAttribute"

    .line 73
    .line 74
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttributeItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 78
    .line 79
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttribute;->resourceDisplayAttribute:Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttributeItem;

    .line 80
    .line 81
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 82
    .line 83
    .line 84
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttribute;->questionMarkDisplayAttribute:Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttributeItem;

    .line 85
    .line 86
    if-eqz p0, :cond_6

    .line 87
    .line 88
    const-string p0, "questionMarkDisplayAttribute"

    .line 89
    .line 90
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttributeItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 94
    .line 95
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttribute;->questionMarkDisplayAttribute:Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttributeItem;

    .line 96
    .line 97
    invoke-virtual {p0, p1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 98
    .line 99
    .line 100
    :cond_6
    return-void
.end method

.method public bridge synthetic serializeFields(Lcom/tantanapp/common/data/ValueObject;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 101
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttribute;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttribute$1;->serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttribute;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
