.class Lcom/p1/mobile/putong/data/AudioSignature$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/AudioSignature;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/AudioSignature;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/AudioSignature;)I
    .locals 3

    .line 1
    const/4 p0, 0x1

    .line 2
    iget v0, p1, Lcom/p1/mobile/putong/data/AudioSignature;->duration:F

    .line 3
    .line 4
    invoke-static {p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->f(IF)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    iget-object v0, p1, Lcom/p1/mobile/putong/data/AudioSignature;->mediaType:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/AudioSignature;->url:Ljava/lang/String;

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    const/4 v1, 0x3

    .line 23
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    add-int/2addr p0, v0

    .line 28
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/AudioSignature;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 29
    .line 30
    if-eqz v0, :cond_2

    .line 31
    .line 32
    const/4 v1, 0x4

    .line 33
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    add-int/2addr p0, v0

    .line 42
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/data/AudioSignature;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 43
    .line 44
    if-eqz v0, :cond_3

    .line 45
    .line 46
    const/4 v1, 0x5

    .line 47
    sget-object v2, Lcom/p1/mobile/putong/data/MediaLocalStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 48
    .line 49
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    add-int/2addr p0, v0

    .line 54
    :cond_3
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 55
    .line 56
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 57
    check-cast p1, Lcom/p1/mobile/putong/data/AudioSignature;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/AudioSignature$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/AudioSignature;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/AudioSignature;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/AudioSignature;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/AudioSignature;-><init>()V

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
    const/16 v4, 0xd

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
    const/16 v4, 0x1a

    .line 25
    .line 26
    if-eq v2, v4, :cond_5

    .line 27
    .line 28
    const/16 v4, 0x20

    .line 29
    .line 30
    if-eq v2, v4, :cond_4

    .line 31
    .line 32
    const/16 v4, 0x2a

    .line 33
    .line 34
    if-eq v2, v4, :cond_3

    .line 35
    .line 36
    iget-object p1, p0, Lcom/p1/mobile/putong/data/AudioSignature;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 37
    .line 38
    if-nez p1, :cond_0

    .line 39
    .line 40
    if-eqz v1, :cond_0

    .line 41
    .line 42
    sget-object p1, Lcom/p1/mobile/putong/data/MediaLocalStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

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
    check-cast p1, Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 53
    .line 54
    iput-object p1, p0, Lcom/p1/mobile/putong/data/AudioSignature;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 55
    .line 56
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/AudioSignature;->mediaType:Ljava/lang/String;

    .line 57
    .line 58
    if-nez p1, :cond_1

    .line 59
    .line 60
    iput-object v3, p0, Lcom/p1/mobile/putong/data/AudioSignature;->mediaType:Ljava/lang/String;

    .line 61
    .line 62
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/AudioSignature;->url:Ljava/lang/String;

    .line 63
    .line 64
    if-nez p1, :cond_2

    .line 65
    .line 66
    iput-object v3, p0, Lcom/p1/mobile/putong/data/AudioSignature;->url:Ljava/lang/String;

    .line 67
    .line 68
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/AudioSignature;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 69
    .line 70
    if-nez p1, :cond_c

    .line 71
    .line 72
    sget-object p1, Lcom/p1/mobile/putong/data/MediaLocalStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 73
    .line 74
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    check-cast p1, Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 79
    .line 80
    iput-object p1, p0, Lcom/p1/mobile/putong/data/AudioSignature;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 81
    .line 82
    return-object p0

    .line 83
    :cond_3
    sget-object v2, Lcom/p1/mobile/putong/data/MediaLocalStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 84
    .line 85
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    check-cast v2, Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 90
    .line 91
    iput-object v2, p0, Lcom/p1/mobile/putong/data/AudioSignature;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_4
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    goto :goto_0

    .line 103
    :cond_5
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    iput-object v2, p0, Lcom/p1/mobile/putong/data/AudioSignature;->url:Ljava/lang/String;

    .line 108
    .line 109
    goto :goto_0

    .line 110
    :cond_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v2

    .line 114
    iput-object v2, p0, Lcom/p1/mobile/putong/data/AudioSignature;->mediaType:Ljava/lang/String;

    .line 115
    .line 116
    goto :goto_0

    .line 117
    :cond_7
    invoke-virtual {p1}, Ll/nc5;->i()F

    .line 118
    .line 119
    .line 120
    move-result v2

    .line 121
    iput v2, p0, Lcom/p1/mobile/putong/data/AudioSignature;->duration:F

    .line 122
    .line 123
    goto :goto_0

    .line 124
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/data/AudioSignature;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 125
    .line 126
    if-nez p1, :cond_9

    .line 127
    .line 128
    if-eqz v1, :cond_9

    .line 129
    .line 130
    sget-object p1, Lcom/p1/mobile/putong/data/MediaLocalStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 131
    .line 132
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 133
    .line 134
    .line 135
    move-result v1

    .line 136
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    check-cast p1, Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 141
    .line 142
    iput-object p1, p0, Lcom/p1/mobile/putong/data/AudioSignature;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 143
    .line 144
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/data/AudioSignature;->mediaType:Ljava/lang/String;

    .line 145
    .line 146
    if-nez p1, :cond_a

    .line 147
    .line 148
    iput-object v3, p0, Lcom/p1/mobile/putong/data/AudioSignature;->mediaType:Ljava/lang/String;

    .line 149
    .line 150
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/AudioSignature;->url:Ljava/lang/String;

    .line 151
    .line 152
    if-nez p1, :cond_b

    .line 153
    .line 154
    iput-object v3, p0, Lcom/p1/mobile/putong/data/AudioSignature;->url:Ljava/lang/String;

    .line 155
    .line 156
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/AudioSignature;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 157
    .line 158
    if-nez p1, :cond_c

    .line 159
    .line 160
    sget-object p1, Lcom/p1/mobile/putong/data/MediaLocalStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 161
    .line 162
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 163
    .line 164
    .line 165
    move-result-object p1

    .line 166
    check-cast p1, Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 167
    .line 168
    iput-object p1, p0, Lcom/p1/mobile/putong/data/AudioSignature;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 169
    .line 170
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

    .line 171
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/AudioSignature$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/AudioSignature;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/AudioSignature;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    iget v0, p1, Lcom/p1/mobile/putong/data/AudioSignature;->duration:F

    .line 3
    .line 4
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->E(IF)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/AudioSignature;->mediaType:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/AudioSignature;->url:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/AudioSignature;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 24
    .line 25
    if-eqz p0, :cond_2

    .line 26
    .line 27
    const/4 v0, 0x4

    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 33
    .line 34
    .line 35
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/AudioSignature;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 36
    .line 37
    if-eqz p0, :cond_3

    .line 38
    .line 39
    const/4 p1, 0x5

    .line 40
    sget-object v0, Lcom/p1/mobile/putong/data/MediaLocalStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 41
    .line 42
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 43
    .line 44
    .line 45
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

    .line 46
    check-cast p1, Lcom/p1/mobile/putong/data/AudioSignature;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/AudioSignature$1;->serialize(Lcom/p1/mobile/putong/data/AudioSignature;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
