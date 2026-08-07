.class Lcom/p1/mobile/putong/core/data/AdvancedSettings$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/AdvancedSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/AdvancedSettings;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/AdvancedSettings;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->id:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->online:Ljava/lang/Boolean;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    const/4 v1, 0x2

    .line 17
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    add-int/2addr p0, v0

    .line 26
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->realFace:Ljava/lang/Boolean;

    .line 27
    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    const/4 v1, 0x3

    .line 31
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    add-int/2addr p0, v0

    .line 40
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->active:Ljava/lang/Boolean;

    .line 41
    .line 42
    if-eqz v0, :cond_3

    .line 43
    .line 44
    const/4 v1, 0x4

    .line 45
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    add-int/2addr p0, v0

    .line 54
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->newUser:Ljava/lang/Boolean;

    .line 55
    .line 56
    if-eqz v0, :cond_4

    .line 57
    .line 58
    const/4 v1, 0x5

    .line 59
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    add-int/2addr p0, v0

    .line 68
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->popular:Ljava/lang/Boolean;

    .line 69
    .line 70
    if-eqz v0, :cond_5

    .line 71
    .line 72
    const/4 v1, 0x6

    .line 73
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    add-int/2addr p0, v0

    .line 82
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->zodiacs:Ljava/util/List;

    .line 83
    .line 84
    if-eqz v0, :cond_6

    .line 85
    .line 86
    invoke-static {v0}, Lcom/p1/mobile/putong/data/ProfileZodiac;->covertToOldEnumList(Ljava/util/List;)Ljava/util/List;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    sget-object v1, Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;

    .line 91
    .line 92
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    const/4 v2, 0x7

    .line 97
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    add-int/2addr p0, v0

    .line 102
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->student:Ljava/lang/Boolean;

    .line 103
    .line 104
    if-eqz v0, :cond_7

    .line 105
    .line 106
    const/16 v1, 0x8

    .line 107
    .line 108
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    add-int/2addr p0, v0

    .line 117
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->filterReportUser:Ljava/lang/Boolean;

    .line 118
    .line 119
    if-eqz v0, :cond_8

    .line 120
    .line 121
    const/16 v1, 0x9

    .line 122
    .line 123
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 124
    .line 125
    .line 126
    move-result v0

    .line 127
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 128
    .line 129
    .line 130
    move-result v0

    .line 131
    add-int/2addr p0, v0

    .line 132
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->bloodType:Ljava/util/List;

    .line 133
    .line 134
    if-eqz v0, :cond_9

    .line 135
    .line 136
    invoke-static {v0}, Lcom/p1/mobile/putong/data/BloodType;->covertToOldEnumList(Ljava/util/List;)Ljava/util/List;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    sget-object v1, Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;

    .line 141
    .line 142
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 143
    .line 144
    .line 145
    move-result-object v1

    .line 146
    const/16 v2, 0xa

    .line 147
    .line 148
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 149
    .line 150
    .line 151
    move-result v0

    .line 152
    add-int/2addr p0, v0

    .line 153
    :cond_9
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->zodiacs:Ljava/util/List;

    .line 154
    .line 155
    if-eqz v0, :cond_a

    .line 156
    .line 157
    sget-object v1, Lcom/p1/mobile/putong/data/ProfileZodiac;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 158
    .line 159
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 160
    .line 161
    .line 162
    move-result-object v1

    .line 163
    const/16 v2, 0xb

    .line 164
    .line 165
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 166
    .line 167
    .line 168
    move-result v0

    .line 169
    add-int/2addr p0, v0

    .line 170
    :cond_a
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->bloodType:Ljava/util/List;

    .line 171
    .line 172
    if-eqz v0, :cond_b

    .line 173
    .line 174
    sget-object v1, Lcom/p1/mobile/putong/data/BloodType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 175
    .line 176
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 177
    .line 178
    .line 179
    move-result-object v1

    .line 180
    const/16 v2, 0xc

    .line 181
    .line 182
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 183
    .line 184
    .line 185
    move-result v0

    .line 186
    add-int/2addr p0, v0

    .line 187
    :cond_b
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->intlFriendPurpose:Ljava/lang/String;

    .line 188
    .line 189
    if-eqz v0, :cond_c

    .line 190
    .line 191
    const/16 v1, 0xd

    .line 192
    .line 193
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 194
    .line 195
    .line 196
    move-result v0

    .line 197
    add-int/2addr p0, v0

    .line 198
    :cond_c
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 199
    .line 200
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 201
    check-cast p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/AdvancedSettings$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/AdvancedSettings;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/AdvancedSettings;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/AdvancedSettings;-><init>()V

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
    sparse-switch v2, :sswitch_data_0

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->zodiacs:Ljava/util/List;

    .line 18
    .line 19
    if-nez p1, :cond_0

    .line 20
    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-static {v0}, Lcom/p1/mobile/putong/data/ProfileZodiac;->oldEnumCovertList(Ljava/util/List;)Ljava/util/List;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->zodiacs:Ljava/util/List;

    .line 28
    .line 29
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->bloodType:Ljava/util/List;

    .line 30
    .line 31
    if-nez p1, :cond_1

    .line 32
    .line 33
    if-eqz v1, :cond_1

    .line 34
    .line 35
    invoke-static {v1}, Lcom/p1/mobile/putong/data/BloodType;->oldEnumCovertList(Ljava/util/List;)Ljava/util/List;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->bloodType:Ljava/util/List;

    .line 40
    .line 41
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->id:Ljava/lang/String;

    .line 42
    .line 43
    if-nez p1, :cond_2

    .line 44
    .line 45
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->id:Ljava/lang/String;

    .line 46
    .line 47
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->online:Ljava/lang/Boolean;

    .line 48
    .line 49
    if-nez p1, :cond_3

    .line 50
    .line 51
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 52
    .line 53
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->online:Ljava/lang/Boolean;

    .line 54
    .line 55
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->realFace:Ljava/lang/Boolean;

    .line 56
    .line 57
    if-nez p1, :cond_4

    .line 58
    .line 59
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 60
    .line 61
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->realFace:Ljava/lang/Boolean;

    .line 62
    .line 63
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->active:Ljava/lang/Boolean;

    .line 64
    .line 65
    if-nez p1, :cond_5

    .line 66
    .line 67
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 68
    .line 69
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->active:Ljava/lang/Boolean;

    .line 70
    .line 71
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->newUser:Ljava/lang/Boolean;

    .line 72
    .line 73
    if-nez p1, :cond_6

    .line 74
    .line 75
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 76
    .line 77
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->newUser:Ljava/lang/Boolean;

    .line 78
    .line 79
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->popular:Ljava/lang/Boolean;

    .line 80
    .line 81
    if-nez p1, :cond_7

    .line 82
    .line 83
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 84
    .line 85
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->popular:Ljava/lang/Boolean;

    .line 86
    .line 87
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->zodiacs:Ljava/util/List;

    .line 88
    .line 89
    if-nez p1, :cond_8

    .line 90
    .line 91
    new-instance p1, Ljava/util/ArrayList;

    .line 92
    .line 93
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 94
    .line 95
    .line 96
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->zodiacs:Ljava/util/List;

    .line 97
    .line 98
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->student:Ljava/lang/Boolean;

    .line 99
    .line 100
    if-nez p1, :cond_9

    .line 101
    .line 102
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 103
    .line 104
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->student:Ljava/lang/Boolean;

    .line 105
    .line 106
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->filterReportUser:Ljava/lang/Boolean;

    .line 107
    .line 108
    if-nez p1, :cond_a

    .line 109
    .line 110
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 111
    .line 112
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->filterReportUser:Ljava/lang/Boolean;

    .line 113
    .line 114
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->bloodType:Ljava/util/List;

    .line 115
    .line 116
    if-nez p1, :cond_b

    .line 117
    .line 118
    new-instance p1, Ljava/util/ArrayList;

    .line 119
    .line 120
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 121
    .line 122
    .line 123
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->bloodType:Ljava/util/List;

    .line 124
    .line 125
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->intlFriendPurpose:Ljava/lang/String;

    .line 126
    .line 127
    if-nez p1, :cond_18

    .line 128
    .line 129
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->intlFriendPurpose:Ljava/lang/String;

    .line 130
    .line 131
    return-object p0

    .line 132
    :sswitch_0
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v2

    .line 136
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->intlFriendPurpose:Ljava/lang/String;

    .line 137
    .line 138
    goto/16 :goto_0

    .line 139
    .line 140
    :sswitch_1
    sget-object v2, Lcom/p1/mobile/putong/data/BloodType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 141
    .line 142
    invoke-virtual {v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 143
    .line 144
    .line 145
    move-result-object v2

    .line 146
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 147
    .line 148
    .line 149
    move-result-object v2

    .line 150
    check-cast v2, Ljava/util/List;

    .line 151
    .line 152
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->bloodType:Ljava/util/List;

    .line 153
    .line 154
    goto/16 :goto_0

    .line 155
    .line 156
    :sswitch_2
    sget-object v2, Lcom/p1/mobile/putong/data/ProfileZodiac;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 157
    .line 158
    invoke-virtual {v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 159
    .line 160
    .line 161
    move-result-object v2

    .line 162
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 163
    .line 164
    .line 165
    move-result-object v2

    .line 166
    check-cast v2, Ljava/util/List;

    .line 167
    .line 168
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->zodiacs:Ljava/util/List;

    .line 169
    .line 170
    goto/16 :goto_0

    .line 171
    .line 172
    :sswitch_3
    sget-object v1, Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;

    .line 173
    .line 174
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 175
    .line 176
    .line 177
    move-result-object v1

    .line 178
    invoke-virtual {p1, v1}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 179
    .line 180
    .line 181
    move-result-object v1

    .line 182
    check-cast v1, Ljava/util/List;

    .line 183
    .line 184
    goto/16 :goto_0

    .line 185
    .line 186
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 187
    .line 188
    .line 189
    move-result v2

    .line 190
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 191
    .line 192
    .line 193
    move-result-object v2

    .line 194
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->filterReportUser:Ljava/lang/Boolean;

    .line 195
    .line 196
    goto/16 :goto_0

    .line 197
    .line 198
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 199
    .line 200
    .line 201
    move-result v2

    .line 202
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 203
    .line 204
    .line 205
    move-result-object v2

    .line 206
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->student:Ljava/lang/Boolean;

    .line 207
    .line 208
    goto/16 :goto_0

    .line 209
    .line 210
    :sswitch_6
    sget-object v0, Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;

    .line 211
    .line 212
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 213
    .line 214
    .line 215
    move-result-object v0

    .line 216
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 217
    .line 218
    .line 219
    move-result-object v0

    .line 220
    check-cast v0, Ljava/util/List;

    .line 221
    .line 222
    goto/16 :goto_0

    .line 223
    .line 224
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 225
    .line 226
    .line 227
    move-result v2

    .line 228
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 229
    .line 230
    .line 231
    move-result-object v2

    .line 232
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->popular:Ljava/lang/Boolean;

    .line 233
    .line 234
    goto/16 :goto_0

    .line 235
    .line 236
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 237
    .line 238
    .line 239
    move-result v2

    .line 240
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 241
    .line 242
    .line 243
    move-result-object v2

    .line 244
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->newUser:Ljava/lang/Boolean;

    .line 245
    .line 246
    goto/16 :goto_0

    .line 247
    .line 248
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 249
    .line 250
    .line 251
    move-result v2

    .line 252
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 253
    .line 254
    .line 255
    move-result-object v2

    .line 256
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->active:Ljava/lang/Boolean;

    .line 257
    .line 258
    goto/16 :goto_0

    .line 259
    .line 260
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 261
    .line 262
    .line 263
    move-result v2

    .line 264
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 265
    .line 266
    .line 267
    move-result-object v2

    .line 268
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->realFace:Ljava/lang/Boolean;

    .line 269
    .line 270
    goto/16 :goto_0

    .line 271
    .line 272
    :sswitch_b
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 273
    .line 274
    .line 275
    move-result v2

    .line 276
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 277
    .line 278
    .line 279
    move-result-object v2

    .line 280
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->online:Ljava/lang/Boolean;

    .line 281
    .line 282
    goto/16 :goto_0

    .line 283
    .line 284
    :sswitch_c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 285
    .line 286
    .line 287
    move-result-object v2

    .line 288
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->id:Ljava/lang/String;

    .line 289
    .line 290
    goto/16 :goto_0

    .line 291
    .line 292
    :sswitch_d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->zodiacs:Ljava/util/List;

    .line 293
    .line 294
    if-nez p1, :cond_c

    .line 295
    .line 296
    if-eqz v0, :cond_c

    .line 297
    .line 298
    invoke-static {v0}, Lcom/p1/mobile/putong/data/ProfileZodiac;->oldEnumCovertList(Ljava/util/List;)Ljava/util/List;

    .line 299
    .line 300
    .line 301
    move-result-object p1

    .line 302
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->zodiacs:Ljava/util/List;

    .line 303
    .line 304
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->bloodType:Ljava/util/List;

    .line 305
    .line 306
    if-nez p1, :cond_d

    .line 307
    .line 308
    if-eqz v1, :cond_d

    .line 309
    .line 310
    invoke-static {v1}, Lcom/p1/mobile/putong/data/BloodType;->oldEnumCovertList(Ljava/util/List;)Ljava/util/List;

    .line 311
    .line 312
    .line 313
    move-result-object p1

    .line 314
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->bloodType:Ljava/util/List;

    .line 315
    .line 316
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->id:Ljava/lang/String;

    .line 317
    .line 318
    if-nez p1, :cond_e

    .line 319
    .line 320
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->id:Ljava/lang/String;

    .line 321
    .line 322
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->online:Ljava/lang/Boolean;

    .line 323
    .line 324
    if-nez p1, :cond_f

    .line 325
    .line 326
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 327
    .line 328
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->online:Ljava/lang/Boolean;

    .line 329
    .line 330
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->realFace:Ljava/lang/Boolean;

    .line 331
    .line 332
    if-nez p1, :cond_10

    .line 333
    .line 334
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 335
    .line 336
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->realFace:Ljava/lang/Boolean;

    .line 337
    .line 338
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->active:Ljava/lang/Boolean;

    .line 339
    .line 340
    if-nez p1, :cond_11

    .line 341
    .line 342
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 343
    .line 344
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->active:Ljava/lang/Boolean;

    .line 345
    .line 346
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->newUser:Ljava/lang/Boolean;

    .line 347
    .line 348
    if-nez p1, :cond_12

    .line 349
    .line 350
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 351
    .line 352
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->newUser:Ljava/lang/Boolean;

    .line 353
    .line 354
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->popular:Ljava/lang/Boolean;

    .line 355
    .line 356
    if-nez p1, :cond_13

    .line 357
    .line 358
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 359
    .line 360
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->popular:Ljava/lang/Boolean;

    .line 361
    .line 362
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->zodiacs:Ljava/util/List;

    .line 363
    .line 364
    if-nez p1, :cond_14

    .line 365
    .line 366
    new-instance p1, Ljava/util/ArrayList;

    .line 367
    .line 368
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 369
    .line 370
    .line 371
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->zodiacs:Ljava/util/List;

    .line 372
    .line 373
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->student:Ljava/lang/Boolean;

    .line 374
    .line 375
    if-nez p1, :cond_15

    .line 376
    .line 377
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 378
    .line 379
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->student:Ljava/lang/Boolean;

    .line 380
    .line 381
    :cond_15
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->filterReportUser:Ljava/lang/Boolean;

    .line 382
    .line 383
    if-nez p1, :cond_16

    .line 384
    .line 385
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 386
    .line 387
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->filterReportUser:Ljava/lang/Boolean;

    .line 388
    .line 389
    :cond_16
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->bloodType:Ljava/util/List;

    .line 390
    .line 391
    if-nez p1, :cond_17

    .line 392
    .line 393
    new-instance p1, Ljava/util/ArrayList;

    .line 394
    .line 395
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 396
    .line 397
    .line 398
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->bloodType:Ljava/util/List;

    .line 399
    .line 400
    :cond_17
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->intlFriendPurpose:Ljava/lang/String;

    .line 401
    .line 402
    if-nez p1, :cond_18

    .line 403
    .line 404
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->intlFriendPurpose:Ljava/lang/String;

    .line 405
    .line 406
    :cond_18
    return-object p0

    .line 407
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_d
        0xa -> :sswitch_c
        0x10 -> :sswitch_b
        0x18 -> :sswitch_a
        0x20 -> :sswitch_9
        0x28 -> :sswitch_8
        0x30 -> :sswitch_7
        0x3a -> :sswitch_6
        0x40 -> :sswitch_5
        0x48 -> :sswitch_4
        0x52 -> :sswitch_3
        0x5a -> :sswitch_2
        0x62 -> :sswitch_1
        0x6a -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 407
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/AdvancedSettings$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/AdvancedSettings;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/AdvancedSettings;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->id:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->online:Ljava/lang/Boolean;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    const/4 v0, 0x2

    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 19
    .line 20
    .line 21
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->realFace:Ljava/lang/Boolean;

    .line 22
    .line 23
    if-eqz p0, :cond_2

    .line 24
    .line 25
    const/4 v0, 0x3

    .line 26
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 31
    .line 32
    .line 33
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->active:Ljava/lang/Boolean;

    .line 34
    .line 35
    if-eqz p0, :cond_3

    .line 36
    .line 37
    const/4 v0, 0x4

    .line 38
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 43
    .line 44
    .line 45
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->newUser:Ljava/lang/Boolean;

    .line 46
    .line 47
    if-eqz p0, :cond_4

    .line 48
    .line 49
    const/4 v0, 0x5

    .line 50
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 55
    .line 56
    .line 57
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->popular:Ljava/lang/Boolean;

    .line 58
    .line 59
    if-eqz p0, :cond_5

    .line 60
    .line 61
    const/4 v0, 0x6

    .line 62
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 67
    .line 68
    .line 69
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->zodiacs:Ljava/util/List;

    .line 70
    .line 71
    if-eqz p0, :cond_6

    .line 72
    .line 73
    invoke-static {p0}, Lcom/p1/mobile/putong/data/ProfileZodiac;->covertToOldEnumList(Ljava/util/List;)Ljava/util/List;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    sget-object v0, Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;

    .line 78
    .line 79
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    const/4 v1, 0x7

    .line 84
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 85
    .line 86
    .line 87
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->student:Ljava/lang/Boolean;

    .line 88
    .line 89
    if-eqz p0, :cond_7

    .line 90
    .line 91
    const/16 v0, 0x8

    .line 92
    .line 93
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 94
    .line 95
    .line 96
    move-result p0

    .line 97
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 98
    .line 99
    .line 100
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->filterReportUser:Ljava/lang/Boolean;

    .line 101
    .line 102
    if-eqz p0, :cond_8

    .line 103
    .line 104
    const/16 v0, 0x9

    .line 105
    .line 106
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 107
    .line 108
    .line 109
    move-result p0

    .line 110
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 111
    .line 112
    .line 113
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->bloodType:Ljava/util/List;

    .line 114
    .line 115
    if-eqz p0, :cond_9

    .line 116
    .line 117
    invoke-static {p0}, Lcom/p1/mobile/putong/data/BloodType;->covertToOldEnumList(Ljava/util/List;)Ljava/util/List;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    sget-object v0, Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;

    .line 122
    .line 123
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    const/16 v1, 0xa

    .line 128
    .line 129
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 130
    .line 131
    .line 132
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->zodiacs:Ljava/util/List;

    .line 133
    .line 134
    if-eqz p0, :cond_a

    .line 135
    .line 136
    sget-object v0, Lcom/p1/mobile/putong/data/ProfileZodiac;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 137
    .line 138
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    const/16 v1, 0xb

    .line 143
    .line 144
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 145
    .line 146
    .line 147
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->bloodType:Ljava/util/List;

    .line 148
    .line 149
    if-eqz p0, :cond_b

    .line 150
    .line 151
    sget-object v0, Lcom/p1/mobile/putong/data/BloodType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 152
    .line 153
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    const/16 v1, 0xc

    .line 158
    .line 159
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 160
    .line 161
    .line 162
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->intlFriendPurpose:Ljava/lang/String;

    .line 163
    .line 164
    if-eqz p0, :cond_c

    .line 165
    .line 166
    const/16 p1, 0xd

    .line 167
    .line 168
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 169
    .line 170
    .line 171
    :cond_c
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 172
    check-cast p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/AdvancedSettings$1;->serialize(Lcom/p1/mobile/putong/core/data/AdvancedSettings;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
