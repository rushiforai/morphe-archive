.class Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;)I
    .locals 3

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->display:Z

    .line 3
    .line 4
    invoke-static {p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    const/4 v0, 0x2

    .line 9
    iget v1, p1, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->count:I

    .line 10
    .line 11
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    add-int/2addr p0, v0

    .line 16
    const/4 v0, 0x3

    .line 17
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->startTime:D

    .line 18
    .line 19
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    add-int/2addr p0, v0

    .line 24
    const/4 v0, 0x4

    .line 25
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->endTime:D

    .line 26
    .line 27
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    add-int/2addr p0, v0

    .line 32
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->message:Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;

    .line 33
    .line 34
    if-eqz v0, :cond_0

    .line 35
    .line 36
    const/4 v1, 0x5

    .line 37
    sget-object v2, Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 38
    .line 39
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    add-int/2addr p0, v0

    .line 44
    :cond_0
    const/4 v0, 0x6

    .line 45
    iget v1, p1, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->msgLimit:I

    .line 46
    .line 47
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    add-int/2addr p0, v0

    .line 52
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->shadingWord:Ljava/lang/String;

    .line 53
    .line 54
    if-eqz v0, :cond_1

    .line 55
    .line 56
    const/4 v1, 0x7

    .line 57
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    add-int/2addr p0, v0

    .line 62
    :cond_1
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 63
    .line 64
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 65
    check-cast p1, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;-><init>()V

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
    const/16 v2, 0x8

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
    const/16 v2, 0x19

    .line 23
    .line 24
    if-eq v0, v2, :cond_4

    .line 25
    .line 26
    const/16 v2, 0x21

    .line 27
    .line 28
    if-eq v0, v2, :cond_3

    .line 29
    .line 30
    const/16 v2, 0x2a

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
    const/16 v2, 0x3a

    .line 39
    .line 40
    if-eq v0, v2, :cond_0

    .line 41
    .line 42
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->shadingWord:Ljava/lang/String;

    .line 43
    .line 44
    if-nez p1, :cond_8

    .line 45
    .line 46
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->shadingWord:Ljava/lang/String;

    .line 47
    .line 48
    return-object p0

    .line 49
    :cond_0
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->shadingWord:Ljava/lang/String;

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_1
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    iput v0, p0, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->msgLimit:I

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 64
    .line 65
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    check-cast v0, Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;

    .line 70
    .line 71
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->message:Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_3
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 75
    .line 76
    .line 77
    move-result-wide v0

    .line 78
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->endTime:D

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_4
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 82
    .line 83
    .line 84
    move-result-wide v0

    .line 85
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->startTime:D

    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_5
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    iput v0, p0, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->count:I

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_6
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->display:Z

    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->shadingWord:Ljava/lang/String;

    .line 103
    .line 104
    if-nez p1, :cond_8

    .line 105
    .line 106
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->shadingWord:Ljava/lang/String;

    .line 107
    .line 108
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

    .line 109
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->display:Z

    .line 3
    .line 4
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 5
    .line 6
    .line 7
    const/4 p0, 0x2

    .line 8
    iget v0, p1, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->count:I

    .line 9
    .line 10
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 11
    .line 12
    .line 13
    const/4 p0, 0x3

    .line 14
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->startTime:D

    .line 15
    .line 16
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 17
    .line 18
    .line 19
    const/4 p0, 0x4

    .line 20
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->endTime:D

    .line 21
    .line 22
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->message:Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;

    .line 26
    .line 27
    if-eqz p0, :cond_0

    .line 28
    .line 29
    const/4 v0, 0x5

    .line 30
    sget-object v1, Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 31
    .line 32
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    const/4 p0, 0x6

    .line 36
    iget v0, p1, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->msgLimit:I

    .line 37
    .line 38
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 39
    .line 40
    .line 41
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->shadingWord:Ljava/lang/String;

    .line 42
    .line 43
    if-eqz p0, :cond_1

    .line 44
    .line 45
    const/4 p1, 0x7

    .line 46
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 47
    .line 48
    .line 49
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

    .line 50
    check-cast p1, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo$1;->serialize(Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
