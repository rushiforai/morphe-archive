.class Lcom/p1/mobile/putong/core/data/ConversationPatchRecord$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;)I
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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;->readUtil:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;->state:Lcom/p1/mobile/putong/core/data/ConversationPatchState;

    .line 30
    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    const/16 v1, 0x34

    .line 34
    .line 35
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    add-int/2addr p0, v0

    .line 44
    :cond_2
    const/16 v0, 0x35

    .line 45
    .line 46
    iget v1, p1, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;->retryCount:I

    .line 47
    .line 48
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    add-int/2addr p0, v0

    .line 53
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;->state:Lcom/p1/mobile/putong/core/data/ConversationPatchState;

    .line 54
    .line 55
    if-eqz v0, :cond_3

    .line 56
    .line 57
    const/16 v1, 0x36

    .line 58
    .line 59
    sget-object v2, Lcom/p1/mobile/putong/core/data/ConversationPatchState;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 60
    .line 61
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    add-int/2addr p0, v0

    .line 66
    :cond_3
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 67
    .line 68
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 69
    check-cast p1, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;-><init>()V

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
    if-eqz v2, :cond_8

    .line 15
    .line 16
    const/16 v4, 0x8

    .line 17
    .line 18
    if-eq v2, v4, :cond_7

    .line 19
    .line 20
    const/16 v4, 0x12

    .line 21
    .line 22
    if-eq v2, v4, :cond_6

    .line 23
    .line 24
    const/16 v4, 0x19a

    .line 25
    .line 26
    if-eq v2, v4, :cond_5

    .line 27
    .line 28
    const/16 v4, 0x1a0

    .line 29
    .line 30
    if-eq v2, v4, :cond_4

    .line 31
    .line 32
    const/16 v4, 0x1a8

    .line 33
    .line 34
    if-eq v2, v4, :cond_3

    .line 35
    .line 36
    const/16 v4, 0x1b2

    .line 37
    .line 38
    if-eq v2, v4, :cond_2

    .line 39
    .line 40
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;->state:Lcom/p1/mobile/putong/core/data/ConversationPatchState;

    .line 41
    .line 42
    if-nez p1, :cond_0

    .line 43
    .line 44
    if-eqz v1, :cond_0

    .line 45
    .line 46
    sget-object p1, Lcom/p1/mobile/putong/core/data/ConversationPatchState;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 47
    .line 48
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    check-cast p1, Lcom/p1/mobile/putong/core/data/ConversationPatchState;

    .line 57
    .line 58
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;->state:Lcom/p1/mobile/putong/core/data/ConversationPatchState;

    .line 59
    .line 60
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;->readUtil:Ljava/lang/String;

    .line 61
    .line 62
    if-nez p1, :cond_1

    .line 63
    .line 64
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;->readUtil:Ljava/lang/String;

    .line 65
    .line 66
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;->state:Lcom/p1/mobile/putong/core/data/ConversationPatchState;

    .line 67
    .line 68
    if-nez p1, :cond_b

    .line 69
    .line 70
    sget-object p1, Lcom/p1/mobile/putong/core/data/ConversationPatchState;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 71
    .line 72
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    check-cast p1, Lcom/p1/mobile/putong/core/data/ConversationPatchState;

    .line 77
    .line 78
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;->state:Lcom/p1/mobile/putong/core/data/ConversationPatchState;

    .line 79
    .line 80
    return-object p0

    .line 81
    :cond_2
    sget-object v2, Lcom/p1/mobile/putong/core/data/ConversationPatchState;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 82
    .line 83
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    check-cast v2, Lcom/p1/mobile/putong/core/data/ConversationPatchState;

    .line 88
    .line 89
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;->state:Lcom/p1/mobile/putong/core/data/ConversationPatchState;

    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_3
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 93
    .line 94
    .line 95
    move-result v2

    .line 96
    iput v2, p0, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;->retryCount:I

    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_4
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 100
    .line 101
    .line 102
    move-result v1

    .line 103
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    goto :goto_0

    .line 108
    :cond_5
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v2

    .line 112
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;->readUtil:Ljava/lang/String;

    .line 113
    .line 114
    goto :goto_0

    .line 115
    :cond_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v2

    .line 119
    iput-object v2, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 120
    .line 121
    goto :goto_0

    .line 122
    :cond_7
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 123
    .line 124
    .line 125
    move-result-wide v2

    .line 126
    iput-wide v2, p0, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 127
    .line 128
    goto :goto_0

    .line 129
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;->state:Lcom/p1/mobile/putong/core/data/ConversationPatchState;

    .line 130
    .line 131
    if-nez p1, :cond_9

    .line 132
    .line 133
    if-eqz v1, :cond_9

    .line 134
    .line 135
    sget-object p1, Lcom/p1/mobile/putong/core/data/ConversationPatchState;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 136
    .line 137
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 138
    .line 139
    .line 140
    move-result v1

    .line 141
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    check-cast p1, Lcom/p1/mobile/putong/core/data/ConversationPatchState;

    .line 146
    .line 147
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;->state:Lcom/p1/mobile/putong/core/data/ConversationPatchState;

    .line 148
    .line 149
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;->readUtil:Ljava/lang/String;

    .line 150
    .line 151
    if-nez p1, :cond_a

    .line 152
    .line 153
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;->readUtil:Ljava/lang/String;

    .line 154
    .line 155
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;->state:Lcom/p1/mobile/putong/core/data/ConversationPatchState;

    .line 156
    .line 157
    if-nez p1, :cond_b

    .line 158
    .line 159
    sget-object p1, Lcom/p1/mobile/putong/core/data/ConversationPatchState;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 160
    .line 161
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 162
    .line 163
    .line 164
    move-result-object p1

    .line 165
    check-cast p1, Lcom/p1/mobile/putong/core/data/ConversationPatchState;

    .line 166
    .line 167
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;->state:Lcom/p1/mobile/putong/core/data/ConversationPatchState;

    .line 168
    .line 169
    :cond_b
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
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;->readUtil:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;->state:Lcom/p1/mobile/putong/core/data/ConversationPatchState;

    .line 25
    .line 26
    if-eqz p0, :cond_2

    .line 27
    .line 28
    const/16 v0, 0x34

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 35
    .line 36
    .line 37
    :cond_2
    const/16 p0, 0x35

    .line 38
    .line 39
    iget v0, p1, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;->retryCount:I

    .line 40
    .line 41
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 42
    .line 43
    .line 44
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;->state:Lcom/p1/mobile/putong/core/data/ConversationPatchState;

    .line 45
    .line 46
    if-eqz p0, :cond_3

    .line 47
    .line 48
    const/16 p1, 0x36

    .line 49
    .line 50
    sget-object v0, Lcom/p1/mobile/putong/core/data/ConversationPatchState;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 51
    .line 52
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 53
    .line 54
    .line 55
    :cond_3
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 56
    check-cast p1, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/ConversationPatchRecord$1;->serialize(Lcom/p1/mobile/putong/core/data/ConversationPatchRecord;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
