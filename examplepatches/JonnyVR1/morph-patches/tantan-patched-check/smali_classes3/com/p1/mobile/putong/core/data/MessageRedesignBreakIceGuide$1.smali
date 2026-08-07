.class Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;)I
    .locals 3

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;->exchangeAnswerSwitch:Z

    .line 3
    .line 4
    invoke-static {p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;->breakIceGuide:Lcom/p1/mobile/putong/core/data/MessageBreakIce;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const/4 v1, 0x2

    .line 13
    sget-object v2, Lcom/p1/mobile/putong/core/data/MessageBreakIce;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 14
    .line 15
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    add-int/2addr p0, v0

    .line 20
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;->integration:Lcom/p1/mobile/putong/core/data/MessageIntegration;

    .line 21
    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    const/4 v1, 0x3

    .line 25
    sget-object v2, Lcom/p1/mobile/putong/core/data/MessageIntegration;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 26
    .line 27
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    add-int/2addr p0, v0

    .line 32
    :cond_1
    const/4 v0, 0x4

    .line 33
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;->mainSwitch:Z

    .line 34
    .line 35
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    add-int/2addr p0, v0

    .line 40
    const/4 v0, 0x5

    .line 41
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;->directlyToPicLikeDialog:Z

    .line 42
    .line 43
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    add-int/2addr p0, v0

    .line 48
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 49
    .line 50
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 51
    check-cast p1, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;-><init>()V

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
    if-eqz v0, :cond_6

    .line 11
    .line 12
    const/16 v1, 0x8

    .line 13
    .line 14
    if-eq v0, v1, :cond_5

    .line 15
    .line 16
    const/16 v1, 0x12

    .line 17
    .line 18
    if-eq v0, v1, :cond_4

    .line 19
    .line 20
    const/16 v1, 0x1a

    .line 21
    .line 22
    if-eq v0, v1, :cond_3

    .line 23
    .line 24
    const/16 v1, 0x20

    .line 25
    .line 26
    if-eq v0, v1, :cond_2

    .line 27
    .line 28
    const/16 v1, 0x28

    .line 29
    .line 30
    if-eq v0, v1, :cond_1

    .line 31
    .line 32
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;->breakIceGuide:Lcom/p1/mobile/putong/core/data/MessageBreakIce;

    .line 33
    .line 34
    if-nez p1, :cond_0

    .line 35
    .line 36
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MessageBreakIce;->new_()Lcom/p1/mobile/putong/core/data/MessageBreakIce;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;->breakIceGuide:Lcom/p1/mobile/putong/core/data/MessageBreakIce;

    .line 41
    .line 42
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;->integration:Lcom/p1/mobile/putong/core/data/MessageIntegration;

    .line 43
    .line 44
    if-nez p1, :cond_8

    .line 45
    .line 46
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MessageIntegration;->new_()Lcom/p1/mobile/putong/core/data/MessageIntegration;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;->integration:Lcom/p1/mobile/putong/core/data/MessageIntegration;

    .line 51
    .line 52
    return-object p0

    .line 53
    :cond_1
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;->directlyToPicLikeDialog:Z

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_2
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;->mainSwitch:Z

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_3
    sget-object v0, Lcom/p1/mobile/putong/core/data/MessageIntegration;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 68
    .line 69
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    check-cast v0, Lcom/p1/mobile/putong/core/data/MessageIntegration;

    .line 74
    .line 75
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;->integration:Lcom/p1/mobile/putong/core/data/MessageIntegration;

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_4
    sget-object v0, Lcom/p1/mobile/putong/core/data/MessageBreakIce;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 79
    .line 80
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    check-cast v0, Lcom/p1/mobile/putong/core/data/MessageBreakIce;

    .line 85
    .line 86
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;->breakIceGuide:Lcom/p1/mobile/putong/core/data/MessageBreakIce;

    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_5
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;->exchangeAnswerSwitch:Z

    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;->breakIceGuide:Lcom/p1/mobile/putong/core/data/MessageBreakIce;

    .line 97
    .line 98
    if-nez p1, :cond_7

    .line 99
    .line 100
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MessageBreakIce;->new_()Lcom/p1/mobile/putong/core/data/MessageBreakIce;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;->breakIceGuide:Lcom/p1/mobile/putong/core/data/MessageBreakIce;

    .line 105
    .line 106
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;->integration:Lcom/p1/mobile/putong/core/data/MessageIntegration;

    .line 107
    .line 108
    if-nez p1, :cond_8

    .line 109
    .line 110
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MessageIntegration;->new_()Lcom/p1/mobile/putong/core/data/MessageIntegration;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;->integration:Lcom/p1/mobile/putong/core/data/MessageIntegration;

    .line 115
    .line 116
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

    .line 117
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;->exchangeAnswerSwitch:Z

    .line 3
    .line 4
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;->breakIceGuide:Lcom/p1/mobile/putong/core/data/MessageBreakIce;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x2

    .line 12
    sget-object v1, Lcom/p1/mobile/putong/core/data/MessageBreakIce;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 13
    .line 14
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;->integration:Lcom/p1/mobile/putong/core/data/MessageIntegration;

    .line 18
    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    const/4 v0, 0x3

    .line 22
    sget-object v1, Lcom/p1/mobile/putong/core/data/MessageIntegration;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 23
    .line 24
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 25
    .line 26
    .line 27
    :cond_1
    const/4 p0, 0x4

    .line 28
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;->mainSwitch:Z

    .line 29
    .line 30
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 31
    .line 32
    .line 33
    const/4 p0, 0x5

    .line 34
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;->directlyToPicLikeDialog:Z

    .line 35
    .line 36
    invoke-virtual {p2, p0, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 40
    check-cast p1, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide$1;->serialize(Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
