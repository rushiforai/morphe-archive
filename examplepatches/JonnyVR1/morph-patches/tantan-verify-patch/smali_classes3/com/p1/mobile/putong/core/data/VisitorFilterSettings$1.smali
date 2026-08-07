.class Lcom/p1/mobile/putong/core/data/VisitorFilterSettings$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;)I
    .locals 3

    .line 1
    const/4 p0, 0x1

    .line 2
    iget v0, p1, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->distance:I

    .line 3
    .line 4
    invoke-static {p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    const/4 v0, 0x2

    .line 9
    iget v1, p1, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->minAge:I

    .line 10
    .line 11
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    add-int/2addr p0, v0

    .line 16
    const/4 v0, 0x3

    .line 17
    iget v1, p1, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->maxAge:I

    .line 18
    .line 19
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    add-int/2addr p0, v0

    .line 24
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->filter:Lcom/p1/mobile/putong/core/data/VisitorFilterType;

    .line 25
    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    const/4 v1, 0x4

    .line 29
    sget-object v2, Lcom/p1/mobile/putong/core/data/VisitorFilterType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

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
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->sort:Lcom/p1/mobile/putong/core/data/VisitorSortType;

    .line 37
    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    const/4 v1, 0x5

    .line 41
    sget-object v2, Lcom/p1/mobile/putong/core/data/VisitorSortType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

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
    :cond_1
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 49
    .line 50
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 51
    check-cast p1, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;-><init>()V

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
    const/16 v1, 0x22

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->filter:Lcom/p1/mobile/putong/core/data/VisitorFilterType;

    .line 33
    .line 34
    if-nez p1, :cond_0

    .line 35
    .line 36
    sget-object p1, Lcom/p1/mobile/putong/core/data/VisitorFilterType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 37
    .line 38
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    check-cast p1, Lcom/p1/mobile/putong/core/data/VisitorFilterType;

    .line 43
    .line 44
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->filter:Lcom/p1/mobile/putong/core/data/VisitorFilterType;

    .line 45
    .line 46
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->sort:Lcom/p1/mobile/putong/core/data/VisitorSortType;

    .line 47
    .line 48
    if-nez p1, :cond_8

    .line 49
    .line 50
    sget-object p1, Lcom/p1/mobile/putong/core/data/VisitorSortType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 51
    .line 52
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    check-cast p1, Lcom/p1/mobile/putong/core/data/VisitorSortType;

    .line 57
    .line 58
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->sort:Lcom/p1/mobile/putong/core/data/VisitorSortType;

    .line 59
    .line 60
    return-object p0

    .line 61
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/data/VisitorSortType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 62
    .line 63
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    check-cast v0, Lcom/p1/mobile/putong/core/data/VisitorSortType;

    .line 68
    .line 69
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->sort:Lcom/p1/mobile/putong/core/data/VisitorSortType;

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/core/data/VisitorFilterType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 73
    .line 74
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    check-cast v0, Lcom/p1/mobile/putong/core/data/VisitorFilterType;

    .line 79
    .line 80
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->filter:Lcom/p1/mobile/putong/core/data/VisitorFilterType;

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_3
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    iput v0, p0, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->maxAge:I

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_4
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    iput v0, p0, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->minAge:I

    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_5
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    iput v0, p0, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->distance:I

    .line 102
    .line 103
    goto :goto_0

    .line 104
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->filter:Lcom/p1/mobile/putong/core/data/VisitorFilterType;

    .line 105
    .line 106
    if-nez p1, :cond_7

    .line 107
    .line 108
    sget-object p1, Lcom/p1/mobile/putong/core/data/VisitorFilterType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 109
    .line 110
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    check-cast p1, Lcom/p1/mobile/putong/core/data/VisitorFilterType;

    .line 115
    .line 116
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->filter:Lcom/p1/mobile/putong/core/data/VisitorFilterType;

    .line 117
    .line 118
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->sort:Lcom/p1/mobile/putong/core/data/VisitorSortType;

    .line 119
    .line 120
    if-nez p1, :cond_8

    .line 121
    .line 122
    sget-object p1, Lcom/p1/mobile/putong/core/data/VisitorSortType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 123
    .line 124
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    check-cast p1, Lcom/p1/mobile/putong/core/data/VisitorSortType;

    .line 129
    .line 130
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->sort:Lcom/p1/mobile/putong/core/data/VisitorSortType;

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
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    iget v0, p1, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->distance:I

    .line 3
    .line 4
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 5
    .line 6
    .line 7
    const/4 p0, 0x2

    .line 8
    iget v0, p1, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->minAge:I

    .line 9
    .line 10
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 11
    .line 12
    .line 13
    const/4 p0, 0x3

    .line 14
    iget v0, p1, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->maxAge:I

    .line 15
    .line 16
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->filter:Lcom/p1/mobile/putong/core/data/VisitorFilterType;

    .line 20
    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    const/4 v0, 0x4

    .line 24
    sget-object v1, Lcom/p1/mobile/putong/core/data/VisitorFilterType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 25
    .line 26
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->sort:Lcom/p1/mobile/putong/core/data/VisitorSortType;

    .line 30
    .line 31
    if-eqz p0, :cond_1

    .line 32
    .line 33
    const/4 p1, 0x5

    .line 34
    sget-object v0, Lcom/p1/mobile/putong/core/data/VisitorSortType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings$1;->serialize(Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
