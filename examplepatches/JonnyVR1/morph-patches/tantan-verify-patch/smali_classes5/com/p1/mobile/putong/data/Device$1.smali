.class Lcom/p1/mobile/putong/data/Device$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/Device;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/Device;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/Device;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Device;->id:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Device;->pushNotifications:Lcom/p1/mobile/putong/data/DevicePush;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    const/4 v1, 0x2

    .line 17
    sget-object v2, Lcom/p1/mobile/putong/data/DevicePush;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 18
    .line 19
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    add-int/2addr p0, v0

    .line 24
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Device;->identifier:Ljava/lang/String;

    .line 25
    .line 26
    if-eqz v0, :cond_2

    .line 27
    .line 28
    const/4 v1, 0x3

    .line 29
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    add-int/2addr p0, v0

    .line 34
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Device;->identifiers:Ljava/util/List;

    .line 35
    .line 36
    if-eqz v0, :cond_3

    .line 37
    .line 38
    sget-object v1, Lcom/p1/mobile/putong/data/DeviceIdentifier;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 39
    .line 40
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    const/4 v2, 0x4

    .line 45
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    add-int/2addr p0, v0

    .line 50
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Device;->appVersion:Ljava/lang/String;

    .line 51
    .line 52
    if-eqz v0, :cond_4

    .line 53
    .line 54
    const/4 v1, 0x5

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Device;->appBuild:Ljava/lang/String;

    .line 61
    .line 62
    if-eqz v0, :cond_5

    .line 63
    .line 64
    const/4 v1, 0x6

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Device;->operatingSystem:Lcom/p1/mobile/putong/data/DeviceOs;

    .line 71
    .line 72
    if-eqz v0, :cond_6

    .line 73
    .line 74
    const/4 v1, 0x7

    .line 75
    sget-object v2, Lcom/p1/mobile/putong/data/DeviceOs;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 76
    .line 77
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    add-int/2addr p0, v0

    .line 82
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Device;->name:Ljava/lang/String;

    .line 83
    .line 84
    if-eqz v0, :cond_7

    .line 85
    .line 86
    const/16 v1, 0x8

    .line 87
    .line 88
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    add-int/2addr p0, v0

    .line 93
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Device;->language:Ljava/lang/String;

    .line 94
    .line 95
    if-eqz v0, :cond_8

    .line 96
    .line 97
    const/16 v1, 0x9

    .line 98
    .line 99
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    add-int/2addr p0, v0

    .line 104
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Device;->locale:Ljava/lang/String;

    .line 105
    .line 106
    if-eqz v0, :cond_9

    .line 107
    .line 108
    const/16 v1, 0xa

    .line 109
    .line 110
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    add-int/2addr p0, v0

    .line 115
    :cond_9
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Device;->devicePushNotifications:Ljava/util/List;

    .line 116
    .line 117
    if-eqz v0, :cond_a

    .line 118
    .line 119
    sget-object v1, Lcom/p1/mobile/putong/data/DevicePush;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 120
    .line 121
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 122
    .line 123
    .line 124
    move-result-object v1

    .line 125
    const/16 v2, 0xb

    .line 126
    .line 127
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 128
    .line 129
    .line 130
    move-result v0

    .line 131
    add-int/2addr p0, v0

    .line 132
    :cond_a
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Device;->appUIVersion:Ljava/lang/String;

    .line 133
    .line 134
    if-eqz v0, :cond_b

    .line 135
    .line 136
    const/16 v1, 0xc

    .line 137
    .line 138
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 139
    .line 140
    .line 141
    move-result v0

    .line 142
    add-int/2addr p0, v0

    .line 143
    :cond_b
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Device;->brand:Ljava/lang/String;

    .line 144
    .line 145
    if-eqz v0, :cond_c

    .line 146
    .line 147
    const/16 v1, 0xd

    .line 148
    .line 149
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 150
    .line 151
    .line 152
    move-result v0

    .line 153
    add-int/2addr p0, v0

    .line 154
    :cond_c
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Device;->oneid:Ljava/lang/String;

    .line 155
    .line 156
    if-eqz v0, :cond_d

    .line 157
    .line 158
    const/16 v1, 0xe

    .line 159
    .line 160
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 161
    .line 162
    .line 163
    move-result v0

    .line 164
    add-int/2addr p0, v0

    .line 165
    :cond_d
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Device;->pluginVersion:Ljava/util/Map;

    .line 166
    .line 167
    if-eqz v0, :cond_e

    .line 168
    .line 169
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 170
    .line 171
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->MAP_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 172
    .line 173
    .line 174
    move-result-object v1

    .line 175
    const/16 v2, 0xf

    .line 176
    .line 177
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 178
    .line 179
    .line 180
    move-result v0

    .line 181
    add-int/2addr p0, v0

    .line 182
    :cond_e
    const/16 v0, 0x10

    .line 183
    .line 184
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/Device;->created_time:D

    .line 185
    .line 186
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 187
    .line 188
    .line 189
    move-result v0

    .line 190
    add-int/2addr p0, v0

    .line 191
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Device;->bundleId:Ljava/lang/String;

    .line 192
    .line 193
    if-eqz v0, :cond_f

    .line 194
    .line 195
    const/16 v1, 0x11

    .line 196
    .line 197
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 198
    .line 199
    .line 200
    move-result v0

    .line 201
    add-int/2addr p0, v0

    .line 202
    :cond_f
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 203
    .line 204
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 205
    check-cast p1, Lcom/p1/mobile/putong/data/Device;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/Device$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/Device;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/Device;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/Device;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/Device;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Device;->id:Ljava/lang/String;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Device;->id:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Device;->pushNotifications:Lcom/p1/mobile/putong/data/DevicePush;

    .line 22
    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    invoke-static {}, Lcom/p1/mobile/putong/data/DevicePush;->new_()Lcom/p1/mobile/putong/data/DevicePush;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Device;->pushNotifications:Lcom/p1/mobile/putong/data/DevicePush;

    .line 30
    .line 31
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Device;->identifier:Ljava/lang/String;

    .line 32
    .line 33
    if-nez p1, :cond_2

    .line 34
    .line 35
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Device;->identifier:Ljava/lang/String;

    .line 36
    .line 37
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Device;->identifiers:Ljava/util/List;

    .line 38
    .line 39
    if-nez p1, :cond_3

    .line 40
    .line 41
    new-instance p1, Ljava/util/ArrayList;

    .line 42
    .line 43
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 44
    .line 45
    .line 46
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Device;->identifiers:Ljava/util/List;

    .line 47
    .line 48
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Device;->appVersion:Ljava/lang/String;

    .line 49
    .line 50
    if-nez p1, :cond_4

    .line 51
    .line 52
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Device;->appVersion:Ljava/lang/String;

    .line 53
    .line 54
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Device;->appBuild:Ljava/lang/String;

    .line 55
    .line 56
    if-nez p1, :cond_5

    .line 57
    .line 58
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Device;->appBuild:Ljava/lang/String;

    .line 59
    .line 60
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Device;->operatingSystem:Lcom/p1/mobile/putong/data/DeviceOs;

    .line 61
    .line 62
    if-nez p1, :cond_6

    .line 63
    .line 64
    invoke-static {}, Lcom/p1/mobile/putong/data/DeviceOs;->new_()Lcom/p1/mobile/putong/data/DeviceOs;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Device;->operatingSystem:Lcom/p1/mobile/putong/data/DeviceOs;

    .line 69
    .line 70
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Device;->name:Ljava/lang/String;

    .line 71
    .line 72
    if-nez p1, :cond_7

    .line 73
    .line 74
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Device;->name:Ljava/lang/String;

    .line 75
    .line 76
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Device;->language:Ljava/lang/String;

    .line 77
    .line 78
    if-nez p1, :cond_8

    .line 79
    .line 80
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Device;->language:Ljava/lang/String;

    .line 81
    .line 82
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Device;->locale:Ljava/lang/String;

    .line 83
    .line 84
    if-nez p1, :cond_9

    .line 85
    .line 86
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Device;->locale:Ljava/lang/String;

    .line 87
    .line 88
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Device;->devicePushNotifications:Ljava/util/List;

    .line 89
    .line 90
    if-nez p1, :cond_a

    .line 91
    .line 92
    new-instance p1, Ljava/util/ArrayList;

    .line 93
    .line 94
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 95
    .line 96
    .line 97
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Device;->devicePushNotifications:Ljava/util/List;

    .line 98
    .line 99
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Device;->appUIVersion:Ljava/lang/String;

    .line 100
    .line 101
    if-nez p1, :cond_b

    .line 102
    .line 103
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Device;->appUIVersion:Ljava/lang/String;

    .line 104
    .line 105
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Device;->brand:Ljava/lang/String;

    .line 106
    .line 107
    if-nez p1, :cond_c

    .line 108
    .line 109
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Device;->brand:Ljava/lang/String;

    .line 110
    .line 111
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Device;->oneid:Ljava/lang/String;

    .line 112
    .line 113
    if-nez p1, :cond_d

    .line 114
    .line 115
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Device;->oneid:Ljava/lang/String;

    .line 116
    .line 117
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Device;->pluginVersion:Ljava/util/Map;

    .line 118
    .line 119
    if-nez p1, :cond_e

    .line 120
    .line 121
    sget-object p1, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    .line 122
    .line 123
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Device;->pluginVersion:Ljava/util/Map;

    .line 124
    .line 125
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Device;->bundleId:Ljava/lang/String;

    .line 126
    .line 127
    if-nez p1, :cond_1e

    .line 128
    .line 129
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Device;->bundleId:Ljava/lang/String;

    .line 130
    .line 131
    return-object p0

    .line 132
    :sswitch_0
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Device;->bundleId:Ljava/lang/String;

    .line 137
    .line 138
    goto/16 :goto_0

    .line 139
    .line 140
    :sswitch_1
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 141
    .line 142
    .line 143
    move-result-wide v0

    .line 144
    iput-wide v0, p0, Lcom/p1/mobile/putong/data/Device;->created_time:D

    .line 145
    .line 146
    goto/16 :goto_0

    .line 147
    .line 148
    :sswitch_2
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 149
    .line 150
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->MAP_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    check-cast v0, Ljava/util/Map;

    .line 159
    .line 160
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Device;->pluginVersion:Ljava/util/Map;

    .line 161
    .line 162
    goto/16 :goto_0

    .line 163
    .line 164
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Device;->oneid:Ljava/lang/String;

    .line 169
    .line 170
    goto/16 :goto_0

    .line 171
    .line 172
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object v0

    .line 176
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Device;->brand:Ljava/lang/String;

    .line 177
    .line 178
    goto/16 :goto_0

    .line 179
    .line 180
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object v0

    .line 184
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Device;->appUIVersion:Ljava/lang/String;

    .line 185
    .line 186
    goto/16 :goto_0

    .line 187
    .line 188
    :sswitch_6
    sget-object v0, Lcom/p1/mobile/putong/data/DevicePush;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 189
    .line 190
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 191
    .line 192
    .line 193
    move-result-object v0

    .line 194
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 195
    .line 196
    .line 197
    move-result-object v0

    .line 198
    check-cast v0, Ljava/util/List;

    .line 199
    .line 200
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Device;->devicePushNotifications:Ljava/util/List;

    .line 201
    .line 202
    goto/16 :goto_0

    .line 203
    .line 204
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 205
    .line 206
    .line 207
    move-result-object v0

    .line 208
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Device;->locale:Ljava/lang/String;

    .line 209
    .line 210
    goto/16 :goto_0

    .line 211
    .line 212
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 213
    .line 214
    .line 215
    move-result-object v0

    .line 216
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Device;->language:Ljava/lang/String;

    .line 217
    .line 218
    goto/16 :goto_0

    .line 219
    .line 220
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 221
    .line 222
    .line 223
    move-result-object v0

    .line 224
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Device;->name:Ljava/lang/String;

    .line 225
    .line 226
    goto/16 :goto_0

    .line 227
    .line 228
    :sswitch_a
    sget-object v0, Lcom/p1/mobile/putong/data/DeviceOs;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 229
    .line 230
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 231
    .line 232
    .line 233
    move-result-object v0

    .line 234
    check-cast v0, Lcom/p1/mobile/putong/data/DeviceOs;

    .line 235
    .line 236
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Device;->operatingSystem:Lcom/p1/mobile/putong/data/DeviceOs;

    .line 237
    .line 238
    goto/16 :goto_0

    .line 239
    .line 240
    :sswitch_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 241
    .line 242
    .line 243
    move-result-object v0

    .line 244
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Device;->appBuild:Ljava/lang/String;

    .line 245
    .line 246
    goto/16 :goto_0

    .line 247
    .line 248
    :sswitch_c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 249
    .line 250
    .line 251
    move-result-object v0

    .line 252
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Device;->appVersion:Ljava/lang/String;

    .line 253
    .line 254
    goto/16 :goto_0

    .line 255
    .line 256
    :sswitch_d
    sget-object v0, Lcom/p1/mobile/putong/data/DeviceIdentifier;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 257
    .line 258
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 259
    .line 260
    .line 261
    move-result-object v0

    .line 262
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 263
    .line 264
    .line 265
    move-result-object v0

    .line 266
    check-cast v0, Ljava/util/List;

    .line 267
    .line 268
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Device;->identifiers:Ljava/util/List;

    .line 269
    .line 270
    goto/16 :goto_0

    .line 271
    .line 272
    :sswitch_e
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 273
    .line 274
    .line 275
    move-result-object v0

    .line 276
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Device;->identifier:Ljava/lang/String;

    .line 277
    .line 278
    goto/16 :goto_0

    .line 279
    .line 280
    :sswitch_f
    sget-object v0, Lcom/p1/mobile/putong/data/DevicePush;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 281
    .line 282
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 283
    .line 284
    .line 285
    move-result-object v0

    .line 286
    check-cast v0, Lcom/p1/mobile/putong/data/DevicePush;

    .line 287
    .line 288
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Device;->pushNotifications:Lcom/p1/mobile/putong/data/DevicePush;

    .line 289
    .line 290
    goto/16 :goto_0

    .line 291
    .line 292
    :sswitch_10
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 293
    .line 294
    .line 295
    move-result-object v0

    .line 296
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Device;->id:Ljava/lang/String;

    .line 297
    .line 298
    goto/16 :goto_0

    .line 299
    .line 300
    :sswitch_11
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Device;->id:Ljava/lang/String;

    .line 301
    .line 302
    if-nez p1, :cond_f

    .line 303
    .line 304
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Device;->id:Ljava/lang/String;

    .line 305
    .line 306
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Device;->pushNotifications:Lcom/p1/mobile/putong/data/DevicePush;

    .line 307
    .line 308
    if-nez p1, :cond_10

    .line 309
    .line 310
    invoke-static {}, Lcom/p1/mobile/putong/data/DevicePush;->new_()Lcom/p1/mobile/putong/data/DevicePush;

    .line 311
    .line 312
    .line 313
    move-result-object p1

    .line 314
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Device;->pushNotifications:Lcom/p1/mobile/putong/data/DevicePush;

    .line 315
    .line 316
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Device;->identifier:Ljava/lang/String;

    .line 317
    .line 318
    if-nez p1, :cond_11

    .line 319
    .line 320
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Device;->identifier:Ljava/lang/String;

    .line 321
    .line 322
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Device;->identifiers:Ljava/util/List;

    .line 323
    .line 324
    if-nez p1, :cond_12

    .line 325
    .line 326
    new-instance p1, Ljava/util/ArrayList;

    .line 327
    .line 328
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 329
    .line 330
    .line 331
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Device;->identifiers:Ljava/util/List;

    .line 332
    .line 333
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Device;->appVersion:Ljava/lang/String;

    .line 334
    .line 335
    if-nez p1, :cond_13

    .line 336
    .line 337
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Device;->appVersion:Ljava/lang/String;

    .line 338
    .line 339
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Device;->appBuild:Ljava/lang/String;

    .line 340
    .line 341
    if-nez p1, :cond_14

    .line 342
    .line 343
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Device;->appBuild:Ljava/lang/String;

    .line 344
    .line 345
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Device;->operatingSystem:Lcom/p1/mobile/putong/data/DeviceOs;

    .line 346
    .line 347
    if-nez p1, :cond_15

    .line 348
    .line 349
    invoke-static {}, Lcom/p1/mobile/putong/data/DeviceOs;->new_()Lcom/p1/mobile/putong/data/DeviceOs;

    .line 350
    .line 351
    .line 352
    move-result-object p1

    .line 353
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Device;->operatingSystem:Lcom/p1/mobile/putong/data/DeviceOs;

    .line 354
    .line 355
    :cond_15
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Device;->name:Ljava/lang/String;

    .line 356
    .line 357
    if-nez p1, :cond_16

    .line 358
    .line 359
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Device;->name:Ljava/lang/String;

    .line 360
    .line 361
    :cond_16
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Device;->language:Ljava/lang/String;

    .line 362
    .line 363
    if-nez p1, :cond_17

    .line 364
    .line 365
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Device;->language:Ljava/lang/String;

    .line 366
    .line 367
    :cond_17
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Device;->locale:Ljava/lang/String;

    .line 368
    .line 369
    if-nez p1, :cond_18

    .line 370
    .line 371
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Device;->locale:Ljava/lang/String;

    .line 372
    .line 373
    :cond_18
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Device;->devicePushNotifications:Ljava/util/List;

    .line 374
    .line 375
    if-nez p1, :cond_19

    .line 376
    .line 377
    new-instance p1, Ljava/util/ArrayList;

    .line 378
    .line 379
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 380
    .line 381
    .line 382
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Device;->devicePushNotifications:Ljava/util/List;

    .line 383
    .line 384
    :cond_19
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Device;->appUIVersion:Ljava/lang/String;

    .line 385
    .line 386
    if-nez p1, :cond_1a

    .line 387
    .line 388
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Device;->appUIVersion:Ljava/lang/String;

    .line 389
    .line 390
    :cond_1a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Device;->brand:Ljava/lang/String;

    .line 391
    .line 392
    if-nez p1, :cond_1b

    .line 393
    .line 394
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Device;->brand:Ljava/lang/String;

    .line 395
    .line 396
    :cond_1b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Device;->oneid:Ljava/lang/String;

    .line 397
    .line 398
    if-nez p1, :cond_1c

    .line 399
    .line 400
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Device;->oneid:Ljava/lang/String;

    .line 401
    .line 402
    :cond_1c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Device;->pluginVersion:Ljava/util/Map;

    .line 403
    .line 404
    if-nez p1, :cond_1d

    .line 405
    .line 406
    sget-object p1, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    .line 407
    .line 408
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Device;->pluginVersion:Ljava/util/Map;

    .line 409
    .line 410
    :cond_1d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Device;->bundleId:Ljava/lang/String;

    .line 411
    .line 412
    if-nez p1, :cond_1e

    .line 413
    .line 414
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Device;->bundleId:Ljava/lang/String;

    .line 415
    .line 416
    :cond_1e
    return-object p0

    .line 417
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_11
        0xa -> :sswitch_10
        0x12 -> :sswitch_f
        0x1a -> :sswitch_e
        0x22 -> :sswitch_d
        0x2a -> :sswitch_c
        0x32 -> :sswitch_b
        0x3a -> :sswitch_a
        0x42 -> :sswitch_9
        0x4a -> :sswitch_8
        0x52 -> :sswitch_7
        0x5a -> :sswitch_6
        0x62 -> :sswitch_5
        0x6a -> :sswitch_4
        0x72 -> :sswitch_3
        0x7a -> :sswitch_2
        0x81 -> :sswitch_1
        0x8a -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 417
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/Device$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/Device;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/Device;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Device;->id:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Device;->pushNotifications:Lcom/p1/mobile/putong/data/DevicePush;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    const/4 v0, 0x2

    .line 14
    sget-object v1, Lcom/p1/mobile/putong/data/DevicePush;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 15
    .line 16
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Device;->identifier:Ljava/lang/String;

    .line 20
    .line 21
    if-eqz p0, :cond_2

    .line 22
    .line 23
    const/4 v0, 0x3

    .line 24
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 25
    .line 26
    .line 27
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Device;->identifiers:Ljava/util/List;

    .line 28
    .line 29
    if-eqz p0, :cond_3

    .line 30
    .line 31
    sget-object v0, Lcom/p1/mobile/putong/data/DeviceIdentifier;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const/4 v1, 0x4

    .line 38
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 39
    .line 40
    .line 41
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Device;->appVersion:Ljava/lang/String;

    .line 42
    .line 43
    if-eqz p0, :cond_4

    .line 44
    .line 45
    const/4 v0, 0x5

    .line 46
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 47
    .line 48
    .line 49
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Device;->appBuild:Ljava/lang/String;

    .line 50
    .line 51
    if-eqz p0, :cond_5

    .line 52
    .line 53
    const/4 v0, 0x6

    .line 54
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 55
    .line 56
    .line 57
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Device;->operatingSystem:Lcom/p1/mobile/putong/data/DeviceOs;

    .line 58
    .line 59
    if-eqz p0, :cond_6

    .line 60
    .line 61
    const/4 v0, 0x7

    .line 62
    sget-object v1, Lcom/p1/mobile/putong/data/DeviceOs;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 63
    .line 64
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 65
    .line 66
    .line 67
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Device;->name:Ljava/lang/String;

    .line 68
    .line 69
    if-eqz p0, :cond_7

    .line 70
    .line 71
    const/16 v0, 0x8

    .line 72
    .line 73
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 74
    .line 75
    .line 76
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Device;->language:Ljava/lang/String;

    .line 77
    .line 78
    if-eqz p0, :cond_8

    .line 79
    .line 80
    const/16 v0, 0x9

    .line 81
    .line 82
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 83
    .line 84
    .line 85
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Device;->locale:Ljava/lang/String;

    .line 86
    .line 87
    if-eqz p0, :cond_9

    .line 88
    .line 89
    const/16 v0, 0xa

    .line 90
    .line 91
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 92
    .line 93
    .line 94
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Device;->devicePushNotifications:Ljava/util/List;

    .line 95
    .line 96
    if-eqz p0, :cond_a

    .line 97
    .line 98
    sget-object v0, Lcom/p1/mobile/putong/data/DevicePush;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 99
    .line 100
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    const/16 v1, 0xb

    .line 105
    .line 106
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 107
    .line 108
    .line 109
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Device;->appUIVersion:Ljava/lang/String;

    .line 110
    .line 111
    if-eqz p0, :cond_b

    .line 112
    .line 113
    const/16 v0, 0xc

    .line 114
    .line 115
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 116
    .line 117
    .line 118
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Device;->brand:Ljava/lang/String;

    .line 119
    .line 120
    if-eqz p0, :cond_c

    .line 121
    .line 122
    const/16 v0, 0xd

    .line 123
    .line 124
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 125
    .line 126
    .line 127
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Device;->oneid:Ljava/lang/String;

    .line 128
    .line 129
    if-eqz p0, :cond_d

    .line 130
    .line 131
    const/16 v0, 0xe

    .line 132
    .line 133
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 134
    .line 135
    .line 136
    :cond_d
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Device;->pluginVersion:Ljava/util/Map;

    .line 137
    .line 138
    if-eqz p0, :cond_e

    .line 139
    .line 140
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 141
    .line 142
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->MAP_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    const/16 v1, 0xf

    .line 147
    .line 148
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 149
    .line 150
    .line 151
    :cond_e
    const/16 p0, 0x10

    .line 152
    .line 153
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/Device;->created_time:D

    .line 154
    .line 155
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 156
    .line 157
    .line 158
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Device;->bundleId:Ljava/lang/String;

    .line 159
    .line 160
    if-eqz p0, :cond_f

    .line 161
    .line 162
    const/16 p1, 0x11

    .line 163
    .line 164
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 165
    .line 166
    .line 167
    :cond_f
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 168
    check-cast p1, Lcom/p1/mobile/putong/data/Device;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/Device$1;->serialize(Lcom/p1/mobile/putong/data/Device;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
