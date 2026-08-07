.class Lcom/p1/mobile/putong/core/data/Coupon$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/Coupon;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/Coupon;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/Coupon;)I
    .locals 3

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-wide v0, p1, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 3
    .line 4
    invoke-static {p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const/4 v1, 0x2

    .line 13
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    add-int/2addr p0, v0

    .line 18
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Coupon;->name:Ljava/lang/String;

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    const/16 v1, 0x33

    .line 23
    .line 24
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    add-int/2addr p0, v0

    .line 29
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Coupon;->tags:Ljava/util/List;

    .line 30
    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 34
    .line 35
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    const/16 v2, 0x34

    .line 40
    .line 41
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    add-int/2addr p0, v0

    .line 46
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Coupon;->couponType:Ljava/lang/String;

    .line 47
    .line 48
    if-eqz v0, :cond_3

    .line 49
    .line 50
    const/16 v1, 0x35

    .line 51
    .line 52
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    add-int/2addr p0, v0

    .line 57
    :cond_3
    const/16 v0, 0x36

    .line 58
    .line 59
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/Coupon;->ignoreBeginTime:Z

    .line 60
    .line 61
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    add-int/2addr p0, v0

    .line 66
    const/16 v0, 0x37

    .line 67
    .line 68
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/Coupon;->ignoreEndTime:Z

    .line 69
    .line 70
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    add-int/2addr p0, v0

    .line 75
    const/16 v0, 0x38

    .line 76
    .line 77
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/Coupon;->beginTime:D

    .line 78
    .line 79
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    add-int/2addr p0, v0

    .line 84
    const/16 v0, 0x39

    .line 85
    .line 86
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/Coupon;->endTime:D

    .line 87
    .line 88
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    add-int/2addr p0, v0

    .line 93
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Coupon;->condition:Lcom/p1/mobile/putong/core/data/Condition;

    .line 94
    .line 95
    if-eqz v0, :cond_4

    .line 96
    .line 97
    const/16 v1, 0x3a

    .line 98
    .line 99
    sget-object v2, Lcom/p1/mobile/putong/core/data/Condition;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 100
    .line 101
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    add-int/2addr p0, v0

    .line 106
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Coupon;->benefit:Lcom/p1/mobile/putong/core/data/Benefit;

    .line 107
    .line 108
    if-eqz v0, :cond_5

    .line 109
    .line 110
    const/16 v1, 0x3b

    .line 111
    .line 112
    sget-object v2, Lcom/p1/mobile/putong/core/data/Benefit;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 113
    .line 114
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    add-int/2addr p0, v0

    .line 119
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Coupon;->userCouponID:Ljava/lang/String;

    .line 120
    .line 121
    if-eqz v0, :cond_6

    .line 122
    .line 123
    const/16 v1, 0x3c

    .line 124
    .line 125
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    add-int/2addr p0, v0

    .line 130
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Coupon;->couponID:Ljava/lang/String;

    .line 131
    .line 132
    if-eqz v0, :cond_7

    .line 133
    .line 134
    const/16 v1, 0x3d

    .line 135
    .line 136
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 137
    .line 138
    .line 139
    move-result v0

    .line 140
    add-int/2addr p0, v0

    .line 141
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Coupon;->localApplyPromotions:Ljava/util/List;

    .line 142
    .line 143
    if-eqz v0, :cond_8

    .line 144
    .line 145
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 146
    .line 147
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 148
    .line 149
    .line 150
    move-result-object v1

    .line 151
    const/16 v2, 0x3e

    .line 152
    .line 153
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    add-int/2addr p0, v0

    .line 158
    :cond_8
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 159
    .line 160
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 161
    check-cast p1, Lcom/p1/mobile/putong/core/data/Coupon;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/Coupon$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/Coupon;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/Coupon;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/Coupon;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/Coupon;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->name:Ljava/lang/String;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->name:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->tags:Ljava/util/List;

    .line 22
    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    new-instance p1, Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->tags:Ljava/util/List;

    .line 31
    .line 32
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->couponType:Ljava/lang/String;

    .line 33
    .line 34
    if-nez p1, :cond_2

    .line 35
    .line 36
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->couponType:Ljava/lang/String;

    .line 37
    .line 38
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->condition:Lcom/p1/mobile/putong/core/data/Condition;

    .line 39
    .line 40
    if-nez p1, :cond_3

    .line 41
    .line 42
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Condition;->new_()Lcom/p1/mobile/putong/core/data/Condition;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->condition:Lcom/p1/mobile/putong/core/data/Condition;

    .line 47
    .line 48
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->benefit:Lcom/p1/mobile/putong/core/data/Benefit;

    .line 49
    .line 50
    if-nez p1, :cond_4

    .line 51
    .line 52
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Benefit;->new_()Lcom/p1/mobile/putong/core/data/Benefit;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->benefit:Lcom/p1/mobile/putong/core/data/Benefit;

    .line 57
    .line 58
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->userCouponID:Ljava/lang/String;

    .line 59
    .line 60
    if-nez p1, :cond_5

    .line 61
    .line 62
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->userCouponID:Ljava/lang/String;

    .line 63
    .line 64
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->couponID:Ljava/lang/String;

    .line 65
    .line 66
    if-nez p1, :cond_6

    .line 67
    .line 68
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->couponID:Ljava/lang/String;

    .line 69
    .line 70
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->newCustomerPromotionConfig:Ljava/lang/String;

    .line 71
    .line 72
    if-nez p1, :cond_7

    .line 73
    .line 74
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->newCustomerPromotionConfig:Ljava/lang/String;

    .line 75
    .line 76
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->localApplyPromotions:Ljava/util/List;

    .line 77
    .line 78
    if-nez p1, :cond_10

    .line 79
    .line 80
    new-instance p1, Ljava/util/ArrayList;

    .line 81
    .line 82
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 83
    .line 84
    .line 85
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->localApplyPromotions:Ljava/util/List;

    .line 86
    .line 87
    return-object p0

    .line 88
    :sswitch_0
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 89
    .line 90
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    check-cast v0, Ljava/util/List;

    .line 99
    .line 100
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Coupon;->localApplyPromotions:Ljava/util/List;

    .line 101
    .line 102
    goto :goto_0

    .line 103
    :sswitch_1
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Coupon;->couponID:Ljava/lang/String;

    .line 108
    .line 109
    goto :goto_0

    .line 110
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Coupon;->userCouponID:Ljava/lang/String;

    .line 115
    .line 116
    goto :goto_0

    .line 117
    :sswitch_3
    sget-object v0, Lcom/p1/mobile/putong/core/data/Benefit;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 118
    .line 119
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    check-cast v0, Lcom/p1/mobile/putong/core/data/Benefit;

    .line 124
    .line 125
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Coupon;->benefit:Lcom/p1/mobile/putong/core/data/Benefit;

    .line 126
    .line 127
    goto :goto_0

    .line 128
    :sswitch_4
    sget-object v0, Lcom/p1/mobile/putong/core/data/Condition;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 129
    .line 130
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    check-cast v0, Lcom/p1/mobile/putong/core/data/Condition;

    .line 135
    .line 136
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Coupon;->condition:Lcom/p1/mobile/putong/core/data/Condition;

    .line 137
    .line 138
    goto/16 :goto_0

    .line 139
    .line 140
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 141
    .line 142
    .line 143
    move-result-wide v0

    .line 144
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/Coupon;->endTime:D

    .line 145
    .line 146
    goto/16 :goto_0

    .line 147
    .line 148
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 149
    .line 150
    .line 151
    move-result-wide v0

    .line 152
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/Coupon;->beginTime:D

    .line 153
    .line 154
    goto/16 :goto_0

    .line 155
    .line 156
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 157
    .line 158
    .line 159
    move-result v0

    .line 160
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/Coupon;->ignoreEndTime:Z

    .line 161
    .line 162
    goto/16 :goto_0

    .line 163
    .line 164
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 165
    .line 166
    .line 167
    move-result v0

    .line 168
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/Coupon;->ignoreBeginTime:Z

    .line 169
    .line 170
    goto/16 :goto_0

    .line 171
    .line 172
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object v0

    .line 176
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Coupon;->couponType:Ljava/lang/String;

    .line 177
    .line 178
    goto/16 :goto_0

    .line 179
    .line 180
    :sswitch_a
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 181
    .line 182
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 183
    .line 184
    .line 185
    move-result-object v0

    .line 186
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 187
    .line 188
    .line 189
    move-result-object v0

    .line 190
    check-cast v0, Ljava/util/List;

    .line 191
    .line 192
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Coupon;->tags:Ljava/util/List;

    .line 193
    .line 194
    goto/16 :goto_0

    .line 195
    .line 196
    :sswitch_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 197
    .line 198
    .line 199
    move-result-object v0

    .line 200
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Coupon;->name:Ljava/lang/String;

    .line 201
    .line 202
    goto/16 :goto_0

    .line 203
    .line 204
    :sswitch_c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 205
    .line 206
    .line 207
    move-result-object v0

    .line 208
    iput-object v0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 209
    .line 210
    goto/16 :goto_0

    .line 211
    .line 212
    :sswitch_d
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 213
    .line 214
    .line 215
    move-result-wide v0

    .line 216
    iput-wide v0, p0, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 217
    .line 218
    goto/16 :goto_0

    .line 219
    .line 220
    :sswitch_e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->name:Ljava/lang/String;

    .line 221
    .line 222
    if-nez p1, :cond_8

    .line 223
    .line 224
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->name:Ljava/lang/String;

    .line 225
    .line 226
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->tags:Ljava/util/List;

    .line 227
    .line 228
    if-nez p1, :cond_9

    .line 229
    .line 230
    new-instance p1, Ljava/util/ArrayList;

    .line 231
    .line 232
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 233
    .line 234
    .line 235
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->tags:Ljava/util/List;

    .line 236
    .line 237
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->couponType:Ljava/lang/String;

    .line 238
    .line 239
    if-nez p1, :cond_a

    .line 240
    .line 241
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->couponType:Ljava/lang/String;

    .line 242
    .line 243
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->condition:Lcom/p1/mobile/putong/core/data/Condition;

    .line 244
    .line 245
    if-nez p1, :cond_b

    .line 246
    .line 247
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Condition;->new_()Lcom/p1/mobile/putong/core/data/Condition;

    .line 248
    .line 249
    .line 250
    move-result-object p1

    .line 251
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->condition:Lcom/p1/mobile/putong/core/data/Condition;

    .line 252
    .line 253
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->benefit:Lcom/p1/mobile/putong/core/data/Benefit;

    .line 254
    .line 255
    if-nez p1, :cond_c

    .line 256
    .line 257
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Benefit;->new_()Lcom/p1/mobile/putong/core/data/Benefit;

    .line 258
    .line 259
    .line 260
    move-result-object p1

    .line 261
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->benefit:Lcom/p1/mobile/putong/core/data/Benefit;

    .line 262
    .line 263
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->userCouponID:Ljava/lang/String;

    .line 264
    .line 265
    if-nez p1, :cond_d

    .line 266
    .line 267
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->userCouponID:Ljava/lang/String;

    .line 268
    .line 269
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->couponID:Ljava/lang/String;

    .line 270
    .line 271
    if-nez p1, :cond_e

    .line 272
    .line 273
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->couponID:Ljava/lang/String;

    .line 274
    .line 275
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->newCustomerPromotionConfig:Ljava/lang/String;

    .line 276
    .line 277
    if-nez p1, :cond_f

    .line 278
    .line 279
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->newCustomerPromotionConfig:Ljava/lang/String;

    .line 280
    .line 281
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->localApplyPromotions:Ljava/util/List;

    .line 282
    .line 283
    if-nez p1, :cond_10

    .line 284
    .line 285
    new-instance p1, Ljava/util/ArrayList;

    .line 286
    .line 287
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 288
    .line 289
    .line 290
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->localApplyPromotions:Ljava/util/List;

    .line 291
    .line 292
    :cond_10
    return-object p0

    .line 293
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_e
        0x8 -> :sswitch_d
        0x12 -> :sswitch_c
        0x19a -> :sswitch_b
        0x1a2 -> :sswitch_a
        0x1aa -> :sswitch_9
        0x1b0 -> :sswitch_8
        0x1b8 -> :sswitch_7
        0x1c1 -> :sswitch_6
        0x1c9 -> :sswitch_5
        0x1d2 -> :sswitch_4
        0x1da -> :sswitch_3
        0x1e2 -> :sswitch_2
        0x1ea -> :sswitch_1
        0x1f2 -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 293
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/Coupon$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/Coupon;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/Coupon;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-wide v0, p1, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 3
    .line 4
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x2

    .line 12
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Coupon;->name:Ljava/lang/String;

    .line 16
    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    const/16 v0, 0x33

    .line 20
    .line 21
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 22
    .line 23
    .line 24
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Coupon;->tags:Ljava/util/List;

    .line 25
    .line 26
    if-eqz p0, :cond_2

    .line 27
    .line 28
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 29
    .line 30
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const/16 v1, 0x34

    .line 35
    .line 36
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 37
    .line 38
    .line 39
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Coupon;->couponType:Ljava/lang/String;

    .line 40
    .line 41
    if-eqz p0, :cond_3

    .line 42
    .line 43
    const/16 v0, 0x35

    .line 44
    .line 45
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 46
    .line 47
    .line 48
    :cond_3
    const/16 p0, 0x36

    .line 49
    .line 50
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/Coupon;->ignoreBeginTime:Z

    .line 51
    .line 52
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 53
    .line 54
    .line 55
    const/16 p0, 0x37

    .line 56
    .line 57
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/Coupon;->ignoreEndTime:Z

    .line 58
    .line 59
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 60
    .line 61
    .line 62
    const/16 p0, 0x38

    .line 63
    .line 64
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/Coupon;->beginTime:D

    .line 65
    .line 66
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 67
    .line 68
    .line 69
    const/16 p0, 0x39

    .line 70
    .line 71
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/Coupon;->endTime:D

    .line 72
    .line 73
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 74
    .line 75
    .line 76
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Coupon;->condition:Lcom/p1/mobile/putong/core/data/Condition;

    .line 77
    .line 78
    if-eqz p0, :cond_4

    .line 79
    .line 80
    const/16 v0, 0x3a

    .line 81
    .line 82
    sget-object v1, Lcom/p1/mobile/putong/core/data/Condition;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 83
    .line 84
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 85
    .line 86
    .line 87
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Coupon;->benefit:Lcom/p1/mobile/putong/core/data/Benefit;

    .line 88
    .line 89
    if-eqz p0, :cond_5

    .line 90
    .line 91
    const/16 v0, 0x3b

    .line 92
    .line 93
    sget-object v1, Lcom/p1/mobile/putong/core/data/Benefit;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 94
    .line 95
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 96
    .line 97
    .line 98
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Coupon;->userCouponID:Ljava/lang/String;

    .line 99
    .line 100
    if-eqz p0, :cond_6

    .line 101
    .line 102
    const/16 v0, 0x3c

    .line 103
    .line 104
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 105
    .line 106
    .line 107
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Coupon;->couponID:Ljava/lang/String;

    .line 108
    .line 109
    if-eqz p0, :cond_7

    .line 110
    .line 111
    const/16 v0, 0x3d

    .line 112
    .line 113
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 114
    .line 115
    .line 116
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Coupon;->localApplyPromotions:Ljava/util/List;

    .line 117
    .line 118
    if-eqz p0, :cond_8

    .line 119
    .line 120
    sget-object p1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 121
    .line 122
    invoke-virtual {p1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    const/16 v0, 0x3e

    .line 127
    .line 128
    invoke-virtual {p2, v0, p0, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 129
    .line 130
    .line 131
    :cond_8
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 132
    check-cast p1, Lcom/p1/mobile/putong/core/data/Coupon;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/Coupon$1;->serialize(Lcom/p1/mobile/putong/core/data/Coupon;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
