.class Lcom/p1/mobile/putong/core/data/Bags$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/Bags;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/Bags;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/Bags;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Bags;->id:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Bags;->parentType:Lcom/p1/mobile/putong/core/data/TreasurePrizeCategory;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    const/4 v1, 0x2

    .line 17
    sget-object v2, Lcom/p1/mobile/putong/core/data/TreasurePrizeCategory;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 18
    .line 19
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    add-int/2addr p0, v0

    .line 24
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Bags;->type:Lcom/p1/mobile/putong/core/data/TreasurePrizeType;

    .line 25
    .line 26
    if-eqz v0, :cond_2

    .line 27
    .line 28
    const/4 v1, 0x3

    .line 29
    sget-object v2, Lcom/p1/mobile/putong/core/data/TreasurePrizeType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 30
    .line 31
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    add-int/2addr p0, v0

    .line 36
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Bags;->name:Ljava/lang/String;

    .line 37
    .line 38
    if-eqz v0, :cond_3

    .line 39
    .line 40
    const/4 v1, 0x4

    .line 41
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    add-int/2addr p0, v0

    .line 46
    :cond_3
    const/4 v0, 0x5

    .line 47
    iget v1, p1, Lcom/p1/mobile/putong/core/data/Bags;->quantity:I

    .line 48
    .line 49
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    add-int/2addr p0, v0

    .line 54
    const/4 v0, 0x6

    .line 55
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/Bags;->expiredTime:J

    .line 56
    .line 57
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    add-int/2addr p0, v0

    .line 62
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 63
    .line 64
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 65
    check-cast p1, Lcom/p1/mobile/putong/core/data/Bags;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/Bags$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/Bags;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/Bags;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/Bags;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/Bags;-><init>()V

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
    if-eqz v0, :cond_9

    .line 13
    .line 14
    const/16 v2, 0xa

    .line 15
    .line 16
    if-eq v0, v2, :cond_8

    .line 17
    .line 18
    const/16 v2, 0x12

    .line 19
    .line 20
    if-eq v0, v2, :cond_7

    .line 21
    .line 22
    const/16 v2, 0x1a

    .line 23
    .line 24
    if-eq v0, v2, :cond_6

    .line 25
    .line 26
    const/16 v2, 0x22

    .line 27
    .line 28
    if-eq v0, v2, :cond_5

    .line 29
    .line 30
    const/16 v2, 0x28

    .line 31
    .line 32
    if-eq v0, v2, :cond_4

    .line 33
    .line 34
    const/16 v2, 0x30

    .line 35
    .line 36
    if-eq v0, v2, :cond_3

    .line 37
    .line 38
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Bags;->id:Ljava/lang/String;

    .line 39
    .line 40
    if-nez p1, :cond_0

    .line 41
    .line 42
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Bags;->id:Ljava/lang/String;

    .line 43
    .line 44
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Bags;->parentType:Lcom/p1/mobile/putong/core/data/TreasurePrizeCategory;

    .line 45
    .line 46
    if-nez p1, :cond_1

    .line 47
    .line 48
    sget-object p1, Lcom/p1/mobile/putong/core/data/TreasurePrizeCategory;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 49
    .line 50
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    check-cast p1, Lcom/p1/mobile/putong/core/data/TreasurePrizeCategory;

    .line 55
    .line 56
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Bags;->parentType:Lcom/p1/mobile/putong/core/data/TreasurePrizeCategory;

    .line 57
    .line 58
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Bags;->type:Lcom/p1/mobile/putong/core/data/TreasurePrizeType;

    .line 59
    .line 60
    if-nez p1, :cond_2

    .line 61
    .line 62
    sget-object p1, Lcom/p1/mobile/putong/core/data/TreasurePrizeType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 63
    .line 64
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    check-cast p1, Lcom/p1/mobile/putong/core/data/TreasurePrizeType;

    .line 69
    .line 70
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Bags;->type:Lcom/p1/mobile/putong/core/data/TreasurePrizeType;

    .line 71
    .line 72
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Bags;->name:Ljava/lang/String;

    .line 73
    .line 74
    if-nez p1, :cond_d

    .line 75
    .line 76
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Bags;->name:Ljava/lang/String;

    .line 77
    .line 78
    return-object p0

    .line 79
    :cond_3
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 80
    .line 81
    .line 82
    move-result-wide v0

    .line 83
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/Bags;->expiredTime:J

    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_4
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    iput v0, p0, Lcom/p1/mobile/putong/core/data/Bags;->quantity:I

    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_5
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Bags;->name:Ljava/lang/String;

    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_6
    sget-object v0, Lcom/p1/mobile/putong/core/data/TreasurePrizeType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 101
    .line 102
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    check-cast v0, Lcom/p1/mobile/putong/core/data/TreasurePrizeType;

    .line 107
    .line 108
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Bags;->type:Lcom/p1/mobile/putong/core/data/TreasurePrizeType;

    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_7
    sget-object v0, Lcom/p1/mobile/putong/core/data/TreasurePrizeCategory;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 112
    .line 113
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    check-cast v0, Lcom/p1/mobile/putong/core/data/TreasurePrizeCategory;

    .line 118
    .line 119
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Bags;->parentType:Lcom/p1/mobile/putong/core/data/TreasurePrizeCategory;

    .line 120
    .line 121
    goto :goto_0

    .line 122
    :cond_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Bags;->id:Ljava/lang/String;

    .line 127
    .line 128
    goto :goto_0

    .line 129
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Bags;->id:Ljava/lang/String;

    .line 130
    .line 131
    if-nez p1, :cond_a

    .line 132
    .line 133
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Bags;->id:Ljava/lang/String;

    .line 134
    .line 135
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Bags;->parentType:Lcom/p1/mobile/putong/core/data/TreasurePrizeCategory;

    .line 136
    .line 137
    if-nez p1, :cond_b

    .line 138
    .line 139
    sget-object p1, Lcom/p1/mobile/putong/core/data/TreasurePrizeCategory;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 140
    .line 141
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    check-cast p1, Lcom/p1/mobile/putong/core/data/TreasurePrizeCategory;

    .line 146
    .line 147
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Bags;->parentType:Lcom/p1/mobile/putong/core/data/TreasurePrizeCategory;

    .line 148
    .line 149
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Bags;->type:Lcom/p1/mobile/putong/core/data/TreasurePrizeType;

    .line 150
    .line 151
    if-nez p1, :cond_c

    .line 152
    .line 153
    sget-object p1, Lcom/p1/mobile/putong/core/data/TreasurePrizeType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 154
    .line 155
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 156
    .line 157
    .line 158
    move-result-object p1

    .line 159
    check-cast p1, Lcom/p1/mobile/putong/core/data/TreasurePrizeType;

    .line 160
    .line 161
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Bags;->type:Lcom/p1/mobile/putong/core/data/TreasurePrizeType;

    .line 162
    .line 163
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Bags;->name:Ljava/lang/String;

    .line 164
    .line 165
    if-nez p1, :cond_d

    .line 166
    .line 167
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Bags;->name:Ljava/lang/String;

    .line 168
    .line 169
    :cond_d
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 170
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/Bags$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/Bags;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/Bags;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Bags;->id:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Bags;->parentType:Lcom/p1/mobile/putong/core/data/TreasurePrizeCategory;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    const/4 v0, 0x2

    .line 14
    sget-object v1, Lcom/p1/mobile/putong/core/data/TreasurePrizeCategory;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 15
    .line 16
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Bags;->type:Lcom/p1/mobile/putong/core/data/TreasurePrizeType;

    .line 20
    .line 21
    if-eqz p0, :cond_2

    .line 22
    .line 23
    const/4 v0, 0x3

    .line 24
    sget-object v1, Lcom/p1/mobile/putong/core/data/TreasurePrizeType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 25
    .line 26
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 27
    .line 28
    .line 29
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Bags;->name:Ljava/lang/String;

    .line 30
    .line 31
    if-eqz p0, :cond_3

    .line 32
    .line 33
    const/4 v0, 0x4

    .line 34
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 35
    .line 36
    .line 37
    :cond_3
    const/4 p0, 0x5

    .line 38
    iget v0, p1, Lcom/p1/mobile/putong/core/data/Bags;->quantity:I

    .line 39
    .line 40
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 41
    .line 42
    .line 43
    const/4 p0, 0x6

    .line 44
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/Bags;->expiredTime:J

    .line 45
    .line 46
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 50
    check-cast p1, Lcom/p1/mobile/putong/core/data/Bags;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/Bags$1;->serialize(Lcom/p1/mobile/putong/core/data/Bags;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
