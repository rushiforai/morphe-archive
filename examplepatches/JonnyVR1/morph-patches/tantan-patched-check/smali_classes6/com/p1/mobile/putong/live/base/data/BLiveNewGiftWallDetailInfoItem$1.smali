.class Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallDetailInfoItem$1;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallDetailInfoItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallDetailInfoItem;",
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
    const-class p0, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallDetailInfoItem;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallDetailInfoItem;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallDetailInfoItem;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallDetailInfoItem;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallDetailInfoItem$1;->newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallDetailInfoItem;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallDetailInfoItem;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallDetailInfoItem;",
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
    const-string p0, "hierarchy"

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
    const-string p0, "categories"

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
    const-string p0, "users"

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
    const-string p0, "title"

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
    const-string p0, "gifts"

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
    const-string p0, "bgUrl"

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
    const-string p0, "progresses"

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
    const-string p0, "tabs"

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
    const-string p0, "bgSvgaUrl"

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
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallHierarchy;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 122
    .line 123
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallHierarchy;

    .line 128
    .line 129
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallDetailInfoItem;->hierarchy:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallHierarchy;

    .line 130
    .line 131
    return v1

    .line 132
    :pswitch_1
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallCategory;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 133
    .line 134
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 135
    .line 136
    .line 137
    move-result-object p0

    .line 138
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallDetailInfoItem;->categories:Ljava/util/List;

    .line 139
    .line 140
    return v1

    .line 141
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallUser;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 142
    .line 143
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallDetailInfoItem;->users:Ljava/util/List;

    .line 148
    .line 149
    return v1

    .line 150
    :pswitch_3
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object p0

    .line 154
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallDetailInfoItem;->title:Ljava/lang/String;

    .line 155
    .line 156
    return v1

    .line 157
    :pswitch_4
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGift;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 158
    .line 159
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 160
    .line 161
    .line 162
    move-result-object p0

    .line 163
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallDetailInfoItem;->gifts:Ljava/util/List;

    .line 164
    .line 165
    return v1

    .line 166
    :pswitch_5
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object p0

    .line 170
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallDetailInfoItem;->bgUrl:Ljava/lang/String;

    .line 171
    .line 172
    return v1

    .line 173
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallProgress;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 174
    .line 175
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 176
    .line 177
    .line 178
    move-result-object p0

    .line 179
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallDetailInfoItem;->progresses:Ljava/util/List;

    .line 180
    .line 181
    return v1

    .line 182
    :pswitch_7
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallTab;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 183
    .line 184
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 185
    .line 186
    .line 187
    move-result-object p0

    .line 188
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallDetailInfoItem;->tabs:Ljava/util/List;

    .line 189
    .line 190
    return v1

    .line 191
    :pswitch_8
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 192
    .line 193
    .line 194
    move-result-object p0

    .line 195
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallDetailInfoItem;->bgSvgaUrl:Ljava/lang/String;

    .line 196
    .line 197
    return v1

    .line 198
    nop

    :sswitch_data_0
    .sparse-switch
        -0x7c5a8a53 -> :sswitch_8
        0x36337e -> :sswitch_7
        0x22cf79b -> :sswitch_6
        0x5951eea -> :sswitch_5
        0x5dcbd43 -> :sswitch_4
        0x6942258 -> :sswitch_3
        0x6a68e08 -> :sswitch_2
        0x4d47461c -> :sswitch_1
        0x7e129235 -> :sswitch_0
    .end sparse-switch

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

    .line 199
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallDetailInfoItem;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallDetailInfoItem$1;->parseField(Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallDetailInfoItem;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallDetailInfoItem;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallDetailInfoItem;->title:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const-string v0, "title"

    .line 6
    .line 7
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallDetailInfoItem;->bgUrl:Ljava/lang/String;

    .line 11
    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    const-string v0, "bgUrl"

    .line 15
    .line 16
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallDetailInfoItem;->hierarchy:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallHierarchy;

    .line 20
    .line 21
    if-eqz p0, :cond_2

    .line 22
    .line 23
    const-string p0, "hierarchy"

    .line 24
    .line 25
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallHierarchy;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 29
    .line 30
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallDetailInfoItem;->hierarchy:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallHierarchy;

    .line 31
    .line 32
    const/4 v1, 0x1

    .line 33
    invoke-virtual {p0, v0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 34
    .line 35
    .line 36
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallDetailInfoItem;->progresses:Ljava/util/List;

    .line 37
    .line 38
    if-eqz p0, :cond_3

    .line 39
    .line 40
    const-string p0, "progresses"

    .line 41
    .line 42
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallDetailInfoItem;->progresses:Ljava/util/List;

    .line 46
    .line 47
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallProgress;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 48
    .line 49
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 50
    .line 51
    .line 52
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallDetailInfoItem;->tabs:Ljava/util/List;

    .line 53
    .line 54
    if-eqz p0, :cond_4

    .line 55
    .line 56
    const-string p0, "tabs"

    .line 57
    .line 58
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallDetailInfoItem;->tabs:Ljava/util/List;

    .line 62
    .line 63
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallTab;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 64
    .line 65
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 66
    .line 67
    .line 68
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallDetailInfoItem;->users:Ljava/util/List;

    .line 69
    .line 70
    if-eqz p0, :cond_5

    .line 71
    .line 72
    const-string p0, "users"

    .line 73
    .line 74
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallDetailInfoItem;->users:Ljava/util/List;

    .line 78
    .line 79
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallUser;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 80
    .line 81
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 82
    .line 83
    .line 84
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallDetailInfoItem;->categories:Ljava/util/List;

    .line 85
    .line 86
    if-eqz p0, :cond_6

    .line 87
    .line 88
    const-string p0, "categories"

    .line 89
    .line 90
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallDetailInfoItem;->categories:Ljava/util/List;

    .line 94
    .line 95
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallCategory;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 96
    .line 97
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 98
    .line 99
    .line 100
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallDetailInfoItem;->gifts:Ljava/util/List;

    .line 101
    .line 102
    if-eqz p0, :cond_7

    .line 103
    .line 104
    const-string p0, "gifts"

    .line 105
    .line 106
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallDetailInfoItem;->gifts:Ljava/util/List;

    .line 110
    .line 111
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGift;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 112
    .line 113
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 114
    .line 115
    .line 116
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallDetailInfoItem;->bgSvgaUrl:Ljava/lang/String;

    .line 117
    .line 118
    if-eqz p0, :cond_8

    .line 119
    .line 120
    const-string p1, "bgSvgaUrl"

    .line 121
    .line 122
    invoke-virtual {p2, p1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    :cond_8
    return-void
.end method

.method public bridge synthetic serializeFields(Lcom/tantanapp/common/data/ValueObject;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 126
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallDetailInfoItem;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallDetailInfoItem$1;->serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallDetailInfoItem;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
