.class Lcom/p1/mobile/putong/data/FaceDetectorResult$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/FaceDetectorResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/FaceDetectorResult;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/FaceDetectorResult;)I
    .locals 3

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/FaceDetectorResult;->code:J

    .line 3
    .line 4
    invoke-static {p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    const/4 v0, 0x2

    .line 9
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/FaceDetectorResult;->score:J

    .line 10
    .line 11
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    add-int/2addr p0, v0

    .line 16
    iget-object v0, p1, Lcom/p1/mobile/putong/data/FaceDetectorResult;->message:Ljava/lang/String;

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    const/4 v1, 0x3

    .line 21
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    add-int/2addr p0, v0

    .line 26
    :cond_0
    const/4 v0, 0x4

    .line 27
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/FaceDetectorResult;->errorIndex:J

    .line 28
    .line 29
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    add-int/2addr p0, v0

    .line 34
    iget-object v0, p1, Lcom/p1/mobile/putong/data/FaceDetectorResult;->reason:Ljava/lang/String;

    .line 35
    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    const/4 v1, 0x5

    .line 39
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    add-int/2addr p0, v0

    .line 44
    :cond_1
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 45
    .line 46
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 47
    check-cast p1, Lcom/p1/mobile/putong/data/FaceDetectorResult;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/FaceDetectorResult$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/FaceDetectorResult;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/FaceDetectorResult;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/FaceDetectorResult;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/FaceDetectorResult;-><init>()V

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
    if-eqz v0, :cond_6

    .line 13
    .line 14
    const/16 v2, 0x8

    .line 15
    .line 16
    if-eq v0, v2, :cond_5

    .line 17
    .line 18
    const/16 v2, 0x10

    .line 19
    .line 20
    if-eq v0, v2, :cond_4

    .line 21
    .line 22
    const/16 v2, 0x1a

    .line 23
    .line 24
    if-eq v0, v2, :cond_3

    .line 25
    .line 26
    const/16 v2, 0x20

    .line 27
    .line 28
    if-eq v0, v2, :cond_2

    .line 29
    .line 30
    const/16 v2, 0x2a

    .line 31
    .line 32
    if-eq v0, v2, :cond_1

    .line 33
    .line 34
    iget-object p1, p0, Lcom/p1/mobile/putong/data/FaceDetectorResult;->message:Ljava/lang/String;

    .line 35
    .line 36
    if-nez p1, :cond_0

    .line 37
    .line 38
    iput-object v1, p0, Lcom/p1/mobile/putong/data/FaceDetectorResult;->message:Ljava/lang/String;

    .line 39
    .line 40
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/FaceDetectorResult;->reason:Ljava/lang/String;

    .line 41
    .line 42
    if-nez p1, :cond_8

    .line 43
    .line 44
    iput-object v1, p0, Lcom/p1/mobile/putong/data/FaceDetectorResult;->reason:Ljava/lang/String;

    .line 45
    .line 46
    return-object p0

    .line 47
    :cond_1
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    iput-object v0, p0, Lcom/p1/mobile/putong/data/FaceDetectorResult;->reason:Ljava/lang/String;

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_2
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 55
    .line 56
    .line 57
    move-result-wide v0

    .line 58
    iput-wide v0, p0, Lcom/p1/mobile/putong/data/FaceDetectorResult;->errorIndex:J

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_3
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    iput-object v0, p0, Lcom/p1/mobile/putong/data/FaceDetectorResult;->message:Ljava/lang/String;

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_4
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 69
    .line 70
    .line 71
    move-result-wide v0

    .line 72
    iput-wide v0, p0, Lcom/p1/mobile/putong/data/FaceDetectorResult;->score:J

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_5
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 76
    .line 77
    .line 78
    move-result-wide v0

    .line 79
    iput-wide v0, p0, Lcom/p1/mobile/putong/data/FaceDetectorResult;->code:J

    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/data/FaceDetectorResult;->message:Ljava/lang/String;

    .line 83
    .line 84
    if-nez p1, :cond_7

    .line 85
    .line 86
    iput-object v1, p0, Lcom/p1/mobile/putong/data/FaceDetectorResult;->message:Ljava/lang/String;

    .line 87
    .line 88
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/data/FaceDetectorResult;->reason:Ljava/lang/String;

    .line 89
    .line 90
    if-nez p1, :cond_8

    .line 91
    .line 92
    iput-object v1, p0, Lcom/p1/mobile/putong/data/FaceDetectorResult;->reason:Ljava/lang/String;

    .line 93
    .line 94
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

    .line 95
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/FaceDetectorResult$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/FaceDetectorResult;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/FaceDetectorResult;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/FaceDetectorResult;->code:J

    .line 3
    .line 4
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 5
    .line 6
    .line 7
    const/4 p0, 0x2

    .line 8
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/FaceDetectorResult;->score:J

    .line 9
    .line 10
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p1, Lcom/p1/mobile/putong/data/FaceDetectorResult;->message:Ljava/lang/String;

    .line 14
    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 v0, 0x3

    .line 18
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    const/4 p0, 0x4

    .line 22
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/FaceDetectorResult;->errorIndex:J

    .line 23
    .line 24
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p1, Lcom/p1/mobile/putong/data/FaceDetectorResult;->reason:Ljava/lang/String;

    .line 28
    .line 29
    if-eqz p0, :cond_1

    .line 30
    .line 31
    const/4 p1, 0x5

    .line 32
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 33
    .line 34
    .line 35
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

    .line 36
    check-cast p1, Lcom/p1/mobile/putong/data/FaceDetectorResult;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/FaceDetectorResult$1;->serialize(Lcom/p1/mobile/putong/data/FaceDetectorResult;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
