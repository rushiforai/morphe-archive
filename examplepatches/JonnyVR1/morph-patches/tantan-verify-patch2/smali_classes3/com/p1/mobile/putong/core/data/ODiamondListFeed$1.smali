.class Lcom/p1/mobile/putong/core/data/ODiamondListFeed$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/ODiamondListFeed;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/ODiamondListFeed;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/ODiamondListFeed;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ODiamondListFeed;->userIds:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-static {v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    :goto_0
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ODiamondListFeed;->type:Ljava/lang/String;

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    const/4 v1, 0x2

    .line 23
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    add-int/2addr p0, v0

    .line 28
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ODiamondListFeed;->pick:Lcom/p1/mobile/putong/core/data/ODiamondListFeedPick;

    .line 29
    .line 30
    if-eqz v0, :cond_2

    .line 31
    .line 32
    const/4 v1, 0x3

    .line 33
    sget-object v2, Lcom/p1/mobile/putong/core/data/ODiamondListFeedPick;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ODiamondListFeed;->relation:Lcom/p1/mobile/putong/core/data/ODiamondListFeedRelation;

    .line 41
    .line 42
    if-eqz v0, :cond_3

    .line 43
    .line 44
    const/4 v1, 0x4

    .line 45
    sget-object v2, Lcom/p1/mobile/putong/core/data/ODiamondListFeedRelation;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 46
    .line 47
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    add-int/2addr p0, v0

    .line 52
    :cond_3
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 53
    .line 54
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 55
    check-cast p1, Lcom/p1/mobile/putong/core/data/ODiamondListFeed;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/ODiamondListFeed$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/ODiamondListFeed;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/ODiamondListFeed;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/ODiamondListFeed;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/ODiamondListFeed;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ODiamondListFeed;->userIds:Ljava/util/List;

    .line 31
    .line 32
    if-nez p1, :cond_0

    .line 33
    .line 34
    new-instance p1, Ljava/util/ArrayList;

    .line 35
    .line 36
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 37
    .line 38
    .line 39
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ODiamondListFeed;->userIds:Ljava/util/List;

    .line 40
    .line 41
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ODiamondListFeed;->type:Ljava/lang/String;

    .line 42
    .line 43
    if-nez p1, :cond_1

    .line 44
    .line 45
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ODiamondListFeed;->type:Ljava/lang/String;

    .line 46
    .line 47
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ODiamondListFeed;->pick:Lcom/p1/mobile/putong/core/data/ODiamondListFeedPick;

    .line 48
    .line 49
    if-nez p1, :cond_2

    .line 50
    .line 51
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ODiamondListFeedPick;->new_()Lcom/p1/mobile/putong/core/data/ODiamondListFeedPick;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ODiamondListFeed;->pick:Lcom/p1/mobile/putong/core/data/ODiamondListFeedPick;

    .line 56
    .line 57
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ODiamondListFeed;->relation:Lcom/p1/mobile/putong/core/data/ODiamondListFeedRelation;

    .line 58
    .line 59
    if-nez p1, :cond_b

    .line 60
    .line 61
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ODiamondListFeedRelation;->new_()Lcom/p1/mobile/putong/core/data/ODiamondListFeedRelation;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ODiamondListFeed;->relation:Lcom/p1/mobile/putong/core/data/ODiamondListFeedRelation;

    .line 66
    .line 67
    return-object p0

    .line 68
    :cond_3
    sget-object v0, Lcom/p1/mobile/putong/core/data/ODiamondListFeedRelation;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 69
    .line 70
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    check-cast v0, Lcom/p1/mobile/putong/core/data/ODiamondListFeedRelation;

    .line 75
    .line 76
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ODiamondListFeed;->relation:Lcom/p1/mobile/putong/core/data/ODiamondListFeedRelation;

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_4
    sget-object v0, Lcom/p1/mobile/putong/core/data/ODiamondListFeedPick;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 80
    .line 81
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    check-cast v0, Lcom/p1/mobile/putong/core/data/ODiamondListFeedPick;

    .line 86
    .line 87
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ODiamondListFeed;->pick:Lcom/p1/mobile/putong/core/data/ODiamondListFeedPick;

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_5
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ODiamondListFeed;->type:Ljava/lang/String;

    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_6
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 98
    .line 99
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    check-cast v0, Ljava/util/List;

    .line 108
    .line 109
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ODiamondListFeed;->userIds:Ljava/util/List;

    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ODiamondListFeed;->userIds:Ljava/util/List;

    .line 113
    .line 114
    if-nez p1, :cond_8

    .line 115
    .line 116
    new-instance p1, Ljava/util/ArrayList;

    .line 117
    .line 118
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 119
    .line 120
    .line 121
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ODiamondListFeed;->userIds:Ljava/util/List;

    .line 122
    .line 123
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ODiamondListFeed;->type:Ljava/lang/String;

    .line 124
    .line 125
    if-nez p1, :cond_9

    .line 126
    .line 127
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ODiamondListFeed;->type:Ljava/lang/String;

    .line 128
    .line 129
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ODiamondListFeed;->pick:Lcom/p1/mobile/putong/core/data/ODiamondListFeedPick;

    .line 130
    .line 131
    if-nez p1, :cond_a

    .line 132
    .line 133
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ODiamondListFeedPick;->new_()Lcom/p1/mobile/putong/core/data/ODiamondListFeedPick;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ODiamondListFeed;->pick:Lcom/p1/mobile/putong/core/data/ODiamondListFeedPick;

    .line 138
    .line 139
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ODiamondListFeed;->relation:Lcom/p1/mobile/putong/core/data/ODiamondListFeedRelation;

    .line 140
    .line 141
    if-nez p1, :cond_b

    .line 142
    .line 143
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ODiamondListFeedRelation;->new_()Lcom/p1/mobile/putong/core/data/ODiamondListFeedRelation;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ODiamondListFeed;->relation:Lcom/p1/mobile/putong/core/data/ODiamondListFeedRelation;

    .line 148
    .line 149
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

    .line 150
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/ODiamondListFeed$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/ODiamondListFeed;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/ODiamondListFeed;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ODiamondListFeed;->userIds:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ODiamondListFeed;->type:Ljava/lang/String;

    .line 16
    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    const/4 v0, 0x2

    .line 20
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ODiamondListFeed;->pick:Lcom/p1/mobile/putong/core/data/ODiamondListFeedPick;

    .line 24
    .line 25
    if-eqz p0, :cond_2

    .line 26
    .line 27
    const/4 v0, 0x3

    .line 28
    sget-object v1, Lcom/p1/mobile/putong/core/data/ODiamondListFeedPick;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 29
    .line 30
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 31
    .line 32
    .line 33
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ODiamondListFeed;->relation:Lcom/p1/mobile/putong/core/data/ODiamondListFeedRelation;

    .line 34
    .line 35
    if-eqz p0, :cond_3

    .line 36
    .line 37
    const/4 p1, 0x4

    .line 38
    sget-object v0, Lcom/p1/mobile/putong/core/data/ODiamondListFeedRelation;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 39
    .line 40
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 41
    .line 42
    .line 43
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

    .line 44
    check-cast p1, Lcom/p1/mobile/putong/core/data/ODiamondListFeed;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/ODiamondListFeed$1;->serialize(Lcom/p1/mobile/putong/core/data/ODiamondListFeed;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
