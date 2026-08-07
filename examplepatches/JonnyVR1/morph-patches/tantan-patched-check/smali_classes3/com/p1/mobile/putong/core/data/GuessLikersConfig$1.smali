.class Lcom/p1/mobile/putong/core/data/GuessLikersConfig$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/GuessLikersConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/GuessLikersConfig;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/GuessLikersConfig;)I
    .locals 3

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;->isGuessLikeOpen:Z

    .line 3
    .line 4
    invoke-static {p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;->name:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;->firstRule:Lcom/p1/mobile/putong/core/data/GuessLikersFirstRule;

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    const/4 v1, 0x3

    .line 23
    sget-object v2, Lcom/p1/mobile/putong/core/data/GuessLikersFirstRule;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 24
    .line 25
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    add-int/2addr p0, v0

    .line 30
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;->secondRule:Lcom/p1/mobile/putong/core/data/GuessLikersSecondRule;

    .line 31
    .line 32
    if-eqz v0, :cond_2

    .line 33
    .line 34
    const/4 v1, 0x4

    .line 35
    sget-object v2, Lcom/p1/mobile/putong/core/data/GuessLikersSecondRule;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 36
    .line 37
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    add-int/2addr p0, v0

    .line 42
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;->thirdRule:Lcom/p1/mobile/putong/core/data/GuessLikersThirdRule;

    .line 43
    .line 44
    if-eqz v0, :cond_3

    .line 45
    .line 46
    const/4 v1, 0x5

    .line 47
    sget-object v2, Lcom/p1/mobile/putong/core/data/GuessLikersThirdRule;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/GuessLikersConfig$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/GuessLikersConfig;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/GuessLikersConfig;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;-><init>()V

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
    if-eqz v0, :cond_8

    .line 13
    .line 14
    const/16 v2, 0x8

    .line 15
    .line 16
    if-eq v0, v2, :cond_7

    .line 17
    .line 18
    const/16 v2, 0x12

    .line 19
    .line 20
    if-eq v0, v2, :cond_6

    .line 21
    .line 22
    const/16 v2, 0x1a

    .line 23
    .line 24
    if-eq v0, v2, :cond_5

    .line 25
    .line 26
    const/16 v2, 0x22

    .line 27
    .line 28
    if-eq v0, v2, :cond_4

    .line 29
    .line 30
    const/16 v2, 0x2a

    .line 31
    .line 32
    if-eq v0, v2, :cond_3

    .line 33
    .line 34
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;->name:Ljava/lang/String;

    .line 35
    .line 36
    if-nez p1, :cond_0

    .line 37
    .line 38
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;->name:Ljava/lang/String;

    .line 39
    .line 40
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;->firstRule:Lcom/p1/mobile/putong/core/data/GuessLikersFirstRule;

    .line 41
    .line 42
    if-nez p1, :cond_1

    .line 43
    .line 44
    invoke-static {}, Lcom/p1/mobile/putong/core/data/GuessLikersFirstRule;->new_()Lcom/p1/mobile/putong/core/data/GuessLikersFirstRule;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;->firstRule:Lcom/p1/mobile/putong/core/data/GuessLikersFirstRule;

    .line 49
    .line 50
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;->secondRule:Lcom/p1/mobile/putong/core/data/GuessLikersSecondRule;

    .line 51
    .line 52
    if-nez p1, :cond_2

    .line 53
    .line 54
    invoke-static {}, Lcom/p1/mobile/putong/core/data/GuessLikersSecondRule;->new_()Lcom/p1/mobile/putong/core/data/GuessLikersSecondRule;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;->secondRule:Lcom/p1/mobile/putong/core/data/GuessLikersSecondRule;

    .line 59
    .line 60
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;->thirdRule:Lcom/p1/mobile/putong/core/data/GuessLikersThirdRule;

    .line 61
    .line 62
    if-nez p1, :cond_c

    .line 63
    .line 64
    invoke-static {}, Lcom/p1/mobile/putong/core/data/GuessLikersThirdRule;->new_()Lcom/p1/mobile/putong/core/data/GuessLikersThirdRule;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;->thirdRule:Lcom/p1/mobile/putong/core/data/GuessLikersThirdRule;

    .line 69
    .line 70
    return-object p0

    .line 71
    :cond_3
    sget-object v0, Lcom/p1/mobile/putong/core/data/GuessLikersThirdRule;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 72
    .line 73
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    check-cast v0, Lcom/p1/mobile/putong/core/data/GuessLikersThirdRule;

    .line 78
    .line 79
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;->thirdRule:Lcom/p1/mobile/putong/core/data/GuessLikersThirdRule;

    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_4
    sget-object v0, Lcom/p1/mobile/putong/core/data/GuessLikersSecondRule;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 83
    .line 84
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    check-cast v0, Lcom/p1/mobile/putong/core/data/GuessLikersSecondRule;

    .line 89
    .line 90
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;->secondRule:Lcom/p1/mobile/putong/core/data/GuessLikersSecondRule;

    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_5
    sget-object v0, Lcom/p1/mobile/putong/core/data/GuessLikersFirstRule;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 94
    .line 95
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    check-cast v0, Lcom/p1/mobile/putong/core/data/GuessLikersFirstRule;

    .line 100
    .line 101
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;->firstRule:Lcom/p1/mobile/putong/core/data/GuessLikersFirstRule;

    .line 102
    .line 103
    goto :goto_0

    .line 104
    :cond_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;->name:Ljava/lang/String;

    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_7
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 112
    .line 113
    .line 114
    move-result v0

    .line 115
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;->isGuessLikeOpen:Z

    .line 116
    .line 117
    goto :goto_0

    .line 118
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;->name:Ljava/lang/String;

    .line 119
    .line 120
    if-nez p1, :cond_9

    .line 121
    .line 122
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;->name:Ljava/lang/String;

    .line 123
    .line 124
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;->firstRule:Lcom/p1/mobile/putong/core/data/GuessLikersFirstRule;

    .line 125
    .line 126
    if-nez p1, :cond_a

    .line 127
    .line 128
    invoke-static {}, Lcom/p1/mobile/putong/core/data/GuessLikersFirstRule;->new_()Lcom/p1/mobile/putong/core/data/GuessLikersFirstRule;

    .line 129
    .line 130
    .line 131
    move-result-object p1

    .line 132
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;->firstRule:Lcom/p1/mobile/putong/core/data/GuessLikersFirstRule;

    .line 133
    .line 134
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;->secondRule:Lcom/p1/mobile/putong/core/data/GuessLikersSecondRule;

    .line 135
    .line 136
    if-nez p1, :cond_b

    .line 137
    .line 138
    invoke-static {}, Lcom/p1/mobile/putong/core/data/GuessLikersSecondRule;->new_()Lcom/p1/mobile/putong/core/data/GuessLikersSecondRule;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;->secondRule:Lcom/p1/mobile/putong/core/data/GuessLikersSecondRule;

    .line 143
    .line 144
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;->thirdRule:Lcom/p1/mobile/putong/core/data/GuessLikersThirdRule;

    .line 145
    .line 146
    if-nez p1, :cond_c

    .line 147
    .line 148
    invoke-static {}, Lcom/p1/mobile/putong/core/data/GuessLikersThirdRule;->new_()Lcom/p1/mobile/putong/core/data/GuessLikersThirdRule;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;->thirdRule:Lcom/p1/mobile/putong/core/data/GuessLikersThirdRule;

    .line 153
    .line 154
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

    .line 155
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/GuessLikersConfig$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/GuessLikersConfig;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/GuessLikersConfig;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;->isGuessLikeOpen:Z

    .line 3
    .line 4
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;->name:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;->firstRule:Lcom/p1/mobile/putong/core/data/GuessLikersFirstRule;

    .line 16
    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    const/4 v0, 0x3

    .line 20
    sget-object v1, Lcom/p1/mobile/putong/core/data/GuessLikersFirstRule;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 21
    .line 22
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 23
    .line 24
    .line 25
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;->secondRule:Lcom/p1/mobile/putong/core/data/GuessLikersSecondRule;

    .line 26
    .line 27
    if-eqz p0, :cond_2

    .line 28
    .line 29
    const/4 v0, 0x4

    .line 30
    sget-object v1, Lcom/p1/mobile/putong/core/data/GuessLikersSecondRule;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 31
    .line 32
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 33
    .line 34
    .line 35
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;->thirdRule:Lcom/p1/mobile/putong/core/data/GuessLikersThirdRule;

    .line 36
    .line 37
    if-eqz p0, :cond_3

    .line 38
    .line 39
    const/4 p1, 0x5

    .line 40
    sget-object v0, Lcom/p1/mobile/putong/core/data/GuessLikersThirdRule;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/GuessLikersConfig$1;->serialize(Lcom/p1/mobile/putong/core/data/GuessLikersConfig;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
