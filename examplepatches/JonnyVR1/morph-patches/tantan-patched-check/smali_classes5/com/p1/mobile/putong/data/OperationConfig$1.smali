.class Lcom/p1/mobile/putong/data/OperationConfig$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/OperationConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/OperationConfig;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/OperationConfig;)I
    .locals 2

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OperationConfig;->skipContent:Ljava/lang/String;

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
    const/4 v0, 0x2

    .line 13
    iget v1, p1, Lcom/p1/mobile/putong/data/OperationConfig;->clickType:I

    .line 14
    .line 15
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    add-int/2addr p0, v0

    .line 20
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OperationConfig;->buttonStyle:Ljava/lang/String;

    .line 21
    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    const/4 v1, 0x3

    .line 25
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    add-int/2addr p0, v0

    .line 30
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OperationConfig;->buttonContent:Ljava/lang/String;

    .line 31
    .line 32
    if-eqz v0, :cond_2

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
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OperationConfig;->slideImg:Ljava/lang/String;

    .line 41
    .line 42
    if-eqz v0, :cond_3

    .line 43
    .line 44
    const/4 v1, 0x5

    .line 45
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    add-int/2addr p0, v0

    .line 50
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OperationConfig;->slideContent:Ljava/lang/String;

    .line 51
    .line 52
    if-eqz v0, :cond_4

    .line 53
    .line 54
    const/4 v1, 0x6

    .line 55
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    add-int/2addr p0, v0

    .line 60
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OperationConfig;->slideContentSecond:Ljava/lang/String;

    .line 61
    .line 62
    if-eqz v0, :cond_5

    .line 63
    .line 64
    const/4 v1, 0x7

    .line 65
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    add-int/2addr p0, v0

    .line 70
    :cond_5
    const/16 v0, 0x8

    .line 71
    .line 72
    iget v1, p1, Lcom/p1/mobile/putong/data/OperationConfig;->slideValue:I

    .line 73
    .line 74
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    add-int/2addr p0, v0

    .line 79
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OperationConfig;->shakeSound:Ljava/lang/String;

    .line 80
    .line 81
    if-eqz v0, :cond_6

    .line 82
    .line 83
    const/16 v1, 0x9

    .line 84
    .line 85
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    add-int/2addr p0, v0

    .line 90
    :cond_6
    const/16 v0, 0xa

    .line 91
    .line 92
    iget v1, p1, Lcom/p1/mobile/putong/data/OperationConfig;->shakeValue:I

    .line 93
    .line 94
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    add-int/2addr p0, v0

    .line 99
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OperationConfig;->shakeContent:Ljava/lang/String;

    .line 100
    .line 101
    if-eqz v0, :cond_7

    .line 102
    .line 103
    const/16 v1, 0xb

    .line 104
    .line 105
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    add-int/2addr p0, v0

    .line 110
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OperationConfig;->shakeContentSecond:Ljava/lang/String;

    .line 111
    .line 112
    if-eqz v0, :cond_8

    .line 113
    .line 114
    const/16 v1, 0xc

    .line 115
    .line 116
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    add-int/2addr p0, v0

    .line 121
    :cond_8
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 122
    .line 123
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 124
    check-cast p1, Lcom/p1/mobile/putong/data/OperationConfig;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/OperationConfig$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/OperationConfig;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/OperationConfig;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/OperationConfig;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/OperationConfig;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OperationConfig;->skipContent:Ljava/lang/String;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OperationConfig;->skipContent:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OperationConfig;->buttonStyle:Ljava/lang/String;

    .line 22
    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OperationConfig;->buttonStyle:Ljava/lang/String;

    .line 26
    .line 27
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OperationConfig;->buttonContent:Ljava/lang/String;

    .line 28
    .line 29
    if-nez p1, :cond_2

    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OperationConfig;->buttonContent:Ljava/lang/String;

    .line 32
    .line 33
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OperationConfig;->slideImg:Ljava/lang/String;

    .line 34
    .line 35
    if-nez p1, :cond_3

    .line 36
    .line 37
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OperationConfig;->slideImg:Ljava/lang/String;

    .line 38
    .line 39
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OperationConfig;->slideContent:Ljava/lang/String;

    .line 40
    .line 41
    if-nez p1, :cond_4

    .line 42
    .line 43
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OperationConfig;->slideContent:Ljava/lang/String;

    .line 44
    .line 45
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OperationConfig;->slideContentSecond:Ljava/lang/String;

    .line 46
    .line 47
    if-nez p1, :cond_5

    .line 48
    .line 49
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OperationConfig;->slideContentSecond:Ljava/lang/String;

    .line 50
    .line 51
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OperationConfig;->shakeSound:Ljava/lang/String;

    .line 52
    .line 53
    if-nez p1, :cond_6

    .line 54
    .line 55
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OperationConfig;->shakeSound:Ljava/lang/String;

    .line 56
    .line 57
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OperationConfig;->shakeContent:Ljava/lang/String;

    .line 58
    .line 59
    if-nez p1, :cond_7

    .line 60
    .line 61
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OperationConfig;->shakeContent:Ljava/lang/String;

    .line 62
    .line 63
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OperationConfig;->shakeContentSecond:Ljava/lang/String;

    .line 64
    .line 65
    if-nez p1, :cond_10

    .line 66
    .line 67
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OperationConfig;->shakeContentSecond:Ljava/lang/String;

    .line 68
    .line 69
    return-object p0

    .line 70
    :sswitch_0
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OperationConfig;->shakeContentSecond:Ljava/lang/String;

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :sswitch_1
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OperationConfig;->shakeContent:Ljava/lang/String;

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    iput v0, p0, Lcom/p1/mobile/putong/data/OperationConfig;->shakeValue:I

    .line 89
    .line 90
    goto :goto_0

    .line 91
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OperationConfig;->shakeSound:Ljava/lang/String;

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    iput v0, p0, Lcom/p1/mobile/putong/data/OperationConfig;->slideValue:I

    .line 103
    .line 104
    goto :goto_0

    .line 105
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OperationConfig;->slideContentSecond:Ljava/lang/String;

    .line 110
    .line 111
    goto :goto_0

    .line 112
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OperationConfig;->slideContent:Ljava/lang/String;

    .line 117
    .line 118
    goto :goto_0

    .line 119
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OperationConfig;->slideImg:Ljava/lang/String;

    .line 124
    .line 125
    goto :goto_0

    .line 126
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OperationConfig;->buttonContent:Ljava/lang/String;

    .line 131
    .line 132
    goto :goto_0

    .line 133
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OperationConfig;->buttonStyle:Ljava/lang/String;

    .line 138
    .line 139
    goto/16 :goto_0

    .line 140
    .line 141
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 142
    .line 143
    .line 144
    move-result v0

    .line 145
    iput v0, p0, Lcom/p1/mobile/putong/data/OperationConfig;->clickType:I

    .line 146
    .line 147
    goto/16 :goto_0

    .line 148
    .line 149
    :sswitch_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OperationConfig;->skipContent:Ljava/lang/String;

    .line 154
    .line 155
    goto/16 :goto_0

    .line 156
    .line 157
    :sswitch_c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OperationConfig;->skipContent:Ljava/lang/String;

    .line 158
    .line 159
    if-nez p1, :cond_8

    .line 160
    .line 161
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OperationConfig;->skipContent:Ljava/lang/String;

    .line 162
    .line 163
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OperationConfig;->buttonStyle:Ljava/lang/String;

    .line 164
    .line 165
    if-nez p1, :cond_9

    .line 166
    .line 167
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OperationConfig;->buttonStyle:Ljava/lang/String;

    .line 168
    .line 169
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OperationConfig;->buttonContent:Ljava/lang/String;

    .line 170
    .line 171
    if-nez p1, :cond_a

    .line 172
    .line 173
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OperationConfig;->buttonContent:Ljava/lang/String;

    .line 174
    .line 175
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OperationConfig;->slideImg:Ljava/lang/String;

    .line 176
    .line 177
    if-nez p1, :cond_b

    .line 178
    .line 179
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OperationConfig;->slideImg:Ljava/lang/String;

    .line 180
    .line 181
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OperationConfig;->slideContent:Ljava/lang/String;

    .line 182
    .line 183
    if-nez p1, :cond_c

    .line 184
    .line 185
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OperationConfig;->slideContent:Ljava/lang/String;

    .line 186
    .line 187
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OperationConfig;->slideContentSecond:Ljava/lang/String;

    .line 188
    .line 189
    if-nez p1, :cond_d

    .line 190
    .line 191
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OperationConfig;->slideContentSecond:Ljava/lang/String;

    .line 192
    .line 193
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OperationConfig;->shakeSound:Ljava/lang/String;

    .line 194
    .line 195
    if-nez p1, :cond_e

    .line 196
    .line 197
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OperationConfig;->shakeSound:Ljava/lang/String;

    .line 198
    .line 199
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OperationConfig;->shakeContent:Ljava/lang/String;

    .line 200
    .line 201
    if-nez p1, :cond_f

    .line 202
    .line 203
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OperationConfig;->shakeContent:Ljava/lang/String;

    .line 204
    .line 205
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OperationConfig;->shakeContentSecond:Ljava/lang/String;

    .line 206
    .line 207
    if-nez p1, :cond_10

    .line 208
    .line 209
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OperationConfig;->shakeContentSecond:Ljava/lang/String;

    .line 210
    .line 211
    :cond_10
    return-object p0

    .line 212
    nop

    .line 213
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_c
        0xa -> :sswitch_b
        0x10 -> :sswitch_a
        0x1a -> :sswitch_9
        0x22 -> :sswitch_8
        0x2a -> :sswitch_7
        0x32 -> :sswitch_6
        0x3a -> :sswitch_5
        0x40 -> :sswitch_4
        0x4a -> :sswitch_3
        0x50 -> :sswitch_2
        0x5a -> :sswitch_1
        0x62 -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 213
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/OperationConfig$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/OperationConfig;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/OperationConfig;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OperationConfig;->skipContent:Ljava/lang/String;

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
    const/4 p0, 0x2

    .line 10
    iget v0, p1, Lcom/p1/mobile/putong/data/OperationConfig;->clickType:I

    .line 11
    .line 12
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OperationConfig;->buttonStyle:Ljava/lang/String;

    .line 16
    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    const/4 v0, 0x3

    .line 20
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OperationConfig;->buttonContent:Ljava/lang/String;

    .line 24
    .line 25
    if-eqz p0, :cond_2

    .line 26
    .line 27
    const/4 v0, 0x4

    .line 28
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 29
    .line 30
    .line 31
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OperationConfig;->slideImg:Ljava/lang/String;

    .line 32
    .line 33
    if-eqz p0, :cond_3

    .line 34
    .line 35
    const/4 v0, 0x5

    .line 36
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 37
    .line 38
    .line 39
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OperationConfig;->slideContent:Ljava/lang/String;

    .line 40
    .line 41
    if-eqz p0, :cond_4

    .line 42
    .line 43
    const/4 v0, 0x6

    .line 44
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 45
    .line 46
    .line 47
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OperationConfig;->slideContentSecond:Ljava/lang/String;

    .line 48
    .line 49
    if-eqz p0, :cond_5

    .line 50
    .line 51
    const/4 v0, 0x7

    .line 52
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 53
    .line 54
    .line 55
    :cond_5
    const/16 p0, 0x8

    .line 56
    .line 57
    iget v0, p1, Lcom/p1/mobile/putong/data/OperationConfig;->slideValue:I

    .line 58
    .line 59
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 60
    .line 61
    .line 62
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OperationConfig;->shakeSound:Ljava/lang/String;

    .line 63
    .line 64
    if-eqz p0, :cond_6

    .line 65
    .line 66
    const/16 v0, 0x9

    .line 67
    .line 68
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 69
    .line 70
    .line 71
    :cond_6
    const/16 p0, 0xa

    .line 72
    .line 73
    iget v0, p1, Lcom/p1/mobile/putong/data/OperationConfig;->shakeValue:I

    .line 74
    .line 75
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 76
    .line 77
    .line 78
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OperationConfig;->shakeContent:Ljava/lang/String;

    .line 79
    .line 80
    if-eqz p0, :cond_7

    .line 81
    .line 82
    const/16 v0, 0xb

    .line 83
    .line 84
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 85
    .line 86
    .line 87
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OperationConfig;->shakeContentSecond:Ljava/lang/String;

    .line 88
    .line 89
    if-eqz p0, :cond_8

    .line 90
    .line 91
    const/16 p1, 0xc

    .line 92
    .line 93
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 94
    .line 95
    .line 96
    :cond_8
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 97
    check-cast p1, Lcom/p1/mobile/putong/data/OperationConfig;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/OperationConfig$1;->serialize(Lcom/p1/mobile/putong/data/OperationConfig;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
