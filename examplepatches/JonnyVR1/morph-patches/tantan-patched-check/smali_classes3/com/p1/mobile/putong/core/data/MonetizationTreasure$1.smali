.class Lcom/p1/mobile/putong/core/data/MonetizationTreasure$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/MonetizationTreasure;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/MonetizationTreasure;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/tantanapp/common/data/MessageNanoAdapter;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    iput v0, p0, Lcom/tantanapp/common/data/ProtobufAdapter;->wireFormat:I

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/MonetizationTreasure;)I
    .locals 3

    .line 1
    const/4 p0, 0x1

    .line 2
    iget v0, p1, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->freeTimes:I

    .line 3
    .line 4
    invoke-static {p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    const/4 v0, 0x2

    .line 9
    iget v1, p1, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->gemRemaining:I

    .line 10
    .line 11
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    add-int/2addr p0, v0

    .line 16
    const/4 v0, 0x3

    .line 17
    iget v1, p1, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->gemConsumeAmount:I

    .line 18
    .line 19
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    add-int/2addr p0, v0

    .line 24
    const/4 v0, 0x4

    .line 25
    iget v1, p1, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->coinConsumeAmount:I

    .line 26
    .line 27
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    add-int/2addr p0, v0

    .line 32
    const/4 v0, 0x5

    .line 33
    iget v1, p1, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->expiringCount:I

    .line 34
    .line 35
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    add-int/2addr p0, v0

    .line 40
    const/4 v0, 0x6

    .line 41
    iget v1, p1, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->coinRemaining:I

    .line 42
    .line 43
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    add-int/2addr p0, v0

    .line 48
    const/4 v0, 0x7

    .line 49
    iget v1, p1, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->coinAmount:I

    .line 50
    .line 51
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    add-int/2addr p0, v0

    .line 56
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->treasurePrizeInfos:Ljava/util/List;

    .line 57
    .line 58
    if-eqz v0, :cond_0

    .line 59
    .line 60
    sget-object v1, Lcom/p1/mobile/putong/core/data/TreasurePrizeInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 61
    .line 62
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    const/16 v2, 0x8

    .line 67
    .line 68
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    add-int/2addr p0, v0

    .line 73
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->treasurePrizeAds:Ljava/util/List;

    .line 74
    .line 75
    if-eqz v0, :cond_1

    .line 76
    .line 77
    sget-object v1, Lcom/p1/mobile/putong/core/data/TreasurePrizeAd;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 78
    .line 79
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    const/16 v2, 0x9

    .line 84
    .line 85
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    add-int/2addr p0, v0

    .line 90
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->bags:Ljava/util/List;

    .line 91
    .line 92
    if-eqz v0, :cond_2

    .line 93
    .line 94
    sget-object v1, Lcom/p1/mobile/putong/core/data/Bags;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 95
    .line 96
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    const/16 v2, 0xa

    .line 101
    .line 102
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    add-int/2addr p0, v0

    .line 107
    :cond_2
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 108
    .line 109
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 110
    check-cast p1, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/MonetizationTreasure$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/MonetizationTreasure;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/MonetizationTreasure;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;-><init>()V

    .line 4
    .line 5
    .line 6
    :goto_0
    invoke-virtual {p1}, Ll/nc5;->u()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    sparse-switch v0, :sswitch_data_0

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->treasurePrizeInfos:Ljava/util/List;

    .line 14
    .line 15
    if-nez p1, :cond_0

    .line 16
    .line 17
    new-instance p1, Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->treasurePrizeInfos:Ljava/util/List;

    .line 23
    .line 24
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->treasurePrizeAds:Ljava/util/List;

    .line 25
    .line 26
    if-nez p1, :cond_1

    .line 27
    .line 28
    new-instance p1, Ljava/util/ArrayList;

    .line 29
    .line 30
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 31
    .line 32
    .line 33
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->treasurePrizeAds:Ljava/util/List;

    .line 34
    .line 35
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->bags:Ljava/util/List;

    .line 36
    .line 37
    if-nez p1, :cond_4

    .line 38
    .line 39
    new-instance p1, Ljava/util/ArrayList;

    .line 40
    .line 41
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 42
    .line 43
    .line 44
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->bags:Ljava/util/List;

    .line 45
    .line 46
    return-object p0

    .line 47
    :sswitch_0
    sget-object v0, Lcom/p1/mobile/putong/core/data/Bags;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 48
    .line 49
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    check-cast v0, Ljava/util/List;

    .line 58
    .line 59
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->bags:Ljava/util/List;

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :sswitch_1
    sget-object v0, Lcom/p1/mobile/putong/core/data/TreasurePrizeAd;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 63
    .line 64
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    check-cast v0, Ljava/util/List;

    .line 73
    .line 74
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->treasurePrizeAds:Ljava/util/List;

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :sswitch_2
    sget-object v0, Lcom/p1/mobile/putong/core/data/TreasurePrizeInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 78
    .line 79
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    check-cast v0, Ljava/util/List;

    .line 88
    .line 89
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->treasurePrizeInfos:Ljava/util/List;

    .line 90
    .line 91
    goto :goto_0

    .line 92
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    iput v0, p0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->coinAmount:I

    .line 97
    .line 98
    goto :goto_0

    .line 99
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    iput v0, p0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->coinRemaining:I

    .line 104
    .line 105
    goto :goto_0

    .line 106
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    iput v0, p0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->expiringCount:I

    .line 111
    .line 112
    goto :goto_0

    .line 113
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    iput v0, p0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->coinConsumeAmount:I

    .line 118
    .line 119
    goto :goto_0

    .line 120
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 121
    .line 122
    .line 123
    move-result v0

    .line 124
    iput v0, p0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->gemConsumeAmount:I

    .line 125
    .line 126
    goto :goto_0

    .line 127
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 128
    .line 129
    .line 130
    move-result v0

    .line 131
    iput v0, p0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->gemRemaining:I

    .line 132
    .line 133
    goto :goto_0

    .line 134
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 135
    .line 136
    .line 137
    move-result v0

    .line 138
    iput v0, p0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->freeTimes:I

    .line 139
    .line 140
    goto/16 :goto_0

    .line 141
    .line 142
    :sswitch_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->treasurePrizeInfos:Ljava/util/List;

    .line 143
    .line 144
    if-nez p1, :cond_2

    .line 145
    .line 146
    new-instance p1, Ljava/util/ArrayList;

    .line 147
    .line 148
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 149
    .line 150
    .line 151
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->treasurePrizeInfos:Ljava/util/List;

    .line 152
    .line 153
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->treasurePrizeAds:Ljava/util/List;

    .line 154
    .line 155
    if-nez p1, :cond_3

    .line 156
    .line 157
    new-instance p1, Ljava/util/ArrayList;

    .line 158
    .line 159
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 160
    .line 161
    .line 162
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->treasurePrizeAds:Ljava/util/List;

    .line 163
    .line 164
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->bags:Ljava/util/List;

    .line 165
    .line 166
    if-nez p1, :cond_4

    .line 167
    .line 168
    new-instance p1, Ljava/util/ArrayList;

    .line 169
    .line 170
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 171
    .line 172
    .line 173
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->bags:Ljava/util/List;

    .line 174
    .line 175
    :cond_4
    return-object p0

    .line 176
    nop

    .line 177
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_a
        0x8 -> :sswitch_9
        0x10 -> :sswitch_8
        0x18 -> :sswitch_7
        0x20 -> :sswitch_6
        0x28 -> :sswitch_5
        0x30 -> :sswitch_4
        0x38 -> :sswitch_3
        0x42 -> :sswitch_2
        0x4a -> :sswitch_1
        0x52 -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 177
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/MonetizationTreasure$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/MonetizationTreasure;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/MonetizationTreasure;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    iget v0, p1, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->freeTimes:I

    .line 3
    .line 4
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 5
    .line 6
    .line 7
    const/4 p0, 0x2

    .line 8
    iget v0, p1, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->gemRemaining:I

    .line 9
    .line 10
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 11
    .line 12
    .line 13
    const/4 p0, 0x3

    .line 14
    iget v0, p1, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->gemConsumeAmount:I

    .line 15
    .line 16
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 17
    .line 18
    .line 19
    const/4 p0, 0x4

    .line 20
    iget v0, p1, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->coinConsumeAmount:I

    .line 21
    .line 22
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 23
    .line 24
    .line 25
    const/4 p0, 0x5

    .line 26
    iget v0, p1, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->expiringCount:I

    .line 27
    .line 28
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 29
    .line 30
    .line 31
    const/4 p0, 0x6

    .line 32
    iget v0, p1, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->coinRemaining:I

    .line 33
    .line 34
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 35
    .line 36
    .line 37
    const/4 p0, 0x7

    .line 38
    iget v0, p1, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->coinAmount:I

    .line 39
    .line 40
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 41
    .line 42
    .line 43
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->treasurePrizeInfos:Ljava/util/List;

    .line 44
    .line 45
    if-eqz p0, :cond_0

    .line 46
    .line 47
    sget-object v0, Lcom/p1/mobile/putong/core/data/TreasurePrizeInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 48
    .line 49
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    const/16 v1, 0x8

    .line 54
    .line 55
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 56
    .line 57
    .line 58
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->treasurePrizeAds:Ljava/util/List;

    .line 59
    .line 60
    if-eqz p0, :cond_1

    .line 61
    .line 62
    sget-object v0, Lcom/p1/mobile/putong/core/data/TreasurePrizeAd;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 63
    .line 64
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    const/16 v1, 0x9

    .line 69
    .line 70
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 71
    .line 72
    .line 73
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->bags:Ljava/util/List;

    .line 74
    .line 75
    if-eqz p0, :cond_2

    .line 76
    .line 77
    sget-object p1, Lcom/p1/mobile/putong/core/data/Bags;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 78
    .line 79
    invoke-virtual {p1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    const/16 v0, 0xa

    .line 84
    .line 85
    invoke-virtual {p2, v0, p0, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 86
    .line 87
    .line 88
    :cond_2
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 89
    check-cast p1, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/MonetizationTreasure$1;->serialize(Lcom/p1/mobile/putong/core/data/MonetizationTreasure;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
