.class Lcom/p1/mobile/putong/core/data/SpecialCard$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/SpecialCard;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/SpecialCard;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/SpecialCard;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/SpecialCard;->gender:Lcom/p1/mobile/putong/core/data/SpecialCardGender;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/SpecialCard;->device_OS:Lcom/p1/mobile/putong/core/data/DeviceType;

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    const/4 v1, 0x2

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
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/SpecialCard;->signup_country:Ljava/util/List;

    .line 31
    .line 32
    if-eqz v0, :cond_2

    .line 33
    .line 34
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->INT_BOXED_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 35
    .line 36
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    const/4 v2, 0x3

    .line 41
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    add-int/2addr p0, v0

    .line 46
    :cond_2
    const/4 v0, 0x4

    .line 47
    iget v1, p1, Lcom/p1/mobile/putong/core/data/SpecialCard;->actived_duration:I

    .line 48
    .line 49
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    add-int/2addr p0, v0

    .line 54
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/SpecialCard;->interval_day:Ljava/util/List;

    .line 55
    .line 56
    if-eqz v0, :cond_3

    .line 57
    .line 58
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->DOUBLE_BOXED_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 59
    .line 60
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    const/4 v2, 0x5

    .line 65
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    add-int/2addr p0, v0

    .line 70
    :cond_3
    const/4 v0, 0x6

    .line 71
    iget v1, p1, Lcom/p1/mobile/putong/core/data/SpecialCard;->interval_hour_cycle_mode:I

    .line 72
    .line 73
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    add-int/2addr p0, v0

    .line 78
    const/4 v0, 0x7

    .line 79
    iget v1, p1, Lcom/p1/mobile/putong/core/data/SpecialCard;->swipe_wright_time:I

    .line 80
    .line 81
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    add-int/2addr p0, v0

    .line 86
    const/16 v0, 0x8

    .line 87
    .line 88
    iget v1, p1, Lcom/p1/mobile/putong/core/data/SpecialCard;->num_limited_left:I

    .line 89
    .line 90
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    add-int/2addr p0, v0

    .line 95
    const/16 v0, 0x9

    .line 96
    .line 97
    iget v1, p1, Lcom/p1/mobile/putong/core/data/SpecialCard;->version:I

    .line 98
    .line 99
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    add-int/2addr p0, v0

    .line 104
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/SpecialCard;->gender:Lcom/p1/mobile/putong/core/data/SpecialCardGender;

    .line 105
    .line 106
    if-eqz v0, :cond_4

    .line 107
    .line 108
    const/16 v1, 0xa

    .line 109
    .line 110
    sget-object v2, Lcom/p1/mobile/putong/core/data/SpecialCardGender;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 111
    .line 112
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    add-int/2addr p0, v0

    .line 117
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/SpecialCard;->device_OS:Lcom/p1/mobile/putong/core/data/DeviceType;

    .line 118
    .line 119
    if-eqz v0, :cond_5

    .line 120
    .line 121
    const/16 v1, 0xb

    .line 122
    .line 123
    sget-object v2, Lcom/p1/mobile/putong/core/data/DeviceType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 124
    .line 125
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    add-int/2addr p0, v0

    .line 130
    :cond_5
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 131
    .line 132
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 133
    check-cast p1, Lcom/p1/mobile/putong/core/data/SpecialCard;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/SpecialCard$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/SpecialCard;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/SpecialCard;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/SpecialCard;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/SpecialCard;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    move-object v1, v0

    .line 8
    move-object v2, v1

    .line 9
    :goto_0
    invoke-virtual {p1}, Ll/nc5;->u()I

    .line 10
    .line 11
    .line 12
    move-result v3

    .line 13
    sparse-switch v3, :sswitch_data_0

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SpecialCard;->gender:Lcom/p1/mobile/putong/core/data/SpecialCardGender;

    .line 17
    .line 18
    if-nez p1, :cond_0

    .line 19
    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    sget-object p1, Lcom/p1/mobile/putong/core/data/SpecialCardGender;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    check-cast p1, Lcom/p1/mobile/putong/core/data/SpecialCardGender;

    .line 33
    .line 34
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/SpecialCard;->gender:Lcom/p1/mobile/putong/core/data/SpecialCardGender;

    .line 35
    .line 36
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SpecialCard;->device_OS:Lcom/p1/mobile/putong/core/data/DeviceType;

    .line 37
    .line 38
    if-nez p1, :cond_1

    .line 39
    .line 40
    if-eqz v2, :cond_1

    .line 41
    .line 42
    sget-object p1, Lcom/p1/mobile/putong/core/data/DeviceType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 43
    .line 44
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/DeviceType;

    .line 53
    .line 54
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/SpecialCard;->device_OS:Lcom/p1/mobile/putong/core/data/DeviceType;

    .line 55
    .line 56
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SpecialCard;->gender:Lcom/p1/mobile/putong/core/data/SpecialCardGender;

    .line 57
    .line 58
    if-nez p1, :cond_2

    .line 59
    .line 60
    sget-object p1, Lcom/p1/mobile/putong/core/data/SpecialCardGender;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 61
    .line 62
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    check-cast p1, Lcom/p1/mobile/putong/core/data/SpecialCardGender;

    .line 67
    .line 68
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/SpecialCard;->gender:Lcom/p1/mobile/putong/core/data/SpecialCardGender;

    .line 69
    .line 70
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SpecialCard;->device_OS:Lcom/p1/mobile/putong/core/data/DeviceType;

    .line 71
    .line 72
    if-nez p1, :cond_3

    .line 73
    .line 74
    sget-object p1, Lcom/p1/mobile/putong/core/data/DeviceType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 75
    .line 76
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    check-cast p1, Lcom/p1/mobile/putong/core/data/DeviceType;

    .line 81
    .line 82
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/SpecialCard;->device_OS:Lcom/p1/mobile/putong/core/data/DeviceType;

    .line 83
    .line 84
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SpecialCard;->signup_country:Ljava/util/List;

    .line 85
    .line 86
    if-nez p1, :cond_4

    .line 87
    .line 88
    new-instance p1, Ljava/util/ArrayList;

    .line 89
    .line 90
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 91
    .line 92
    .line 93
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/SpecialCard;->signup_country:Ljava/util/List;

    .line 94
    .line 95
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SpecialCard;->interval_day:Ljava/util/List;

    .line 96
    .line 97
    if-nez p1, :cond_a

    .line 98
    .line 99
    new-instance p1, Ljava/util/ArrayList;

    .line 100
    .line 101
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 102
    .line 103
    .line 104
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/SpecialCard;->interval_day:Ljava/util/List;

    .line 105
    .line 106
    return-object p0

    .line 107
    :sswitch_0
    sget-object v3, Lcom/p1/mobile/putong/core/data/DeviceType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 108
    .line 109
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    move-result-object v3

    .line 113
    check-cast v3, Lcom/p1/mobile/putong/core/data/DeviceType;

    .line 114
    .line 115
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/SpecialCard;->device_OS:Lcom/p1/mobile/putong/core/data/DeviceType;

    .line 116
    .line 117
    goto :goto_0

    .line 118
    :sswitch_1
    sget-object v3, Lcom/p1/mobile/putong/core/data/SpecialCardGender;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 119
    .line 120
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    move-result-object v3

    .line 124
    check-cast v3, Lcom/p1/mobile/putong/core/data/SpecialCardGender;

    .line 125
    .line 126
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/SpecialCard;->gender:Lcom/p1/mobile/putong/core/data/SpecialCardGender;

    .line 127
    .line 128
    goto :goto_0

    .line 129
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 130
    .line 131
    .line 132
    move-result v3

    .line 133
    iput v3, p0, Lcom/p1/mobile/putong/core/data/SpecialCard;->version:I

    .line 134
    .line 135
    goto :goto_0

    .line 136
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 137
    .line 138
    .line 139
    move-result v3

    .line 140
    iput v3, p0, Lcom/p1/mobile/putong/core/data/SpecialCard;->num_limited_left:I

    .line 141
    .line 142
    goto/16 :goto_0

    .line 143
    .line 144
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 145
    .line 146
    .line 147
    move-result v3

    .line 148
    iput v3, p0, Lcom/p1/mobile/putong/core/data/SpecialCard;->swipe_wright_time:I

    .line 149
    .line 150
    goto/16 :goto_0

    .line 151
    .line 152
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 153
    .line 154
    .line 155
    move-result v3

    .line 156
    iput v3, p0, Lcom/p1/mobile/putong/core/data/SpecialCard;->interval_hour_cycle_mode:I

    .line 157
    .line 158
    goto/16 :goto_0

    .line 159
    .line 160
    :sswitch_6
    sget-object v3, Lcom/tantanapp/common/data/ProtobufAdapter;->DOUBLE_BOXED_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 161
    .line 162
    invoke-virtual {v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 163
    .line 164
    .line 165
    move-result-object v3

    .line 166
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 167
    .line 168
    .line 169
    move-result-object v3

    .line 170
    check-cast v3, Ljava/util/List;

    .line 171
    .line 172
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/SpecialCard;->interval_day:Ljava/util/List;

    .line 173
    .line 174
    goto/16 :goto_0

    .line 175
    .line 176
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 177
    .line 178
    .line 179
    move-result v3

    .line 180
    iput v3, p0, Lcom/p1/mobile/putong/core/data/SpecialCard;->actived_duration:I

    .line 181
    .line 182
    goto/16 :goto_0

    .line 183
    .line 184
    :sswitch_8
    sget-object v3, Lcom/tantanapp/common/data/ProtobufAdapter;->INT_BOXED_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 185
    .line 186
    invoke-virtual {v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 187
    .line 188
    .line 189
    move-result-object v3

    .line 190
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 191
    .line 192
    .line 193
    move-result-object v3

    .line 194
    check-cast v3, Ljava/util/List;

    .line 195
    .line 196
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/SpecialCard;->signup_country:Ljava/util/List;

    .line 197
    .line 198
    goto/16 :goto_0

    .line 199
    .line 200
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 201
    .line 202
    .line 203
    move-result v2

    .line 204
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 205
    .line 206
    .line 207
    move-result-object v2

    .line 208
    goto/16 :goto_0

    .line 209
    .line 210
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 211
    .line 212
    .line 213
    move-result v1

    .line 214
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 215
    .line 216
    .line 217
    move-result-object v1

    .line 218
    goto/16 :goto_0

    .line 219
    .line 220
    :sswitch_b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SpecialCard;->gender:Lcom/p1/mobile/putong/core/data/SpecialCardGender;

    .line 221
    .line 222
    if-nez p1, :cond_5

    .line 223
    .line 224
    if-eqz v1, :cond_5

    .line 225
    .line 226
    sget-object p1, Lcom/p1/mobile/putong/core/data/SpecialCardGender;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 227
    .line 228
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 229
    .line 230
    .line 231
    move-result v1

    .line 232
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 233
    .line 234
    .line 235
    move-result-object p1

    .line 236
    check-cast p1, Lcom/p1/mobile/putong/core/data/SpecialCardGender;

    .line 237
    .line 238
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/SpecialCard;->gender:Lcom/p1/mobile/putong/core/data/SpecialCardGender;

    .line 239
    .line 240
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SpecialCard;->device_OS:Lcom/p1/mobile/putong/core/data/DeviceType;

    .line 241
    .line 242
    if-nez p1, :cond_6

    .line 243
    .line 244
    if-eqz v2, :cond_6

    .line 245
    .line 246
    sget-object p1, Lcom/p1/mobile/putong/core/data/DeviceType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 247
    .line 248
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 249
    .line 250
    .line 251
    move-result v1

    .line 252
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 253
    .line 254
    .line 255
    move-result-object p1

    .line 256
    check-cast p1, Lcom/p1/mobile/putong/core/data/DeviceType;

    .line 257
    .line 258
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/SpecialCard;->device_OS:Lcom/p1/mobile/putong/core/data/DeviceType;

    .line 259
    .line 260
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SpecialCard;->gender:Lcom/p1/mobile/putong/core/data/SpecialCardGender;

    .line 261
    .line 262
    if-nez p1, :cond_7

    .line 263
    .line 264
    sget-object p1, Lcom/p1/mobile/putong/core/data/SpecialCardGender;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 265
    .line 266
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 267
    .line 268
    .line 269
    move-result-object p1

    .line 270
    check-cast p1, Lcom/p1/mobile/putong/core/data/SpecialCardGender;

    .line 271
    .line 272
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/SpecialCard;->gender:Lcom/p1/mobile/putong/core/data/SpecialCardGender;

    .line 273
    .line 274
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SpecialCard;->device_OS:Lcom/p1/mobile/putong/core/data/DeviceType;

    .line 275
    .line 276
    if-nez p1, :cond_8

    .line 277
    .line 278
    sget-object p1, Lcom/p1/mobile/putong/core/data/DeviceType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 279
    .line 280
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 281
    .line 282
    .line 283
    move-result-object p1

    .line 284
    check-cast p1, Lcom/p1/mobile/putong/core/data/DeviceType;

    .line 285
    .line 286
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/SpecialCard;->device_OS:Lcom/p1/mobile/putong/core/data/DeviceType;

    .line 287
    .line 288
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SpecialCard;->signup_country:Ljava/util/List;

    .line 289
    .line 290
    if-nez p1, :cond_9

    .line 291
    .line 292
    new-instance p1, Ljava/util/ArrayList;

    .line 293
    .line 294
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 295
    .line 296
    .line 297
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/SpecialCard;->signup_country:Ljava/util/List;

    .line 298
    .line 299
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SpecialCard;->interval_day:Ljava/util/List;

    .line 300
    .line 301
    if-nez p1, :cond_a

    .line 302
    .line 303
    new-instance p1, Ljava/util/ArrayList;

    .line 304
    .line 305
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 306
    .line 307
    .line 308
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/SpecialCard;->interval_day:Ljava/util/List;

    .line 309
    .line 310
    :cond_a
    return-object p0

    .line 311
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_b
        0x8 -> :sswitch_a
        0x10 -> :sswitch_9
        0x1a -> :sswitch_8
        0x20 -> :sswitch_7
        0x2a -> :sswitch_6
        0x30 -> :sswitch_5
        0x38 -> :sswitch_4
        0x40 -> :sswitch_3
        0x48 -> :sswitch_2
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

    .line 311
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/SpecialCard$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/SpecialCard;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/SpecialCard;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/SpecialCard;->gender:Lcom/p1/mobile/putong/core/data/SpecialCardGender;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/SpecialCard;->device_OS:Lcom/p1/mobile/putong/core/data/DeviceType;

    .line 14
    .line 15
    if-eqz p0, :cond_1

    .line 16
    .line 17
    const/4 v0, 0x2

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
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/SpecialCard;->signup_country:Ljava/util/List;

    .line 26
    .line 27
    if-eqz p0, :cond_2

    .line 28
    .line 29
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->INT_BOXED_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 30
    .line 31
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const/4 v1, 0x3

    .line 36
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 37
    .line 38
    .line 39
    :cond_2
    const/4 p0, 0x4

    .line 40
    iget v0, p1, Lcom/p1/mobile/putong/core/data/SpecialCard;->actived_duration:I

    .line 41
    .line 42
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 43
    .line 44
    .line 45
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/SpecialCard;->interval_day:Ljava/util/List;

    .line 46
    .line 47
    if-eqz p0, :cond_3

    .line 48
    .line 49
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->DOUBLE_BOXED_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 50
    .line 51
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    const/4 v1, 0x5

    .line 56
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 57
    .line 58
    .line 59
    :cond_3
    const/4 p0, 0x6

    .line 60
    iget v0, p1, Lcom/p1/mobile/putong/core/data/SpecialCard;->interval_hour_cycle_mode:I

    .line 61
    .line 62
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 63
    .line 64
    .line 65
    const/4 p0, 0x7

    .line 66
    iget v0, p1, Lcom/p1/mobile/putong/core/data/SpecialCard;->swipe_wright_time:I

    .line 67
    .line 68
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 69
    .line 70
    .line 71
    const/16 p0, 0x8

    .line 72
    .line 73
    iget v0, p1, Lcom/p1/mobile/putong/core/data/SpecialCard;->num_limited_left:I

    .line 74
    .line 75
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 76
    .line 77
    .line 78
    const/16 p0, 0x9

    .line 79
    .line 80
    iget v0, p1, Lcom/p1/mobile/putong/core/data/SpecialCard;->version:I

    .line 81
    .line 82
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 83
    .line 84
    .line 85
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/SpecialCard;->gender:Lcom/p1/mobile/putong/core/data/SpecialCardGender;

    .line 86
    .line 87
    if-eqz p0, :cond_4

    .line 88
    .line 89
    const/16 v0, 0xa

    .line 90
    .line 91
    sget-object v1, Lcom/p1/mobile/putong/core/data/SpecialCardGender;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 92
    .line 93
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 94
    .line 95
    .line 96
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/SpecialCard;->device_OS:Lcom/p1/mobile/putong/core/data/DeviceType;

    .line 97
    .line 98
    if-eqz p0, :cond_5

    .line 99
    .line 100
    const/16 p1, 0xb

    .line 101
    .line 102
    sget-object v0, Lcom/p1/mobile/putong/core/data/DeviceType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 103
    .line 104
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 105
    .line 106
    .line 107
    :cond_5
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 108
    check-cast p1, Lcom/p1/mobile/putong/core/data/SpecialCard;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/SpecialCard$1;->serialize(Lcom/p1/mobile/putong/core/data/SpecialCard;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
