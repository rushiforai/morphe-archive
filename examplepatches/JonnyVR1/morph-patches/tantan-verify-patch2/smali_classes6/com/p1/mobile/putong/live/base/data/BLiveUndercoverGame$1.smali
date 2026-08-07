.class Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame$1;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;",
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
    const-class p0, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame$1;->newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;",
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
    const-string p0, "voteResult"

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
    const-string p0, "countDownSeconds"

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
    const-string p0, "gameResult"

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
    const-string p0, "votes"

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
    const-string p0, "id"

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
    const-string p0, "status"

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
    const-string p0, "currentPlayers"

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
    const-string p0, "remainSeconds"

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
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverVoteResult;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 108
    .line 109
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverVoteResult;

    .line 114
    .line 115
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->voteResult:Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverVoteResult;

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
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->countDownSeconds:I

    .line 123
    .line 124
    return v1

    .line 125
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGameResult;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 126
    .line 127
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGameResult;

    .line 132
    .line 133
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->gameResult:Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGameResult;

    .line 134
    .line 135
    return v1

    .line 136
    :pswitch_3
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverVote;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 137
    .line 138
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->votes:Ljava/util/List;

    .line 143
    .line 144
    return v1

    .line 145
    :pswitch_4
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object p0

    .line 149
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->id:Ljava/lang/String;

    .line 150
    .line 151
    return v0

    .line 152
    :pswitch_5
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->status:Ljava/lang/String;

    .line 157
    .line 158
    return v1

    .line 159
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverCurrentPlayer;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 160
    .line 161
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 162
    .line 163
    .line 164
    move-result-object p0

    .line 165
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->currentPlayers:Ljava/util/List;

    .line 166
    .line 167
    return v1

    .line 168
    :pswitch_7
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 169
    .line 170
    .line 171
    move-result p0

    .line 172
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->remainSeconds:I

    .line 173
    .line 174
    return v1

    .line 175
    :sswitch_data_0
    .sparse-switch
        -0x7fe4318d -> :sswitch_7
        -0x7c2ece07 -> :sswitch_6
        -0x3532300e -> :sswitch_5
        0xd1b -> :sswitch_4
        0x6b30ac9 -> :sswitch_3
        0x22e2c2af -> :sswitch_2
        0x44830aee -> :sswitch_1
        0x6616afa7 -> :sswitch_0
    .end sparse-switch

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

    .line 175
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame$1;->parseField(Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->id:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->status:Ljava/lang/String;

    .line 11
    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    const-string v0, "status"

    .line 15
    .line 16
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->currentPlayers:Ljava/util/List;

    .line 20
    .line 21
    if-eqz p0, :cond_2

    .line 22
    .line 23
    const-string p0, "currentPlayers"

    .line 24
    .line 25
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->currentPlayers:Ljava/util/List;

    .line 29
    .line 30
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverCurrentPlayer;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 31
    .line 32
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 33
    .line 34
    .line 35
    :cond_2
    const-string p0, "remainSeconds"

    .line 36
    .line 37
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->remainSeconds:I

    .line 38
    .line 39
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 40
    .line 41
    .line 42
    const-string p0, "countDownSeconds"

    .line 43
    .line 44
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->countDownSeconds:I

    .line 45
    .line 46
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 47
    .line 48
    .line 49
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->votes:Ljava/util/List;

    .line 50
    .line 51
    if-eqz p0, :cond_3

    .line 52
    .line 53
    const-string p0, "votes"

    .line 54
    .line 55
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->votes:Ljava/util/List;

    .line 59
    .line 60
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverVote;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 61
    .line 62
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 63
    .line 64
    .line 65
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->voteResult:Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverVoteResult;

    .line 66
    .line 67
    const/4 v0, 0x1

    .line 68
    if-eqz p0, :cond_4

    .line 69
    .line 70
    const-string p0, "voteResult"

    .line 71
    .line 72
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverVoteResult;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 76
    .line 77
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->voteResult:Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverVoteResult;

    .line 78
    .line 79
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 80
    .line 81
    .line 82
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->gameResult:Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGameResult;

    .line 83
    .line 84
    if-eqz p0, :cond_5

    .line 85
    .line 86
    const-string p0, "gameResult"

    .line 87
    .line 88
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGameResult;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 92
    .line 93
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->gameResult:Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGameResult;

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame$1;->serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
