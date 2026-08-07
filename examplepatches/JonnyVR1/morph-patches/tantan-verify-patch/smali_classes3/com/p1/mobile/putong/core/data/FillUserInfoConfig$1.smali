.class Lcom/p1/mobile/putong/core/data/FillUserInfoConfig$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->male_avatar_url:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->female_avatar_url:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->male_name:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->female_name:Ljava/lang/String;

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
    const/4 v0, 0x5

    .line 43
    iget v1, p1, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->expire_days:I

    .line 44
    .line 45
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    add-int/2addr p0, v0

    .line 50
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->male_self_intro_tags_1:Ljava/util/List;

    .line 51
    .line 52
    if-eqz v0, :cond_4

    .line 53
    .line 54
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 55
    .line 56
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    const/4 v2, 0x6

    .line 61
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    add-int/2addr p0, v0

    .line 66
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->male_self_intro_tags_2:Ljava/util/List;

    .line 67
    .line 68
    if-eqz v0, :cond_5

    .line 69
    .line 70
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 71
    .line 72
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    const/4 v2, 0x7

    .line 77
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    add-int/2addr p0, v0

    .line 82
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->female_self_intro_tags_1:Ljava/util/List;

    .line 83
    .line 84
    if-eqz v0, :cond_6

    .line 85
    .line 86
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 87
    .line 88
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    const/16 v2, 0x8

    .line 93
    .line 94
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    add-int/2addr p0, v0

    .line 99
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->female_self_intro_tags_2:Ljava/util/List;

    .line 100
    .line 101
    if-eqz v0, :cond_7

    .line 102
    .line 103
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 104
    .line 105
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    const/16 v2, 0x9

    .line 110
    .line 111
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 112
    .line 113
    .line 114
    move-result v0

    .line 115
    add-int/2addr p0, v0

    .line 116
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->male_other_tags:Ljava/util/List;

    .line 117
    .line 118
    if-eqz v0, :cond_8

    .line 119
    .line 120
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 121
    .line 122
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 123
    .line 124
    .line 125
    move-result-object v1

    .line 126
    const/16 v2, 0xa

    .line 127
    .line 128
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 129
    .line 130
    .line 131
    move-result v0

    .line 132
    add-int/2addr p0, v0

    .line 133
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->female_other_tags:Ljava/util/List;

    .line 134
    .line 135
    if-eqz v0, :cond_9

    .line 136
    .line 137
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 138
    .line 139
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 140
    .line 141
    .line 142
    move-result-object v1

    .line 143
    const/16 v2, 0xb

    .line 144
    .line 145
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 146
    .line 147
    .line 148
    move-result v0

    .line 149
    add-int/2addr p0, v0

    .line 150
    :cond_9
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 151
    .line 152
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 153
    check-cast p1, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->male_avatar_url:Ljava/lang/String;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->male_avatar_url:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->female_avatar_url:Ljava/lang/String;

    .line 22
    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->female_avatar_url:Ljava/lang/String;

    .line 26
    .line 27
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->male_name:Ljava/lang/String;

    .line 28
    .line 29
    if-nez p1, :cond_2

    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->male_name:Ljava/lang/String;

    .line 32
    .line 33
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->female_name:Ljava/lang/String;

    .line 34
    .line 35
    if-nez p1, :cond_3

    .line 36
    .line 37
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->female_name:Ljava/lang/String;

    .line 38
    .line 39
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->male_self_intro_tags_1:Ljava/util/List;

    .line 40
    .line 41
    if-nez p1, :cond_4

    .line 42
    .line 43
    new-instance p1, Ljava/util/ArrayList;

    .line 44
    .line 45
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 46
    .line 47
    .line 48
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->male_self_intro_tags_1:Ljava/util/List;

    .line 49
    .line 50
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->male_self_intro_tags_2:Ljava/util/List;

    .line 51
    .line 52
    if-nez p1, :cond_5

    .line 53
    .line 54
    new-instance p1, Ljava/util/ArrayList;

    .line 55
    .line 56
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 57
    .line 58
    .line 59
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->male_self_intro_tags_2:Ljava/util/List;

    .line 60
    .line 61
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->female_self_intro_tags_1:Ljava/util/List;

    .line 62
    .line 63
    if-nez p1, :cond_6

    .line 64
    .line 65
    new-instance p1, Ljava/util/ArrayList;

    .line 66
    .line 67
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 68
    .line 69
    .line 70
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->female_self_intro_tags_1:Ljava/util/List;

    .line 71
    .line 72
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->female_self_intro_tags_2:Ljava/util/List;

    .line 73
    .line 74
    if-nez p1, :cond_7

    .line 75
    .line 76
    new-instance p1, Ljava/util/ArrayList;

    .line 77
    .line 78
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 79
    .line 80
    .line 81
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->female_self_intro_tags_2:Ljava/util/List;

    .line 82
    .line 83
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->male_other_tags:Ljava/util/List;

    .line 84
    .line 85
    if-nez p1, :cond_8

    .line 86
    .line 87
    new-instance p1, Ljava/util/ArrayList;

    .line 88
    .line 89
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 90
    .line 91
    .line 92
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->male_other_tags:Ljava/util/List;

    .line 93
    .line 94
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->female_other_tags:Ljava/util/List;

    .line 95
    .line 96
    if-nez p1, :cond_12

    .line 97
    .line 98
    new-instance p1, Ljava/util/ArrayList;

    .line 99
    .line 100
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 101
    .line 102
    .line 103
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->female_other_tags:Ljava/util/List;

    .line 104
    .line 105
    return-object p0

    .line 106
    :sswitch_0
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 107
    .line 108
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    check-cast v0, Ljava/util/List;

    .line 117
    .line 118
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->female_other_tags:Ljava/util/List;

    .line 119
    .line 120
    goto :goto_0

    .line 121
    :sswitch_1
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 122
    .line 123
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    check-cast v0, Ljava/util/List;

    .line 132
    .line 133
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->male_other_tags:Ljava/util/List;

    .line 134
    .line 135
    goto/16 :goto_0

    .line 136
    .line 137
    :sswitch_2
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 138
    .line 139
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    check-cast v0, Ljava/util/List;

    .line 148
    .line 149
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->female_self_intro_tags_2:Ljava/util/List;

    .line 150
    .line 151
    goto/16 :goto_0

    .line 152
    .line 153
    :sswitch_3
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 154
    .line 155
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    check-cast v0, Ljava/util/List;

    .line 164
    .line 165
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->female_self_intro_tags_1:Ljava/util/List;

    .line 166
    .line 167
    goto/16 :goto_0

    .line 168
    .line 169
    :sswitch_4
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 170
    .line 171
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 172
    .line 173
    .line 174
    move-result-object v0

    .line 175
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 176
    .line 177
    .line 178
    move-result-object v0

    .line 179
    check-cast v0, Ljava/util/List;

    .line 180
    .line 181
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->male_self_intro_tags_2:Ljava/util/List;

    .line 182
    .line 183
    goto/16 :goto_0

    .line 184
    .line 185
    :sswitch_5
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 186
    .line 187
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 188
    .line 189
    .line 190
    move-result-object v0

    .line 191
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 192
    .line 193
    .line 194
    move-result-object v0

    .line 195
    check-cast v0, Ljava/util/List;

    .line 196
    .line 197
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->male_self_intro_tags_1:Ljava/util/List;

    .line 198
    .line 199
    goto/16 :goto_0

    .line 200
    .line 201
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 202
    .line 203
    .line 204
    move-result v0

    .line 205
    iput v0, p0, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->expire_days:I

    .line 206
    .line 207
    goto/16 :goto_0

    .line 208
    .line 209
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 210
    .line 211
    .line 212
    move-result-object v0

    .line 213
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->female_name:Ljava/lang/String;

    .line 214
    .line 215
    goto/16 :goto_0

    .line 216
    .line 217
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 218
    .line 219
    .line 220
    move-result-object v0

    .line 221
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->male_name:Ljava/lang/String;

    .line 222
    .line 223
    goto/16 :goto_0

    .line 224
    .line 225
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 226
    .line 227
    .line 228
    move-result-object v0

    .line 229
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->female_avatar_url:Ljava/lang/String;

    .line 230
    .line 231
    goto/16 :goto_0

    .line 232
    .line 233
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 234
    .line 235
    .line 236
    move-result-object v0

    .line 237
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->male_avatar_url:Ljava/lang/String;

    .line 238
    .line 239
    goto/16 :goto_0

    .line 240
    .line 241
    :sswitch_b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->male_avatar_url:Ljava/lang/String;

    .line 242
    .line 243
    if-nez p1, :cond_9

    .line 244
    .line 245
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->male_avatar_url:Ljava/lang/String;

    .line 246
    .line 247
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->female_avatar_url:Ljava/lang/String;

    .line 248
    .line 249
    if-nez p1, :cond_a

    .line 250
    .line 251
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->female_avatar_url:Ljava/lang/String;

    .line 252
    .line 253
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->male_name:Ljava/lang/String;

    .line 254
    .line 255
    if-nez p1, :cond_b

    .line 256
    .line 257
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->male_name:Ljava/lang/String;

    .line 258
    .line 259
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->female_name:Ljava/lang/String;

    .line 260
    .line 261
    if-nez p1, :cond_c

    .line 262
    .line 263
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->female_name:Ljava/lang/String;

    .line 264
    .line 265
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->male_self_intro_tags_1:Ljava/util/List;

    .line 266
    .line 267
    if-nez p1, :cond_d

    .line 268
    .line 269
    new-instance p1, Ljava/util/ArrayList;

    .line 270
    .line 271
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 272
    .line 273
    .line 274
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->male_self_intro_tags_1:Ljava/util/List;

    .line 275
    .line 276
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->male_self_intro_tags_2:Ljava/util/List;

    .line 277
    .line 278
    if-nez p1, :cond_e

    .line 279
    .line 280
    new-instance p1, Ljava/util/ArrayList;

    .line 281
    .line 282
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 283
    .line 284
    .line 285
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->male_self_intro_tags_2:Ljava/util/List;

    .line 286
    .line 287
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->female_self_intro_tags_1:Ljava/util/List;

    .line 288
    .line 289
    if-nez p1, :cond_f

    .line 290
    .line 291
    new-instance p1, Ljava/util/ArrayList;

    .line 292
    .line 293
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 294
    .line 295
    .line 296
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->female_self_intro_tags_1:Ljava/util/List;

    .line 297
    .line 298
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->female_self_intro_tags_2:Ljava/util/List;

    .line 299
    .line 300
    if-nez p1, :cond_10

    .line 301
    .line 302
    new-instance p1, Ljava/util/ArrayList;

    .line 303
    .line 304
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 305
    .line 306
    .line 307
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->female_self_intro_tags_2:Ljava/util/List;

    .line 308
    .line 309
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->male_other_tags:Ljava/util/List;

    .line 310
    .line 311
    if-nez p1, :cond_11

    .line 312
    .line 313
    new-instance p1, Ljava/util/ArrayList;

    .line 314
    .line 315
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 316
    .line 317
    .line 318
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->male_other_tags:Ljava/util/List;

    .line 319
    .line 320
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->female_other_tags:Ljava/util/List;

    .line 321
    .line 322
    if-nez p1, :cond_12

    .line 323
    .line 324
    new-instance p1, Ljava/util/ArrayList;

    .line 325
    .line 326
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 327
    .line 328
    .line 329
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->female_other_tags:Ljava/util/List;

    .line 330
    .line 331
    :cond_12
    return-object p0

    .line 332
    nop

    .line 333
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_b
        0xa -> :sswitch_a
        0x12 -> :sswitch_9
        0x1a -> :sswitch_8
        0x22 -> :sswitch_7
        0x28 -> :sswitch_6
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

    .line 333
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->male_avatar_url:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->female_avatar_url:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->male_name:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->female_name:Ljava/lang/String;

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
    const/4 p0, 0x5

    .line 34
    iget v0, p1, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->expire_days:I

    .line 35
    .line 36
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 37
    .line 38
    .line 39
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->male_self_intro_tags_1:Ljava/util/List;

    .line 40
    .line 41
    if-eqz p0, :cond_4

    .line 42
    .line 43
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 44
    .line 45
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    const/4 v1, 0x6

    .line 50
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 51
    .line 52
    .line 53
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->male_self_intro_tags_2:Ljava/util/List;

    .line 54
    .line 55
    if-eqz p0, :cond_5

    .line 56
    .line 57
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 58
    .line 59
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    const/4 v1, 0x7

    .line 64
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 65
    .line 66
    .line 67
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->female_self_intro_tags_1:Ljava/util/List;

    .line 68
    .line 69
    if-eqz p0, :cond_6

    .line 70
    .line 71
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 72
    .line 73
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    const/16 v1, 0x8

    .line 78
    .line 79
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 80
    .line 81
    .line 82
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->female_self_intro_tags_2:Ljava/util/List;

    .line 83
    .line 84
    if-eqz p0, :cond_7

    .line 85
    .line 86
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 87
    .line 88
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    const/16 v1, 0x9

    .line 93
    .line 94
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 95
    .line 96
    .line 97
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->male_other_tags:Ljava/util/List;

    .line 98
    .line 99
    if-eqz p0, :cond_8

    .line 100
    .line 101
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 102
    .line 103
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    const/16 v1, 0xa

    .line 108
    .line 109
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 110
    .line 111
    .line 112
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;->female_other_tags:Ljava/util/List;

    .line 113
    .line 114
    if-eqz p0, :cond_9

    .line 115
    .line 116
    sget-object p1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 117
    .line 118
    invoke-virtual {p1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    const/16 v0, 0xb

    .line 123
    .line 124
    invoke-virtual {p2, v0, p0, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 125
    .line 126
    .line 127
    :cond_9
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 128
    check-cast p1, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/FillUserInfoConfig$1;->serialize(Lcom/p1/mobile/putong/core/data/FillUserInfoConfig;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
