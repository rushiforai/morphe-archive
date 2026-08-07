.class Lcom/p1/mobile/putong/core/data/TimeLimited$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/TimeLimited;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/TimeLimited;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/TimeLimited;)I
    .locals 3

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/TimeLimited;->expiredTimestamp:J

    .line 3
    .line 4
    invoke-static {p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/TimeLimited;->participate:Ljava/lang/String;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const/4 v1, 0x2

    .line 13
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    add-int/2addr p0, v0

    .line 18
    :cond_0
    const/4 v0, 0x3

    .line 19
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/TimeLimited;->allowExtension:Z

    .line 20
    .line 21
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    add-int/2addr p0, v0

    .line 26
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/TimeLimited;->extensionOperator:Ljava/lang/String;

    .line 27
    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    const/4 v1, 0x4

    .line 31
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    add-int/2addr p0, v0

    .line 36
    :cond_1
    const/4 v0, 0x5

    .line 37
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/TimeLimited;->hidden:Z

    .line 38
    .line 39
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    add-int/2addr p0, v0

    .line 44
    const/4 v0, 0x6

    .line 45
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/TimeLimited;->newConversation:Z

    .line 46
    .line 47
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    add-int/2addr p0, v0

    .line 52
    const/4 v0, 0x7

    .line 53
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/TimeLimited;->expiredSeconds:J

    .line 54
    .line 55
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    add-int/2addr p0, v0

    .line 60
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 61
    .line 62
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 63
    check-cast p1, Lcom/p1/mobile/putong/core/data/TimeLimited;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/TimeLimited$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/TimeLimited;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/TimeLimited;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/TimeLimited;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/TimeLimited;-><init>()V

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
    if-eqz v0, :cond_8

    .line 13
    .line 14
    const/16 v2, 0x8

    .line 15
    .line 16
    if-eq v0, v2, :cond_7

    .line 17
    .line 18
    const/16 v2, 0x12

    .line 19
    .line 20
    if-eq v0, v2, :cond_6

    .line 21
    .line 22
    const/16 v2, 0x18

    .line 23
    .line 24
    if-eq v0, v2, :cond_5

    .line 25
    .line 26
    const/16 v2, 0x22

    .line 27
    .line 28
    if-eq v0, v2, :cond_4

    .line 29
    .line 30
    const/16 v2, 0x28

    .line 31
    .line 32
    if-eq v0, v2, :cond_3

    .line 33
    .line 34
    const/16 v2, 0x30

    .line 35
    .line 36
    if-eq v0, v2, :cond_2

    .line 37
    .line 38
    const/16 v2, 0x38

    .line 39
    .line 40
    if-eq v0, v2, :cond_1

    .line 41
    .line 42
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/TimeLimited;->participate:Ljava/lang/String;

    .line 43
    .line 44
    if-nez p1, :cond_0

    .line 45
    .line 46
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/TimeLimited;->participate:Ljava/lang/String;

    .line 47
    .line 48
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/TimeLimited;->extensionOperator:Ljava/lang/String;

    .line 49
    .line 50
    if-nez p1, :cond_a

    .line 51
    .line 52
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/TimeLimited;->extensionOperator:Ljava/lang/String;

    .line 53
    .line 54
    return-object p0

    .line 55
    :cond_1
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 56
    .line 57
    .line 58
    move-result-wide v0

    .line 59
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/TimeLimited;->expiredSeconds:J

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_2
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/TimeLimited;->newConversation:Z

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_3
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/TimeLimited;->hidden:Z

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_4
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/TimeLimited;->extensionOperator:Ljava/lang/String;

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_5
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/TimeLimited;->allowExtension:Z

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/TimeLimited;->participate:Ljava/lang/String;

    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_7
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 98
    .line 99
    .line 100
    move-result-wide v0

    .line 101
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/TimeLimited;->expiredTimestamp:J

    .line 102
    .line 103
    goto :goto_0

    .line 104
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/TimeLimited;->participate:Ljava/lang/String;

    .line 105
    .line 106
    if-nez p1, :cond_9

    .line 107
    .line 108
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/TimeLimited;->participate:Ljava/lang/String;

    .line 109
    .line 110
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/TimeLimited;->extensionOperator:Ljava/lang/String;

    .line 111
    .line 112
    if-nez p1, :cond_a

    .line 113
    .line 114
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/TimeLimited;->extensionOperator:Ljava/lang/String;

    .line 115
    .line 116
    :cond_a
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 117
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/TimeLimited$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/TimeLimited;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/TimeLimited;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/TimeLimited;->expiredTimestamp:J

    .line 3
    .line 4
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/TimeLimited;->participate:Ljava/lang/String;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x2

    .line 12
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    const/4 p0, 0x3

    .line 16
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/TimeLimited;->allowExtension:Z

    .line 17
    .line 18
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/TimeLimited;->extensionOperator:Ljava/lang/String;

    .line 22
    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    const/4 v0, 0x4

    .line 26
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 27
    .line 28
    .line 29
    :cond_1
    const/4 p0, 0x5

    .line 30
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/TimeLimited;->hidden:Z

    .line 31
    .line 32
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 33
    .line 34
    .line 35
    const/4 p0, 0x6

    .line 36
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/TimeLimited;->newConversation:Z

    .line 37
    .line 38
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 39
    .line 40
    .line 41
    const/4 p0, 0x7

    .line 42
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/TimeLimited;->expiredSeconds:J

    .line 43
    .line 44
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 45
    .line 46
    .line 47
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
    check-cast p1, Lcom/p1/mobile/putong/core/data/TimeLimited;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/TimeLimited$1;->serialize(Lcom/p1/mobile/putong/core/data/TimeLimited;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
