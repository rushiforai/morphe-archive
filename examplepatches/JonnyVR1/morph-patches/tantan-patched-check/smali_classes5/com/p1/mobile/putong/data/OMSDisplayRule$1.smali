.class Lcom/p1/mobile/putong/data/OMSDisplayRule$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/OMSDisplayRule;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/OMSDisplayRule;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/OMSDisplayRule;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSDisplayRule;->resourceID:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSDisplayRule;->frequency:Ljava/util/List;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->INT_BOXED_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 17
    .line 18
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    const/4 v2, 0x2

    .line 23
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    add-int/2addr p0, v0

    .line 28
    :cond_1
    const/4 v0, 0x3

    .line 29
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSDisplayRule;->count:I

    .line 30
    .line 31
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    add-int/2addr p0, v0

    .line 36
    const/4 v0, 0x4

    .line 37
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSDisplayRule;->sessionCount:I

    .line 38
    .line 39
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    add-int/2addr p0, v0

    .line 44
    const/4 v0, 0x5

    .line 45
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSDisplayRule;->priority:I

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
    const/4 v0, 0x6

    .line 53
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSDisplayRule;->timePerDay:I

    .line 54
    .line 55
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    add-int/2addr p0, v0

    .line 60
    const/4 v0, 0x7

    .line 61
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSDisplayRule;->timePerWeek:I

    .line 62
    .line 63
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    add-int/2addr p0, v0

    .line 68
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSDisplayRule;->timeRange:Ljava/util/List;

    .line 69
    .line 70
    if-eqz v0, :cond_2

    .line 71
    .line 72
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->LONG_BOXED_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 73
    .line 74
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    const/16 v2, 0x8

    .line 79
    .line 80
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    add-int/2addr p0, v0

    .line 85
    :cond_2
    const/16 v0, 0x9

    .line 86
    .line 87
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSDisplayRule;->dayOffset:I

    .line 88
    .line 89
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    add-int/2addr p0, v0

    .line 94
    const/16 v0, 0xa

    .line 95
    .line 96
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/OMSDisplayRule;->userDimension:Z

    .line 97
    .line 98
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    add-int/2addr p0, v0

    .line 103
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 104
    .line 105
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 106
    check-cast p1, Lcom/p1/mobile/putong/data/OMSDisplayRule;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/OMSDisplayRule$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/OMSDisplayRule;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/OMSDisplayRule;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/OMSDisplayRule;-><init>()V

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
    sparse-switch v0, :sswitch_data_0

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSDisplayRule;->resourceID:Ljava/lang/String;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OMSDisplayRule;->resourceID:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSDisplayRule;->frequency:Ljava/util/List;

    .line 22
    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    new-instance p1, Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSDisplayRule;->frequency:Ljava/util/List;

    .line 31
    .line 32
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSDisplayRule;->timeRange:Ljava/util/List;

    .line 33
    .line 34
    if-nez p1, :cond_4

    .line 35
    .line 36
    new-instance p1, Ljava/util/ArrayList;

    .line 37
    .line 38
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 39
    .line 40
    .line 41
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSDisplayRule;->timeRange:Ljava/util/List;

    .line 42
    .line 43
    return-object p0

    .line 44
    :sswitch_0
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/OMSDisplayRule;->userDimension:Z

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :sswitch_1
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    iput v0, p0, Lcom/p1/mobile/putong/data/OMSDisplayRule;->dayOffset:I

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :sswitch_2
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->LONG_BOXED_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 59
    .line 60
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    check-cast v0, Ljava/util/List;

    .line 69
    .line 70
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSDisplayRule;->timeRange:Ljava/util/List;

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    iput v0, p0, Lcom/p1/mobile/putong/data/OMSDisplayRule;->timePerWeek:I

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    iput v0, p0, Lcom/p1/mobile/putong/data/OMSDisplayRule;->timePerDay:I

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    iput v0, p0, Lcom/p1/mobile/putong/data/OMSDisplayRule;->priority:I

    .line 92
    .line 93
    goto :goto_0

    .line 94
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    iput v0, p0, Lcom/p1/mobile/putong/data/OMSDisplayRule;->sessionCount:I

    .line 99
    .line 100
    goto :goto_0

    .line 101
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    iput v0, p0, Lcom/p1/mobile/putong/data/OMSDisplayRule;->count:I

    .line 106
    .line 107
    goto :goto_0

    .line 108
    :sswitch_8
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->INT_BOXED_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 109
    .line 110
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    check-cast v0, Ljava/util/List;

    .line 119
    .line 120
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSDisplayRule;->frequency:Ljava/util/List;

    .line 121
    .line 122
    goto :goto_0

    .line 123
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSDisplayRule;->resourceID:Ljava/lang/String;

    .line 128
    .line 129
    goto :goto_0

    .line 130
    :sswitch_a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSDisplayRule;->resourceID:Ljava/lang/String;

    .line 131
    .line 132
    if-nez p1, :cond_2

    .line 133
    .line 134
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OMSDisplayRule;->resourceID:Ljava/lang/String;

    .line 135
    .line 136
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSDisplayRule;->frequency:Ljava/util/List;

    .line 137
    .line 138
    if-nez p1, :cond_3

    .line 139
    .line 140
    new-instance p1, Ljava/util/ArrayList;

    .line 141
    .line 142
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 143
    .line 144
    .line 145
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSDisplayRule;->frequency:Ljava/util/List;

    .line 146
    .line 147
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSDisplayRule;->timeRange:Ljava/util/List;

    .line 148
    .line 149
    if-nez p1, :cond_4

    .line 150
    .line 151
    new-instance p1, Ljava/util/ArrayList;

    .line 152
    .line 153
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 154
    .line 155
    .line 156
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSDisplayRule;->timeRange:Ljava/util/List;

    .line 157
    .line 158
    :cond_4
    return-object p0

    .line 159
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_a
        0xa -> :sswitch_9
        0x12 -> :sswitch_8
        0x18 -> :sswitch_7
        0x20 -> :sswitch_6
        0x28 -> :sswitch_5
        0x30 -> :sswitch_4
        0x38 -> :sswitch_3
        0x42 -> :sswitch_2
        0x48 -> :sswitch_1
        0x50 -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 159
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/OMSDisplayRule$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/OMSDisplayRule;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/OMSDisplayRule;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSDisplayRule;->resourceID:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSDisplayRule;->frequency:Ljava/util/List;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->INT_BOXED_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const/4 v1, 0x2

    .line 20
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 21
    .line 22
    .line 23
    :cond_1
    const/4 p0, 0x3

    .line 24
    iget v0, p1, Lcom/p1/mobile/putong/data/OMSDisplayRule;->count:I

    .line 25
    .line 26
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 27
    .line 28
    .line 29
    const/4 p0, 0x4

    .line 30
    iget v0, p1, Lcom/p1/mobile/putong/data/OMSDisplayRule;->sessionCount:I

    .line 31
    .line 32
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 33
    .line 34
    .line 35
    const/4 p0, 0x5

    .line 36
    iget v0, p1, Lcom/p1/mobile/putong/data/OMSDisplayRule;->priority:I

    .line 37
    .line 38
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 39
    .line 40
    .line 41
    const/4 p0, 0x6

    .line 42
    iget v0, p1, Lcom/p1/mobile/putong/data/OMSDisplayRule;->timePerDay:I

    .line 43
    .line 44
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 45
    .line 46
    .line 47
    const/4 p0, 0x7

    .line 48
    iget v0, p1, Lcom/p1/mobile/putong/data/OMSDisplayRule;->timePerWeek:I

    .line 49
    .line 50
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 51
    .line 52
    .line 53
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSDisplayRule;->timeRange:Ljava/util/List;

    .line 54
    .line 55
    if-eqz p0, :cond_2

    .line 56
    .line 57
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->LONG_BOXED_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 58
    .line 59
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    const/16 v1, 0x8

    .line 64
    .line 65
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 66
    .line 67
    .line 68
    :cond_2
    const/16 p0, 0x9

    .line 69
    .line 70
    iget v0, p1, Lcom/p1/mobile/putong/data/OMSDisplayRule;->dayOffset:I

    .line 71
    .line 72
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 73
    .line 74
    .line 75
    const/16 p0, 0xa

    .line 76
    .line 77
    iget-boolean p1, p1, Lcom/p1/mobile/putong/data/OMSDisplayRule;->userDimension:Z

    .line 78
    .line 79
    invoke-virtual {p2, p0, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 83
    check-cast p1, Lcom/p1/mobile/putong/data/OMSDisplayRule;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/OMSDisplayRule$1;->serialize(Lcom/p1/mobile/putong/data/OMSDisplayRule;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
