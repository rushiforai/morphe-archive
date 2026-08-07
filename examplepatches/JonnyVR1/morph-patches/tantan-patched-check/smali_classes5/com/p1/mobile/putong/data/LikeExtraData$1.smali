.class Lcom/p1/mobile/putong/data/LikeExtraData$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/LikeExtraData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/LikeExtraData;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/LikeExtraData;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LikeExtraData;->swipeExtraScData:Lcom/p1/mobile/putong/data/SwipeExtraScData;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    sget-object v1, Lcom/p1/mobile/putong/data/SwipeExtraScData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    invoke-static {v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    :goto_0
    iget-object v0, p1, Lcom/p1/mobile/putong/data/LikeExtraData;->matchScData:Lcom/p1/mobile/putong/data/MatchScData;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    const/4 v1, 0x2

    .line 19
    sget-object v2, Lcom/p1/mobile/putong/data/MatchScData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 20
    .line 21
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    add-int/2addr p0, v0

    .line 26
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/LikeExtraData;->status:Lcom/p1/mobile/putong/data/MatchFrom;

    .line 27
    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    const/4 v1, 0x3

    .line 31
    sget-object v2, Lcom/p1/mobile/putong/data/MatchFrom;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 32
    .line 33
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    add-int/2addr p0, v0

    .line 38
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/data/LikeExtraData;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 39
    .line 40
    if-eqz v0, :cond_3

    .line 41
    .line 42
    const/4 v1, 0x4

    .line 43
    sget-object v2, Lcom/p1/mobile/putong/data/RelationshipStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 44
    .line 45
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    add-int/2addr p0, v0

    .line 50
    :cond_3
    const/4 v0, 0x5

    .line 51
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/LikeExtraData;->isSelectedUser:Z

    .line 52
    .line 53
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    add-int/2addr p0, v0

    .line 58
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 59
    .line 60
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 61
    check-cast p1, Lcom/p1/mobile/putong/data/LikeExtraData;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/LikeExtraData$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/LikeExtraData;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/LikeExtraData;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/LikeExtraData;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/data/LikeExtraData;-><init>(Ll/yer;)V

    .line 5
    .line 6
    .line 7
    :goto_0
    invoke-virtual {p1}, Ll/nc5;->u()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_8

    .line 12
    .line 13
    const/16 v1, 0xa

    .line 14
    .line 15
    if-eq v0, v1, :cond_7

    .line 16
    .line 17
    const/16 v1, 0x12

    .line 18
    .line 19
    if-eq v0, v1, :cond_6

    .line 20
    .line 21
    const/16 v1, 0x1a

    .line 22
    .line 23
    if-eq v0, v1, :cond_5

    .line 24
    .line 25
    const/16 v1, 0x22

    .line 26
    .line 27
    if-eq v0, v1, :cond_4

    .line 28
    .line 29
    const/16 v1, 0x28

    .line 30
    .line 31
    if-eq v0, v1, :cond_3

    .line 32
    .line 33
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LikeExtraData;->swipeExtraScData:Lcom/p1/mobile/putong/data/SwipeExtraScData;

    .line 34
    .line 35
    if-nez p1, :cond_0

    .line 36
    .line 37
    invoke-static {}, Lcom/p1/mobile/putong/data/SwipeExtraScData;->new_()Lcom/p1/mobile/putong/data/SwipeExtraScData;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iput-object p1, p0, Lcom/p1/mobile/putong/data/LikeExtraData;->swipeExtraScData:Lcom/p1/mobile/putong/data/SwipeExtraScData;

    .line 42
    .line 43
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LikeExtraData;->matchScData:Lcom/p1/mobile/putong/data/MatchScData;

    .line 44
    .line 45
    if-nez p1, :cond_1

    .line 46
    .line 47
    invoke-static {}, Lcom/p1/mobile/putong/data/MatchScData;->new_()Lcom/p1/mobile/putong/data/MatchScData;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    iput-object p1, p0, Lcom/p1/mobile/putong/data/LikeExtraData;->matchScData:Lcom/p1/mobile/putong/data/MatchScData;

    .line 52
    .line 53
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LikeExtraData;->status:Lcom/p1/mobile/putong/data/MatchFrom;

    .line 54
    .line 55
    if-nez p1, :cond_2

    .line 56
    .line 57
    sget-object p1, Lcom/p1/mobile/putong/data/MatchFrom;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 58
    .line 59
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    check-cast p1, Lcom/p1/mobile/putong/data/MatchFrom;

    .line 64
    .line 65
    iput-object p1, p0, Lcom/p1/mobile/putong/data/LikeExtraData;->status:Lcom/p1/mobile/putong/data/MatchFrom;

    .line 66
    .line 67
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LikeExtraData;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 68
    .line 69
    if-nez p1, :cond_c

    .line 70
    .line 71
    sget-object p1, Lcom/p1/mobile/putong/data/RelationshipStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 72
    .line 73
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    check-cast p1, Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 78
    .line 79
    iput-object p1, p0, Lcom/p1/mobile/putong/data/LikeExtraData;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 80
    .line 81
    return-object p0

    .line 82
    :cond_3
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/LikeExtraData;->isSelectedUser:Z

    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_4
    sget-object v0, Lcom/p1/mobile/putong/data/RelationshipStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 90
    .line 91
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    check-cast v0, Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 96
    .line 97
    iput-object v0, p0, Lcom/p1/mobile/putong/data/LikeExtraData;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_5
    sget-object v0, Lcom/p1/mobile/putong/data/MatchFrom;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 101
    .line 102
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    check-cast v0, Lcom/p1/mobile/putong/data/MatchFrom;

    .line 107
    .line 108
    iput-object v0, p0, Lcom/p1/mobile/putong/data/LikeExtraData;->status:Lcom/p1/mobile/putong/data/MatchFrom;

    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_6
    sget-object v0, Lcom/p1/mobile/putong/data/MatchScData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 112
    .line 113
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    check-cast v0, Lcom/p1/mobile/putong/data/MatchScData;

    .line 118
    .line 119
    iput-object v0, p0, Lcom/p1/mobile/putong/data/LikeExtraData;->matchScData:Lcom/p1/mobile/putong/data/MatchScData;

    .line 120
    .line 121
    goto :goto_0

    .line 122
    :cond_7
    sget-object v0, Lcom/p1/mobile/putong/data/SwipeExtraScData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 123
    .line 124
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    check-cast v0, Lcom/p1/mobile/putong/data/SwipeExtraScData;

    .line 129
    .line 130
    iput-object v0, p0, Lcom/p1/mobile/putong/data/LikeExtraData;->swipeExtraScData:Lcom/p1/mobile/putong/data/SwipeExtraScData;

    .line 131
    .line 132
    goto :goto_0

    .line 133
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LikeExtraData;->swipeExtraScData:Lcom/p1/mobile/putong/data/SwipeExtraScData;

    .line 134
    .line 135
    if-nez p1, :cond_9

    .line 136
    .line 137
    invoke-static {}, Lcom/p1/mobile/putong/data/SwipeExtraScData;->new_()Lcom/p1/mobile/putong/data/SwipeExtraScData;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    iput-object p1, p0, Lcom/p1/mobile/putong/data/LikeExtraData;->swipeExtraScData:Lcom/p1/mobile/putong/data/SwipeExtraScData;

    .line 142
    .line 143
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LikeExtraData;->matchScData:Lcom/p1/mobile/putong/data/MatchScData;

    .line 144
    .line 145
    if-nez p1, :cond_a

    .line 146
    .line 147
    invoke-static {}, Lcom/p1/mobile/putong/data/MatchScData;->new_()Lcom/p1/mobile/putong/data/MatchScData;

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    iput-object p1, p0, Lcom/p1/mobile/putong/data/LikeExtraData;->matchScData:Lcom/p1/mobile/putong/data/MatchScData;

    .line 152
    .line 153
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LikeExtraData;->status:Lcom/p1/mobile/putong/data/MatchFrom;

    .line 154
    .line 155
    if-nez p1, :cond_b

    .line 156
    .line 157
    sget-object p1, Lcom/p1/mobile/putong/data/MatchFrom;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 158
    .line 159
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 160
    .line 161
    .line 162
    move-result-object p1

    .line 163
    check-cast p1, Lcom/p1/mobile/putong/data/MatchFrom;

    .line 164
    .line 165
    iput-object p1, p0, Lcom/p1/mobile/putong/data/LikeExtraData;->status:Lcom/p1/mobile/putong/data/MatchFrom;

    .line 166
    .line 167
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LikeExtraData;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 168
    .line 169
    if-nez p1, :cond_c

    .line 170
    .line 171
    sget-object p1, Lcom/p1/mobile/putong/data/RelationshipStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 172
    .line 173
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 174
    .line 175
    .line 176
    move-result-object p1

    .line 177
    check-cast p1, Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 178
    .line 179
    iput-object p1, p0, Lcom/p1/mobile/putong/data/LikeExtraData;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 180
    .line 181
    :cond_c
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 182
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/LikeExtraData$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/LikeExtraData;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/LikeExtraData;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LikeExtraData;->swipeExtraScData:Lcom/p1/mobile/putong/data/SwipeExtraScData;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    sget-object v1, Lcom/p1/mobile/putong/data/SwipeExtraScData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LikeExtraData;->matchScData:Lcom/p1/mobile/putong/data/MatchScData;

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    const/4 v0, 0x2

    .line 16
    sget-object v1, Lcom/p1/mobile/putong/data/MatchScData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 17
    .line 18
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LikeExtraData;->status:Lcom/p1/mobile/putong/data/MatchFrom;

    .line 22
    .line 23
    if-eqz p0, :cond_2

    .line 24
    .line 25
    const/4 v0, 0x3

    .line 26
    sget-object v1, Lcom/p1/mobile/putong/data/MatchFrom;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 27
    .line 28
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 29
    .line 30
    .line 31
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LikeExtraData;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 32
    .line 33
    if-eqz p0, :cond_3

    .line 34
    .line 35
    const/4 v0, 0x4

    .line 36
    sget-object v1, Lcom/p1/mobile/putong/data/RelationshipStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 37
    .line 38
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 39
    .line 40
    .line 41
    :cond_3
    const/4 p0, 0x5

    .line 42
    iget-boolean p1, p1, Lcom/p1/mobile/putong/data/LikeExtraData;->isSelectedUser:Z

    .line 43
    .line 44
    invoke-virtual {p2, p0, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 48
    check-cast p1, Lcom/p1/mobile/putong/data/LikeExtraData;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/LikeExtraData$1;->serialize(Lcom/p1/mobile/putong/data/LikeExtraData;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
