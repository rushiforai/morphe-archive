.class Lcom/p1/mobile/putong/core/data/HideSpecialUser$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/HideSpecialUser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/HideSpecialUser;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/HideSpecialUser;)I
    .locals 4

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/HideSpecialUser;->userId:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/HideSpecialUser;->timeStamp:Ljava/lang/Long;

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
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 27
    .line 28
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 29
    check-cast p1, Lcom/p1/mobile/putong/core/data/HideSpecialUser;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/HideSpecialUser$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/HideSpecialUser;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/HideSpecialUser;
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
    new-instance v0, Lcom/p1/mobile/putong/core/data/HideSpecialUser;

    .line 8
    .line 9
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/HideSpecialUser;-><init>()V

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
    if-eqz v1, :cond_3

    .line 19
    .line 20
    const/16 v3, 0xa

    .line 21
    .line 22
    if-eq v1, v3, :cond_2

    .line 23
    .line 24
    const/16 v3, 0x10

    .line 25
    .line 26
    if-eq v1, v3, :cond_1

    .line 27
    .line 28
    iget-object p1, v0, Lcom/p1/mobile/putong/core/data/HideSpecialUser;->userId:Ljava/lang/String;

    .line 29
    .line 30
    if-nez p1, :cond_0

    .line 31
    .line 32
    iput-object v2, v0, Lcom/p1/mobile/putong/core/data/HideSpecialUser;->userId:Ljava/lang/String;

    .line 33
    .line 34
    :cond_0
    iget-object p1, v0, Lcom/p1/mobile/putong/core/data/HideSpecialUser;->timeStamp:Ljava/lang/Long;

    .line 35
    .line 36
    if-nez p1, :cond_5

    .line 37
    .line 38
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/HideSpecialUser;->timeStamp:Ljava/lang/Long;

    .line 39
    .line 40
    return-object v0

    .line 41
    :cond_1
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 42
    .line 43
    .line 44
    move-result-wide v1

    .line 45
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/HideSpecialUser;->timeStamp:Ljava/lang/Long;

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_2
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/HideSpecialUser;->userId:Ljava/lang/String;

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_3
    iget-object p1, v0, Lcom/p1/mobile/putong/core/data/HideSpecialUser;->userId:Ljava/lang/String;

    .line 60
    .line 61
    if-nez p1, :cond_4

    .line 62
    .line 63
    iput-object v2, v0, Lcom/p1/mobile/putong/core/data/HideSpecialUser;->userId:Ljava/lang/String;

    .line 64
    .line 65
    :cond_4
    iget-object p1, v0, Lcom/p1/mobile/putong/core/data/HideSpecialUser;->timeStamp:Ljava/lang/Long;

    .line 66
    .line 67
    if-nez p1, :cond_5

    .line 68
    .line 69
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/HideSpecialUser;->timeStamp:Ljava/lang/Long;

    .line 70
    .line 71
    :cond_5
    return-object v0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 72
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/HideSpecialUser$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/HideSpecialUser;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/HideSpecialUser;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/HideSpecialUser;->userId:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/HideSpecialUser;->timeStamp:Ljava/lang/Long;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    const/4 p1, 0x2

    .line 14
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 15
    .line 16
    .line 17
    move-result-wide v0

    .line 18
    invoke-virtual {p2, p1, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 19
    .line 20
    .line 21
    :cond_1
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 22
    check-cast p1, Lcom/p1/mobile/putong/core/data/HideSpecialUser;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/HideSpecialUser$1;->serialize(Lcom/p1/mobile/putong/core/data/HideSpecialUser;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
