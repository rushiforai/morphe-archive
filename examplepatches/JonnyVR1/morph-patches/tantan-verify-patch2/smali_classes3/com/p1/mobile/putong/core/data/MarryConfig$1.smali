.class Lcom/p1/mobile/putong/core/data/MarryConfig$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/MarryConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/MarryConfig;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/MarryConfig;)I
    .locals 2

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/MarryConfig;->enable:Z

    .line 3
    .line 4
    invoke-static {p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MarryConfig;->card_border_color:Ljava/lang/String;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const/4 v1, 0x2

    .line 13
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    add-int/2addr p0, v0

    .line 18
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MarryConfig;->card_head_bg:Ljava/lang/String;

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    const/4 v1, 0x3

    .line 23
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    add-int/2addr p0, v0

    .line 28
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MarryConfig;->card_label_bg_color:Ljava/lang/String;

    .line 29
    .line 30
    if-eqz v0, :cond_2

    .line 31
    .line 32
    const/4 v1, 0x4

    .line 33
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    add-int/2addr p0, v0

    .line 38
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MarryConfig;->profile_head_bg_android:Ljava/lang/String;

    .line 39
    .line 40
    if-eqz v0, :cond_3

    .line 41
    .line 42
    const/4 v1, 0x5

    .line 43
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    add-int/2addr p0, v0

    .line 48
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MarryConfig;->profile_head_state_color:Ljava/lang/String;

    .line 49
    .line 50
    if-eqz v0, :cond_4

    .line 51
    .line 52
    const/4 v1, 0x6

    .line 53
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    add-int/2addr p0, v0

    .line 58
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MarryConfig;->profile_head_bg_ios:Ljava/lang/String;

    .line 59
    .line 60
    if-eqz v0, :cond_5

    .line 61
    .line 62
    const/4 v1, 0x7

    .line 63
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    add-int/2addr p0, v0

    .line 68
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MarryConfig;->pre_profile_head_bg:Ljava/lang/String;

    .line 69
    .line 70
    if-eqz v0, :cond_6

    .line 71
    .line 72
    const/16 v1, 0x8

    .line 73
    .line 74
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    add-int/2addr p0, v0

    .line 79
    :cond_6
    const/16 v0, 0x9

    .line 80
    .line 81
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/MarryConfig;->enable_pay_wall:Z

    .line 82
    .line 83
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    add-int/2addr p0, v0

    .line 88
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 89
    .line 90
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 91
    check-cast p1, Lcom/p1/mobile/putong/core/data/MarryConfig;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/MarryConfig$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/MarryConfig;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/MarryConfig;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/MarryConfig;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/MarryConfig;-><init>()V

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
    if-eqz v0, :cond_f

    .line 13
    .line 14
    const/16 v2, 0x8

    .line 15
    .line 16
    if-eq v0, v2, :cond_e

    .line 17
    .line 18
    const/16 v2, 0x12

    .line 19
    .line 20
    if-eq v0, v2, :cond_d

    .line 21
    .line 22
    const/16 v2, 0x1a

    .line 23
    .line 24
    if-eq v0, v2, :cond_c

    .line 25
    .line 26
    const/16 v2, 0x22

    .line 27
    .line 28
    if-eq v0, v2, :cond_b

    .line 29
    .line 30
    const/16 v2, 0x2a

    .line 31
    .line 32
    if-eq v0, v2, :cond_a

    .line 33
    .line 34
    const/16 v2, 0x32

    .line 35
    .line 36
    if-eq v0, v2, :cond_9

    .line 37
    .line 38
    const/16 v2, 0x3a

    .line 39
    .line 40
    if-eq v0, v2, :cond_8

    .line 41
    .line 42
    const/16 v2, 0x42

    .line 43
    .line 44
    if-eq v0, v2, :cond_7

    .line 45
    .line 46
    const/16 v2, 0x48

    .line 47
    .line 48
    if-eq v0, v2, :cond_6

    .line 49
    .line 50
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MarryConfig;->card_border_color:Ljava/lang/String;

    .line 51
    .line 52
    if-nez p1, :cond_0

    .line 53
    .line 54
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MarryConfig;->card_border_color:Ljava/lang/String;

    .line 55
    .line 56
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MarryConfig;->card_head_bg:Ljava/lang/String;

    .line 57
    .line 58
    if-nez p1, :cond_1

    .line 59
    .line 60
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MarryConfig;->card_head_bg:Ljava/lang/String;

    .line 61
    .line 62
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MarryConfig;->card_label_bg_color:Ljava/lang/String;

    .line 63
    .line 64
    if-nez p1, :cond_2

    .line 65
    .line 66
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MarryConfig;->card_label_bg_color:Ljava/lang/String;

    .line 67
    .line 68
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MarryConfig;->profile_head_bg_android:Ljava/lang/String;

    .line 69
    .line 70
    if-nez p1, :cond_3

    .line 71
    .line 72
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MarryConfig;->profile_head_bg_android:Ljava/lang/String;

    .line 73
    .line 74
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MarryConfig;->profile_head_state_color:Ljava/lang/String;

    .line 75
    .line 76
    if-nez p1, :cond_4

    .line 77
    .line 78
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MarryConfig;->profile_head_state_color:Ljava/lang/String;

    .line 79
    .line 80
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MarryConfig;->profile_head_bg_ios:Ljava/lang/String;

    .line 81
    .line 82
    if-nez p1, :cond_5

    .line 83
    .line 84
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MarryConfig;->profile_head_bg_ios:Ljava/lang/String;

    .line 85
    .line 86
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MarryConfig;->pre_profile_head_bg:Ljava/lang/String;

    .line 87
    .line 88
    if-nez p1, :cond_16

    .line 89
    .line 90
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MarryConfig;->pre_profile_head_bg:Ljava/lang/String;

    .line 91
    .line 92
    return-object p0

    .line 93
    :cond_6
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/MarryConfig;->enable_pay_wall:Z

    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MarryConfig;->pre_profile_head_bg:Ljava/lang/String;

    .line 105
    .line 106
    goto :goto_0

    .line 107
    :cond_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MarryConfig;->profile_head_bg_ios:Ljava/lang/String;

    .line 112
    .line 113
    goto :goto_0

    .line 114
    :cond_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MarryConfig;->profile_head_state_color:Ljava/lang/String;

    .line 119
    .line 120
    goto :goto_0

    .line 121
    :cond_a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MarryConfig;->profile_head_bg_android:Ljava/lang/String;

    .line 126
    .line 127
    goto :goto_0

    .line 128
    :cond_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MarryConfig;->card_label_bg_color:Ljava/lang/String;

    .line 133
    .line 134
    goto/16 :goto_0

    .line 135
    .line 136
    :cond_c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MarryConfig;->card_head_bg:Ljava/lang/String;

    .line 141
    .line 142
    goto/16 :goto_0

    .line 143
    .line 144
    :cond_d
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MarryConfig;->card_border_color:Ljava/lang/String;

    .line 149
    .line 150
    goto/16 :goto_0

    .line 151
    .line 152
    :cond_e
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 153
    .line 154
    .line 155
    move-result v0

    .line 156
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/MarryConfig;->enable:Z

    .line 157
    .line 158
    goto/16 :goto_0

    .line 159
    .line 160
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MarryConfig;->card_border_color:Ljava/lang/String;

    .line 161
    .line 162
    if-nez p1, :cond_10

    .line 163
    .line 164
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MarryConfig;->card_border_color:Ljava/lang/String;

    .line 165
    .line 166
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MarryConfig;->card_head_bg:Ljava/lang/String;

    .line 167
    .line 168
    if-nez p1, :cond_11

    .line 169
    .line 170
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MarryConfig;->card_head_bg:Ljava/lang/String;

    .line 171
    .line 172
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MarryConfig;->card_label_bg_color:Ljava/lang/String;

    .line 173
    .line 174
    if-nez p1, :cond_12

    .line 175
    .line 176
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MarryConfig;->card_label_bg_color:Ljava/lang/String;

    .line 177
    .line 178
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MarryConfig;->profile_head_bg_android:Ljava/lang/String;

    .line 179
    .line 180
    if-nez p1, :cond_13

    .line 181
    .line 182
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MarryConfig;->profile_head_bg_android:Ljava/lang/String;

    .line 183
    .line 184
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MarryConfig;->profile_head_state_color:Ljava/lang/String;

    .line 185
    .line 186
    if-nez p1, :cond_14

    .line 187
    .line 188
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MarryConfig;->profile_head_state_color:Ljava/lang/String;

    .line 189
    .line 190
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MarryConfig;->profile_head_bg_ios:Ljava/lang/String;

    .line 191
    .line 192
    if-nez p1, :cond_15

    .line 193
    .line 194
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MarryConfig;->profile_head_bg_ios:Ljava/lang/String;

    .line 195
    .line 196
    :cond_15
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MarryConfig;->pre_profile_head_bg:Ljava/lang/String;

    .line 197
    .line 198
    if-nez p1, :cond_16

    .line 199
    .line 200
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MarryConfig;->pre_profile_head_bg:Ljava/lang/String;

    .line 201
    .line 202
    :cond_16
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 203
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/MarryConfig$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/MarryConfig;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/MarryConfig;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/MarryConfig;->enable:Z

    .line 3
    .line 4
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MarryConfig;->card_border_color:Ljava/lang/String;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x2

    .line 12
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MarryConfig;->card_head_bg:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MarryConfig;->card_label_bg_color:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MarryConfig;->profile_head_bg_android:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MarryConfig;->profile_head_state_color:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MarryConfig;->profile_head_bg_ios:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MarryConfig;->pre_profile_head_bg:Ljava/lang/String;

    .line 56
    .line 57
    if-eqz p0, :cond_6

    .line 58
    .line 59
    const/16 v0, 0x8

    .line 60
    .line 61
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 62
    .line 63
    .line 64
    :cond_6
    const/16 p0, 0x9

    .line 65
    .line 66
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/MarryConfig;->enable_pay_wall:Z

    .line 67
    .line 68
    invoke-virtual {p2, p0, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 72
    check-cast p1, Lcom/p1/mobile/putong/core/data/MarryConfig;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/MarryConfig$1;->serialize(Lcom/p1/mobile/putong/core/data/MarryConfig;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
