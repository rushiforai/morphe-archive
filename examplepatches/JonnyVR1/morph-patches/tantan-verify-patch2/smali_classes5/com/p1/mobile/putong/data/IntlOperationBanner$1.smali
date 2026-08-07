.class Lcom/p1/mobile/putong/data/IntlOperationBanner$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/IntlOperationBanner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/IntlOperationBanner;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/IntlOperationBanner;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/IntlOperationBanner;->id:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/IntlOperationBanner;->banner:Lcom/p1/mobile/putong/data/UrlParentData;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    const/4 v1, 0x2

    .line 17
    sget-object v2, Lcom/p1/mobile/putong/data/UrlParentData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 18
    .line 19
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    add-int/2addr p0, v0

    .line 24
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/IntlOperationBanner;->icon:Lcom/p1/mobile/putong/data/UrlParentData;

    .line 25
    .line 26
    if-eqz v0, :cond_2

    .line 27
    .line 28
    const/4 v1, 0x3

    .line 29
    sget-object v2, Lcom/p1/mobile/putong/data/UrlParentData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/data/IntlOperationBanner;->jumpUrl:Ljava/lang/String;

    .line 37
    .line 38
    if-eqz v0, :cond_3

    .line 39
    .line 40
    const/4 v1, 0x4

    .line 41
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    add-int/2addr p0, v0

    .line 46
    :cond_3
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 47
    .line 48
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 49
    check-cast p1, Lcom/p1/mobile/putong/data/IntlOperationBanner;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/IntlOperationBanner$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/IntlOperationBanner;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/IntlOperationBanner;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/IntlOperationBanner;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/IntlOperationBanner;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/data/IntlOperationBanner;->id:Ljava/lang/String;

    .line 31
    .line 32
    if-nez p1, :cond_0

    .line 33
    .line 34
    iput-object v1, p0, Lcom/p1/mobile/putong/data/IntlOperationBanner;->id:Ljava/lang/String;

    .line 35
    .line 36
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/IntlOperationBanner;->banner:Lcom/p1/mobile/putong/data/UrlParentData;

    .line 37
    .line 38
    if-nez p1, :cond_1

    .line 39
    .line 40
    invoke-static {}, Lcom/p1/mobile/putong/data/UrlParentData;->new_()Lcom/p1/mobile/putong/data/UrlParentData;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    iput-object p1, p0, Lcom/p1/mobile/putong/data/IntlOperationBanner;->banner:Lcom/p1/mobile/putong/data/UrlParentData;

    .line 45
    .line 46
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/IntlOperationBanner;->icon:Lcom/p1/mobile/putong/data/UrlParentData;

    .line 47
    .line 48
    if-nez p1, :cond_2

    .line 49
    .line 50
    invoke-static {}, Lcom/p1/mobile/putong/data/UrlParentData;->new_()Lcom/p1/mobile/putong/data/UrlParentData;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    iput-object p1, p0, Lcom/p1/mobile/putong/data/IntlOperationBanner;->icon:Lcom/p1/mobile/putong/data/UrlParentData;

    .line 55
    .line 56
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/IntlOperationBanner;->jumpUrl:Ljava/lang/String;

    .line 57
    .line 58
    if-nez p1, :cond_b

    .line 59
    .line 60
    iput-object v1, p0, Lcom/p1/mobile/putong/data/IntlOperationBanner;->jumpUrl:Ljava/lang/String;

    .line 61
    .line 62
    return-object p0

    .line 63
    :cond_3
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    iput-object v0, p0, Lcom/p1/mobile/putong/data/IntlOperationBanner;->jumpUrl:Ljava/lang/String;

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_4
    sget-object v0, Lcom/p1/mobile/putong/data/UrlParentData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 71
    .line 72
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    check-cast v0, Lcom/p1/mobile/putong/data/UrlParentData;

    .line 77
    .line 78
    iput-object v0, p0, Lcom/p1/mobile/putong/data/IntlOperationBanner;->icon:Lcom/p1/mobile/putong/data/UrlParentData;

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_5
    sget-object v0, Lcom/p1/mobile/putong/data/UrlParentData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 82
    .line 83
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    check-cast v0, Lcom/p1/mobile/putong/data/UrlParentData;

    .line 88
    .line 89
    iput-object v0, p0, Lcom/p1/mobile/putong/data/IntlOperationBanner;->banner:Lcom/p1/mobile/putong/data/UrlParentData;

    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    iput-object v0, p0, Lcom/p1/mobile/putong/data/IntlOperationBanner;->id:Ljava/lang/String;

    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/data/IntlOperationBanner;->id:Ljava/lang/String;

    .line 100
    .line 101
    if-nez p1, :cond_8

    .line 102
    .line 103
    iput-object v1, p0, Lcom/p1/mobile/putong/data/IntlOperationBanner;->id:Ljava/lang/String;

    .line 104
    .line 105
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/data/IntlOperationBanner;->banner:Lcom/p1/mobile/putong/data/UrlParentData;

    .line 106
    .line 107
    if-nez p1, :cond_9

    .line 108
    .line 109
    invoke-static {}, Lcom/p1/mobile/putong/data/UrlParentData;->new_()Lcom/p1/mobile/putong/data/UrlParentData;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    iput-object p1, p0, Lcom/p1/mobile/putong/data/IntlOperationBanner;->banner:Lcom/p1/mobile/putong/data/UrlParentData;

    .line 114
    .line 115
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/data/IntlOperationBanner;->icon:Lcom/p1/mobile/putong/data/UrlParentData;

    .line 116
    .line 117
    if-nez p1, :cond_a

    .line 118
    .line 119
    invoke-static {}, Lcom/p1/mobile/putong/data/UrlParentData;->new_()Lcom/p1/mobile/putong/data/UrlParentData;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    iput-object p1, p0, Lcom/p1/mobile/putong/data/IntlOperationBanner;->icon:Lcom/p1/mobile/putong/data/UrlParentData;

    .line 124
    .line 125
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/IntlOperationBanner;->jumpUrl:Ljava/lang/String;

    .line 126
    .line 127
    if-nez p1, :cond_b

    .line 128
    .line 129
    iput-object v1, p0, Lcom/p1/mobile/putong/data/IntlOperationBanner;->jumpUrl:Ljava/lang/String;

    .line 130
    .line 131
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

    .line 132
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/IntlOperationBanner$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/IntlOperationBanner;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/IntlOperationBanner;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/IntlOperationBanner;->id:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/IntlOperationBanner;->banner:Lcom/p1/mobile/putong/data/UrlParentData;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    const/4 v0, 0x2

    .line 14
    sget-object v1, Lcom/p1/mobile/putong/data/UrlParentData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 15
    .line 16
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/IntlOperationBanner;->icon:Lcom/p1/mobile/putong/data/UrlParentData;

    .line 20
    .line 21
    if-eqz p0, :cond_2

    .line 22
    .line 23
    const/4 v0, 0x3

    .line 24
    sget-object v1, Lcom/p1/mobile/putong/data/UrlParentData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 25
    .line 26
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 27
    .line 28
    .line 29
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/IntlOperationBanner;->jumpUrl:Ljava/lang/String;

    .line 30
    .line 31
    if-eqz p0, :cond_3

    .line 32
    .line 33
    const/4 p1, 0x4

    .line 34
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 35
    .line 36
    .line 37
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

    .line 38
    check-cast p1, Lcom/p1/mobile/putong/data/IntlOperationBanner;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/IntlOperationBanner$1;->serialize(Lcom/p1/mobile/putong/data/IntlOperationBanner;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
