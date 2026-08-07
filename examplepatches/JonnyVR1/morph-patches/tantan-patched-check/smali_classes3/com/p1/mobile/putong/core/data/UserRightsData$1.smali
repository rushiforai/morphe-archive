.class Lcom/p1/mobile/putong/core/data/UserRightsData$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/UserRightsData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/UserRightsData;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/UserRightsData;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/UserRightsData;->rights:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-static {p0}, Lcom/p1/mobile/putong/core/data/UserRights;->covertToOldEnumList(Ljava/util/List;)Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget-object v0, Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const/4 v1, 0x1

    .line 16
    invoke-static {v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    :goto_0
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/UserRightsData;->rights:Ljava/util/List;

    .line 23
    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    sget-object v1, Lcom/p1/mobile/putong/core/data/UserRights;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 27
    .line 28
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    const/4 v2, 0x2

    .line 33
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    add-int/2addr p0, v0

    .line 38
    :cond_1
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 39
    .line 40
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 41
    check-cast p1, Lcom/p1/mobile/putong/core/data/UserRightsData;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/UserRightsData$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/UserRightsData;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/UserRightsData;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/UserRightsData;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/UserRightsData;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    :goto_0
    invoke-virtual {p1}, Ll/nc5;->u()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_3

    .line 12
    .line 13
    const/16 v2, 0xa

    .line 14
    .line 15
    if-eq v1, v2, :cond_2

    .line 16
    .line 17
    const/16 v2, 0x12

    .line 18
    .line 19
    if-eq v1, v2, :cond_1

    .line 20
    .line 21
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/UserRightsData;->rights:Ljava/util/List;

    .line 22
    .line 23
    if-nez p1, :cond_0

    .line 24
    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/UserRights;->oldEnumCovertList(Ljava/util/List;)Ljava/util/List;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/UserRightsData;->rights:Ljava/util/List;

    .line 32
    .line 33
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/UserRightsData;->rights:Ljava/util/List;

    .line 34
    .line 35
    if-nez p1, :cond_5

    .line 36
    .line 37
    new-instance p1, Ljava/util/ArrayList;

    .line 38
    .line 39
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 40
    .line 41
    .line 42
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/UserRightsData;->rights:Ljava/util/List;

    .line 43
    .line 44
    return-object p0

    .line 45
    :cond_1
    sget-object v1, Lcom/p1/mobile/putong/core/data/UserRights;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 46
    .line 47
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {p1, v1}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    check-cast v1, Ljava/util/List;

    .line 56
    .line 57
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/UserRightsData;->rights:Ljava/util/List;

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;

    .line 61
    .line 62
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    check-cast v0, Ljava/util/List;

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/UserRightsData;->rights:Ljava/util/List;

    .line 74
    .line 75
    if-nez p1, :cond_4

    .line 76
    .line 77
    if-eqz v0, :cond_4

    .line 78
    .line 79
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/UserRights;->oldEnumCovertList(Ljava/util/List;)Ljava/util/List;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/UserRightsData;->rights:Ljava/util/List;

    .line 84
    .line 85
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/UserRightsData;->rights:Ljava/util/List;

    .line 86
    .line 87
    if-nez p1, :cond_5

    .line 88
    .line 89
    new-instance p1, Ljava/util/ArrayList;

    .line 90
    .line 91
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 92
    .line 93
    .line 94
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/UserRightsData;->rights:Ljava/util/List;

    .line 95
    .line 96
    :cond_5
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 97
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/UserRightsData$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/UserRightsData;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/UserRightsData;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/UserRightsData;->rights:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-static {p0}, Lcom/p1/mobile/putong/core/data/UserRights;->covertToOldEnumList(Ljava/util/List;)Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget-object v0, Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const/4 v1, 0x1

    .line 16
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/UserRightsData;->rights:Ljava/util/List;

    .line 20
    .line 21
    if-eqz p0, :cond_1

    .line 22
    .line 23
    sget-object p1, Lcom/p1/mobile/putong/core/data/UserRights;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 24
    .line 25
    invoke-virtual {p1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    const/4 v0, 0x2

    .line 30
    invoke-virtual {p2, v0, p0, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 31
    .line 32
    .line 33
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

    .line 34
    check-cast p1, Lcom/p1/mobile/putong/core/data/UserRightsData;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/UserRightsData$1;->serialize(Lcom/p1/mobile/putong/core/data/UserRightsData;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
