.class Lcom/p1/mobile/putong/data/UserPrivacySettings$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/UserPrivacySettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/UserPrivacySettings;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/UserPrivacySettings;)I
    .locals 2

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hideActivityTime:Ljava/lang/Boolean;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    invoke-static {v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hideContacts:Ljava/lang/Boolean;

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    const/4 v1, 0x2

    .line 21
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    add-int/2addr p0, v0

    .line 30
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hideMutualContacts:Ljava/lang/Boolean;

    .line 31
    .line 32
    if-eqz v0, :cond_2

    .line 33
    .line 34
    const/4 v1, 0x3

    .line 35
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    add-int/2addr p0, v0

    .line 44
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hidePublicMoments:Ljava/lang/Boolean;

    .line 45
    .line 46
    if-eqz v0, :cond_3

    .line 47
    .line 48
    const/4 v1, 0x4

    .line 49
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    add-int/2addr p0, v0

    .line 58
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hideSchool:Ljava/lang/Boolean;

    .line 59
    .line 60
    if-eqz v0, :cond_4

    .line 61
    .line 62
    const/4 v1, 0x5

    .line 63
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    add-int/2addr p0, v0

    .line 72
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hideVIP:Ljava/lang/Boolean;

    .line 73
    .line 74
    if-eqz v0, :cond_5

    .line 75
    .line 76
    const/4 v1, 0x6

    .line 77
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    add-int/2addr p0, v0

    .line 86
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserPrivacySettings;->personalizeSuggest:Ljava/lang/Boolean;

    .line 87
    .line 88
    if-eqz v0, :cond_6

    .line 89
    .line 90
    const/4 v1, 0x7

    .line 91
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    add-int/2addr p0, v0

    .line 100
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserPrivacySettings;->heartbeatDisable:Ljava/lang/Boolean;

    .line 101
    .line 102
    if-eqz v0, :cond_7

    .line 103
    .line 104
    const/16 v1, 0x8

    .line 105
    .line 106
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    add-int/2addr p0, v0

    .line 115
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserPrivacySettings;->adsSuggest:Ljava/lang/Boolean;

    .line 116
    .line 117
    if-eqz v0, :cond_8

    .line 118
    .line 119
    const/16 v1, 0x9

    .line 120
    .line 121
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 122
    .line 123
    .line 124
    move-result v0

    .line 125
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    add-int/2addr p0, v0

    .line 130
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserPrivacySettings;->onlineReminder:Ljava/lang/Boolean;

    .line 131
    .line 132
    if-eqz v0, :cond_9

    .line 133
    .line 134
    const/16 v1, 0xa

    .line 135
    .line 136
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 137
    .line 138
    .line 139
    move-result v0

    .line 140
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 141
    .line 142
    .line 143
    move-result v0

    .line 144
    add-int/2addr p0, v0

    .line 145
    :cond_9
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserPrivacySettings;->unrepliedReminder:Ljava/lang/Boolean;

    .line 146
    .line 147
    if-eqz v0, :cond_a

    .line 148
    .line 149
    const/16 v1, 0xb

    .line 150
    .line 151
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 152
    .line 153
    .line 154
    move-result v0

    .line 155
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 156
    .line 157
    .line 158
    move-result v0

    .line 159
    add-int/2addr p0, v0

    .line 160
    :cond_a
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserPrivacySettings;->aiPictureEnable:Ljava/lang/String;

    .line 161
    .line 162
    if-eqz v0, :cond_b

    .line 163
    .line 164
    const/16 v1, 0xc

    .line 165
    .line 166
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 167
    .line 168
    .line 169
    move-result v0

    .line 170
    add-int/2addr p0, v0

    .line 171
    :cond_b
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserPrivacySettings;->verifiedUserMsg:Ljava/lang/Boolean;

    .line 172
    .line 173
    if-eqz v0, :cond_c

    .line 174
    .line 175
    const/16 v1, 0xd

    .line 176
    .line 177
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 178
    .line 179
    .line 180
    move-result v0

    .line 181
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 182
    .line 183
    .line 184
    move-result v0

    .line 185
    add-int/2addr p0, v0

    .line 186
    :cond_c
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 187
    .line 188
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 189
    check-cast p1, Lcom/p1/mobile/putong/data/UserPrivacySettings;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/UserPrivacySettings$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/UserPrivacySettings;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/UserPrivacySettings;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/UserPrivacySettings;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hideActivityTime:Ljava/lang/Boolean;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 20
    .line 21
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hideActivityTime:Ljava/lang/Boolean;

    .line 22
    .line 23
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hideContacts:Ljava/lang/Boolean;

    .line 24
    .line 25
    if-nez p1, :cond_1

    .line 26
    .line 27
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hideContacts:Ljava/lang/Boolean;

    .line 30
    .line 31
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hideMutualContacts:Ljava/lang/Boolean;

    .line 32
    .line 33
    if-nez p1, :cond_2

    .line 34
    .line 35
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 36
    .line 37
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hideMutualContacts:Ljava/lang/Boolean;

    .line 38
    .line 39
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hidePublicMoments:Ljava/lang/Boolean;

    .line 40
    .line 41
    if-nez p1, :cond_3

    .line 42
    .line 43
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 44
    .line 45
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hidePublicMoments:Ljava/lang/Boolean;

    .line 46
    .line 47
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hideSchool:Ljava/lang/Boolean;

    .line 48
    .line 49
    if-nez p1, :cond_4

    .line 50
    .line 51
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 52
    .line 53
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hideSchool:Ljava/lang/Boolean;

    .line 54
    .line 55
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hideVIP:Ljava/lang/Boolean;

    .line 56
    .line 57
    if-nez p1, :cond_5

    .line 58
    .line 59
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 60
    .line 61
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hideVIP:Ljava/lang/Boolean;

    .line 62
    .line 63
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->personalizeSuggest:Ljava/lang/Boolean;

    .line 64
    .line 65
    if-nez p1, :cond_6

    .line 66
    .line 67
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 68
    .line 69
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->personalizeSuggest:Ljava/lang/Boolean;

    .line 70
    .line 71
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->heartbeatDisable:Ljava/lang/Boolean;

    .line 72
    .line 73
    if-nez p1, :cond_7

    .line 74
    .line 75
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 76
    .line 77
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->heartbeatDisable:Ljava/lang/Boolean;

    .line 78
    .line 79
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->adsSuggest:Ljava/lang/Boolean;

    .line 80
    .line 81
    if-nez p1, :cond_8

    .line 82
    .line 83
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 84
    .line 85
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->adsSuggest:Ljava/lang/Boolean;

    .line 86
    .line 87
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->onlineReminder:Ljava/lang/Boolean;

    .line 88
    .line 89
    if-nez p1, :cond_9

    .line 90
    .line 91
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 92
    .line 93
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->onlineReminder:Ljava/lang/Boolean;

    .line 94
    .line 95
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->unrepliedReminder:Ljava/lang/Boolean;

    .line 96
    .line 97
    if-nez p1, :cond_a

    .line 98
    .line 99
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 100
    .line 101
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->unrepliedReminder:Ljava/lang/Boolean;

    .line 102
    .line 103
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->aiPictureEnable:Ljava/lang/String;

    .line 104
    .line 105
    if-nez p1, :cond_b

    .line 106
    .line 107
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->aiPictureEnable:Ljava/lang/String;

    .line 108
    .line 109
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->verifiedUserMsg:Ljava/lang/Boolean;

    .line 110
    .line 111
    if-nez p1, :cond_18

    .line 112
    .line 113
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 114
    .line 115
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->verifiedUserMsg:Ljava/lang/Boolean;

    .line 116
    .line 117
    return-object p0

    .line 118
    :sswitch_0
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 119
    .line 120
    .line 121
    move-result v0

    .line 122
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->verifiedUserMsg:Ljava/lang/Boolean;

    .line 127
    .line 128
    goto :goto_0

    .line 129
    :sswitch_1
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->aiPictureEnable:Ljava/lang/String;

    .line 134
    .line 135
    goto/16 :goto_0

    .line 136
    .line 137
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 138
    .line 139
    .line 140
    move-result v0

    .line 141
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->unrepliedReminder:Ljava/lang/Boolean;

    .line 146
    .line 147
    goto/16 :goto_0

    .line 148
    .line 149
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 150
    .line 151
    .line 152
    move-result v0

    .line 153
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->onlineReminder:Ljava/lang/Boolean;

    .line 158
    .line 159
    goto/16 :goto_0

    .line 160
    .line 161
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 162
    .line 163
    .line 164
    move-result v0

    .line 165
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 166
    .line 167
    .line 168
    move-result-object v0

    .line 169
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->adsSuggest:Ljava/lang/Boolean;

    .line 170
    .line 171
    goto/16 :goto_0

    .line 172
    .line 173
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 174
    .line 175
    .line 176
    move-result v0

    .line 177
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 178
    .line 179
    .line 180
    move-result-object v0

    .line 181
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->heartbeatDisable:Ljava/lang/Boolean;

    .line 182
    .line 183
    goto/16 :goto_0

    .line 184
    .line 185
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 186
    .line 187
    .line 188
    move-result v0

    .line 189
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 190
    .line 191
    .line 192
    move-result-object v0

    .line 193
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->personalizeSuggest:Ljava/lang/Boolean;

    .line 194
    .line 195
    goto/16 :goto_0

    .line 196
    .line 197
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 198
    .line 199
    .line 200
    move-result v0

    .line 201
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 202
    .line 203
    .line 204
    move-result-object v0

    .line 205
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hideVIP:Ljava/lang/Boolean;

    .line 206
    .line 207
    goto/16 :goto_0

    .line 208
    .line 209
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 210
    .line 211
    .line 212
    move-result v0

    .line 213
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 214
    .line 215
    .line 216
    move-result-object v0

    .line 217
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hideSchool:Ljava/lang/Boolean;

    .line 218
    .line 219
    goto/16 :goto_0

    .line 220
    .line 221
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 222
    .line 223
    .line 224
    move-result v0

    .line 225
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 226
    .line 227
    .line 228
    move-result-object v0

    .line 229
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hidePublicMoments:Ljava/lang/Boolean;

    .line 230
    .line 231
    goto/16 :goto_0

    .line 232
    .line 233
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 234
    .line 235
    .line 236
    move-result v0

    .line 237
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 238
    .line 239
    .line 240
    move-result-object v0

    .line 241
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hideMutualContacts:Ljava/lang/Boolean;

    .line 242
    .line 243
    goto/16 :goto_0

    .line 244
    .line 245
    :sswitch_b
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 246
    .line 247
    .line 248
    move-result v0

    .line 249
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 250
    .line 251
    .line 252
    move-result-object v0

    .line 253
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hideContacts:Ljava/lang/Boolean;

    .line 254
    .line 255
    goto/16 :goto_0

    .line 256
    .line 257
    :sswitch_c
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 258
    .line 259
    .line 260
    move-result v0

    .line 261
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 262
    .line 263
    .line 264
    move-result-object v0

    .line 265
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hideActivityTime:Ljava/lang/Boolean;

    .line 266
    .line 267
    goto/16 :goto_0

    .line 268
    .line 269
    :sswitch_d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hideActivityTime:Ljava/lang/Boolean;

    .line 270
    .line 271
    if-nez p1, :cond_c

    .line 272
    .line 273
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 274
    .line 275
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hideActivityTime:Ljava/lang/Boolean;

    .line 276
    .line 277
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hideContacts:Ljava/lang/Boolean;

    .line 278
    .line 279
    if-nez p1, :cond_d

    .line 280
    .line 281
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 282
    .line 283
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hideContacts:Ljava/lang/Boolean;

    .line 284
    .line 285
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hideMutualContacts:Ljava/lang/Boolean;

    .line 286
    .line 287
    if-nez p1, :cond_e

    .line 288
    .line 289
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 290
    .line 291
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hideMutualContacts:Ljava/lang/Boolean;

    .line 292
    .line 293
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hidePublicMoments:Ljava/lang/Boolean;

    .line 294
    .line 295
    if-nez p1, :cond_f

    .line 296
    .line 297
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 298
    .line 299
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hidePublicMoments:Ljava/lang/Boolean;

    .line 300
    .line 301
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hideSchool:Ljava/lang/Boolean;

    .line 302
    .line 303
    if-nez p1, :cond_10

    .line 304
    .line 305
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 306
    .line 307
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hideSchool:Ljava/lang/Boolean;

    .line 308
    .line 309
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hideVIP:Ljava/lang/Boolean;

    .line 310
    .line 311
    if-nez p1, :cond_11

    .line 312
    .line 313
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 314
    .line 315
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hideVIP:Ljava/lang/Boolean;

    .line 316
    .line 317
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->personalizeSuggest:Ljava/lang/Boolean;

    .line 318
    .line 319
    if-nez p1, :cond_12

    .line 320
    .line 321
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 322
    .line 323
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->personalizeSuggest:Ljava/lang/Boolean;

    .line 324
    .line 325
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->heartbeatDisable:Ljava/lang/Boolean;

    .line 326
    .line 327
    if-nez p1, :cond_13

    .line 328
    .line 329
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 330
    .line 331
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->heartbeatDisable:Ljava/lang/Boolean;

    .line 332
    .line 333
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->adsSuggest:Ljava/lang/Boolean;

    .line 334
    .line 335
    if-nez p1, :cond_14

    .line 336
    .line 337
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 338
    .line 339
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->adsSuggest:Ljava/lang/Boolean;

    .line 340
    .line 341
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->onlineReminder:Ljava/lang/Boolean;

    .line 342
    .line 343
    if-nez p1, :cond_15

    .line 344
    .line 345
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 346
    .line 347
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->onlineReminder:Ljava/lang/Boolean;

    .line 348
    .line 349
    :cond_15
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->unrepliedReminder:Ljava/lang/Boolean;

    .line 350
    .line 351
    if-nez p1, :cond_16

    .line 352
    .line 353
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 354
    .line 355
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->unrepliedReminder:Ljava/lang/Boolean;

    .line 356
    .line 357
    :cond_16
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->aiPictureEnable:Ljava/lang/String;

    .line 358
    .line 359
    if-nez p1, :cond_17

    .line 360
    .line 361
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->aiPictureEnable:Ljava/lang/String;

    .line 362
    .line 363
    :cond_17
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->verifiedUserMsg:Ljava/lang/Boolean;

    .line 364
    .line 365
    if-nez p1, :cond_18

    .line 366
    .line 367
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 368
    .line 369
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->verifiedUserMsg:Ljava/lang/Boolean;

    .line 370
    .line 371
    :cond_18
    return-object p0

    .line 372
    nop

    .line 373
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_d
        0x8 -> :sswitch_c
        0x10 -> :sswitch_b
        0x18 -> :sswitch_a
        0x20 -> :sswitch_9
        0x28 -> :sswitch_8
        0x30 -> :sswitch_7
        0x38 -> :sswitch_6
        0x40 -> :sswitch_5
        0x48 -> :sswitch_4
        0x50 -> :sswitch_3
        0x58 -> :sswitch_2
        0x62 -> :sswitch_1
        0x68 -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 373
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/UserPrivacySettings$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/UserPrivacySettings;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/UserPrivacySettings;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hideActivityTime:Ljava/lang/Boolean;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hideContacts:Ljava/lang/Boolean;

    .line 14
    .line 15
    if-eqz p0, :cond_1

    .line 16
    .line 17
    const/4 v0, 0x2

    .line 18
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 23
    .line 24
    .line 25
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hideMutualContacts:Ljava/lang/Boolean;

    .line 26
    .line 27
    if-eqz p0, :cond_2

    .line 28
    .line 29
    const/4 v0, 0x3

    .line 30
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 35
    .line 36
    .line 37
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hidePublicMoments:Ljava/lang/Boolean;

    .line 38
    .line 39
    if-eqz p0, :cond_3

    .line 40
    .line 41
    const/4 v0, 0x4

    .line 42
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 47
    .line 48
    .line 49
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hideSchool:Ljava/lang/Boolean;

    .line 50
    .line 51
    if-eqz p0, :cond_4

    .line 52
    .line 53
    const/4 v0, 0x5

    .line 54
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 59
    .line 60
    .line 61
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hideVIP:Ljava/lang/Boolean;

    .line 62
    .line 63
    if-eqz p0, :cond_5

    .line 64
    .line 65
    const/4 v0, 0x6

    .line 66
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 67
    .line 68
    .line 69
    move-result p0

    .line 70
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 71
    .line 72
    .line 73
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserPrivacySettings;->personalizeSuggest:Ljava/lang/Boolean;

    .line 74
    .line 75
    if-eqz p0, :cond_6

    .line 76
    .line 77
    const/4 v0, 0x7

    .line 78
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 79
    .line 80
    .line 81
    move-result p0

    .line 82
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 83
    .line 84
    .line 85
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserPrivacySettings;->heartbeatDisable:Ljava/lang/Boolean;

    .line 86
    .line 87
    if-eqz p0, :cond_7

    .line 88
    .line 89
    const/16 v0, 0x8

    .line 90
    .line 91
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 92
    .line 93
    .line 94
    move-result p0

    .line 95
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 96
    .line 97
    .line 98
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserPrivacySettings;->adsSuggest:Ljava/lang/Boolean;

    .line 99
    .line 100
    if-eqz p0, :cond_8

    .line 101
    .line 102
    const/16 v0, 0x9

    .line 103
    .line 104
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 105
    .line 106
    .line 107
    move-result p0

    .line 108
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 109
    .line 110
    .line 111
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserPrivacySettings;->onlineReminder:Ljava/lang/Boolean;

    .line 112
    .line 113
    if-eqz p0, :cond_9

    .line 114
    .line 115
    const/16 v0, 0xa

    .line 116
    .line 117
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 118
    .line 119
    .line 120
    move-result p0

    .line 121
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 122
    .line 123
    .line 124
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserPrivacySettings;->unrepliedReminder:Ljava/lang/Boolean;

    .line 125
    .line 126
    if-eqz p0, :cond_a

    .line 127
    .line 128
    const/16 v0, 0xb

    .line 129
    .line 130
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 131
    .line 132
    .line 133
    move-result p0

    .line 134
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 135
    .line 136
    .line 137
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserPrivacySettings;->aiPictureEnable:Ljava/lang/String;

    .line 138
    .line 139
    if-eqz p0, :cond_b

    .line 140
    .line 141
    const/16 v0, 0xc

    .line 142
    .line 143
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 144
    .line 145
    .line 146
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserPrivacySettings;->verifiedUserMsg:Ljava/lang/Boolean;

    .line 147
    .line 148
    if-eqz p0, :cond_c

    .line 149
    .line 150
    const/16 p1, 0xd

    .line 151
    .line 152
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 153
    .line 154
    .line 155
    move-result p0

    .line 156
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 157
    .line 158
    .line 159
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

    .line 160
    check-cast p1, Lcom/p1/mobile/putong/data/UserPrivacySettings;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/UserPrivacySettings$1;->serialize(Lcom/p1/mobile/putong/data/UserPrivacySettings;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
