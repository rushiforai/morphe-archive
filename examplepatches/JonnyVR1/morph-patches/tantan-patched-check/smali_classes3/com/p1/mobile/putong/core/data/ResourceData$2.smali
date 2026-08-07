.class Lcom/p1/mobile/putong/core/data/ResourceData$2;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/ResourceData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/core/data/ResourceData;",
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
    const-class p0, Lcom/p1/mobile/putong/core/data/ResourceData;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/core/data/ResourceData;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/ResourceData;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/ResourceData;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/ResourceData$2;->newInstance()Lcom/p1/mobile/putong/core/data/ResourceData;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/core/data/ResourceData;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/ResourceData;",
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
    const-string p0, "ruleKey"

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
    const-string p0, "resourceKey"

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
    const-string p0, "insertOffsetPosition"

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
    const-string p0, "card"

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
    const-string p0, "gid"

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
    const-string p0, "pendingDelete"

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
    const-string p0, "business"

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
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ResourceData;->ruleKey:Ljava/lang/String;

    .line 100
    .line 101
    return v1

    .line 102
    :pswitch_1
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ResourceData;->resourceKey:Ljava/lang/String;

    .line 107
    .line 108
    return v1

    .line 109
    :pswitch_2
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 110
    .line 111
    .line 112
    move-result p0

    .line 113
    iput p0, p1, Lcom/p1/mobile/putong/core/data/ResourceData;->insertOffsetPosition:I

    .line 114
    .line 115
    return v1

    .line 116
    :pswitch_3
    sget-object p0, Lcom/p1/mobile/putong/core/data/ResourceDataCard;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 117
    .line 118
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    check-cast p0, Lcom/p1/mobile/putong/core/data/ResourceDataCard;

    .line 123
    .line 124
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ResourceData;->card:Lcom/p1/mobile/putong/core/data/ResourceDataCard;

    .line 125
    .line 126
    return v1

    .line 127
    :pswitch_4
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ResourceData;->gid:Ljava/lang/String;

    .line 132
    .line 133
    return v1

    .line 134
    :pswitch_5
    sget-object p0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 135
    .line 136
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ResourceData;->pendingDelete:Ljava/util/List;

    .line 141
    .line 142
    return v1

    .line 143
    :pswitch_6
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ResourceData;->business:Ljava/lang/String;

    .line 148
    .line 149
    return v1

    .line 150
    nop

    .line 151
    :sswitch_data_0
    .sparse-switch
        -0x445b4040 -> :sswitch_6
        -0x161d1de -> :sswitch_5
        0x18fc2 -> :sswitch_4
        0x2e7b10 -> :sswitch_3
        0x1b17f5f5 -> :sswitch_2
        0x49953f71 -> :sswitch_1
        0x5c4e5dc3 -> :sswitch_0
    .end sparse-switch

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

    .line 151
    check-cast p1, Lcom/p1/mobile/putong/core/data/ResourceData;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/core/data/ResourceData$2;->parseField(Lcom/p1/mobile/putong/core/data/ResourceData;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public parseFieldCheck(Lcom/p1/mobile/putong/core/data/ResourceData;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/ResourceData;",
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

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, 0x1

    .line 9
    const/4 v2, -0x1

    .line 10
    sparse-switch v0, :sswitch_data_0

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :sswitch_0
    const-string v0, "ruleKey"

    .line 15
    .line 16
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 v2, 0x6

    .line 24
    goto :goto_0

    .line 25
    :sswitch_1
    const-string v0, "resourceKey"

    .line 26
    .line 27
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    const/4 v2, 0x5

    .line 35
    goto :goto_0

    .line 36
    :sswitch_2
    const-string v0, "insertOffsetPosition"

    .line 37
    .line 38
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-nez v0, :cond_2

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_2
    const/4 v2, 0x4

    .line 46
    goto :goto_0

    .line 47
    :sswitch_3
    const-string v0, "card"

    .line 48
    .line 49
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-nez v0, :cond_3

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_3
    const/4 v2, 0x3

    .line 57
    goto :goto_0

    .line 58
    :sswitch_4
    const-string v0, "gid"

    .line 59
    .line 60
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    if-nez v0, :cond_4

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_4
    const/4 v2, 0x2

    .line 68
    goto :goto_0

    .line 69
    :sswitch_5
    const-string v0, "pendingDelete"

    .line 70
    .line 71
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-nez v0, :cond_5

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_5
    move v2, v1

    .line 79
    goto :goto_0

    .line 80
    :sswitch_6
    const-string v0, "business"

    .line 81
    .line 82
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    if-nez v0, :cond_6

    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_6
    const/4 v2, 0x0

    .line 90
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 91
    .line 92
    .line 93
    invoke-super/range {p0 .. p6}, Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;->parseFieldCheck(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    .line 94
    .line 95
    .line 96
    move-result p0

    .line 97
    return p0

    .line 98
    :pswitch_0
    return v1

    .line 99
    :sswitch_data_0
    .sparse-switch
        -0x445b4040 -> :sswitch_6
        -0x161d1de -> :sswitch_5
        0x18fc2 -> :sswitch_4
        0x2e7b10 -> :sswitch_3
        0x1b17f5f5 -> :sswitch_2
        0x49953f71 -> :sswitch_1
        0x5c4e5dc3 -> :sswitch_0
    .end sparse-switch

    .line 100
    .line 101
    .line 102
    .line 103
    .line 104
    .line 105
    .line 106
    .line 107
    .line 108
    .line 109
    .line 110
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public bridge synthetic parseFieldCheck(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 0

    .line 99
    check-cast p1, Lcom/p1/mobile/putong/core/data/ResourceData;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/core/data/ResourceData$2;->parseFieldCheck(Lcom/p1/mobile/putong/core/data/ResourceData;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/core/data/ResourceData;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ResourceData;->resourceKey:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const-string v0, "resourceKey"

    .line 6
    .line 7
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ResourceData;->business:Ljava/lang/String;

    .line 11
    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    const-string v0, "business"

    .line 15
    .line 16
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ResourceData;->ruleKey:Ljava/lang/String;

    .line 20
    .line 21
    if-eqz p0, :cond_2

    .line 22
    .line 23
    const-string v0, "ruleKey"

    .line 24
    .line 25
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ResourceData;->card:Lcom/p1/mobile/putong/core/data/ResourceDataCard;

    .line 29
    .line 30
    if-eqz p0, :cond_3

    .line 31
    .line 32
    const-string p0, "card"

    .line 33
    .line 34
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    sget-object p0, Lcom/p1/mobile/putong/core/data/ResourceDataCard;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 38
    .line 39
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ResourceData;->card:Lcom/p1/mobile/putong/core/data/ResourceDataCard;

    .line 40
    .line 41
    const/4 v1, 0x1

    .line 42
    invoke-virtual {p0, v0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 43
    .line 44
    .line 45
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ResourceData;->gid:Ljava/lang/String;

    .line 46
    .line 47
    if-eqz p0, :cond_4

    .line 48
    .line 49
    const-string v0, "gid"

    .line 50
    .line 51
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    :cond_4
    const-string p0, "insertOffsetPosition"

    .line 55
    .line 56
    iget v0, p1, Lcom/p1/mobile/putong/core/data/ResourceData;->insertOffsetPosition:I

    .line 57
    .line 58
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 59
    .line 60
    .line 61
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ResourceData;->pendingDelete:Ljava/util/List;

    .line 62
    .line 63
    if-eqz p0, :cond_5

    .line 64
    .line 65
    const-string p0, "pendingDelete"

    .line 66
    .line 67
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ResourceData;->pendingDelete:Ljava/util/List;

    .line 71
    .line 72
    sget-object p1, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 73
    .line 74
    invoke-static {p0, p2, p1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/ResourceData;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/ResourceData$2;->serializeFields(Lcom/p1/mobile/putong/core/data/ResourceData;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
