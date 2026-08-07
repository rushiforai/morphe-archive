.class Lcom/p1/mobile/putong/core/data/DatingPurpose$2;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/DatingPurpose;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/core/data/DatingPurpose;",
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
    const-class p0, Lcom/p1/mobile/putong/core/data/DatingPurpose;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/core/data/DatingPurpose;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/DatingPurpose;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/DatingPurpose;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/DatingPurpose$2;->newInstance()Lcom/p1/mobile/putong/core/data/DatingPurpose;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/core/data/DatingPurpose;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/DatingPurpose;",
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
    const-string p0, "information"

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
    const-string p0, "introduction"

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
    const-string p0, "interest"

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
    const-string p0, "myrecent"

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
    const-string p0, "personality"

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
    const-string p0, "picture"

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
    const-string p0, "extension"

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
    const-string p0, "question"

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
    iput p0, p1, Lcom/p1/mobile/putong/core/data/DatingPurpose;->information:I

    .line 112
    .line 113
    return v1

    .line 114
    :pswitch_1
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 115
    .line 116
    .line 117
    move-result p0

    .line 118
    iput p0, p1, Lcom/p1/mobile/putong/core/data/DatingPurpose;->introduction:I

    .line 119
    .line 120
    return v1

    .line 121
    :pswitch_2
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 122
    .line 123
    .line 124
    move-result p0

    .line 125
    iput p0, p1, Lcom/p1/mobile/putong/core/data/DatingPurpose;->interest:I

    .line 126
    .line 127
    return v1

    .line 128
    :pswitch_3
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 129
    .line 130
    .line 131
    move-result p0

    .line 132
    iput p0, p1, Lcom/p1/mobile/putong/core/data/DatingPurpose;->myrecent:I

    .line 133
    .line 134
    return v1

    .line 135
    :pswitch_4
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 136
    .line 137
    .line 138
    move-result p0

    .line 139
    iput p0, p1, Lcom/p1/mobile/putong/core/data/DatingPurpose;->personality:I

    .line 140
    .line 141
    return v1

    .line 142
    :pswitch_5
    sget-object p0, Lcom/tantanapp/common/data/JsonAdapter;->INT_BOXED_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 143
    .line 144
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 145
    .line 146
    .line 147
    move-result-object p0

    .line 148
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/DatingPurpose;->picture:Ljava/util/List;

    .line 149
    .line 150
    return v1

    .line 151
    :pswitch_6
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 152
    .line 153
    .line 154
    move-result p0

    .line 155
    iput p0, p1, Lcom/p1/mobile/putong/core/data/DatingPurpose;->extension:I

    .line 156
    .line 157
    return v1

    .line 158
    :pswitch_7
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 159
    .line 160
    .line 161
    move-result p0

    .line 162
    iput p0, p1, Lcom/p1/mobile/putong/core/data/DatingPurpose;->question:I

    .line 163
    .line 164
    return v1

    .line 165
    :sswitch_data_0
    .sparse-switch
        -0x457dc41a -> :sswitch_7
        -0x2482e3c1 -> :sswitch_6
        -0x226fa302 -> :sswitch_5
        -0x19453592 -> :sswitch_4
        0x3f86307 -> :sswitch_3
        0x21ffa72a -> :sswitch_2
        0x5bc4581a -> :sswitch_1
        0x7556752c -> :sswitch_0
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
    .line 196
    .line 197
    .line 198
    .line 199
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

    .line 165
    check-cast p1, Lcom/p1/mobile/putong/core/data/DatingPurpose;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/core/data/DatingPurpose$2;->parseField(Lcom/p1/mobile/putong/core/data/DatingPurpose;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public parseFieldCheck(Lcom/p1/mobile/putong/core/data/DatingPurpose;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/DatingPurpose;",
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
    goto/16 :goto_0

    .line 14
    .line 15
    :sswitch_0
    const-string v0, "information"

    .line 16
    .line 17
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 v2, 0x7

    .line 25
    goto :goto_0

    .line 26
    :sswitch_1
    const-string v0, "introduction"

    .line 27
    .line 28
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-nez v0, :cond_1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    const/4 v2, 0x6

    .line 36
    goto :goto_0

    .line 37
    :sswitch_2
    const-string v0, "interest"

    .line 38
    .line 39
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-nez v0, :cond_2

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_2
    const/4 v2, 0x5

    .line 47
    goto :goto_0

    .line 48
    :sswitch_3
    const-string v0, "myrecent"

    .line 49
    .line 50
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-nez v0, :cond_3

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_3
    const/4 v2, 0x4

    .line 58
    goto :goto_0

    .line 59
    :sswitch_4
    const-string v0, "personality"

    .line 60
    .line 61
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-nez v0, :cond_4

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_4
    const/4 v2, 0x3

    .line 69
    goto :goto_0

    .line 70
    :sswitch_5
    const-string v0, "picture"

    .line 71
    .line 72
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-nez v0, :cond_5

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_5
    const/4 v2, 0x2

    .line 80
    goto :goto_0

    .line 81
    :sswitch_6
    const-string v0, "extension"

    .line 82
    .line 83
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    if-nez v0, :cond_6

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_6
    move v2, v1

    .line 91
    goto :goto_0

    .line 92
    :sswitch_7
    const-string v0, "question"

    .line 93
    .line 94
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    if-nez v0, :cond_7

    .line 99
    .line 100
    goto :goto_0

    .line 101
    :cond_7
    const/4 v2, 0x0

    .line 102
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 103
    .line 104
    .line 105
    invoke-super/range {p0 .. p6}, Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;->parseFieldCheck(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    .line 106
    .line 107
    .line 108
    move-result p0

    .line 109
    return p0

    .line 110
    :pswitch_0
    return v1

    :sswitch_data_0
    .sparse-switch
        -0x457dc41a -> :sswitch_7
        -0x2482e3c1 -> :sswitch_6
        -0x226fa302 -> :sswitch_5
        -0x19453592 -> :sswitch_4
        0x3f86307 -> :sswitch_3
        0x21ffa72a -> :sswitch_2
        0x5bc4581a -> :sswitch_1
        0x7556752c -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
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

    .line 111
    check-cast p1, Lcom/p1/mobile/putong/core/data/DatingPurpose;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/core/data/DatingPurpose$2;->parseFieldCheck(Lcom/p1/mobile/putong/core/data/DatingPurpose;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/core/data/DatingPurpose;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/DatingPurpose;->picture:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const-string p0, "picture"

    .line 6
    .line 7
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/DatingPurpose;->picture:Ljava/util/List;

    .line 11
    .line 12
    sget-object v0, Lcom/tantanapp/common/data/JsonAdapter;->INT_BOXED_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 13
    .line 14
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    const-string p0, "introduction"

    .line 18
    .line 19
    iget v0, p1, Lcom/p1/mobile/putong/core/data/DatingPurpose;->introduction:I

    .line 20
    .line 21
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 22
    .line 23
    .line 24
    const-string p0, "information"

    .line 25
    .line 26
    iget v0, p1, Lcom/p1/mobile/putong/core/data/DatingPurpose;->information:I

    .line 27
    .line 28
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 29
    .line 30
    .line 31
    const-string p0, "extension"

    .line 32
    .line 33
    iget v0, p1, Lcom/p1/mobile/putong/core/data/DatingPurpose;->extension:I

    .line 34
    .line 35
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 36
    .line 37
    .line 38
    const-string p0, "personality"

    .line 39
    .line 40
    iget v0, p1, Lcom/p1/mobile/putong/core/data/DatingPurpose;->personality:I

    .line 41
    .line 42
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 43
    .line 44
    .line 45
    const-string p0, "interest"

    .line 46
    .line 47
    iget v0, p1, Lcom/p1/mobile/putong/core/data/DatingPurpose;->interest:I

    .line 48
    .line 49
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 50
    .line 51
    .line 52
    const-string p0, "question"

    .line 53
    .line 54
    iget v0, p1, Lcom/p1/mobile/putong/core/data/DatingPurpose;->question:I

    .line 55
    .line 56
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 57
    .line 58
    .line 59
    const-string p0, "myrecent"

    .line 60
    .line 61
    iget p1, p1, Lcom/p1/mobile/putong/core/data/DatingPurpose;->myrecent:I

    .line 62
    .line 63
    invoke-virtual {p2, p0, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public bridge synthetic serializeFields(Lcom/tantanapp/common/data/ValueObject;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 67
    check-cast p1, Lcom/p1/mobile/putong/core/data/DatingPurpose;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/DatingPurpose$2;->serializeFields(Lcom/p1/mobile/putong/core/data/DatingPurpose;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
