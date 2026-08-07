.class Lcom/p1/mobile/putong/core/data/PicVerificationInfo$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/PicVerificationInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/PicVerificationInfo;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/PicVerificationInfo;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->media:Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    sget-object v1, Lcom/p1/mobile/putong/data/Picture;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 29
    .line 30
    if-eqz v0, :cond_2

    .line 31
    .line 32
    const/4 v1, 0x3

    .line 33
    sget-object v2, Lcom/p1/mobile/putong/data/StudentVerificationStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 34
    .line 35
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    add-int/2addr p0, v0

    .line 40
    :cond_2
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 41
    .line 42
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 43
    check-cast p1, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/PicVerificationInfo$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/PicVerificationInfo;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/PicVerificationInfo;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;-><init>()V

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
    if-eqz v2, :cond_5

    .line 13
    .line 14
    const/16 v3, 0xa

    .line 15
    .line 16
    if-eq v2, v3, :cond_4

    .line 17
    .line 18
    const/16 v3, 0x10

    .line 19
    .line 20
    if-eq v2, v3, :cond_3

    .line 21
    .line 22
    const/16 v3, 0x1a

    .line 23
    .line 24
    if-eq v2, v3, :cond_2

    .line 25
    .line 26
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    if-eqz v1, :cond_0

    .line 31
    .line 32
    sget-object p1, Lcom/p1/mobile/putong/data/StudentVerificationStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 33
    .line 34
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    check-cast p1, Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 43
    .line 44
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 45
    .line 46
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->media:Lcom/p1/mobile/putong/data/Picture;

    .line 47
    .line 48
    if-nez p1, :cond_1

    .line 49
    .line 50
    invoke-static {}, Lcom/p1/mobile/putong/data/Picture;->new_()Lcom/p1/mobile/putong/data/Picture;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->media:Lcom/p1/mobile/putong/data/Picture;

    .line 55
    .line 56
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 57
    .line 58
    if-nez p1, :cond_8

    .line 59
    .line 60
    sget-object p1, Lcom/p1/mobile/putong/data/StudentVerificationStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 61
    .line 62
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    check-cast p1, Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 67
    .line 68
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 69
    .line 70
    return-object p0

    .line 71
    :cond_2
    sget-object v2, Lcom/p1/mobile/putong/data/StudentVerificationStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 72
    .line 73
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    check-cast v2, Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 78
    .line 79
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_3
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    goto :goto_0

    .line 91
    :cond_4
    sget-object v2, Lcom/p1/mobile/putong/data/Picture;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 92
    .line 93
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    check-cast v2, Lcom/p1/mobile/putong/data/Picture;

    .line 98
    .line 99
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->media:Lcom/p1/mobile/putong/data/Picture;

    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 103
    .line 104
    if-nez p1, :cond_6

    .line 105
    .line 106
    if-eqz v1, :cond_6

    .line 107
    .line 108
    sget-object p1, Lcom/p1/mobile/putong/data/StudentVerificationStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 109
    .line 110
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 111
    .line 112
    .line 113
    move-result v1

    .line 114
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    check-cast p1, Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 119
    .line 120
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 121
    .line 122
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->media:Lcom/p1/mobile/putong/data/Picture;

    .line 123
    .line 124
    if-nez p1, :cond_7

    .line 125
    .line 126
    invoke-static {}, Lcom/p1/mobile/putong/data/Picture;->new_()Lcom/p1/mobile/putong/data/Picture;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->media:Lcom/p1/mobile/putong/data/Picture;

    .line 131
    .line 132
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 133
    .line 134
    if-nez p1, :cond_8

    .line 135
    .line 136
    sget-object p1, Lcom/p1/mobile/putong/data/StudentVerificationStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 137
    .line 138
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    check-cast p1, Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 143
    .line 144
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 145
    .line 146
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

    .line 147
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/PicVerificationInfo$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/PicVerificationInfo;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->media:Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    sget-object v1, Lcom/p1/mobile/putong/data/Picture;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 24
    .line 25
    if-eqz p0, :cond_2

    .line 26
    .line 27
    const/4 p1, 0x3

    .line 28
    sget-object v0, Lcom/p1/mobile/putong/data/StudentVerificationStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 29
    .line 30
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 31
    .line 32
    .line 33
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

    .line 34
    check-cast p1, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/PicVerificationInfo$1;->serialize(Lcom/p1/mobile/putong/core/data/PicVerificationInfo;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
