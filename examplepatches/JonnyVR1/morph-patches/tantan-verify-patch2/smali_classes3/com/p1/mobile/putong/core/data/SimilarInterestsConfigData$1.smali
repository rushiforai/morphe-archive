.class Lcom/p1/mobile/putong/core/data/SimilarInterestsConfigData$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/SimilarInterestsConfigData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/SimilarInterestsConfigData;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/SimilarInterestsConfigData;)I
    .locals 3

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/SimilarInterestsConfigData;->enable:Z

    .line 3
    .line 4
    invoke-static {p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/SimilarInterestsConfigData;->mcc:Ljava/util/Map;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    sget-object v1, Lcom/p1/mobile/putong/core/data/SimilarInterestsMccConfigData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 13
    .line 14
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->MAP_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    const/4 v2, 0x2

    .line 19
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    add-int/2addr p0, v0

    .line 24
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/SimilarInterestsConfigData;->baseData:Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;

    .line 25
    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    const/4 v1, 0x3

    .line 29
    sget-object v2, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/SimilarInterestsConfigData;->listData:Ljava/util/Map;

    .line 37
    .line 38
    if-eqz v0, :cond_2

    .line 39
    .line 40
    sget-object v1, Lcom/p1/mobile/putong/core/data/SimilarInterestsItemData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 41
    .line 42
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->MAP_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    const/4 v2, 0x4

    .line 47
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    add-int/2addr p0, v0

    .line 52
    :cond_2
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 53
    .line 54
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 55
    check-cast p1, Lcom/p1/mobile/putong/core/data/SimilarInterestsConfigData;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/SimilarInterestsConfigData$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/SimilarInterestsConfigData;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/SimilarInterestsConfigData;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsConfigData;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/SimilarInterestsConfigData;-><init>()V

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
    const/16 v1, 0x8

    .line 13
    .line 14
    if-eq v0, v1, :cond_5

    .line 15
    .line 16
    const/16 v1, 0x12

    .line 17
    .line 18
    if-eq v0, v1, :cond_4

    .line 19
    .line 20
    const/16 v1, 0x1a

    .line 21
    .line 22
    if-eq v0, v1, :cond_3

    .line 23
    .line 24
    const/16 v1, 0x22

    .line 25
    .line 26
    if-eq v0, v1, :cond_2

    .line 27
    .line 28
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsConfigData;->mcc:Ljava/util/Map;

    .line 29
    .line 30
    if-nez p1, :cond_0

    .line 31
    .line 32
    sget-object p1, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    .line 33
    .line 34
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsConfigData;->mcc:Ljava/util/Map;

    .line 35
    .line 36
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsConfigData;->baseData:Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;

    .line 37
    .line 38
    if-nez p1, :cond_1

    .line 39
    .line 40
    invoke-static {}, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;->new_()Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsConfigData;->baseData:Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;

    .line 45
    .line 46
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsConfigData;->listData:Ljava/util/Map;

    .line 47
    .line 48
    if-nez p1, :cond_9

    .line 49
    .line 50
    sget-object p1, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    .line 51
    .line 52
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsConfigData;->listData:Ljava/util/Map;

    .line 53
    .line 54
    return-object p0

    .line 55
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/core/data/SimilarInterestsItemData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 56
    .line 57
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->MAP_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    check-cast v0, Ljava/util/Map;

    .line 66
    .line 67
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsConfigData;->listData:Ljava/util/Map;

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_3
    sget-object v0, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 71
    .line 72
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    check-cast v0, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;

    .line 77
    .line 78
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsConfigData;->baseData:Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_4
    sget-object v0, Lcom/p1/mobile/putong/core/data/SimilarInterestsMccConfigData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 82
    .line 83
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->MAP_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    check-cast v0, Ljava/util/Map;

    .line 92
    .line 93
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsConfigData;->mcc:Ljava/util/Map;

    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_5
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsConfigData;->enable:Z

    .line 101
    .line 102
    goto :goto_0

    .line 103
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsConfigData;->mcc:Ljava/util/Map;

    .line 104
    .line 105
    if-nez p1, :cond_7

    .line 106
    .line 107
    sget-object p1, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    .line 108
    .line 109
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsConfigData;->mcc:Ljava/util/Map;

    .line 110
    .line 111
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsConfigData;->baseData:Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;

    .line 112
    .line 113
    if-nez p1, :cond_8

    .line 114
    .line 115
    invoke-static {}, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;->new_()Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsConfigData;->baseData:Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;

    .line 120
    .line 121
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsConfigData;->listData:Ljava/util/Map;

    .line 122
    .line 123
    if-nez p1, :cond_9

    .line 124
    .line 125
    sget-object p1, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    .line 126
    .line 127
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsConfigData;->listData:Ljava/util/Map;

    .line 128
    .line 129
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

    .line 130
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/SimilarInterestsConfigData$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/SimilarInterestsConfigData;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/SimilarInterestsConfigData;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/SimilarInterestsConfigData;->enable:Z

    .line 3
    .line 4
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/SimilarInterestsConfigData;->mcc:Ljava/util/Map;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    sget-object v0, Lcom/p1/mobile/putong/core/data/SimilarInterestsMccConfigData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->MAP_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const/4 v1, 0x2

    .line 18
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/SimilarInterestsConfigData;->baseData:Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;

    .line 22
    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    const/4 v0, 0x3

    .line 26
    sget-object v1, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 27
    .line 28
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 29
    .line 30
    .line 31
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/SimilarInterestsConfigData;->listData:Ljava/util/Map;

    .line 32
    .line 33
    if-eqz p0, :cond_2

    .line 34
    .line 35
    sget-object p1, Lcom/p1/mobile/putong/core/data/SimilarInterestsItemData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 36
    .line 37
    invoke-virtual {p1}, Lcom/tantanapp/common/data/ProtobufAdapter;->MAP_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    const/4 v0, 0x4

    .line 42
    invoke-virtual {p2, v0, p0, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 43
    .line 44
    .line 45
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

    .line 46
    check-cast p1, Lcom/p1/mobile/putong/core/data/SimilarInterestsConfigData;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/SimilarInterestsConfigData$1;->serialize(Lcom/p1/mobile/putong/core/data/SimilarInterestsConfigData;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
