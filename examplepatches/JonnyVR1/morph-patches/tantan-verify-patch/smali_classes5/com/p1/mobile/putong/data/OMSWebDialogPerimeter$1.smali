.class Lcom/p1/mobile/putong/data/OMSWebDialogPerimeter$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/OMSWebDialogPerimeter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/OMSWebDialogPerimeter;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/OMSWebDialogPerimeter;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSWebDialogPerimeter;->type:Lcom/p1/mobile/putong/data/OMSWebPerimeterType;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

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
    const/4 v0, 0x2

    .line 17
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/OMSWebDialogPerimeter;->value:D

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSWebDialogPerimeter;->type:Lcom/p1/mobile/putong/data/OMSWebPerimeterType;

    .line 25
    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    const/4 v1, 0x3

    .line 29
    sget-object v2, Lcom/p1/mobile/putong/data/OMSWebPerimeterType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 30
    .line 31
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    add-int/2addr p0, v0

    .line 36
    :cond_1
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 37
    .line 38
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 39
    check-cast p1, Lcom/p1/mobile/putong/data/OMSWebDialogPerimeter;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/OMSWebDialogPerimeter$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/OMSWebDialogPerimeter;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/OMSWebDialogPerimeter;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/OMSWebDialogPerimeter;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/OMSWebDialogPerimeter;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    move-object v1, v0

    .line 8
    :goto_0
    invoke-virtual {p1}, Ll/nc5;->u()I

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    if-eqz v2, :cond_4

    .line 13
    .line 14
    const/16 v3, 0x8

    .line 15
    .line 16
    if-eq v2, v3, :cond_3

    .line 17
    .line 18
    const/16 v3, 0x11

    .line 19
    .line 20
    if-eq v2, v3, :cond_2

    .line 21
    .line 22
    const/16 v3, 0x1a

    .line 23
    .line 24
    if-eq v2, v3, :cond_1

    .line 25
    .line 26
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSWebDialogPerimeter;->type:Lcom/p1/mobile/putong/data/OMSWebPerimeterType;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    if-eqz v1, :cond_0

    .line 31
    .line 32
    sget-object p1, Lcom/p1/mobile/putong/data/OMSWebPerimeterType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 33
    .line 34
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    check-cast p1, Lcom/p1/mobile/putong/data/OMSWebPerimeterType;

    .line 43
    .line 44
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSWebDialogPerimeter;->type:Lcom/p1/mobile/putong/data/OMSWebPerimeterType;

    .line 45
    .line 46
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSWebDialogPerimeter;->type:Lcom/p1/mobile/putong/data/OMSWebPerimeterType;

    .line 47
    .line 48
    if-nez p1, :cond_6

    .line 49
    .line 50
    sget-object p1, Lcom/p1/mobile/putong/data/OMSWebPerimeterType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 51
    .line 52
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    check-cast p1, Lcom/p1/mobile/putong/data/OMSWebPerimeterType;

    .line 57
    .line 58
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSWebDialogPerimeter;->type:Lcom/p1/mobile/putong/data/OMSWebPerimeterType;

    .line 59
    .line 60
    return-object p0

    .line 61
    :cond_1
    sget-object v2, Lcom/p1/mobile/putong/data/OMSWebPerimeterType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 62
    .line 63
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    check-cast v2, Lcom/p1/mobile/putong/data/OMSWebPerimeterType;

    .line 68
    .line 69
    iput-object v2, p0, Lcom/p1/mobile/putong/data/OMSWebDialogPerimeter;->type:Lcom/p1/mobile/putong/data/OMSWebPerimeterType;

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_2
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 73
    .line 74
    .line 75
    move-result-wide v2

    .line 76
    iput-wide v2, p0, Lcom/p1/mobile/putong/data/OMSWebDialogPerimeter;->value:D

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_3
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    goto :goto_0

    .line 88
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSWebDialogPerimeter;->type:Lcom/p1/mobile/putong/data/OMSWebPerimeterType;

    .line 89
    .line 90
    if-nez p1, :cond_5

    .line 91
    .line 92
    if-eqz v1, :cond_5

    .line 93
    .line 94
    sget-object p1, Lcom/p1/mobile/putong/data/OMSWebPerimeterType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 95
    .line 96
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 97
    .line 98
    .line 99
    move-result v1

    .line 100
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    check-cast p1, Lcom/p1/mobile/putong/data/OMSWebPerimeterType;

    .line 105
    .line 106
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSWebDialogPerimeter;->type:Lcom/p1/mobile/putong/data/OMSWebPerimeterType;

    .line 107
    .line 108
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSWebDialogPerimeter;->type:Lcom/p1/mobile/putong/data/OMSWebPerimeterType;

    .line 109
    .line 110
    if-nez p1, :cond_6

    .line 111
    .line 112
    sget-object p1, Lcom/p1/mobile/putong/data/OMSWebPerimeterType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 113
    .line 114
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    check-cast p1, Lcom/p1/mobile/putong/data/OMSWebPerimeterType;

    .line 119
    .line 120
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSWebDialogPerimeter;->type:Lcom/p1/mobile/putong/data/OMSWebPerimeterType;

    .line 121
    .line 122
    :cond_6
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 123
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/OMSWebDialogPerimeter$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/OMSWebDialogPerimeter;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/OMSWebDialogPerimeter;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSWebDialogPerimeter;->type:Lcom/p1/mobile/putong/data/OMSWebPerimeterType;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

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
    const/4 p0, 0x2

    .line 14
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/OMSWebDialogPerimeter;->value:D

    .line 15
    .line 16
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSWebDialogPerimeter;->type:Lcom/p1/mobile/putong/data/OMSWebPerimeterType;

    .line 20
    .line 21
    if-eqz p0, :cond_1

    .line 22
    .line 23
    const/4 p1, 0x3

    .line 24
    sget-object v0, Lcom/p1/mobile/putong/data/OMSWebPerimeterType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 25
    .line 26
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 27
    .line 28
    .line 29
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

    .line 30
    check-cast p1, Lcom/p1/mobile/putong/data/OMSWebDialogPerimeter;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/OMSWebDialogPerimeter$1;->serialize(Lcom/p1/mobile/putong/data/OMSWebDialogPerimeter;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
