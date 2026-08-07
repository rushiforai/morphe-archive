.class Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz;->biz:Ljava/lang/String;

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
    const/4 v0, 0x2

    .line 13
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz;->expire:J

    .line 14
    .line 15
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    add-int/2addr p0, v0

    .line 20
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz;->mode:Ljava/lang/String;

    .line 21
    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    const/4 v1, 0x3

    .line 25
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    add-int/2addr p0, v0

    .line 30
    :cond_1
    const/4 v0, 0x4

    .line 31
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz;->alwaysShow:Z

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
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz;->prolonged:Z

    .line 40
    .line 41
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    add-int/2addr p0, v0

    .line 46
    const/4 v0, 0x6

    .line 47
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz;->notBlur:Z

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
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 55
    .line 56
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 57
    check-cast p1, Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz;-><init>()V

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
    const/16 v2, 0x10

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz;->biz:Ljava/lang/String;

    .line 39
    .line 40
    if-nez p1, :cond_0

    .line 41
    .line 42
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz;->biz:Ljava/lang/String;

    .line 43
    .line 44
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz;->mode:Ljava/lang/String;

    .line 45
    .line 46
    if-nez p1, :cond_9

    .line 47
    .line 48
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz;->mode:Ljava/lang/String;

    .line 49
    .line 50
    return-object p0

    .line 51
    :cond_1
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz;->notBlur:Z

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_2
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz;->prolonged:Z

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_3
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz;->alwaysShow:Z

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_4
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz;->mode:Ljava/lang/String;

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_5
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 80
    .line 81
    .line 82
    move-result-wide v0

    .line 83
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz;->expire:J

    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz;->biz:Ljava/lang/String;

    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz;->biz:Ljava/lang/String;

    .line 94
    .line 95
    if-nez p1, :cond_8

    .line 96
    .line 97
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz;->biz:Ljava/lang/String;

    .line 98
    .line 99
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz;->mode:Ljava/lang/String;

    .line 100
    .line 101
    if-nez p1, :cond_9

    .line 102
    .line 103
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz;->mode:Ljava/lang/String;

    .line 104
    .line 105
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

    .line 106
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz;->biz:Ljava/lang/String;

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
    const/4 p0, 0x2

    .line 10
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz;->expire:J

    .line 11
    .line 12
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz;->mode:Ljava/lang/String;

    .line 16
    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    const/4 v0, 0x3

    .line 20
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    :cond_1
    const/4 p0, 0x4

    .line 24
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz;->alwaysShow:Z

    .line 25
    .line 26
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 27
    .line 28
    .line 29
    const/4 p0, 0x5

    .line 30
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz;->prolonged:Z

    .line 31
    .line 32
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 33
    .line 34
    .line 35
    const/4 p0, 0x6

    .line 36
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz;->notBlur:Z

    .line 37
    .line 38
    invoke-virtual {p2, p0, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 42
    check-cast p1, Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz$1;->serialize(Lcom/p1/mobile/putong/core/data/ConversationLoveBuzz;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
