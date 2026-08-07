.class Lcom/p1/mobile/putong/core/data/InsertConversationUser$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/InsertConversationUser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/InsertConversationUser;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/InsertConversationUser;)I
    .locals 4

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/InsertConversationUser;->userId:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/InsertConversationUser;->timeStamp:Ljava/lang/Long;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    const/4 v1, 0x2

    .line 17
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 18
    .line 19
    .line 20
    move-result-wide v2

    .line 21
    invoke-static {v1, v2, v3}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    add-int/2addr p0, v0

    .line 26
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/InsertConversationUser;->clicked:Ljava/lang/Boolean;

    .line 27
    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    const/4 v1, 0x3

    .line 31
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    add-int/2addr p0, v0

    .line 40
    :cond_2
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 41
    .line 42
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 43
    check-cast p1, Lcom/p1/mobile/putong/core/data/InsertConversationUser;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/InsertConversationUser$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/InsertConversationUser;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/InsertConversationUser;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance v0, Lcom/p1/mobile/putong/core/data/InsertConversationUser;

    .line 8
    .line 9
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/InsertConversationUser;-><init>()V

    .line 10
    .line 11
    .line 12
    :goto_0
    invoke-virtual {p1}, Ll/nc5;->u()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    const-string v2, ""

    .line 17
    .line 18
    if-eqz v1, :cond_5

    .line 19
    .line 20
    const/16 v3, 0xa

    .line 21
    .line 22
    if-eq v1, v3, :cond_4

    .line 23
    .line 24
    const/16 v3, 0x10

    .line 25
    .line 26
    if-eq v1, v3, :cond_3

    .line 27
    .line 28
    const/16 v3, 0x18

    .line 29
    .line 30
    if-eq v1, v3, :cond_2

    .line 31
    .line 32
    iget-object p1, v0, Lcom/p1/mobile/putong/core/data/InsertConversationUser;->userId:Ljava/lang/String;

    .line 33
    .line 34
    if-nez p1, :cond_0

    .line 35
    .line 36
    iput-object v2, v0, Lcom/p1/mobile/putong/core/data/InsertConversationUser;->userId:Ljava/lang/String;

    .line 37
    .line 38
    :cond_0
    iget-object p1, v0, Lcom/p1/mobile/putong/core/data/InsertConversationUser;->timeStamp:Ljava/lang/Long;

    .line 39
    .line 40
    if-nez p1, :cond_1

    .line 41
    .line 42
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/InsertConversationUser;->timeStamp:Ljava/lang/Long;

    .line 43
    .line 44
    :cond_1
    iget-object p0, v0, Lcom/p1/mobile/putong/core/data/InsertConversationUser;->clicked:Ljava/lang/Boolean;

    .line 45
    .line 46
    if-nez p0, :cond_8

    .line 47
    .line 48
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 49
    .line 50
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/InsertConversationUser;->clicked:Ljava/lang/Boolean;

    .line 51
    .line 52
    return-object v0

    .line 53
    :cond_2
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/InsertConversationUser;->clicked:Ljava/lang/Boolean;

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_3
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 65
    .line 66
    .line 67
    move-result-wide v1

    .line 68
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/InsertConversationUser;->timeStamp:Ljava/lang/Long;

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_4
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/InsertConversationUser;->userId:Ljava/lang/String;

    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_5
    iget-object p1, v0, Lcom/p1/mobile/putong/core/data/InsertConversationUser;->userId:Ljava/lang/String;

    .line 83
    .line 84
    if-nez p1, :cond_6

    .line 85
    .line 86
    iput-object v2, v0, Lcom/p1/mobile/putong/core/data/InsertConversationUser;->userId:Ljava/lang/String;

    .line 87
    .line 88
    :cond_6
    iget-object p1, v0, Lcom/p1/mobile/putong/core/data/InsertConversationUser;->timeStamp:Ljava/lang/Long;

    .line 89
    .line 90
    if-nez p1, :cond_7

    .line 91
    .line 92
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/InsertConversationUser;->timeStamp:Ljava/lang/Long;

    .line 93
    .line 94
    :cond_7
    iget-object p0, v0, Lcom/p1/mobile/putong/core/data/InsertConversationUser;->clicked:Ljava/lang/Boolean;

    .line 95
    .line 96
    if-nez p0, :cond_8

    .line 97
    .line 98
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 99
    .line 100
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/InsertConversationUser;->clicked:Ljava/lang/Boolean;

    .line 101
    .line 102
    :cond_8
    return-object v0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 103
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/InsertConversationUser$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/InsertConversationUser;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/InsertConversationUser;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/InsertConversationUser;->userId:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/InsertConversationUser;->timeStamp:Ljava/lang/Long;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    const/4 v0, 0x2

    .line 14
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 15
    .line 16
    .line 17
    move-result-wide v1

    .line 18
    invoke-virtual {p2, v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 19
    .line 20
    .line 21
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/InsertConversationUser;->clicked:Ljava/lang/Boolean;

    .line 22
    .line 23
    if-eqz p0, :cond_2

    .line 24
    .line 25
    const/4 p1, 0x3

    .line 26
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 31
    .line 32
    .line 33
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

    .line 34
    check-cast p1, Lcom/p1/mobile/putong/core/data/InsertConversationUser;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/InsertConversationUser$1;->serialize(Lcom/p1/mobile/putong/core/data/InsertConversationUser;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
