.class Lcom/p1/mobile/putong/data/GeoLocation$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/GeoLocation;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/GeoLocation;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/GeoLocation;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/GeoLocation;->coordinates:Lcom/p1/mobile/putong/data/DoublePair;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    sget-object v1, Lcom/p1/mobile/putong/data/DoublePair;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/GeoLocation;->intent:Lcom/p1/mobile/putong/data/ClientAction;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    const/4 v1, 0x2

    .line 19
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    add-int/2addr p0, v0

    .line 28
    :cond_1
    const/4 v0, 0x3

    .line 29
    iget v1, p1, Lcom/p1/mobile/putong/data/GeoLocation;->uncertainty:I

    .line 30
    .line 31
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    add-int/2addr p0, v0

    .line 36
    iget-object v0, p1, Lcom/p1/mobile/putong/data/GeoLocation;->intent:Lcom/p1/mobile/putong/data/ClientAction;

    .line 37
    .line 38
    if-eqz v0, :cond_2

    .line 39
    .line 40
    const/4 v1, 0x4

    .line 41
    sget-object v2, Lcom/p1/mobile/putong/data/ClientAction;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

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
    :cond_2
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 49
    .line 50
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 51
    check-cast p1, Lcom/p1/mobile/putong/data/GeoLocation;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/GeoLocation$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/GeoLocation;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/GeoLocation;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/GeoLocation;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/GeoLocation;-><init>()V

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
    if-eqz v2, :cond_6

    .line 13
    .line 14
    const/16 v3, 0xa

    .line 15
    .line 16
    if-eq v2, v3, :cond_5

    .line 17
    .line 18
    const/16 v3, 0x10

    .line 19
    .line 20
    if-eq v2, v3, :cond_4

    .line 21
    .line 22
    const/16 v3, 0x18

    .line 23
    .line 24
    if-eq v2, v3, :cond_3

    .line 25
    .line 26
    const/16 v3, 0x22

    .line 27
    .line 28
    if-eq v2, v3, :cond_2

    .line 29
    .line 30
    iget-object p1, p0, Lcom/p1/mobile/putong/data/GeoLocation;->intent:Lcom/p1/mobile/putong/data/ClientAction;

    .line 31
    .line 32
    if-nez p1, :cond_0

    .line 33
    .line 34
    if-eqz v1, :cond_0

    .line 35
    .line 36
    sget-object p1, Lcom/p1/mobile/putong/data/ClientAction;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 37
    .line 38
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    check-cast p1, Lcom/p1/mobile/putong/data/ClientAction;

    .line 47
    .line 48
    iput-object p1, p0, Lcom/p1/mobile/putong/data/GeoLocation;->intent:Lcom/p1/mobile/putong/data/ClientAction;

    .line 49
    .line 50
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/GeoLocation;->coordinates:Lcom/p1/mobile/putong/data/DoublePair;

    .line 51
    .line 52
    if-nez p1, :cond_1

    .line 53
    .line 54
    invoke-static {}, Lcom/p1/mobile/putong/data/DoublePair;->new_()Lcom/p1/mobile/putong/data/DoublePair;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    iput-object p1, p0, Lcom/p1/mobile/putong/data/GeoLocation;->coordinates:Lcom/p1/mobile/putong/data/DoublePair;

    .line 59
    .line 60
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/GeoLocation;->intent:Lcom/p1/mobile/putong/data/ClientAction;

    .line 61
    .line 62
    if-nez p1, :cond_9

    .line 63
    .line 64
    sget-object p1, Lcom/p1/mobile/putong/data/ClientAction;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 65
    .line 66
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    check-cast p1, Lcom/p1/mobile/putong/data/ClientAction;

    .line 71
    .line 72
    iput-object p1, p0, Lcom/p1/mobile/putong/data/GeoLocation;->intent:Lcom/p1/mobile/putong/data/ClientAction;

    .line 73
    .line 74
    return-object p0

    .line 75
    :cond_2
    sget-object v2, Lcom/p1/mobile/putong/data/ClientAction;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 76
    .line 77
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    check-cast v2, Lcom/p1/mobile/putong/data/ClientAction;

    .line 82
    .line 83
    iput-object v2, p0, Lcom/p1/mobile/putong/data/GeoLocation;->intent:Lcom/p1/mobile/putong/data/ClientAction;

    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_3
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 87
    .line 88
    .line 89
    move-result v2

    .line 90
    iput v2, p0, Lcom/p1/mobile/putong/data/GeoLocation;->uncertainty:I

    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_4
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    goto :goto_0

    .line 102
    :cond_5
    sget-object v2, Lcom/p1/mobile/putong/data/DoublePair;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 103
    .line 104
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object v2

    .line 108
    check-cast v2, Lcom/p1/mobile/putong/data/DoublePair;

    .line 109
    .line 110
    iput-object v2, p0, Lcom/p1/mobile/putong/data/GeoLocation;->coordinates:Lcom/p1/mobile/putong/data/DoublePair;

    .line 111
    .line 112
    goto :goto_0

    .line 113
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/data/GeoLocation;->intent:Lcom/p1/mobile/putong/data/ClientAction;

    .line 114
    .line 115
    if-nez p1, :cond_7

    .line 116
    .line 117
    if-eqz v1, :cond_7

    .line 118
    .line 119
    sget-object p1, Lcom/p1/mobile/putong/data/ClientAction;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 120
    .line 121
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 122
    .line 123
    .line 124
    move-result v1

    .line 125
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    check-cast p1, Lcom/p1/mobile/putong/data/ClientAction;

    .line 130
    .line 131
    iput-object p1, p0, Lcom/p1/mobile/putong/data/GeoLocation;->intent:Lcom/p1/mobile/putong/data/ClientAction;

    .line 132
    .line 133
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/data/GeoLocation;->coordinates:Lcom/p1/mobile/putong/data/DoublePair;

    .line 134
    .line 135
    if-nez p1, :cond_8

    .line 136
    .line 137
    invoke-static {}, Lcom/p1/mobile/putong/data/DoublePair;->new_()Lcom/p1/mobile/putong/data/DoublePair;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    iput-object p1, p0, Lcom/p1/mobile/putong/data/GeoLocation;->coordinates:Lcom/p1/mobile/putong/data/DoublePair;

    .line 142
    .line 143
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/data/GeoLocation;->intent:Lcom/p1/mobile/putong/data/ClientAction;

    .line 144
    .line 145
    if-nez p1, :cond_9

    .line 146
    .line 147
    sget-object p1, Lcom/p1/mobile/putong/data/ClientAction;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 148
    .line 149
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 150
    .line 151
    .line 152
    move-result-object p1

    .line 153
    check-cast p1, Lcom/p1/mobile/putong/data/ClientAction;

    .line 154
    .line 155
    iput-object p1, p0, Lcom/p1/mobile/putong/data/GeoLocation;->intent:Lcom/p1/mobile/putong/data/ClientAction;

    .line 156
    .line 157
    :cond_9
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 158
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/GeoLocation$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/GeoLocation;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/GeoLocation;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/GeoLocation;->coordinates:Lcom/p1/mobile/putong/data/DoublePair;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    sget-object v1, Lcom/p1/mobile/putong/data/DoublePair;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/data/GeoLocation;->intent:Lcom/p1/mobile/putong/data/ClientAction;

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    const/4 v0, 0x2

    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 21
    .line 22
    .line 23
    :cond_1
    const/4 p0, 0x3

    .line 24
    iget v0, p1, Lcom/p1/mobile/putong/data/GeoLocation;->uncertainty:I

    .line 25
    .line 26
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p1, Lcom/p1/mobile/putong/data/GeoLocation;->intent:Lcom/p1/mobile/putong/data/ClientAction;

    .line 30
    .line 31
    if-eqz p0, :cond_2

    .line 32
    .line 33
    const/4 p1, 0x4

    .line 34
    sget-object v0, Lcom/p1/mobile/putong/data/ClientAction;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 35
    .line 36
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 37
    .line 38
    .line 39
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

    .line 40
    check-cast p1, Lcom/p1/mobile/putong/data/GeoLocation;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/GeoLocation$1;->serialize(Lcom/p1/mobile/putong/data/GeoLocation;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
