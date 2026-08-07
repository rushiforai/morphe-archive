.class Lcom/p1/mobile/putong/data/NearbyBanner$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/NearbyBanner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/NearbyBanner;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/NearbyBanner;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/NearbyBanner;->id:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/NearbyBanner;->materials:Ljava/util/List;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    sget-object v1, Lcom/p1/mobile/putong/data/Material;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 17
    .line 18
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    const/4 v2, 0x2

    .line 23
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    add-int/2addr p0, v0

    .line 28
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/NearbyBanner;->timeRange:Ljava/util/List;

    .line 29
    .line 30
    if-eqz v0, :cond_2

    .line 31
    .line 32
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->LONG_BOXED_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 33
    .line 34
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    const/4 v2, 0x3

    .line 39
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    add-int/2addr p0, v0

    .line 44
    :cond_2
    const/4 v0, 0x4

    .line 45
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/NearbyBanner;->slideshowSec:J

    .line 46
    .line 47
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    add-int/2addr p0, v0

    .line 52
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 53
    .line 54
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 55
    check-cast p1, Lcom/p1/mobile/putong/data/NearbyBanner;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/NearbyBanner$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/NearbyBanner;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/NearbyBanner;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/NearbyBanner;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/NearbyBanner;-><init>()V

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
    if-eqz v0, :cond_6

    .line 13
    .line 14
    const/16 v2, 0xa

    .line 15
    .line 16
    if-eq v0, v2, :cond_5

    .line 17
    .line 18
    const/16 v2, 0x12

    .line 19
    .line 20
    if-eq v0, v2, :cond_4

    .line 21
    .line 22
    const/16 v2, 0x1a

    .line 23
    .line 24
    if-eq v0, v2, :cond_3

    .line 25
    .line 26
    const/16 v2, 0x20

    .line 27
    .line 28
    if-eq v0, v2, :cond_2

    .line 29
    .line 30
    iget-object p1, p0, Lcom/p1/mobile/putong/data/NearbyBanner;->id:Ljava/lang/String;

    .line 31
    .line 32
    if-nez p1, :cond_0

    .line 33
    .line 34
    iput-object v1, p0, Lcom/p1/mobile/putong/data/NearbyBanner;->id:Ljava/lang/String;

    .line 35
    .line 36
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/NearbyBanner;->materials:Ljava/util/List;

    .line 37
    .line 38
    if-nez p1, :cond_1

    .line 39
    .line 40
    new-instance p1, Ljava/util/ArrayList;

    .line 41
    .line 42
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 43
    .line 44
    .line 45
    iput-object p1, p0, Lcom/p1/mobile/putong/data/NearbyBanner;->materials:Ljava/util/List;

    .line 46
    .line 47
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/NearbyBanner;->timeRange:Ljava/util/List;

    .line 48
    .line 49
    if-nez p1, :cond_9

    .line 50
    .line 51
    new-instance p1, Ljava/util/ArrayList;

    .line 52
    .line 53
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 54
    .line 55
    .line 56
    iput-object p1, p0, Lcom/p1/mobile/putong/data/NearbyBanner;->timeRange:Ljava/util/List;

    .line 57
    .line 58
    return-object p0

    .line 59
    :cond_2
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 60
    .line 61
    .line 62
    move-result-wide v0

    .line 63
    iput-wide v0, p0, Lcom/p1/mobile/putong/data/NearbyBanner;->slideshowSec:J

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_3
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->LONG_BOXED_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 67
    .line 68
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    check-cast v0, Ljava/util/List;

    .line 77
    .line 78
    iput-object v0, p0, Lcom/p1/mobile/putong/data/NearbyBanner;->timeRange:Ljava/util/List;

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_4
    sget-object v0, Lcom/p1/mobile/putong/data/Material;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 82
    .line 83
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

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
    check-cast v0, Ljava/util/List;

    .line 92
    .line 93
    iput-object v0, p0, Lcom/p1/mobile/putong/data/NearbyBanner;->materials:Ljava/util/List;

    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_5
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    iput-object v0, p0, Lcom/p1/mobile/putong/data/NearbyBanner;->id:Ljava/lang/String;

    .line 101
    .line 102
    goto :goto_0

    .line 103
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/data/NearbyBanner;->id:Ljava/lang/String;

    .line 104
    .line 105
    if-nez p1, :cond_7

    .line 106
    .line 107
    iput-object v1, p0, Lcom/p1/mobile/putong/data/NearbyBanner;->id:Ljava/lang/String;

    .line 108
    .line 109
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/data/NearbyBanner;->materials:Ljava/util/List;

    .line 110
    .line 111
    if-nez p1, :cond_8

    .line 112
    .line 113
    new-instance p1, Ljava/util/ArrayList;

    .line 114
    .line 115
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 116
    .line 117
    .line 118
    iput-object p1, p0, Lcom/p1/mobile/putong/data/NearbyBanner;->materials:Ljava/util/List;

    .line 119
    .line 120
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/data/NearbyBanner;->timeRange:Ljava/util/List;

    .line 121
    .line 122
    if-nez p1, :cond_9

    .line 123
    .line 124
    new-instance p1, Ljava/util/ArrayList;

    .line 125
    .line 126
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 127
    .line 128
    .line 129
    iput-object p1, p0, Lcom/p1/mobile/putong/data/NearbyBanner;->timeRange:Ljava/util/List;

    .line 130
    .line 131
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

    .line 132
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/NearbyBanner$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/NearbyBanner;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/NearbyBanner;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/NearbyBanner;->id:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/NearbyBanner;->materials:Ljava/util/List;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    sget-object v0, Lcom/p1/mobile/putong/data/Material;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const/4 v1, 0x2

    .line 20
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 21
    .line 22
    .line 23
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/NearbyBanner;->timeRange:Ljava/util/List;

    .line 24
    .line 25
    if-eqz p0, :cond_2

    .line 26
    .line 27
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->LONG_BOXED_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const/4 v1, 0x3

    .line 34
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 35
    .line 36
    .line 37
    :cond_2
    const/4 p0, 0x4

    .line 38
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/NearbyBanner;->slideshowSec:J

    .line 39
    .line 40
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

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
    check-cast p1, Lcom/p1/mobile/putong/data/NearbyBanner;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/NearbyBanner$1;->serialize(Lcom/p1/mobile/putong/data/NearbyBanner;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
