.class Lcom/p1/mobile/putong/core/data/HideAndSeekGameRole$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/HideAndSeekGameRole;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/HideAndSeekGameRole;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/HideAndSeekGameRole;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/HideAndSeekGameRole;->roleType:Lcom/p1/mobile/putong/core/data/GameRole;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    sget-object v1, Lcom/p1/mobile/putong/core/data/GameRole;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

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
    const/4 v0, 0x2

    .line 15
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/HideAndSeekGameRole;->endTime:J

    .line 16
    .line 17
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    add-int/2addr p0, v0

    .line 22
    const/4 v0, 0x3

    .line 23
    iget v1, p1, Lcom/p1/mobile/putong/core/data/HideAndSeekGameRole;->mouseCount:I

    .line 24
    .line 25
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    add-int/2addr p0, v0

    .line 30
    const/4 v0, 0x4

    .line 31
    iget v1, p1, Lcom/p1/mobile/putong/core/data/HideAndSeekGameRole;->allCount:I

    .line 32
    .line 33
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    add-int/2addr p0, v0

    .line 38
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/HideAndSeekGameRole;->gameStage:Lcom/p1/mobile/putong/core/data/GameStage;

    .line 39
    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    const/4 v1, 0x5

    .line 43
    sget-object v2, Lcom/p1/mobile/putong/core/data/GameStage;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

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
    :cond_1
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 51
    .line 52
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 53
    check-cast p1, Lcom/p1/mobile/putong/core/data/HideAndSeekGameRole;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/HideAndSeekGameRole$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/HideAndSeekGameRole;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/HideAndSeekGameRole;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/HideAndSeekGameRole;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/HideAndSeekGameRole;-><init>()V

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
    if-eqz v0, :cond_6

    .line 11
    .line 12
    const/16 v1, 0xa

    .line 13
    .line 14
    if-eq v0, v1, :cond_5

    .line 15
    .line 16
    const/16 v1, 0x10

    .line 17
    .line 18
    if-eq v0, v1, :cond_4

    .line 19
    .line 20
    const/16 v1, 0x18

    .line 21
    .line 22
    if-eq v0, v1, :cond_3

    .line 23
    .line 24
    const/16 v1, 0x20

    .line 25
    .line 26
    if-eq v0, v1, :cond_2

    .line 27
    .line 28
    const/16 v1, 0x2a

    .line 29
    .line 30
    if-eq v0, v1, :cond_1

    .line 31
    .line 32
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HideAndSeekGameRole;->roleType:Lcom/p1/mobile/putong/core/data/GameRole;

    .line 33
    .line 34
    if-nez p1, :cond_0

    .line 35
    .line 36
    sget-object p1, Lcom/p1/mobile/putong/core/data/GameRole;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 37
    .line 38
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    check-cast p1, Lcom/p1/mobile/putong/core/data/GameRole;

    .line 43
    .line 44
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/HideAndSeekGameRole;->roleType:Lcom/p1/mobile/putong/core/data/GameRole;

    .line 45
    .line 46
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HideAndSeekGameRole;->gameStage:Lcom/p1/mobile/putong/core/data/GameStage;

    .line 47
    .line 48
    if-nez p1, :cond_8

    .line 49
    .line 50
    sget-object p1, Lcom/p1/mobile/putong/core/data/GameStage;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 51
    .line 52
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    check-cast p1, Lcom/p1/mobile/putong/core/data/GameStage;

    .line 57
    .line 58
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/HideAndSeekGameRole;->gameStage:Lcom/p1/mobile/putong/core/data/GameStage;

    .line 59
    .line 60
    return-object p0

    .line 61
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/data/GameStage;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 62
    .line 63
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    check-cast v0, Lcom/p1/mobile/putong/core/data/GameStage;

    .line 68
    .line 69
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/HideAndSeekGameRole;->gameStage:Lcom/p1/mobile/putong/core/data/GameStage;

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_2
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    iput v0, p0, Lcom/p1/mobile/putong/core/data/HideAndSeekGameRole;->allCount:I

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_3
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    iput v0, p0, Lcom/p1/mobile/putong/core/data/HideAndSeekGameRole;->mouseCount:I

    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_4
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 87
    .line 88
    .line 89
    move-result-wide v0

    .line 90
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/HideAndSeekGameRole;->endTime:J

    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_5
    sget-object v0, Lcom/p1/mobile/putong/core/data/GameRole;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 94
    .line 95
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    check-cast v0, Lcom/p1/mobile/putong/core/data/GameRole;

    .line 100
    .line 101
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/HideAndSeekGameRole;->roleType:Lcom/p1/mobile/putong/core/data/GameRole;

    .line 102
    .line 103
    goto :goto_0

    .line 104
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HideAndSeekGameRole;->roleType:Lcom/p1/mobile/putong/core/data/GameRole;

    .line 105
    .line 106
    if-nez p1, :cond_7

    .line 107
    .line 108
    sget-object p1, Lcom/p1/mobile/putong/core/data/GameRole;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 109
    .line 110
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    check-cast p1, Lcom/p1/mobile/putong/core/data/GameRole;

    .line 115
    .line 116
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/HideAndSeekGameRole;->roleType:Lcom/p1/mobile/putong/core/data/GameRole;

    .line 117
    .line 118
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HideAndSeekGameRole;->gameStage:Lcom/p1/mobile/putong/core/data/GameStage;

    .line 119
    .line 120
    if-nez p1, :cond_8

    .line 121
    .line 122
    sget-object p1, Lcom/p1/mobile/putong/core/data/GameStage;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 123
    .line 124
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    check-cast p1, Lcom/p1/mobile/putong/core/data/GameStage;

    .line 129
    .line 130
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/HideAndSeekGameRole;->gameStage:Lcom/p1/mobile/putong/core/data/GameStage;

    .line 131
    .line 132
    :cond_8
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 133
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/HideAndSeekGameRole$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/HideAndSeekGameRole;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/HideAndSeekGameRole;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/HideAndSeekGameRole;->roleType:Lcom/p1/mobile/putong/core/data/GameRole;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    sget-object v1, Lcom/p1/mobile/putong/core/data/GameRole;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 7
    .line 8
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    const/4 p0, 0x2

    .line 12
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/HideAndSeekGameRole;->endTime:J

    .line 13
    .line 14
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 15
    .line 16
    .line 17
    const/4 p0, 0x3

    .line 18
    iget v0, p1, Lcom/p1/mobile/putong/core/data/HideAndSeekGameRole;->mouseCount:I

    .line 19
    .line 20
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 21
    .line 22
    .line 23
    const/4 p0, 0x4

    .line 24
    iget v0, p1, Lcom/p1/mobile/putong/core/data/HideAndSeekGameRole;->allCount:I

    .line 25
    .line 26
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/HideAndSeekGameRole;->gameStage:Lcom/p1/mobile/putong/core/data/GameStage;

    .line 30
    .line 31
    if-eqz p0, :cond_1

    .line 32
    .line 33
    const/4 p1, 0x5

    .line 34
    sget-object v0, Lcom/p1/mobile/putong/core/data/GameStage;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 35
    .line 36
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 37
    .line 38
    .line 39
    :cond_1
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
    check-cast p1, Lcom/p1/mobile/putong/core/data/HideAndSeekGameRole;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/HideAndSeekGameRole$1;->serialize(Lcom/p1/mobile/putong/core/data/HideAndSeekGameRole;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
