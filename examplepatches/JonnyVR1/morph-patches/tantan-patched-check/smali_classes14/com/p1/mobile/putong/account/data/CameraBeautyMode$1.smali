.class Lcom/p1/mobile/putong/account/data/CameraBeautyMode$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/account/data/CameraBeautyMode;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/account/data/CameraBeautyMode;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/account/data/CameraBeautyMode;)I
    .locals 2

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/account/data/CameraBeautyMode;->title:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/16 v0, 0x33

    .line 6
    .line 7
    invoke-static {v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    :goto_0
    const/16 v0, 0x34

    .line 14
    .line 15
    iget v1, p1, Lcom/p1/mobile/putong/account/data/CameraBeautyMode;->value:F

    .line 16
    .line 17
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->f(IF)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    add-int/2addr p0, v0

    .line 22
    iget-object v0, p1, Lcom/p1/mobile/putong/account/data/CameraBeautyMode;->type:Ljava/lang/String;

    .line 23
    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    const/16 v1, 0x35

    .line 27
    .line 28
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    add-int/2addr p0, v0

    .line 33
    :cond_1
    const/16 v0, 0x36

    .line 34
    .line 35
    iget v1, p1, Lcom/p1/mobile/putong/account/data/CameraBeautyMode;->sliderType:I

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
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 43
    .line 44
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 45
    check-cast p1, Lcom/p1/mobile/putong/account/data/CameraBeautyMode;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/data/CameraBeautyMode$1;->computeAndCacheSize(Lcom/p1/mobile/putong/account/data/CameraBeautyMode;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/account/data/CameraBeautyMode;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/account/data/CameraBeautyMode;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/data/CameraBeautyMode;-><init>()V

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
    const/16 v2, 0x19a

    .line 15
    .line 16
    if-eq v0, v2, :cond_4

    .line 17
    .line 18
    const/16 v2, 0x1a5

    .line 19
    .line 20
    if-eq v0, v2, :cond_3

    .line 21
    .line 22
    const/16 v2, 0x1aa

    .line 23
    .line 24
    if-eq v0, v2, :cond_2

    .line 25
    .line 26
    const/16 v2, 0x1b0

    .line 27
    .line 28
    if-eq v0, v2, :cond_1

    .line 29
    .line 30
    iget-object p1, p0, Lcom/p1/mobile/putong/account/data/CameraBeautyMode;->title:Ljava/lang/String;

    .line 31
    .line 32
    if-nez p1, :cond_0

    .line 33
    .line 34
    iput-object v1, p0, Lcom/p1/mobile/putong/account/data/CameraBeautyMode;->title:Ljava/lang/String;

    .line 35
    .line 36
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/account/data/CameraBeautyMode;->type:Ljava/lang/String;

    .line 37
    .line 38
    if-nez p1, :cond_7

    .line 39
    .line 40
    iput-object v1, p0, Lcom/p1/mobile/putong/account/data/CameraBeautyMode;->type:Ljava/lang/String;

    .line 41
    .line 42
    return-object p0

    .line 43
    :cond_1
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    iput v0, p0, Lcom/p1/mobile/putong/account/data/CameraBeautyMode;->sliderType:I

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_2
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    iput-object v0, p0, Lcom/p1/mobile/putong/account/data/CameraBeautyMode;->type:Ljava/lang/String;

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_3
    invoke-virtual {p1}, Ll/nc5;->i()F

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    iput v0, p0, Lcom/p1/mobile/putong/account/data/CameraBeautyMode;->value:F

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_4
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    iput-object v0, p0, Lcom/p1/mobile/putong/account/data/CameraBeautyMode;->title:Ljava/lang/String;

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/account/data/CameraBeautyMode;->title:Ljava/lang/String;

    .line 72
    .line 73
    if-nez p1, :cond_6

    .line 74
    .line 75
    iput-object v1, p0, Lcom/p1/mobile/putong/account/data/CameraBeautyMode;->title:Ljava/lang/String;

    .line 76
    .line 77
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/account/data/CameraBeautyMode;->type:Ljava/lang/String;

    .line 78
    .line 79
    if-nez p1, :cond_7

    .line 80
    .line 81
    iput-object v1, p0, Lcom/p1/mobile/putong/account/data/CameraBeautyMode;->type:Ljava/lang/String;

    .line 82
    .line 83
    :cond_7
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 84
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/data/CameraBeautyMode$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/account/data/CameraBeautyMode;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/account/data/CameraBeautyMode;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/account/data/CameraBeautyMode;->title:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/16 v0, 0x33

    .line 6
    .line 7
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    const/16 p0, 0x34

    .line 11
    .line 12
    iget v0, p1, Lcom/p1/mobile/putong/account/data/CameraBeautyMode;->value:F

    .line 13
    .line 14
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->E(IF)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p1, Lcom/p1/mobile/putong/account/data/CameraBeautyMode;->type:Ljava/lang/String;

    .line 18
    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    const/16 v0, 0x35

    .line 22
    .line 23
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 24
    .line 25
    .line 26
    :cond_1
    const/16 p0, 0x36

    .line 27
    .line 28
    iget p1, p1, Lcom/p1/mobile/putong/account/data/CameraBeautyMode;->sliderType:I

    .line 29
    .line 30
    invoke-virtual {p2, p0, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 31
    .line 32
    .line 33
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
    check-cast p1, Lcom/p1/mobile/putong/account/data/CameraBeautyMode;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/account/data/CameraBeautyMode$1;->serialize(Lcom/p1/mobile/putong/account/data/CameraBeautyMode;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
