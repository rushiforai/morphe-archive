.class Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;->id:Lcom/p1/mobile/putong/data/OMSWidgeAnimationType;

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
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;->duration:I

    .line 18
    .line 19
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    add-int/2addr p0, v0

    .line 24
    const/4 v0, 0x3

    .line 25
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;->startDelay:I

    .line 26
    .line 27
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    add-int/2addr p0, v0

    .line 32
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;->constraint:Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 33
    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    const/4 v1, 0x4

    .line 37
    sget-object v2, Lcom/p1/mobile/putong/data/OMSDisplayRule;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;->id:Lcom/p1/mobile/putong/data/OMSWidgeAnimationType;

    .line 45
    .line 46
    if-eqz v0, :cond_2

    .line 47
    .line 48
    const/4 v1, 0x5

    .line 49
    sget-object v2, Lcom/p1/mobile/putong/data/OMSWidgeAnimationType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 50
    .line 51
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    add-int/2addr p0, v0

    .line 56
    :cond_2
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 57
    .line 58
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 59
    check-cast p1, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;-><init>()V

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
    if-eqz v2, :cond_7

    .line 13
    .line 14
    const/16 v3, 0x8

    .line 15
    .line 16
    if-eq v2, v3, :cond_6

    .line 17
    .line 18
    const/16 v3, 0x10

    .line 19
    .line 20
    if-eq v2, v3, :cond_5

    .line 21
    .line 22
    const/16 v3, 0x18

    .line 23
    .line 24
    if-eq v2, v3, :cond_4

    .line 25
    .line 26
    const/16 v3, 0x22

    .line 27
    .line 28
    if-eq v2, v3, :cond_3

    .line 29
    .line 30
    const/16 v3, 0x2a

    .line 31
    .line 32
    if-eq v2, v3, :cond_2

    .line 33
    .line 34
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;->id:Lcom/p1/mobile/putong/data/OMSWidgeAnimationType;

    .line 35
    .line 36
    if-nez p1, :cond_0

    .line 37
    .line 38
    if-eqz v1, :cond_0

    .line 39
    .line 40
    sget-object p1, Lcom/p1/mobile/putong/data/OMSWidgeAnimationType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 41
    .line 42
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    check-cast p1, Lcom/p1/mobile/putong/data/OMSWidgeAnimationType;

    .line 51
    .line 52
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;->id:Lcom/p1/mobile/putong/data/OMSWidgeAnimationType;

    .line 53
    .line 54
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;->id:Lcom/p1/mobile/putong/data/OMSWidgeAnimationType;

    .line 55
    .line 56
    if-nez p1, :cond_1

    .line 57
    .line 58
    sget-object p1, Lcom/p1/mobile/putong/data/OMSWidgeAnimationType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 59
    .line 60
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    check-cast p1, Lcom/p1/mobile/putong/data/OMSWidgeAnimationType;

    .line 65
    .line 66
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;->id:Lcom/p1/mobile/putong/data/OMSWidgeAnimationType;

    .line 67
    .line 68
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;->constraint:Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 69
    .line 70
    if-nez p1, :cond_a

    .line 71
    .line 72
    invoke-static {}, Lcom/p1/mobile/putong/data/OMSDisplayRule;->new_()Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;->constraint:Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 77
    .line 78
    return-object p0

    .line 79
    :cond_2
    sget-object v2, Lcom/p1/mobile/putong/data/OMSWidgeAnimationType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 80
    .line 81
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    check-cast v2, Lcom/p1/mobile/putong/data/OMSWidgeAnimationType;

    .line 86
    .line 87
    iput-object v2, p0, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;->id:Lcom/p1/mobile/putong/data/OMSWidgeAnimationType;

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_3
    sget-object v2, Lcom/p1/mobile/putong/data/OMSDisplayRule;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 91
    .line 92
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    check-cast v2, Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 97
    .line 98
    iput-object v2, p0, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;->constraint:Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 99
    .line 100
    goto :goto_0

    .line 101
    :cond_4
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 102
    .line 103
    .line 104
    move-result v2

    .line 105
    iput v2, p0, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;->startDelay:I

    .line 106
    .line 107
    goto :goto_0

    .line 108
    :cond_5
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 109
    .line 110
    .line 111
    move-result v2

    .line 112
    iput v2, p0, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;->duration:I

    .line 113
    .line 114
    goto :goto_0

    .line 115
    :cond_6
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 116
    .line 117
    .line 118
    move-result v1

    .line 119
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    goto :goto_0

    .line 124
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;->id:Lcom/p1/mobile/putong/data/OMSWidgeAnimationType;

    .line 125
    .line 126
    if-nez p1, :cond_8

    .line 127
    .line 128
    if-eqz v1, :cond_8

    .line 129
    .line 130
    sget-object p1, Lcom/p1/mobile/putong/data/OMSWidgeAnimationType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 131
    .line 132
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 133
    .line 134
    .line 135
    move-result v1

    .line 136
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    check-cast p1, Lcom/p1/mobile/putong/data/OMSWidgeAnimationType;

    .line 141
    .line 142
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;->id:Lcom/p1/mobile/putong/data/OMSWidgeAnimationType;

    .line 143
    .line 144
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;->id:Lcom/p1/mobile/putong/data/OMSWidgeAnimationType;

    .line 145
    .line 146
    if-nez p1, :cond_9

    .line 147
    .line 148
    sget-object p1, Lcom/p1/mobile/putong/data/OMSWidgeAnimationType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 149
    .line 150
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 151
    .line 152
    .line 153
    move-result-object p1

    .line 154
    check-cast p1, Lcom/p1/mobile/putong/data/OMSWidgeAnimationType;

    .line 155
    .line 156
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;->id:Lcom/p1/mobile/putong/data/OMSWidgeAnimationType;

    .line 157
    .line 158
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;->constraint:Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 159
    .line 160
    if-nez p1, :cond_a

    .line 161
    .line 162
    invoke-static {}, Lcom/p1/mobile/putong/data/OMSDisplayRule;->new_()Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 163
    .line 164
    .line 165
    move-result-object p1

    .line 166
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;->constraint:Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 167
    .line 168
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

    .line 169
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;->id:Lcom/p1/mobile/putong/data/OMSWidgeAnimationType;

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
    iget v0, p1, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;->duration:I

    .line 15
    .line 16
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 17
    .line 18
    .line 19
    const/4 p0, 0x3

    .line 20
    iget v0, p1, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;->startDelay:I

    .line 21
    .line 22
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;->constraint:Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 26
    .line 27
    if-eqz p0, :cond_1

    .line 28
    .line 29
    const/4 v0, 0x4

    .line 30
    sget-object v1, Lcom/p1/mobile/putong/data/OMSDisplayRule;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 31
    .line 32
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 33
    .line 34
    .line 35
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;->id:Lcom/p1/mobile/putong/data/OMSWidgeAnimationType;

    .line 36
    .line 37
    if-eqz p0, :cond_2

    .line 38
    .line 39
    const/4 p1, 0x5

    .line 40
    sget-object v0, Lcom/p1/mobile/putong/data/OMSWidgeAnimationType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 41
    .line 42
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 43
    .line 44
    .line 45
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

    .line 46
    check-cast p1, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo$1;->serialize(Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
