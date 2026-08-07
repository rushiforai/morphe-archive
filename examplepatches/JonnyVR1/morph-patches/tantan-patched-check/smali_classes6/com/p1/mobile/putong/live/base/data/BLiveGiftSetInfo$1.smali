.class Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo$1;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;",
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
    const-class p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo$1;->newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;",
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
    const-string p0, "tickerLeft"

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
    const-string p0, "displayAttribute"

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
    const-string p0, "setProcesses"

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
    const-string p0, "name"

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
    const-string p0, "id"

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
    const-string p0, "resourcePicUrl"

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
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 85
    .line 86
    .line 87
    move-result p0

    .line 88
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;->tickerLeft:I

    .line 89
    .line 90
    return v1

    .line 91
    :pswitch_1
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttribute;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 92
    .line 93
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttribute;

    .line 98
    .line 99
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;->displayAttribute:Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttribute;

    .line 100
    .line 101
    return v1

    .line 102
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetProcesses;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 103
    .line 104
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;->setProcesses:Ljava/util/List;

    .line 109
    .line 110
    return v1

    .line 111
    :pswitch_3
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;->name:Ljava/lang/String;

    .line 116
    .line 117
    return v1

    .line 118
    :pswitch_4
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;->id:Ljava/lang/String;

    .line 123
    .line 124
    return v0

    .line 125
    :pswitch_5
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;->resourcePicUrl:Ljava/lang/String;

    .line 130
    .line 131
    return v1

    .line 132
    nop

    .line 133
    :sswitch_data_0
    .sparse-switch
        -0x8265acd -> :sswitch_5
        0xd1b -> :sswitch_4
        0x337a8b -> :sswitch_3
        0x1a807d1b -> :sswitch_2
        0x60776bfa -> :sswitch_1
        0x7c6bea31 -> :sswitch_0
    .end sparse-switch

    .line 134
    .line 135
    .line 136
    .line 137
    .line 138
    .line 139
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

    .line 133
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo$1;->parseField(Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;->id:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;->name:Ljava/lang/String;

    .line 11
    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    const-string v0, "name"

    .line 15
    .line 16
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    const-string p0, "tickerLeft"

    .line 20
    .line 21
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;->tickerLeft:I

    .line 22
    .line 23
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;->resourcePicUrl:Ljava/lang/String;

    .line 27
    .line 28
    if-eqz p0, :cond_2

    .line 29
    .line 30
    const-string v0, "resourcePicUrl"

    .line 31
    .line 32
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;->setProcesses:Ljava/util/List;

    .line 36
    .line 37
    if-eqz p0, :cond_3

    .line 38
    .line 39
    const-string p0, "setProcesses"

    .line 40
    .line 41
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;->setProcesses:Ljava/util/List;

    .line 45
    .line 46
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetProcesses;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 47
    .line 48
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 49
    .line 50
    .line 51
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;->displayAttribute:Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttribute;

    .line 52
    .line 53
    if-eqz p0, :cond_4

    .line 54
    .line 55
    const-string p0, "displayAttribute"

    .line 56
    .line 57
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttribute;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 61
    .line 62
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;->displayAttribute:Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttribute;

    .line 63
    .line 64
    const/4 v0, 0x1

    .line 65
    invoke-virtual {p0, p1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 66
    .line 67
    .line 68
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

    .line 69
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo$1;->serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
