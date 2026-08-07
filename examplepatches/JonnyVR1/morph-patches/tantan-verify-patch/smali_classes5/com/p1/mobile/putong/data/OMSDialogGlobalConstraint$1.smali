.class Lcom/p1/mobile/putong/data/OMSDialogGlobalConstraint$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/OMSDialogGlobalConstraint;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/OMSDialogGlobalConstraint;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/OMSDialogGlobalConstraint;)I
    .locals 3

    .line 1
    const/4 p0, 0x1

    .line 2
    iget v0, p1, Lcom/p1/mobile/putong/data/OMSDialogGlobalConstraint;->count:I

    .line 3
    .line 4
    invoke-static {p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    const/4 v0, 0x2

    .line 9
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSDialogGlobalConstraint;->sessionCount:I

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSDialogGlobalConstraint;->dimension:Lcom/p1/mobile/putong/data/OmsConstraintDimension;

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    const/4 v1, 0x3

    .line 21
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    add-int/2addr p0, v0

    .line 30
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSDialogGlobalConstraint;->type:Ljava/lang/String;

    .line 31
    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    const/4 v1, 0x4

    .line 35
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    add-int/2addr p0, v0

    .line 40
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSDialogGlobalConstraint;->dimension:Lcom/p1/mobile/putong/data/OmsConstraintDimension;

    .line 41
    .line 42
    if-eqz v0, :cond_2

    .line 43
    .line 44
    const/4 v1, 0x5

    .line 45
    sget-object v2, Lcom/p1/mobile/putong/data/OmsConstraintDimension;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 46
    .line 47
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    add-int/2addr p0, v0

    .line 52
    :cond_2
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 53
    .line 54
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 55
    check-cast p1, Lcom/p1/mobile/putong/data/OMSDialogGlobalConstraint;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/OMSDialogGlobalConstraint$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/OMSDialogGlobalConstraint;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/OMSDialogGlobalConstraint;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/OMSDialogGlobalConstraint;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/OMSDialogGlobalConstraint;-><init>()V

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
    const-string v3, ""

    .line 13
    .line 14
    if-eqz v2, :cond_7

    .line 15
    .line 16
    const/16 v4, 0x8

    .line 17
    .line 18
    if-eq v2, v4, :cond_6

    .line 19
    .line 20
    const/16 v4, 0x10

    .line 21
    .line 22
    if-eq v2, v4, :cond_5

    .line 23
    .line 24
    const/16 v4, 0x18

    .line 25
    .line 26
    if-eq v2, v4, :cond_4

    .line 27
    .line 28
    const/16 v4, 0x22

    .line 29
    .line 30
    if-eq v2, v4, :cond_3

    .line 31
    .line 32
    const/16 v4, 0x2a

    .line 33
    .line 34
    if-eq v2, v4, :cond_2

    .line 35
    .line 36
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialogGlobalConstraint;->dimension:Lcom/p1/mobile/putong/data/OmsConstraintDimension;

    .line 37
    .line 38
    if-nez p1, :cond_0

    .line 39
    .line 40
    if-eqz v1, :cond_0

    .line 41
    .line 42
    sget-object p1, Lcom/p1/mobile/putong/data/OmsConstraintDimension;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 43
    .line 44
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    check-cast p1, Lcom/p1/mobile/putong/data/OmsConstraintDimension;

    .line 53
    .line 54
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialogGlobalConstraint;->dimension:Lcom/p1/mobile/putong/data/OmsConstraintDimension;

    .line 55
    .line 56
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialogGlobalConstraint;->dimension:Lcom/p1/mobile/putong/data/OmsConstraintDimension;

    .line 57
    .line 58
    if-nez p1, :cond_1

    .line 59
    .line 60
    sget-object p1, Lcom/p1/mobile/putong/data/OmsConstraintDimension;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 61
    .line 62
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    check-cast p1, Lcom/p1/mobile/putong/data/OmsConstraintDimension;

    .line 67
    .line 68
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialogGlobalConstraint;->dimension:Lcom/p1/mobile/putong/data/OmsConstraintDimension;

    .line 69
    .line 70
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialogGlobalConstraint;->type:Ljava/lang/String;

    .line 71
    .line 72
    if-nez p1, :cond_a

    .line 73
    .line 74
    iput-object v3, p0, Lcom/p1/mobile/putong/data/OMSDialogGlobalConstraint;->type:Ljava/lang/String;

    .line 75
    .line 76
    return-object p0

    .line 77
    :cond_2
    sget-object v2, Lcom/p1/mobile/putong/data/OmsConstraintDimension;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 78
    .line 79
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    check-cast v2, Lcom/p1/mobile/putong/data/OmsConstraintDimension;

    .line 84
    .line 85
    iput-object v2, p0, Lcom/p1/mobile/putong/data/OMSDialogGlobalConstraint;->dimension:Lcom/p1/mobile/putong/data/OmsConstraintDimension;

    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_3
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    iput-object v2, p0, Lcom/p1/mobile/putong/data/OMSDialogGlobalConstraint;->type:Ljava/lang/String;

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_4
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 96
    .line 97
    .line 98
    move-result v1

    .line 99
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    goto :goto_0

    .line 104
    :cond_5
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 105
    .line 106
    .line 107
    move-result v2

    .line 108
    iput v2, p0, Lcom/p1/mobile/putong/data/OMSDialogGlobalConstraint;->sessionCount:I

    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_6
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 112
    .line 113
    .line 114
    move-result v2

    .line 115
    iput v2, p0, Lcom/p1/mobile/putong/data/OMSDialogGlobalConstraint;->count:I

    .line 116
    .line 117
    goto :goto_0

    .line 118
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialogGlobalConstraint;->dimension:Lcom/p1/mobile/putong/data/OmsConstraintDimension;

    .line 119
    .line 120
    if-nez p1, :cond_8

    .line 121
    .line 122
    if-eqz v1, :cond_8

    .line 123
    .line 124
    sget-object p1, Lcom/p1/mobile/putong/data/OmsConstraintDimension;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 125
    .line 126
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 127
    .line 128
    .line 129
    move-result v1

    .line 130
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    check-cast p1, Lcom/p1/mobile/putong/data/OmsConstraintDimension;

    .line 135
    .line 136
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialogGlobalConstraint;->dimension:Lcom/p1/mobile/putong/data/OmsConstraintDimension;

    .line 137
    .line 138
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialogGlobalConstraint;->dimension:Lcom/p1/mobile/putong/data/OmsConstraintDimension;

    .line 139
    .line 140
    if-nez p1, :cond_9

    .line 141
    .line 142
    sget-object p1, Lcom/p1/mobile/putong/data/OmsConstraintDimension;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 143
    .line 144
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 145
    .line 146
    .line 147
    move-result-object p1

    .line 148
    check-cast p1, Lcom/p1/mobile/putong/data/OmsConstraintDimension;

    .line 149
    .line 150
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialogGlobalConstraint;->dimension:Lcom/p1/mobile/putong/data/OmsConstraintDimension;

    .line 151
    .line 152
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSDialogGlobalConstraint;->type:Ljava/lang/String;

    .line 153
    .line 154
    if-nez p1, :cond_a

    .line 155
    .line 156
    iput-object v3, p0, Lcom/p1/mobile/putong/data/OMSDialogGlobalConstraint;->type:Ljava/lang/String;

    .line 157
    .line 158
    :cond_a
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 159
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/OMSDialogGlobalConstraint$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/OMSDialogGlobalConstraint;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/OMSDialogGlobalConstraint;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    iget v0, p1, Lcom/p1/mobile/putong/data/OMSDialogGlobalConstraint;->count:I

    .line 3
    .line 4
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 5
    .line 6
    .line 7
    const/4 p0, 0x2

    .line 8
    iget v0, p1, Lcom/p1/mobile/putong/data/OMSDialogGlobalConstraint;->sessionCount:I

    .line 9
    .line 10
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSDialogGlobalConstraint;->dimension:Lcom/p1/mobile/putong/data/OmsConstraintDimension;

    .line 14
    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 v0, 0x3

    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 23
    .line 24
    .line 25
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSDialogGlobalConstraint;->type:Ljava/lang/String;

    .line 26
    .line 27
    if-eqz p0, :cond_1

    .line 28
    .line 29
    const/4 v0, 0x4

    .line 30
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 31
    .line 32
    .line 33
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSDialogGlobalConstraint;->dimension:Lcom/p1/mobile/putong/data/OmsConstraintDimension;

    .line 34
    .line 35
    if-eqz p0, :cond_2

    .line 36
    .line 37
    const/4 p1, 0x5

    .line 38
    sget-object v0, Lcom/p1/mobile/putong/data/OmsConstraintDimension;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 39
    .line 40
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 41
    .line 42
    .line 43
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

    .line 44
    check-cast p1, Lcom/p1/mobile/putong/data/OMSDialogGlobalConstraint;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/OMSDialogGlobalConstraint$1;->serialize(Lcom/p1/mobile/putong/data/OMSDialogGlobalConstraint;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
