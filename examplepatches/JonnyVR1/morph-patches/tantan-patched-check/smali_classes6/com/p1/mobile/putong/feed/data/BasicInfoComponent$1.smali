.class Lcom/p1/mobile/putong/feed/data/BasicInfoComponent$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;->pageId:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;->param:Lcom/p1/mobile/putong/feed/data/BuryingPointParam;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    const/4 v1, 0x2

    .line 17
    sget-object v2, Lcom/p1/mobile/putong/feed/data/BuryingPointParam;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;->type:Ljava/lang/String;

    .line 25
    .line 26
    if-eqz v0, :cond_2

    .line 27
    .line 28
    const/4 v1, 0x3

    .line 29
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    add-int/2addr p0, v0

    .line 34
    :cond_2
    const/4 v0, 0x4

    .line 35
    iget v1, p1, Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;->priority:I

    .line 36
    .line 37
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    add-int/2addr p0, v0

    .line 42
    const/4 v0, 0x5

    .line 43
    iget-wide v1, p1, Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;->expireTime:J

    .line 44
    .line 45
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    add-int/2addr p0, v0

    .line 50
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;->name:Ljava/lang/String;

    .line 51
    .line 52
    if-eqz v0, :cond_3

    .line 53
    .line 54
    const/4 v1, 0x6

    .line 55
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    add-int/2addr p0, v0

    .line 60
    :cond_3
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 61
    .line 62
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 63
    check-cast p1, Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/data/BasicInfoComponent$1;->computeAndCacheSize(Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;-><init>()V

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
    const/16 v2, 0x1a

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
    const/16 v2, 0x32

    .line 35
    .line 36
    if-eq v0, v2, :cond_3

    .line 37
    .line 38
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;->pageId:Ljava/lang/String;

    .line 39
    .line 40
    if-nez p1, :cond_0

    .line 41
    .line 42
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;->pageId:Ljava/lang/String;

    .line 43
    .line 44
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;->param:Lcom/p1/mobile/putong/feed/data/BuryingPointParam;

    .line 45
    .line 46
    if-nez p1, :cond_1

    .line 47
    .line 48
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/BuryingPointParam;->new_()Lcom/p1/mobile/putong/feed/data/BuryingPointParam;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;->param:Lcom/p1/mobile/putong/feed/data/BuryingPointParam;

    .line 53
    .line 54
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;->type:Ljava/lang/String;

    .line 55
    .line 56
    if-nez p1, :cond_2

    .line 57
    .line 58
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;->type:Ljava/lang/String;

    .line 59
    .line 60
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;->name:Ljava/lang/String;

    .line 61
    .line 62
    if-nez p1, :cond_d

    .line 63
    .line 64
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;->name:Ljava/lang/String;

    .line 65
    .line 66
    return-object p0

    .line 67
    :cond_3
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;->name:Ljava/lang/String;

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_4
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 75
    .line 76
    .line 77
    move-result-wide v0

    .line 78
    iput-wide v0, p0, Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;->expireTime:J

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_5
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    iput v0, p0, Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;->priority:I

    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;->type:Ljava/lang/String;

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_7
    sget-object v0, Lcom/p1/mobile/putong/feed/data/BuryingPointParam;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 96
    .line 97
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    check-cast v0, Lcom/p1/mobile/putong/feed/data/BuryingPointParam;

    .line 102
    .line 103
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;->param:Lcom/p1/mobile/putong/feed/data/BuryingPointParam;

    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;->pageId:Ljava/lang/String;

    .line 111
    .line 112
    goto :goto_0

    .line 113
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;->pageId:Ljava/lang/String;

    .line 114
    .line 115
    if-nez p1, :cond_a

    .line 116
    .line 117
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;->pageId:Ljava/lang/String;

    .line 118
    .line 119
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;->param:Lcom/p1/mobile/putong/feed/data/BuryingPointParam;

    .line 120
    .line 121
    if-nez p1, :cond_b

    .line 122
    .line 123
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/BuryingPointParam;->new_()Lcom/p1/mobile/putong/feed/data/BuryingPointParam;

    .line 124
    .line 125
    .line 126
    move-result-object p1

    .line 127
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;->param:Lcom/p1/mobile/putong/feed/data/BuryingPointParam;

    .line 128
    .line 129
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;->type:Ljava/lang/String;

    .line 130
    .line 131
    if-nez p1, :cond_c

    .line 132
    .line 133
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;->type:Ljava/lang/String;

    .line 134
    .line 135
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;->name:Ljava/lang/String;

    .line 136
    .line 137
    if-nez p1, :cond_d

    .line 138
    .line 139
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;->name:Ljava/lang/String;

    .line 140
    .line 141
    :cond_d
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 142
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/data/BasicInfoComponent$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;->pageId:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;->param:Lcom/p1/mobile/putong/feed/data/BuryingPointParam;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    const/4 v0, 0x2

    .line 14
    sget-object v1, Lcom/p1/mobile/putong/feed/data/BuryingPointParam;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 15
    .line 16
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;->type:Ljava/lang/String;

    .line 20
    .line 21
    if-eqz p0, :cond_2

    .line 22
    .line 23
    const/4 v0, 0x3

    .line 24
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 25
    .line 26
    .line 27
    :cond_2
    const/4 p0, 0x4

    .line 28
    iget v0, p1, Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;->priority:I

    .line 29
    .line 30
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 31
    .line 32
    .line 33
    const/4 p0, 0x5

    .line 34
    iget-wide v0, p1, Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;->expireTime:J

    .line 35
    .line 36
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 37
    .line 38
    .line 39
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;->name:Ljava/lang/String;

    .line 40
    .line 41
    if-eqz p0, :cond_3

    .line 42
    .line 43
    const/4 p1, 0x6

    .line 44
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 45
    .line 46
    .line 47
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

    .line 48
    check-cast p1, Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/data/BasicInfoComponent$1;->serialize(Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
