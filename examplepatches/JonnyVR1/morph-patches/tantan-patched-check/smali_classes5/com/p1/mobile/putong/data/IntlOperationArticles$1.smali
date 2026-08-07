.class Lcom/p1/mobile/putong/data/IntlOperationArticles$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/IntlOperationArticles;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/IntlOperationArticles;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/IntlOperationArticles;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/IntlOperationArticles;->id:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-static {v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    :goto_0
    iget-object v0, p1, Lcom/p1/mobile/putong/data/IntlOperationArticles;->title:Ljava/lang/String;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    const/4 v1, 0x2

    .line 17
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    add-int/2addr p0, v0

    .line 22
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/IntlOperationArticles;->cover:Lcom/p1/mobile/putong/data/UrlParentData;

    .line 23
    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    const/4 v1, 0x3

    .line 27
    sget-object v2, Lcom/p1/mobile/putong/data/UrlParentData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 28
    .line 29
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    add-int/2addr p0, v0

    .line 34
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/data/IntlOperationArticles;->jumpUrl:Ljava/lang/String;

    .line 35
    .line 36
    if-eqz v0, :cond_3

    .line 37
    .line 38
    const/4 v1, 0x4

    .line 39
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    add-int/2addr p0, v0

    .line 44
    :cond_3
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 45
    .line 46
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 47
    check-cast p1, Lcom/p1/mobile/putong/data/IntlOperationArticles;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/IntlOperationArticles$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/IntlOperationArticles;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/IntlOperationArticles;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/IntlOperationArticles;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/IntlOperationArticles;-><init>()V

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
    const/16 v2, 0x1a

    .line 23
    .line 24
    if-eq v0, v2, :cond_4

    .line 25
    .line 26
    const/16 v2, 0x22

    .line 27
    .line 28
    if-eq v0, v2, :cond_3

    .line 29
    .line 30
    iget-object p1, p0, Lcom/p1/mobile/putong/data/IntlOperationArticles;->id:Ljava/lang/String;

    .line 31
    .line 32
    if-nez p1, :cond_0

    .line 33
    .line 34
    iput-object v1, p0, Lcom/p1/mobile/putong/data/IntlOperationArticles;->id:Ljava/lang/String;

    .line 35
    .line 36
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/IntlOperationArticles;->title:Ljava/lang/String;

    .line 37
    .line 38
    if-nez p1, :cond_1

    .line 39
    .line 40
    iput-object v1, p0, Lcom/p1/mobile/putong/data/IntlOperationArticles;->title:Ljava/lang/String;

    .line 41
    .line 42
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/IntlOperationArticles;->cover:Lcom/p1/mobile/putong/data/UrlParentData;

    .line 43
    .line 44
    if-nez p1, :cond_2

    .line 45
    .line 46
    invoke-static {}, Lcom/p1/mobile/putong/data/UrlParentData;->new_()Lcom/p1/mobile/putong/data/UrlParentData;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    iput-object p1, p0, Lcom/p1/mobile/putong/data/IntlOperationArticles;->cover:Lcom/p1/mobile/putong/data/UrlParentData;

    .line 51
    .line 52
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/IntlOperationArticles;->jumpUrl:Ljava/lang/String;

    .line 53
    .line 54
    if-nez p1, :cond_b

    .line 55
    .line 56
    iput-object v1, p0, Lcom/p1/mobile/putong/data/IntlOperationArticles;->jumpUrl:Ljava/lang/String;

    .line 57
    .line 58
    return-object p0

    .line 59
    :cond_3
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    iput-object v0, p0, Lcom/p1/mobile/putong/data/IntlOperationArticles;->jumpUrl:Ljava/lang/String;

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_4
    sget-object v0, Lcom/p1/mobile/putong/data/UrlParentData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 67
    .line 68
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    check-cast v0, Lcom/p1/mobile/putong/data/UrlParentData;

    .line 73
    .line 74
    iput-object v0, p0, Lcom/p1/mobile/putong/data/IntlOperationArticles;->cover:Lcom/p1/mobile/putong/data/UrlParentData;

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_5
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    iput-object v0, p0, Lcom/p1/mobile/putong/data/IntlOperationArticles;->title:Ljava/lang/String;

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    iput-object v0, p0, Lcom/p1/mobile/putong/data/IntlOperationArticles;->id:Ljava/lang/String;

    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/data/IntlOperationArticles;->id:Ljava/lang/String;

    .line 92
    .line 93
    if-nez p1, :cond_8

    .line 94
    .line 95
    iput-object v1, p0, Lcom/p1/mobile/putong/data/IntlOperationArticles;->id:Ljava/lang/String;

    .line 96
    .line 97
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/data/IntlOperationArticles;->title:Ljava/lang/String;

    .line 98
    .line 99
    if-nez p1, :cond_9

    .line 100
    .line 101
    iput-object v1, p0, Lcom/p1/mobile/putong/data/IntlOperationArticles;->title:Ljava/lang/String;

    .line 102
    .line 103
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/data/IntlOperationArticles;->cover:Lcom/p1/mobile/putong/data/UrlParentData;

    .line 104
    .line 105
    if-nez p1, :cond_a

    .line 106
    .line 107
    invoke-static {}, Lcom/p1/mobile/putong/data/UrlParentData;->new_()Lcom/p1/mobile/putong/data/UrlParentData;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    iput-object p1, p0, Lcom/p1/mobile/putong/data/IntlOperationArticles;->cover:Lcom/p1/mobile/putong/data/UrlParentData;

    .line 112
    .line 113
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/IntlOperationArticles;->jumpUrl:Ljava/lang/String;

    .line 114
    .line 115
    if-nez p1, :cond_b

    .line 116
    .line 117
    iput-object v1, p0, Lcom/p1/mobile/putong/data/IntlOperationArticles;->jumpUrl:Ljava/lang/String;

    .line 118
    .line 119
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

    .line 120
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/IntlOperationArticles$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/IntlOperationArticles;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/IntlOperationArticles;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/IntlOperationArticles;->id:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 7
    .line 8
    .line 9
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/data/IntlOperationArticles;->title:Ljava/lang/String;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    const/4 v0, 0x2

    .line 14
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 15
    .line 16
    .line 17
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/IntlOperationArticles;->cover:Lcom/p1/mobile/putong/data/UrlParentData;

    .line 18
    .line 19
    if-eqz p0, :cond_2

    .line 20
    .line 21
    const/4 v0, 0x3

    .line 22
    sget-object v1, Lcom/p1/mobile/putong/data/UrlParentData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 23
    .line 24
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 25
    .line 26
    .line 27
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/IntlOperationArticles;->jumpUrl:Ljava/lang/String;

    .line 28
    .line 29
    if-eqz p0, :cond_3

    .line 30
    .line 31
    const/4 p1, 0x4

    .line 32
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 33
    .line 34
    .line 35
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

    .line 36
    check-cast p1, Lcom/p1/mobile/putong/data/IntlOperationArticles;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/IntlOperationArticles$1;->serialize(Lcom/p1/mobile/putong/data/IntlOperationArticles;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
