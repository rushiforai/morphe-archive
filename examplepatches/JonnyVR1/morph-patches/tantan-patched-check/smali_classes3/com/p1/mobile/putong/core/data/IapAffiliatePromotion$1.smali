.class Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->promotionName:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-static {v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    :goto_0
    const/4 v0, 0x2

    .line 13
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->promotionHitId:J

    .line 14
    .line 15
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    add-int/2addr p0, v0

    .line 20
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->promotionType:Ljava/lang/String;

    .line 21
    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    const/4 v1, 0x3

    .line 25
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    add-int/2addr p0, v0

    .line 30
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->discount:Ljava/lang/String;

    .line 31
    .line 32
    if-eqz v0, :cond_2

    .line 33
    .line 34
    const/4 v1, 0x4

    .line 35
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    add-int/2addr p0, v0

    .line 40
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->productType:Ljava/lang/String;

    .line 41
    .line 42
    if-eqz v0, :cond_3

    .line 43
    .line 44
    const/4 v1, 0x5

    .line 45
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    add-int/2addr p0, v0

    .line 50
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->productId:Ljava/lang/String;

    .line 51
    .line 52
    if-eqz v0, :cond_4

    .line 53
    .line 54
    const/4 v1, 0x6

    .line 55
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    add-int/2addr p0, v0

    .line 60
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->iapId:Ljava/lang/String;

    .line 61
    .line 62
    if-eqz v0, :cond_5

    .line 63
    .line 64
    const/4 v1, 0x7

    .line 65
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    add-int/2addr p0, v0

    .line 70
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->offerId:Ljava/lang/String;

    .line 71
    .line 72
    if-eqz v0, :cond_6

    .line 73
    .line 74
    const/16 v1, 0x8

    .line 75
    .line 76
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    add-int/2addr p0, v0

    .line 81
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->offerType:Ljava/lang/String;

    .line 82
    .line 83
    if-eqz v0, :cond_7

    .line 84
    .line 85
    const/16 v1, 0x9

    .line 86
    .line 87
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    add-int/2addr p0, v0

    .line 92
    :cond_7
    const/16 v0, 0xa

    .line 93
    .line 94
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->startTime:J

    .line 95
    .line 96
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    add-int/2addr p0, v0

    .line 101
    const/16 v0, 0xb

    .line 102
    .line 103
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->endTime:J

    .line 104
    .line 105
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    add-int/2addr p0, v0

    .line 110
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->displayConfig:Ljava/util/Map;

    .line 111
    .line 112
    if-eqz v0, :cond_8

    .line 113
    .line 114
    sget-object v1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 115
    .line 116
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->MAP_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    const/16 v2, 0xc

    .line 121
    .line 122
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    add-int/2addr p0, v0

    .line 127
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->extraConfig:Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionExtraConfig;

    .line 128
    .line 129
    if-eqz v0, :cond_9

    .line 130
    .line 131
    const/16 v1, 0xd

    .line 132
    .line 133
    sget-object v2, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionExtraConfig;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 134
    .line 135
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 136
    .line 137
    .line 138
    move-result v0

    .line 139
    add-int/2addr p0, v0

    .line 140
    :cond_9
    const/16 v0, 0xe

    .line 141
    .line 142
    iget v1, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->ftDays:I

    .line 143
    .line 144
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 145
    .line 146
    .line 147
    move-result v0

    .line 148
    add-int/2addr p0, v0

    .line 149
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 150
    .line 151
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 152
    check-cast p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;-><init>()V

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
    const-string v1, ""

    .line 11
    .line 12
    sparse-switch v0, :sswitch_data_0

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->promotionName:Ljava/lang/String;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->promotionName:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->promotionType:Ljava/lang/String;

    .line 22
    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->promotionType:Ljava/lang/String;

    .line 26
    .line 27
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->productType:Ljava/lang/String;

    .line 28
    .line 29
    if-nez p1, :cond_2

    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->productType:Ljava/lang/String;

    .line 32
    .line 33
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->productId:Ljava/lang/String;

    .line 34
    .line 35
    if-nez p1, :cond_3

    .line 36
    .line 37
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->productId:Ljava/lang/String;

    .line 38
    .line 39
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->iapId:Ljava/lang/String;

    .line 40
    .line 41
    if-nez p1, :cond_8

    .line 42
    .line 43
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->iapId:Ljava/lang/String;

    .line 44
    .line 45
    return-object p0

    .line 46
    :sswitch_0
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    iput v0, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->ftDays:I

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :sswitch_1
    sget-object v0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionExtraConfig;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 54
    .line 55
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    check-cast v0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionExtraConfig;

    .line 60
    .line 61
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->extraConfig:Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionExtraConfig;

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :sswitch_2
    sget-object v0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 65
    .line 66
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->MAP_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    check-cast v0, Ljava/util/Map;

    .line 75
    .line 76
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->displayConfig:Ljava/util/Map;

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 80
    .line 81
    .line 82
    move-result-wide v0

    .line 83
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->endTime:J

    .line 84
    .line 85
    goto :goto_0

    .line 86
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 87
    .line 88
    .line 89
    move-result-wide v0

    .line 90
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->startTime:J

    .line 91
    .line 92
    goto :goto_0

    .line 93
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->offerType:Ljava/lang/String;

    .line 98
    .line 99
    goto :goto_0

    .line 100
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->offerId:Ljava/lang/String;

    .line 105
    .line 106
    goto :goto_0

    .line 107
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->iapId:Ljava/lang/String;

    .line 112
    .line 113
    goto :goto_0

    .line 114
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->productId:Ljava/lang/String;

    .line 119
    .line 120
    goto :goto_0

    .line 121
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->productType:Ljava/lang/String;

    .line 126
    .line 127
    goto :goto_0

    .line 128
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->discount:Ljava/lang/String;

    .line 133
    .line 134
    goto/16 :goto_0

    .line 135
    .line 136
    :sswitch_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->promotionType:Ljava/lang/String;

    .line 141
    .line 142
    goto/16 :goto_0

    .line 143
    .line 144
    :sswitch_c
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 145
    .line 146
    .line 147
    move-result-wide v0

    .line 148
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->promotionHitId:J

    .line 149
    .line 150
    goto/16 :goto_0

    .line 151
    .line 152
    :sswitch_d
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->promotionName:Ljava/lang/String;

    .line 157
    .line 158
    goto/16 :goto_0

    .line 159
    .line 160
    :sswitch_e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->promotionName:Ljava/lang/String;

    .line 161
    .line 162
    if-nez p1, :cond_4

    .line 163
    .line 164
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->promotionName:Ljava/lang/String;

    .line 165
    .line 166
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->promotionType:Ljava/lang/String;

    .line 167
    .line 168
    if-nez p1, :cond_5

    .line 169
    .line 170
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->promotionType:Ljava/lang/String;

    .line 171
    .line 172
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->productType:Ljava/lang/String;

    .line 173
    .line 174
    if-nez p1, :cond_6

    .line 175
    .line 176
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->productType:Ljava/lang/String;

    .line 177
    .line 178
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->productId:Ljava/lang/String;

    .line 179
    .line 180
    if-nez p1, :cond_7

    .line 181
    .line 182
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->productId:Ljava/lang/String;

    .line 183
    .line 184
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->iapId:Ljava/lang/String;

    .line 185
    .line 186
    if-nez p1, :cond_8

    .line 187
    .line 188
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->iapId:Ljava/lang/String;

    .line 189
    .line 190
    :cond_8
    return-object p0

    .line 191
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_e
        0xa -> :sswitch_d
        0x10 -> :sswitch_c
        0x1a -> :sswitch_b
        0x22 -> :sswitch_a
        0x2a -> :sswitch_9
        0x32 -> :sswitch_8
        0x3a -> :sswitch_7
        0x42 -> :sswitch_6
        0x4a -> :sswitch_5
        0x50 -> :sswitch_4
        0x58 -> :sswitch_3
        0x62 -> :sswitch_2
        0x6a -> :sswitch_1
        0x70 -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 191
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->promotionName:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 7
    .line 8
    .line 9
    :cond_0
    const/4 p0, 0x2

    .line 10
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->promotionHitId:J

    .line 11
    .line 12
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->promotionType:Ljava/lang/String;

    .line 16
    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    const/4 v0, 0x3

    .line 20
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->discount:Ljava/lang/String;

    .line 24
    .line 25
    if-eqz p0, :cond_2

    .line 26
    .line 27
    const/4 v0, 0x4

    .line 28
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 29
    .line 30
    .line 31
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->productType:Ljava/lang/String;

    .line 32
    .line 33
    if-eqz p0, :cond_3

    .line 34
    .line 35
    const/4 v0, 0x5

    .line 36
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 37
    .line 38
    .line 39
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->productId:Ljava/lang/String;

    .line 40
    .line 41
    if-eqz p0, :cond_4

    .line 42
    .line 43
    const/4 v0, 0x6

    .line 44
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 45
    .line 46
    .line 47
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->iapId:Ljava/lang/String;

    .line 48
    .line 49
    if-eqz p0, :cond_5

    .line 50
    .line 51
    const/4 v0, 0x7

    .line 52
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 53
    .line 54
    .line 55
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->offerId:Ljava/lang/String;

    .line 56
    .line 57
    if-eqz p0, :cond_6

    .line 58
    .line 59
    const/16 v0, 0x8

    .line 60
    .line 61
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 62
    .line 63
    .line 64
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->offerType:Ljava/lang/String;

    .line 65
    .line 66
    if-eqz p0, :cond_7

    .line 67
    .line 68
    const/16 v0, 0x9

    .line 69
    .line 70
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 71
    .line 72
    .line 73
    :cond_7
    const/16 p0, 0xa

    .line 74
    .line 75
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->startTime:J

    .line 76
    .line 77
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 78
    .line 79
    .line 80
    const/16 p0, 0xb

    .line 81
    .line 82
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->endTime:J

    .line 83
    .line 84
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 85
    .line 86
    .line 87
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->displayConfig:Ljava/util/Map;

    .line 88
    .line 89
    if-eqz p0, :cond_8

    .line 90
    .line 91
    sget-object v0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 92
    .line 93
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->MAP_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    const/16 v1, 0xc

    .line 98
    .line 99
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 100
    .line 101
    .line 102
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->extraConfig:Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionExtraConfig;

    .line 103
    .line 104
    if-eqz p0, :cond_9

    .line 105
    .line 106
    const/16 v0, 0xd

    .line 107
    .line 108
    sget-object v1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionExtraConfig;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 109
    .line 110
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 111
    .line 112
    .line 113
    :cond_9
    const/16 p0, 0xe

    .line 114
    .line 115
    iget p1, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->ftDays:I

    .line 116
    .line 117
    invoke-virtual {p2, p0, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 118
    .line 119
    .line 120
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 121
    check-cast p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion$1;->serialize(Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
