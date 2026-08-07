.class Lcom/p1/mobile/putong/data/VoiceLiveGame$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/VoiceLiveGame;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/VoiceLiveGame;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/VoiceLiveGame;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VoiceLiveGame;->id:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VoiceLiveGame;->type:Ljava/lang/String;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    const/4 v1, 0x2

    .line 17
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    add-int/2addr p0, v0

    .line 22
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VoiceLiveGame;->state:Ljava/lang/String;

    .line 23
    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    const/4 v1, 0x3

    .line 27
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    add-int/2addr p0, v0

    .line 32
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VoiceLiveGame;->categoryId:Ljava/lang/String;

    .line 33
    .line 34
    if-eqz v0, :cond_3

    .line 35
    .line 36
    const/4 v1, 0x4

    .line 37
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    add-int/2addr p0, v0

    .line 42
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VoiceLiveGame;->categoryName:Ljava/lang/String;

    .line 43
    .line 44
    if-eqz v0, :cond_4

    .line 45
    .line 46
    const/4 v1, 0x5

    .line 47
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    add-int/2addr p0, v0

    .line 52
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VoiceLiveGame;->templateId:Ljava/lang/String;

    .line 53
    .line 54
    if-eqz v0, :cond_5

    .line 55
    .line 56
    const/4 v1, 0x6

    .line 57
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    add-int/2addr p0, v0

    .line 62
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VoiceLiveGame;->templateTitle:Ljava/lang/String;

    .line 63
    .line 64
    if-eqz v0, :cond_6

    .line 65
    .line 66
    const/4 v1, 0x7

    .line 67
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    add-int/2addr p0, v0

    .line 72
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VoiceLiveGame;->voiceLiveId:Ljava/lang/String;

    .line 73
    .line 74
    if-eqz v0, :cond_7

    .line 75
    .line 76
    const/16 v1, 0x8

    .line 77
    .line 78
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    add-int/2addr p0, v0

    .line 83
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VoiceLiveGame;->createdTime:Ljava/lang/String;

    .line 84
    .line 85
    if-eqz v0, :cond_8

    .line 86
    .line 87
    const/16 v1, 0x9

    .line 88
    .line 89
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    add-int/2addr p0, v0

    .line 94
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VoiceLiveGame;->endTime:Ljava/lang/String;

    .line 95
    .line 96
    if-eqz v0, :cond_9

    .line 97
    .line 98
    const/16 v1, 0xa

    .line 99
    .line 100
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    add-int/2addr p0, v0

    .line 105
    :cond_9
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VoiceLiveGame;->currentChoice:Lcom/p1/mobile/putong/data/VoiceLiveGameCurrentChoice;

    .line 106
    .line 107
    if-eqz v0, :cond_a

    .line 108
    .line 109
    const/16 v1, 0xb

    .line 110
    .line 111
    sget-object v2, Lcom/p1/mobile/putong/data/VoiceLiveGameCurrentChoice;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 112
    .line 113
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    add-int/2addr p0, v0

    .line 118
    :cond_a
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 119
    .line 120
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 121
    check-cast p1, Lcom/p1/mobile/putong/data/VoiceLiveGame;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/VoiceLiveGame$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/VoiceLiveGame;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/VoiceLiveGame;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/VoiceLiveGame;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/VoiceLiveGame;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VoiceLiveGame;->id:Ljava/lang/String;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VoiceLiveGame;->id:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VoiceLiveGame;->type:Ljava/lang/String;

    .line 22
    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VoiceLiveGame;->type:Ljava/lang/String;

    .line 26
    .line 27
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VoiceLiveGame;->state:Ljava/lang/String;

    .line 28
    .line 29
    if-nez p1, :cond_2

    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VoiceLiveGame;->state:Ljava/lang/String;

    .line 32
    .line 33
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VoiceLiveGame;->categoryId:Ljava/lang/String;

    .line 34
    .line 35
    if-nez p1, :cond_3

    .line 36
    .line 37
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VoiceLiveGame;->categoryId:Ljava/lang/String;

    .line 38
    .line 39
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VoiceLiveGame;->categoryName:Ljava/lang/String;

    .line 40
    .line 41
    if-nez p1, :cond_4

    .line 42
    .line 43
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VoiceLiveGame;->categoryName:Ljava/lang/String;

    .line 44
    .line 45
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VoiceLiveGame;->templateId:Ljava/lang/String;

    .line 46
    .line 47
    if-nez p1, :cond_5

    .line 48
    .line 49
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VoiceLiveGame;->templateId:Ljava/lang/String;

    .line 50
    .line 51
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VoiceLiveGame;->templateTitle:Ljava/lang/String;

    .line 52
    .line 53
    if-nez p1, :cond_6

    .line 54
    .line 55
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VoiceLiveGame;->templateTitle:Ljava/lang/String;

    .line 56
    .line 57
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VoiceLiveGame;->voiceLiveId:Ljava/lang/String;

    .line 58
    .line 59
    if-nez p1, :cond_7

    .line 60
    .line 61
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VoiceLiveGame;->voiceLiveId:Ljava/lang/String;

    .line 62
    .line 63
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VoiceLiveGame;->createdTime:Ljava/lang/String;

    .line 64
    .line 65
    if-nez p1, :cond_8

    .line 66
    .line 67
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VoiceLiveGame;->createdTime:Ljava/lang/String;

    .line 68
    .line 69
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VoiceLiveGame;->endTime:Ljava/lang/String;

    .line 70
    .line 71
    if-nez p1, :cond_9

    .line 72
    .line 73
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VoiceLiveGame;->endTime:Ljava/lang/String;

    .line 74
    .line 75
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VoiceLiveGame;->currentChoice:Lcom/p1/mobile/putong/data/VoiceLiveGameCurrentChoice;

    .line 76
    .line 77
    if-nez p1, :cond_14

    .line 78
    .line 79
    invoke-static {}, Lcom/p1/mobile/putong/data/VoiceLiveGameCurrentChoice;->new_()Lcom/p1/mobile/putong/data/VoiceLiveGameCurrentChoice;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VoiceLiveGame;->currentChoice:Lcom/p1/mobile/putong/data/VoiceLiveGameCurrentChoice;

    .line 84
    .line 85
    return-object p0

    .line 86
    :sswitch_0
    sget-object v0, Lcom/p1/mobile/putong/data/VoiceLiveGameCurrentChoice;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 87
    .line 88
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    check-cast v0, Lcom/p1/mobile/putong/data/VoiceLiveGameCurrentChoice;

    .line 93
    .line 94
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VoiceLiveGame;->currentChoice:Lcom/p1/mobile/putong/data/VoiceLiveGameCurrentChoice;

    .line 95
    .line 96
    goto :goto_0

    .line 97
    :sswitch_1
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VoiceLiveGame;->endTime:Ljava/lang/String;

    .line 102
    .line 103
    goto :goto_0

    .line 104
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VoiceLiveGame;->createdTime:Ljava/lang/String;

    .line 109
    .line 110
    goto :goto_0

    .line 111
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VoiceLiveGame;->voiceLiveId:Ljava/lang/String;

    .line 116
    .line 117
    goto :goto_0

    .line 118
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VoiceLiveGame;->templateTitle:Ljava/lang/String;

    .line 123
    .line 124
    goto :goto_0

    .line 125
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VoiceLiveGame;->templateId:Ljava/lang/String;

    .line 130
    .line 131
    goto :goto_0

    .line 132
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VoiceLiveGame;->categoryName:Ljava/lang/String;

    .line 137
    .line 138
    goto/16 :goto_0

    .line 139
    .line 140
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VoiceLiveGame;->categoryId:Ljava/lang/String;

    .line 145
    .line 146
    goto/16 :goto_0

    .line 147
    .line 148
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VoiceLiveGame;->state:Ljava/lang/String;

    .line 153
    .line 154
    goto/16 :goto_0

    .line 155
    .line 156
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VoiceLiveGame;->type:Ljava/lang/String;

    .line 161
    .line 162
    goto/16 :goto_0

    .line 163
    .line 164
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VoiceLiveGame;->id:Ljava/lang/String;

    .line 169
    .line 170
    goto/16 :goto_0

    .line 171
    .line 172
    :sswitch_b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VoiceLiveGame;->id:Ljava/lang/String;

    .line 173
    .line 174
    if-nez p1, :cond_a

    .line 175
    .line 176
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VoiceLiveGame;->id:Ljava/lang/String;

    .line 177
    .line 178
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VoiceLiveGame;->type:Ljava/lang/String;

    .line 179
    .line 180
    if-nez p1, :cond_b

    .line 181
    .line 182
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VoiceLiveGame;->type:Ljava/lang/String;

    .line 183
    .line 184
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VoiceLiveGame;->state:Ljava/lang/String;

    .line 185
    .line 186
    if-nez p1, :cond_c

    .line 187
    .line 188
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VoiceLiveGame;->state:Ljava/lang/String;

    .line 189
    .line 190
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VoiceLiveGame;->categoryId:Ljava/lang/String;

    .line 191
    .line 192
    if-nez p1, :cond_d

    .line 193
    .line 194
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VoiceLiveGame;->categoryId:Ljava/lang/String;

    .line 195
    .line 196
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VoiceLiveGame;->categoryName:Ljava/lang/String;

    .line 197
    .line 198
    if-nez p1, :cond_e

    .line 199
    .line 200
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VoiceLiveGame;->categoryName:Ljava/lang/String;

    .line 201
    .line 202
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VoiceLiveGame;->templateId:Ljava/lang/String;

    .line 203
    .line 204
    if-nez p1, :cond_f

    .line 205
    .line 206
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VoiceLiveGame;->templateId:Ljava/lang/String;

    .line 207
    .line 208
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VoiceLiveGame;->templateTitle:Ljava/lang/String;

    .line 209
    .line 210
    if-nez p1, :cond_10

    .line 211
    .line 212
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VoiceLiveGame;->templateTitle:Ljava/lang/String;

    .line 213
    .line 214
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VoiceLiveGame;->voiceLiveId:Ljava/lang/String;

    .line 215
    .line 216
    if-nez p1, :cond_11

    .line 217
    .line 218
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VoiceLiveGame;->voiceLiveId:Ljava/lang/String;

    .line 219
    .line 220
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VoiceLiveGame;->createdTime:Ljava/lang/String;

    .line 221
    .line 222
    if-nez p1, :cond_12

    .line 223
    .line 224
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VoiceLiveGame;->createdTime:Ljava/lang/String;

    .line 225
    .line 226
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VoiceLiveGame;->endTime:Ljava/lang/String;

    .line 227
    .line 228
    if-nez p1, :cond_13

    .line 229
    .line 230
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VoiceLiveGame;->endTime:Ljava/lang/String;

    .line 231
    .line 232
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VoiceLiveGame;->currentChoice:Lcom/p1/mobile/putong/data/VoiceLiveGameCurrentChoice;

    .line 233
    .line 234
    if-nez p1, :cond_14

    .line 235
    .line 236
    invoke-static {}, Lcom/p1/mobile/putong/data/VoiceLiveGameCurrentChoice;->new_()Lcom/p1/mobile/putong/data/VoiceLiveGameCurrentChoice;

    .line 237
    .line 238
    .line 239
    move-result-object p1

    .line 240
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VoiceLiveGame;->currentChoice:Lcom/p1/mobile/putong/data/VoiceLiveGameCurrentChoice;

    .line 241
    .line 242
    :cond_14
    return-object p0

    .line 243
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_b
        0xa -> :sswitch_a
        0x12 -> :sswitch_9
        0x1a -> :sswitch_8
        0x22 -> :sswitch_7
        0x2a -> :sswitch_6
        0x32 -> :sswitch_5
        0x3a -> :sswitch_4
        0x42 -> :sswitch_3
        0x4a -> :sswitch_2
        0x52 -> :sswitch_1
        0x5a -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 243
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/VoiceLiveGame$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/VoiceLiveGame;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/VoiceLiveGame;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VoiceLiveGame;->id:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VoiceLiveGame;->type:Ljava/lang/String;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    const/4 v0, 0x2

    .line 14
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 15
    .line 16
    .line 17
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VoiceLiveGame;->state:Ljava/lang/String;

    .line 18
    .line 19
    if-eqz p0, :cond_2

    .line 20
    .line 21
    const/4 v0, 0x3

    .line 22
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 23
    .line 24
    .line 25
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VoiceLiveGame;->categoryId:Ljava/lang/String;

    .line 26
    .line 27
    if-eqz p0, :cond_3

    .line 28
    .line 29
    const/4 v0, 0x4

    .line 30
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 31
    .line 32
    .line 33
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VoiceLiveGame;->categoryName:Ljava/lang/String;

    .line 34
    .line 35
    if-eqz p0, :cond_4

    .line 36
    .line 37
    const/4 v0, 0x5

    .line 38
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 39
    .line 40
    .line 41
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VoiceLiveGame;->templateId:Ljava/lang/String;

    .line 42
    .line 43
    if-eqz p0, :cond_5

    .line 44
    .line 45
    const/4 v0, 0x6

    .line 46
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 47
    .line 48
    .line 49
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VoiceLiveGame;->templateTitle:Ljava/lang/String;

    .line 50
    .line 51
    if-eqz p0, :cond_6

    .line 52
    .line 53
    const/4 v0, 0x7

    .line 54
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 55
    .line 56
    .line 57
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VoiceLiveGame;->voiceLiveId:Ljava/lang/String;

    .line 58
    .line 59
    if-eqz p0, :cond_7

    .line 60
    .line 61
    const/16 v0, 0x8

    .line 62
    .line 63
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 64
    .line 65
    .line 66
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VoiceLiveGame;->createdTime:Ljava/lang/String;

    .line 67
    .line 68
    if-eqz p0, :cond_8

    .line 69
    .line 70
    const/16 v0, 0x9

    .line 71
    .line 72
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 73
    .line 74
    .line 75
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VoiceLiveGame;->endTime:Ljava/lang/String;

    .line 76
    .line 77
    if-eqz p0, :cond_9

    .line 78
    .line 79
    const/16 v0, 0xa

    .line 80
    .line 81
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 82
    .line 83
    .line 84
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VoiceLiveGame;->currentChoice:Lcom/p1/mobile/putong/data/VoiceLiveGameCurrentChoice;

    .line 85
    .line 86
    if-eqz p0, :cond_a

    .line 87
    .line 88
    const/16 p1, 0xb

    .line 89
    .line 90
    sget-object v0, Lcom/p1/mobile/putong/data/VoiceLiveGameCurrentChoice;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 91
    .line 92
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 93
    .line 94
    .line 95
    :cond_a
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 96
    check-cast p1, Lcom/p1/mobile/putong/data/VoiceLiveGame;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/VoiceLiveGame$1;->serialize(Lcom/p1/mobile/putong/data/VoiceLiveGame;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
