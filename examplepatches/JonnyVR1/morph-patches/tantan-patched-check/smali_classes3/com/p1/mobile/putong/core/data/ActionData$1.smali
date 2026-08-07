.class Lcom/p1/mobile/putong/core/data/ActionData$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/ActionData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/ActionData;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/ActionData;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ActionData;->toast:Lcom/p1/mobile/putong/core/data/ActionToast;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    sget-object v1, Lcom/p1/mobile/putong/core/data/ActionToast;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    invoke-static {v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    :goto_0
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ActionData;->pageFormat:Lcom/p1/mobile/putong/core/data/ActionPageFormat;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    const/4 v1, 0x2

    .line 19
    sget-object v2, Lcom/p1/mobile/putong/core/data/ActionPageFormat;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 20
    .line 21
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    add-int/2addr p0, v0

    .line 26
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ActionData;->insertFormat:Lcom/p1/mobile/putong/core/data/ActionInsertFormat;

    .line 27
    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    const/4 v1, 0x3

    .line 31
    sget-object v2, Lcom/p1/mobile/putong/core/data/ActionInsertFormat;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 32
    .line 33
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    add-int/2addr p0, v0

    .line 38
    :cond_2
    const/4 v0, 0x4

    .line 39
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/ActionData;->dataTime:J

    .line 40
    .line 41
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    add-int/2addr p0, v0

    .line 46
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ActionData;->toastStyle:Lcom/p1/mobile/putong/core/data/ActionToastStyle;

    .line 47
    .line 48
    if-eqz v0, :cond_3

    .line 49
    .line 50
    const/4 v1, 0x5

    .line 51
    sget-object v2, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 52
    .line 53
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    add-int/2addr p0, v0

    .line 58
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ActionData;->traceId:Ljava/lang/String;

    .line 59
    .line 60
    if-eqz v0, :cond_4

    .line 61
    .line 62
    const/4 v1, 0x6

    .line 63
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    add-int/2addr p0, v0

    .line 68
    :cond_4
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 69
    .line 70
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 71
    check-cast p1, Lcom/p1/mobile/putong/core/data/ActionData;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/ActionData$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/ActionData;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/ActionData;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/ActionData;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/ActionData;-><init>()V

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
    if-eqz v0, :cond_a

    .line 13
    .line 14
    const/16 v2, 0xa

    .line 15
    .line 16
    if-eq v0, v2, :cond_9

    .line 17
    .line 18
    const/16 v2, 0x12

    .line 19
    .line 20
    if-eq v0, v2, :cond_8

    .line 21
    .line 22
    const/16 v2, 0x1a

    .line 23
    .line 24
    if-eq v0, v2, :cond_7

    .line 25
    .line 26
    const/16 v2, 0x20

    .line 27
    .line 28
    if-eq v0, v2, :cond_6

    .line 29
    .line 30
    const/16 v2, 0x2a

    .line 31
    .line 32
    if-eq v0, v2, :cond_5

    .line 33
    .line 34
    const/16 v2, 0x32

    .line 35
    .line 36
    if-eq v0, v2, :cond_4

    .line 37
    .line 38
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionData;->toast:Lcom/p1/mobile/putong/core/data/ActionToast;

    .line 39
    .line 40
    if-nez p1, :cond_0

    .line 41
    .line 42
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ActionToast;->new_()Lcom/p1/mobile/putong/core/data/ActionToast;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionData;->toast:Lcom/p1/mobile/putong/core/data/ActionToast;

    .line 47
    .line 48
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionData;->pageFormat:Lcom/p1/mobile/putong/core/data/ActionPageFormat;

    .line 49
    .line 50
    if-nez p1, :cond_1

    .line 51
    .line 52
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ActionPageFormat;->new_()Lcom/p1/mobile/putong/core/data/ActionPageFormat;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionData;->pageFormat:Lcom/p1/mobile/putong/core/data/ActionPageFormat;

    .line 57
    .line 58
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionData;->insertFormat:Lcom/p1/mobile/putong/core/data/ActionInsertFormat;

    .line 59
    .line 60
    if-nez p1, :cond_2

    .line 61
    .line 62
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ActionInsertFormat;->new_()Lcom/p1/mobile/putong/core/data/ActionInsertFormat;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionData;->insertFormat:Lcom/p1/mobile/putong/core/data/ActionInsertFormat;

    .line 67
    .line 68
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionData;->toastStyle:Lcom/p1/mobile/putong/core/data/ActionToastStyle;

    .line 69
    .line 70
    if-nez p1, :cond_3

    .line 71
    .line 72
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->new_()Lcom/p1/mobile/putong/core/data/ActionToastStyle;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionData;->toastStyle:Lcom/p1/mobile/putong/core/data/ActionToastStyle;

    .line 77
    .line 78
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionData;->traceId:Ljava/lang/String;

    .line 79
    .line 80
    if-nez p1, :cond_f

    .line 81
    .line 82
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ActionData;->traceId:Ljava/lang/String;

    .line 83
    .line 84
    return-object p0

    .line 85
    :cond_4
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ActionData;->traceId:Ljava/lang/String;

    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_5
    sget-object v0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 93
    .line 94
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    check-cast v0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;

    .line 99
    .line 100
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ActionData;->toastStyle:Lcom/p1/mobile/putong/core/data/ActionToastStyle;

    .line 101
    .line 102
    goto :goto_0

    .line 103
    :cond_6
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 104
    .line 105
    .line 106
    move-result-wide v0

    .line 107
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/ActionData;->dataTime:J

    .line 108
    .line 109
    goto :goto_0

    .line 110
    :cond_7
    sget-object v0, Lcom/p1/mobile/putong/core/data/ActionInsertFormat;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 111
    .line 112
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    check-cast v0, Lcom/p1/mobile/putong/core/data/ActionInsertFormat;

    .line 117
    .line 118
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ActionData;->insertFormat:Lcom/p1/mobile/putong/core/data/ActionInsertFormat;

    .line 119
    .line 120
    goto :goto_0

    .line 121
    :cond_8
    sget-object v0, Lcom/p1/mobile/putong/core/data/ActionPageFormat;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 122
    .line 123
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    check-cast v0, Lcom/p1/mobile/putong/core/data/ActionPageFormat;

    .line 128
    .line 129
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ActionData;->pageFormat:Lcom/p1/mobile/putong/core/data/ActionPageFormat;

    .line 130
    .line 131
    goto :goto_0

    .line 132
    :cond_9
    sget-object v0, Lcom/p1/mobile/putong/core/data/ActionToast;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 133
    .line 134
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    check-cast v0, Lcom/p1/mobile/putong/core/data/ActionToast;

    .line 139
    .line 140
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ActionData;->toast:Lcom/p1/mobile/putong/core/data/ActionToast;

    .line 141
    .line 142
    goto/16 :goto_0

    .line 143
    .line 144
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionData;->toast:Lcom/p1/mobile/putong/core/data/ActionToast;

    .line 145
    .line 146
    if-nez p1, :cond_b

    .line 147
    .line 148
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ActionToast;->new_()Lcom/p1/mobile/putong/core/data/ActionToast;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionData;->toast:Lcom/p1/mobile/putong/core/data/ActionToast;

    .line 153
    .line 154
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionData;->pageFormat:Lcom/p1/mobile/putong/core/data/ActionPageFormat;

    .line 155
    .line 156
    if-nez p1, :cond_c

    .line 157
    .line 158
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ActionPageFormat;->new_()Lcom/p1/mobile/putong/core/data/ActionPageFormat;

    .line 159
    .line 160
    .line 161
    move-result-object p1

    .line 162
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionData;->pageFormat:Lcom/p1/mobile/putong/core/data/ActionPageFormat;

    .line 163
    .line 164
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionData;->insertFormat:Lcom/p1/mobile/putong/core/data/ActionInsertFormat;

    .line 165
    .line 166
    if-nez p1, :cond_d

    .line 167
    .line 168
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ActionInsertFormat;->new_()Lcom/p1/mobile/putong/core/data/ActionInsertFormat;

    .line 169
    .line 170
    .line 171
    move-result-object p1

    .line 172
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionData;->insertFormat:Lcom/p1/mobile/putong/core/data/ActionInsertFormat;

    .line 173
    .line 174
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionData;->toastStyle:Lcom/p1/mobile/putong/core/data/ActionToastStyle;

    .line 175
    .line 176
    if-nez p1, :cond_e

    .line 177
    .line 178
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->new_()Lcom/p1/mobile/putong/core/data/ActionToastStyle;

    .line 179
    .line 180
    .line 181
    move-result-object p1

    .line 182
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionData;->toastStyle:Lcom/p1/mobile/putong/core/data/ActionToastStyle;

    .line 183
    .line 184
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionData;->traceId:Ljava/lang/String;

    .line 185
    .line 186
    if-nez p1, :cond_f

    .line 187
    .line 188
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ActionData;->traceId:Ljava/lang/String;

    .line 189
    .line 190
    :cond_f
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 191
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/ActionData$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/ActionData;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/ActionData;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ActionData;->toast:Lcom/p1/mobile/putong/core/data/ActionToast;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    sget-object v1, Lcom/p1/mobile/putong/core/data/ActionToast;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ActionData;->pageFormat:Lcom/p1/mobile/putong/core/data/ActionPageFormat;

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    const/4 v0, 0x2

    .line 16
    sget-object v1, Lcom/p1/mobile/putong/core/data/ActionPageFormat;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 17
    .line 18
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ActionData;->insertFormat:Lcom/p1/mobile/putong/core/data/ActionInsertFormat;

    .line 22
    .line 23
    if-eqz p0, :cond_2

    .line 24
    .line 25
    const/4 v0, 0x3

    .line 26
    sget-object v1, Lcom/p1/mobile/putong/core/data/ActionInsertFormat;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 27
    .line 28
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 29
    .line 30
    .line 31
    :cond_2
    const/4 p0, 0x4

    .line 32
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/ActionData;->dataTime:J

    .line 33
    .line 34
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ActionData;->toastStyle:Lcom/p1/mobile/putong/core/data/ActionToastStyle;

    .line 38
    .line 39
    if-eqz p0, :cond_3

    .line 40
    .line 41
    const/4 v0, 0x5

    .line 42
    sget-object v1, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 43
    .line 44
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 45
    .line 46
    .line 47
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ActionData;->traceId:Ljava/lang/String;

    .line 48
    .line 49
    if-eqz p0, :cond_4

    .line 50
    .line 51
    const/4 p1, 0x6

    .line 52
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 53
    .line 54
    .line 55
    :cond_4
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 56
    check-cast p1, Lcom/p1/mobile/putong/core/data/ActionData;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/ActionData$1;->serialize(Lcom/p1/mobile/putong/core/data/ActionData;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
