.class Lcom/p1/mobile/putong/core/data/NextStatus$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/NextStatus;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/NextStatus;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/NextStatus;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/NextStatus;->status:Lcom/p1/mobile/putong/core/data/AwardStatus;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    invoke-static {v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    :goto_0
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/NextStatus;->awards:Ljava/util/List;

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    sget-object v1, Lcom/p1/mobile/putong/core/data/AwardType;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 21
    .line 22
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    const/4 v2, 0x2

    .line 27
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    add-int/2addr p0, v0

    .line 32
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/NextStatus;->updateWay:Ljava/lang/String;

    .line 33
    .line 34
    if-eqz v0, :cond_2

    .line 35
    .line 36
    const/4 v1, 0x3

    .line 37
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    add-int/2addr p0, v0

    .line 42
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/NextStatus;->updateWayVal:Ljava/lang/String;

    .line 43
    .line 44
    if-eqz v0, :cond_3

    .line 45
    .line 46
    const/4 v1, 0x4

    .line 47
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    add-int/2addr p0, v0

    .line 52
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/NextStatus;->status:Lcom/p1/mobile/putong/core/data/AwardStatus;

    .line 53
    .line 54
    if-eqz v0, :cond_4

    .line 55
    .line 56
    const/4 v1, 0x5

    .line 57
    sget-object v2, Lcom/p1/mobile/putong/core/data/AwardStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 58
    .line 59
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    add-int/2addr p0, v0

    .line 64
    :cond_4
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 65
    .line 66
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 67
    check-cast p1, Lcom/p1/mobile/putong/core/data/NextStatus;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/NextStatus$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/NextStatus;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/NextStatus;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/NextStatus;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/NextStatus;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    move-object v1, v0

    .line 8
    :goto_0
    invoke-virtual {p1}, Ll/nc5;->u()I

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    const-string v3, ""

    .line 13
    .line 14
    if-eqz v2, :cond_9

    .line 15
    .line 16
    const/16 v4, 0x8

    .line 17
    .line 18
    if-eq v2, v4, :cond_8

    .line 19
    .line 20
    const/16 v4, 0x12

    .line 21
    .line 22
    if-eq v2, v4, :cond_7

    .line 23
    .line 24
    const/16 v4, 0x1a

    .line 25
    .line 26
    if-eq v2, v4, :cond_6

    .line 27
    .line 28
    const/16 v4, 0x22

    .line 29
    .line 30
    if-eq v2, v4, :cond_5

    .line 31
    .line 32
    const/16 v4, 0x2a

    .line 33
    .line 34
    if-eq v2, v4, :cond_4

    .line 35
    .line 36
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/NextStatus;->status:Lcom/p1/mobile/putong/core/data/AwardStatus;

    .line 37
    .line 38
    if-nez p1, :cond_0

    .line 39
    .line 40
    if-eqz v1, :cond_0

    .line 41
    .line 42
    sget-object p1, Lcom/p1/mobile/putong/core/data/AwardStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 43
    .line 44
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    check-cast p1, Lcom/p1/mobile/putong/core/data/AwardStatus;

    .line 53
    .line 54
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/NextStatus;->status:Lcom/p1/mobile/putong/core/data/AwardStatus;

    .line 55
    .line 56
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/NextStatus;->status:Lcom/p1/mobile/putong/core/data/AwardStatus;

    .line 57
    .line 58
    if-nez p1, :cond_1

    .line 59
    .line 60
    sget-object p1, Lcom/p1/mobile/putong/core/data/AwardStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 61
    .line 62
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    check-cast p1, Lcom/p1/mobile/putong/core/data/AwardStatus;

    .line 67
    .line 68
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/NextStatus;->status:Lcom/p1/mobile/putong/core/data/AwardStatus;

    .line 69
    .line 70
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/NextStatus;->awards:Ljava/util/List;

    .line 71
    .line 72
    if-nez p1, :cond_2

    .line 73
    .line 74
    new-instance p1, Ljava/util/ArrayList;

    .line 75
    .line 76
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 77
    .line 78
    .line 79
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/NextStatus;->awards:Ljava/util/List;

    .line 80
    .line 81
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/NextStatus;->updateWay:Ljava/lang/String;

    .line 82
    .line 83
    if-nez p1, :cond_3

    .line 84
    .line 85
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/NextStatus;->updateWay:Ljava/lang/String;

    .line 86
    .line 87
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/NextStatus;->updateWayVal:Ljava/lang/String;

    .line 88
    .line 89
    if-nez p1, :cond_e

    .line 90
    .line 91
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/NextStatus;->updateWayVal:Ljava/lang/String;

    .line 92
    .line 93
    return-object p0

    .line 94
    :cond_4
    sget-object v2, Lcom/p1/mobile/putong/core/data/AwardStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 95
    .line 96
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object v2

    .line 100
    check-cast v2, Lcom/p1/mobile/putong/core/data/AwardStatus;

    .line 101
    .line 102
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/NextStatus;->status:Lcom/p1/mobile/putong/core/data/AwardStatus;

    .line 103
    .line 104
    goto :goto_0

    .line 105
    :cond_5
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v2

    .line 109
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/NextStatus;->updateWayVal:Ljava/lang/String;

    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v2

    .line 116
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/NextStatus;->updateWay:Ljava/lang/String;

    .line 117
    .line 118
    goto :goto_0

    .line 119
    :cond_7
    sget-object v2, Lcom/p1/mobile/putong/core/data/AwardType;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 120
    .line 121
    invoke-virtual {v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 122
    .line 123
    .line 124
    move-result-object v2

    .line 125
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object v2

    .line 129
    check-cast v2, Ljava/util/List;

    .line 130
    .line 131
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/NextStatus;->awards:Ljava/util/List;

    .line 132
    .line 133
    goto :goto_0

    .line 134
    :cond_8
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 135
    .line 136
    .line 137
    move-result v1

    .line 138
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 139
    .line 140
    .line 141
    move-result-object v1

    .line 142
    goto/16 :goto_0

    .line 143
    .line 144
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/NextStatus;->status:Lcom/p1/mobile/putong/core/data/AwardStatus;

    .line 145
    .line 146
    if-nez p1, :cond_a

    .line 147
    .line 148
    if-eqz v1, :cond_a

    .line 149
    .line 150
    sget-object p1, Lcom/p1/mobile/putong/core/data/AwardStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 151
    .line 152
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 153
    .line 154
    .line 155
    move-result v1

    .line 156
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 157
    .line 158
    .line 159
    move-result-object p1

    .line 160
    check-cast p1, Lcom/p1/mobile/putong/core/data/AwardStatus;

    .line 161
    .line 162
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/NextStatus;->status:Lcom/p1/mobile/putong/core/data/AwardStatus;

    .line 163
    .line 164
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/NextStatus;->status:Lcom/p1/mobile/putong/core/data/AwardStatus;

    .line 165
    .line 166
    if-nez p1, :cond_b

    .line 167
    .line 168
    sget-object p1, Lcom/p1/mobile/putong/core/data/AwardStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 169
    .line 170
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 171
    .line 172
    .line 173
    move-result-object p1

    .line 174
    check-cast p1, Lcom/p1/mobile/putong/core/data/AwardStatus;

    .line 175
    .line 176
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/NextStatus;->status:Lcom/p1/mobile/putong/core/data/AwardStatus;

    .line 177
    .line 178
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/NextStatus;->awards:Ljava/util/List;

    .line 179
    .line 180
    if-nez p1, :cond_c

    .line 181
    .line 182
    new-instance p1, Ljava/util/ArrayList;

    .line 183
    .line 184
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 185
    .line 186
    .line 187
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/NextStatus;->awards:Ljava/util/List;

    .line 188
    .line 189
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/NextStatus;->updateWay:Ljava/lang/String;

    .line 190
    .line 191
    if-nez p1, :cond_d

    .line 192
    .line 193
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/NextStatus;->updateWay:Ljava/lang/String;

    .line 194
    .line 195
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/NextStatus;->updateWayVal:Ljava/lang/String;

    .line 196
    .line 197
    if-nez p1, :cond_e

    .line 198
    .line 199
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/NextStatus;->updateWayVal:Ljava/lang/String;

    .line 200
    .line 201
    :cond_e
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 202
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/NextStatus$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/NextStatus;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/NextStatus;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/NextStatus;->status:Lcom/p1/mobile/putong/core/data/AwardStatus;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/NextStatus;->awards:Ljava/util/List;

    .line 14
    .line 15
    if-eqz p0, :cond_1

    .line 16
    .line 17
    sget-object v0, Lcom/p1/mobile/putong/core/data/AwardType;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const/4 v1, 0x2

    .line 24
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 25
    .line 26
    .line 27
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/NextStatus;->updateWay:Ljava/lang/String;

    .line 28
    .line 29
    if-eqz p0, :cond_2

    .line 30
    .line 31
    const/4 v0, 0x3

    .line 32
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 33
    .line 34
    .line 35
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/NextStatus;->updateWayVal:Ljava/lang/String;

    .line 36
    .line 37
    if-eqz p0, :cond_3

    .line 38
    .line 39
    const/4 v0, 0x4

    .line 40
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 41
    .line 42
    .line 43
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/NextStatus;->status:Lcom/p1/mobile/putong/core/data/AwardStatus;

    .line 44
    .line 45
    if-eqz p0, :cond_4

    .line 46
    .line 47
    const/4 p1, 0x5

    .line 48
    sget-object v0, Lcom/p1/mobile/putong/core/data/AwardStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 49
    .line 50
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 51
    .line 52
    .line 53
    :cond_4
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 54
    check-cast p1, Lcom/p1/mobile/putong/core/data/NextStatus;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/NextStatus$1;->serialize(Lcom/p1/mobile/putong/core/data/NextStatus;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
