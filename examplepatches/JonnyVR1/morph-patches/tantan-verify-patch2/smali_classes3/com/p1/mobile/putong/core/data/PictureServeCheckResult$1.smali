.class Lcom/p1/mobile/putong/core/data/PictureServeCheckResult$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;->notVerificationResultData:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    sget-object v1, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;->repeatPictureResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    const/4 v1, 0x2

    .line 19
    sget-object v2, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;->netPictureResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 27
    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    const/4 v1, 0x3

    .line 31
    sget-object v2, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;->lowPhotoResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 39
    .line 40
    if-eqz v0, :cond_3

    .line 41
    .line 42
    const/4 v1, 0x4

    .line 43
    sget-object v2, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 51
    .line 52
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 53
    check-cast p1, Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/PictureServeCheckResult$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;-><init>()V

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
    if-eqz v0, :cond_7

    .line 11
    .line 12
    const/16 v1, 0xa

    .line 13
    .line 14
    if-eq v0, v1, :cond_6

    .line 15
    .line 16
    const/16 v1, 0x12

    .line 17
    .line 18
    if-eq v0, v1, :cond_5

    .line 19
    .line 20
    const/16 v1, 0x1a

    .line 21
    .line 22
    if-eq v0, v1, :cond_4

    .line 23
    .line 24
    const/16 v1, 0x22

    .line 25
    .line 26
    if-eq v0, v1, :cond_3

    .line 27
    .line 28
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;->notVerificationResultData:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 29
    .line 30
    if-nez p1, :cond_0

    .line 31
    .line 32
    invoke-static {}, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->new_()Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;->notVerificationResultData:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 37
    .line 38
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;->repeatPictureResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 39
    .line 40
    if-nez p1, :cond_1

    .line 41
    .line 42
    invoke-static {}, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->new_()Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;->repeatPictureResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 47
    .line 48
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;->netPictureResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 49
    .line 50
    if-nez p1, :cond_2

    .line 51
    .line 52
    invoke-static {}, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->new_()Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;->netPictureResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 57
    .line 58
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;->lowPhotoResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 59
    .line 60
    if-nez p1, :cond_b

    .line 61
    .line 62
    invoke-static {}, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->new_()Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;->lowPhotoResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 67
    .line 68
    return-object p0

    .line 69
    :cond_3
    sget-object v0, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 70
    .line 71
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    check-cast v0, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 76
    .line 77
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;->lowPhotoResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_4
    sget-object v0, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 81
    .line 82
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    check-cast v0, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 87
    .line 88
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;->netPictureResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_5
    sget-object v0, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 92
    .line 93
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    check-cast v0, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 98
    .line 99
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;->repeatPictureResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_6
    sget-object v0, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 103
    .line 104
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    check-cast v0, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 109
    .line 110
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;->notVerificationResultData:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 111
    .line 112
    goto :goto_0

    .line 113
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;->notVerificationResultData:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 114
    .line 115
    if-nez p1, :cond_8

    .line 116
    .line 117
    invoke-static {}, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->new_()Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;->notVerificationResultData:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 122
    .line 123
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;->repeatPictureResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 124
    .line 125
    if-nez p1, :cond_9

    .line 126
    .line 127
    invoke-static {}, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->new_()Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;->repeatPictureResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 132
    .line 133
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;->netPictureResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 134
    .line 135
    if-nez p1, :cond_a

    .line 136
    .line 137
    invoke-static {}, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->new_()Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;->netPictureResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 142
    .line 143
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;->lowPhotoResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 144
    .line 145
    if-nez p1, :cond_b

    .line 146
    .line 147
    invoke-static {}, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->new_()Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;->lowPhotoResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 152
    .line 153
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

    .line 154
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/PictureServeCheckResult$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;->notVerificationResultData:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    sget-object v1, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;->repeatPictureResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    const/4 v0, 0x2

    .line 16
    sget-object v1, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 17
    .line 18
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;->netPictureResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 22
    .line 23
    if-eqz p0, :cond_2

    .line 24
    .line 25
    const/4 v0, 0x3

    .line 26
    sget-object v1, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 27
    .line 28
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 29
    .line 30
    .line 31
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;->lowPhotoResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 32
    .line 33
    if-eqz p0, :cond_3

    .line 34
    .line 35
    const/4 p1, 0x4

    .line 36
    sget-object v0, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 37
    .line 38
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 39
    .line 40
    .line 41
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

    .line 42
    check-cast p1, Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/PictureServeCheckResult$1;->serialize(Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
