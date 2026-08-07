.class Lcom/p1/mobile/putong/live/base/data/BLiveSmallWindowCloseAlert$1;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/base/data/BLiveSmallWindowCloseAlert;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveSmallWindowCloseAlert;",
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
    const-class p0, Lcom/p1/mobile/putong/live/base/data/BLiveSmallWindowCloseAlert;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveSmallWindowCloseAlert;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/live/base/data/BLiveSmallWindowCloseAlert;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveSmallWindowCloseAlert;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveSmallWindowCloseAlert$1;->newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveSmallWindowCloseAlert;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/live/base/data/BLiveSmallWindowCloseAlert;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSmallWindowCloseAlert;",
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
    const-string p0, "withJumpButtonText"

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
    const-string p0, "continuousWatchCount"

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
    const-string p0, "maxShowCount"

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
    const-string p0, "title"

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
    const-string p0, "type"

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
    const-string p0, "watchDurationLimit"

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
    const-string p0, "tipOnlyButtonText"

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
    const-string p0, "subTitle"

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
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveSmallWindowJumpText;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 108
    .line 109
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveSmallWindowJumpText;

    .line 114
    .line 115
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSmallWindowCloseAlert;->withJumpButtonText:Lcom/p1/mobile/putong/live/base/data/BLiveSmallWindowJumpText;

    .line 116
    .line 117
    return v1

    .line 118
    :pswitch_1
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 119
    .line 120
    .line 121
    move-result p0

    .line 122
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSmallWindowCloseAlert;->continuousWatchCount:I

    .line 123
    .line 124
    return v1

    .line 125
    :pswitch_2
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 126
    .line 127
    .line 128
    move-result p0

    .line 129
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSmallWindowCloseAlert;->maxShowCount:I

    .line 130
    .line 131
    return v1

    .line 132
    :pswitch_3
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object p0

    .line 136
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSmallWindowCloseAlert;->title:Ljava/lang/String;

    .line 137
    .line 138
    return v1

    .line 139
    :pswitch_4
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveCloseAlertType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 140
    .line 141
    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    .line 142
    .line 143
    .line 144
    move-result-object p0

    .line 145
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveCloseAlertType;

    .line 146
    .line 147
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSmallWindowCloseAlert;->type:Lcom/p1/mobile/putong/live/base/data/BLiveCloseAlertType;

    .line 148
    .line 149
    return v1

    .line 150
    :pswitch_5
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 151
    .line 152
    .line 153
    move-result p0

    .line 154
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSmallWindowCloseAlert;->watchDurationLimit:I

    .line 155
    .line 156
    return v1

    .line 157
    :pswitch_6
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object p0

    .line 161
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSmallWindowCloseAlert;->tipOnlyButtonText:Ljava/lang/String;

    .line 162
    .line 163
    return v1

    .line 164
    :pswitch_7
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object p0

    .line 168
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSmallWindowCloseAlert;->subTitle:Ljava/lang/String;

    .line 169
    .line 170
    return v1

    .line 171
    :sswitch_data_0
    .sparse-switch
        -0x7c93a408 -> :sswitch_7
        -0x433bd23a -> :sswitch_6
        -0x20d5a208 -> :sswitch_5
        0x368f3a -> :sswitch_4
        0x6942258 -> :sswitch_3
        0x382b270e -> :sswitch_2
        0x60a4adef -> :sswitch_1
        0x6f9890b3 -> :sswitch_0
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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveSmallWindowCloseAlert;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/live/base/data/BLiveSmallWindowCloseAlert$1;->parseField(Lcom/p1/mobile/putong/live/base/data/BLiveSmallWindowCloseAlert;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveSmallWindowCloseAlert;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSmallWindowCloseAlert;->type:Lcom/p1/mobile/putong/live/base/data/BLiveCloseAlertType;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    const-string p0, "type"

    .line 7
    .line 8
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveCloseAlertType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 12
    .line 13
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSmallWindowCloseAlert;->type:Lcom/p1/mobile/putong/live/base/data/BLiveCloseAlertType;

    .line 14
    .line 15
    invoke-virtual {p0, v1, p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->serialize(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSmallWindowCloseAlert;->title:Ljava/lang/String;

    .line 19
    .line 20
    if-eqz p0, :cond_1

    .line 21
    .line 22
    const-string v1, "title"

    .line 23
    .line 24
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSmallWindowCloseAlert;->subTitle:Ljava/lang/String;

    .line 28
    .line 29
    if-eqz p0, :cond_2

    .line 30
    .line 31
    const-string v1, "subTitle"

    .line 32
    .line 33
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSmallWindowCloseAlert;->tipOnlyButtonText:Ljava/lang/String;

    .line 37
    .line 38
    if-eqz p0, :cond_3

    .line 39
    .line 40
    const-string v1, "tipOnlyButtonText"

    .line 41
    .line 42
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSmallWindowCloseAlert;->withJumpButtonText:Lcom/p1/mobile/putong/live/base/data/BLiveSmallWindowJumpText;

    .line 46
    .line 47
    if-eqz p0, :cond_4

    .line 48
    .line 49
    const-string p0, "withJumpButtonText"

    .line 50
    .line 51
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveSmallWindowJumpText;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 55
    .line 56
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSmallWindowCloseAlert;->withJumpButtonText:Lcom/p1/mobile/putong/live/base/data/BLiveSmallWindowJumpText;

    .line 57
    .line 58
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 59
    .line 60
    .line 61
    :cond_4
    const-string p0, "watchDurationLimit"

    .line 62
    .line 63
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSmallWindowCloseAlert;->watchDurationLimit:I

    .line 64
    .line 65
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 66
    .line 67
    .line 68
    const-string p0, "maxShowCount"

    .line 69
    .line 70
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSmallWindowCloseAlert;->maxShowCount:I

    .line 71
    .line 72
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 73
    .line 74
    .line 75
    const-string p0, "continuousWatchCount"

    .line 76
    .line 77
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSmallWindowCloseAlert;->continuousWatchCount:I

    .line 78
    .line 79
    invoke-virtual {p2, p0, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public bridge synthetic serializeFields(Lcom/tantanapp/common/data/ValueObject;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 83
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveSmallWindowCloseAlert;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/data/BLiveSmallWindowCloseAlert$1;->serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveSmallWindowCloseAlert;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
