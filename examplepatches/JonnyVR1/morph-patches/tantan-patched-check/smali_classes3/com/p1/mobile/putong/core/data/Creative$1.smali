.class Lcom/p1/mobile/putong/core/data/Creative$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/Creative;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/Creative;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/Creative;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Creative;->id:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Creative;->position:Lcom/p1/mobile/putong/core/data/CreativePosition;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    const/4 v1, 0x2

    .line 17
    sget-object v2, Lcom/p1/mobile/putong/core/data/CreativePosition;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Creative;->template:Lcom/p1/mobile/putong/core/data/CreativeTemplate;

    .line 25
    .line 26
    if-eqz v0, :cond_2

    .line 27
    .line 28
    const/4 v1, 0x3

    .line 29
    sget-object v2, Lcom/p1/mobile/putong/core/data/CreativeTemplate;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Creative;->data:Lcom/p1/mobile/putong/core/data/CreativeData;

    .line 37
    .line 38
    if-eqz v0, :cond_3

    .line 39
    .line 40
    const/4 v1, 0x4

    .line 41
    sget-object v2, Lcom/p1/mobile/putong/core/data/CreativeData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 42
    .line 43
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    add-int/2addr p0, v0

    .line 48
    :cond_3
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 49
    .line 50
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 51
    check-cast p1, Lcom/p1/mobile/putong/core/data/Creative;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/Creative$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/Creative;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/Creative;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/Creative;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/Creative;-><init>()V

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
    if-eqz v0, :cond_7

    .line 13
    .line 14
    const/16 v2, 0xa

    .line 15
    .line 16
    if-eq v0, v2, :cond_6

    .line 17
    .line 18
    const/16 v2, 0x12

    .line 19
    .line 20
    if-eq v0, v2, :cond_5

    .line 21
    .line 22
    const/16 v2, 0x1a

    .line 23
    .line 24
    if-eq v0, v2, :cond_4

    .line 25
    .line 26
    const/16 v2, 0x22

    .line 27
    .line 28
    if-eq v0, v2, :cond_3

    .line 29
    .line 30
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Creative;->id:Ljava/lang/String;

    .line 31
    .line 32
    if-nez p1, :cond_0

    .line 33
    .line 34
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Creative;->id:Ljava/lang/String;

    .line 35
    .line 36
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Creative;->position:Lcom/p1/mobile/putong/core/data/CreativePosition;

    .line 37
    .line 38
    if-nez p1, :cond_1

    .line 39
    .line 40
    invoke-static {}, Lcom/p1/mobile/putong/core/data/CreativePosition;->new_()Lcom/p1/mobile/putong/core/data/CreativePosition;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Creative;->position:Lcom/p1/mobile/putong/core/data/CreativePosition;

    .line 45
    .line 46
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Creative;->template:Lcom/p1/mobile/putong/core/data/CreativeTemplate;

    .line 47
    .line 48
    if-nez p1, :cond_2

    .line 49
    .line 50
    invoke-static {}, Lcom/p1/mobile/putong/core/data/CreativeTemplate;->new_()Lcom/p1/mobile/putong/core/data/CreativeTemplate;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Creative;->template:Lcom/p1/mobile/putong/core/data/CreativeTemplate;

    .line 55
    .line 56
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Creative;->data:Lcom/p1/mobile/putong/core/data/CreativeData;

    .line 57
    .line 58
    if-nez p1, :cond_b

    .line 59
    .line 60
    invoke-static {}, Lcom/p1/mobile/putong/core/data/CreativeData;->new_()Lcom/p1/mobile/putong/core/data/CreativeData;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Creative;->data:Lcom/p1/mobile/putong/core/data/CreativeData;

    .line 65
    .line 66
    return-object p0

    .line 67
    :cond_3
    sget-object v0, Lcom/p1/mobile/putong/core/data/CreativeData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 68
    .line 69
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    check-cast v0, Lcom/p1/mobile/putong/core/data/CreativeData;

    .line 74
    .line 75
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Creative;->data:Lcom/p1/mobile/putong/core/data/CreativeData;

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_4
    sget-object v0, Lcom/p1/mobile/putong/core/data/CreativeTemplate;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 79
    .line 80
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    check-cast v0, Lcom/p1/mobile/putong/core/data/CreativeTemplate;

    .line 85
    .line 86
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Creative;->template:Lcom/p1/mobile/putong/core/data/CreativeTemplate;

    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_5
    sget-object v0, Lcom/p1/mobile/putong/core/data/CreativePosition;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 90
    .line 91
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    check-cast v0, Lcom/p1/mobile/putong/core/data/CreativePosition;

    .line 96
    .line 97
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Creative;->position:Lcom/p1/mobile/putong/core/data/CreativePosition;

    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Creative;->id:Ljava/lang/String;

    .line 105
    .line 106
    goto :goto_0

    .line 107
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Creative;->id:Ljava/lang/String;

    .line 108
    .line 109
    if-nez p1, :cond_8

    .line 110
    .line 111
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Creative;->id:Ljava/lang/String;

    .line 112
    .line 113
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Creative;->position:Lcom/p1/mobile/putong/core/data/CreativePosition;

    .line 114
    .line 115
    if-nez p1, :cond_9

    .line 116
    .line 117
    invoke-static {}, Lcom/p1/mobile/putong/core/data/CreativePosition;->new_()Lcom/p1/mobile/putong/core/data/CreativePosition;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Creative;->position:Lcom/p1/mobile/putong/core/data/CreativePosition;

    .line 122
    .line 123
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Creative;->template:Lcom/p1/mobile/putong/core/data/CreativeTemplate;

    .line 124
    .line 125
    if-nez p1, :cond_a

    .line 126
    .line 127
    invoke-static {}, Lcom/p1/mobile/putong/core/data/CreativeTemplate;->new_()Lcom/p1/mobile/putong/core/data/CreativeTemplate;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Creative;->template:Lcom/p1/mobile/putong/core/data/CreativeTemplate;

    .line 132
    .line 133
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Creative;->data:Lcom/p1/mobile/putong/core/data/CreativeData;

    .line 134
    .line 135
    if-nez p1, :cond_b

    .line 136
    .line 137
    invoke-static {}, Lcom/p1/mobile/putong/core/data/CreativeData;->new_()Lcom/p1/mobile/putong/core/data/CreativeData;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Creative;->data:Lcom/p1/mobile/putong/core/data/CreativeData;

    .line 142
    .line 143
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

    .line 144
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/Creative$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/Creative;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/Creative;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Creative;->id:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Creative;->position:Lcom/p1/mobile/putong/core/data/CreativePosition;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    const/4 v0, 0x2

    .line 14
    sget-object v1, Lcom/p1/mobile/putong/core/data/CreativePosition;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 15
    .line 16
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Creative;->template:Lcom/p1/mobile/putong/core/data/CreativeTemplate;

    .line 20
    .line 21
    if-eqz p0, :cond_2

    .line 22
    .line 23
    const/4 v0, 0x3

    .line 24
    sget-object v1, Lcom/p1/mobile/putong/core/data/CreativeTemplate;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 25
    .line 26
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 27
    .line 28
    .line 29
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Creative;->data:Lcom/p1/mobile/putong/core/data/CreativeData;

    .line 30
    .line 31
    if-eqz p0, :cond_3

    .line 32
    .line 33
    const/4 p1, 0x4

    .line 34
    sget-object v0, Lcom/p1/mobile/putong/core/data/CreativeData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 35
    .line 36
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 37
    .line 38
    .line 39
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

    .line 40
    check-cast p1, Lcom/p1/mobile/putong/core/data/Creative;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/Creative$1;->serialize(Lcom/p1/mobile/putong/core/data/Creative;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
