.class Lcom/p1/mobile/putong/data/UserBoostSettings$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/UserBoostSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/UserBoostSettings;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/UserBoostSettings;)I
    .locals 4

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserBoostSettings;->durationSeconds:Ljava/lang/Integer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    invoke-static {v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    :goto_0
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserBoostSettings;->expiresTime:Ljava/lang/Long;

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    const/4 v1, 0x2

    .line 21
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 22
    .line 23
    .line 24
    move-result-wide v2

    .line 25
    invoke-static {v1, v2, v3}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    add-int/2addr p0, v0

    .line 30
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserBoostSettings;->multiplier:Ljava/lang/Integer;

    .line 31
    .line 32
    if-eqz v0, :cond_2

    .line 33
    .line 34
    const/4 v1, 0x3

    .line 35
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    add-int/2addr p0, v0

    .line 44
    :cond_2
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 45
    .line 46
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 47
    check-cast p1, Lcom/p1/mobile/putong/data/UserBoostSettings;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/UserBoostSettings$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/UserBoostSettings;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/UserBoostSettings;
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
    const/4 v0, 0x0

    .line 8
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v1, Lcom/p1/mobile/putong/data/UserBoostSettings;

    .line 13
    .line 14
    invoke-direct {v1}, Lcom/p1/mobile/putong/data/UserBoostSettings;-><init>()V

    .line 15
    .line 16
    .line 17
    :goto_0
    invoke-virtual {p1}, Ll/nc5;->u()I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-eqz v2, :cond_5

    .line 22
    .line 23
    const/16 v3, 0x8

    .line 24
    .line 25
    if-eq v2, v3, :cond_4

    .line 26
    .line 27
    const/16 v3, 0x10

    .line 28
    .line 29
    if-eq v2, v3, :cond_3

    .line 30
    .line 31
    const/16 v3, 0x18

    .line 32
    .line 33
    if-eq v2, v3, :cond_2

    .line 34
    .line 35
    iget-object p1, v1, Lcom/p1/mobile/putong/data/UserBoostSettings;->durationSeconds:Ljava/lang/Integer;

    .line 36
    .line 37
    if-nez p1, :cond_0

    .line 38
    .line 39
    iput-object v0, v1, Lcom/p1/mobile/putong/data/UserBoostSettings;->durationSeconds:Ljava/lang/Integer;

    .line 40
    .line 41
    :cond_0
    iget-object p1, v1, Lcom/p1/mobile/putong/data/UserBoostSettings;->expiresTime:Ljava/lang/Long;

    .line 42
    .line 43
    if-nez p1, :cond_1

    .line 44
    .line 45
    iput-object p0, v1, Lcom/p1/mobile/putong/data/UserBoostSettings;->expiresTime:Ljava/lang/Long;

    .line 46
    .line 47
    :cond_1
    iget-object p0, v1, Lcom/p1/mobile/putong/data/UserBoostSettings;->multiplier:Ljava/lang/Integer;

    .line 48
    .line 49
    if-nez p0, :cond_8

    .line 50
    .line 51
    iput-object v0, v1, Lcom/p1/mobile/putong/data/UserBoostSettings;->multiplier:Ljava/lang/Integer;

    .line 52
    .line 53
    return-object v1

    .line 54
    :cond_2
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    iput-object v2, v1, Lcom/p1/mobile/putong/data/UserBoostSettings;->multiplier:Ljava/lang/Integer;

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_3
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 66
    .line 67
    .line 68
    move-result-wide v2

    .line 69
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    iput-object v2, v1, Lcom/p1/mobile/putong/data/UserBoostSettings;->expiresTime:Ljava/lang/Long;

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_4
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 77
    .line 78
    .line 79
    move-result v2

    .line 80
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    iput-object v2, v1, Lcom/p1/mobile/putong/data/UserBoostSettings;->durationSeconds:Ljava/lang/Integer;

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_5
    iget-object p1, v1, Lcom/p1/mobile/putong/data/UserBoostSettings;->durationSeconds:Ljava/lang/Integer;

    .line 88
    .line 89
    if-nez p1, :cond_6

    .line 90
    .line 91
    iput-object v0, v1, Lcom/p1/mobile/putong/data/UserBoostSettings;->durationSeconds:Ljava/lang/Integer;

    .line 92
    .line 93
    :cond_6
    iget-object p1, v1, Lcom/p1/mobile/putong/data/UserBoostSettings;->expiresTime:Ljava/lang/Long;

    .line 94
    .line 95
    if-nez p1, :cond_7

    .line 96
    .line 97
    iput-object p0, v1, Lcom/p1/mobile/putong/data/UserBoostSettings;->expiresTime:Ljava/lang/Long;

    .line 98
    .line 99
    :cond_7
    iget-object p0, v1, Lcom/p1/mobile/putong/data/UserBoostSettings;->multiplier:Ljava/lang/Integer;

    .line 100
    .line 101
    if-nez p0, :cond_8

    .line 102
    .line 103
    iput-object v0, v1, Lcom/p1/mobile/putong/data/UserBoostSettings;->multiplier:Ljava/lang/Integer;

    .line 104
    .line 105
    :cond_8
    return-object v1
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 106
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/UserBoostSettings$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/UserBoostSettings;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/UserBoostSettings;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserBoostSettings;->durationSeconds:Ljava/lang/Integer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserBoostSettings;->expiresTime:Ljava/lang/Long;

    .line 14
    .line 15
    if-eqz p0, :cond_1

    .line 16
    .line 17
    const/4 v0, 0x2

    .line 18
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 19
    .line 20
    .line 21
    move-result-wide v1

    .line 22
    invoke-virtual {p2, v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 23
    .line 24
    .line 25
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserBoostSettings;->multiplier:Ljava/lang/Integer;

    .line 26
    .line 27
    if-eqz p0, :cond_2

    .line 28
    .line 29
    const/4 p1, 0x3

    .line 30
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 35
    .line 36
    .line 37
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

    .line 38
    check-cast p1, Lcom/p1/mobile/putong/data/UserBoostSettings;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/UserBoostSettings$1;->serialize(Lcom/p1/mobile/putong/data/UserBoostSettings;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
