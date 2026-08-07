.class Lcom/p1/mobile/putong/core/data/MessageReference$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/MessageReference;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/MessageReference;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/MessageReference;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageReference;->type:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MessageReference;->id:Ljava/lang/String;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    const/4 v1, 0x2

    .line 17
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    add-int/2addr p0, v0

    .line 22
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MessageReference;->action:Lcom/p1/mobile/putong/core/data/MomentAction;

    .line 23
    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    const/4 v1, 0x3

    .line 27
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    add-int/2addr p0, v0

    .line 36
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MessageReference;->answerId:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MessageReference;->action:Lcom/p1/mobile/putong/core/data/MomentAction;

    .line 47
    .line 48
    if-eqz v0, :cond_4

    .line 49
    .line 50
    const/4 v1, 0x5

    .line 51
    sget-object v2, Lcom/p1/mobile/putong/core/data/MomentAction;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 52
    .line 53
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    add-int/2addr p0, v0

    .line 58
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MessageReference;->topic:Lcom/p1/mobile/putong/core/data/MessageTopic;

    .line 59
    .line 60
    if-eqz v0, :cond_5

    .line 61
    .line 62
    const/4 v1, 0x6

    .line 63
    sget-object v2, Lcom/p1/mobile/putong/core/data/MessageTopic;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 64
    .line 65
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    add-int/2addr p0, v0

    .line 70
    :cond_5
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 71
    .line 72
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 73
    check-cast p1, Lcom/p1/mobile/putong/core/data/MessageReference;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/MessageReference$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/MessageReference;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/MessageReference;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/MessageReference;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/MessageReference;-><init>()V

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
    const/16 v4, 0xa

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
    const/16 v4, 0x18

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
    const/16 v4, 0x32

    .line 37
    .line 38
    if-eq v2, v4, :cond_3

    .line 39
    .line 40
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MessageReference;->action:Lcom/p1/mobile/putong/core/data/MomentAction;

    .line 41
    .line 42
    if-nez p1, :cond_0

    .line 43
    .line 44
    if-eqz v1, :cond_0

    .line 45
    .line 46
    sget-object p1, Lcom/p1/mobile/putong/core/data/MomentAction;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/MomentAction;

    .line 57
    .line 58
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MessageReference;->action:Lcom/p1/mobile/putong/core/data/MomentAction;

    .line 59
    .line 60
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MessageReference;->type:Ljava/lang/String;

    .line 61
    .line 62
    if-nez p1, :cond_1

    .line 63
    .line 64
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/MessageReference;->type:Ljava/lang/String;

    .line 65
    .line 66
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MessageReference;->id:Ljava/lang/String;

    .line 67
    .line 68
    if-nez p1, :cond_2

    .line 69
    .line 70
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/MessageReference;->id:Ljava/lang/String;

    .line 71
    .line 72
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MessageReference;->action:Lcom/p1/mobile/putong/core/data/MomentAction;

    .line 73
    .line 74
    if-nez p1, :cond_d

    .line 75
    .line 76
    sget-object p1, Lcom/p1/mobile/putong/core/data/MomentAction;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 77
    .line 78
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    check-cast p1, Lcom/p1/mobile/putong/core/data/MomentAction;

    .line 83
    .line 84
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MessageReference;->action:Lcom/p1/mobile/putong/core/data/MomentAction;

    .line 85
    .line 86
    return-object p0

    .line 87
    :cond_3
    sget-object v2, Lcom/p1/mobile/putong/core/data/MessageTopic;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 88
    .line 89
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    check-cast v2, Lcom/p1/mobile/putong/core/data/MessageTopic;

    .line 94
    .line 95
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/MessageReference;->topic:Lcom/p1/mobile/putong/core/data/MessageTopic;

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_4
    sget-object v2, Lcom/p1/mobile/putong/core/data/MomentAction;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 99
    .line 100
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object v2

    .line 104
    check-cast v2, Lcom/p1/mobile/putong/core/data/MomentAction;

    .line 105
    .line 106
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/MessageReference;->action:Lcom/p1/mobile/putong/core/data/MomentAction;

    .line 107
    .line 108
    goto :goto_0

    .line 109
    :cond_5
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v2

    .line 113
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/MessageReference;->answerId:Ljava/lang/String;

    .line 114
    .line 115
    goto :goto_0

    .line 116
    :cond_6
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 117
    .line 118
    .line 119
    move-result v1

    .line 120
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    goto :goto_0

    .line 125
    :cond_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v2

    .line 129
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/MessageReference;->id:Ljava/lang/String;

    .line 130
    .line 131
    goto :goto_0

    .line 132
    :cond_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v2

    .line 136
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/MessageReference;->type:Ljava/lang/String;

    .line 137
    .line 138
    goto/16 :goto_0

    .line 139
    .line 140
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MessageReference;->action:Lcom/p1/mobile/putong/core/data/MomentAction;

    .line 141
    .line 142
    if-nez p1, :cond_a

    .line 143
    .line 144
    if-eqz v1, :cond_a

    .line 145
    .line 146
    sget-object p1, Lcom/p1/mobile/putong/core/data/MomentAction;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 147
    .line 148
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 149
    .line 150
    .line 151
    move-result v1

    .line 152
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 153
    .line 154
    .line 155
    move-result-object p1

    .line 156
    check-cast p1, Lcom/p1/mobile/putong/core/data/MomentAction;

    .line 157
    .line 158
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MessageReference;->action:Lcom/p1/mobile/putong/core/data/MomentAction;

    .line 159
    .line 160
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MessageReference;->type:Ljava/lang/String;

    .line 161
    .line 162
    if-nez p1, :cond_b

    .line 163
    .line 164
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/MessageReference;->type:Ljava/lang/String;

    .line 165
    .line 166
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MessageReference;->id:Ljava/lang/String;

    .line 167
    .line 168
    if-nez p1, :cond_c

    .line 169
    .line 170
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/MessageReference;->id:Ljava/lang/String;

    .line 171
    .line 172
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MessageReference;->action:Lcom/p1/mobile/putong/core/data/MomentAction;

    .line 173
    .line 174
    if-nez p1, :cond_d

    .line 175
    .line 176
    sget-object p1, Lcom/p1/mobile/putong/core/data/MomentAction;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 177
    .line 178
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 179
    .line 180
    .line 181
    move-result-object p1

    .line 182
    check-cast p1, Lcom/p1/mobile/putong/core/data/MomentAction;

    .line 183
    .line 184
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MessageReference;->action:Lcom/p1/mobile/putong/core/data/MomentAction;

    .line 185
    .line 186
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

    .line 187
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/MessageReference$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/MessageReference;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/MessageReference;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageReference;->type:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageReference;->id:Ljava/lang/String;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    const/4 v0, 0x2

    .line 14
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 15
    .line 16
    .line 17
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageReference;->action:Lcom/p1/mobile/putong/core/data/MomentAction;

    .line 18
    .line 19
    if-eqz p0, :cond_2

    .line 20
    .line 21
    const/4 v0, 0x3

    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 27
    .line 28
    .line 29
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageReference;->answerId:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageReference;->action:Lcom/p1/mobile/putong/core/data/MomentAction;

    .line 38
    .line 39
    if-eqz p0, :cond_4

    .line 40
    .line 41
    const/4 v0, 0x5

    .line 42
    sget-object v1, Lcom/p1/mobile/putong/core/data/MomentAction;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 43
    .line 44
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 45
    .line 46
    .line 47
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageReference;->topic:Lcom/p1/mobile/putong/core/data/MessageTopic;

    .line 48
    .line 49
    if-eqz p0, :cond_5

    .line 50
    .line 51
    const/4 p1, 0x6

    .line 52
    sget-object v0, Lcom/p1/mobile/putong/core/data/MessageTopic;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 53
    .line 54
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 55
    .line 56
    .line 57
    :cond_5
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 58
    check-cast p1, Lcom/p1/mobile/putong/core/data/MessageReference;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/MessageReference$1;->serialize(Lcom/p1/mobile/putong/core/data/MessageReference;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
