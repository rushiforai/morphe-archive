.class Lcom/p1/mobile/putong/core/data/IntlCampingData$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/IntlCampingData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/IntlCampingData;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/IntlCampingData;)I
    .locals 2

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IntlCampingData;->type:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/IntlCampingData;->desc:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/IntlCampingData;->tag_url:Ljava/lang/String;

    .line 23
    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    const/4 v1, 0x3

    .line 27
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    add-int/2addr p0, v0

    .line 32
    :cond_2
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 33
    .line 34
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 35
    check-cast p1, Lcom/p1/mobile/putong/core/data/IntlCampingData;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/IntlCampingData$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/IntlCampingData;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/IntlCampingData;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/IntlCampingData;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/IntlCampingData;-><init>()V

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
    if-eqz v0, :cond_5

    .line 13
    .line 14
    const/16 v2, 0xa

    .line 15
    .line 16
    if-eq v0, v2, :cond_4

    .line 17
    .line 18
    const/16 v2, 0x12

    .line 19
    .line 20
    if-eq v0, v2, :cond_3

    .line 21
    .line 22
    const/16 v2, 0x1a

    .line 23
    .line 24
    if-eq v0, v2, :cond_2

    .line 25
    .line 26
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlCampingData;->type:Ljava/lang/String;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/IntlCampingData;->type:Ljava/lang/String;

    .line 31
    .line 32
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlCampingData;->desc:Ljava/lang/String;

    .line 33
    .line 34
    if-nez p1, :cond_1

    .line 35
    .line 36
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/IntlCampingData;->desc:Ljava/lang/String;

    .line 37
    .line 38
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlCampingData;->tag_url:Ljava/lang/String;

    .line 39
    .line 40
    if-nez p1, :cond_8

    .line 41
    .line 42
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/IntlCampingData;->tag_url:Ljava/lang/String;

    .line 43
    .line 44
    return-object p0

    .line 45
    :cond_2
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IntlCampingData;->tag_url:Ljava/lang/String;

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_3
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IntlCampingData;->desc:Ljava/lang/String;

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_4
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IntlCampingData;->type:Ljava/lang/String;

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlCampingData;->type:Ljava/lang/String;

    .line 67
    .line 68
    if-nez p1, :cond_6

    .line 69
    .line 70
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/IntlCampingData;->type:Ljava/lang/String;

    .line 71
    .line 72
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlCampingData;->desc:Ljava/lang/String;

    .line 73
    .line 74
    if-nez p1, :cond_7

    .line 75
    .line 76
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/IntlCampingData;->desc:Ljava/lang/String;

    .line 77
    .line 78
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlCampingData;->tag_url:Ljava/lang/String;

    .line 79
    .line 80
    if-nez p1, :cond_8

    .line 81
    .line 82
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/IntlCampingData;->tag_url:Ljava/lang/String;

    .line 83
    .line 84
    :cond_8
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 85
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/IntlCampingData$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/IntlCampingData;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/IntlCampingData;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IntlCampingData;->type:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IntlCampingData;->desc:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IntlCampingData;->tag_url:Ljava/lang/String;

    .line 18
    .line 19
    if-eqz p0, :cond_2

    .line 20
    .line 21
    const/4 p1, 0x3

    .line 22
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 23
    .line 24
    .line 25
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

    .line 26
    check-cast p1, Lcom/p1/mobile/putong/core/data/IntlCampingData;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/IntlCampingData$1;->serialize(Lcom/p1/mobile/putong/core/data/IntlCampingData;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
