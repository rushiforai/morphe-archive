.class Lcom/p1/mobile/putong/data/LiveActivityConversation$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/LiveActivityConversation;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/LiveActivityConversation;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/LiveActivityConversation;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LiveActivityConversation;->title:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/LiveActivityConversation;->subTitle:Ljava/lang/String;

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
    const/4 v0, 0x3

    .line 23
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/LiveActivityConversation;->startTime:J

    .line 24
    .line 25
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    add-int/2addr p0, v0

    .line 30
    const/4 v0, 0x4

    .line 31
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/LiveActivityConversation;->show:Z

    .line 32
    .line 33
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    add-int/2addr p0, v0

    .line 38
    const/4 v0, 0x5

    .line 39
    iget v1, p1, Lcom/p1/mobile/putong/data/LiveActivityConversation;->unreadCount:I

    .line 40
    .line 41
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    add-int/2addr p0, v0

    .line 46
    const/4 v0, 0x6

    .line 47
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/LiveActivityConversation;->enterLiveActivity:Z

    .line 48
    .line 49
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    add-int/2addr p0, v0

    .line 54
    iget-object v0, p1, Lcom/p1/mobile/putong/data/LiveActivityConversation;->activities:Ljava/util/List;

    .line 55
    .line 56
    if-eqz v0, :cond_2

    .line 57
    .line 58
    sget-object v1, Lcom/p1/mobile/putong/data/LiveActivityConversationAnchor;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 59
    .line 60
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    const/4 v2, 0x7

    .line 65
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    add-int/2addr p0, v0

    .line 70
    :cond_2
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 71
    .line 72
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 73
    check-cast p1, Lcom/p1/mobile/putong/data/LiveActivityConversation;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/LiveActivityConversation$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/LiveActivityConversation;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/LiveActivityConversation;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/LiveActivityConversation;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/LiveActivityConversation;-><init>()V

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
    if-eqz v0, :cond_9

    .line 13
    .line 14
    const/16 v2, 0xa

    .line 15
    .line 16
    if-eq v0, v2, :cond_8

    .line 17
    .line 18
    const/16 v2, 0x12

    .line 19
    .line 20
    if-eq v0, v2, :cond_7

    .line 21
    .line 22
    const/16 v2, 0x18

    .line 23
    .line 24
    if-eq v0, v2, :cond_6

    .line 25
    .line 26
    const/16 v2, 0x20

    .line 27
    .line 28
    if-eq v0, v2, :cond_5

    .line 29
    .line 30
    const/16 v2, 0x28

    .line 31
    .line 32
    if-eq v0, v2, :cond_4

    .line 33
    .line 34
    const/16 v2, 0x30

    .line 35
    .line 36
    if-eq v0, v2, :cond_3

    .line 37
    .line 38
    const/16 v2, 0x3a

    .line 39
    .line 40
    if-eq v0, v2, :cond_2

    .line 41
    .line 42
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveActivityConversation;->title:Ljava/lang/String;

    .line 43
    .line 44
    if-nez p1, :cond_0

    .line 45
    .line 46
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveActivityConversation;->title:Ljava/lang/String;

    .line 47
    .line 48
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveActivityConversation;->subTitle:Ljava/lang/String;

    .line 49
    .line 50
    if-nez p1, :cond_1

    .line 51
    .line 52
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveActivityConversation;->subTitle:Ljava/lang/String;

    .line 53
    .line 54
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveActivityConversation;->activities:Ljava/util/List;

    .line 55
    .line 56
    if-nez p1, :cond_c

    .line 57
    .line 58
    new-instance p1, Ljava/util/ArrayList;

    .line 59
    .line 60
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 61
    .line 62
    .line 63
    iput-object p1, p0, Lcom/p1/mobile/putong/data/LiveActivityConversation;->activities:Ljava/util/List;

    .line 64
    .line 65
    return-object p0

    .line 66
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/data/LiveActivityConversationAnchor;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/data/LiveActivityConversation;->activities:Ljava/util/List;

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_3
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/LiveActivityConversation;->enterLiveActivity:Z

    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_4
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    iput v0, p0, Lcom/p1/mobile/putong/data/LiveActivityConversation;->unreadCount:I

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_5
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/LiveActivityConversation;->show:Z

    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_6
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 103
    .line 104
    .line 105
    move-result-wide v0

    .line 106
    iput-wide v0, p0, Lcom/p1/mobile/putong/data/LiveActivityConversation;->startTime:J

    .line 107
    .line 108
    goto :goto_0

    .line 109
    :cond_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    iput-object v0, p0, Lcom/p1/mobile/putong/data/LiveActivityConversation;->subTitle:Ljava/lang/String;

    .line 114
    .line 115
    goto :goto_0

    .line 116
    :cond_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    iput-object v0, p0, Lcom/p1/mobile/putong/data/LiveActivityConversation;->title:Ljava/lang/String;

    .line 121
    .line 122
    goto :goto_0

    .line 123
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveActivityConversation;->title:Ljava/lang/String;

    .line 124
    .line 125
    if-nez p1, :cond_a

    .line 126
    .line 127
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveActivityConversation;->title:Ljava/lang/String;

    .line 128
    .line 129
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveActivityConversation;->subTitle:Ljava/lang/String;

    .line 130
    .line 131
    if-nez p1, :cond_b

    .line 132
    .line 133
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveActivityConversation;->subTitle:Ljava/lang/String;

    .line 134
    .line 135
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveActivityConversation;->activities:Ljava/util/List;

    .line 136
    .line 137
    if-nez p1, :cond_c

    .line 138
    .line 139
    new-instance p1, Ljava/util/ArrayList;

    .line 140
    .line 141
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 142
    .line 143
    .line 144
    iput-object p1, p0, Lcom/p1/mobile/putong/data/LiveActivityConversation;->activities:Ljava/util/List;

    .line 145
    .line 146
    :cond_c
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
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/LiveActivityConversation$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/LiveActivityConversation;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/LiveActivityConversation;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LiveActivityConversation;->title:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LiveActivityConversation;->subTitle:Ljava/lang/String;

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
    const/4 p0, 0x3

    .line 18
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/LiveActivityConversation;->startTime:J

    .line 19
    .line 20
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 21
    .line 22
    .line 23
    const/4 p0, 0x4

    .line 24
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/LiveActivityConversation;->show:Z

    .line 25
    .line 26
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 27
    .line 28
    .line 29
    const/4 p0, 0x5

    .line 30
    iget v0, p1, Lcom/p1/mobile/putong/data/LiveActivityConversation;->unreadCount:I

    .line 31
    .line 32
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 33
    .line 34
    .line 35
    const/4 p0, 0x6

    .line 36
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/LiveActivityConversation;->enterLiveActivity:Z

    .line 37
    .line 38
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 39
    .line 40
    .line 41
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LiveActivityConversation;->activities:Ljava/util/List;

    .line 42
    .line 43
    if-eqz p0, :cond_2

    .line 44
    .line 45
    sget-object p1, Lcom/p1/mobile/putong/data/LiveActivityConversationAnchor;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 46
    .line 47
    invoke-virtual {p1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    const/4 v0, 0x7

    .line 52
    invoke-virtual {p2, v0, p0, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 53
    .line 54
    .line 55
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

    .line 56
    check-cast p1, Lcom/p1/mobile/putong/data/LiveActivityConversation;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/LiveActivityConversation$1;->serialize(Lcom/p1/mobile/putong/data/LiveActivityConversation;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
