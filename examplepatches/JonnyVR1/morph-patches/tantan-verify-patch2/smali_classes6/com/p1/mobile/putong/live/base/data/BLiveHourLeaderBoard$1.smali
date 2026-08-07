.class Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard$1;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;",
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
    const-class p0, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard$1;->newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;",
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
    const-string p0, "notices"

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
    const-string p0, "currentHourSuggestConfig"

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
    const-string p0, "hourLeaderboardBattle"

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
    const-string p0, "isOpen"

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
    const-string p0, "allLeaderboards"

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
    const-string p0, "helperPageUrl"

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
    const-string p0, "currentRoomLeaderboards"

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
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveCurrentHourNotices;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 96
    .line 97
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->notices:Ljava/util/List;

    .line 102
    .line 103
    return v1

    .line 104
    :pswitch_1
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveCurrentHourSuggestConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 105
    .line 106
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveCurrentHourSuggestConfig;

    .line 111
    .line 112
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->currentHourSuggestConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCurrentHourSuggestConfig;

    .line 113
    .line 114
    return v1

    .line 115
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardBattle;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 116
    .line 117
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardBattle;

    .line 122
    .line 123
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->hourLeaderboardBattle:Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardBattle;

    .line 124
    .line 125
    return v1

    .line 126
    :pswitch_3
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 127
    .line 128
    .line 129
    move-result p0

    .line 130
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->isOpen:Z

    .line 131
    .line 132
    return v1

    .line 133
    :pswitch_4
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 134
    .line 135
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 136
    .line 137
    .line 138
    move-result-object p0

    .line 139
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->allLeaderboards:Ljava/util/List;

    .line 140
    .line 141
    return v1

    .line 142
    :pswitch_5
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object p0

    .line 146
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->helperPageUrl:Ljava/lang/String;

    .line 147
    .line 148
    return v1

    .line 149
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 150
    .line 151
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 152
    .line 153
    .line 154
    move-result-object p0

    .line 155
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->currentRoomLeaderboards:Ljava/util/List;

    .line 156
    .line 157
    return v1

    .line 158
    nop

    .line 159
    :sswitch_data_0
    .sparse-switch
        -0x7c6b2356 -> :sswitch_6
        -0x6c792b2e -> :sswitch_5
        -0x519c1329 -> :sswitch_4
        -0x4658fd6c -> :sswitch_3
        0x4f67a111 -> :sswitch_2
        0x7d851be9 -> :sswitch_1
        0x7eeb449b -> :sswitch_0
    .end sparse-switch

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
    .line 182
    .line 183
    .line 184
    .line 185
    .line 186
    .line 187
    .line 188
    .line 189
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

    .line 159
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard$1;->parseField(Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->currentRoomLeaderboards:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const-string p0, "currentRoomLeaderboards"

    .line 6
    .line 7
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->currentRoomLeaderboards:Ljava/util/List;

    .line 11
    .line 12
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 13
    .line 14
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->allLeaderboards:Ljava/util/List;

    .line 18
    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    const-string p0, "allLeaderboards"

    .line 22
    .line 23
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->allLeaderboards:Ljava/util/List;

    .line 27
    .line 28
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 29
    .line 30
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 31
    .line 32
    .line 33
    :cond_1
    const-string p0, "isOpen"

    .line 34
    .line 35
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->isOpen:Z

    .line 36
    .line 37
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 38
    .line 39
    .line 40
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->notices:Ljava/util/List;

    .line 41
    .line 42
    if-eqz p0, :cond_2

    .line 43
    .line 44
    const-string p0, "notices"

    .line 45
    .line 46
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->notices:Ljava/util/List;

    .line 50
    .line 51
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveCurrentHourNotices;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 52
    .line 53
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 54
    .line 55
    .line 56
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->helperPageUrl:Ljava/lang/String;

    .line 57
    .line 58
    if-eqz p0, :cond_3

    .line 59
    .line 60
    const-string v0, "helperPageUrl"

    .line 61
    .line 62
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->currentHourSuggestConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCurrentHourSuggestConfig;

    .line 66
    .line 67
    const/4 v0, 0x1

    .line 68
    if-eqz p0, :cond_4

    .line 69
    .line 70
    const-string p0, "currentHourSuggestConfig"

    .line 71
    .line 72
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveCurrentHourSuggestConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 76
    .line 77
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->currentHourSuggestConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCurrentHourSuggestConfig;

    .line 78
    .line 79
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 80
    .line 81
    .line 82
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->hourLeaderboardBattle:Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardBattle;

    .line 83
    .line 84
    if-eqz p0, :cond_5

    .line 85
    .line 86
    const-string p0, "hourLeaderboardBattle"

    .line 87
    .line 88
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardBattle;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 92
    .line 93
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->hourLeaderboardBattle:Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardBattle;

    .line 94
    .line 95
    invoke-virtual {p0, p1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 96
    .line 97
    .line 98
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

    .line 99
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard$1;->serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
