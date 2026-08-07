.class Lcom/p1/mobile/putong/feed/data/OccasionComponent$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/data/OccasionComponent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/feed/data/OccasionComponent;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/feed/data/OccasionComponent;)I
    .locals 2

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/OccasionComponent;->type:Lcom/p1/mobile/putong/feed/data/OccasionType;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    sget-object v1, Lcom/p1/mobile/putong/feed/data/OccasionType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/OccasionComponent;->pageId:Ljava/lang/String;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    const/4 v1, 0x2

    .line 19
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    add-int/2addr p0, v0

    .line 24
    :cond_1
    const/4 v0, 0x3

    .line 25
    iget v1, p1, Lcom/p1/mobile/putong/feed/data/OccasionComponent;->readCount:I

    .line 26
    .line 27
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    add-int/2addr p0, v0

    .line 32
    const/4 v0, 0x4

    .line 33
    iget v1, p1, Lcom/p1/mobile/putong/feed/data/OccasionComponent;->intervalDays:I

    .line 34
    .line 35
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    add-int/2addr p0, v0

    .line 40
    const/4 v0, 0x5

    .line 41
    iget v1, p1, Lcom/p1/mobile/putong/feed/data/OccasionComponent;->showTimes:I

    .line 42
    .line 43
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    add-int/2addr p0, v0

    .line 48
    const/4 v0, 0x6

    .line 49
    iget v1, p1, Lcom/p1/mobile/putong/feed/data/OccasionComponent;->days:I

    .line 50
    .line 51
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    add-int/2addr p0, v0

    .line 56
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 57
    .line 58
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 59
    check-cast p1, Lcom/p1/mobile/putong/feed/data/OccasionComponent;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/data/OccasionComponent$1;->computeAndCacheSize(Lcom/p1/mobile/putong/feed/data/OccasionComponent;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/feed/data/OccasionComponent;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/feed/data/OccasionComponent;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/data/OccasionComponent;-><init>()V

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
    const/16 v2, 0x18

    .line 23
    .line 24
    if-eq v0, v2, :cond_4

    .line 25
    .line 26
    const/16 v2, 0x20

    .line 27
    .line 28
    if-eq v0, v2, :cond_3

    .line 29
    .line 30
    const/16 v2, 0x28

    .line 31
    .line 32
    if-eq v0, v2, :cond_2

    .line 33
    .line 34
    const/16 v2, 0x30

    .line 35
    .line 36
    if-eq v0, v2, :cond_1

    .line 37
    .line 38
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/OccasionComponent;->type:Lcom/p1/mobile/putong/feed/data/OccasionType;

    .line 39
    .line 40
    if-nez p1, :cond_0

    .line 41
    .line 42
    sget-object p1, Lcom/p1/mobile/putong/feed/data/OccasionType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 43
    .line 44
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    check-cast p1, Lcom/p1/mobile/putong/feed/data/OccasionType;

    .line 49
    .line 50
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/OccasionComponent;->type:Lcom/p1/mobile/putong/feed/data/OccasionType;

    .line 51
    .line 52
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/OccasionComponent;->pageId:Ljava/lang/String;

    .line 53
    .line 54
    if-nez p1, :cond_9

    .line 55
    .line 56
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/OccasionComponent;->pageId:Ljava/lang/String;

    .line 57
    .line 58
    return-object p0

    .line 59
    :cond_1
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    iput v0, p0, Lcom/p1/mobile/putong/feed/data/OccasionComponent;->days:I

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_2
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    iput v0, p0, Lcom/p1/mobile/putong/feed/data/OccasionComponent;->showTimes:I

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_3
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    iput v0, p0, Lcom/p1/mobile/putong/feed/data/OccasionComponent;->intervalDays:I

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_4
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    iput v0, p0, Lcom/p1/mobile/putong/feed/data/OccasionComponent;->readCount:I

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_5
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/OccasionComponent;->pageId:Ljava/lang/String;

    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_6
    sget-object v0, Lcom/p1/mobile/putong/feed/data/OccasionType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 95
    .line 96
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    check-cast v0, Lcom/p1/mobile/putong/feed/data/OccasionType;

    .line 101
    .line 102
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/OccasionComponent;->type:Lcom/p1/mobile/putong/feed/data/OccasionType;

    .line 103
    .line 104
    goto :goto_0

    .line 105
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/OccasionComponent;->type:Lcom/p1/mobile/putong/feed/data/OccasionType;

    .line 106
    .line 107
    if-nez p1, :cond_8

    .line 108
    .line 109
    sget-object p1, Lcom/p1/mobile/putong/feed/data/OccasionType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 110
    .line 111
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    check-cast p1, Lcom/p1/mobile/putong/feed/data/OccasionType;

    .line 116
    .line 117
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/OccasionComponent;->type:Lcom/p1/mobile/putong/feed/data/OccasionType;

    .line 118
    .line 119
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/OccasionComponent;->pageId:Ljava/lang/String;

    .line 120
    .line 121
    if-nez p1, :cond_9

    .line 122
    .line 123
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/OccasionComponent;->pageId:Ljava/lang/String;

    .line 124
    .line 125
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

    .line 126
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/data/OccasionComponent$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/feed/data/OccasionComponent;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/feed/data/OccasionComponent;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/OccasionComponent;->type:Lcom/p1/mobile/putong/feed/data/OccasionType;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    sget-object v1, Lcom/p1/mobile/putong/feed/data/OccasionType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 7
    .line 8
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/OccasionComponent;->pageId:Ljava/lang/String;

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    const/4 v0, 0x2

    .line 16
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    const/4 p0, 0x3

    .line 20
    iget v0, p1, Lcom/p1/mobile/putong/feed/data/OccasionComponent;->readCount:I

    .line 21
    .line 22
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 23
    .line 24
    .line 25
    const/4 p0, 0x4

    .line 26
    iget v0, p1, Lcom/p1/mobile/putong/feed/data/OccasionComponent;->intervalDays:I

    .line 27
    .line 28
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 29
    .line 30
    .line 31
    const/4 p0, 0x5

    .line 32
    iget v0, p1, Lcom/p1/mobile/putong/feed/data/OccasionComponent;->showTimes:I

    .line 33
    .line 34
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 35
    .line 36
    .line 37
    const/4 p0, 0x6

    .line 38
    iget p1, p1, Lcom/p1/mobile/putong/feed/data/OccasionComponent;->days:I

    .line 39
    .line 40
    invoke-virtual {p2, p0, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 44
    check-cast p1, Lcom/p1/mobile/putong/feed/data/OccasionComponent;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/data/OccasionComponent$1;->serialize(Lcom/p1/mobile/putong/feed/data/OccasionComponent;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
